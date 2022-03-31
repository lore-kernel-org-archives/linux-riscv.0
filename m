Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E706C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 31 Mar 2022 02:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=P+nmtgaKg2oYGyPNYhTgMWr0OgDhIwk6cp6oNQjXihE=; b=uUEMS2EXFsCXeNEwEyQqPddvU9
	72qlKtM3dreeZKOme2sBW2xslhDa8wHcnlQMVs6D+Vs1zCSHvJTb3lPJcstVMsvzkFaQ5GE+C/+97
	rIpzjFfp5rkfJPkz2O/UYK3sZTZJYERRcr58Os8u6tNssdaizXH5ZdG1rf0z83zKYkGDhMYPKVXdK
	5WgxelI4135Yalt7UMpuqTi8DU+QuPM3VZ44xnRvZy47oC3fBrFcdyiSUO/MgJVnx6DjgzMbhWg4o
	ArN+yEaARr34gRsyDXdtpzaWz3Vf++rZWmJwvbuJzgdIWK7Q3oQuZqvnumC5+9lgyguRtpqpzEvTD
	omr5rnog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZkMO-000HaM-Rl; Thu, 31 Mar 2022 02:16:28 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZkML-000Ha2-6A
 for linux-riscv@lists.infradead.org; Thu, 31 Mar 2022 02:16:26 +0000
Received: by mail-pj1-x1030.google.com with SMTP id gb19so22655054pjb.1
 for <linux-riscv@lists.infradead.org>; Wed, 30 Mar 2022 19:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/Wq8pDzbR7CUsnr4sdt91dwx6hh1W9+nP/weoDPwRHk=;
 b=ALRpTGH8SD7ag77B6dbqoLafs6OdKxiQbdVsqhuEw9qFf/oYaqv3HxQQRWhAIx1Dt9
 ftKdvsgia6lDm13mxCIeU9dTjRm3SWTgcyGq78N9SFHvf6VtE6sJHDSzKI8oE1G8D0TG
 9g7k7owgDo/5TxT1mHfelbks5a1bJ+UosjTKY09AGVjljM3XcosaDvjGqUayor2RdN/u
 c/4YsRMc/lRyOq2JlbWey6W/SXDQ8SDh3+sX9OBgMBghK2Gw0+yiC9LGeg8vST5xbaYe
 dUytlP3/TKOsU3bkow7XUT318kNwCmMeW7gPyXg1SPwBQr4KX+15TB+yUC9pCeOMibTi
 taYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/Wq8pDzbR7CUsnr4sdt91dwx6hh1W9+nP/weoDPwRHk=;
 b=i8CDYWoJT4nM7UhWOW4DgFCa/gtToc3T1CZEBTxjooRbhg63SfLC93LwfgbrBQeaKF
 R0YL1Mw/FSFdAs/6ZaCOP2AeuHFfaAe+r7PxtcQYErNrVf7U/AuWM9L9FRGPbh99hjn7
 jftTSz43N+uK41oorwBBJqz6ajTT4QD08FUPFXhSIcs6FfEVoW3+4p6rC1VFsDjWlaew
 1Gwios1TdKuv6Sq/G0PpiMBtoJye+DjzK4om/nSmGFNU6oqjyGwAFjE4EkCqxPiYyK7g
 3opw4Z+aGN1EIGlfeTeyEzWu400afP7kPN8E+9KVigaCxFrS4I65rrhP69sxofF1+RiH
 f5gA==
X-Gm-Message-State: AOAM530/L2cqHqENioKYZdH018NCD0r3zQbBJ6oR5iu8uxGRaH3r39aE
 aEZJoYB4atmNJxb7cwqQGaDYdMLhjZi9RA==
X-Google-Smtp-Source: ABdhPJwoWJyLQ6QPp5H5+Zi0bn4XlidZVPYpOFyufA+MeJTtbd6qNo/vK9YqdyQGm6YZAjsao2QpsA==
X-Received: by 2002:a17:903:2c5:b0:14f:4a29:1f64 with SMTP id
 s5-20020a17090302c500b0014f4a291f64mr3022071plk.90.1648692982901; 
 Wed, 30 Mar 2022 19:16:22 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 d24-20020a637358000000b003823aefde04sm20680836pgn.86.2022.03.30.19.16.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 19:16:22 -0700 (PDT)
