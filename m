Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85AEC0218F
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 07:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DI6K+5UqtJuN47NRLkXs9di2ljriqr/qEZtGnQcIAVg=; b=h54Q6e+Tz/NXwA
	gFgJqIddNzAIAeYR9PyTCQYbr9Dn2aRTNdKlxPWuzA1YlIgfLdP8w8Q264+0iMbtOXRBlkr24n/kG
	py7xfNvLFRyP2Naqc0lQkjtCtmVO/7HPe4loZXMPJ1Xwd7JsKm85r2qflRc6vzLcyJN9zdnP1+1E9
	aIYVLuuInyw3+BKV1zYNNcsCLDMs5gtKf3MRheRw6S9RBH3R/wWANUG8xxa3UAq7ItD10z79KXT1e
	ESP9zMvRsUh4pOK+6tQbTzmEkTRvKwVTTQViyoj0LyepJ8AOxG1WddqucLDUM00MJ+ZkuYksicOuo
	kwgC7bHgy5tkMG5v1YPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDlt-0000000HSkP-47zO;
	Tue, 04 Feb 2025 07:55:01 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfDlJ-0000000HScD-0hDg
	for linux-riscv@lists.infradead.org;
	Tue, 04 Feb 2025 07:54:26 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7b7041273ddso466022585a.3
        for <linux-riscv@lists.infradead.org>; Mon, 03 Feb 2025 23:54:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738655664; x=1739260464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=NPpZ/6BF6H2cLy+Ialrel8K9hGg89uuH9aj806XvbEowxuj6euQGvjjQTW57SBTno2
         GFXypnF1u/O48IQ+cBN8HepnOe8qBNWTagnjL2i5bGx0koFb3vgrj/QKp5KVHFjNuogh
         jebwS1Eyx9SWP81Q4/0RoRv+GWO4KAPHhbnfeHwVC2IDxQlKpLHpgiFzqxpAiPW+bTCA
         DmF/6eveFcdaec/0mCG/kQbc53AxSYfLwZqtJ98pAxiyTCa1zsGCu4etwHAX4xUWEXUV
         01VBLUTgkZ0eW9IPyGXQH5yRDpHTpNfAoJk+HQtvtGk45E5zGjPzAmdpf6vIYx7K7sX2
         UtRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738655664; x=1739260464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q9z54JtaeX5gSz2dbf+6FdDKOtIHT059atUvBQkTIU4=;
        b=NENWenunSx5jnXs+iQdLW4YGkME7eOdLm52YutQNsD+5Qm5/n0qo8igfUH4yAHNjIe
         VbkDNCAuIzmRlsdHzQhA+jwA+Y5EQcocgr9CzSyrl+Rj6AR5MOBEoHQRGIDhIn8TpQTO
         o3TaLqjiDjuHfLNDE8KQ0cQTMtMmwlId4pC0IfyJBEb4uHSulT0V8ea/VMwaAouUv69X
         JXp1cumjcFSs9dQnigDLxpK9e/TWbHxAosCyH3A0O0kq7f6w/41gi2RP+rBK0ZYClxDP
         sXrqWMcaQWGD2uj+xZcfhuIJT7vgTqRMMqKzbL8MR701tNMUUwDGW0ASIp/IlRNnPoAh
         n+Fw==
X-Forwarded-Encrypted: i=1; AJvYcCWQ/c24SvMCgot7dESct2kasuDrQB8wNlfmL/elE9bCypGuFQIEqDsb+XLDGZ4p9MdXOmiNwkXKs0yfhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDHpbV/2qi9CCNwOkdGJJ13LGGQjC34wmi+drPDK+iofCh6pvR
	J36aDMxXvH/xC7GelWJGZwsJrtcC9oaMR9LZzu9RhAWEvlt5NSzNFhMKYtDEx7o=
X-Gm-Gg: ASbGncuQgy5bKUJz4YcZBJvNgANlLJHjJBBZ8UAiYDd5wXgiG9Yw5+TWyaN2JMqV4om
	d22qzyJgHDMivANz6g+8H1hwjK11fSgjx4YjjvuBN/lcALhLb1TvHl+ncAgSh8BocGGosu1xVpf
	xWYEPTDQJDpcROe3Yr7PO0QHrkoJrlIP4enHiEduAbqQn04L4+jOrxi8AmNC+UpZPn6vtEy9Epo
	us6q1m+1rZq5VhEybNxIk4fbQXCGgvDZY/MpwOaCRszteFUcs3u1HPuVWUv7QnoIYnfGXTx1YQw
	hM58Uy7/qTXOk8W+Gp+cstGGioLCIqbfPGN5+v6qSkMqI85hkzpz3+c=
X-Google-Smtp-Source: AGHT+IHnQYtrMWCiX8smMX+KNobk2NbP0fzLkqVqwBS3IWCPax1EIsVPqU/PPsh/vQevjqw+kgDNzg==
X-Received: by 2002:a05:620a:688d:b0:7b6:da92:fcdd with SMTP id af79cd13be357-7bffcce1d45mr3575797185a.15.1738655663645;
        Mon, 03 Feb 2025 23:54:23 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c00a8d05ddsm613373185a.39.2025.02.03.23.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 23:54:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v3 00/10] RISC-V IMSIC driver improvements
Date: Tue,  4 Feb 2025 13:23:55 +0530
Message-ID: <20250204075405.824721-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_235425_212513_A584A041 
X-CRM114-Status: GOOD (  10.64  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving to RISC-V IMSIC driver use common MSI
lib and GENERIC_PENDING_IRQ.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib
PATCH5: Preparatory patch for moving to GENERIC_PENDING_IRQ
PATCH6 to PATCH10: Patches use GENERIC_PENDING_IRQ in IMSIC driver

These patches can also be found in the riscv_imsic_imp_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased upon Linux-6.14-rc1
 - Dropped PATCH5 of v2 series since that patch is already merged

Changes since v1:
 - Changed series subject
 - Expand this series to use GENERIC_PENDING_IRQ in IMSIC driver

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (7):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device
  genirq: Introduce common irq_force_complete_move() implementation
  RISC-V: Enable GENERIC_PENDING_IRQ and GENERIC_PENDING_IRQ_CHIPFLAGS
  irqchip/riscv-imsic: Separate next and previous pointers in IMSIC
    vector
  irqchip/riscv-imsic: Implement irq_force_complete_move() for IMSIC
  irqchip/riscv-imsic: Replace hwirq with irq in the IMSIC vector
  irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED flag for PCI devices

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 arch/riscv/Kconfig                         |   2 +
 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-early.c    |  14 +-
 drivers/irqchip/irq-riscv-imsic-platform.c | 177 +++++++++------------
 drivers/irqchip/irq-riscv-imsic-state.c    | 127 ++++++++++-----
 drivers/irqchip/irq-riscv-imsic-state.h    |  12 +-
 include/linux/irq.h                        |   5 +
 include/linux/msi.h                        |  11 ++
 kernel/irq/migration.c                     |   9 ++
 15 files changed, 224 insertions(+), 157 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
