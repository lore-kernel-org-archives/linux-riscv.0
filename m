Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DD8C433EF
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jan 2022 18:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZA4j7KNGpt582TfawFgDAl2DnwVc1sZU8uM1iDWVDYs=; b=BO4596OaWZSZX4XV/zscXThwst
	hUN4q6/GLtKOYB+AuSQrevob4Vq/2vfZJD2boMT8PdksWrdSbNZlxFdpdprd437hA4154fsB9nqdr
	tmOeNlzDFWKwVHvlid1X8BUQALrPhG4pgxuaSA21narv8D1/AmzzBFqniXyoz2AfYkXu22b3KgLEU
	fLkhr9ng0IR/vmcfWdIJieL2PWLQ5FIlXumoKfj2bKr+2f1VMKqpQu3XEmAg6AXcjEevlzvYPX8uq
	T6Wq4BSr5tUfOVWaFAk90dwCyBKfiDR6YZqlHJeys9ydRiS6cxCI0X/OIlBF6o+aqZrQP0djC757V
	iuJdzHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5X5N-000v09-L8; Thu, 06 Jan 2022 18:02:01 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5X5K-000uxg-RP
 for linux-riscv@lists.infradead.org; Thu, 06 Jan 2022 18:02:00 +0000
Received: by mail-pl1-x62f.google.com with SMTP id i6so3057084pla.0
 for <linux-riscv@lists.infradead.org>; Thu, 06 Jan 2022 10:01:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=4zcOQ9tOzM//Yk7TQGq7eHYDGBLmCAFxO9dcr6dZd90=;
 b=DIZgxcXzw8eHu0c1FCLZmjbgNvWxxUXm9ereYtae3do2ZAGBOv2V7qCYgdcDo8kmlV
 Pe4ZKLQbFBbBqzBiiIKQE+w844eEmWE89Mj4juZdQh059BCUnn3l7hDr8eRSAYJwlxXT
 ALtjbBUhflR46FuhAqzZfY6rSmwb4JVKMNKOtXvaMFiVor8tfr/z0RZHE1xKEz2R74Yj
 x70Gsb8XVjzPSu9Dv2X2pkAJDxs8RT9ZEU9ZUbJFOaVlEcKR+OcuxEIjtmu55cyz/wQW
 mlPD2alf4zDT6WWYmZM9E2NXWhFGl9UwlKn11e8IK70k0zQ98WBJPMf5Y4gDr8ysTB/k
 SVBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=4zcOQ9tOzM//Yk7TQGq7eHYDGBLmCAFxO9dcr6dZd90=;
 b=LJ6m3eBEwufNCfeT39I+Tfvn5IYnJuZgaVmhajbVCaaJmyy+sGf08aDWP/UlubScGc
 YlpzQ+ryepXfvsvUFIQ0l3FoX5cGQN4E4tq80XYCOsAJwYyuStYPdn2kZqbbNdBYw0qu
 moPXTcVU0fYmaV/YXC9VtZ9XrRITf1R7KsNTrCNWjfPsGSSSKfcoNK/T+ciiiIarNqeM
 GxG6UBOQPWtiYfsLuOnROlCSH3R05jrWhAkX2Zj+rY7tL/hC4UWThNLkxspn2RYi80qv
 0xe10QQH9e5shGYvFUs22Ot15zVWvL2EM0WozD6rdGJMJOYbRV0pZB35a9HVBefu1FkN
 eChw==
X-Gm-Message-State: AOAM532qdS7xXG82i2F9br8ujhl//oK/DLdSHlxPOYAs8wOHss+NiOvQ
 UbQ+rR6z+2wW3Is2goEAWGnk2PjUrpVLiA==