Date: Wed, 30 Mar 2022 19:16:22 -0700 (PDT)
X-Google-Original-Date: Wed, 30 Mar 2022 19:16:20 PDT (-0700)
Subject: Re: [PATCH 2/3] RISC-V: K210 defconfigs: Drop redundant MEMBARRIER=n
In-Reply-To: <d8a35bea-f4a0-b54d-9d2a-d1cc9b3d3e53@opensource.wdc.com>
CC: linux-riscv@lists.infradead.org, Niklas.Cassel@wdc.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 anup@brainfault.org, heinrich.schuchardt@canonical.com, 
 atishp@atishpatra.org, mchitale@ventanamicro.com, alexandre.ghiti@canonical.com,
 axboe@kernel.dk, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: damien.lemoal@opensource.wdc.com
Message-ID: <mhng-5bb87384-f841-4793-8f1a-fabd5c13a181@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220330_191625_306151_682ED7F2 
X-CRM114-Status: GOOD (  23.35  )
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

On Wed, 30 Mar 2022 17:26:45 PDT (-0700), damien.lemoal@opensource.wdc.com wrote:
> On 3/31/22 08:47, Palmer Dabbelt wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> As of 93917ad50972 ("RISC-V: Add support for restartable sequence") we
>> have support for restartable sequences, which default to enabled.  These
>> select MEMBARRIER, so disabling it is now redundant.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> ---
>>
>> I'm not actually sure this is the right way to go: presumably the K210
>> defconfigs had MEMBARRIER=n for a reason (maybe just size?), so we might
>> actually want to move to RSEQ=n instead?  As usual: I don't test on the
>> K210, so I'm not exactly sure what the constraints are.
>
> Not sure either. It is like this now because I think this was the default
> at the time the config was created.
>
> Niklas,
>
> Can you test this please ?

Thanks.  I'm OK either way, I guess I'd learn towards turning on the 
features if they work/fit.  I'll hold off on merging this one for a bit, 
I don't see any rush (it's just a defconfig) and if what was there is 
broken then we can take it as a fix.  Otherwise it'll just get rolled up 
into the next round of these, which I'll hopefully remember to do 
earlier next time.

>
>> ---
>>  arch/riscv/configs/nommu_k210_defconfig        | 1 -
>>  arch/riscv/configs/nommu_k210_sdcard_defconfig | 1 -
>>  arch/riscv/configs/nommu_virt_defconfig        | 1 -
>>  3 files changed, 3 deletions(-)
>>
>> diff --git a/arch/riscv/configs/nommu_k210_defconfig b/arch/riscv/configs/nommu_k210_defconfig
>> index 3f42ed87dde8..2438fa39f8ae 100644
>> --- a/arch/riscv/configs/nommu_k210_defconfig
>> +++ b/arch/riscv/configs/nommu_k210_defconfig
>> @@ -21,7 +21,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>>  # CONFIG_AIO is not set
>>  # CONFIG_IO_URING is not set
>>  # CONFIG_ADVISE_SYSCALLS is not set
>> -# CONFIG_MEMBARRIER is not set
>>  # CONFIG_KALLSYMS is not set
>>  CONFIG_EMBEDDED=y
>>  # CONFIG_VM_EVENT_COUNTERS is not set
>> diff --git a/arch/riscv/configs/nommu_k210_sdcard_defconfig b/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> index af64b95e88cc..9a133e63ae5b 100644
>> --- a/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> +++ b/arch/riscv/configs/nommu_k210_sdcard_defconfig
>> @@ -13,7 +13,6 @@ CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>>  # CONFIG_AIO is not set
>>  # CONFIG_IO_URING is not set
>>  # CONFIG_ADVISE_SYSCALLS is not set
>> -# CONFIG_MEMBARRIER is not set
>>  # CONFIG_KALLSYMS is not set
>>  CONFIG_EMBEDDED=y
>>  # CONFIG_VM_EVENT_COUNTERS is not set
>> diff --git a/arch/riscv/configs/nommu_virt_defconfig b/arch/riscv/configs/nommu_virt_defconfig
>> index e1c9864b6237..5269fbb6b4fc 100644
>> --- a/arch/riscv/configs/nommu_virt_defconfig
>> +++ b/arch/riscv/configs/nommu_virt_defconfig
>> @@ -19,7 +19,6 @@ CONFIG_EXPERT=y
>>  # CONFIG_AIO is not set
>>  # CONFIG_IO_URING is not set
>>  # CONFIG_ADVISE_SYSCALLS is not set
>> -# CONFIG_MEMBARRIER is not set
>>  # CONFIG_KALLSYMS is not set
>>  # CONFIG_VM_EVENT_COUNTERS is not set
>>  # CONFIG_COMPAT_BRK is not set

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
