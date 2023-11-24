Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D381C61DF4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Nov 2023 07:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kkK2wbpaEEcibo6NxJIzeYy3vR7c+Ih4JXsODJZjI0k=; b=4aGOzNC1yDsr3T
	sLgPTO4oQE8fSXihPbU4LkyTTAFO8UF5P3+LE1QIwUO9ayGPXXGoPRteVkXvBEol4C4SD6J2zGdmP
	tmldbWtwH3iDQPzmRR133ZqnomxLH6RT8sD+lYDNw0did69ryQAyk5cU8mfYfyQlHeKWfQSw4KLNk
	NnpIx5gE6GWOQhwOMzUh68ncbA/Kpd8IweuepZkINUSEKJg9S3oq6OdPCOthwf20LfktYZzpYseRS
	V9SFhvS7JAtLrv3Dr1H26G6TVvjy5uegsoWGMvRotsMtMRL7wOEafYaTlXDsLJDpV1GQvm4rAN6n4
	Cw9+p06u7/qegCPM7IWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKb-006LYL-1p;
	Fri, 24 Nov 2023 07:10:29 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6QKY-006LXU-1D
	for linux-riscv@lists.infradead.org;
	Fri, 24 Nov 2023 07:10:27 +0000
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6cd0963c61cso886116a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Nov 2023 23:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700809824; x=1701414624; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O91wfSpN9ObCdaEwiURAAaoPifbKQnuX2UDqzMk/9EE=;
        b=M46slxbYjoMvN3tf4N1BE/H9DQ8Pz1YnC5wNfgL2JQqq9zJDZfx1axYxEVal+GCJtk
         Ck/IEuJcOqjnXp4QR+yYbJ4PHmeNLTCyuc52N667U+S6uNDiaWYAyWrsdebAdNgrfijw
         f4TPOQrbAbVbWghbrvJvACSJH2oYY2M4J0LhN60UgjLDic5DuQifos/fPQwDI/XrsYMv
         5AQL8azXjR8cK5hvKdTaC/VXQnL2ydcQd2lSzZuHnBG2jngI8Zfk7t8D0Dfyu4Eq4jw6
         Ivx5+pfAvs6RovJofn/xXcCOpvjUQsLd2NX6cWXxUYsAib0paY16VjXaGEwcrbt87XqF
         hjlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700809824; x=1701414624;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O91wfSpN9ObCdaEwiURAAaoPifbKQnuX2UDqzMk/9EE=;
        b=VZeBh2d1UwVYRr51lgnGuV5PcDqK74saUv1yh49B5rd/MmpDkVQNuObDf1j/mzTqv+
         Rskan/CyWhbJBMFaUU4z5+HJQqMsRJy5lJYH9VRTb3T8WWe0MQvnQ98EUJmEtYiz8DFq
         55w7d0DZ/0TpKt1kW44LWjKJrCsY8PMpD8BJdlUjfzUyQ2zvsD4jI7rXp35UmOIEI95e
         mcWtanwme2cudQiSkmD49rydsnepvE2slGWkVf0dUn+5YeH9UTXVx0yDJcO/ZH+g4mVi
         g/x0RXsW/pfwr/dh50SGGxlQHpEoB7s9lMp86xVosDnu2sCNtxn5ou3BPNZwUGDYnOBY
         yQvg==
X-Gm-Message-State: AOJu0YzribwSJmYVoOCDW/3lvb7bjnIiSE4wPH01LASyi+6XWEKioyUp
	As2PN4IUltVNIVpnJLktN9an6g==
X-Google-Smtp-Source: AGHT+IHoAk7libxxmoEnwyG+ICVQkzzI6uc6joEaMVEQl0m28dbDgLSf9VQd9ACWrQm5vBhlWCIngw==
X-Received: by 2002:a05:6830:603:b0:6d7:f66d:b0ae with SMTP id w3-20020a056830060300b006d7f66db0aemr1910766oti.5.1700809824530;
        Thu, 23 Nov 2023 23:10:24 -0800 (PST)
Received: from localhost.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id e5-20020a9d7305000000b006c61c098d38sm435532otk.21.2023.11.23.23.10.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 23:10:24 -0800 (PST)
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
Subject: [PATCH v5 0/5] RISC-V SBI debug console extension support
Date: Fri, 24 Nov 2023 12:39:00 +0530
Message-Id: <20231124070905.1043092-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_231026_427694_E3925D9C 
X-CRM114-Status: GOOD (  13.84  )
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

This series adds support for SBI debug console (DBCN) extension in
Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from the
riscv_zbx_zicntr_smstateen_condops_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v5 branch at:
https://github.com/avpatel/linux.git

Changes since v4:
 - Rebased on Linux-6.7-rc2
 - Addressed Drew's comments in PATCH2
 - Improved sbi_debug_console_write/read() to directly take virtual
   address of data so that virtual address to physical address
   conversion can be shared between tty/serial/earlycon-riscv-sbi.c
   and tty/hvc/hvc_riscv_sbi.c
 - Addressed Samuel's comments in PATCH3 and PATCH4

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
 arch/riscv/include/asm/sbi.h            | 10 ++++
 arch/riscv/kernel/sbi.c                 | 66 +++++++++++++++++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 37 +++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 27 ++++++++--
 7 files changed, 133 insertions(+), 12 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
