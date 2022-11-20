Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E81A9C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 04:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MGtdaF+T054aZgKva4DQRZmH4TiLA9/ofOE4ngJqX6w=; b=rkhaPAF0eiqr6H
	7oDi28MN9SE5fPp/nRplWwHEKG3BiGqd80K83x2X2HkiBzZjrT2hJDxDqHQEK8ujrSXNIwUf4hNiL
	hDpeIUMSMNu7Mo0G3OdlyX8JaM6L5SGFAuLvElZ1T9ZbvpYxkWMrBGx9l8PbT6/1nQ+A+r5A/oxlE
	6DoMalcL5K0WvI+bhJhXtmFHNDQ2VdJ3dvFvPIXLSu0FFIADPnNLfMuzFAMyLkvLZWKI0/c9BI7oh
	zf7W7ODFtamY1Ier56x5M2ZEhFuGMbrJq3aPs0kzFqIom8UOSKtTKhk3LCm5ih6b+b8wxsLq5C/ED
	FERNsO+V69sSN+PsbH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owbup-001wHm-J1; Sun, 20 Nov 2022 04:26:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owbum-001wH8-Vq
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 04:26:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45E01B80AC7
	for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 04:26:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA81DC43145
	for <linux-riscv@lists.infradead.org>; Sun, 20 Nov 2022 04:26:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668918402;
	bh=k1A92uAfw6CmkBCjaww5Sg5nXzI1WXKsXnx3KBejk3s=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=k7/VvfznUTKeZPWL0RwptaPg6nnRXnUDCzuSbXXfDrp5mfvSKS+iCu+U0L9lDDyOy
	 weS1NvERYEG9xbwbPXjtDXfrQrGs/Xi+eXAI1m+TTPjndVFeDGijfNMTCamhQHeKMd
	 a0jY1efopELcWo//bqcqlWKY1v3O4M8JKoiLNjSO1K/M7wZYkpj6khwaEoCoRXhJDk
	 aRYltYG3A2Tq8wwpZKeAMASEOg2AmhykYzByPaTRtdPfJuqrTcN8zcMnodX2xnJZ65
	 5PhElggc8pp+TrXY1a8GIxgYCaoG6MS10jcaFbNuS0YvOmVf6cUk/9v1gM/oOys7Fu
	 zNTAR2AwTXjSw==
Received: by mail-ed1-f50.google.com with SMTP id v17so12126436edc.8
        for <linux-riscv@lists.infradead.org>; Sat, 19 Nov 2022 20:26:41 -0800 (PST)
X-Gm-Message-State: ANoB5pk4hi5HqlTerw6+CuQqFbQOovVYkmqG1X6YIkcf/wcqFncwqWVf
	WHL//XeTtGl/fernWnm1oc/iwKrN+HfqFvH8K8k=
X-Google-Smtp-Source: AA0mqf7wlt6QdnTN4ssgY0s76BTmX7b5yjCBfP346X/bNzDXOeBoOfUWxOJPr5bFgB0KWpacvfWo4vCdmbXQQHVa3zI=
X-Received: by 2002:a05:6402:19a:b0:460:7413:5d46 with SMTP id
 r26-20020a056402019a00b0046074135d46mr11605961edv.47.1668918399977; Sat, 19
 Nov 2022 20:26:39 -0800 (PST)
MIME-Version: 1.0
References: <20221118173217.888077-1-suagrfillet@gmail.com>
In-Reply-To: <20221118173217.888077-1-suagrfillet@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 20 Nov 2022 12:26:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTHWtm-nYD0SdcvnxAXkiNOVBZAkVx8SkJL2w-K9iaWZQ@mail.gmail.com>
Message-ID: <CAJF2gTTHWtm-nYD0SdcvnxAXkiNOVBZAkVx8SkJL2w-K9iaWZQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] riscv/ftrace: make function graph use ftrace directly
To: Song Shuai <suagrfillet@gmail.com>
Cc: rostedt@goodmis.org, mhiramat@kernel.org, mark.rutland@arm.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221119_202645_349713_958B85E9 
X-CRM114-Status: GOOD (  22.07  )
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

