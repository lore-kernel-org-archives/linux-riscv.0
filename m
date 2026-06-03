Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15F4DCD6E55
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jun 2026 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hA+vbYTKPL8tMUjF6wFLjNRb6vlSa5yryaRgHspq6tc=; b=iCrqP4EU79xQuv
	DI2+q18MNcx/1u5udNfFFB7X9zgjkaDupYcsMZqHLOoGPKw2T83u9JGBfNZBFesUA8/VP76MSJ+dE
	2ABRxHEHShDBwMbYQl6SKfjNaFotpHFiuHvsw9s1PsCwD/E+O0BxcRp5rToQY1DyxRdfFHdELpWjf
	vPakZ0k9+aA2HxO9tfjrKA09IAvHorcHNUTI8SinPQVrThv5cVKvBHyCOf7V7Zz/eNv8rQYsvYBbA
	redNVs+mLZUTb0OEdbIpzyCIViTGcCDti8F1dwERoWOzpxjpAa9NdMAm0NyccwoBOxGmpRQZ7EEA3
	CCleFIOKrTGmkkPKOJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFd-0000000EV2k-1qNS;
	Wed, 03 Jun 2026 07:42:57 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUgFa-0000000EV2R-0zMJ
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jun 2026 07:42:55 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-8422f148dfcso1898459b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jun 2026 00:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780472573; x=1781077373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=Ocb0IlKQtOhGIBO9a9pzudmO73jlwJlFqSOEA/XxvwU=;
        b=D+AlmG7bZhODL9fbuV8amqrgBxyN+J1mxuKK0rcP9DBfSNXpbuGUkBwIv9u+sqD+Ap
         0xlnKnbpGju5q0AM+Nn/Skh6nPnVEAzC83tVxfkXw2UjWUH6gcW0wHNBX3O+QNkE86VU
         i+2YIUyJ0R0W8SfeL5/6ADKsPJ/VyzVBbi8iLofRCnqvh0p7ulUH0kzZIA3a4r24ljIT
         nVHVkv3ptJgnQ/w1j4r0ywUm0iDEPLHKyQ2wkGv4UXuu/uQ05H/+AVA16xTexH/NOQJa
         ZXWm5UKYlCjTevVcbdAZjmtv88aLLlRulDzDqGSZJckLtkok+fJaDHCljVHP95vrqTmJ
         JBhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780472573; x=1781077373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocb0IlKQtOhGIBO9a9pzudmO73jlwJlFqSOEA/XxvwU=;
        b=nVqXXwtED5jTNh/tlP1SVLpHvlHfKLmI8jw1oQT5bt8zR3AN2kl6wpOiagDCY1KHfx
         P7FVBoA722wnT0ztjihKGdyEmpwVRZK32LVELyiB3m2dsUk6Zdx+D+++Asxu6WCU3OT/
         OOVqWf5f2Opc/p+zKwztNsLv0DhOthXgFCCi8i4oeKlxFiBAthotAGKdxaISQmK9UVOX
         vkb95E2lFMyDlLg9WpMJmLjJJmpNVxq1tS5eCqLl5Z5uIP3fdLOAMC+g1ae1bC+CLuRx
         4nwwHejZnOHR9CY41BIG9HGTN6i5yqpq+j2Z0ZDGtEmYE/gMSBk3LOd6bnZz1MURHvN6
         Mlvg==
X-Forwarded-Encrypted: i=1; AFNElJ8TjNNoz0k50A6s8P2vszI+XsnctUXnJkbsCVUV1TTyUkk/ppu4ABDNLfV0FEk1gLl/PkfA1potr9vENA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVwXaQfv5GtkEfkLCxe/3r8BeyqwPkhOuF+tkhN91lMcijqQYM
	jCrfJjBSylPa44XM/uSSgsR0e2qy54WWglGQ/EJXYKlMloVfrVw8MqHL
