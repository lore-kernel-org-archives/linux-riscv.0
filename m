Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88C2BC02195
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 15:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=EVbRUJYj1R9aPIuTkVy2GBOOyXPL1YqGLSHx6ZoUmrw=; b=yq2nzaHy1ipw7hCDsm8OgcIDFj
	SeC19obxbU205pTmfIgP8mtJ062Q4e8qH9DzZvA/AqZiKC5W4fEqaddXaG47quqSvH7Az+AeNCeSM
	jVQlNNlPsdRSHDBIm6hYkSzV6T6B9n3CUbm3FhFzVTQT+6wIHcll4cYyqnaCDNXgwa4NHiCpNvOml
	i4rKPaLV5mNzMq7pZAaO3/xuB/sST9Xl2rs8UyrRZZLcsas98Nf9bSHEkOEKiS2202xeEuricOX2F
	NFOwMyuuW1tZAmnFSxm7ZQEf3ctbOJRZ+dXoJkqDcxcRprH90EuieQV00u87kijbc9oDHhh/TIGUy
	ICsO+svQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teyrJ-0000000Fw21-3Aq4;
	Mon, 03 Feb 2025 15:59:37 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teyrG-0000000Fw12-1TYa
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 15:59:35 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21654fdd5daso78983555ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 07:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1738598373; x=1739203173; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5WM9ndKvA26UIZeHIPCkUlE9Zv9sxLm8VjPdFITu6k=;
        b=OEw2yD3D4cuxUSAQ7ouIIxgSd0iZv9E0ZthpW0feuU5MwfHkC4TqPkJxutx2dPsppX
         dBLDPHypKNmEfQkRNp5fgmrVslet+4HK1uyufe4I391L3Epnv92AchVYOAYDYnxqGTvG
         puc15SCuSHtoBP5yVpYhC6Qe8fu+jjQLcBdbIrV+XJWrl6NVD1hync0cfn4sP8/wWbl2
         NokLOzm86e2Jj43wa9/a+B7VOPUYGuzQIPDvK2PZLes2o7MJUu4NWKB/wAUZ+i5/S88a
         2MHHphOhGM0UkSrAp5zRfOQtv9idqY/y/0V0aGV0AnjDwu4CwqDrNfZit0UyCE49YVoD
         aAZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738598373; x=1739203173;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f5WM9ndKvA26UIZeHIPCkUlE9Zv9sxLm8VjPdFITu6k=;
        b=cCFzUNHqTNGihZ0ExHwc4UDXMPypSEEj2bW9CNFBL2okeD0sJJKGm1zqiAqXGaoFh1
         OOFBfF/GQazRx9eRIpchvT4c7H1+ACGdnIdXBR+yiVimo3Nz67uFf/WBSgoDTqUSnCpl
         /zjf9wCynFnEsa+t61b/RsmYX9L+6p/iS5/4aPgOfBBEhF62ayPR31AvJOZmyq2LLC9T
         a/E5cN7SZQGgU1n3JCB691mF+lhDUNuI68gfGfSLBI+cWR8a+CJje9MdugHDLcb9T3yq
         p348s0mibWGryS4wMY7wN/CAJUbp7RHidpJtYsNhkv/XMdhi9dY4SiEDWGLdAGrhK6w7
         l/nA==
X-Forwarded-Encrypted: i=1; AJvYcCWQEPspdnh9pQ4l2eAvuRg1VOnbiGcgRbxaa8xtGxg24kHCaLhbtmrpufeAcuFNoxky7EeeHJU1gtU8OA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkFMfLaBPHKO9umE977ulgJJllf4WuAmKlFvlkGNHaD6ZnRALY
	MSlNxnmiLigr/GN8x4WNgy0tSICCiXKn/g4MO1ipydWBzVlBmh4ismVZBu0K4r8=
X-Gm-Gg: ASbGncvXDStyftrvOtEyudD15Ac1c93zuhhDKFESGb2yOAacofSJ/kf2fLy2NQJ7CRB
	l2kY/I7aZgbO9LXF9sr6AfVppIaDwybbfS+LSkaXUsd2wg6FCDdKH/3OKpaEmCEVIlS1+D8KN/i
	6IcHB4KgUhBwIVVYHGJCK+gEaXbBqJ68np0t/ytClPsYIO817/kiDAIdfTNqhkpgWlUZ/9mbW4D
	2603y9yODsI0RphLHSMxsrb2DWJ/dI2tofoUAnxITowWeZDqZ1HnUJUCEbhRtMmnb5Ax+0MYKVZ
	U0+hoNNX
