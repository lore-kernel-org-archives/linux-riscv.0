Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CF4EC71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 08:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mEhUZGntBd9WLpvPEMlRYaSG5O3rcJqvGAvZLknfIV0=; b=DhfeAXQlkAy6S+
	IeZPhakNGkVR5giyGDRl99vV3cnmOhyf9DLzFbic3UJOjxhvB+HQ4U0rTBk+2lGxXaFPultXHlxAQ
	VoQ27veYDEE6aTF1lipgACJ3oqj4Kj/gHULglpFTDD1mQ9R1J9NffJdQC/rPi3m12aa0moARt4/b/
	dv0iflVvF9aYuYrnvF1/e2wAuicQLDHMsrt2shJntA0iJiIyK9eUTFr8iQqvS7Wf76I+K9pFecwKM
	cTw6UeNmnZJeXFPGSNip4Mse4/pxwvCiYdhi0wStgx0jKPf/3RUkMlGkYMQOPMaWJQnYFq4WT1fw/
	Vox5AasmhGGSxDg0rMgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzb1-0000000FjdQ-3Fty;
	Fri, 13 Jun 2025 08:17:07 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzaw-0000000FjcO-3Cz5;
	Fri, 13 Jun 2025 08:17:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=m4XILQdlyhOEuGIrG8GkhmJQpyqVphUns6R2oeWJu9E=; b=f3LAUdt5CXosLIWHTG1Gn2PqbK
	uw/eNAwNwnZ7Ad1daZCeRDp/bnOhoqQM5Mn/GdZreNWOuJ0RhhyqKggEr6V0TRSHUSyNjLYbpDFBc
	LXhiSHFdUqcld4K+jE+bpdoag0YeedzOI2w3hVHWJN92pBzd16viaDbOhzBWRJynFhd712ScZYy3I
	+M4GEXUTTr2XfF+o14XniGTwivG8YqhQ7knBL1UQbCQwyknCcFLcteoDNuwd0zc8aEJYFa8HH8Tkc
	yauPRRnQs89VhaSNWzqCn0BH9o+r+7+/tHBn/b2R1OM4E7IJfGDeSMF/O2D2y6Tn0172qdOz/P6S+
	066LXRWg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPzVw-0000000Ciov-0OfZ;
	Fri, 13 Jun 2025 08:11:52 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DDD5E30BC59; Fri, 13 Jun 2025 10:11:50 +0200 (CEST)
Date: Fri, 13 Jun 2025 10:11:50 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexis =?iso-8859-1?Q?Lothor=E9_=28eBPF_Foundation=29?= <alexis.lothore@bootlin.com>
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
Message-ID: <20250613081150.GJ2273038@noisy.programming.kicks-ass.net>
References: <20250613-deny_trampoline_structs_on_stack-v1-0-5be9211768c3@bootlin.com>
 <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250613-deny_trampoline_structs_on_stack-v1-2-5be9211768c3@bootlin.com>
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

On Fri, Jun 13, 2025 at 09:37:11AM +0200, Alexis Lothor=E9 (eBPF Foundation=
) wrote:
> When the target function receives more arguments than available
> registers, the additional arguments are passed on stack, and so the
> generated trampoline needs to read those to prepare the bpf context,
> but also to prepare the target function stack when it is in charge of
> calling it. This works well for scalar types, but if the value is a
> struct, we can not know for sure the exact struct location, as it may
> have been packed or manually aligned to a greater value.

https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf

Has fairly clear rules on how arguments are encoded. Broadly speaking
for the kernel, if the structure exceeds 2 registers in size, it is
passed as a reference, otherwise it is passed as two registers.



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
