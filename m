Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6B65C54EE9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 16:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ILR6S1xYO0mOOvtauEqzrgPkV0jgICj0p60uzVzIj64=; b=sskUiK/9YqMfpCjIJOoS/qjEpM
	+qNSNjzeh4pOiBHUbrXQRVKf8uybvcq/zRwIhe3IYn9cxGOkt+JoGMnMfWl4idCgI1E06s6nxr9mY
	vC2PuxsxQp+DiiNJ5RJWbKCI0Lcw8+6Zkeq7F7WVDc1f6h+PuAr9fXzU/Q2sn8xY9N0QKMPvv6HRh
	hsw1rb6TnhgXXBUEAlI55xWK4jUeDMb9Ggavsm5QmJV1WEpI1ZyfZNwV0EZqSO38CtIo4rB25RcUH
	anw7hPLA+bAUiiaLgM2nl1nCtkXPCaL+pchtlYkKQ3FuG/XiundU5bZ6NGOjzQTECSCWtX5om6Bgp
	gCJuo7kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obPBD-00GnF5-MJ; Thu, 22 Sep 2022 16:36:03 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obPBA-00GnBu-Bg
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 16:36:02 +0000
Received: by mail-pg1-x529.google.com with SMTP id c7so9649802pgt.11
        for <linux-riscv@lists.infradead.org>; Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date;
        bh=Mqld70dhyuaOgiw/IPgHbm/MG9Kx5PxLIdME9+hbze8=;
        b=A30P2TsTzTPSfroNaeVGSOJDziZGrMjNKiU0gQJMb0we6OZrmatXbG+f68xUEnJfSF
         ZPdF5/Ch1dk+k3rY6OKt8FKbqXw8RgOyWqpFGEuC5H/daki1BNlx0RJiEy73G4aIUEdf
         eYaz5SIprR0YqM9br4OkbwywItMplvBbJks+uP/J6RbtwE4cby5QDauzG/DzmP7Tn2zr
         7+J3vgf4KUp1rFyg90nuSZj94WuQCA31UjFNfgK5WNmrT5gjp2CVIwgdv5W+QKY2FSh7
         EbybjTh52uN3o1Ei5N+KaTuzhhvqQMYS/VLu3RgT/GC5Ux53KmFYlmBuTYRyTkHYKPyD
         sAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Mqld70dhyuaOgiw/IPgHbm/MG9Kx5PxLIdME9+hbze8=;
        b=Ut6l+1XpS6FpzWi8wqZo6vDc9j/d5Nz/verUBiWese3dhiK5naORqnStT/A5hBeGAZ
         MsXP1oVjX0JdGdLYR5CSUrSxBLaq191c3yI6Oe7o3Rz84peBm2I/ubbIhm2u9jrxr9z2
         pd6dcFo2s7FGUACVIoc7crt/T4AhHWMADupmr/e5KpFIATEnYlTvcXsJYPoDUs13ElwR
         c9SLc6sVuwjWfUyFb1NCoR1YUMKJf8eWbW31MKj+lVPU/ScFd6SsASvOQQzvX/NN5CY3
         mgSSvEseu0KjGPdgx0mNVjstDhOGM5QOrOsc23v/MqdRawUYPnKNbsAg2aagjLNcvX5R
         LMWQ==
X-Gm-Message-State: ACrzQf3ZtSC1sVHAj+tqbMhAs7K20hRG9WT4Ff1itsi5iNn6hwDQa40I
	GsblJitwFkuyQJhV960+5byPMA==
X-Google-Smtp-Source: AMsMyM5m7T2Tjst45VejNFeB39v+vAogLCRE9CTffZ8cdOVYxhy1rLX2AqkBX5N/uTLppk485h9OFQ==
X-Received: by 2002:a63:1a1f:0:b0:438:d11b:e23d with SMTP id a31-20020a631a1f000000b00438d11be23dmr3627146pga.335.1663864557302;
        Thu, 22 Sep 2022 09:35:57 -0700 (PDT)
