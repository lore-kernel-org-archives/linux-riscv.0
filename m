Return-Path: <SRS0=q/zc=LH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2434EC48BCF
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:24:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4A0A61179
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Jun 2021 00:24:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D4A0A61179
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AHAV4v9WEyHygVIwuxyTLzZxn+LO2YEwi207NGHAWdA=; b=QoL0LMLt7Xp0ASE7nwqubx9ghI
	u4fij37TyLy0uNC1EDJetmk4Yvb7OvarS99mBGgBINIRgmfT1Po++dS5pkbydN+bWIX8hcOM9MMAY
	IuoxHv1k/gGbz9wpcKhMoDR1TrzC4h6irKEUyKM5HsSqGobuEmNRqkUQhUhAVC4UHI3wtzQw9iy/M
	vKDN5UaEXPXfgwC2ISyx4BiYw80X0ws6wXsOK+5kkDECOG5QfQ70sqD6EdxTqJ5vwfNtRgrB/ktg9
	buvukhVJ4IdfYuSgGTABM0StsZPUgfI9RXxgd9Sojx/iNkql+z/9Ye5/WKg+RRXIbbPomC2IkoAjK
	Fm6u5n1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsDuu-009MPq-TP; Sun, 13 Jun 2021 00:23:56 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsDup-009MOM-0j
 for linux-riscv@lists.infradead.org; Sun, 13 Jun 2021 00:23:55 +0000
Received: by mail-pl1-x630.google.com with SMTP id v12so4687141plo.10
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 17:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=5amvrsViKZuGN7n8MYso1FmYMeenemrS2FHjrjmgxgw=;
 b=LVxiWpFqsZQyn+ZZ8DtF4P3rlEEooBLEsmGsY8djPXWNMJGBmz+8iDaxg855pyRCbu
 ssiTF5vTS9KYsK60OZSUk5EbXgQubqwCBF4p+HC9vnlJ+z1932lkLlVyI9t/HA9t7ygO
 JC/rZ0zJetBkWh+DPmPUDJkxM6cKH00i4DLj7BWWdOBtzNtMqcP3dXyd2HcIDAn0Zf3q
 uKxA6a5LWwSOUVIIJF+d3tIeLKNbGwXfrftgpGtlTZJhaUj5k9sATXrTLKFayw0rI0sh
 xLHZWVDlfZEKG0eiRjqEUoR2Ofy1V/JZvl8+3Ruy16FvX50RpS8aHpfvz/t4971caoPn
 pngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=5amvrsViKZuGN7n8MYso1FmYMeenemrS2FHjrjmgxgw=;
 b=Xf2Z9Sg0OLzf2Oj3y0nvSpuRjavRHiSHoD7/CVkUZkzghhR1GO7/IjaQrzwdxjf4RB
 B6heTPWyfp4giYmJ5vVPdPsalZ3ArfmK6azkVox9mefow633zW70/ic4E3jyxUA6iaKm
 tyVyrkBnY80ad7HncHZIJh9+WWUncxXR4B5/TEJU6Y8Ksl4UJRuWvJhJxg0U4NB+6qHp
 kD6ypoqNUrRqz2RES3nHdkx/xZogKNr+skNayEM7mDqOwuYg2TQFVx6JyvZXtppAGy6D
 7XOIowtyHzXdTdd/9KrRCvf9LQW1dvzkxNAmbSLx+/kuE5G82FdOcaJnQHdILtw26i74
 ivSA==
X-Gm-Message-State: AOAM5333TIhTxyv3mD5TUX1z3Rqs1uUyJuZN52a+NKvtQ6r3ZuBYyEhc
 JlbYv9mF78k+6FEHVgz6jHUQJQ==
X-Google-Smtp-Source: ABdhPJzRQrHT40bjCMJ69QxNRzUQZLrP2Iu9OYdXSxgic0MfNLCBfARHdCvStibiOAc+ewjHe09v9w==
X-Received: by 2002:a17:90a:901:: with SMTP id
 n1mr16032744pjn.44.1623543830099; 
 Sat, 12 Jun 2021 17:23:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b21sm6063221pgj.74.2021.06.12.17.23.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 17:23:49 -0700 (PDT)
Date: Sat, 12 Jun 2021 17:23:49 -0700 (PDT)
X-Google-Original-Date: Sat, 12 Jun 2021 17:16:18 PDT (-0700)
Subject: Re: [PATCH] riscv: sifive: fix Kconfig errata warning
In-Reply-To: <990a9263-dc33-e616-12eb-173e6872c93a@infradead.org>
CC: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: rdunlap@infradead.org
Message-ID: <mhng-2f2cd07e-8780-45cd-89ac-db2f516b0204@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_172352_748194_58B0CFA2 
X-CRM114-Status: GOOD (  14.66  )
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

On Sun, 06 Jun 2021 16:46:15 PDT (-0700), rdunlap@infradead.org wrote:
> ping. anyone?
> thanks.

Sorry, I missed the original patch.  This is on fixes.

>
> On 5/22/21 2:20 PM, Randy Dunlap wrote:
>> The SOC_SIFIVE Kconfig entry unconditionally selects ERRATA_SIFIVE.
>> However, ERRATA_SIFIVE depends on RISCV_ERRATA_ALTERNATIVE, which is
>> not set, so SOC_SIFIVE should either depend on or select
>> RISCV_ERRATA_ALTERNATIVE. Use 'select' here to quieten the Kconfig
>> warning.
>>
>> WARNING: unmet direct dependencies detected for ERRATA_SIFIVE
>>   Depends on [n]: RISCV_ERRATA_ALTERNATIVE [=n]
>>   Selected by [y]:
>>   - SOC_SIFIVE [=y]
>>
>> Fixes: 1a0e5dbd3723 ("riscv: sifive: Add SiFive alternative ports")
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
>> Cc: Albert Ou <aou@eecs.berkeley.edu>
>> Cc: linux-riscv@lists.infradead.org
>> Cc: Vincent Chen <vincent.chen@sifive.com>
>> ---
>>  arch/riscv/Kconfig.socs |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> --- linux-next-20210521.orig/arch/riscv/Kconfig.socs
>> +++ linux-next-20210521/arch/riscv/Kconfig.socs
>> @@ -14,6 +14,7 @@ config SOC_SIFIVE
>>  	select CLK_SIFIVE
>>  	select CLK_SIFIVE_PRCI
>>  	select SIFIVE_PLIC
>> +	select RISCV_ERRATA_ALTERNATIVE
>>  	select ERRATA_SIFIVE
>>  	help
>>  	  This enables support for SiFive SoC platform hardware.
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
