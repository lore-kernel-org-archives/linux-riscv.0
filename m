Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2299FC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 20:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMuEFu934xA2jfMfCAlnp4Faa/dtpybddWmIZO4mMjU=; b=di4aXIs25Ls8ur
	Pg++Y1c7ghFnMpjh3NMuPYLjPYzPoYKgBVRQH5X3PcNU67waLfOd2V02/TqrudADrp1COehy/IFix
	0XS1lHB4Odow5tCfM9b36TQd/BAxQNqa4z1BlrQIw15ZeRhPzROG4Q4aOvsWFe9LgtTWA7YL+bBlW
	+gmiu+CgTluztbPj8xAQlIbicEYQWNHP2oKRsu43GysGv+1kYGu6P50Sq3EswyELCPa8dC58Nodm8
	zLCPEpwnUKS7q7YI9OtKtGSo5UL4yOR1g2GPlC/XTPJsQSCN0IMHU9h+Ds5K4mpzNOuYs+SGZpLOj
	ppy7PHyFTZB0/ddAx0qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhu0-00GY9Y-1T;
	Fri, 08 Dec 2023 20:56:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBhty-00GY9K-2j
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 Dec 2023 20:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=tsh6SZmjsiAnQNburkJFUqIGTSKo136cXIGADj2mGbk=; b=nka5h3yCL1hCZw1C09D5tWSVAL
	4oQHmkY/q1dbCaw6qBSKd5XLLGIKuHgbyn9RktMJngKJ2sNKt79QXC0EcciTcnntYjAWwUABeK5Jc
	DXBmAfjnz63AvHfOOdBAkoCfu6fYm4SLROgyQzZJIPKCJ/YGV8KMZtE/W3z86PxOEWqPjYFsjhXup
	Kspp6P26tuanNWKE+ldEJoXw8TQwn787U5ABY5A4BGUxEueMUccx2IZDmrEMBfPmXxeM7u22FagVf
	jk4SlD2jX4uZ6J5wYWrTcUhKwtVQtreODt+nuVfdAs2I6RbfoJuSeyqbH1OGoM94umgRc/l/HKq95
	UUw+dgnA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rBhtv-006ZnV-M1; Fri, 08 Dec 2023 20:56:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 534BF3003F0; Fri,  8 Dec 2023 21:56:47 +0100 (CET)
Date: Fri, 8 Dec 2023 21:56:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Jiri Olsa <olsajiri@gmail.com>, Song Liu <song@kernel.org>,
	Song Liu <songliubraving@meta.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, X86 ML <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"David S. Miller" <davem@davemloft.net>,
	David Ahern <dsahern@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@google.com>,
	Hao Luo <haoluo@google.com>, Arnd Bergmann <arnd@arndb.de>,
	Sami Tolvanen <samitolvanen@google.com>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Network Development <netdev@vger.kernel.org>,
	bpf <bpf@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>,
	clang-built-linux <llvm@lists.linux.dev>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Joao Moreira <joao@overdrivepizza.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 2/2] x86/cfi,bpf: Fix BPF JIT call
Message-ID: <20231208205647.GL28727@noisy.programming.kicks-ass.net>
References: <20231206163814.GB36423@noisy.programming.kicks-ass.net>
 <20231206183713.GA35897@noisy.programming.kicks-ass.net>
 <zu5eb2robdqnp2ojwaxjhnglcummrnjaqbw6krdds6qac3bql2@5zx46c2s6ez4>
 <20231207093105.GA28727@noisy.programming.kicks-ass.net>
 <ivhrgimonsvy3tyj5iidoqmlcyqvtsh2ay3cm3ouemsdbvjzs4@6jlt6zv55tgh>
 <20231208102940.GB28727@noisy.programming.kicks-ass.net>
 <20231208134041.GD28727@noisy.programming.kicks-ass.net>
 <CAADnVQJFB_CPtFS3=VV=RwnP=EQRL3yEsR8wXVcicb07P8NODw@mail.gmail.com>
 <20231208201819.GE36716@noisy.programming.kicks-ass.net>
 <CAADnVQ+1nVBuKkjdvh0eu19p+J0UqbO9mcCf3yzVeQtALxzQ+Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAADnVQ+1nVBuKkjdvh0eu19p+J0UqbO9mcCf3yzVeQtALxzQ+Q@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 08, 2023 at 12:45:51PM -0800, Alexei Starovoitov wrote:

> I mean we don't need to store a pointer to a func in stubs.
> Can it be, roughly:
> 
> extern void bpf_tcp_ca_cong_avoid(struct sock *sk, u32 ack, u32 acked);
> KCFI_MACRO(hash_of_cong_avoid, bpf_tcp_ca_cong_avoid);
> u32 __array_of_kcfi_hash[] = {hash_of_cong_avoid, hash_of_set_state,...};
>       .bpf_ops_stubs = __array_of_kcfi_hash,

But then how do I index this array? The bpf_ops_stubs thing having the
same layout at the target struct made it easy and we could use 'moff'
for both.

That also remains working if someone adds a member to the struct or
moves some members around.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
