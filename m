Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C544D10F22
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 11:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wx+7v626zghJCf3KsrxSbVvpAuL2XFtv+W9w+WF0wBk=; b=ah+C7Rx1MR3bI/
	D4XJQ+u/e0kTAd5ofavQLhGpHw6CgoFC5rTUuVRIUYb9aHehLJ1O4GvU4U/GdJJE+lI+mIOmfcfTp
	tyGVHcTyNxAmj9Qyvcex/xqFp+nyd4EBr2L75j0swZa/flAJgEFHDWoW3KgWv8OD7HB0Vb+55kEZn
	bfybikeIMuWyjy7XAdSYWvoHQJ2LNsyMbzg++J6mUEcHxe4aN8DuOa7Zlw7oHFHDkBtmmyDqm3WL2
	RHGFUIDTCaCthdHmQzjcYxuz/ip0FfwaOzcwWNJ5k7Fe3K+z/HwXh6jyNnd4L3PXlJcht+Mn8yjOs
	1ZpqsRHOMuuYAv3ZqXIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE8Q-0000000EwPs-0XmR;
	Wed, 26 Nov 2025 11:56:34 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOE8M-0000000EwOZ-49VR
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 11:56:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version:
	Content-Type:To; bh=Ufeb2Y1qdBth3LcT17BVdapoAoJh2TGcN1TWOhiBKf0=;
	b=En1Pf8h/dboQ57E/Xg0GvL4gWJTIP0wuL/u6Ci9gG9Qho59PJDIOomubQhmhWf
	PD8kyMXDdmsWkDxkxWDZGSu+Z+coheekooSe9hCRIaGTw0/NVohNAGfw70A+AOlW
	fR4+VgeS7DHPaMbXoB5w+m0Def6yMsr2euRr5wGoLpQG4=
Received: from [192.168.10.1] (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgBnveN26iZpJOi_FQ--.56535S2;
	Wed, 26 Nov 2025 19:54:32 +0800 (CST)
From: Shuwei Wu <shuweiwoo@163.com>
Subject: [PATCH 0/3] thermal: spacemit: Add support for SpacemiT K1 SoC
 thermal sensor
Date: Thu, 27 Nov 2025 02:44:06 +0800
Message-Id: <20251127-b4-k1-thermal-v1-0-f32ce47b1aba@163.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAHZKJ2kC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyMT3SQT3WxD3ZKM1KLcxBzd1ORESwOzVLOUFPNEJaCegqLUtMwKsHn
 RsbW1AH3F1YdfAAAA
X-Change-ID: 20251124-b4-k1-thermal-eca906e6dd7a
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Shuwei Wu <shuweiwoo@163.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764182662; l=1444;
 i=shuweiwoo@163.com; s=20251125; h=from:subject:message-id;
 bh=6Bc8ctkWf0MlDErFTWLIrGe04KSla5uK/67iOY4E08w=;
 b=ewyJRJ6JRELmsRZPHaJEV8DBkEtk7N+18zJKoIBSbmPdtwi4m63YqOpjVgAIPRh4VI1SCd20c
 qSkdZ2ZYXZFDhOZNrSanVi6kHXeT8TrSF8d8Cdcb6eq1OFiZ7rMGVXs
X-Developer-Key: i=shuweiwoo@163.com; a=ed25519;
 pk=qZs6i2UZnXkmjUrwO5HJxcfpCvgSNrR4dcU5cjtfTSk=
X-CM-TRANSID: PigvCgBnveN26iZpJOi_FQ--.56535S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw43JF4rJF17GF47Ww1xKrg_yoW8Gr4xpa
	1Uurn8Cw1DGFs3Jw13uF1DCFZ8tr4ftFy3Xrn3Kw15tr45GryfJrW5Kr15W348GrWvga1D
	ArsrCr4rCr1DArJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRBOJwUUUUU=
X-Originating-IP: [240c:c983:3:1d94:eae4:9ca1:49b8:c024]
X-CM-SenderInfo: 5vkx4vplzr0qqrwthudrp/xtbBzxUSjmkm5A563gAAsH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_035631_487796_7FEAEC2E 
X-CRM114-Status: UNSURE (   6.36  )
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

Introduce support for the on-die thermal sensor unit (TSU)
found on the SpacemiT K1 SoC.

Include the device tree binding documentation in YAML format, the
thermal sensor driver implementation, and the device tree changes to
enable the sensor on K1 SoC.

Test logs:
Hardware: OrangePi-RV2 integrates SpacemiT K1 SoC
Kernel: 6.18.0-rc4 mainline

Verified that all five thermal sensors are registered and reporting
valid temperatures.

$ cat /sys/class/thermal/thermal_zone*/type
soc-thermal
package-thermal
gpu-thermal
cluster0-thermal
cluster1-thermal

$ cat /sys/class/thermal/thermal_zone3/temp
28000

Dynamic threshold and interrupt tests passed via sysfs trip_point
manipulation.

---
Shuwei Wu (3):
      dt-bindings: thermal: Add SpacemiT K1 thermal sensor
      thermal: K1: Add driver for K1 SoC thermal sensor
      riscv: dts: spacemit: Add thermal sensor for K1 SoC

 .../bindings/thermal/spacemit,k1-thermal.yaml      |  76 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 101 +++++++
 drivers/thermal/Kconfig                            |  14 +
 drivers/thermal/Makefile                           |   1 +
 drivers/thermal/k1_thermal.c                       | 307 +++++++++++++++++++++
 5 files changed, 499 insertions(+)
---
base-commit: f5f2e20b1cbc5f9ea20b372d15967b24921ede19
change-id: 20251124-b4-k1-thermal-eca906e6dd7a

Best regards,
-- 
Shuwei Wu <shuweiwoo@163.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
