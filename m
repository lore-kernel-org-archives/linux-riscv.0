Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FB6C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 May 2023 14:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l7icb/qp3Xe5iZwRS6shpVWqFlf6BLD4yGDW4Rp+RSU=; b=ZF/p4b1C2oq4+g
	DXbuoti27wsGqRqynlfPaAXUUcvfRhn5mL1cBPz8ATtVrWIu53heuI4tlbFJr5OjTQPyTSRuF6hQd
	bQL8f79YoZz1ot5/IMPCAF3quOaSBTWN3dngr2E+IHfiDl7wIvb+rFnxfANMfjWxa/F3YFWRSR60p
	HFzauXt/O+EN9An+4CPP+aa/lHAJdarDWZA4+coEq7rX7bcM0I+yhru/itdLkI8Sf9Lz5bJSYX8Th
	KqHxjBIIeTtvOQLrWW/oSsc/SOBN85wq6Q3o3DDPEhpIydWGR8H821uukPXQdmd5B9GSSrU6UkV6n
	+BpWo6oClT9UGCw5eA0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvXC-0063yK-1j;
	Tue, 16 May 2023 14:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyvXA-0063wl-06
	for linux-riscv@lists.infradead.org;
	Tue, 16 May 2023 14:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D36E563018;
	Tue, 16 May 2023 14:20:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB3AC433EF;
	Tue, 16 May 2023 14:20:07 +0000 (UTC)
Date: Tue, 16 May 2023 10:20:06 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ze Gao <zegao2021@gmail.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexander Gordeev <agordeev@linux.ibm.com>, Alexei
 Starovoitov <ast@kernel.org>, Borislav Petkov <bp@alien8.de>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Dave Hansen
 <dave.hansen@linux.intel.com>, Heiko Carstens <hca@linux.ibm.com>, "H.
 Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Vasily Gorbik <gor@linux.ibm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 bpf@vger.kernel.org, Conor Dooley <conor@kernel.org>, Jiri Olsa
 <jolsa@kernel.org>, Yonghong Song <yhs@fb.com>, Ze Gao <zegao@tencent.com>
Subject: Re: [PATCH v2 4/4] rehook, fprobe: do not trace rethook related
 functions
Message-ID: <20230516102006.76dfd68a@gandalf.local.home>
In-Reply-To: <20230516071830.8190-5-zegao@tencent.com>
References: <20230516071830.8190-1-zegao@tencent.com>
	<20230516071830.8190-5-zegao@tencent.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230516_072012_128678_F5CDA48B 
X-CRM114-Status: GOOD (  13.50  )
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

Unrelated to this patch, but someday we need to change the -pg above to
$(CC_FLAGS_FTRACE).

-- Steve


>  endif
>  
>  KASAN_SANITIZE_head$(BITS).o				:= n
> -- 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
