Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E48BC61DB2
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:34:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l11mJw6AvnP1mZGnn6NJYq5boYfbipGv5EKhgu4AAks=; b=wOKPCyEr+KX7yt
	1xXtFi3hGaM3QVbt6PTCWKeb31qI3mXDXgF/igTp8Tod9QmSajsTKjabM5SYyXkeZXj5qMMKzw/Bo
	hEBvkMBm8SXx25KVVmgJBqn1oDi97HC1/NjwdHGCSPwaDYKMaQK4ZJupW8uiCMxyBoqoh0adaWMjU
	gwseh2Y5fJG7dTLNaDZd1uWxdDlzOMuwJriREMopgCITeTIrqoSgNwowrXMSegymu/ji5svJqJVMn
	GgaPw8V3pgCOKbYDZ/RKEzoYiisnKC1GQK0mTtO4jc82fAT4qniEH9QhfoOMP4LJdQbAsxnvqt8mE
	Um6wQ6JsFFPIcpfB8lrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzsD-0000000Flmq-1PUl;
	Fri, 13 Jun 2025 08:34:53 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzq2-0000000FleZ-32mV;
	Fri, 13 Jun 2025 08:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ceyQVU1s/TeC1A0uuWSXGNuCFCVzbMABPNZsJKr21a4=; b=dqNTC/tN4NktIpsvVSNzGd1Nnb
	Ldq+PhqaTIoeFX8VZpUciXtoyr5CFokw7L8HNdBGwoPl6xSK9X6o+V3RpCm62st+eycrHXRgyrId4
	4Po3+C8crMT914IOhhj9CrqolkUd9H7EV3hacaFcjxbQeteCWjgcHJNLo0dtEgYJ//ndXjdQcuL4N
	z/E164M1C5AX4Ddk5/Hz9YfZerFiy/DnFQ7B3Dv1S4TZ3MHKdeMIkMZRh1le5FPGjoELyUx3VYPnV
	42klzQnynHAr/Mz3kmKTN9vJgW3XYeQsbsKdIXLcdMzaRYWGAnXyk4I0cC1V92HJfqr7/zrHNZxlG
	ZinrIPZg==;
Received: from 2001-1c00-8d82-d000-266e-96ff-fe07-7dcc.cable.dynamic.v6.ziggo.nl ([2001:1c00:8d82:d000:266e:96ff:fe07:7dcc] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzpx-0000000Cjg6-2v0S;
	Fri, 13 Jun 2025 08:32:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 94D9E300969; Fri, 13 Jun 2025 10:32:32 +0200 (CEST)
Date: Fri, 13 Jun 2025 10:32:32 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Menglong Dong <imagedong@tencent.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	ebpf@linuxfoundation.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	netdev@vger.kernel.org, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH bpf 2/7] bpf/x86: prevent trampoline attachment when args
 location on stack is uncertain
Message-ID: <20250613083232.GL2273038@noisy.programming.kicks-ass.net>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
 <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
 <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DAL9GRMH74F4.2IV0HN0NGU65X@bootlin.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Jun 13, 2025 at 10:26:37AM +0200, Alexis Lothor=E9 wrote:
> Hi Peter,
> =

> On Fri Jun 13, 2025 at 10:11 AM CEST, Peter Zijlstra wrote:
> > On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=E9 (eBPF Founda=
tion) wrote:
> >> When the target function receives more arguments than available
> >> registers, the additional arguments are passed on stack, and so the
> >> generated trampoline needs to read those to prepare the bpf context,
> >> but also to prepare the target function stack when it is in charge of
> >> calling it. This works well for scalar types, but if the value is a
> >> struct, we can not know for sure the exact struct location, as it may
> >> have been packed or manually aligned to a greater value.
> >
> > https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf
> >
> > Has fairly clear rules on how arguments are encoded. Broadly speaking
> > for the kernel, if the structure exceeds 2 registers in size, it is
> > passed as a reference, otherwise it is passed as two registers.
> =

> Maybe my commit wording is not precise enough, but indeed, there's not
> doubt about whether the struct value is passed on the stack or through a
> register/a pair of registers. The doubt is rather about the struct locati=
on
> when it is passed _by value_ and _on the stack_: the ABI indeed clearly
> states that "Structures and unions assume the alignment of their most
> strictly aligned component" (p.13), but this rule is "silently broken" wh=
en
> a struct has an __attribute__((packed)) or and __attribute__((aligned(X))=
),
> and AFAICT this case can not be detected at runtime with current BTF info.

Ah, okay. So it is a failure of BTF. That was indeed not clear.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
