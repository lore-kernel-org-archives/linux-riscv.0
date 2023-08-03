Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 324E1C001DB
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 15:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=e48oBruDredcwol3ROH7ME8JG7cZHOOQw0OEoyutSRk=; b=Hg68D8DlbWj6N8z3Uo4tbp2bFa
	lmk/LCIGD85LJ/dvB0vTZqpz7uELOIrjt6Si0wfpG4cWwoR2l6aMzJux4QkaYa5R7YT5pr4Ohjxq/
	ff5mhKtnHdzcUvHueLZVBlI6nNDAhLjrzFDG0B4bxOa7dMlL/dstEFbKbXbu8xUEGb9BjDJpqJ/Xp
	5I4Xt5EBLBzvEggwpYWDBFrgFj8sGOPK/hlE1D8egkQn5dfb3eqi3YJpRRy9qUsNwBYtZQGzHqeGx
	vry/32mxgxNlbkJ1k2Y7rwU+pn6Ws8EfC8lThWjVmxb3v7zvM2Zx/5xVPvyNCpfOCf9z9cmwplcma
	ZaqXNF4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1W-00A6aY-2Q;
	Thu, 03 Aug 2023 15:13:58 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRa1R-00A6Rh-17
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 15:13:55 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bc1c1c68e2so7469495ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 08:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1691075628; x=1691680428;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFi6nkKuCfronVs3puu7JeuJqqo6OybabVqGaNziIKo=;
        b=BFF/P4SllIBeLlsCR85Pws/VNoP+i8PKJU8qgPlZeBbrBC3Ab0pCbpw1o+Ft7nMqgv
         hLrIoZfjIK5vNVCakvol5B70zNLbrRd9zEMoMN9A6w13ZgpOOVBkbr7XBuIpSZkxPNji
         sEXNrcwTcFcmJURjPJxGXKWAHqDvgLRvppNBt37pq5LeXUbAXwEuVgh4rXyF9ZejgJBi
         1dmzcTlpGIoSkjvHohD62dSskjSuvGsgk6PMq4wANW/AFjh0UBWFtIm1s5DssRJWTqY1
         oflQOZjK9zh4t6n8TL1Ag4Q4qechkvZSlh7+4IIElJNW9WBGJsnlHrH7Ut4pRmTEk+pI
         vXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691075628; x=1691680428;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BFi6nkKuCfronVs3puu7JeuJqqo6OybabVqGaNziIKo=;
        b=hj6l6uv6cebaLGFX8EkiW7ppyzojy7QRPSpahUPtB+GsBWpbhTQUyQMFWEvbo4IQXB
         AgLGUvY3SxfdSZwdef1GkBAVE67OOqMbi3VYHy3qRpkzZWagnRb7m06M48jAyPbDfUHs
         8DLQLzpsSJ4LHyv8VP81ROryY/6Cn+xEbTWpmMRRYkdvFbL6mrfBwGKiDN1b7gJKdAsS
         90az/GC0vjBkAz2BXyZ1XhwPbePV8uhU17FubWIKOP8aPBuED80ICeixxNLbVaSiukGt
         pZqWX1Yy8IrPr71aptwcrnMIUlaCLBFmovzSx2yv0JVecLbUHFADiGNkvVsI7Ki40U0+
         WqRw==
X-Gm-Message-State: ABy/qLZfo69tABDTfXrh9AXD3Lp1EjYAEsD3iEKozJPzyR2qnHQRvmLe
	oF+yFtCqXfM+hrKw/vYtgOmzmg==
X-Google-Smtp-Source: APBJJlGoGXFjAt34mfVI2PMBZl931LLcFaNTQJ9h+JJko9jh4GP1728E6rUCzfqmCMYzNC/d1arynQ==
X-Received: by 2002:a17:902:f681:b0:1b8:7625:3042 with SMTP id l1-20020a170902f68100b001b876253042mr21752457plg.10.1691075628504;
        Thu, 03 Aug 2023 08:13:48 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id m24-20020a170902bb9800b001b87bedcc6fsm14494288pls.93.2023.08.03.08.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 08:13:48 -0700 (PDT)
