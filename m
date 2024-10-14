Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D5F6CFC500
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 07:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B9qzhbG/zL1uhhB+QQOvS4Ji0Hs4Q6+o/d4m6QeIEJc=; b=VhDIgNyUgF62IV
	ZVJld0j+MVzLftb9JcKCjDueSXyZttVzIe5gWTxCGheFLR6CVLFGbx41er7rTFDh8tWrp9s6/f71G
	Mml8m85B5HFXt82jyV08Mo8n1w84trERqGYCBwxpSyi0kBGDE7IB0kxXaurXO5/XHoZjQcS/hxxkm
	+Xa3WdIFpMcVVJYksmDUrY/4eT/HYKSUmQ5nFkC0m0OgkVE7mAFL6Lnkn07DoIqjF0PUXrSlQt6zq
	RQWIIbL4vMql/taAx0bL8ZGW+yXDrb/cF4bmcX//ky9LkLtaDH70TqJA5DmxfigS7U/XpMKlOxckm
	SSnuXFbGPIN4rslJV9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FlH-0000000478L-3Qxs;
	Mon, 14 Oct 2024 07:45:03 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0FfB-000000045X2-0frA
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 07:38:47 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 92879122FE22;
	Mon, 14 Oct 2024 00:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728891520; bh=Zh8qbVVIX7EsBpJFG/gcKYvAuggerEXcwlv2jiDrPbs=;
	h=From:To:Cc:Subject:Date:From;
	b=o/24iZFKJYmLwlXVRJ+jgYXwoiyWYJRHJJHsujVOfVJAv1AVOh35NDNLmhdrNlLbw
	 kAuYbb/hHepa1GDILnyYD9oJuAwVLyzwPkBvJZ2tLdSEQqNcYBcZbXSpHQuj42NV0b
	 gG2O/iT25gp69DINZVj8+Anq9IWcNHrNdfmBHC1ibOugVRrZdjFPaL7gCVTf1jLhaY
	 0TsW6lf131cL9B0w4imX68R265tudazjKgsKU0PjwSLJdk7E4eovQFLmStuXxpyTwr
	 OELtuxhle4mmtf5PwSRgI6p7FEuUsxuoAKLsfgcm0PKW+06HTQkTAaohKrO/3EYNk3
	 JSvfkObdP0fHg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I1NoHwtUyw32; Mon, 14 Oct 2024 00:38:38 -0700 (PDT)
Received: from localhost.localdomain (unknown [110.52.220.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 531B7122FE1E;
	Mon, 14 Oct 2024 00:38:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1728891518; bh=Zh8qbVVIX7EsBpJFG/gcKYvAuggerEXcwlv2jiDrPbs=;
	h=From:To:Cc:Subject:Date:From;
	b=kUgnqLhc0j+qgIaHSDUxoQLC0f0+/URJuqxRQbc7ofvAhqYAC8wMXLapSmbc8RjQ3
	 Gf2jIONH02Rn0TpDVp5DsamsyyDRliDEHxtEvfcIf8jgdwVGfn2rYLZJdyARnb8ekj
	 NtG6M/pJg5G2Jc/aSulzYiuTIX3dDBXFXvfxqtLYw9w44bCl7FwHh1RrqTChC2nLdH
	 geoM79FZ1izrDy/PMAGWoAGUghQFNEoTTOdamXqSExcYg/M0d4pkJsZuxDEn7o0VED
	 FjLhew2QRG6Uvehl2VwuvSumyupHlD7RxWNnAzolv8YP0C4VyNob4cZvxj1UEsdidt
	 gnTG9/w9T/ypg==
From: Haylen Chu <heylenay@4d2.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v5 0/3] riscv: sophgo: add thermal sensor support for cv180x/sg200x SoCs
Date: Mon, 14 Oct 2024 07:38:10 +0000
Message-ID: <20241014073813.23984-1-heylenay@4d2.org>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_003845_511706_4271CA89 
X-CRM114-Status: UNSURE (   8.03  )
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

This series implements driver for Sophgo cv180x/sg200x on-chip thermal
sensor and adds thermal zones for CV1800B SoCs.

Changed from v4:
1. support temperature threshold violation interrupts
2. completely switch codename to cv1800
3. style improvements
4. update e-mail address
Link: https://lore.kernel.org/all/SEYPR01MB422158B2766DA03728AD90CBD7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Changed from v3:
1. style improvments
2. drop unnecessary dt parameters for simplicity
Link: https://lore.kernel.org/all/SEYPR01MB42213F3A032C60C6AF5EB677D7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Changed from v2:
1. style and code improvements
2. use human-readable value for sensor parameters
Link: https://lore.kernel.org/all/SG2PR01MB4218013241B3EED779D3BAE8D7F82@SG2PR01MB4218.apcprd01.prod.exchangelabs.com/

Changed from v1:
1. style and code improvements
2. make sample parameters configurable
3. generalize document temperature calculating formula
Link: https://lore.kernel.org/all/SEYPR01MB422119B40F4CF05B823F93DCD7F32@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Haylen Chu (3):
  dt-bindings: thermal: sophgo,cv1800-thermal: Add Sophgo CV1800 thermal
  thermal: cv1800: Add cv1800 thermal driver support
  riscv: dts: sophgo: cv18xx: Add sensor device and thermal zone

 .../thermal/sophgo,cv1800-thermal.yaml        |  57 ++++
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi       |  28 ++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |   8 +
 drivers/thermal/Kconfig                       |   6 +
 drivers/thermal/Makefile                      |   1 +
 drivers/thermal/cv1800_thermal.c              | 296 ++++++++++++++++++
 6 files changed, 396 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
 create mode 100644 drivers/thermal/cv1800_thermal.c

-- 
2.46.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
