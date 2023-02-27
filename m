Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8850FC7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 13:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kvr2h1SPX6gsVTaNzEKRb4akW/uzp/tsLdByMO/CWFE=; b=ton6pgfXdJJXR+
	QfwAjiEMe16N74p+xU4l89dZEOj3GJApSDVvuGd+OoVWhVNrhzJWzxarL6dSE0jfoCDaGVD02meXE
	glbKe0SNcvkDLm44Bm//YG9CSiPiNvYh30ZDtozZ9yWqZlrYiq+O4PadCVF4rUC1Dxyac7IRDdCr6
	NkSxWUiyJIe7xReHR40jbrdO/R20hDD/ZgkTCE4giWNlyk7WXcItrhvALZu5MS/snyDgLSojKy3MA
	Utb/YEcxwo2zqbLdhcfiSKfWQ12zGY9rS36kWGSrN2Ff5R6guOwN1PxTxtzXF7K+AGCljk46CuPa5
	PqcWCjLLU5nYXQVS3JZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdli-009p9a-Ra; Mon, 27 Feb 2023 13:42:18 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWdlc-009owU-Ex
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 13:42:17 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 8FF8824E336;
	Mon, 27 Feb 2023 21:41:28 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:41:28 +0800
Received: from ubuntu.localdomain (113.72.145.171) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Feb
 2023 21:41:27 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
	"Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Samin Guo <samin.guo@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v5 0/2] hwmon: Add StarFive JH71X0 temperature sensor
Date: Mon, 27 Feb 2023 21:41:23 +0800
Message-ID: <20230227134125.120638-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.171]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_054212_879224_C35C4B1E 
X-CRM114-Status: GOOD (  15.64  )
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

This adds a driver for the temperature sensor on the JH7100 and JH7110,
RISC-V SoCs by StarFive Technology Co. Ltd.. The JH7100 is used on the
BeagleV Starlight board and StarFive VisionFive board. The JH7110 is
used on the StarFive VisionFive 2 board.

v5:
* Dropp the "interrupts" property in dt-bindings.
* Reword the commit message of patch 2.
* Use continuous mode instead of single mode and drop the interrupt
  related code used in the single mode.
* Add the missing "default:" statements in the driver.
* Change the device name to "sfctemp" which avoids a warning when startup.

v4:
* Change the node name from "tmon" to "temperature-sensor" in dt-binding
  example, which is more generic.
* Add support for StarFive JH7110 SoC besides JH7100.
* Add clock and reset support in the dt-bindings and driver.
* Add the missing headers in patch 2.
* Use devm_platform_ioremap_resource() to remap instead of
  platform_get_resource() and devm_ioremap_resource().
* Use dev_err_probe() instead of dev_err().
* Add Signed-off-by tag for Hal Feng. Add Co-developed-by tag for
  Samin Guo in patch 2.

v3:
* Handle timeouts from wait_for_completion_interruptible_timeout
  properly.

v2:
* Fix checkpatch.pl --strict warnings
  - Add myself to MAINTAINERS
  - Fix multiline comments
  - Use proper case and whitespace for #defines
  - Add comment to sfctemp::lock mutex.
* Remaining comments by Guenter Roeck
  - Add Documentation/hwmon/sfctemp.rst
  - Use devm_add_action() and devm_hwmon_device_register_with_info()
    instead of a driver .remove function.
  - Don't do test conversion at probe time.
  - #include <linux/io.h>
  - Remove unused #defines
  - Use int return variable in sfctemp_convert().
* Add Samin's Signed-off-by to patch 2/2

History:
v4: https://lore.kernel.org/all/20230207072314.62040-1-hal.feng@starfivetech.com/
v3: https://lore.kernel.org/all/20210726171802.1052716-1-kernel@esmil.dk/
v2: https://lore.kernel.org/all/20210624162108.832518-1-esmil@mailme.dk/
v1: https://lore.kernel.org/all/20210616181545.496149-1-kernel@esmil.dk/

Emil Renner Berthing (2):
  dt-bindings: hwmon: Add starfive,jh71x0-temp
  hwmon: (sfctemp) Add StarFive JH71x0 temperature sensor

 .../bindings/hwmon/starfive,jh71x0-temp.yaml  |  70 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sfctemp.rst               |  33 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sfctemp.c                       | 331 ++++++++++++++++++
 7 files changed, 454 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
 create mode 100644 Documentation/hwmon/sfctemp.rst
 create mode 100644 drivers/hwmon/sfctemp.c

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
