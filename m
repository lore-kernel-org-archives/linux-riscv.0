Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76150C678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 18:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Fn6b1MFHs5VlXEOAx5q3uMkIjdXXz+yPi+pu8zq12AY=; b=RjUiRNCptQkEIlErHow7kFmPhG
	ayu3AE6xR3bpzN0YQNaQ37wPs8SO6FkoKii3uYkE5VqiD7d3gWWmqtrWN7oz+yLIsSQINpcCRH4Hm
	QGvZ9N7FVnBlMIw+L5rNT7gZH5x4yHcU5PFzeixKQVwjNOejIbt7kSSt/KY0I2PdpvU1ECUMdyXa3
	f4VROhNzpukIYIwgq5iaPoomi/syhhCmMqYUp/gTzlV54LiMLGzhDQPQa/e4RJKj/UUBfT064M1GS
	W0LUCEf3fnmTISChbQ1TsXX9bosMAgw6q/ArnMOyoZth2uk84GOMpskART+4L4t194Hh3Bmi0SM2l
	++QxM0lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcOp-0026j3-9A; Tue, 07 Mar 2023 18:50:59 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZcOl-0026hC-RD
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 18:50:58 +0000
Received: by mail-pj1-x1029.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso17496528pjb.2
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 10:50:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678215052;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YV91UFKcSojKpC96tEkEGNjW71iEWrflRBN+0ko3O0Y=;
        b=mFf3+peIlJU3T5L2qS9+by9n0OkHEJyLhtYntTbHMulYvPPi2sGkufgq7h8/whUkUF
         oObJGzLGbB8zK5jHI2hQypA1+6IqSKKl3Qd9/Sv8GZHybFLGoIkHiXJYOmeeFj+SjzVo
         5Ueq0noQSW0eYn7sEhdjTgPp8AJFgICJPKvYG35DvdNF/QpDv9wu1t2xE5nNtGD5oD9h
         JPFWV9B8lY+8DyDXBVP0HePPCjUNkkWgqbuqrm++/hqzOATfDMHrHIpGXFLQpfiyz1NM
         PBprnzY2BYXlJAUZgV/uVizzJTBK0bm2GAc4fXGImDcL0Zt1h/3PsWLBZHiu8r/1E0l3
         lM8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678215052;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YV91UFKcSojKpC96tEkEGNjW71iEWrflRBN+0ko3O0Y=;
        b=kLXf/9fn6O2/aB0ihsIviSmPkUZ75kSCNyvo+fvJCls9jY0kEOPqrlyx96BFistu9j
         N+EM8mcjvcEIK6v+qSuhwo1OrMc16NPWhcfDXLfPewlTLUponjUmp4TY/WH4Xp5gRc8+
         elpPuxx1+ywDwSUMOBCFWhEfI5bSw9BF7U6YnjNn4IGTnxFmflBe7LXcKJEl2VNGVdkY
         j/cBGQAjaL8872/jKwrwHp0M1g7iHcctsURJGd4Pj1eiXCiLWPSSDoo/lGQJWE7HUp4F
         Js7Hn2HPAYJmxiG1m1xDbCMV73iGnUbal1c/ct75oSSctzgtmpw7mckBtA3w4QnpLHvh
         3CFg==
X-Gm-Message-State: AO0yUKXmkjdFzYWjTLT/UQal+jCqgcS3EmBmwvifdasT6Uhu2YCyX/fJ
	2WnuacFgyqbI5epqaLh32vMbBc+E4583hAHalC8=
X-Google-Smtp-Source: AK7set9ZCL0TiXjwdJxlneSliRW1C5MLkvfsChgE18B+HepZ3OTuMRVwWaRLiNkJEL6WS1RJ5pHwxA==
X-Received: by 2002:a17:903:2288:b0:19a:9dab:3438 with SMTP id b8-20020a170903228800b0019a9dab3438mr15700297plh.2.1678215052504;
        Tue, 07 Mar 2023 10:50:52 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id c17-20020a170903235100b0019e76a99cdbsm8712405plh.243.2023.03.07.10.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 10:50:51 -0800 (PST)
Date: Tue, 07 Mar 2023 10:50:51 -0800 (PST)
X-Google-Original-Date: Mon, 06 Mar 2023 15:56:25 PST (-0800)
Subject: Re: [PATCH v2] RISC-V: Stop emitting attributes
In-Reply-To: <Y/fvRHUzFKy6ZS6i@spud>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-8140879e-de92-4208-8fe3-e03fff62ae78@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_105056_097135_A8723FF1 
X-CRM114-Status: GOOD (  21.54  )
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