X-Gm-Gg: Acq92OGKTWJ1Utf5E0IFScSKyT3Y2WAh+NPZNtfjXXY8wRXcfURoRuKG/YeEbSywQyK
	pyd5Nf8f75wfUJKW9arBlkxEx54XSJM7GeUw+LoBg7bDCPEo1Z1rJkuRcBhydExRZgme9unQOYb
	og5mX/4WX4zZcBKcR2xb0zEbcEIw+x0tiPM+HrvaZUasYAy9gGN/i19MrD6a/+meapgFjp/q36G
	VWerz4WRU/CWeS0RSqysUGuo5rIvZ1BWAk42T21EifIYeMmCXRWPX2dUTILWc3bqQkvRbAyBnLT
	2rslK/HRJRfOQN+bVHXvbPAFDtreJNh8G91ZjFg238UDTN0sMfRawIgpQfZf2zYdi6yggKKJ8N6
	jE1HHQsdflYpSD++bn/Og7vYEjzzurMsRckDd7rI+KI12tgoWA7T0WyFblNknBrKCIshNdn0eN8
	BwkqnBUnhjEmG4snl75iMFGkitXq3wwKTw45FMzPyNQG9VWH7RRKhx4/5ySzfiGqn50Xuy3eSVD
	TVxMnDftWTfaSY6DuJnbf+e7PZLJBhSuewRjlPhC9Rb2Ya0qX0MfjQLuET+z53K
X-Received: by 2002:a05:6a00:a222:b0:835:3949:3c22 with SMTP id d2e1a72fcca58-84284e932eamr2481464b3a.27.1780472572742;
        Wed, 03 Jun 2026 00:42:52 -0700 (PDT)
Received: from donnager-debian.. ([45.124.203.15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828daf76sm2161223b3a.42.2026.06.03.00.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 00:42:52 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paul Walmsley <pjw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@kernel.org>,
	Drew Fustini <fustini@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/7] riscv: dts: tenstorrent: Add Atlantis platform
Date: Wed,  3 Jun 2026 17:12:12 +0930
Message-ID: <20260603074222.593243-1-joel@jms.id.au>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_004254_277341_853B5C51 
X-CRM114-Status: UNSURE (   9.78  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial support for the Tenstorrent Atlantis platform, based on the
Atlantis SoC featuring 8x RVA23-compliant Tenstorrent Ascalon-XG cores.

The series adds a bare bones device tree with the CPU, interrupt
controllers and a UART. This will be replaced in time with a full
featured machine once details are available.

Patches 1, 2, 3, 5, and 6 add compatibles or extensions to existing
bindings.

Patch 4 adds a new binding document for the aclint timer device.

The series has been boot tested on QEMU[1] and internal development
platforms.

[1] https://lore.kernel.org/qemu-riscv/20260603065859.592063-1-joel@jms.id.au/


Drew Fustini (1):
  dt-bindings: riscv: add Smrnmi extension description

Joel Stanley (6):
  dt-bindings: aplic: Add Tenstorrent Atlantis compatible
  dt-bindings: imsics: Add Tenstorrent Atlantis compatible
  dt-bindings: riscv: cpus: Add Tenstorrent Ascalon
  dt-bindings: timer: Add RISC-V ACLINT bindings
  dt-bindings: riscv: Add Tenstorrent Atlantis platform
  riscv: dts: tenstorrent: Add Atlantis platform

 MAINTAINERS                                   |   1 +
 .../interrupt-controller/riscv,aplic.yaml     |   1 +
 .../interrupt-controller/riscv,imsics.yaml    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   5 +
 .../devicetree/bindings/riscv/extensions.yaml |   6 +
 .../bindings/riscv/tenstorrent.yaml           |   4 +
 .../bindings/timer/riscv,aclint-mtimer.yaml   |  52 ++
 arch/riscv/boot/dts/tenstorrent/Makefile      |   1 +
 .../boot/dts/tenstorrent/atlantis-evb.dts     |  31 ++
 .../boot/dts/tenstorrent/atlantis-soc.dtsi    | 470 ++++++++++++++++++
 10 files changed, 572 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/timer/riscv,aclint-mtimer.yaml
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-evb.dts
 create mode 100644 arch/riscv/boot/dts/tenstorrent/atlantis-soc.dtsi

-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