Received: from localhost (pop.92-184-98-183.mobile.abo.orange.fr. [92.184.98.183])
        by smtp.gmail.com with ESMTPSA id g10-20020a170902c38a00b001750b31faabsm4245176plg.262.2022.09.22.09.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Sep 2022 09:35:56 -0700 (PDT)
Date: Thu, 22 Sep 2022 09:35:56 -0700 (PDT)
X-Google-Original-Date: Thu, 22 Sep 2022 09:35:50 PDT (-0700)
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for systems with Svpbmt
In-Reply-To: <CAK9=C2WkqVgg58sKyDEMWue_vL8Pz7bCfERuaW_4DGnYTpcSMw@mail.gmail.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org, heiko@sntech.de,
  anup@brainfault.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  mchitale@ventanamicro.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: apatel@ventanamicro.com
Message-ID: <mhng-37586d5e-5576-448a-8d9c-4d277c252365@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_093600_434253_47829074 
X-CRM114-Status: GOOD (  25.00  )
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

On Thu, 15 Sep 2022 19:24:55 PDT (-0700), apatel@ventanamicro.com wrote:
> Hi Palmer,
>
> On Tue, Aug 30, 2022 at 10:17 AM Anup Patel <apatel@ventanamicro.com> wrote:
>>
>> Currently, all flavors of ioremap_xyz() function maps to the generic
>> ioremap() which means any ioremap_xyz() call will always map the
>> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
>> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
>> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
>> page attributes.
>>
>> To address above (just like other architectures), we implement RISC-V
>> specific ioremap_cache() and ioremap_wc() which maps memory using page
>> attributes as defined by the Svpbmt specification.
>>
>> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
>> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>
> This is a crucial RC fix. Can you please take this ?

Sorry I missed this, I thought it was just part of the rest of this 
patch set.  That said, I'm not actually sure this is a critical fix: 
sure it's a performance problem, and if some driver is expecting 
ioremap_cache() to go fast then possibly a pretty big one, but the only 
Svpmbt hardware that exists is the D1 and that was just supported this 
release so it's not a regression.  Maybe that's a bit pedantic, but all 
this travel has kind of made things a mess and I'm trying to make sure 
nothing goes off the rails.

Probably a pointless distinction as it'll just get backported anyway, 
but I'm going to hold off on this for now -- it generally looks OK, but 
I don't get back until this weekend and I'm super tired so I'm trying to 
avoid screwing anything up.

>
> Regards,
> Anup
>
>> ---
>>  arch/riscv/include/asm/io.h      | 10 ++++++++++
>>  arch/riscv/include/asm/pgtable.h |  2 ++
>>  2 files changed, 12 insertions(+)
>>
>> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
>> index 69605a474270..07ac63999575 100644
>> --- a/arch/riscv/include/asm/io.h
>> +++ b/arch/riscv/include/asm/io.h
>> @@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>>  #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
>>  #endif
>>
>> +#ifdef CONFIG_MMU
>> +#define ioremap_wc(addr, size)         \
>> +       ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
>> +#endif
>> +
>>  #include <asm-generic/io.h>
>>
>> +#ifdef CONFIG_MMU
>> +#define ioremap_cache(addr, size)      \
>> +       ioremap_prot((addr), (size), _PAGE_KERNEL)
>> +#endif
>> +
>>  #endif /* _ASM_RISCV_IO_H */
>> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
>> index 7ec936910a96..346b7c1a3eeb 100644
>> --- a/arch/riscv/include/asm/pgtable.h
>> +++ b/arch/riscv/include/asm/pgtable.h
>> @@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
>>  #define PAGE_TABLE             __pgprot(_PAGE_TABLE)
>>
>>  #define _PAGE_IOREMAP  ((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
>> +#define _PAGE_IOREMAP_WC       ((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
>> +                                _PAGE_NOCACHE)
>>  #define PAGE_KERNEL_IO         __pgprot(_PAGE_IOREMAP)
>>
>>  extern pgd_t swapper_pg_dir[];
>> --
>> 2.34.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
