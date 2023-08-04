Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E13BC001DB
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 21:39:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FLMUKcSMNUBJrd74Ho1CPqJEbYYdS7/F4rGfjBOP+08=; b=jrJNxFNiPt5gvd
	JiPh24zqa4dK5RBmLPZ0aKOLcO9za/1ANBHlhajqxUzk/+Wh9RSV5FaW2qUdhHeN519GSdMCbsW4L
	01o5ox3VYUs+MggRJtqb9xZwH+kSotVjFNeXxN7Vdbk5i5mOiA3On95TrHBmpKH5P89FNW1IDkVAA
	+6zBb0SBPM5yMr2F6coOzDHexJozwHVvlW7C/7+qEQH8x+gyR++4k1no3cL8nWjH0Vmb/ddXahMSP
	AEpiGfJQFtsPddJbFZlJ04t6rRK+ktg56QjYl5k6VcliD1OnWR7P+/2VyMIHY4LgiCARveH+Gnyi+
	VYBh7OXDP5AnTiosVpwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2Vg-00DIpN-1T;
	Fri, 04 Aug 2023 21:39:00 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS2Vc-00DIoh-1X
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 21:38:58 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-268128a0105so1647493a91.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 14:38:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1691185133; x=1691789933;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbiyRvXqeT+unFkVa+5zDQqAm6s07WUgRXjk/fKnxm0=;
        b=4UCnv2k/x79wuxtrhNSQgvc6zjUFTz62LA0H3NGPSJUp9aTOuqJoTTWrrgVuWoNSSc
         aDhaAKydeTs1VDlx8oG3T6muGcvW80M//MaOf96VvsQQB+sKl/TI23uZDybb+XEs6Nje
         i+gT4RhhdUpxJATzmDCcDYFW+V6myaipj2x/+BgBUm4Ht+lcv27u1up/nVbvnDdiVvOS
         dOCH8fQSxaisXbY2m+hMVFmr+AjsRu0l8IDiLoD2w9Z04gt0o8NeQwsMN7NHivv+aMCk
         K/L+dVsKMkiHx539pvvf3uYq319kQ/Oyog/NULDoe4dnQyemA+jXDClYpa5Jg337bdPh
         ePWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691185133; x=1691789933;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbiyRvXqeT+unFkVa+5zDQqAm6s07WUgRXjk/fKnxm0=;
        b=RVja9Y8RmbXB+ORtiexkk83OUQXF2Px44KJScgmxu2D9WJV8fM5t9rtELeNtKFJeqE
         XzF6luChOYLcNCkE3GFf9cNNayFltEwuSHBLawv15m7RWivqaGOejmbS7l20NA7b86uU
         fPtQvbRfitYmAC+HDPeGPoO3Rvu5ycLcwYmD+gIXYbj5dnfaDGGC3e8g0KZpovT95HrL
         2dXD2M7dLWNPLb5fkxYtqw4c+32iAOTxw0OH4LSjDamIV5yG/hqDHvEsJg58szZAZXfE
         b2CxEtRX71SKWHj6/nAdQWc4S7EFuNUaat8fgVbzJrQeyos0ogQYZ8/3VSS/14cR8PsF
         PpFA==
X-Gm-Message-State: AOJu0YwdLlFdawtFhS+eoVd4TIWvKWWPQQV8xW9c6gXCQWEpF58Ar2c/
	PIKowi+HGv0OGhhu3/w7g+6FFg==
X-Google-Smtp-Source: AGHT+IHJTm/3frn0Fe4TAyLYSHtB25e8jdmO+cHzPnT6Uz+KgdBcsqx5LtvvfYk7th5HxiVphRG1nQ==
X-Received: by 2002:a17:90b:4b04:b0:268:dad:2fdc with SMTP id lx4-20020a17090b4b0400b002680dad2fdcmr2892911pjb.21.1691185133600;
        Fri, 04 Aug 2023 14:38:53 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id br8-20020a17090b0f0800b0026801e06ac1sm1920528pjb.30.2023.08.04.14.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 14:38:52 -0700 (PDT)
Date: Fri, 04 Aug 2023 14:38:52 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Aug 2023 14:38:35 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.5-rc5
CC: linux-kernel@vger.kernel.org,         linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-69f4a2f3-c179-411e-a85e-683bb3e088f3@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_143856_722223_36C807CD 
X-CRM114-Status: UNSURE (   7.74  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit ab2dbc7accedc2e98eb7d8b8878d337e3b36c95d:

  RISC-V: Don't include Zicsr or Zifencei in I from ACPI (2023-07-12 10:04:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.5-rc5

for you to fetch changes up to 640c503d7dbd7d34a62099c933f4db0ed77ccbec:

  Documentation: kdump: Add va_kernel_pa_offset for RISCV64 (2023-08-02 13:50:37 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.5-rc5

* A pair of fixes for build-related failures in the selftests.
* A fix for a sparse warning in acpi_os_ioremap().
* A fix to restore the kernel PA offset in vmcoreinfo, to fix crash
  handling.

----------------------------------------------------------------
Alexandre Ghiti (1):
      selftests: riscv: Fix compilation error with vstate_exec_nolibc.c

John Hubbard (1):
      selftests/riscv: fix potential build failure during the "emit_tests" step

Song Shuai (2):
      riscv: Export va_kernel_pa_offset in vmcoreinfo
      Documentation: kdump: Add va_kernel_pa_offset for RISCV64

Sunil V L (1):
      RISC-V: ACPI: Fix acpi_os_ioremap to return iomem address

 Documentation/admin-guide/kdump/vmcoreinfo.rst            | 6 ++++++
 arch/riscv/include/asm/acpi.h                             | 2 +-
 arch/riscv/kernel/acpi.c                                  | 4 ++--
 arch/riscv/kernel/crash_core.c                            | 2 ++
 tools/testing/selftests/riscv/Makefile                    | 2 +-
 tools/testing/selftests/riscv/vector/vstate_exec_nolibc.c | 2 --
 6 files changed, 12 insertions(+), 6 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
