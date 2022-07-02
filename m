Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55428C43334
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Jul 2022 03:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=M537IkGqygfPU4I1bAOopiRTRKVbrXOh6ViwnPZAUtU=; b=HbVeDyjg2O8aQP9OJbWba4eNzE
	exOlPPRDrRU3bcAfk0Wq4xSkw1JbEFnXDRGCZ5qHqe/6KUhbvasM3hL7b1c4VL23fzgiu/+Cn/HQX
	AB4ZG8dgQdpJ3U3+/qzBTqeeynp+Ek0pSHxYdUo8vRiya42aSSRx5L5Le5i5ROc3U3wOTa90cKQbG
	bOtv5QT73fUnx4aZoiz4YzbOMc7eQSpJpHuggv6NKPzq3yIsadoniiAvzY0566L8eXB0WB3a6EcMd
	kOE++WoQhvk4TBOLa5kI2jxPxRAMAwHXCvwfF/MX9LL4FGZYXlMfI0Bqpz4Oqjnx2qXW4zBNBmP1b
	MqurMXaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7U7T-007ytq-8O; Sat, 02 Jul 2022 03:48:31 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7U7Q-007yse-3a
	for linux-riscv@lists.infradead.org; Sat, 02 Jul 2022 03:48:30 +0000
Received: by mail-pg1-x533.google.com with SMTP id q140so4084724pgq.6
        for <linux-riscv@lists.infradead.org>; Fri, 01 Jul 2022 20:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=E+a0fSglUmSzLtUA/HQMDcrrUZQr3oJWl2+1+N37CIA=;
        b=hk8vWE4AyG7nKuc3dM6Y5EKeyQLDxzRuUokPB3LDsBI0HjtaJ0beLxG32bVGxn6Wde
         it+xaLS75T2W5Fuaz7VfpOYznPUWcUXaaynQWGCRXa66+bBQFqulkr+eKbALfJJzuDOL
         COwoIM2uEGUHrCh9Wb5G52dete0Tg5RpVu+PhEMFO8SWA2nwGrL36e/oGhY2bixu+AZa
         0NTnI/5b+NaLJFKWCgbc00vO/YwJbJUZ/7fUGB75NtOCi+NAWF4YU92TrB7EQgUaTTrm
         kKeABTlRaMqCNAOYABKPlOgj2bPUMOJM161MB5+ey86bM90Di49yhW8PmER5V480zxCK
         i6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=E+a0fSglUmSzLtUA/HQMDcrrUZQr3oJWl2+1+N37CIA=;
        b=x2D7Lg7zRkwpqR/pCm18/m7hhy7H4U7q9sjNGqPEr3hodAizSBh0rn6c1HRLTKG7lf
         Ju+vS1pyvPj+8v58/HMH+lfLCAuyLcR3eZ1o5on5lCCiBlSK7+mzlMXIGGRZYf6OJXmf
         6e2uQuecklIlq7X8py4b67WvE8BMfISTw7u0AZ8x1MiXsoaWPtYXBvJvSvPOdMj6gNDN
         Mn0Y5BWUeaW81KFM6JaqMRIBfGkXFDzMDh054Ujn3CgofSH68KA4nH+NRHh+jGnk/ZJ5
         V3g0lAxz7EKVrf1ephpmqu+ker0Y7ZUjiRl+pdGBKLmyIKXwFbR7yhKZB7iLhVYfA2e/
         zLVQ==
X-Gm-Message-State: AJIora/jH4rllfaRj04fbgPMWrdph5eFYNoPDP505twLKaVKU2fH3wJI
	nZl5n75eQ0TXLrW0l4WZVlfAaw==