X-Google-Smtp-Source: ABdhPJwxRgBsmYz4yEwedUABJs7D0bB9QxHddTM6iDuTsAaHUHBx9dOLYOQX/OiNZqx1wfnABsvJVw==
X-Received: by 2002:a17:902:7442:b0:149:7a3f:3899 with SMTP id
 e2-20020a170902744200b001497a3f3899mr49389317plt.90.1641492116369; 
 Thu, 06 Jan 2022 10:01:56 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id gm9sm3034133pjb.25.2022.01.06.10.01.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 10:01:55 -0800 (PST)
Date: Thu, 06 Jan 2022 10:01:55 -0800 (PST)
X-Google-Original-Date: Thu, 06 Jan 2022 10:01:24 PST (-0800)
Subject: Re: [PATCH 12/12] RISC-V: defconfigs: Remove redundant K210 DT source
In-Reply-To: <DM6PR04MB70816CBD9FFA383FEE8DDC67E79E9@DM6PR04MB7081.namprd04.prod.outlook.com>
CC: linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 aou@eecs.berkeley.edu, anup@brainfault.org,
 heinrich.schuchardt@canonical.com, 
 Atish Patra <atishp@rivosinc.com>, bin.meng@windriver.com,
 sagar.kadam@sifive.com, axboe@kernel.dk, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Damien.LeMoal@wdc.com
Message-ID: <mhng-40969d90-76cb-4b9b-9c39-32dbd0f9a7ea@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_100158_996857_D3B0976E 
X-CRM114-Status: GOOD (  17.01  )
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

On Sun, 21 Nov 2021 15:41:18 PST (-0800), Damien.LeMoal@wdc.com wrote:
>> On 2021/11/20 1:45, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> The "k210_generic" DT has been the default in Kconfig since 7d96729a9e7
>> ("riscv: Update Canaan Kendryte K210 device tree"), so drop it from the
>> defconfigs to avoid diff with savedefconfig.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>>  2 files changed, 2 deletions(-)
>> 
>> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
>> index 89ab76349ea8..e8ceab678e8b 100644
>> --- a/arch/riscv/configs/nommu_k210_defconfig
>> +++ b/arch/riscv/configs/nommu_k210_defconfig
>> @@ -29,7 +29,6 @@ CONFIG_EMBEDDED=y
>>  CONFIG_SLOB=y
>>  # CONFIG_MMU is not set
>>  CONFIG_SOC_CANAAN=y
>> -CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
>>  CONFIG_MAXPHYSMEM_2GB=y
>>  CONFIG_SMP=y
>>  CONFIG_NR_CPUS=2
>> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> index 84b87f8bfc8f..46aa3879f19c 100644
>> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> @@ -21,7 +21,6 @@ CONFIG_EMBEDDED=y
>>  CONFIG_SLOB=y
>>  # CONFIG_MMU is not set
>>  CONFIG_SOC_CANAAN=y
>> -CONFIG_SOC_CANAAN_K210_DTB_SOURCE="k210_generic"
>>  CONFIG_MAXPHYSMEM_2GB=y
>>  CONFIG_SMP=y
>>  CONFIG_NR_CPUS=2
>> 
>
> Then maybe also delete the arch/riscv/boot/dts/canaan/k210_generic.dts file too
> ? It is redundant now that it is not being referenced...

IIUC that's the opposite of what's going on here.  Looks like I somehow 
managed to get the commit wrong, which I've fixed, it's 67d96729a9e7 
("riscv: Update Canaan Kendryte K210 device tree")  That contains

    diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
    index 6402746c68f3..7efcece8896c 100644
    --- a/arch/riscv/Kconfig.socs
    +++ b/arch/riscv/Kconfig.socs
    @@ -51,7 +51,7 @@ config SOC_CANAAN_K210_DTB_SOURCE
            string "Source file for the Canaan Kendryte K210 builtin DTB"
            depends on SOC_CANAAN
            depends on SOC_CANAAN_K210_DTB_BUILTIN
    -       default "k210"
    +       default "k210_generic"
            help
              Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
              for the DTS file that will be used to produce the DTB linked into the

which makes the defconfig entry redundant but still references the DT 
file.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