X-Google-Smtp-Source: AGHT+IEvrjfNkAkF5z8tTOHc/531hwMvQ6V42TC/2Zg2DMiMr0heP/1FCPKQPrgN+EdObeq8c1tilw==
X-Received: by 2002:a17:902:d492:b0:216:6f1a:1c81 with SMTP id d9443c01a7336-21dd7c35597mr341125995ad.2.1738598372667;
        Mon, 03 Feb 2025 07:59:32 -0800 (PST)
Received: from localhost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-acec0a65716sm6799959a12.68.2025.02.03.07.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 07:59:31 -0800 (PST)
Date: Mon, 03 Feb 2025 07:59:31 -0800 (PST)
X-Google-Original-Date: Sun, 19 Jan 2025 13:37:48 PST (-0800)
Subject: Re: [External] Re: [PATCH] riscv: add a warning when physical memory address overflows
In-Reply-To: <87fromgalp.fsf@bytedance.com>
CC: alex@ghiti.fr, punit.agrawal@bytedance.com,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, alexghiti@rivosinc.com, chenjiahao16@huawei.com,
  guoren@kernel.org, vishal.moola@gmail.com, stuart.menefy@codasip.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, cuiyunhui@bytedance.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: punit.agrawal@bytedance.com
Message-ID: <mhng-0cc06470-8584-474e-9fe0-dc6731fdef44@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_075934_547693_0DD0D3F1 
X-CRM114-Status: GOOD (  21.91  )
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

On Wed, 23 Oct 2024 07:25:22 PDT (-0700), punit.agrawal@bytedance.com wrote:
> Hi Palmer,
>
> [...]
>
>>> On 14/08/2024 08:26, Yunhui Cui wrote:
>>> > The part of physical memory that exceeds the size of the linear mapping
>>> > will be discarded. When the system starts up normally, a warning message
>>> > will be printed to prevent confusion caused by the mismatch between the
>>> > system memory and the actual physical memory.
>>> >
>>> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
>>> > ---
>>> >   arch/riscv/mm/init.c | 8 ++++++--
>>> >   1 file changed, 6 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
>>> > index 52290c9bd04bd..c93164dc51658 100644
>>> > --- a/arch/riscv/mm/init.c
>>> > +++ b/arch/riscv/mm/init.c
>>> > @@ -236,8 +236,12 @@ static void __init setup_bootmem(void)
>>> >        */
>>> >       if (IS_ENABLED(CONFIG_64BIT)) {
>>> >               max_mapped_addr = __pa(PAGE_OFFSET) + KERN_VIRT_SIZE;
>>> > -             memblock_cap_memory_range(phys_ram_base,
>>> > -                                       max_mapped_addr - phys_ram_base);
>>> > +             if (memblock_end_of_DRAM() > max_mapped_addr) {
>>> > +                     memblock_cap_memory_range(phys_ram_base,
>>> > +                                               max_mapped_addr - phys_ram_base);
>>> > +                     pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
>>> > +                             max_mapped_addr);
>>> > +             }
>>> >       }
>>> >
>>> >
>>>
>>>
>>> A bit weird to review and test my own patch, but here it is anyway :)
>>>
>>> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>>>
>>> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
>
> Looks like the patch has been ready for a while now. If there are no
> further problems, can it be merged please?

It didn't build, I squashed in a 

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 8f8b76aaf99a..9641e4ad387f 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -259,8 +259,8 @@ static void __init setup_bootmem(void)
 		if (memblock_end_of_DRAM() > max_mapped_addr) {
 			memblock_cap_memory_range(phys_ram_base,
 						  max_mapped_addr - phys_ram_base);
-			pr_warn("Physical memory overflows the linear mapping size: region above 0x%llx removed",
-				max_mapped_addr);
+			pr_warn("Physical memory overflows the linear mapping size: region above %pa removed",
+				&max_mapped_addr);
 		}
 	}

to fix it.


>
> [...]

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
