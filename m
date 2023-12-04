Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAF4C4167B
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Dec 2023 11:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqGBmvmiZlLRohr/3Hwz1KdLQ/veCOGONGgCOfIKEwM=; b=2g7wP9Ph4owaoe
	DFFk+hcbkwcsOTqKeOYSA34UQblk24OGzTokOeBV+AnrjRVwLAataPq+88gUB9wRExS4K2teLnE7u
	yj8+ssdbxIjmnGTDxSiNtOQiKEovUjBsTjX/nveeJN03SyixYJi9Sv7VNebuncId0HjYyZ/HOPWBg
	TTOnrE4gHlso0qHusOZv7Sm6eeHptpAsxBQEZ5JzhUZe8JbaRychQjKStBV+5juQNYOTaYPXzKxQx
	Sai1lpQikAvbPKwyBJlAcMlS2einubExtc7cX3PoQQrccusdSu64NTfmZHKLRhw1QX3eiN4jCV3kZ
	A3+8mdVE//GAfjgEiuDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rA6rT-003d8M-29;
	Mon, 04 Dec 2023 11:11:39 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rA6rR-003d85-2u
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Dec 2023 11:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=57qN1iQssrdoPxO3vjOJxY+KkICDSFEOHy7vEhypSQY=; b=SJZWmelLjacxjQSc2rHFwC2yAL
	jTj9QZTX0X4Po4XPpfbs7mcPqcRffTzF+bRxA6cc+E5pWWustakRYKEHFrKYdsNMy0O3vYtMgKPqD
	g6mXsMan1PhPEuOos6p54MK0NRN6dhfjkQFxjjekcKPgEUo/P8hMw93tOmEpoCTiUedvGyLRD8Z9D
	HLkoFDqCUrQBEg2UU8X7XyyVtMWxis4xqXdL5iszhpV2f0OjzCwzyI6Idp1VXXqqWoC3vZQiQNbY4
	zqZ1Mcm2rpTcgt+Qe43CxSMZDe3gBiRFLdStRojeDIPpxLyqyFTKjjgekBA/xZqWFFnX93kfXBC7a
	/EPIZEzw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1rA6rJ-000b3j-D2; Mon, 04 Dec 2023 11:11:29 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6305A3003F0; Mon,  4 Dec 2023 12:11:28 +0100 (CET)
Date: Mon, 4 Dec 2023 12:11:28 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Song Liu <song@kernel.org>, Song Liu <songliubraving@meta.com>,
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
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <20231204111128.GV8262@noisy.programming.kicks-ass.net>
References: <20231130133630.192490507@infradead.org>
 <20231130134204.136058029@infradead.org>
 <CAADnVQJqE=aE7mHVS54pnwwnDS0b67iJbr+t4j5F4HRyJSTOHw@mail.gmail.com>
 <20231204091334.GM3818@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231204091334.GM3818@noisy.programming.kicks-ass.net>
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

On Mon, Dec 04, 2023 at 10:13:34AM +0100, Peter Zijlstra wrote:

> > Just running test_progs it splats right away:
> > 
> > [   74.047757] kmemleak: Found object by alias at 0xffffffffa0001d80
> > [   74.048272] CPU: 14 PID: 104 Comm: kworker/14:0 Tainted: G        W
> >  O       6.7.0-rc3-00702-g41c30fec304d-dirty #5241
> > [   74.049118] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996),
> > BIOS rel-1.12.0-59-gc9ba5276e321-prebuilt.qemu.org 04/01/2014
> > [   74.050042] Workqueue: events bpf_prog_free_deferred
> > [   74.050448] Call Trace:
> > [   74.050663]  <TASK>
> > [   74.050841]  dump_stack_lvl+0x55/0x80
> > [   74.051141]  __find_and_remove_object+0xdb/0x110
> > [   74.051521]  kmemleak_free+0x41/0x70
> > [   74.051828]  vfree+0x36/0x130
> 
> Durr, I'll see if I can get that stuff running locally, and otherwise
> play with the robot as you suggested. Thanks!

I think it is bpf_jit_binary_pack_hdr(), which is using prog->bpf_func
as a start address for the image, instead of jit_data->image.

This used to be true, but now it's offset.

Let me see what to do about that...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
