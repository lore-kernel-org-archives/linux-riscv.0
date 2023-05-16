Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75678C77B75
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 16:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idfA2E49lFHta0qDLLdoS+4E/Tyvf2yRZ2wLuRfJv6g=; b=R1pr/KIb0ioI+R
	IPphY5UJtvo0QJp3nMfFMmVI1BJa94Jo5l5dJO2ZgBSmzfbQNMUoDqMNgBfmcol+1p+5AmyHSjC6A
	f6pVEfGjz6OIWz8So4U5zdJQ+VMeVZdT0NxR+iTWghlkNeJDFz1+xc+zRlwFbtN6T6aww26OenaZb
	Fa/r4xUX5NFPYEQzbrdHrpqgEpB8lA3Hak0Crc05JuGHU/gAGwCfCLzlaRlYLvialYMYB3+2eHOz2
	72wNPy3Gx5Ot6re7XBY0L4CntakX5ZxQUAE88pgBzm7X+muTbeW3bGYDQZYaWG4DP3RhftAVGSdnR
	zhahFSfrawCkh5hiH38Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyxB1-006OEX-1S;
	Tue, 16 May 2023 16:05:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyxAy-006ODN-2q
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 16:05:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69A28633AA;
	Tue, 16 May 2023 16:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24D8AC433EF;
	Tue, 16 May 2023 16:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684253123;
	bh=WyRb0cO3Dcn2zW5KolHtzKC/m3CXEA35/xNovR2+mVs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NCS2Zz8pxqjius3cIeMK7tjhFhsxId3BBRETFZma2dEBbqmn9f6SuTd2lZIRnTt9T
	 hHkK4e+Cx6MPeUDdPZ0fwTAizNgNityDFGD5sy19v/a4jq2GCTg1FF0Jn8rVwnLng9
	 a0vJmEwoIbzmK2DkBlzmLDbPkpl9DpwSFrMwC1h+6eA1tvY8GFLDSAQdH58KYn1FSC
	 ArtXT/RdjGCyQNQ2KAG7y1F3Nvc1Tpc71ewwBpAplzWKPFoKUciNxZBkonWaWUynqa
	 kWUI6Rd0tpwC9UPT9E0yyrPpVvJhSgpIlVKKtgGScC7W1FOAq+1YqbSSZALcG/dzk4
	 W49qIyvsxZq9w==
Date: Wed, 17 May 2023 01:05:17 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Alexei Starovoitov
 <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <hca@linux.ibm.com>, "H. Peter Anvin" <hpa@zytor.com>, Ingo
 Molnar <mingo@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Sven Schnelle <svens@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, bpf@vger.kernel.org, Conor Dooley
 <conor@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Yonghong Song
 <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 4/4] rehook, fprobe: do not trace rethook related
 functions
Message-Id: <20230517010517.9b7bf28a42067540f7a25638@kernel.org>
In-Reply-To: <20230516071830.8190-5-zegao@tencent.com>
References: <20230516071830.8190-1-zegao@tencent.com>
	<20230516071830.8190-5-zegao@tencent.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_090525_001936_3E344D87 
X-CRM114-Status: GOOD (  16.48  )
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

On Tue, 16 May 2023 15:18:30 +0800
Ze Gao <zegao2021@gmail.com> wrote:

> These functions are already marked as NOKPROBE to prevent recursion and
> we have the same reason to blacklist them if rethook is used with fprobe,
> since they are beyond the recursion-free region ftrace can guard.
> 
> Signed-off-by: Ze Gao <zegao@tencent.com>

Looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you!

> ---
>  arch/riscv/kernel/probes/Makefile | 2 ++
>  arch/s390/kernel/Makefile         | 1 +
>  arch/x86/kernel/Makefile          | 1 +
>  3 files changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/probes/Makefile b/arch/riscv/kernel/probes/Makefile
> index c40139e9ca47..8265ff497977 100644
> --- a/arch/riscv/kernel/probes/Makefile
> +++ b/arch/riscv/kernel/probes/Makefile
> @@ -4,3 +4,5 @@ obj-$(CONFIG_RETHOOK)		+= rethook.o rethook_trampoline.o
>  obj-$(CONFIG_KPROBES_ON_FTRACE)	+= ftrace.o
>  obj-$(CONFIG_UPROBES)		+= uprobes.o decode-insn.o simulate-insn.o
>  CFLAGS_REMOVE_simulate-insn.o = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_rethook.o = $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_rethook_trampoline.o = $(CC_FLAGS_FTRACE)
> diff --git a/arch/s390/kernel/Makefile b/arch/s390/kernel/Makefile
> index 8983837b3565..6b2a051e1f8a 100644
> --- a/arch/s390/kernel/Makefile
> +++ b/arch/s390/kernel/Makefile
> @@ -10,6 +10,7 @@ CFLAGS_REMOVE_ftrace.o		= $(CC_FLAGS_FTRACE)
>  
>  # Do not trace early setup code
>  CFLAGS_REMOVE_early.o		= $(CC_FLAGS_FTRACE)
> +CFLAGS_REMOVE_rethook.o		= $(CC_FLAGS_FTRACE)
>  
>  endif
>  
> diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
> index dd61752f4c96..4070a01c11b7 100644
> --- a/arch/x86/kernel/Makefile
> +++ b/arch/x86/kernel/Makefile
> @@ -17,6 +17,7 @@ CFLAGS_REMOVE_ftrace.o = -pg
>  CFLAGS_REMOVE_early_printk.o = -pg
>  CFLAGS_REMOVE_head64.o = -pg
>  CFLAGS_REMOVE_sev.o = -pg
> +CFLAGS_REMOVE_rethook.o = -pg
>  endif
>  
>  KASAN_SANITIZE_head$(BITS).o				:= n
> -- 
> 2.40.1
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
