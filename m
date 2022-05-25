Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09542C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 25 May 2022 21:45:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=AFfeERVztJpu8xMQNHlcqFfI5vt5kdEy7IE/yndI1Sc=; b=Q7bgdZwl2XoV+iVtvoprp6TZ/s
	wshiJy494HVosWVAtSBNoRee5lDCccBKd+SdggKB5vzzcDQnemQUA/gtZUJgDC4MB/sBYW+lTSWCj
	yO/ylpLeBBTq9pQ/yIZ+HCU2HG+Li4a5jrvFXiP0vdnaUOyxcCeUrFF7LrpyGk2nPbmi14nr78g9C
	PtQW03WDL/DUjB+4oBMLTRPiGsAezclfLlJc66uvGyddR51ifyGuUMJLL/6x/b1/oSHdeveTNx/ey
	zLUJXivGXxSyXPU6z/XC8JpB9LLd7TabcFIKxRAZi9NQRgtJ3khomYjfBetK4NuWGrVo+VKGjIHlo
	Eho7PvsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyp1-00Cm88-9g; Wed, 25 May 2022 21:45:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntyoz-00Cm6x-43
	for linux-riscv@lists.infradead.org; Wed, 25 May 2022 21:45:38 +0000
Received: by mail-pj1-x102a.google.com with SMTP id x2-20020a17090a1f8200b001e07a64c461so2758659pja.4
        for <linux-riscv@lists.infradead.org>; Wed, 25 May 2022 14:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=IN7B1Qc2wQvKxwG75W2PmFzu/kAYmOIH2ON1vtcnH3I=;
        b=nCMUhgnyQce2lMMZ3bdjYejIOHX3m22pUeVsgAvPSzBFX2WkZCLfTQ4vhyMTfDsUDM
         R+KW8HaSM9ENcBMw96xmd1GpUK3M2bkg/SvBdp7OaoVK+5OdP9Dpwkb+TKfcVPiZp74w
         vy0fRsftC/z4ZllL09J4wQc7cI9rvXoCh3gcyVzzyjTMEKQM+45cwGpGaDcYbJ/o70HE
         KTUpLEVrpMb7/8UqoRF3rdb37oLgr9njTTupgFpPnldBr+56BFxsDmQ5Xkis+RWo9zgh
         hoe2WvU1C+NoExPdzzlV/yxXS3YQ9T0jZmy1rk5vgoQHR3sy72UYi1Mx8kzNHrhWhPbA
         FuUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=IN7B1Qc2wQvKxwG75W2PmFzu/kAYmOIH2ON1vtcnH3I=;
        b=6+izjHK8tAbsZIE839jBcqbhCeOIyV0j0C1I8c1FrzAukJxwiIdqJ7hoWuzAPcQUfk
         YjgIgK03627FiHiSB3kXoFY+n0suWYwPKPYe+vWPdvZu6wsJj3DsCkHtnh+Auc3g5tx8
         M3yUcvtcAX4iEddEsYioCcY5Y02kytcrQkSpxzYY3BbX24oXOB7tgtG4WslpmM3HkKT5
         iOg5zEkowDufbJnvBP78qPnCtX7czI2TiVHZ+o2+y1LuB3KI21MqvwS71b8gtclGeVL0
         v1R1xxdngog1LLQDQC61weaGXBQb5iTpEOOUpYtoef7Ul52oj2oqCt3czvNEZyKxJoKx
         /tGQ==
X-Gm-Message-State: AOAM532ykxxJ4snzWIVIxPNBbi57iuW62tdXSaXXbWXk4/ddKBAPdDYr
	eE0cd2bkipcnSSL0oSGjVYYsA0bCWNQpCg==
X-Google-Smtp-Source: ABdhPJydPIEdq20LuZGkb+rUGUKaOiDkAhLz7ObNc/JyBOQIBagoJ7vjQ+qDXCfTWr7cnXmk76fFNQ==
X-Received: by 2002:a17:902:f551:b0:162:de7f:76b6 with SMTP id h17-20020a170902f55100b00162de7f76b6mr7544542plf.77.1653515135300;
        Wed, 25 May 2022 14:45:35 -0700 (PDT)
Received: from localhost ([12.3.194.138])
        by smtp.gmail.com with ESMTPSA id 19-20020a170902e9d300b0015e8d4eb263sm10050965plk.173.2022.05.25.14.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 14:45:33 -0700 (PDT)
Date: Wed, 25 May 2022 14:45:33 -0700 (PDT)
X-Google-Original-Date: Wed, 25 May 2022 14:45:30 PDT (-0700)
Subject: Re: [PATCH v2 3/4] RISC-V: Split out the XIP fixups into their own file
In-Reply-To: <CAJF2gTTC4V_vSFFranTB6PZrHK08J8KygjfACxfQ91POpRtY-Q@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, rdunlap@infradead.org,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, anup@brainfault.org, vincent.chen@sifive.com,
  Atish Patra <atishp@rivosinc.com>, alexandre.ghiti@canonical.com, jszhang@kernel.org, vitaly.wool@konsulko.com,
  gatecat@ds0.me, wangkefeng.wang@huawei.com, mick@ics.forth.gr, panqinglin2020@iscas.ac.cn,
  rppt@kernel.org, linux-kernel@vger.kernel.org, linux@rivosinc.com