On Thu, 23 Feb 2023 14:57:08 PST (-0800), Conor Dooley wrote:
> On Thu, Feb 23, 2023 at 02:46:05PM -0800, Palmer Dabbelt wrote:
>> The RISC-V ELF attributes don't contain any useful information.  New
>> toolchains ignore them, but they frequently trip up various older/mixed
>> toolchains.  So just turn them off.
>
> +cc: stable, yeah?

Ya, seems reasonable.  I'm putting it on fixes as well, so it gets 
backported ASAP.

>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Fixes the build for me w/ my awful config w/ gcc-13 + 2 different
> binutils versions:
> Tested-by: Conor Dooley <conor.dooley@microchip.com>
>
> I still see issues with llvm-17, LLVM=1 & ld-2.35 in both purgatory and
> regular modules:
>   LD      arch/riscv/purgatory/purgatory.ro
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: Invalid or unknown z ISA extension: 'zifencei'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/sha256.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: Invalid or unknown z ISA extension: 'zifencei'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/string.o
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: -march=rv64i2p0_m2p0_a2p0_c2p0_zicsr2p0_zifencei2p0: Invalid or unknown z ISA extension: 'zifencei'
> /stuff/toolchains/binutils-2.35/bin/riscv64-linux-gnu-ld: failed to merge target specific data of file arch/riscv/purgatory/ctype.o
> make[6]: *** [/stuff/linux/arch/riscv/purgatory/Makefile:95: arch/riscv/purgatory/purgatory.ro] Error 1
>
> So probably still need to pick up some variant of my series I posted
> earlier unfortunately:
> https://lore.kernel.org/linux-riscv/20230223220546.52879-1-conor@kernel.org/
>
> Thanks!
>
>> ---
>> Changes since v1 <20230223195112.10489-1-palmer@rivosinc.com/>:
>>
>> * Add the attributes to both KBUILD_CFLAGS and KBUILD_AFLAGS, so
>>   assembly files build without attributes.
>> * Set COMPAT_CFLAGS so the compat VDSO builds without attributes.
>> ---
>>  arch/riscv/Makefile                    | 7 +++++++
>>  arch/riscv/kernel/compat_vdso/Makefile | 4 ++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
>> index 76989561566b..7b53f0be56b2 100644
>> --- a/arch/riscv/Makefile
>> +++ b/arch/riscv/Makefile
>> @@ -81,6 +81,13 @@ ifeq ($(CONFIG_PERF_EVENTS),y)
>>          KBUILD_CFLAGS += -fno-omit-frame-pointer
>>  endif
>>
>> +# The RISC-V attributes frequently cause compatibility issues and provide no
>> +# information, so just turn them off.
>> +KBUILD_CFLAGS += $(call cc-option,-mno-riscv-attribute)
>> +KBUILD_AFLAGS += $(call cc-option,-mno-riscv-attribute)
>> +KBUILD_CFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
>> +KBUILD_AFLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
>> +
>>  KBUILD_CFLAGS_MODULE += $(call cc-option,-mno-relax)
>>  KBUILD_AFLAGS_MODULE += $(call as-option,-Wa$(comma)-mno-relax)
>>
>> diff --git a/arch/riscv/kernel/compat_vdso/Makefile b/arch/riscv/kernel/compat_vdso/Makefile
>> index 260daf3236d3..7f34f3c7c882 100644
>> --- a/arch/riscv/kernel/compat_vdso/Makefile
>> +++ b/arch/riscv/kernel/compat_vdso/Makefile
>> @@ -14,6 +14,10 @@ COMPAT_LD := $(LD)
>>  COMPAT_CC_FLAGS := -march=rv32g -mabi=ilp32
>>  COMPAT_LD_FLAGS := -melf32lriscv
>>
>> +# Disable attributes, as they're useless and break the build.
>> +COMPAT_CC_FLAGS += $(call cc-option,-mno-riscv-attribute)
>> +COMPAT_CC_FLAGS += $(call as-option,-Wa$(comma)-mno-arch-attr)
>> +
>>  # Files to link into the compat_vdso
>>  obj-compat_vdso = $(patsubst %, %.o, $(compat_vdso-syms)) note.o
>>
>> --
>> 2.39.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
