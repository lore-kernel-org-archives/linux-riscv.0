Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F8CC54EE9
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 14:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=W80Zmuth0x9kfIBi3RctzMy51edRm/roNueCrqC1UFI=; b=CD+ISeIQOw+rCBkgxtCm4eOBO9
	Wcf65hAZeFOsSBgCkNjbQUDw9gqIim0wxwKrkvgIqchtdZwYWdi9advqdY9rYCZcEkLCDL4yTzFNK
	PoeGToY3Amq8PcPXsFLp8becjag/ZvhxHLFJCZauPpZF2dtkHDk7uWRJnOozB2PdheFoKS5E69mYO
	/0ac4VYho/jpxu4FbTWrwwlZeZLtFcrOroiRAap4NyrwDVqtWs4rrf5AewO8s7n2MeJI+2BbgSi0D
	yx3zjGXGIpuVBQ8nl8jvY39Zlv4rp/cKL4jwRFsPzIi7+AHceJKCM2NyF4E2bxVW+wKRmjpH6mC2J
	eJOPQAMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC8f-00E36D-6C; Fri, 16 Sep 2022 14:16:17 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZC8F-00E2pI-59
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 14:16:09 +0000
Received: by mail-ej1-x636.google.com with SMTP id 13so20761000ejn.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 07:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=Ir+BLopUwMae4hyCKJHf8kYy9kAcLo6FPxRV1rAoBNk=;
        b=EJShOwezEcTa43N3+fJ+AuO8nLGPxienzEt4uq3GEkqN6A/dAv5HFngIo4wCtpYOHR
         jLAy4JyKS25ocVLges3mx4EfOHxIbusWtgSrkWcq09Vx0Snkpo16RSOAHrrMJtFBeq3L
         10iwAjdnTxYGKSlJo7BuP4cYL8ThZxVJsvfqqNiHs+QYJATEqk9+VSGqp6E+r5UeLgcP
         jMs6JMhYxRvpTsiVNpvSbQfz6W3ymiTdytghP8WjtA75soHxI35KveSoFq6WK9OVjzYF
         8QBl+h3cPpf9GfHkahWHytuaARr/GIL0AhRBCDoMFyeyj0aBix+CKgAVuH8RbWDbzdYv
         p+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Ir+BLopUwMae4hyCKJHf8kYy9kAcLo6FPxRV1rAoBNk=;
        b=ftEkzgmP03TMSXozd/2AiYKiITbBKT0FKy11woY3YPyk4xJw1V1azmixtFkuDbPNmI
         E/cZxgDa7OqBfZABZ3ISvH6Nokp62E1eDHYQ/8xrZbnuL/1zyoocawmSQjnpnMUsySuG
         sLdKOa2MWsjgvXtWkfH8AGLvoHcyjekm5RY0P2K9+ptqt4epqNugAxj+BLg8Gm67hDKr
         znvjykxrXXMhZLujW5AVIhqSYU7IiDQAPHvVe4qPseQ3EfyiTt4UpOZ0SnOp+lJg54EU
         EAAJxcjINHo8SpFziWt33QcKSoB5R8n+9ImnIYDGLPz5IhrLdzckm01SnGVU1vvWAd4L
         RIcw==
X-Gm-Message-State: ACrzQf1Dc9zM3LAVD9XrVdB5CbaW/hPHU8XsPWPgxHz5+FjkCaaj7Ebj
	46IGE4u+DQUUm1JppSKCMyWMhOGCCXxMnN2TB5s=
X-Google-Smtp-Source: AMsMyM7w/qd0IXChRueoiH7MYPItjuEi+s5SoZsvwkgzz3PSOvSZ3Gp4jAKb5ImgOZawfjKFZn5UtQ==
X-Received: by 2002:a17:907:628f:b0:72f:57da:c33d with SMTP id nd15-20020a170907628f00b0072f57dac33dmr3810002ejc.374.1663337746516;
        Fri, 16 Sep 2022 07:15:46 -0700 (PDT)
Received: from localhost (vpn-konference.ms.mff.cuni.cz. [195.113.20.101])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b0076f53f66e33sm10482609ejg.194.2022.09.16.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 07:15:46 -0700 (PDT)
Date: Fri, 16 Sep 2022 07:15:46 -0700 (PDT)
X-Google-Original-Date: Fri, 16 Sep 2022 07:15:39 PDT (-0700)
Subject: Re: [PATCH] RISC-V: Add support for Ztso
In-Reply-To: <CAAhSdy1Sn3xyKnuUgSNGwfYB0Nvuh9EVe+E23kzMb=Q=adhmMg@mail.gmail.com>
CC: linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: anup@brainfault.org
Message-ID: <mhng-2dd3498e-b6f5-4ea8-b97e-632b1c5bbd82@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_071551_291853_3FB76C71 
X-CRM114-Status: GOOD (  25.18  )
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

