Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AD5CC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 23:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TqDjzwodxJLXV/5MHc2B9oPGJngUuzXbPwANPb10iOs=; b=Mxt0IW6rG1FlbFBNKPdCouu1NC
	LTFLUQUNxo4Vh3fYkzs3XXi+6dbFqqRtLF1xyT1GapHUlnXHqTEyALsmPzwd50vSpoEJZoBObLzbz
	eNVrM0MKc3gB+2ljc8jfeysIKuUVw23i1pU1NQFU/59v/l6l1gGt4JMxKpGJrUjjWVq2Qz6Ot1hpI
	QATBy416HpErEAcffrVt4JzylDNn8vG5kn7/CTMdiePStVBQ+tS1YF8a5lTS3v0h68KXecbGafax4
	RNIO1WKSD/h/+IYQ9ou6IvMeemz/vOVV9y5EBb/d8yXHU0bTkjkez3L+RKY5L+NNuvcQ7wPQqiUz/
	kcZF9C0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJl64-00HJCq-QL; Mon, 14 Feb 2022 23:49:32 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJl61-00HJBn-VN
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 23:49:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id i10so4133517plr.2
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 15:49:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GyZGTEHBo5D8EwjhOvRtD6BQCez2VkVTZwNRgtd0HSU=;
 b=UcNIqbaZcuM1KdO7qywwCle4/8NkbBx5t2AanIGbHhjHDZ4WxbVVpgVg08PbhrIw0V
 PkOwB5yKDjJexBEajf6reo1lb2Im/CvZFMLHMxqL/kFmMi1iCCHKxOXuwThQ7zESPvRL
 x0LYJGtpL3q9TKFJPLVjugGSIh8DSTRZJOfx4Etv3jpoQ2yFhw5s9xJKItJu1ktlTbbq
 KfeuK/wM0xNqeHq8fwtfL+J+dB1lHqKuzJWziUbmgIESW5aA8ebYcGBlsDlWVWXCdhev
 swdBxfHBWE01KGP+heyDM/SpPmX7bi+m4h5iiCO/Zf53sqbBqeMxU7htZcCKvMmXJtC8
 Ki8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GyZGTEHBo5D8EwjhOvRtD6BQCez2VkVTZwNRgtd0HSU=;
 b=gg3OGXIBJuG+pkPHrDHonBzpe3m1sG3KpPEdYIsdJ+dOO/15cUCpXOxYTJyP+BXiyG
 h09e/JRgIPGO/RXEfaoIiVLMyyx/xz7mLt5oK4Fc6W0lw3ocMNvHwOH5bvFxJPizUbHu
 a5gU6O+Soa8kJYHcHAYW8hFmm9fNwrxtqQe8fPzWqTP/pxHsWYA/ek5gCUs+SrfExyv/
 bluxgbe3ZbB9aH3wdsySwJR8Ntvwfjzs6c2ge1CmDoZ+NgrTCJe9O5sIRH+XZWLx+YZc
 L/zz5q8QYBeoroNVOpR9ZLTUZ6wDyxmFuC6aq5yvZHiyIY1cqWnkAM/48Gfu/I+jKGBq
 bYZQ==
X-Gm-Message-State: AOAM530XEuEUG+KIzWNZ7d2YSBUAO3oN84cFoXYDhMCNRGBppuINara3
 AKKK+B1MNPQEbyZZIJKMjxzD3Q==
X-Google-Smtp-Source: ABdhPJygPmJsBkq1gCtMbrwH0RAghVDJYLeuiOyFXUMDyKnMeZaO9UltK2YmW94SrCJ+nJTsXF2gYg==
X-Received: by 2002:a17:902:d3c6:: with SMTP id w6mr1405267plb.4.1644882568233; 
 Mon, 14 Feb 2022 15:49:28 -0800 (PST)
Received: from localhost ([12.3.194.138])
 by smtp.gmail.com with ESMTPSA id l22sm39388785pfc.191.2022.02.14.15.49.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 15:49:27 -0800 (PST)
Date: Mon, 14 Feb 2022 15:49:27 -0800 (PST)
X-Google-Original-Date: Mon, 14 Feb 2022 15:49:02 PST (-0800)
Subject: Re: [PATCH] riscv: mm: init: mark satp_mode __ro_after_init
In-Reply-To: <20220125160012.3884-1-jszhang@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: jszhang@kernel.org
Message-ID: <mhng-dc214a08-e4be-4459-a9e4-347ec084d02b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_154930_035007_31174F24 
X-CRM114-Status: GOOD (  15.64  )
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

On Tue, 25 Jan 2022 08:00:12 PST (-0800), jszhang@kernel.org wrote:
> satp_mode is never modified after init, so it can be marked as
> __ro_after_init.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/mm/init.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 8347d0fda8cd..35586688a1b6 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -38,9 +38,9 @@ EXPORT_SYMBOL(kernel_map);
>  #endif
>
>  #ifdef CONFIG_64BIT
> -u64 satp_mode = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_48 : SATP_MODE_39;
> +u64 satp_mode __ro_after_init = !IS_ENABLED(CONFIG_XIP_KERNEL) ? SATP_MODE_48 : SATP_MODE_39;
>  #else
> -u64 satp_mode = SATP_MODE_32;
> +u64 satp_mode __ro_after_init = SATP_MODE_32;
>  #endif
>  EXPORT_SYMBOL(satp_mode);

Thanks, this is on for-next.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