From: Palmer Dabbelt <palmer@rivosinc.com>
To: guoren@kernel.org
Message-ID: <mhng-46c58a80-5b65-4a22-91fa-884bb5df49bc@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220525_144537_187830_79DFC3B8 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, 20 Apr 2022 23:45:23 PDT (-0700), guoren@kernel.org wrote:
> On Thu, Apr 21, 2022 at 2:48 AM Palmer Dabbelt <palmer@rivosinc.com> wrote:
>>
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> This was broken by the original refactoring (as the XIP definitions
>> depend on <asm/pgtable.h>) and then more broken by the merge (as I
>> accidentally took the old version).  This fixes both breakages, while
>> also pulling this out of <asm/asm.h> to avoid polluting most assembly
>> files with the XIP fixups.
>>
>> Fixes: bee7fbc38579 ("RISC-V CPU Idle Support")
>> Fixes: 63b13e64a829 ("RISC-V: Add arch functions for non-retentive suspend entry/exit")
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> ---
>>  arch/riscv/include/asm/asm.h       | 26 ------------------------
>>  arch/riscv/include/asm/xip_fixup.h | 32 ++++++++++++++++++++++++++++++
>>  arch/riscv/kernel/head.S           |  1 +
>>  arch/riscv/kernel/suspend_entry.S  |  1 +
>>  4 files changed, 34 insertions(+), 26 deletions(-)
>>  create mode 100644 arch/riscv/include/asm/xip_fixup.h
>>
>> diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
>> index 8c2549b16ac0..618d7c5af1a2 100644
>> --- a/arch/riscv/include/asm/asm.h
>> +++ b/arch/riscv/include/asm/asm.h
>> @@ -67,30 +67,4 @@
>>  #error "Unexpected __SIZEOF_SHORT__"
>>  #endif
>>
>> -#ifdef __ASSEMBLY__
>> -
>> -/* Common assembly source macros */
>> -
>> -#ifdef CONFIG_XIP_KERNEL
>> -.macro XIP_FIXUP_OFFSET reg
>> -       REG_L t0, _xip_fixup
>> -       add \reg, \reg, t0
>> -.endm
>> -.macro XIP_FIXUP_FLASH_OFFSET reg
>> -       la t1, __data_loc
>> -       REG_L t1, _xip_phys_offset
>> -       sub \reg, \reg, t1
>> -       add \reg, \reg, t0
>> -.endm
>> -_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
>> -_xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
>> -#else
>> -.macro XIP_FIXUP_OFFSET reg
>> -.endm
>> -.macro XIP_FIXUP_FLASH_OFFSET reg
>> -.endm
>> -#endif /* CONFIG_XIP_KERNEL */
>> -
>> -#endif /* __ASSEMBLY__ */
>> -
>>  #endif /* _ASM_RISCV_ASM_H */
>> diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
>> new file mode 100644
>> index 000000000000..0d0754305324
>> --- /dev/null
>> +++ b/arch/riscv/include/asm/xip_fixup.h
>> @@ -0,0 +1,32 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
>> +/*
>> + * XIP fixup macros, only useful in assembly.
>> + */
>> +#ifndef _ASM_RISCV_XIP_FIXUP_H
>> +#define _ASM_RISCV_XIP_FIXUP_H
>> +
>> +#include <linux/pgtable.h>
>> +
>> +#ifdef CONFIG_XIP_KERNEL
>> +.macro XIP_FIXUP_OFFSET reg
>> +        REG_L t0, _xip_fixup
>> +        add \reg, \reg, t0
>> +.endm
>> +.macro XIP_FIXUP_FLASH_OFFSET reg
>> +        la t1, __data_loc
>> +        li t0, XIP_OFFSET_MASK
>> +        and t1, t1, t0
>> +        li t1, XIP_OFFSET
> I still prefer the style:
> REG_L t1, _xip_phys_offset
> ...
> _xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
>
> Because it's more clear and has the same style as your _xip_fixup.

Thanks, not quite shure how I pulled the old version over.  I've fixed 
this one up.

> Others:
> Reviewed-by: Guo Ren <guoren@kernel.org>
>
>> +        sub t0, t0, t1
>> +        sub \reg, \reg, t0
>> +.endm
> -.endm
>> +
>> +_xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
>> +#else
>> +.macro XIP_FIXUP_OFFSET reg
>> +.endm
>> +.macro XIP_FIXUP_FLASH_OFFSET reg
>> +.endm
>> +#endif /* CONFIG_XIP_KERNEL */
>> +
>> +#endif
>> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
>> index 893b8bb69391..822c33aa7f45 100644
>> --- a/arch/riscv/kernel/head.S
>> +++ b/arch/riscv/kernel/head.S
>> @@ -14,6 +14,7 @@
>>  #include <asm/hwcap.h>
>>  #include <asm/image.h>
>> +#include <asm/xip_fixup.h>
>>  #include "efi-header.S"
>>
>>  __HEAD
>> diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
>> index 4b07b809a2b8..aafcca58c19d 100644
>> --- a/arch/riscv/kernel/suspend_entry.S
>> +++ b/arch/riscv/kernel/suspend_entry.S
>> @@ -8,6 +8,7 @@
>>  #include <asm/asm.h>
>>  #include <asm/asm-offsets.h>
>>  #include <asm/csr.h>
>> +#include <asm/xip_fixup.h>
>>
>>         .text
>>         .altmacro
>> --
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