Date: Thu, 03 Aug 2023 08:13:48 -0700 (PDT)
X-Google-Original-Date: Thu, 03 Aug 2023 07:45:20 PDT (-0700)
Subject: Re: [PATCH v2 2/3] riscv/purgatory: do not link with string.o and its dependencies
In-Reply-To: <20230726-excavate-swoosh-424ede98f63d@spud>
CC: petrtesarik@huaweicloud.com, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Conor Dooley <conor.dooley@microchip.com>, lihuafei1@huawei.com,
  liaochang1@huawei.com, masahiroy@kernel.org, keescook@chromium.org, akpm@linux-foundation.org,
  heiko@sntech.de, ribalda@chromium.org, hi@alyssa.is, lizhengyu3@huawei.com,
  linux-riscv@lists.infradead.org, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, duwe@suse.de,
  roberto.sassu@huaweicloud.com, petr@tesarici.cz
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Conor Dooley <conor@kernel.org>
Message-ID: <mhng-45e67c5d-6969-43da-9147-b53dc9a78612@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_081353_547700_A2EB0F3D 
X-CRM114-Status: GOOD (  20.63  )
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

On Wed, 26 Jul 2023 09:33:49 PDT (-0700), Conor Dooley wrote:
> On Wed, Jul 26, 2023 at 11:54:00AM +0200, Petr Tesarik wrote:
>> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
>> 
>> Linking with this object file makes kexec_file_load(2) fail because of
>> multiple unknown relocation types:
>> 
>> - R_RISCV_ADD16, R_RISCV_SUB16: used by alternatives in strcmp()
>> - R_RISCV_GOT_HI20: used to resolve _ctype in strcasecmp()
>> 
>> All this hassle is needed for one single call to memcmp() from
>> verify_sha256_digest() to compare 32 bytes of SHA256 checksum.
>> 
>> Simply replace this memcmp() call with an explicit loop over those 32 bytes
>> and remove the need to link with string.o and all the other object files
>> that provide undefined symbols from that object file.
>> 
>> Fixes: 838b3e28488f ("RISC-V: Load purgatory in kexec_file")
>> Signed-off-by: Petr Tesarik <petr.tesarik.ext@huawei.com>
>
> This version keeps the automation happy,
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Oddly enough, this breaks my builds.  I tried fixing the first one with
something like

    From 41c5a952f77e53bf4201296abff0132725aa19e6 Mon Sep 17 00:00:00 2001
    From: Palmer Dabbelt <palmer@rivosinc.com>
    Date: Wed, 2 Aug 2023 20:22:33 -0700
    Subject: [PATCH] RISC-V: Include io from timex
    
    Without this I get some implicit declarations.
    
      CC      arch/riscv/kernel/asm-offsets.s
    In file included from linux/include/linux/timex.h:67,
                     from linux/include/linux/time32.h:13,
                     from linux/include/linux/time.h:60,
                     from linux/include/linux/ktime.h:24,
                     from linux/include/linux/timer.h:6,
                     from linux/include/linux/workqueue.h:9,
                     from linux/include/linux/mm_types.h:19,
                     from linux/include/linux/mmzone.h:22,
                     from linux/include/linux/gfp.h:7,
                     from linux/include/linux/mm.h:7,
                     from linux/arch/riscv/kernel/asm-offsets.c:10:
    linux/arch/riscv/include/asm/timex.h: In function 'get_cycles':
    linux/arch/riscv/include/asm/timex.h:25:16: error: implicit declaration of function 'readl_relaxed' [-Werror=implicit-function-declaration]
       25 |         return readl_relaxed(((u32 *)clint_time_val));
          |
    
    Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
    ---
     arch/riscv/include/asm/timex.h | 1 +
     1 file changed, 1 insertion(+)
    
    diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
    index a06697846e69..1a4d181193e0 100644
    --- a/arch/riscv/include/asm/timex.h
    +++ b/arch/riscv/include/asm/timex.h
    @@ -7,6 +7,7 @@
     #define _ASM_RISCV_TIMEX_H
     
     #include <asm/csr.h>
    +#include <asm/io.h>
     
     typedef unsigned long cycles_t;
 
    -- 
    2.41.0

The other two look fine and are somewhat independent, so I've picked those up
for fixes.

Thanks!

>
> Thanks,
> Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
