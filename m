Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A982FE77173
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Dec 2024 15:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XEnAayLz4wP7k0W9FUnKMoBK41SWNfhRhW29UpNoXSA=; b=cTdEQI3FBCAzMn
	DfOUuuR/qHGaSvCjSoZanVpsMg+ZkOu7htZRX2PDb3gpLEg+zIkgnnA4l1vCGhywJd2rTTxYf40fa
	cSYZacqbNFf7sr/GUeuM11Bn4iakvSnmOtSxuutCTHNFRULfPN56IIZz0Gxc5Jb4Prj/J9Q8lCheT
	BoXjKeLysHMwI8L8RwqNAL4IRaPW5LY+sCun+IEQeM769rIgTv9RjacXqOVUFWWwFem2bKN+9r2Gh
	3qxyXyFzdzIKPT61YPH6Bdeng871waCQOjnO3tdk0McXsdezkJhC0uHE0RGg7yzDUFg+HTlqePVzh
	ukSv1itiw9jLR6i77Tgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIta-00000005QK2-2hDL;
	Sun, 08 Dec 2024 15:08:30 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKIsW-00000005Q3w-1Yj7
	for linux-riscv@lists.infradead.org;
	Sun, 08 Dec 2024 15:07:26 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21561af95c3so29759145ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 08 Dec 2024 07:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1733670443; x=1734275243; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=;
        b=PcCKFOmcHdbLKwex7LqFkmlJgr6GrmZ+atzeNvDWpFztHDNvPJXdCV5jQk1Hpw+Ytj
         kBCIxyRX57FMkJzSiSOKV1BWeTi+jNlDSmnTU2OJjF4l0kTekEic4F33jTx6wC4N98eC
         +Q2yfO5886yzrteK68854vyGU60410+mzmqKRYtkeY62TxMvNn9/zdIinT292Hz5GiOc
         0faFy6ay+ncfMQ0JOQ3UB0eCUoDsJn0rNBG2BYXVC8sOh84xfq5VrGdzSCjwMg+f7f5X
         1DgRz8fp/aqbRN+G4Be6vuhZhN7IoG3zHOPS48tqbiAquSqRsEY+jx61ffk3LZVKB7vF
         lfEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733670443; x=1734275243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f1Ymbf7OkgbozNLV0biXsSYspAvpz9yJ0j5pghYtlNA=;
        b=uX9BJnav/8PKFBvJ9vf6FA+61yjmvw80P5RH+dY8h+15MqTH8DrZTuOSr6iVakKTbU
         hgBGAOhMqCT0fJ+RKNzq4+wp/dmV2AXev0D6i0Y/jiDt0H85mlK0cX06nBsf8/kVxWho
         5AMtM81Z2U0cbeKWlCMKZJcrO5iP67ay1nzXynPAF4VUPz4sjsbdeUCuGm3WkNu9h8bL
         WPdO2xuezharSOCUIzmAcL7sqZHlsgb7eHTX8K6kT/sruQJf1IAoK4EmkYOLEhDgRfBB
         ft3nem1ikPFKOjImKiw5xIe9W2vdQoFCLAvzxL+Fd9wzQim01vUA/3oElwZpAhWOa0A6
         +yRA==
X-Forwarded-Encrypted: i=1; AJvYcCV3b7yTy0r7P/dqgCYLdJfIa8adgGa+4Ma6ozdAjWCnYWkRwel/GaXk02rSKLQOW2dnIBvzlZGVIRll/A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2TLLGlw8CBlM5zjU/zf03cCvmuHtYX36P4YCY79ofnGZWnpxO
	jDfM325f3DvBrjR0taO5riKlTtR4gJ8ESac3/dGGq/kLkHnRF8ALpF27Mv7O1GM=
X-Gm-Gg: ASbGncuVvuvYGEGtk64hbrQF3kckyg8Mt5VwoIR84hwGdD1qvYD6kkCniqGnCKV61SE
	Niwhx1r/v3fdq6ESArixZ7E/kNz/uE2aFSco+B0Pw2dR5hZEjlRV+/g2IjNh0vfqlxefXH7SrCg
	IWG5ROvz3V5VQjtrDqDBrOfega9L51U826gQf2ewe4P/WqjXJ3vSZOdepGCRS5YDYUxbiYTL27c
	AFVtN0cmJ6vZvYA0AJliJHbV8mTRCpTEJ63pDHtau9Ds81tRHMx/h6EZJAwTDsM+h2wKw9v6BkB
	QvtifRztq+auJjw=
X-Google-Smtp-Source: AGHT+IHVg6kIJU/hjxCaltB8c3VofoPFS72J5bvbHqE3/3XeAkWqN7rWQDnyGstJdvLaD8pQZcM2/w==
X-Received: by 2002:a17:903:24e:b0:215:9d29:9724 with SMTP id d9443c01a7336-21614dc51d0mr152817175ad.38.1733670442680;
        Sun, 08 Dec 2024 07:07:22 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([223.185.130.223])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-216412293d2sm10274515ad.237.2024.12.08.07.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Dec 2024 07:07:22 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 0/4] Move RISC-V IMSIC driver to the common MSI lib
Date: Sun,  8 Dec 2024 20:37:07 +0530
Message-ID: <20241208150711.297624-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241208_070724_397950_54B4CBFC 
X-CRM114-Status: UNSURE (   8.09  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series is based on recent discussion on LKML:
https://lore.kernel.org/lkml/20241114161845.502027-18-ajones@ventanamicro.com/

It primarily focuses on moving RISC-V IMSIC driver to the common MSI lib.

PATCH1: Fix for handling non-atomic MSI updates
PATCH2 & PATCH3: Preparatory patches
PATCH4: Main patch which updates IMSIC driver to use MSI lib

These patches can also be found in the riscv_imsic_imp_v1 branch at:
https://github.com/avpatel/linux.git

Andrew Jones (1):
  irqchip/riscv-imsic: Set irq_set_affinity for IMSIC base

Anup Patel (1):
  irqchip/riscv-imsic: Handle non-atomic MSI updates for device

Thomas Gleixner (2):
  irqchip/irq-msi-lib: Optionally set default irq_eoi/irq_ack
  irqchip/riscv-imsic: Move to common MSI lib

 drivers/irqchip/Kconfig                    |   8 +-
 drivers/irqchip/irq-gic-v2m.c              |   1 +
 drivers/irqchip/irq-imx-mu-msi.c           |   1 +
 drivers/irqchip/irq-msi-lib.c              |  11 +-
 drivers/irqchip/irq-mvebu-gicp.c           |   1 +
 drivers/irqchip/irq-mvebu-odmi.c           |   1 +
 drivers/irqchip/irq-mvebu-sei.c            |   1 +
 drivers/irqchip/irq-riscv-imsic-platform.c | 155 ++++++---------------
 drivers/irqchip/irq-riscv-imsic-state.c    |  27 +++-
 include/linux/msi.h                        |  11 ++
 10 files changed, 87 insertions(+), 130 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