On Sat, Nov 19, 2022 at 1:32 AM Song Shuai <suagrfillet@gmail.com> wrote:
>
> In RISC-V architecture, when we enable the ftrace_graph tracer on some
> functions, the function tracings on other functions will suffer extra
> graph tracing work. In essence, graph_ops isn't limited by its func_hash
> due to the global ftrace_graph_[regs]_call label. That should be corrected.
>
> What inspires me is the commit 0c0593b45c9b ("x86/ftrace: Make function
> graph use ftrace directly") that uses graph_ops::func function to install
> return_hooker and makes the function called against its func_hash.
>
> This series of patches makes function graph use ftrace directly for riscv.
>
> If FTRACE_WITH_REGS isn't defined, ftrace_caller keeps ftrace_graph_call
> so that it can be replaced with the calling of prepare_ftrace_return by
> the enable/disable helper.
>
> As for defining FTRACE_WITH_REGS, ftrace_caller is adjusted to save the
> necessary regs against the pt_regs layout, so it can reasonably call the
> graph_ops::func function - ftrace_graph_func. And ftrace_graph_[regs]_call
> and its enable/disable helper aren't needed.
>
> The tests generated by CONFIG_FTRACE_STARTUP_TEST have passed in the local
> qemu-system-riscv64 virt machine. The following is the log during startup.
>
> ```
> Nov 15 03:07:13 stage4 kernel: Testing tracer function: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #1:
> Nov 15 03:07:13 stage4 kernel: (1 0 1 0 0)
> Nov 15 03:07:13 stage4 kernel: (1 1 2 0 0)
> Nov 15 03:07:13 stage4 kernel: (2 1 3 0 365)
> Nov 15 03:07:13 stage4 kernel: (2 2 4 0 399)
> Nov 15 03:07:13 stage4 kernel: (3 2 4 0 146071)
> Nov 15 03:07:13 stage4 kernel: (3 3 5 0 146105) PASSED
> Nov 15 03:07:13 stage4 kernel: Testing dynamic ftrace ops #2:
> Nov 15 03:07:13 stage4 kernel: (1 0 1 589 0)
> Nov 15 03:07:13 stage4 kernel: (1 1 2 635 0)
> Nov 15 03:07:13 stage4 kernel: (2 1 3 1 2)
> Nov 15 03:07:13 stage4 kernel: (2 2 4 125 126)
> Nov 15 03:07:13 stage4 kernel: (3 2 4 146001 146078)
> Nov 15 03:07:13 stage4 kernel: (3 3 5 146035 146112) PASSED
> Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing ftrace recursion safe: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing ftrace regs: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer nop: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer irqsoff: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup:
> Nov 15 03:07:13 stage4 kernel: sched: DL replenish lagged too much
> Nov 15 03:07:13 stage4 kernel: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_rt: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer wakeup_dl: PASSED
> Nov 15 03:07:13 stage4 kernel: Testing tracer function_graph: PASSED
> ```
>
> Note that the changes of mcount-dyn.S conflicts with this unmerged
> commit (riscv: entry: consolidate general regs saving/restoring).
> https://lore.kernel.org/linux-riscv/20221103075047.1634923-15-guoren@kernel.org
>
> Changes since v2:
> - line up the comments [Andrew]
> - rename SAVE_ALL as SAVE_ABI_REGS [Guo Ren]
> - consolidate the modifications of mcount-dyn.S into one patch [Guo Ren]
> - adapt this series based on [riscv: ftrace: Fixup ftrace detour code][1] [Guo Ren]
Tested-by: Guo Ren <guoren@kernel.org>

https://github.com/guoren83/linux/tree/ftrace_fixup_v3

>
> [1]: https://lore.kernel.org/linux-riscv/20220921034910.3142465-1-guoren@kernel.org/
> v2 Link: https://lore.kernel.org/linux-riscv/20221116031305.286634-1-suagrfillet@gmail.com/
>
> Changes since v1:
> - fix the checkpatch warnings in patch 1
> v1 Link: https://lore.kernel.org/linux-riscv/20221115061525.112757-1-suagrfillet@gmail.com
>
> Song Shuai (2):
>   riscv/ftrace: add ftrace_graph_func
>   riscv/ftrace: make ftrace_caller call ftrace_graph_func
>
>  arch/riscv/include/asm/ftrace.h |  13 ++-
>  arch/riscv/kernel/ftrace.c      |  30 +++----
>  arch/riscv/kernel/mcount-dyn.S  | 143 +++++++++++++++++++++++---------
>  3 files changed, 129 insertions(+), 57 deletions(-)
>
> --
> 2.20.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
