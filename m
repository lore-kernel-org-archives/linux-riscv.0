Return-Path: <SRS0=3V4y=M6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7AEAC4338F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 16:37:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C13B6069E
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Aug 2021 16:37:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1C13B6069E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=TKfllvG7H/HOdlUhPz/t0+6AFhOGh3FErSgDmT3ZNb4=; b=3VY51mo3CtWKssxNbPB/Vwv+FV
	QI3f/d18YoGy4JRGmFXShqx+/vOpVNEpWcR+P/6/DEclhB2M3geIAXMyEEULPE2VbweFz9ewp0MGS
	j8ilzRDtroUCm0xD+sGvrmXOpx91zzw5QeNF6uT3j1j7p4Bb5TZ6aUVs+N9KjtZpwf3bavebkAe/G
	B0R+bGxvuzk2mpktEGvZee/lGeezBSBYRbdZLb8AhfKnLmH2j2h6+7QyEDkqesuJjooVCwHztR7E1
	lvjW8+96eZekDP3wj4ZNpOz93+b0W6NaWWR4tIEqB7royuteqvo1DODkxt6lgtFcAA9Km2vikcOxn
	t+Kt79Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mCPJb-00EyCV-G8; Sat, 07 Aug 2021 16:36:51 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mCPJX-00EyBo-HU
 for linux-riscv@lists.infradead.org; Sat, 07 Aug 2021 16:36:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d17so11453656plr.12
 for <linux-riscv@lists.infradead.org>; Sat, 07 Aug 2021 09:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4ySF7t3f9IXZ9xCWYkjQadycnruU0kjHVud70QqSUeE=;
 b=02sy5q+gMNcB1jVOaqvUWMAySDDMU725SZ9iyRDOqgbRqzbAULDiNwyuRgNnh6R5UJ
 Na9nfm5QFDU8GS3x234s4z1+/KdtCQgkcaVWes+F3kVXw0moYOelkY2mJyxg6taIxx19
 AZOfhtim8SqpwH6PLmshrXaraHumMz6XDucxWJxg3MlbbGxFLcPkmjw0OvcTecWyQSRk
 D4GPOUB4adkzUHsqr41h7e4lEvwCXE2AEZ7X3Q7uqEVGr0MoK57KMZVntHISlk1rXCPe
 jx6KFOpvE/oG75RKrfX05/mJY4Vr76sqbBsiQ6CRcCp+SHw2LTxnqtNR7VeYXm3BWZre
 vCHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4ySF7t3f9IXZ9xCWYkjQadycnruU0kjHVud70QqSUeE=;
 b=C6pyGB8emdpP7vUH6htv8XR/K9F7Y1kglXczixAuwvaNbFMf2UqPv5z5Ueb7K9ah7E
 ats50EnG7uFQ4gxS3errFELSHZrUBclqnJYEk1arDz4/O42kc0CIaDJt4Aw1wbTen7/M
 WGRxQgLIsU0ksMQk5a1Iul9iHDaYLf3VSs4Xe7+yR1YLKQFLPk2heN1oaG1oFf40r6fw
 IYCLJAZPDmQJI7h7nz32z4cxeRb0ICQt/+C4JI3cddDS9HpHxx8ABQnB1toMTkEjV77P
 PVMOlmbGAr5JBKwkG58f9K+mlQhUPCdO82cEGJjpxd0PJnnuqbS3+uDTPVf2uCWuA2Zn
 yAcg==
X-Gm-Message-State: AOAM5315kvV53ngwVwPOnFaweWdtdQ/P0H4Dhap4wNgxKijGRSkLBUZs
 uqxhYS20XsPICJrL/JzKMP6Cjg==
X-Google-Smtp-Source: ABdhPJx1raKBqfmBr7+x9BmuR8aifXvMifS5f2Rv15DZIAwdpV5b8Kf3DA4pPAK5KJ5nMWIUlrwZWA==
X-Received: by 2002:a17:902:6904:b029:fb:42b6:e952 with SMTP id
 j4-20020a1709026904b02900fb42b6e952mr12653078plk.16.1628354201654; 
 Sat, 07 Aug 2021 09:36:41 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id x189sm16658823pfx.99.2021.08.07.09.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Aug 2021 09:36:41 -0700 (PDT)
Date: Sat, 07 Aug 2021 09:36:41 -0700 (PDT)
X-Google-Original-Date: Fri, 06 Aug 2021 22:37:17 PDT (-0700)
Subject: Re: [PATCH -fixes 3/3] riscv: Optimize kernel virtual address
 conversion macro
In-Reply-To: <20210721075937.696811-4-alex@ghiti.fr>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, alex@ghiti.fr
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alex@ghiti.fr
Message-ID: <mhng-163d949e-5efc-46d4-a5b7-c90e4745a7a3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210807_093647_626971_D40F10BC 
X-CRM114-Status: GOOD (  16.67  )
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

On Wed, 21 Jul 2021 00:59:37 PDT (-0700), alex@ghiti.fr wrote:
> The current test in kernel_mapping_va_to_pa only applies when
> CONFIG_XIP_KERNEL is set, so use IS_ENABLED to optimize this macro at
> compile-time in standard kernels that do not require this test.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
>  arch/riscv/include/asm/page.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index b0ca5058e7ae..10dc063868f6 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -123,7 +123,7 @@ extern phys_addr_t phys_ram_base;
>  #define linear_mapping_va_to_pa(x)	((unsigned long)(x) - kernel_map.va_pa_offset)
>  #define kernel_mapping_va_to_pa(y) ({						\
>  	unsigned long _y = y;							\
> -	(_y < kernel_map.virt_addr + XIP_OFFSET) ?					\
> +	(IS_ENABLED(CONFIG_XIP_KERNEL) && _y < kernel_map.virt_addr + XIP_OFFSET) ?	\
>  		((unsigned long)(_y) - kernel_map.va_kernel_xip_pa_offset) :		\
>  		((unsigned long)(_y) - kernel_map.va_kernel_pa_offset - XIP_OFFSET);	\
>  	})

IIUC this isn't actually a fix?  The other two are, though, so 
they're on fixes.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
