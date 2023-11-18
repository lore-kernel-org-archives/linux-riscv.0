Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0ED9C2BB3F
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Nov 2023 03:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xsZ8Zzri2GMNkCBUnBDEa+AtQmZJgYmem/36XN/FP7c=; b=aRLnRKyu2WtS4j
	4l7JoddgTC2qVihtlDqnmXYIOpH76a9AgC+EvII68y8WaGLd8a99jGhcalEH1uWl15r6/YCLIgHOJ
	+sU9zMouzkkkk3a9UrvcGGZXyHJEFbWIDWgRsVg7O68UcUFph9bjDsB9pXWCYsjyilwwnsQuGpkxG
	X963LVOLGwYRLgbPtLjYXz3X/ObeTuLqCBkRmDvKPvGre8pFdb/8RDcXeEB4c9EdWH4ZmsVEtsDeg
	7ovgc9lRYiMhJ3q7TbHuxpMVnVgFUUNOVmKFQp4TUj8npM+sPKXxD0gvP02GDl/gZZV1p25GERelM
	RJJSid7VqslFTLW/pKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBH-007n3i-21;
	Sat, 18 Nov 2023 03:39:39 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4CBD-007n1f-2F
	for linux-riscv@lists.infradead.org;
	Sat, 18 Nov 2023 03:39:37 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27ff7fe7fbcso2208290a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Nov 2023 19:39:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278771; x=1700883571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xk65QbdRKZdLNSQh19GKuOPbc61/SWIMytvbu8dUYc=;
        b=bVHCkvzbBHOFabAYPWbhwjGY2epbkiEMyEsizkPwfxHSHDopPhojvJsjn+mgIHkPRy
         jCi/O/nXb6buSfXQrW6Rxxp2wQuGlwvHx1eTlhBEYj22etJJzpVBEqxVGjZOHUPkkVT2
         PAF8t/fjHhX6Q9outDbjQtziC/rZT4CGfZJeSaOCS402A5VZdvDTBkUu7HMwtk2NrL3D
         ZwvchIUNlYX5PPyEOV+5LMFoXhNN1LTdd7HV6hXCpJTei01Qr628CGLYEbxXhtX72tbl
         /RqJIZTguw9iCGbY315JhpwqGn+hSjeVvDLlE3Mm4Plf7ByHC/gLPuEkDwrUZcqEeINr
         0u/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278771; x=1700883571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Xk65QbdRKZdLNSQh19GKuOPbc61/SWIMytvbu8dUYc=;
        b=q9wzZc7uUfY+H/JAvkax93ODb9Vt087qnKKoz7uv2KxHVImNEWupP01ONn2Tb802Sk
         GR3fBPlmMTx+w0u//Dhj+egy1RUSJsfnRKmA3h9R5QRXGnPZJp7f2cUomd6r+kXAXl1Q
         tn+Uub37flUxM8IINUgkXbWu3edgVfidDT//m8dV7ibrwLbkWPgY5RNec822KMqigc+t
         XlWr7wGEkI/7n8oRfgewxQdYsuQIH/9EYSqY0Fy4Um6hQVRD0kqKSaAeWhj4uZ0HYf7U
         HioExdAULdojuR1hKlIAhLcqqxtkbxk4t/9vyvkucdIAXY+wyFV1YgwFq74GrDyjkDIy
         v9lA==
X-Gm-Message-State: AOJu0YwrJlS38C8P2SzuqaVsBZATIrcIULZlK/trFWR3wHKjMZoP18eU
	lL9F02KTxhlKsv34wAWr97Q43A==
X-Google-Smtp-Source: AGHT+IEdivzV5yM9VLUbAmX/fPwvXT56J4szG18kUoyADgqsU5ZolAzZbNQxZHHnYCkaszm6OKc0Yw==
X-Received: by 2002:a17:90b:4a49:b0:280:4ec6:97e9 with SMTP id lb9-20020a17090b4a4900b002804ec697e9mr1593141pjb.30.1700278770582;
        Fri, 17 Nov 2023 19:39:30 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v4 0/5] RISC-V SBI debug console extension support
Date: Sat, 18 Nov 2023 09:08:54 +0530
Message-Id: <20231118033859.726692-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231117_193935_760717_57301309 
X-CRM114-Status: GOOD (  12.83  )
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

The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
functions sbi_console_putchar() and sbi_console_getchar().
(Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)

This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
and Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Rebased on Linux-6.7-rc1
 - Dropped PATCH1 to PATCH5 of v3 series since these were merged through
   KVM RISC-V tree for Linux-6.7
 - Used proper error code in PATCH1
 - Added new PATCH2 which add common SBI debug console helper functions
 - Updated PATCH3 and PATCH4 to use SBI debug console helper functions

Changes since v2:
 - Rebased on Linux-6.6-rc5
 - Handled page-crossing in PATCH7 of v2 series
 - Addressed Drew's comment in PATCH3 of v2 series
 - Added new PATCH5 to make get-reg-list test aware of SBI DBCN extension

Changes since v1:
 - Remove use of #ifdef from PATCH4 and PATCH5 of the v1 series
 - Improved commit description of PATCH3 in v1 series
 - Introduced new PATCH3 in this series to allow some SBI extensions
   (such as SBI DBCN) do to disabled by default so that older KVM user space
   work fine and newer KVM user space have to explicitly opt-in for emulating
   SBI DBCN.
 - Introduced new PATCH5 in this series which adds inline version of
   sbi_console_getchar() and sbi_console_putchar() for the case where
   CONFIG_RISCV_SBI_V01 is disabled.

Anup Patel (4):
  RISC-V: Add stubs for sbi_console_putchar/getchar()
  RISC-V: Add SBI debug console helper routines
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig       |  1 +
 arch/riscv/include/asm/sbi.h            | 10 +++++
 arch/riscv/kernel/sbi.c                 | 43 ++++++++++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 59 ++++++++++++++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++--
 8 files changed, 129 insertions(+), 13 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
