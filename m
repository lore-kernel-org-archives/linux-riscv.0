Return-Path: <SRS0=1JZA=NQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6CC37C432BE
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39F2B61373
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Aug 2021 04:45:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39F2B61373
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cS9gWfP23hRX/O9KqkYQRLOcZA8z7PIIhUvDpwIfVgE=; b=q9REdtfS/O8a12Q5F7F6hSplAB
	AD015sL3587f/JPR8nwbql6q+Jjyye6w/GJUQU0GCQ6Z+XHsbJxJPE+TGiNSxf851z2saUv0z7s/a
	sCplDoZN8jpU6t+SFsEu1emM7rERWIG+xG0tt+GtpVLtna0t5lOGRvd5NuRxzH0fjENvtsZSfnF5f
	EmhT3v0ReLRleYKxoRwdXv+nhmvsVEeVlI+vfypscCBA62EWuJEu4LglQsV/tMDWCu8OuBpusiRwK
	4jKCHsx7fdsOkoTTeh58l6cNVU8hgXPUrNSLgRstCE1ToR5mBCzHGJe2VvEK8Lf/GectJlttGh0Hr
	M5XVYL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIkmN-005UUZ-82; Wed, 25 Aug 2021 04:44:47 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIkmH-005USw-PR
 for linux-riscv@lists.infradead.org; Wed, 25 Aug 2021 04:44:43 +0000
Received: by mail-pf1-x432.google.com with SMTP id j187so20203238pfg.4
 for <linux-riscv@lists.infradead.org>; Tue, 24 Aug 2021 21:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=EAG58EVApRUGkyszrt6jJoMCyxFVxjMYMcnKoCUoiqg=;
 b=hfHtJopM1tlsqsAfVjshoBnEYMDJ/HTbHqeaeOVsLzl/ChqG4Y8nYibfrPFq6KEw9Z
 Wh26h+VM0ogB4vRTQvvTxzXkZ7URAEk69rUaNkkwuF+aBLqe2uSWST4JqR+t1W6qFm9q
 eeOUQHbvsqWxuB/a+AF+j3sIaONa9XwYH40CQzqhiBXY72YVN8humLa59ktqwg58KAGu
 X1QVOpks2OSF7+DnFz43ThhjEF2Y/XbnjEz/rgs7BA72wv2GJreyAhPO9o9ORPpsOMhT
 dK3TICl4zQHrNLHlz9sxu9wUOW4gREm3krzg/eswaLV2MXdWfZ3E6cZsyU97zXBHvF3t
 dLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=EAG58EVApRUGkyszrt6jJoMCyxFVxjMYMcnKoCUoiqg=;
 b=S9GnkhRq5vdiseobwLhhZNp4coVgUDkQrw1K2uSmnm976RzIEuT7h651l5/9ZWqjDz
 z4ry3B64MQ2MLtAX39XYFaQBVFReiHcxu7ieITU8CWkDy/mtqXphhxPF5WKWbFrwjhv0
 SgSyn55drPkYQ5PXpkNx8bvTyanJspedvdDnPlL3B4S7bH34xqHg82B5v6qQlcEVbXTx
 Qidcjd44ht10bpwXwQqo3y7/qUa4EXegakC83ITkgqz5631VlANdwVIco0D3EDkHG88l
 sSmXfxJXL/44LbeYwJWUNaJ5filAug7zmNfXB0m98VksfX8VPDHDuXnhrmdbPG2x1fYf
 DcyQ==
X-Gm-Message-State: AOAM5302sFf2VhIhqC7Yzt1MpFNTNxQUqAcr/1KIQA8opYomNz57o2UM
 EDB4UI5S77ifkVQAxI9oonrgDg==
X-Google-Smtp-Source: ABdhPJz0+8WIyjmnGqTANRXO1uZjLV2/RuNUrTAQFDbcYHPe35ZcJJvg/gDJKfS2X+X9LwoxFnTG2w==
X-Received: by 2002:a63:204a:: with SMTP id r10mr40247704pgm.365.1629866680969; 
 Tue, 24 Aug 2021 21:44:40 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id nv11sm4038552pjb.48.2021.08.24.21.44.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 21:44:40 -0700 (PDT)
Date: Tue, 24 Aug 2021 21:44:40 -0700 (PDT)
X-Google-Original-Date: Tue, 24 Aug 2021 20:58:23 PDT (-0700)
Subject: Re: [PATCH v2] riscv: Ensure the value of FP registers in the core
 dump file is up to date
In-Reply-To: <1627982871-29807-1-git-send-email-vincent.chen@sifive.com>
CC: oleg@redhat.com, linux-riscv@lists.infradead.org, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-d3d9dc03-a12f-4495-ba04-35536e73d400@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_214441_868035_AAFD6A72 
X-CRM114-Status: GOOD (  21.56  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 03 Aug 2021 02:27:51 PDT (-0700), vincent.chen@sifive.com wrote:
> The value of FP registers in the core dump file comes from the
> thread.fstate. However, kernel saves the FP registers to the thread.fstate
> only before scheduling out the process. If no process switch happens
> during the exception handling process, kernel will not have a chance to
> save the latest value of FP registers to thread.fstate. It will cause the
> value of FP registers in the core dump file may be incorrect. To solve this
> problem, this patch force lets kernel save the FP register into the
> thread.fstate if the target task_struct equals the current.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
>
> ---
> Changes since the v1 patch
> 1. Include switch_to.h to avoid compiling error.
>
> ---
>  arch/riscv/kernel/ptrace.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
> index 1a85305720e8..9c0511119bad 100644
> --- a/arch/riscv/kernel/ptrace.c
> +++ b/arch/riscv/kernel/ptrace.c
> @@ -10,6 +10,7 @@
>  #include <asm/ptrace.h>
>  #include <asm/syscall.h>
>  #include <asm/thread_info.h>
> +#include <asm/switch_to.h>
>  #include <linux/audit.h>
>  #include <linux/ptrace.h>
>  #include <linux/elf.h>
> @@ -56,6 +57,9 @@ static int riscv_fpr_get(struct task_struct *target,
>  {
>  	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
>
> +	if (target == current)
> +		fstate_save(current, task_pt_regs(current));
> +
>  	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
>  	membuf_store(&to, fstate->fcsr);
>  	return membuf_zero(&to, 4);	// explicitly pad

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
