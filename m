Return-Path: <SRS0=5fxH=PO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9530EC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 23:14:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46B69610CF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Oct 2021 23:14:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46B69610CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iaVr2QOSSENUxLSGS9aArFH0TQXK8Z7fa11rfmPDT6w=; b=KvcBv6A+Uy7AMdg4BhH7pcLsJE
	ocaXbPnlXiUAXejCEZVFTu/X2gY5RMawBku3uZX7NPLFbtWKm4FFC2KyDq3GbgAz2LrYCxWCHq6pn
	JkxDUTBdHp8UI8zHFVn/SMd12GDhOPlaV+CJnYf+ynuScT6fNQUl3HeGS3NO9Dr0kFqamLEQlbC1a
	mRLpKlifNZw4mKbYWktkcUECzVqxYVWK+sgoZSJDEad9uwpDhw26Wa4sBmuKWmqOvFTNxhW59LMwT
	7PLSKyyHd+kYp9f6QIjYXWeymnDklthnlcSlpYO/cPVgr5k/ROD7VJZs6aE//+bCEY1SZnqMFXCeo
	1uiggE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfVeP-003GBc-Pp; Tue, 26 Oct 2021 23:14:37 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfVeM-003GBG-Eh
 for linux-riscv@lists.infradead.org; Tue, 26 Oct 2021 23:14:36 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so3603932pje.0
 for <linux-riscv@lists.infradead.org>; Tue, 26 Oct 2021 16:14:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=YoLCSQO9QTxO8VgrJDJFsaTeAWBv3H4ELPKub3yUX88=;
 b=aj+y5IDe17qTtSyOKJzzi1zsB6u344XtNI8EjKBIqb8uB69f1QbWVQdzq4O98f9/Wu
 YK4laQHejTgHPykv1m7sTvplj5OFCBGWEJBPDqtq9cym82zB946lJiJd6rjr+Nqobnyx
 0PcLzHrS3RflJghP+2x04eQxKvfSneRq0Hd3ElBaje4ZEB/eQ6YSYobsAIg6b4WSVy0G
 Mi5Mybs2nbv5K31/20MgY8Q1q/7ee32iGcpPn96Z/Bvhcubsdqo6GL6gTn3PfSmttPwP
 E6u9azbbcZMcFZR9dk2zjNaxfHvzIIulFpa/U+CcPNGtitwSTVTF6cjw0Nfg3kilJyOf
 ACdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=YoLCSQO9QTxO8VgrJDJFsaTeAWBv3H4ELPKub3yUX88=;
 b=fNE5e1DjnzQC2kM3I94MzR/yj9iELYLChJs338Ux6RWXfLQQEwIrOzotRJ4j0SBE/O
 Asm1tD/JNgXVEgPbEpUS6SE+z14BLNbrrXQp2Lx/3fcQYDyd2B4tLbLbCXbm1zyIafQC
 VMkMinHqGVeDfZ02UcxrWeRgiTN6F1XBeyqa0tZEXUnVv+4sesSzGL2XdwGxu9Jt0ali
 M33qpj+Cww7hLJxYikvEFy4Fjlc6TOzwTqQVJIS1hDeiVZINhgrUoKrBTm+7MFAv2L+v
 vJsW2L70iEkz/4sWwvNOmo3hOD12jTe1/zFPlrLvWDL+o/08WYkgut9tJZaUrqmOln5W
 j9ug==
X-Gm-Message-State: AOAM532lEqIS23qxGzQeOqikCViO4su8OU5dDY+4/jMc2de7jGKC3EVI
 k6Mc3t7EYlkFPAXN0p49EerGTh9fnibTmA==
X-Google-Smtp-Source: ABdhPJxZo/Lc+uNsmy4CJjZc5bNkRzZMIpzOmwkbRIcSAeTQDBrbiH2BpwkXBFcz4cyYhLhoViY9pw==
X-Received: by 2002:a17:903:244d:b0:141:47f5:6ed6 with SMTP id
 l13-20020a170903244d00b0014147f56ed6mr8983865pls.16.1635290068437; 
 Tue, 26 Oct 2021 16:14:28 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:676c:ab93:f48d:23ae])
 by smtp.gmail.com with ESMTPSA id m28sm20631013pgl.9.2021.10.26.16.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:14:27 -0700 (PDT)
Date: Tue, 26 Oct 2021 16:14:27 -0700 (PDT)
X-Google-Original-Date: Tue, 26 Oct 2021 16:11:40 PDT (-0700)
Subject: Re: [PATCH] riscv/vdso: Drop unneeded part due to merge issue
In-Reply-To: <20211011110559.72892-1-wangkefeng.wang@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, tongtiangen@huawei.com,
 wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: wangkefeng.wang@huawei.com
Message-ID: <mhng-988847ae-0fe0-4f29-805f-d36b406ba704@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211026_161434_542600_28B2500B 
X-CRM114-Status: GOOD (  16.78  )
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

On Mon, 11 Oct 2021 04:05:59 PDT (-0700), wangkefeng.wang@huawei.com wrote:
> It seems that something is wrong when patch "riscv/vdso:
> Refactor asm/vdso.h" is mereged.
>
> Let's fix the merge issue.
>
> Fixes: bb4a23c994ae ("riscv/vdso: Refactor asm/vdso.h")
> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> ---
>  arch/riscv/include/asm/vdso.h | 11 -----------
>  1 file changed, 11 deletions(-)
>
> diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
> index 208e31bc5d1c..3e295212d746 100644
> --- a/arch/riscv/include/asm/vdso.h
> +++ b/arch/riscv/include/asm/vdso.h
> @@ -8,14 +8,6 @@
>  #ifndef _ASM_RISCV_VDSO_H
>  #define _ASM_RISCV_VDSO_H
>
> -
> -/*
> - * All systems with an MMU have a VDSO, but systems without an MMU don't
> - * support shared libraries and therefor don't have one.
> - */
> -#ifdef CONFIG_MMU
> -
> -#include <linux/types.h>
>  /*
>   * All systems with an MMU have a VDSO, but systems without an MMU don't
>   * support shared libraries and therefor don't have one.
> @@ -29,9 +21,6 @@
>
>  #define VDSO_SYMBOL(base, name)							\
>  	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
> -
> -#endif /* CONFIG_MMU */
> -
>  #endif /* !__ASSEMBLY__ */
>
>  #endif /* CONFIG_MMU */

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