X-Google-Smtp-Source: AGRyM1s6LX2zewUsQS0u1Pg2MKxq5mpaLSFYqeQj34/Fx24LOwoI2kpeK15nvs314AqUOGWuAHlQXA==
X-Received: by 2002:a63:3e47:0:b0:40c:f2dd:bc4 with SMTP id l68-20020a633e47000000b0040cf2dd0bc4mr14694749pga.47.1656733706454;
        Fri, 01 Jul 2022 20:48:26 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id w17-20020aa78591000000b0051b9ac5a377sm16419846pfn.213.2022.07.01.20.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 20:48:25 -0700 (PDT)
Date: Fri, 01 Jul 2022 20:48:25 -0700 (PDT)
X-Google-Original-Date: Fri, 01 Jul 2022 20:48:22 PDT (-0700)
Subject: Re: [PATCH v4 0/2] use static key to optimize pgtable_l4_enabled
In-Reply-To: <CAAhSdy0mkwacNMVa_jFZmZ+NRPBa1TpKUQGpzr6Z9_wfoq1R4g@mail.gmail.com>
CC: jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
  dvyukov@google.com, vincenzo.frascino@arm.com, alexandre.ghiti@canonical.com,
  Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  kasan-dev@googlegroups.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: anup@brainfault.org
Message-ID: <mhng-17913c13-57bd-42f9-9136-b4eb9632253c@palmer-mbp2014>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_204828_408550_15FEA764 
X-CRM114-Status: GOOD (  22.61  )
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

On Sat, 25 Jun 2022 21:33:07 PDT (-0700), anup@brainfault.org wrote:
> On Sat, May 21, 2022 at 8:13 PM Jisheng Zhang <jszhang@kernel.org> wrote:
>>
>> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
>> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
>> boot, so static key can be used to solve the performance issue[1].
>>
>> An unified way static key was introduced in [2], but it only targets
>> riscv isa extension. We dunno whether SV48 and SV57 will be considered
>> as isa extension, so the unified solution isn't used for
>> pgtable_l4[l5]_enabled now.
>>
>> patch1 fixes a NULL pointer deference if static key is used a bit earlier.
>> patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
>>
>> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
>> [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t
>>
>> Since v3:
>>  - fix W=1 call to undeclared function 'static_branch_likely' error
>>
>> Since v2:
>>  - move the W=1 warning fix to a separate patch
>>  - move the unified way to use static key to a new patch series.
>>
>> Since v1:
>>  - Add a W=1 warning fix
>>  - Fix W=1 error
>>  - Based on v5.18-rcN, since SV57 support is added, so convert
>>    pgtable_l5_enabled as well.
>>
>>
>>
>> Jisheng Zhang (2):
>>   riscv: move sbi_init() earlier before jump_label_init()
>>   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
>
> I have tested both these patches on QEMU RV64 and RV32.
>
> Tested-by: Anup Patel <anup@brainfault.org>
>
> Thanks,
> Anup

Thanks for testing these.  Unfortunatly they're failing for me under my 
kasan+sparsemem-vmemmap config, which looks like a defconfig with

    CONFIG_KASAN=y
    # CONFIG_FLATMEM_MANUAL is not set
    CONFIG_SPARSEMEM_MANUAL=y
    CONFIG_SPARSEMEM=y
    # CONFIG_SPARSEMEM_VMEMMAP is not set

Nothing's really jumping out and I'm not sure that's a super compelling 
configuration, but IIRC it's found a handful of issues before so I'm not 
sure it's sane to just toss it.

I've put this all on the riscv-pgtable_static_key branch of 
kernel.org/palmer/linux .  If nobody has the time to look then I'll try 
and give it another shot, but I'm pretty buried right now so happy to 
have the help.

>
>>
>>  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
>>  arch/riscv/include/asm/pgtable-32.h |  3 ++
>>  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
>>  arch/riscv/include/asm/pgtable.h    |  5 +--
>>  arch/riscv/kernel/cpu.c             |  4 +-
>>  arch/riscv/kernel/setup.c           |  2 +-
>>  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
>>  arch/riscv/mm/kasan_init.c          | 16 ++++----
>>  8 files changed, 104 insertions(+), 66 deletions(-)
>>
>> --
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
