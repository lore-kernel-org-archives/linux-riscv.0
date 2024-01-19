Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BCCBC47DAF
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 11:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=87aS/2Cze/0Wf8uPFjkP1p77njiocKS/Y577RTMBvkI=; b=Wzk0ElelqWEDLl
	cXVxGT8j3CcoUXRpEuTzqFdZi8p6HgkXyqBEDSopOdsi0MO+bYxPvE5NX0cYttbh7WvUFpZQIBgzT
	/1USqOhW7fLvrVHct1+W8eQMte+gnI6BCsEhrbVXus2USdhr/gRi7+Ip6S4G/qnIOVnERheJOFl1v
	3vHZ6J8U2GXd85VQV6bqpLmOKRXZOpKYpJLAX3wiSmRTFiz3TVT6jALf7o/VImDBpd44P+ZhTto1R
	9ySmNQaY0c0Cc0fb1oTh/FwInMFuf5B2/XAa8SbVBHlY7Qy87yi8AY1geCqQ+AJBL2CKw4c6tTJp7
	7o4eMxSQtKoGV9jZBcJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9Q-005Eji-2c;
	Fri, 19 Jan 2024 11:35:08 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQn9N-005EjH-1A
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jan 2024 11:35:06 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-36197b6e875so2689985ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jan 2024 03:35:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664102; x=1706268902; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xp7UR5FVgwMPuq2WVimakycKIljY+vuuiyqjnbxZrlU=;
        b=EI/saUr0ECsW4nBUvmTOmRvDBbpv45Pw1noYUWlhmjRDBTxRNbfzS9qkFWhYzCaEE8
         6Ti86llYodQR4h/jJ4DzCf/ZFT3rcIJ+LGcZqNFtUMwM3zcXGrXi8/DES6ugrJEk8pj8
         0aO/nhetO+yZ0exlyrSTVTh89TqsVHfGv54NeOQu+px1wGL4+RFz929/zBc8QIVR4mUg
         kWVeV6dKZsB9i2mc380ZHQlTn5ePq+Y8ncMFCz26N76u1eQzIRP0qnOIbDd4JJBLwejt
         Abyys/OZ9rja+GfvKzlugLCVph20/EV9uyt7SKIsnbuUxK8iD/cDb43Ajjh6DJzZe0g1
         chgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664102; x=1706268902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp7UR5FVgwMPuq2WVimakycKIljY+vuuiyqjnbxZrlU=;
        b=kFYzYO8EY5S0fB75WzXyRRO7uQK6NTkUtm4rsN2J+qyTMl8XwppNCEtZJDK3KN+gOk
         ED3qeGEA9QstzVHe0CshPFWtpIiYcP6gAshtEmObYSPzvz6x2T06ySySVWTt0cKWTfkH
         x8EVS+TSRJXElgxECJxd3eM+tgEZIPbfzuRTyqyIbW5n751/tr0CRH0JTy5fJzHUNpXx
         bdzN/2QOq/O6j0gVbr3J8v7Ype/0YqguhV+ir7iKbIICr/dZTkhoIrfLpxXbMaHT3cZD
         zu8VPkFyEzfOhn2Xa2wKswxAE2gzRUFPy8kE9CbQ3OEcBtsNGCRI8snFEEf0oaZR1+C7
         iNCw==
X-Gm-Message-State: AOJu0Yz5qPvMT4kkhUq/Ydwj/E9ezARZ1MPW3pKDj1M4SSWs+4GglxWx
	koPrSS/hqRZ+JCzCe++xnMQHLmmlKqKU4qpY5OdTwc8ruY1RYv8MKiD8zFdu4Y4=
X-Google-Smtp-Source: AGHT+IHhZC2U/hjG0mise1koTMiVKhIOk+6bnofKSdYFddaeNjsDxTHYd5Kh49hCXzNRa8H1IDwPPQ==
X-Received: by 2002:a92:2907:0:b0:361:9315:5356 with SMTP id l7-20020a922907000000b0036193155356mr2449028ilg.10.1705664101928;
        Fri, 19 Jan 2024 03:35:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:01 -0800 (PST)
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
Subject: [PATCH v6 0/5] RISC-V SBI debug console extension support
Date: Fri, 19 Jan 2024 17:04:44 +0530
Message-Id: <20240119113449.492152-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033505_430357_46397E64 
X-CRM114-Status: GOOD (  13.93  )
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

These patches can also be found in the riscv_sbi_dbcn_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased on commit 9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
   ("Merge tag 'for-6.8/block-2024-01-18' of git://git.kernel.dk/linux")
 - Added Acked-by from GregKH in PATCH3 and PATCH4

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
