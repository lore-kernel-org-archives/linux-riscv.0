Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00BECC3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=stq6sEkNi2dvxS4LRZMYMVxtTv1foy9FaxCGfihUV+Q=; b=YJUbKFs/NgfSr9
	uopLe+gc8+r6hRELJv/gUtrJTMzC6gCf11l4l1hc0djs0j62vmLOL36ocnYFjHWcIqQ88zUlGNOyz
	L2wikUQrKxP/iwm3xzzti9v6DIdsiHtqX9h9wWgFL1L7SYkognA/cz+sEza2rZEHveiofTIiGTLWX
	Ou/XwWHEtHke4ubAIayqatakTw+PVXzDPx35IWTOOraJFjrptEdMkiaW8wHA0XVBe7VdxhqPTayiI
	rwkw7jhAIEWyaupHOqpnJ8bG7EUJC4DCw/0WRGPba9BHOo+ZQoK1V4kS3OdvFobfvmJBJCbld3FTL
	6FwARXyGjd9Tv2Ykgong==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqGj-00000003Deb-2APA;
	Fri, 19 Jul 2024 16:15:41 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqGf-00000003Ddp-3e36
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:15:39 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-70b0ebd1ef9so768053b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405736; x=1722010536; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gu/A/EzVLKnX0kLY7e25xig89MWGfDHaNY+F522h6y8=;
        b=2LALNPbx/YRSlJjK367AjHX2xmzmMK3jT1RGYumMf33RokfKhuhs886BNanoNH9yfi
         /uuk0z7qOmTt/3h3xOKnYubujhz8ij4GU/FopSMcKmpmlc5WclVyBNY7Yaq8zkdgYsyk
         ZLECc1BhjbsZzC8vDdbIUeEw89pW0ckr7rf5u4N2vIeLDIMpenR00FaVmJutnbfbfmIw
         +Sq9CMCkmQJaDG5S1GyaaAIn6vXaMlKpphSaF2TDjhGKfL2LsS1cyPkJc645bO8t8wsN
         Q+65vM8jxsMHdjjWG7A9hDLjI8M5ws9/cUfRsLP1uKC6FJBln7KGbkGuGugWiE5i5bcD
         s/RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405736; x=1722010536;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu/A/EzVLKnX0kLY7e25xig89MWGfDHaNY+F522h6y8=;
        b=DpOw9S7TR5eTzHz0DFzq0JyM5pwgf5VeKZslTWw1NITcOXibUYUl1VwS4AXjRwRsuO
         76PecSb5UrSvb2QHWH54TH+iMwaG463HuBCOfEGaRNwOE5Uc3jV6x/wWLeJwnAquoIBn
         mNfAku33unoyRhv8as+XgD2rGK8kQq84DBkFNB/gLJKAgIZNSx3RNn5PGLaJ+eJccZJO
         tcSc5arQf6DRqjzljCdsP3dcpwqFLAPjuYibCXmtShkxMh850j0lMitMJxDrwF049892
         PXGWk/hmxj1Dm4vRkNy42OvQMcYX2W9BIv5tNdk90jVOKgX6Jj8TCdXCYBrRhSlmkgU+
         lPCA==
X-Gm-Message-State: AOJu0Yy1O1UlSh6moomeB2BUWxATk0QF0w3vilJQwUKqUtic5XAP8glP
	XTW2GdQu431uKciEE2CvZxpyRAVIZzD4qPBhhajAslh0m7+xXtO8qRnGC7sj35k=
X-Google-Smtp-Source: AGHT+IEgUUMEN1HusaJe9qHUVarUdtVNZbLhHSO6lGUy4RRuiPTCm31oa5fvNvfmg+Hszf/UGe8rYA==
X-Received: by 2002:a05:6a20:7495:b0:1c2:8904:14c2 with SMTP id adf61e73a8af0-1c42299d86bmr666535637.37.1721405736589;
        Fri, 19 Jul 2024 09:15:36 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-79f0ad73cc4sm579589a12.29.2024.07.19.09.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:15:35 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v3 0/4] riscv: Separate vendor extensions from standard
 extensions
Date: Fri, 19 Jul 2024 09:15:17 -0700
Message-Id: <20240719-support_vendor_extensions-v3-0-0af7587bbec0@rivosinc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABWRmmYC/43NQQ6CMBCF4auYrq2ZFqrgynsYQ0o7yCxsSYsNh
 nB3CxsTF8blP8n7ZmYRA2Fk593MAiaK5F2OYr9jptfujpxsbiZBlqCE4vE5DD6MTUJnfWhwGtG
 to8i1rkBIwFIWwPJ+CNjRtNnXW+6e4ujDa3uVxHr9R02CA29BWatQn2xlL4GSj+TMwfgHW+EkP
 9gR6l+YzFity6ITnTVtW39hy7K8AeEP0PcSAQAA
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Yu Chien Peter Lin <peterlin@andestech.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405734; l=3549;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=T11RUDtdZrxQtRlAe10gZYbTABjz9NhpNEYG6ImKGDo=;
 b=YvM9kd3OhQ5dtUus6JjV5CxJNsqvgUI1okaBNI9QJlEuXWV8kW1hmrx8FCnHiXN7zEdgcshu9
 Y7CG+SY0/UnANmLoJxkLgj2l8dWHDO8uvmFMETOlRa5c4Z5oUuYgzI0
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091538_207638_81BCD329 
X-CRM114-Status: GOOD (  13.16  )
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
Changes in v3:
- Rebase onto for-next as there have been a lot of upstream changes!
- Link to v2: https://lore.kernel.org/r/20240609-support_vendor_extensions-v2-0-9a43f1fdcbb9@rivosinc.com

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
 arch/riscv/Kconfig.vendor                        |  19 +++
 arch/riscv/errata/andes/errata.c                 |   3 +
 arch/riscv/errata/sifive/errata.c                |   3 +
 arch/riscv/errata/thead/errata.c                 |   3 +
 arch/riscv/include/asm/cpufeature.h              | 103 ++++++++++------
 arch/riscv/include/asm/hwcap.h                   |  25 ++--
 arch/riscv/include/asm/vendor_extensions.h       | 104 +++++++++++++++++
 arch/riscv/include/asm/vendor_extensions/andes.h |  19 +++
 arch/riscv/kernel/Makefile                       |   2 +
 arch/riscv/kernel/cpu.c                          |  35 +++++-
 arch/riscv/kernel/cpufeature.c                   | 143 ++++++++++++++++-------
 arch/riscv/kernel/vendor_extensions.c            |  56 +++++++++
 arch/riscv/kernel/vendor_extensions/Makefile     |   3 +
 arch/riscv/kernel/vendor_extensions/andes.c      |  18 +++
 drivers/perf/riscv_pmu_sbi.c                     |  11 +-
 16 files changed, 456 insertions(+), 93 deletions(-)
---
base-commit: 41c196e567fb1ea97f68a2ffb7faab451cd90854
change-id: 20240515-support_vendor_extensions-aa80120e4230
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
