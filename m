Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D5C9C27C5E
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 04:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NFHbNgfJSC4KPM9jiqYzi+V14B+6jC73WaDCIYLQha8=; b=SaNQ2MV9swXMwM
	nhttTbTf7Tc1jvNQzWWJMdDIciO4HS4Y/UF/pMQh0aV1yMpb8TrKwDpplOw2bnf4FtS1uMvTc3P87
	mwGdgTUslkQHMcGw3MgR+aIUz9TzqNWu9TBGf6Whz41lXefGLHlD3laplZKtg9PhKHQ12E8PuPKxg
	YrhziAqAHpb0DHwfuay8+kkpygLUsU7khUGtkdv13ghR+K7cju9yQszVQHLEyaNf9DjI9Qy1k7v+m
	rP23fxECjkpqTDuFYaaYWE2JYmRQwRbjQcwOcVgpBP+lRk90H+ijY9+ISOao8IVjzTHm8x2g07gAc
	QRGf+itTkRsoEkZeBgzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWjq-00000003lBL-2q71;
	Mon, 10 Jun 2024 04:34:35 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGWjc-00000003l6F-2lFy
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 04:34:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-70255d5ddc7so3275584b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 09 Jun 2024 21:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717994059; x=1718598859; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Fr3eTbiGcT0MgumDiK+9BwQOfWnwY8ez4n4N4g+wa1Y=;
        b=rUWkqN9lKJJTPyc+WydiHq1FazW4FhfCb+QbPcGnAzahC5FKvShRGc+oR3yEDhYtwN
         6nx8ECdx7q0Gn61jzfQmVQVI64NRwOO9+ft2/+yjX9XU/heBsZzgahs931gpGY/Qrdrr
         CHxM4zVRJdcmB12URMkCQ6WjjEax8i6GE1NIzfrG6/NZ8uQxU0Xqi7tiNs8mqAm/W5pr
         8fvlC8oWtRIQmKJQwZRjacQE2kwrfRm1rq1O7Jp0qrNfAX9SflGVUx2dVcW/sAvkTOP9
         6xm9ZeIWdmh/gu658S030wzK7lfACuDK6djUoCrMJIztPT313tpIRTKaJYoZ+Znrb3DA
         pCHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717994059; x=1718598859;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fr3eTbiGcT0MgumDiK+9BwQOfWnwY8ez4n4N4g+wa1Y=;
        b=frsQLGV1xmPv/kRo4ebsy0xCGVcct+13QkWWVlKk1gYEpjJYgTsLw8bBG6HvMSMl9o
         5DJCBy1Rrj/3XZ41PpW6OpdQOcqcLHfvpYDCIcrThbJg6eslDa4esxOIcT7kznkLbgVL
         YgkISkwQL/YuEJzmEJp9IG60hMQ8KSWnUVrdtKFGNSyfRzfbuqWi+Y7mCPQM+RyMLbo8
         ELyilMk2g7TYitig5ccNcM+JEqzo0uLdWINRWWm/CVWUYJDsqke2TrdV8oley8aTCFTQ
         lB3QvtlTPW/V81DbA+JCBjbUA6BJbuSaXkwqtKFVCkx/jIejWbK52ilplVsRtfTNZZ3u
         O9Iw==
X-Gm-Message-State: AOJu0YxaMJbefdLr+L8EoyGpHkej8VlHneDUe6G1ABxX0C2rGx+xoEp6
	QTrv4k6/3s5NtcaO0xgdpWvWh/s4rnT8VltRyJfBNypzfSqngOGx5d8DoV7OMBs=
X-Google-Smtp-Source: AGHT+IHq6A+UIx3IEQBSKTe7GgL5CzygT7cxfhkVnFAgZMvsLgLzmjkayawaDxFpTlt1bDFrNXhHtQ==
X-Received: by 2002:a05:6a20:4307:b0:1b6:db6c:11dd with SMTP id adf61e73a8af0-1b6db6c1300mr2423830637.9.1717994058870;
        Sun, 09 Jun 2024 21:34:18 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c2fe295cf5sm1894756a91.47.2024.06.09.21.34.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jun 2024 21:34:17 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v2 0/4] riscv: Separate vendor extensions from standard
 extensions