On Thu, 01 Sep 2022 23:50:50 PDT (-0700), anup@brainfault.org wrote:
> On Fri, Sep 2, 2022 at 9:17 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> The Ztso extension was recently frozen, this adds support for running
>> binaries that depend on TSO on systems that support Ztso.
>>
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> ---
>>
>> This is very minimaly tested: I can run no-Ztso binaries on both
>> yes-Ztso and no-Ztso QEMU instances, but I don't have a yes-Ztso
>> userspace together in order to make sure that works.
>> ---
>>  arch/riscv/include/asm/elf.h   | 18 ++++++++++++++++--
>>  arch/riscv/include/asm/hwcap.h |  3 +++
>>  arch/riscv/kernel/cpu.c        |  1 +
>>  arch/riscv/kernel/cpufeature.c |  3 +++
>>  4 files changed, 23 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
>> index 14fc7342490b..7a17d2275b76 100644
>> --- a/arch/riscv/include/asm/elf.h
>> +++ b/arch/riscv/include/asm/elf.h
>> @@ -14,6 +14,7 @@
>>  #include <asm/auxvec.h>
>>  #include <asm/byteorder.h>
>>  #include <asm/cacheinfo.h>
>> +#include <asm/hwcap.h>
>>
>>  /*
>>   * These are used to set parameters in the core dumps.
>> @@ -31,10 +32,23 @@
>>  #define ELF_DATA       ELFDATA2LSB
>>
>>  /*
>> - * This is used to ensure we don't load something for the wrong architecture.
>> + * Binaries that assume TSO cannot be correctly run on non-TSO systems, so
>> + * prevent them from even being loaded.
>> + */
>> +#define EF_RISCV_TSO   0x0010
>> +
>> +static inline int riscv_elf_tso_ok(long eflags)
>> +{
>> +       return likely(!(eflags & EF_RISCV_TSO)) || riscv_tso_hw;
>> +}
>> +
>> +/*
>> + * This is used to ensure we don't load something for the wrong architecture or
>> + * variant.
>>   */
>>  #define elf_check_arch(x) (((x)->e_machine == EM_RISCV) && \
>> -                          ((x)->e_ident[EI_CLASS] == ELF_CLASS))
>> +                          ((x)->e_ident[EI_CLASS] == ELF_CLASS) && \
>> +                          riscv_elf_tso_ok((x)->e_flags))
>>
>>  extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>>  #define compat_elf_check_arch  compat_elf_check_arch
>> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
>> index 6f59ec64175e..4e1d94c43d51 100644
>> --- a/arch/riscv/include/asm/hwcap.h
>> +++ b/arch/riscv/include/asm/hwcap.h
>> @@ -36,6 +36,8 @@ extern unsigned long elf_hwcap;
>>  #define RISCV_ISA_EXT_s                ('s' - 'a')
>>  #define RISCV_ISA_EXT_u                ('u' - 'a')
>>
>> +extern bool riscv_tso_hw;
>> +
>>  /*
>>   * Increse this to higher value as kernel support more ISA extensions.
>>   */
>> @@ -58,6 +60,7 @@ enum riscv_isa_ext_id {
>>         RISCV_ISA_EXT_ZICBOM,
>>         RISCV_ISA_EXT_ZIHINTPAUSE,
>>         RISCV_ISA_EXT_SSTC,
>> +       RISCV_ISA_EXT_ZTSO,
>>         RISCV_ISA_EXT_ID_MAX = RISCV_ISA_EXT_MAX,
>>  };
>>
>> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
>> index 0be8a2403212..d8371c249cc8 100644
>> --- a/arch/riscv/kernel/cpu.c
>> +++ b/arch/riscv/kernel/cpu.c
>> @@ -95,6 +95,7 @@ static struct riscv_isa_ext_data isa_ext_arr[] = {
>>         __RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
>>         __RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>>         __RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>> +       __RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
>>         __RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
>>         __RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
>>  };
>> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
>> index 3b5583db9d80..b8ab2b0a9e78 100644
>> --- a/arch/riscv/kernel/cpufeature.c
>> +++ b/arch/riscv/kernel/cpufeature.c
>> @@ -25,6 +25,8 @@
>>
>>  unsigned long elf_hwcap __read_mostly;
>>
>> +bool riscv_tso_hw __read_mostly;
>
> This is not set anywhere. Maybe riscv_fill_hwcap() should set it ?

Even worse: I got half way through writing the code, realized I should 
have just used a static branch, got distracted, wrote the QEMU code, and 
then forgot about it.  I'll fix it for the v2.

>
>> +
>>  /* Host ISA bitmap */
>>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>>
>> @@ -204,6 +206,7 @@ void __init riscv_fill_hwcap(void)
>>                                 SET_ISA_EXT_MAP("zicbom", RISCV_ISA_EXT_ZICBOM);
>>                                 SET_ISA_EXT_MAP("zihintpause", RISCV_ISA_EXT_ZIHINTPAUSE);
>>                                 SET_ISA_EXT_MAP("sstc", RISCV_ISA_EXT_SSTC);
>> +                               SET_ISA_EXT_MAP("ztso", RISCV_ISA_EXT_ZTSO);
>>                         }
>>  #undef SET_ISA_EXT_MAP
>>                 }
>> --
>> 2.34.1
>>
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv
>
> Regards,
> Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
