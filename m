Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47E03C0219D
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 14:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=S9ROwPsRr5MB92DlYIbiYqS3gbd0ZYB+1CNzAQ3u21Y=; b=e7FZIyZHtGRCUXcbU58On8T2C+
	ZuXMk3c7BOwX0aniztLkK/9Py48RWNp1MRFnAfqKplnWSyY0N18fa49PqX09mhwkvHZhIqD5k8KhJ
	8xUU6xJCkA92+AypGNLPKdlLz1TzhCgr8t3zd1OA9I1/mB3lCE6xAAHsy4DxlsHRRQrHd5EixjJOT
	Yy03/6EAfoBy6vdFjVH9DJfBrubz9cEVv9T07ZucFX26MR1J7HZKJKJ+mjwqw3dhnulmxABx+N0HT
	kAEitn42oTOk/huUnJ8ecosNykEXF2du3RBDqrCDxUu2GnaejhnX7uq+aQGP7oGvERBJ0Km1wI9aW
	mW/XVwHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiaIp-0000000BLxK-1uMf;
	Thu, 13 Feb 2025 14:34:55 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tia1i-0000000BHv8-0EcD
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 14:17:15 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21f818a980cso13351855ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 06:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1739456233; x=1740061033; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Th6lX7yB9qjmpn3x3XWkX4vhyaraeYuwBL7xGtC75O0=;
        b=XCJcsr4mbUBZbqzzy6t0SSREtKgsaNcszc0rbwS/AkVtMqCDOWeiJLAlJhw2AfKIhb
         uoI7kNFx1nJBKOLAv+0R9j+3EDE4rUvBtp62Y4hc7v6d7hGkP0hTrqV1t6T+dJfJRK/8
         ABeSwBvyDLcvV1oachVVltV3lBEAE71cCHa1oJY5qBoagsXcqfTmCDOrRWF61L9SuV5y
         GK6LMrELwEPbC/nkvrOtrb353gYlAmXPIDEBJ+QOR96m++QrjcGta+AF93otWpM5T2HB
         RF4FQyq/kyFuMijn52DS0Nnh4ad1YegRjY96fR/Ra1lF6X0XgOgGgu8EDfuQF2IttnYz
         +7JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739456233; x=1740061033;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Th6lX7yB9qjmpn3x3XWkX4vhyaraeYuwBL7xGtC75O0=;
        b=AV2QTW41klHVMCCnTWRIxqMGP0j8tQO9p85/sK+UgUgveQVhHVem2rf9C+jTKGVDzv
         mxfoCdMRwhka6ZYAmkE0PqXNFYNWVi6YU2ynoWoRDG2chEIfPmTgwN/eJ4Ge5SpzeBns
         o5CJwTPCJ2+7xiUWRrhbc5X3AHTJNVOUVldw+Yclr4o8JOcabNSTJdOjgd5QAFDaSixQ
         Z0dNbge81KxC5qQZTImoYWBy51xfg+pd4wh85NhcZJQB/dFlvEzJi5YmTjVwXAJMIKmw
         y6hzG7ypyeEOfYQqyGDoxynAhlj27hbLppgI30PpLToRDEz69FnvKHjiWypZj6OjxU0w
         YD9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJrqAs5s9xbcImdmILCm46NjY73MCFKtfAuG+J+g36CFWYnKRVe2dcd7RjK5IA2K95qGHurEQKSYnHqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHd0YPaOHcwjliduC0CTZpnV70utmJeoXkj9cffURqk20yMiGY
	xDKDiB2hIMcbPNF6HOzkodkE0z45wj84feuTkP9xGRrW4l73A35u2Kknl4SHH84=
X-Gm-Gg: ASbGnctc0ZunPpPbm4TNK4zxGJXIJqvKI0OEMAQbY5a/8sCmnD5vMAAEZuw4hwBkMgU
	zqfdwIsUBT0owche8dD22lP2cd4k+pmJzcqaQ79gDSID4hdah6Lcb0mhe3oddX1/MlmWa5n7PVY
	HT9EJmwnjQ/XGzGi4MI0XolOvf5gVc/17Txil+Ac34k2U0vbzeq1QwiIBBEYJBzfg/yHTGguhx5
	7HaVRRX6daiaIv+ArdmByEK+E40N7A1ekZEtRa58Bc+3sVLLPFyMLsrisHne15P2Omg1RGb8k7w
	3LOIbM5+8YlZ
X-Google-Smtp-Source: AGHT+IEGdbnZBMKZzS1Nj16TfST25tvEcj38W13TegR/1BDT0XWfns6gOT9rmswIL2lBD8LhXfdYvA==
X-Received: by 2002:a17:902:e54a:b0:216:7c33:8994 with SMTP id d9443c01a7336-220bbcc6cf5mr126074435ad.53.1739456232785;
        Thu, 13 Feb 2025 06:17:12 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d556f97dsm12958985ad.172.2025.02.13.06.17.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 06:17:12 -0800 (PST)
Date: Thu, 13 Feb 2025 06:17:12 -0800 (PST)
X-Google-Original-Date: Thu, 13 Feb 2025 06:17:09 PST (-0800)
Subject: Re: [PATCH 0/6] riscv: Relocatable NOMMU kernels
In-Reply-To: <20241026171441.3047904-1-samuel.holland@sifive.com>
CC: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
  akpm@linux-foundation.org, Arnd Bergmann <arnd@arndb.de>, alexghiti@rivosinc.com,
  samuel.holland@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-25ab7f97-42b6-40a8-b96d-d387cbf54ad1@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_061714_297784_755E4CEB 
X-CRM114-Status: GOOD (  16.08  )
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

On Sat, 26 Oct 2024 10:13:52 PDT (-0700), samuel.holland@sifive.com wrote:
> Currently, RISC-V NOMMU kernels are linked at CONFIG_PAGE_OFFSET, and
> since they are not relocatable, must be loaded at this address as well.
> CONFIG_PAGE_OFFSET is not a user-visible Kconfig option, so its value is
> not obvious, and users must patch the kernel source if they want to load
> it at a different address.
>
> Make NOMMU kernels more portable by making them relocatable by default.
> This allows a single kernel binary to work when loaded at any address.
>
>
> Samuel Holland (6):
>   riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
>   riscv: Allow NOMMU kernels to access all of RAM
>   riscv: Support CONFIG_RELOCATABLE on NOMMU
>   asm-generic: Always define Elf_Rel and Elf_Rela
>   riscv: Support CONFIG_RELOCATABLE on riscv32
>   riscv: Remove CONFIG_PAGE_OFFSET
>
>  arch/riscv/Kconfig               | 10 +---
>  arch/riscv/Makefile              |  1 -
>  arch/riscv/include/asm/page.h    | 27 ++++-----
>  arch/riscv/include/asm/pgtable.h |  6 +-
>  arch/riscv/mm/init.c             | 97 ++++++++++++++++----------------
>  include/asm-generic/module.h     |  8 ---
>  6 files changed, 68 insertions(+), 81 deletions(-)

I'm getting some build failures

riscv64-unknown-linux-gnu-ld: arch/riscv/errata/sifive/errata.o: relocation R_RISCV_HI20 against `tlb_flush_all_threshold' can not be used when making a shared object; recompile with -fPIC
riscv64-unknown-linux-gnu-ld: arch/riscv/errata/thead/errata.o: relocation R_RISCV_HI20 against `riscv_cbom_block_size' can not be used when making a shared object; recompile with -fPIC

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
