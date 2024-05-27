Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8562EC25B74
	for <linux-riscv@archiver.kernel.org>; Mon, 27 May 2024 10:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=td7HkKfxigLxGTZ397d1O77qp714poxuS61bRAzpJ4A=; b=E/ttIlM0PTOUav
	akU/DNBEH1+vuJHjdeOj8h4ioGauU1sZEg5huHNyyIkjwg/x7W/npELQpkClXbQ64AZYKCZWNrYhX
	8Xh1osOTpGj0GitHeuWI1xwj3a4fG+ZAca7GxTpaaUYtlVGbrmBMuQk/oe7ccVlZRkqFw2XOKLUtL
	9GEb0bPbij36uHuxyO5OIn0jw3mvXHxkGSQPAjg43sXkqib4MlQgJqb0Blaw4egc2+w3gVRiSZ14B
	EMiIYxxjbBX1XVNSm2Y/ZfLPtKtXvWfYB7yA4dVve/a+4Re7fhl1JuuEGLyMZ4hHmBNzt0odi2Nxs
	YvjzrzJE9f6hVx0KBQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXan-0000000Eaf9-3icV;
	Mon, 27 May 2024 10:28:37 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBXae-0000000Eab2-3Ayj
	for linux-riscv@lists.infradead.org;
	Mon, 27 May 2024 10:28:30 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0939820002;
	Mon, 27 May 2024 10:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1716805703;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=o2JkCu5S8+OBPOsITVx8O3C/4guU5WMG69zDVPIwu8s=;
	b=m0fCSB+5uL85vkJ+q/iodGnOf8HDGMxdrM8GTeoFslZS+5ZQ6MO+5IdHC0pgV4lfsaBm/x
	iYYNu/81TzADxnuR7Sjmy4/GA5JS9ihaSb50RC9p8dCVw98viVHcWYRdROQ6y8LqII3ZoK
	hxyoYSgK/eiYgPLpDNzKcKO0BmdKET8ennbKZKF6q9n5KrTktskQh08da003Ws2OOsYNiW
	Fn6qXKMqdpl/+HyOHRt5iWLXCP34pEM4HyI18AuyEv+u78+9/D9kWVINziq5cmBHo/U0sD
	hMR54ARBgjb/LEIa4pO37/4RQv3kbew0sSp1tZDhAtvMM896vEfggf1HrdSMBw==
From: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Subject: [PATCH 0/5] Add board support for Sipeed LicheeRV Nano
Date: Mon, 27 May 2024 12:28:16 +0200
Message-Id: <20240527-sg2002-v1-0-1b6cb38ce8f4@bootlin.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEBgVGYC/2WMwQ6CMBAFf4X0bE23BW09+R+GQ0sX2EQpaQnRE
 P7dgificV7ezMISRsLEbsXCIs6UKAwZ4FSwprdDh5x8ZiaFLEUFFU+dFEJyo3yD4OVFOWT5PEZ
 s6b2HHnXmntIU4mfvzrCtf4kZuODKt1cNVotSw92FMD1pODfhtTV/glQHwTgonQFttLUHoV7X9
 Qv+G/9/zwAAAA==
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@outlook.com>, 
 Chao Wei <chao.wei@sophgo.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 =?utf-8?q?Miqu=C3=A8l_Raynal?= <miquel.raynal@bootlin.com>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
X-Mailer: b4 0.13.0
X-GND-Sasl: thomas.bonnefille@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_032829_180968_8B5B6176 
X-CRM114-Status: UNSURE (   6.48  )
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

The LicheeRV Nano is a RISC-V SBC based on the Sophgo SG2002 chip. Adds
minimal device tree files for this board to make it boot to a basic
shell.

Signed-off-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
---
Thomas Bonnefille (5):
      dt-bindings: interrupt-controller: Add SOPHGO SG2002 plic
      dt-bindings: timer: Add SOPHGO SG2002 clint
      dt-bindings: riscv: Add Sipeed LicheeRV Nano board compatibles
      riscv: dts: sophgo: Add initial SG2002 SoC device tree
      riscv: dts: sophgo: Add LicheeRV Nano board device tree

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |  1 +
 .../devicetree/bindings/riscv/sophgo.yaml          |  4 +++
 .../devicetree/bindings/timer/sifive,clint.yaml    |  1 +
 arch/riscv/boot/dts/sophgo/Makefile                |  1 +
 .../boot/dts/sophgo/sg2002-lichee-rv-nano.dts      | 25 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2002.dtsi             | 30 ++++++++++++++++++++++
 6 files changed, 62 insertions(+)
---
base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
change-id: 20240515-sg2002-93dce1d263be

Best regards,
-- 
Thomas Bonnefille <thomas.bonnefille@bootlin.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
