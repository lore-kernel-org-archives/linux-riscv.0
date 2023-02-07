Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863DCC636CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Feb 2023 07:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QB1mmGN+1jAFnahkh/qpqz8EA7kLFwxTHd7v7YPpQoQ=; b=zDrSKHX5YX1Gth
	6lbQmJrTZksmuIu8/kg1ihFtB6qTxKC0pPZTvmvaqdpLwKzM5memCHxjGyVCHoVrDCUvVEN+yUHdm
	KgVURavInQdmhfpYumyctjgC+px5uVCN8adyM2+6p6dvJyLWExt8dIBFvaE+xyUIzcZRdVlqZYfCo
	0jj6NFURoLfBOFlmIxR9VZm09r8vhJTEMM5JlZcx2LscK+APmFLELiftL5u9efJOsQzLsOx0m1h+v
	h9iyHVV2MdxVgeEHp9OE2LW0wRqb8jfM/f5aJIsGkUwQvr7N29mPnVHkZO/pFNkCUJMWxadl+COeL
	J/kuV6LrWnaO9OcFXLeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIKW-00B7tO-CC; Tue, 07 Feb 2023 07:23:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPIKQ-00B7n7-KU
	for linux-riscv@lists.infradead.org; Tue, 07 Feb 2023 07:23:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 9D2D024E0D8;
	Tue,  7 Feb 2023 15:23:17 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 15:23:18 +0800
Received: from ubuntu.localdomain (183.27.96.33) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 7 Feb
 2023 15:23:16 +0800
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
Subject: [PATCH v4 0/2] hwmon: Add StarFive JH71X0 temperature sensor
Date: Tue, 7 Feb 2023 15:23:12 +0800
Message-ID: <20230207072314.62040-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [183.27.96.33]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230206_232346_979083_6EDCC142 
X-CRM114-Status: GOOD (  13.88  )
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
v3: https://lore.kernel.org/all/20210726171802.1052716-1-kernel@esmil.dk/
v2: https://lore.kernel.org/all/20210624162108.832518-1-esmil@mailme.dk/
v1: https://lore.kernel.org/all/20210616181545.496149-1-kernel@esmil.dk/

Emil Renner Berthing (2):
  dt-bindings: hwmon: Add starfive,jh71x0-temp
  hwmon: (sfctemp) Add StarFive JH71x0 temperature sensor

 .../bindings/hwmon/starfive,jh71x0-temp.yaml  |  75 ++++
 Documentation/hwmon/index.rst                 |   1 +
 Documentation/hwmon/sfctemp.rst               |  33 ++
 MAINTAINERS                                   |   8 +
 drivers/hwmon/Kconfig                         |  10 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/sfctemp.c                       | 352 ++++++++++++++++++
 7 files changed, 480 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/starfive,jh71x0-temp.yaml
 create mode 100644 Documentation/hwmon/sfctemp.rst
 create mode 100644 drivers/hwmon/sfctemp.c


base-commit: 4ec5183ec48656cec489c49f989c508b68b518e3
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
