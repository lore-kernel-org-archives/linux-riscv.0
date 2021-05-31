Return-Path: <SRS0=ZKx/=K2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B044C47082
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 12:25:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33DD0610C9
	for <linux-riscv@archiver.kernel.org>; Mon, 31 May 2021 12:25:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 33DD0610C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=monstr.eu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:Cc:To:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=abKla0QHHfp7P482S9Sxk3VmpZSYvJQDuIQ6IzGL1sw=; b=EEWzlL3IxLNaOnAGMrcB0EIBFf
	b8B3W1bVZNWCIDpZP2Ksi2VIOnik9/POwDI32ohse71WaraA6XVft8wsCKgwuwc1U1wNkzSDB7Wuk
	C6+2fuqhS7K2tKoBP/4ZHz/QUrgEGnkLrbY4+ifFQMfmVONw4HIZVcGuvnTS1fqPVZ2XiAwp+tZYD
	tmhyKd+EJVmaH+qzGjHcG3mwP8OwFVItUve51U5PkTjjM+m+DSXwMRSGy35a9sUw5aducca5n0mDa
	OQFRoPXdRPcx4RwMzvgc2tuvbHZwPKg6z2ZCAL9Fhaag1gpaDuX3XXlbtZtCyVVjVkbPRTKMY+Br7
	823LAAJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lngye-00C97u-6b; Mon, 31 May 2021 12:25:04 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lngyb-00C96j-VJ
 for linux-riscv@lists.infradead.org; Mon, 31 May 2021 12:25:03 +0000
Received: by mail-ej1-x633.google.com with SMTP id g20so956772ejt.0
 for <linux-riscv@lists.infradead.org>; Mon, 31 May 2021 05:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=monstr-eu.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FW9/91oXBy6Mao6g/WQyoqZ2VlX3RS8bSdK17yEcolU=;
 b=zeFMi410XXFAIk92KbRPsYvamk9jNcjSYzFyz8hyv0j66nyXqVGZ4aXT/Arsdk+n6b
 p+XBFg5deVkez/9/judkzj3agLMeWTzkV6E16U2qRIiwSAb5Qz55SwyoJ/duSxaPbJgL
 PAg6n4Bp9XFLgye5mUrLlElxVEVgDYhwqbrhTL8a55aS24pNLB81o4THCiSjgaEu3wZq
 /PDzRXmk95xZNY3BzOjI1fWPV6LhHoK0jwPSK//an3mA7QJK3RX3iVThcWyn42kRmnoV
 wcnYPsgQ8EmJIJHQaoCqAOoByUOvyldnoc76L4FNZ7VwBC0iF+Wu5ti9fDYIkB0Te8ON
 Cb2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FW9/91oXBy6Mao6g/WQyoqZ2VlX3RS8bSdK17yEcolU=;
 b=Xmbq/Vxm9TgBtRL9O1omlw5RkzXOZCtytRhtLiiuWJCWpxUIZgGDgEh2FvAH/C+r/W
 w9pEkFp3esKbzk1KDILiZj74MUGdzRPht2c5eI6K8oM1Xj8OtuAo4gCsBYSXmEyQPTNH
 56i9F1z+VhpidpaV6bfqbhxIs7mCWtKUAJOvFf0b9E4HoyjS80EMgANOS9BfvYZg8DyW
 FUTQZKTYvz90sLdz/2b5h4vl+LZpCQz8cuuJlycZBDLbPl3q5xAXGvj79tQlazUwQqT6
 xLriN2ViXPHZ7tAd/yJkOmwizruB4epACdw1a4jqxfriPnTAYkSut/qmuUwU5li8Wxdj
 9gHg==
X-Gm-Message-State: AOAM5303tz5KWyKfBhmim3BLE2/HImGwh5mlwQT+PXY5CEObadCSiE8r
 qVDl8jxpbPFJsas22y05Aa1yKw==
X-Google-Smtp-Source: ABdhPJyDYlmkSLP3gas8rRrq3uvFjJoPBY9aCf31K4xNc/54kq9YOxBqvPi2P0P04x4KlgfPdlQgsg==
X-Received: by 2002:a17:906:5d0c:: with SMTP id
 g12mr22408401ejt.447.1622463899056; 
 Mon, 31 May 2021 05:24:59 -0700 (PDT)
Received: from ?IPv6:2a02:768:2307:40d6::45a? ([2a02:768:2307:40d6::45a])
 by smtp.gmail.com with ESMTPSA id b22sm1235904eds.71.2021.05.31.05.24.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 05:24:58 -0700 (PDT)
Subject: Re: [PATCH V2 2/2] microblaze: Cleanup unused functions
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 arnd@arndb.de
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>
References: <1622350408-44875-1-git-send-email-guoren@kernel.org>
 <1622350408-44875-3-git-send-email-guoren@kernel.org>
From: Michal Simek <monstr@monstr.eu>
Message-ID: <73bf48c1-6692-795c-ba16-b7baeb11d3b9@monstr.eu>
Date: Mon, 31 May 2021 14:24:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <1622350408-44875-3-git-send-email-guoren@kernel.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_052502_041129_C88AE0EE 
X-CRM114-Status: GOOD (  19.36  )
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



On 5/30/21 6:53 AM, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> These functions haven't been used, so just remove them. The patch
> just uses grep to verify.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> ---
>  arch/microblaze/include/asm/page.h | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> index bf681f2..ce55097 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -35,9 +35,6 @@
>  
>  #define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
>  
> -#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
> -
>  /*
>   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
>   * it is set to the kernel start address (aligned on a page boundary).
> 

Ah ok. you have sent v2. Will take this version instead of previous one.

Thanks,
Michal

-- 
Michal Simek, Ing. (M.Eng), OpenPGP -> KeyID: FE3D1F91
w: www.monstr.eu p: +42-0-721842854
Maintainer of Linux kernel - Xilinx Microblaze
Maintainer of Linux kernel - Xilinx Zynq ARM and ZynqMP ARM64 SoCs
U-Boot custodian - Xilinx Microblaze/Zynq/ZynqMP/Versal SoCs


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
