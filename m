Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F907606A31A
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Oct 2026 08:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ocbb2Rnj;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=roEk7o38
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=I36Cpxv7QvD6JVVAEzZzUpclu3zcaVJS1pkeAZQ2gEY=; b=Ocbb2Rnjm5GyQCy0laNpC47gZk
	I65ml8euv2w8yMoRezttcA9fhLh9jS4iZt/yfmwzJpzSxrXFVorAlo9GhziowukitMh1TOPJFYqn9
	S6BmvUWOXSNJQWCyzshO34O85cVjgVq73+lZVs3epE/Dp7IC36tYoK25Ue+51Q87v9AnWFiSVchlU
	WI2yuaQ16Y4i2FYLsz3HEJpPtNOr8kg6RcyXYWDQKWlXF+hPk4jx92WKeiW0d4z2wcGRTDiWFitGB
	ahaYQkIvAjlR8aUXDxBhMw8DUgKtMxWK/zqlphh0wdC7vuceR7zzJhaW9vJxovZ+I7eIqbGc6SGpY
	55/18kPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtlW-00000000tCv-4AwV;
	Sun, 25 Oct 2026 08:39:43 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKtlU-00000000tCZ-1F5M
	for linux-riscv@lists.infradead.org;
	Sun, 25 Oct 2026 08:39:41 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3ac7c7b3a90so1001902a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 25 Oct 2026 01:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792917579; x=1793522379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=roEk7o38pWTxxApxUrRtiozK0mly+heFlhtT8o9jFHvOROrRZ6f0UkgNQfVnX5zQi+
         4vzDSTTh2QJ9zmPBzE5YkAnpNuUPvhuj5kC02f9AGK7gHh3GdNeDg2fE+g76E6sK+CzA
         jC+9obUw379cddsZ9b9Gpa/Lo9mEh87Kjc+UPjY44N7QPzmBDqxQV9hup2Iy6BoQfQqP
         nvVmHqefrLfvlfU8FlF+/+vaJ6pe1r+MH3xJMdSNdFqyagDtxxx065EqjSf2Uyj+grt6
         rPiRmxUXHrcezFfMVn9j5Bh5N8wKEVy4MTAdRavyO4y5cE1KfmxdE3zxl3Ulsswrog5a
         2/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792917579; x=1793522379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aZgZnRh0aurROdQhtMg5ehI3tYqFA35O+N2pjyOvIwc=;
        b=wwkxoW6PeyjEmxi0B4xriUPA4i1bQBGsGgRleEQ4lEwim3ODdYV0YYqcSa525gppHb
         JJY86Tr3bHPhA2NUdke7LVgbVx8tPRlTdJHKOfpwxlYAt8V+JkT1TeFetq1anTigzdB8
         mXZACy1i8e/WgmXNAiWuuizyQGgRhHZrbDFKLnqjxJeoHbXmY4o+5Ln6II/wJ+7jfij1
         DN3ecDh/1+BjQtU8vJth304I8/0hqhB1fUyFZwDnNx6oE/M76PwNZwqXD3n/gUpUaO16
         QpawUTcW3oNHV2LgYlP7sC0uldQnQ4w8Ju1e0uGdPulS385aaQoLdYO3bhq2LKPQ35/2
         nBMg==
X-Forwarded-Encrypted: i=1; AKwUvBxzAax1T2bTebwJ0M5ruwI1msglglBcVGN6kLqB6nx7Vj0+CgqYdsMlHevwSeTpdv0r096j1FV5NuoN5Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLa4XJ0S9O74Euv6gBpKgwvYX1YHKy3qPifo6Co4XRs2vx69kJJ
	/h1ERUL2/cZjZTxqhsMBeWUHYtdctCJ3yncNc6MUBM4eKkDp6sX3viBO
X-Gm-Gg: AYBFou2q08yNAgdUHcw44D/52bXY6RG7WNuVPWz0Emfv/yYkNurd3pe/WPzhMhvJ6Jn
	/mCBpVH84JiJZ48PMAcGjMOn77iFq0H41jhZZVccbtKPmpgRPDXaSyeGyD6VP3vDHx7gHsqfM5R
	sG+NsAcZaGA+XkjHJhZuNntPQamt8+whpvpIarwldkCPnAYEtO64PKjhATyTMQMeWuK9KgB4lbv
	y4d43b3wJ8+wOkQZjRXuFE39eOh6vhcSybAKHAuPwchYwZ98fm2Mswu0vVDOadHs5KaEIDPIe6y
	0DwqrmP0zm4wt/twczOyIbbjfZArurF+SqPoz9utbKzsstOXIz/XyRoZias6Oe9GfPFGMl6efxD
	o4wnZtuKEvnVTAWrJS4ckkMBNeYv53PQGCSp5Tr7mmFahNdweTh8adxqb57MLewuEMMR9OIO5sM
	Z9hkWNDadE31vRwDQegRK5ateufqYJhrWDNG8zO6VUlbU75z0UQRHJ8WRVoXEnsO3Y62oPHSRda
	s86ixonb2kXf11pDlac37ayAjMiex0rMKV47X5mowX/Zp8O/JcO2WYL5dv6+KZy4LvSVw+d4Zj+
	y7vj1A7IP3EPVC/p8pV6wKAOj1aFu6tfdldHC5hiz83iEKIJ3lHYdgTBUDeAdgXVXYJbhu8AdOO
	pL75TjroFjHp2zQOCW/xUjvM+brQg+hnJJyg=
X-Received: by 2002:a17:90b:5906:b0:3ad:1841:6f8b with SMTP id 98e67ed59e1d1-3adead0bdc7mr3144482a91.37.1792917578985;
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe69478sm4585051a91.3.2026.10.25.01.39.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 01:39:38 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 25 Oct 2026 16:39:31 +0800
Message-ID: <20261025083933.26066-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_013940_352868_D54733D9 
X-CRM114-Status: GOOD (  11.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On the SpacemiT K1 the BootROM loads the next boot stage into SRAM, and
that stage sets up DRAM. This series marks the nodes it needs for that
bootph-pre-ram: the SoC clocks, UART, boot media and the two I2C buses
in k1.dtsi, and the board EEPROM (which holds the DRAM configuration),
the PMIC rails and the SPI NOR in the board files.

The vendor confirmed that the BootROM itself does not access the
EEPROM [1]. It is tagged because bootph-pre-ram covers the phase that
sets up SDRAM, and DRAM cannot be trained without it.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series.

I used Claude to help read the U-Boot SPL and the device trees. I
checked the changes and ran dtbs_check myself.

Changes in v3:
- Reword both commit messages to describe the hardware instead of what
  an SPL does, and drop the U-Boot paragraph from patch 1 (E)
- Tag i2c2 in k1.dtsi too, as every K1 board has the EEPROM there
- Tag eeprom@50 on the OrangePi RV2 and R2S, missed in v2 (Sashiko)
- Drop the Assisted-by tags, see commit 1e035297ffda
- Keep E's Reviewed-by on both patches, as the changes are the ones
  discussed on v2
- Link to v2: https://lore.kernel.org/all/20261017180141.3477743-1-alan.tseng.cs@gmail.com/

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/all/20261021083425-GKA125937@kernel.org/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 14 ++++++++++++++
 7 files changed, 47 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