Date: Sun, 09 Jun 2024 21:34:13 -0700
Message-Id: <20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEWCZmYC/42NQQ6CMBBFr0JmbU1baSSuvAchpNJRZmFLZrDBE
 O5u4QQu30/e+ysIMqHArVqBMZNQigXsqYJh9PGFikJhsNrW2hmn5DNNiec+YwyJe1xmjLskyvt
 GG6uxthcNxZ8Yn7Qc7bYrPJLMib/HVTb7+k81G6XVQ7sQHPpraMKdKSehOJyH9IZu27Yf0mnBI
 cUAAAA=
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717994057; l=3754;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=/afvdwdS5T+JmlJvh4qFW+jrHrs9DRIpURfuaIzUh48=;
 b=lAT+wDc6icEbmsxxl5zqmyAhQNHCOxSxTmEr68cJziEzvXcUocaHykHQaiGGdyL40vDp0QK61
 pH5gFFP/f77DUf81W3ARk/2aWgOVnkFO0AvnSLnd974MUCcd6idR4fz
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240609_213420_900082_7DECBB31 
X-CRM114-Status: GOOD (  13.90  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

All extensions, both standard and vendor, live in one struct
"riscv_isa_ext". There is currently one vendor extension, xandespmu, but
it is likely that more vendor extensions will be added to the kernel in
the future. As more vendor extensions (and standard extensions) are
added, riscv_isa_ext will become more bloated with a mix of vendor and
standard extensions.

This also allows each vendor to be conditionally enabled through
Kconfig.

---
This has been split out from the previous series that contained the
addition of xtheadvector due to lack of reviews. The xtheadvector
support will be posted again separately from this.

The reviewed-bys on "riscv: Extend cpufeature.c to detect vendor extensions"
and "riscv: Introduce vendor variants of extension helpers" have been
dropped in this series. The majority of the code is the same in these
patches, but thead-specific code is swapped out with andes-specific
code. The changes are minimal, but I decided to drop the reviews in case
I inadvertently introduced issues.

The alternative patching code from "riscv: Introduce vendor variants of
extension helpers" has been migrated to "riscv: Extend cpufeature.c to
detect vendor extensions" such that the andes patching still works in
that patch.

I also fix a bug in this patch from the previous series that the Andes
extensions were not being properly enabled due to the manual alternative
patching not incrementing the id to be greater than
RISCV_VENDOR_EXT_ALTERNATIVES_BASE. 

To: Paul Walmsley <paul.walmsley@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Conor Dooley <conor.dooley@microchip.com>
To: Evan Green <evan@rivosinc.com>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

---
Changes in v2:
- Fixed issue in riscv_fill_vendor_ext_list() that initalizion was only
  happening properly for the first vendor. Add is_initialized field to
  riscv_isa_vendor_ext_data_list to allow intialization to be tracked on
  a per-vendor basis.
- Link to v1: https://lore.kernel.org/r/20240515-support_vendor_extensions-v1-0-b05dd5ea7d8d@rivosinc.com

---
Charlie Jenkins (4):
      riscv: Extend cpufeature.c to detect vendor extensions
      riscv: Add vendor extensions to /proc/cpuinfo
      riscv: Introduce vendor variants of extension helpers
      riscv: cpufeature: Extract common elements from extension checking

 arch/riscv/Kconfig                               |   2 +
 arch/riscv/Kconfig.vendor                        |  19 ++++
 arch/riscv/errata/andes/errata.c                 |   3 +
 arch/riscv/errata/sifive/errata.c                |   3 +
 arch/riscv/errata/thead/errata.c                 |   3 +
 arch/riscv/include/asm/cpufeature.h              |  96 ++++++++++------
 arch/riscv/include/asm/hwcap.h                   |   1 -
 arch/riscv/include/asm/vendor_extensions.h       | 104 +++++++++++++++++
 arch/riscv/include/asm/vendor_extensions/andes.h |  19 ++++
 arch/riscv/kernel/Makefile                       |   2 +
 arch/riscv/kernel/cpu.c                          |  35 +++++-
 arch/riscv/kernel/cpufeature.c                   | 137 +++++++++++++++++------
 arch/riscv/kernel/vendor_extensions.c            |  56 +++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |   3 +
 arch/riscv/kernel/vendor_extensions/andes.c      |  18 +++
 drivers/perf/riscv_pmu_sbi.c                     |  11 +-
 16 files changed, 438 insertions(+), 74 deletions(-)
---
base-commit: c3f38fa61af77b49866b006939479069cd451173
change-id: 20240515-support_vendor_extensions-aa80120e4230
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
