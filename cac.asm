
./main.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <main>:
void initialState(unsigned long int valor, bool *vet1, bool *vet2, int size);
string boolArraytoString(bool *vet, int size);
unsigned long long int boolArraytoInt(bool *vet, int size);

void runGNR (int inicio, int fim);
int main() {
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 30          	sub    $0x30,%rsp
    unsigned long int estadosIniciais;
    estadosIniciais = (unsigned long int) pow(2, 25) - 1;
   8:	be 19 00 00 00       	mov    $0x19,%esi
   d:	bf 02 00 00 00       	mov    $0x2,%edi
  12:	e8 00 00 00 00       	callq  17 <main+0x17>
  17:	66 0f 2e 05 00 00 00 	ucomisd 0x0(%rip),%xmm0        # 1f <main+0x1f>
  1e:	00 
  1f:	73 07                	jae    28 <main+0x28>
  21:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
  26:	eb 1e                	jmp    46 <main+0x46>
  28:	f2 0f 10 0d 00 00 00 	movsd  0x0(%rip),%xmm1        # 30 <main+0x30>
  2f:	00 
  30:	f2 0f 5c c1          	subsd  %xmm1,%xmm0
  34:	f2 48 0f 2c c0       	cvttsd2si %xmm0,%rax
  39:	48 ba 00 00 00 00 00 	movabs $0x8000000000000000,%rdx
  40:	00 00 80 
  43:	48 31 d0             	xor    %rdx,%rax
  46:	48 83 e8 01          	sub    $0x1,%rax
  4a:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
    unsigned int period = 0;
  4e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    unsigned int transient = 0;
  55:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%rbp)
    omp_set_num_threads(NUMTHREADS);
  5c:	bf 01 00 00 00       	mov    $0x1,%edi
  61:	e8 00 00 00 00       	callq  66 <main+0x66>
    unsigned long int inicio=0;
  66:	48 c7 45 e8 00 00 00 	movq   $0x0,-0x18(%rbp)
  6d:	00 
    unsigned long int dadosporThread = (estadosIniciais/NUMTHREADS)-1;
  6e:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  72:	48 83 e8 01          	sub    $0x1,%rax
  76:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
    unsigned long int fim = dadosporThread;
  7a:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  7e:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
    runGNR(0,estadosIniciais);
  82:	48 8b 45 f8          	mov    -0x8(%rbp),%rax
  86:	89 c6                	mov    %eax,%esi
  88:	bf 00 00 00 00       	mov    $0x0,%edi
  8d:	e8 00 00 00 00       	callq  92 <main+0x92>
    return 0;
  92:	b8 00 00 00 00       	mov    $0x0,%eax
}
  97:	c9                   	leaveq 
  98:	c3                   	retq   

0000000000000099 <_Z12initialStatemPbS_i>:

void initialState(unsigned long int valor, bool *vet1, bool *vet2, int size) {
  99:	55                   	push   %rbp
  9a:	48 89 e5             	mov    %rsp,%rbp
  9d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  a1:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  a5:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  a9:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
    // std::cout <<" initialState: "<< std::endl;
    for (int i = 0; i < size; i++) {
  ac:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
  b3:	8b 45 fc             	mov    -0x4(%rbp),%eax
  b6:	3b 45 d4             	cmp    -0x2c(%rbp),%eax
  b9:	7d 45                	jge    100 <_Z12initialStatemPbS_i+0x67>
        vet1[i] = (valor & 1) != 0;
  bb:	8b 45 fc             	mov    -0x4(%rbp),%eax
  be:	48 63 d0             	movslq %eax,%rdx
  c1:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  c5:	48 01 d0             	add    %rdx,%rax
  c8:	48 8b 55 e8          	mov    -0x18(%rbp),%rdx
  cc:	83 e2 01             	and    $0x1,%edx
  cf:	48 85 d2             	test   %rdx,%rdx
  d2:	0f 95 c2             	setne  %dl
  d5:	88 10                	mov    %dl,(%rax)
        vet2[i] = vet1[i];
  d7:	8b 45 fc             	mov    -0x4(%rbp),%eax
  da:	48 63 d0             	movslq %eax,%rdx
  dd:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
  e1:	48 01 c2             	add    %rax,%rdx
  e4:	8b 45 fc             	mov    -0x4(%rbp),%eax
  e7:	48 63 c8             	movslq %eax,%rcx
  ea:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
  ee:	48 01 c8             	add    %rcx,%rax
  f1:	0f b6 00             	movzbl (%rax),%eax
  f4:	88 02                	mov    %al,(%rdx)
        valor >>= 1;
  f6:	48 d1 6d e8          	shrq   -0x18(%rbp)
    for (int i = 0; i < size; i++) {
  fa:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
  fe:	eb b3                	jmp    b3 <_Z12initialStatemPbS_i+0x1a>
        //     std::cout <<vet1[i] << " ";
    }
    //std::cout <<" = "<< boolArraytoInt(vet1,size) << std::endl;
}
 100:	90                   	nop
 101:	5d                   	pop    %rbp
 102:	c3                   	retq   

0000000000000103 <_Z6equalsPbS_i>:

bool equals(bool *vet1, bool *vet2, int size) {
 103:	55                   	push   %rbp
 104:	48 89 e5             	mov    %rsp,%rbp
 107:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 10b:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
 10f:	89 55 dc             	mov    %edx,-0x24(%rbp)
    for (int i = 0; i < size; i++) {
 112:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 119:	8b 45 fc             	mov    -0x4(%rbp),%eax
 11c:	3b 45 dc             	cmp    -0x24(%rbp),%eax
 11f:	7d 31                	jge    152 <_Z6equalsPbS_i+0x4f>
        if (vet1[i] != vet2[i]) {
 121:	8b 45 fc             	mov    -0x4(%rbp),%eax
 124:	48 63 d0             	movslq %eax,%rdx
 127:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 12b:	48 01 d0             	add    %rdx,%rax
 12e:	0f b6 10             	movzbl (%rax),%edx
 131:	8b 45 fc             	mov    -0x4(%rbp),%eax
 134:	48 63 c8             	movslq %eax,%rcx
 137:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
 13b:	48 01 c8             	add    %rcx,%rax
 13e:	0f b6 00             	movzbl (%rax),%eax
 141:	38 c2                	cmp    %al,%dl
 143:	74 07                	je     14c <_Z6equalsPbS_i+0x49>
            return false;
 145:	b8 00 00 00 00       	mov    $0x0,%eax
 14a:	eb 0b                	jmp    157 <_Z6equalsPbS_i+0x54>
    for (int i = 0; i < size; i++) {
 14c:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 150:	eb c7                	jmp    119 <_Z6equalsPbS_i+0x16>
        }
    }
    return true;
 152:	b8 01 00 00 00       	mov    $0x1,%eax
}
 157:	5d                   	pop    %rbp
 158:	c3                   	retq   

0000000000000159 <_Z17boolArraytoStringB5cxx11Pbi>:

string boolArraytoString(bool *vet, int size) {
 159:	55                   	push   %rbp
 15a:	48 89 e5             	mov    %rsp,%rbp
 15d:	53                   	push   %rbx
 15e:	48 83 ec 78          	sub    $0x78,%rsp
 162:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
 166:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
 16a:	89 55 8c             	mov    %edx,-0x74(%rbp)
    string out;
 16d:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 171:	48 89 c7             	mov    %rax,%rdi
 174:	e8 00 00 00 00       	callq  179 <_Z17boolArraytoStringB5cxx11Pbi+0x20>
    for (int i = size - 1; i >= 0; i--) {
 179:	8b 45 8c             	mov    -0x74(%rbp),%eax
 17c:	83 e8 01             	sub    $0x1,%eax
 17f:	89 45 ec             	mov    %eax,-0x14(%rbp)
 182:	83 7d ec 00          	cmpl   $0x0,-0x14(%rbp)
 186:	0f 88 ab 00 00 00    	js     237 <_Z17boolArraytoStringB5cxx11Pbi+0xde>
        if (vet[i]) {
 18c:	8b 45 ec             	mov    -0x14(%rbp),%eax
 18f:	48 63 d0             	movslq %eax,%rdx
 192:	48 8b 45 90          	mov    -0x70(%rbp),%rax
 196:	48 01 d0             	add    %rdx,%rax
 199:	0f b6 00             	movzbl (%rax),%eax
 19c:	84 c0                	test   %al,%al
 19e:	74 3b                	je     1db <_Z17boolArraytoStringB5cxx11Pbi+0x82>
            out = out + "1";
 1a0:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
 1a4:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
 1a8:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 1af <_Z17boolArraytoStringB5cxx11Pbi+0x56>
 1af:	48 89 ce             	mov    %rcx,%rsi
 1b2:	48 89 c7             	mov    %rax,%rdi
 1b5:	e8 00 00 00 00       	callq  1ba <_Z17boolArraytoStringB5cxx11Pbi+0x61>
 1ba:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
 1be:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 1c2:	48 89 d6             	mov    %rdx,%rsi
 1c5:	48 89 c7             	mov    %rax,%rdi
 1c8:	e8 00 00 00 00       	callq  1cd <_Z17boolArraytoStringB5cxx11Pbi+0x74>
 1cd:	48 8d 45 a0          	lea    -0x60(%rbp),%rax
 1d1:	48 89 c7             	mov    %rax,%rdi
 1d4:	e8 00 00 00 00       	callq  1d9 <_Z17boolArraytoStringB5cxx11Pbi+0x80>
 1d9:	eb 39                	jmp    214 <_Z17boolArraytoStringB5cxx11Pbi+0xbb>
        } else {
            out = out + "0";
 1db:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 1df:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
 1e3:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 1ea <_Z17boolArraytoStringB5cxx11Pbi+0x91>
 1ea:	48 89 ce             	mov    %rcx,%rsi
 1ed:	48 89 c7             	mov    %rax,%rdi
 1f0:	e8 00 00 00 00       	callq  1f5 <_Z17boolArraytoStringB5cxx11Pbi+0x9c>
 1f5:	48 8d 55 c0          	lea    -0x40(%rbp),%rdx
 1f9:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 1fd:	48 89 d6             	mov    %rdx,%rsi
 200:	48 89 c7             	mov    %rax,%rdi
 203:	e8 00 00 00 00       	callq  208 <_Z17boolArraytoStringB5cxx11Pbi+0xaf>
 208:	48 8d 45 c0          	lea    -0x40(%rbp),%rax
 20c:	48 89 c7             	mov    %rax,%rdi
 20f:	e8 00 00 00 00       	callq  214 <_Z17boolArraytoStringB5cxx11Pbi+0xbb>
    for (int i = size - 1; i >= 0; i--) {
 214:	83 6d ec 01          	subl   $0x1,-0x14(%rbp)
 218:	e9 65 ff ff ff       	jmpq   182 <_Z17boolArraytoStringB5cxx11Pbi+0x29>
 21d:	48 89 c3             	mov    %rax,%rbx
 220:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 224:	48 89 c7             	mov    %rax,%rdi
 227:	e8 00 00 00 00       	callq  22c <_Z17boolArraytoStringB5cxx11Pbi+0xd3>
 22c:	48 89 d8             	mov    %rbx,%rax
 22f:	48 89 c7             	mov    %rax,%rdi
 232:	e8 00 00 00 00       	callq  237 <_Z17boolArraytoStringB5cxx11Pbi+0xde>
        }
    }
    return out;
 237:	90                   	nop
}
 238:	48 8b 45 98          	mov    -0x68(%rbp),%rax
 23c:	48 83 c4 78          	add    $0x78,%rsp
 240:	5b                   	pop    %rbx
 241:	5d                   	pop    %rbp
 242:	c3                   	retq   

0000000000000243 <_Z14boolArraytoIntPbi>:

unsigned long long int boolArraytoInt(bool *vet, int size) {
 243:	55                   	push   %rbp
 244:	48 89 e5             	mov    %rsp,%rbp
 247:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
 24b:	89 75 e4             	mov    %esi,-0x1c(%rbp)
    int out = 0;
 24e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    // std::cout <<"boolArraytoInt:"<< std::endl;
    for (int i = size - 1; i >= 0; i--) {
 255:	8b 45 e4             	mov    -0x1c(%rbp),%eax
 258:	83 e8 01             	sub    $0x1,%eax
 25b:	89 45 f8             	mov    %eax,-0x8(%rbp)
 25e:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 262:	78 27                	js     28b <_Z14boolArraytoIntPbi+0x48>
        //   std::cout << vet[i] << " ";
        if (vet[i]) {
 264:	8b 45 f8             	mov    -0x8(%rbp),%eax
 267:	48 63 d0             	movslq %eax,%rdx
 26a:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 26e:	48 01 d0             	add    %rdx,%rax
 271:	0f b6 00             	movzbl (%rax),%eax
 274:	84 c0                	test   %al,%al
 276:	74 04                	je     27c <_Z14boolArraytoIntPbi+0x39>
            out |= 1;
 278:	83 4d fc 01          	orl    $0x1,-0x4(%rbp)
        }
        if (i > 0) out <<= 1;
 27c:	83 7d f8 00          	cmpl   $0x0,-0x8(%rbp)
 280:	7e 03                	jle    285 <_Z14boolArraytoIntPbi+0x42>
 282:	d1 65 fc             	shll   -0x4(%rbp)
    for (int i = size - 1; i >= 0; i--) {
 285:	83 6d f8 01          	subl   $0x1,-0x8(%rbp)
 289:	eb d3                	jmp    25e <_Z14boolArraytoIntPbi+0x1b>
    }
    //  std::cout << " = " << out << std::endl;
    return out;
 28b:	8b 45 fc             	mov    -0x4(%rbp),%eax
 28e:	48 98                	cltq   
}
 290:	5d                   	pop    %rbp
 291:	c3                   	retq   

0000000000000292 <_Z4passPb>:
*/

// Equações Biológicas

// * CAC network Reduzida (21 Vértices)
void pass (bool *aux){
 292:	55                   	push   %rbp
 293:	48 89 e5             	mov    %rsp,%rbp
 296:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
    bool vet[20];
    for (int i=0; i<20; i++){
 29a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
 2a1:	83 7d fc 13          	cmpl   $0x13,-0x4(%rbp)
 2a5:	7f 1f                	jg     2c6 <_Z4passPb+0x34>
        vet[i]= aux[i];
 2a7:	8b 45 fc             	mov    -0x4(%rbp),%eax
 2aa:	48 63 d0             	movslq %eax,%rdx
 2ad:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2b1:	48 01 d0             	add    %rdx,%rax
 2b4:	0f b6 10             	movzbl (%rax),%edx
 2b7:	8b 45 fc             	mov    -0x4(%rbp),%eax
 2ba:	48 98                	cltq   
 2bc:	88 54 05 e0          	mov    %dl,-0x20(%rbp,%rax,1)
    for (int i=0; i<20; i++){
 2c0:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
 2c4:	eb db                	jmp    2a1 <_Z4passPb+0xf>
    }
    aux[0] = ! vet[16] ;
 2c6:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
 2ca:	83 f0 01             	xor    $0x1,%eax
 2cd:	89 c2                	mov    %eax,%edx
 2cf:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2d3:	88 10                	mov    %dl,(%rax)
    aux[1] = ! ( vet[15] && vet[4] ) ;
 2d5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 2d9:	48 83 c0 01          	add    $0x1,%rax
 2dd:	0f b6 55 ef          	movzbl -0x11(%rbp),%edx
 2e1:	83 f2 01             	xor    $0x1,%edx
 2e4:	84 d2                	test   %dl,%dl
 2e6:	75 0b                	jne    2f3 <_Z4passPb+0x61>
 2e8:	0f b6 55 e4          	movzbl -0x1c(%rbp),%edx
 2ec:	83 f2 01             	xor    $0x1,%edx
 2ef:	84 d2                	test   %dl,%dl
 2f1:	74 07                	je     2fa <_Z4passPb+0x68>
 2f3:	ba 01 00 00 00       	mov    $0x1,%edx
 2f8:	eb 05                	jmp    2ff <_Z4passPb+0x6d>
 2fa:	ba 00 00 00 00       	mov    $0x0,%edx
 2ff:	88 10                	mov    %dl,(%rax)
    aux[2] = vet[5] && ! vet[7] ;
 301:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 305:	48 8d 50 02          	lea    0x2(%rax),%rdx
 309:	0f b6 45 e5          	movzbl -0x1b(%rbp),%eax
 30d:	84 c0                	test   %al,%al
 30f:	74 12                	je     323 <_Z4passPb+0x91>
 311:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
 315:	83 f0 01             	xor    $0x1,%eax
 318:	84 c0                	test   %al,%al
 31a:	74 07                	je     323 <_Z4passPb+0x91>
 31c:	b8 01 00 00 00       	mov    $0x1,%eax
 321:	eb 05                	jmp    328 <_Z4passPb+0x96>
 323:	b8 00 00 00 00       	mov    $0x0,%eax
 328:	88 02                	mov    %al,(%rdx)
    aux[3] = ( vet[1] || vet[18] || vet[10] ) && ! vet[4] ;
 32a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 32e:	48 8d 50 03          	lea    0x3(%rax),%rdx
 332:	0f b6 45 e1          	movzbl -0x1f(%rbp),%eax
 336:	84 c0                	test   %al,%al
 338:	75 10                	jne    34a <_Z4passPb+0xb8>
 33a:	0f b6 45 f2          	movzbl -0xe(%rbp),%eax
 33e:	84 c0                	test   %al,%al
 340:	75 08                	jne    34a <_Z4passPb+0xb8>
 342:	0f b6 45 ea          	movzbl -0x16(%rbp),%eax
 346:	84 c0                	test   %al,%al
 348:	74 12                	je     35c <_Z4passPb+0xca>
 34a:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
 34e:	83 f0 01             	xor    $0x1,%eax
 351:	84 c0                	test   %al,%al
 353:	74 07                	je     35c <_Z4passPb+0xca>
 355:	b8 01 00 00 00       	mov    $0x1,%eax
 35a:	eb 05                	jmp    361 <_Z4passPb+0xcf>
 35c:	b8 00 00 00 00       	mov    $0x0,%eax
 361:	88 02                	mov    %al,(%rdx)
    aux[4] = ! ( vet[19] || vet[0] ) ;
 363:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 367:	48 83 c0 04          	add    $0x4,%rax
 36b:	0f b6 55 f3          	movzbl -0xd(%rbp),%edx
 36f:	83 f2 01             	xor    $0x1,%edx
 372:	84 d2                	test   %dl,%dl
 374:	74 12                	je     388 <_Z4passPb+0xf6>
 376:	0f b6 55 e0          	movzbl -0x20(%rbp),%edx
 37a:	83 f2 01             	xor    $0x1,%edx
 37d:	84 d2                	test   %dl,%dl
 37f:	74 07                	je     388 <_Z4passPb+0xf6>
 381:	ba 01 00 00 00       	mov    $0x1,%edx
 386:	eb 05                	jmp    38d <_Z4passPb+0xfb>
 388:	ba 00 00 00 00       	mov    $0x0,%edx
 38d:	88 10                	mov    %dl,(%rax)
    aux[5] = vet[2] ;
 38f:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 393:	48 8d 50 05          	lea    0x5(%rax),%rdx
 397:	0f b6 45 e2          	movzbl -0x1e(%rbp),%eax
 39b:	88 02                	mov    %al,(%rdx)
    aux[6] = vet[0] || vet[19] ;
 39d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3a1:	48 8d 50 06          	lea    0x6(%rax),%rdx
 3a5:	0f b6 45 e0          	movzbl -0x20(%rbp),%eax
 3a9:	84 c0                	test   %al,%al
 3ab:	75 08                	jne    3b5 <_Z4passPb+0x123>
 3ad:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
 3b1:	84 c0                	test   %al,%al
 3b3:	74 07                	je     3bc <_Z4passPb+0x12a>
 3b5:	b8 01 00 00 00       	mov    $0x1,%eax
 3ba:	eb 05                	jmp    3c1 <_Z4passPb+0x12f>
 3bc:	b8 00 00 00 00       	mov    $0x0,%eax
 3c1:	88 02                	mov    %al,(%rdx)
    aux[7] = ! vet[5] ;
 3c3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3c7:	48 83 c0 07          	add    $0x7,%rax
 3cb:	0f b6 55 e5          	movzbl -0x1b(%rbp),%edx
 3cf:	83 f2 01             	xor    $0x1,%edx
 3d2:	88 10                	mov    %dl,(%rax)
    aux[8] = ! vet[17] ;
 3d4:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3d8:	48 83 c0 08          	add    $0x8,%rax
 3dc:	0f b6 55 f1          	movzbl -0xf(%rbp),%edx
 3e0:	83 f2 01             	xor    $0x1,%edx
 3e3:	88 10                	mov    %dl,(%rax)
    aux[9] = vet[19] ;
 3e5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3e9:	48 8d 50 09          	lea    0x9(%rax),%rdx
 3ed:	0f b6 45 f3          	movzbl -0xd(%rbp),%eax
 3f1:	88 02                	mov    %al,(%rdx)
    aux[10] = vet[9] && ! vet[4] ;
 3f3:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 3f7:	48 8d 50 0a          	lea    0xa(%rax),%rdx
 3fb:	0f b6 45 e9          	movzbl -0x17(%rbp),%eax
 3ff:	84 c0                	test   %al,%al
 401:	74 12                	je     415 <_Z4passPb+0x183>
 403:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
 407:	83 f0 01             	xor    $0x1,%eax
 40a:	84 c0                	test   %al,%al
 40c:	74 07                	je     415 <_Z4passPb+0x183>
 40e:	b8 01 00 00 00       	mov    $0x1,%eax
 413:	eb 05                	jmp    41a <_Z4passPb+0x188>
 415:	b8 00 00 00 00       	mov    $0x0,%eax
 41a:	88 02                	mov    %al,(%rdx)
    aux[11] = ( vet[5] || vet[13] ) && ! vet[7] ;
 41c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 420:	48 8d 50 0b          	lea    0xb(%rax),%rdx
 424:	0f b6 45 e5          	movzbl -0x1b(%rbp),%eax
 428:	84 c0                	test   %al,%al
 42a:	75 08                	jne    434 <_Z4passPb+0x1a2>
 42c:	0f b6 45 ed          	movzbl -0x13(%rbp),%eax
 430:	84 c0                	test   %al,%al
 432:	74 12                	je     446 <_Z4passPb+0x1b4>
 434:	0f b6 45 e7          	movzbl -0x19(%rbp),%eax
 438:	83 f0 01             	xor    $0x1,%eax
 43b:	84 c0                	test   %al,%al
 43d:	74 07                	je     446 <_Z4passPb+0x1b4>
 43f:	b8 01 00 00 00       	mov    $0x1,%eax
 444:	eb 05                	jmp    44b <_Z4passPb+0x1b9>
 446:	b8 00 00 00 00       	mov    $0x0,%eax
 44b:	88 02                	mov    %al,(%rdx)
    aux[12] = ( vet[15] && vet[0] ) && ! vet[4] ;
 44d:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 451:	48 8d 50 0c          	lea    0xc(%rax),%rdx
 455:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
 459:	84 c0                	test   %al,%al
 45b:	74 1a                	je     477 <_Z4passPb+0x1e5>
 45d:	0f b6 45 e0          	movzbl -0x20(%rbp),%eax
 461:	84 c0                	test   %al,%al
 463:	74 12                	je     477 <_Z4passPb+0x1e5>
 465:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
 469:	83 f0 01             	xor    $0x1,%eax
 46c:	84 c0                	test   %al,%al
 46e:	74 07                	je     477 <_Z4passPb+0x1e5>
 470:	b8 01 00 00 00       	mov    $0x1,%eax
 475:	eb 05                	jmp    47c <_Z4passPb+0x1ea>
 477:	b8 00 00 00 00       	mov    $0x0,%eax
 47c:	88 02                	mov    %al,(%rdx)
    aux[13] = vet[6] ;
 47e:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 482:	48 8d 50 0d          	lea    0xd(%rax),%rdx
 486:	0f b6 45 e6          	movzbl -0x1a(%rbp),%eax
 48a:	88 02                	mov    %al,(%rdx)
    aux[14] = vet[15] && ! vet[4] ;
 48c:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 490:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 494:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
 498:	84 c0                	test   %al,%al
 49a:	74 12                	je     4ae <_Z4passPb+0x21c>
 49c:	0f b6 45 e4          	movzbl -0x1c(%rbp),%eax
 4a0:	83 f0 01             	xor    $0x1,%eax
 4a3:	84 c0                	test   %al,%al
 4a5:	74 07                	je     4ae <_Z4passPb+0x21c>
 4a7:	b8 01 00 00 00       	mov    $0x1,%eax
 4ac:	eb 05                	jmp    4b3 <_Z4passPb+0x221>
 4ae:	b8 00 00 00 00       	mov    $0x0,%eax
 4b3:	88 02                	mov    %al,(%rdx)
    aux[15] = ( vet[16] || vet[9] ) && ! vet[12] ;
 4b5:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 4b9:	48 8d 50 0f          	lea    0xf(%rax),%rdx
 4bd:	0f b6 45 f0          	movzbl -0x10(%rbp),%eax
 4c1:	84 c0                	test   %al,%al
 4c3:	75 08                	jne    4cd <_Z4passPb+0x23b>
 4c5:	0f b6 45 e9          	movzbl -0x17(%rbp),%eax
 4c9:	84 c0                	test   %al,%al
 4cb:	74 12                	je     4df <_Z4passPb+0x24d>
 4cd:	0f b6 45 ec          	movzbl -0x14(%rbp),%eax
 4d1:	83 f0 01             	xor    $0x1,%eax
 4d4:	84 c0                	test   %al,%al
 4d6:	74 07                	je     4df <_Z4passPb+0x24d>
 4d8:	b8 01 00 00 00       	mov    $0x1,%eax
 4dd:	eb 05                	jmp    4e4 <_Z4passPb+0x252>
 4df:	b8 00 00 00 00       	mov    $0x0,%eax
 4e4:	88 02                	mov    %al,(%rdx)
    aux[16] = vet[15] && ! ( vet[13] || vet[10] ) ;
 4e6:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 4ea:	48 8d 50 10          	lea    0x10(%rax),%rdx
 4ee:	0f b6 45 ef          	movzbl -0x11(%rbp),%eax
 4f2:	84 c0                	test   %al,%al
 4f4:	74 1d                	je     513 <_Z4passPb+0x281>
 4f6:	0f b6 45 ed          	movzbl -0x13(%rbp),%eax
 4fa:	83 f0 01             	xor    $0x1,%eax
 4fd:	84 c0                	test   %al,%al
 4ff:	74 12                	je     513 <_Z4passPb+0x281>
 501:	0f b6 45 ea          	movzbl -0x16(%rbp),%eax
 505:	83 f0 01             	xor    $0x1,%eax
 508:	84 c0                	test   %al,%al
 50a:	74 07                	je     513 <_Z4passPb+0x281>
 50c:	b8 01 00 00 00       	mov    $0x1,%eax
 511:	eb 05                	jmp    518 <_Z4passPb+0x286>
 513:	b8 00 00 00 00       	mov    $0x0,%eax
 518:	88 02                	mov    %al,(%rdx)
    aux[17] = vet[18] ;
 51a:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 51e:	48 8d 50 11          	lea    0x11(%rax),%rdx
 522:	0f b6 45 f2          	movzbl -0xe(%rbp),%eax
 526:	88 02                	mov    %al,(%rdx)
    aux[18] = vet[8] ;
 528:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 52c:	48 8d 50 12          	lea    0x12(%rax),%rdx
 530:	0f b6 45 e8          	movzbl -0x18(%rbp),%eax
 534:	88 02                	mov    %al,(%rdx)
    aux[19] = vet[11] ;
 536:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 53a:	48 8d 50 13          	lea    0x13(%rax),%rdx
 53e:	0f b6 45 eb          	movzbl -0x15(%rbp),%eax
 542:	88 02                	mov    %al,(%rdx)
    aux[20] = vet[3] && ! vet[14] ;
 544:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
 548:	48 8d 50 14          	lea    0x14(%rax),%rdx
 54c:	0f b6 45 e3          	movzbl -0x1d(%rbp),%eax
 550:	84 c0                	test   %al,%al
 552:	74 12                	je     566 <_Z4passPb+0x2d4>
 554:	0f b6 45 ee          	movzbl -0x12(%rbp),%eax
 558:	83 f0 01             	xor    $0x1,%eax
 55b:	84 c0                	test   %al,%al
 55d:	74 07                	je     566 <_Z4passPb+0x2d4>
 55f:	b8 01 00 00 00       	mov    $0x1,%eax
 564:	eb 05                	jmp    56b <_Z4passPb+0x2d9>
 566:	b8 00 00 00 00       	mov    $0x0,%eax
 56b:	88 02                	mov    %al,(%rdx)
}
 56d:	90                   	nop
 56e:	5d                   	pop    %rbp
 56f:	c3                   	retq   

0000000000000570 <_Z6runGNRii>:


void runGNR(int inicio, int fim) {
 570:	55                   	push   %rbp
 571:	48 89 e5             	mov    %rsp,%rbp
 574:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
 57b:	89 bd 6c ff ff ff    	mov    %edi,-0x94(%rbp)
 581:	89 b5 68 ff ff ff    	mov    %esi,-0x98(%rbp)
    bool s0[SIZE];
    bool s1[SIZE];
    unsigned long long int period = 0;
 587:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 58e:	00 
    unsigned long int transient = 0;
 58f:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
 596:	00 
    #pragma omp parallel private(s0,s1,period,transient) // Cada thread tem seu próprio s0 e s1 para executar a sua parte do for
    #pragma omp for schedule(static)
    for (unsigned long long int i = inicio; i < fim; i++) {
 597:	8b 85 6c ff ff ff    	mov    -0x94(%rbp),%eax
 59d:	48 98                	cltq   
 59f:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
 5a3:	8b 85 68 ff ff ff    	mov    -0x98(%rbp),%eax
 5a9:	48 98                	cltq   
 5ab:	48 3b 45 e8          	cmp    -0x18(%rbp),%rax
 5af:	0f 86 c6 00 00 00    	jbe    67b <_Z6runGNRii+0x10b>
            initialState(i, s0, s1, SIZE);
 5b5:	48 8d 95 70 ff ff ff 	lea    -0x90(%rbp),%rdx
 5bc:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
 5c0:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
 5c4:	b9 36 00 00 00       	mov    $0x36,%ecx
 5c9:	48 89 c7             	mov    %rax,%rdi
 5cc:	e8 00 00 00 00       	callq  5d1 <_Z6runGNRii+0x61>
        //     std::cout << "Inicial: " << i << std::endl;
            do {
            pass(s0);
 5d1:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
 5d5:	48 89 c7             	mov    %rax,%rdi
 5d8:	e8 00 00 00 00       	callq  5dd <_Z6runGNRii+0x6d>
            pass(s1);
 5dd:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
 5e4:	48 89 c7             	mov    %rax,%rdi
 5e7:	e8 00 00 00 00       	callq  5ec <_Z6runGNRii+0x7c>
            pass(s1);
 5ec:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
 5f3:	48 89 c7             	mov    %rax,%rdi
 5f6:	e8 00 00 00 00       	callq  5fb <_Z6runGNRii+0x8b>
            transient++;
 5fb:	48 83 45 f0 01       	addq   $0x1,-0x10(%rbp)
        } while (!equals(s0, s1, SIZE));
 600:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
 607:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
 60b:	ba 36 00 00 00       	mov    $0x36,%edx
 610:	48 89 ce             	mov    %rcx,%rsi
 613:	48 89 c7             	mov    %rax,%rdi
 616:	e8 00 00 00 00       	callq  61b <_Z6runGNRii+0xab>
            do {
 61b:	83 f0 01             	xor    $0x1,%eax
 61e:	84 c0                	test   %al,%al
 620:	74 02                	je     624 <_Z6runGNRii+0xb4>
 622:	eb ad                	jmp    5d1 <_Z6runGNRii+0x61>

        do {
            pass(s1);
 624:	48 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%rax
 62b:	48 89 c7             	mov    %rax,%rdi
 62e:	e8 00 00 00 00       	callq  633 <_Z6runGNRii+0xc3>
            period++;
 633:	48 83 45 f8 01       	addq   $0x1,-0x8(%rbp)
        } while (!equals(s0, s1, SIZE));
 638:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
 63f:	48 8d 45 b0          	lea    -0x50(%rbp),%rax
 643:	ba 36 00 00 00       	mov    $0x36,%edx
 648:	48 89 ce             	mov    %rcx,%rsi
 64b:	48 89 c7             	mov    %rax,%rdi
 64e:	e8 00 00 00 00       	callq  653 <_Z6runGNRii+0xe3>
        do {
 653:	83 f0 01             	xor    $0x1,%eax
 656:	84 c0                	test   %al,%al
 658:	74 02                	je     65c <_Z6runGNRii+0xec>
 65a:	eb c8                	jmp    624 <_Z6runGNRii+0xb4>
        period--;
 65c:	48 83 6d f8 01       	subq   $0x1,-0x8(%rbp)
        period = 0;
 661:	48 c7 45 f8 00 00 00 	movq   $0x0,-0x8(%rbp)
 668:	00 
        transient = 0;
 669:	48 c7 45 f0 00 00 00 	movq   $0x0,-0x10(%rbp)
 670:	00 
    for (unsigned long long int i = inicio; i < fim; i++) {
 671:	48 83 45 e8 01       	addq   $0x1,-0x18(%rbp)
 676:	e9 28 ff ff ff       	jmpq   5a3 <_Z6runGNRii+0x33>
    }

}
 67b:	90                   	nop
 67c:	c9                   	leaveq 
 67d:	c3                   	retq   

000000000000067e <_Z41__static_initialization_and_destruction_0ii>:
 67e:	55                   	push   %rbp
 67f:	48 89 e5             	mov    %rsp,%rbp
 682:	48 83 ec 10          	sub    $0x10,%rsp
 686:	89 7d fc             	mov    %edi,-0x4(%rbp)
 689:	89 75 f8             	mov    %esi,-0x8(%rbp)
 68c:	83 7d fc 01          	cmpl   $0x1,-0x4(%rbp)
 690:	75 32                	jne    6c4 <_Z41__static_initialization_and_destruction_0ii+0x46>
 692:	81 7d f8 ff ff 00 00 	cmpl   $0xffff,-0x8(%rbp)
 699:	75 29                	jne    6c4 <_Z41__static_initialization_and_destruction_0ii+0x46>
  extern wostream wclog;	/// Linked to standard error (buffered)
#endif
  //@}

  // For construction of filebuffers for cout, cin, cerr, clog et. al.
  static ios_base::Init __ioinit;
 69b:	48 8d 3d 00 00 00 00 	lea    0x0(%rip),%rdi        # 6a2 <_Z41__static_initialization_and_destruction_0ii+0x24>
 6a2:	e8 00 00 00 00       	callq  6a7 <_Z41__static_initialization_and_destruction_0ii+0x29>
 6a7:	48 8d 15 00 00 00 00 	lea    0x0(%rip),%rdx        # 6ae <_Z41__static_initialization_and_destruction_0ii+0x30>
 6ae:	48 8d 35 00 00 00 00 	lea    0x0(%rip),%rsi        # 6b5 <_Z41__static_initialization_and_destruction_0ii+0x37>
 6b5:	48 8b 05 00 00 00 00 	mov    0x0(%rip),%rax        # 6bc <_Z41__static_initialization_and_destruction_0ii+0x3e>
 6bc:	48 89 c7             	mov    %rax,%rdi
 6bf:	e8 00 00 00 00       	callq  6c4 <_Z41__static_initialization_and_destruction_0ii+0x46>
 6c4:	90                   	nop
 6c5:	c9                   	leaveq 
 6c6:	c3                   	retq   

00000000000006c7 <_GLOBAL__sub_I_main>:
 6c7:	55                   	push   %rbp
 6c8:	48 89 e5             	mov    %rsp,%rbp
 6cb:	be ff ff 00 00       	mov    $0xffff,%esi
 6d0:	bf 01 00 00 00       	mov    $0x1,%edi
 6d5:	e8 a4 ff ff ff       	callq  67e <_Z41__static_initialization_and_destruction_0ii>
 6da:	5d                   	pop    %rbp
 6db:	c3                   	retq   

Disassembly of section .text._ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_:

0000000000000000 <_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_>:
#endif

  template<typename _Tp, typename _Up>
    inline _GLIBCXX_CONSTEXPR
    typename __gnu_cxx::__promote_2<_Tp, _Up>::__type
    pow(_Tp __x, _Up __y)
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	48 83 ec 10          	sub    $0x10,%rsp
   8:	89 7d fc             	mov    %edi,-0x4(%rbp)
   b:	89 75 f8             	mov    %esi,-0x8(%rbp)
    {
      typedef typename __gnu_cxx::__promote_2<_Tp, _Up>::__type __type;
      return pow(__type(__x), __type(__y));
   e:	66 0f ef c9          	pxor   %xmm1,%xmm1
  12:	f2 0f 2a 4d f8       	cvtsi2sdl -0x8(%rbp),%xmm1
  17:	66 0f ef c0          	pxor   %xmm0,%xmm0
  1b:	f2 0f 2a 45 fc       	cvtsi2sdl -0x4(%rbp),%xmm0
  20:	e8 00 00 00 00       	callq  25 <_ZSt3powIiiEN9__gnu_cxx11__promote_2IT_T0_NS0_9__promoteIS2_XsrSt12__is_integerIS2_E7__valueEE6__typeENS4_IS3_XsrS5_IS3_E7__valueEE6__typeEE6__typeES2_S3_+0x25>
  25:	66 48 0f 7e c0       	movq   %xmm0,%rax
  2a:	48 89 45 f0          	mov    %rax,-0x10(%rbp)
  2e:	f2 0f 10 45 f0       	movsd  -0x10(%rbp),%xmm0
    }
  33:	c9                   	leaveq 
  34:	c3                   	retq   

Disassembly of section .text._ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_:

0000000000000000 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_>:
   *  @param __rhs  Last string.
   *  @return  New string with @a __lhs followed by @a __rhs.
   */
  template<typename _CharT, typename _Traits, typename _Alloc>
    inline basic_string<_CharT, _Traits, _Alloc>
    operator+(const basic_string<_CharT, _Traits, _Alloc>& __lhs,
   0:	55                   	push   %rbp
   1:	48 89 e5             	mov    %rsp,%rbp
   4:	53                   	push   %rbx
   5:	48 83 ec 28          	sub    $0x28,%rsp
   9:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
   d:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  11:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
	      const _CharT* __rhs)
    {
      basic_string<_CharT, _Traits, _Alloc> __str(__lhs);
  15:	48 8b 55 e0          	mov    -0x20(%rbp),%rdx
  19:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  1d:	48 89 d6             	mov    %rdx,%rsi
  20:	48 89 c7             	mov    %rax,%rdi
  23:	e8 00 00 00 00       	callq  28 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0x28>
      __str.append(__rhs);
  28:	48 8b 55 d8          	mov    -0x28(%rbp),%rdx
  2c:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  30:	48 89 d6             	mov    %rdx,%rsi
  33:	48 89 c7             	mov    %rax,%rdi
  36:	e8 00 00 00 00       	callq  3b <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0x3b>
      return __str;
  3b:	eb 1a                	jmp    57 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0x57>
  3d:	48 89 c3             	mov    %rax,%rbx
  40:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  44:	48 89 c7             	mov    %rax,%rdi
  47:	e8 00 00 00 00       	callq  4c <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0x4c>
  4c:	48 89 d8             	mov    %rbx,%rax
  4f:	48 89 c7             	mov    %rax,%rdi
  52:	e8 00 00 00 00       	callq  57 <_ZStplIcSt11char_traitsIcESaIcEENSt7__cxx1112basic_stringIT_T0_T1_EERKS8_PKS5_+0x57>
    }
  57:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
  5b:	48 83 c4 28          	add    $0x28,%rsp
  5f:	5b                   	pop    %rbx
  60:	5d                   	pop    %rbp
  61:	c3                   	retq   
