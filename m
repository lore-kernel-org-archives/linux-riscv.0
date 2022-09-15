Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F6EC32771
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 18:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=cG63ivYcE9r7Undzj7xGPHg54rJC9yiXKj6uwnj3OC8=; b=imSoZftqZfvWXNN2nP0v4Vvbik
	chMleOYr0foAtiPGDO+o/CaF8NdT1Tu3g9fitxvwGBBBnRVBPfxen6IhKE/NWjCCcgVshX1ZL+64C
	/1NpZwzWyS5rEUEof20XxsMvMKb83529V7mF8pUCY5x7my1mgOYoz0igoVbsBK5CV7vmVwkOGjsGR
	/8t848Lap9PUCM8zSuTI0SbCiBi2DbjbGTmom+xFCaIDdJrTzo276Ur4LFQ+5mx4Hv1uawDRyKdhN
	EbZ5u2Z58sF2PGtb0WiKhJ7NsWtOWDTPH2qQzxmK3hjb7nag9fJwx4HznftnvqO/N6fbo4sdtRFnA
	xi58a0uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtuK-00Fhi4-6z; Thu, 15 Sep 2022 18:48:16 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYtuG-00Fhgg-F4
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 18:48:14 +0000
Received: by mail-pl1-x632.google.com with SMTP id s18so13254688plr.4
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 11:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=4V4RnQIqXfObgERFxnXO9I4wxN/7f6punHSf5ZIJLT4=;
        b=kEU2PZdbKL5Q4rNVJReJDPmAkSzXWOnQac5Qkc/oC3r76O30/K3sa0VN5xLZKbl6NY
         U0qr8f/9292y72fzItvB828icVflSNIevAEgyXdof/IrWnT7rzOk5TYHolCjji2/ViwQ
         NC5Sa2BDIlML5YVLOPh/cupHrLBS8ArzWAeROg+BB2G1KM3vgC5Hh6jXYVY52soT6EeO
         lEqDYJwYk0+3gcjPjnxm20orMM7zwuhFU3anaK2YhEGgqMnVdTr7h18mp1ANf+F5xk/n
         m0OWYCeCSD8P+KPUYj9K0VEJe1DF3yFhCGXXq0l4Plhyu9tbQFIUHycZfILo/qXngNwB
         M+5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=4V4RnQIqXfObgERFxnXO9I4wxN/7f6punHSf5ZIJLT4=;
        b=SfWPqMFUYlq8WL38GtPOaljVAPoMlaIRUxMvjSiZSg8slJT+yKq1a/6iQbwsSis3cW
         giaKRR8nyhBhZ50fVC833hcXJh14E8jioDnIra5D843wrhP/Gbc8S3Z7GsXDgyDLvm7E
         IZ7QE6TWLcUnXomBnTWoneTaWpSx7XtDgPf3FdhY9ffSbL6ZPdSS2UDrkOl+um31fFeS
         8egC6AauxFHnhfn698S88QQzrfPmRx8DlGXXDCdvfDjXpcp5s7fXjJrMwAeHqlveogCj
         MMbGgUvWdHcVp0sP7ymaYMJ0hXPGmhzU/5YNNxmOJEUUAmUk3UUxuCj46ubJogjRVcfg
         aC7g==
X-Gm-Message-State: ACrzQf1NhHQuirYVZ6iazm+Zd/gZ595MJLnxlTJQUaMqyPSkdc9O2uOP
	WEk25LTCdreyd+3wsJa8KymGgA==
X-Google-Smtp-Source: AMsMyM4MPo5iwnt9/uyZUkOEyDODYfwFPfvtZhgVldwit6OvWYiICMAApi9FjrsDpUuDakbUev1f+g==
X-Received: by 2002:a17:903:41c8:b0:178:3128:b58a with SMTP id u8-20020a17090341c800b001783128b58amr817759ple.118.1663267690635;
        Thu, 15 Sep 2022 11:48:10 -0700 (PDT)
Received: from localhost ([172.58.176.196])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902bcc400b00177ee563b6dsm13278432pls.33.2022.09.15.11.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 11:48:10 -0700 (PDT)
Date: Thu, 15 Sep 2022 11:48:10 -0700 (PDT)
X-Google-Original-Date: Thu, 15 Sep 2022 11:14:55 PDT (-0700)
Subject: Re: [PATCH] riscv: fix RISCV_ISA_SVPBMT kconfig dependency warning
In-Reply-To: <3122575.5fSG56mABF@phil>
CC: linux-kernel@vger.kernel.org, rdunlap@infradead.org, rdunlap@infradead.org,
  wefu@redhat.com, liush@allwinnertech.com, guoren@kernel.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: heiko@sntech.de
Message-ID: <mhng-9664ec71-ee9f-49ac-8bea-0c36a574f60a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_114812_744032_EDF13D97 
X-CRM114-Status: GOOD (  16.57  )
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

On Tue, 13 Sep 2022 05:00:08 PDT (-0700), heiko@sntech.de wrote:
> Hi Palmer,
>
> Am Samstag, 9. Juli 2022, 03:49:29 CEST schrieb Randy Dunlap:
>> RISCV_ISA_SVPBMT selects RISCV_ALTERNATIVE which depends on !XIP_KERNEL.
>> Therefore RISCV_ISA_SVPBMT should also depend on !XIP_KERNEL so
>> quieten this kconfig warning:
>>
>> WARNING: unmet direct dependencies detected for RISCV_ALTERNATIVE
>>   Depends on [n]: !XIP_KERNEL [=y]
>>   Selected by [y]:
>>   - RISCV_ISA_SVPBMT [=y] && 64BIT [=y] && MMU [=y]
>>
>> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>
> I think this should also be applied as fix?

Thanks, the original seems to have gotten lost somewhere but I've picked 
this up from lore.

>
> Thanks
> Heiko
>
>
>> Cc: Wei Fu <wefu@redhat.com>
>> Cc: Liu Shaohua <liush@allwinnertech.com>
>> Cc: Guo Ren <guoren@kernel.org>
>> Cc: Heiko Stuebner <heiko@sntech.de>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> ---
>>  arch/riscv/Kconfig |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -362,6 +362,7 @@ config RISCV_ISA_C
>>  config RISCV_ISA_SVPBMT
>>  	bool "SVPBMT extension support"
>>  	depends on 64BIT && MMU
>> +	depends on !XIP_KERNEL
>>  	select RISCV_ALTERNATIVE
>>  	default y
>>  	help
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
