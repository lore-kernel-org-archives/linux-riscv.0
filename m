Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8535EFC5915
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 12:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t1nMsWYVjJ3cwWZtYJ+KAtMm322ToZpjIFDCFPEk9DY=; b=lxqkm8c7DByyoU
	o+9ryyRIqFYQ59rfH8BpLnJvGpWIOqTyhp+bGeqCvPXFsMQsaieGfMhdv+EoR/bJZqZphFgx7J9m1
	qO7c7BCd93i/KMSM9/+EY5k0lj0uHk8QeGBOmtpP6P0/2lJGndxmCnPnBgL3SzMA/WYjGDPL9JJXt
	rVBQmpzA0QRAMSXhUmzeONVuTwsQCOBotemUXgFs5rHOEKALuEXBgPz7DM9ua2InHSdqFq9cj150W
	J5QzCHwnp23/ym4zjn7sq0iDOuVAcnua3FJ/55pQ8i76jSHV35ogPonxDJ/fNo976kT19rqg8EU+c
	si0KfJdTS9ctMH5IrkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vva27-000000064lC-12B5;
	Thu, 26 Feb 2026 11:59:55 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vva1y-000000064hz-0Xdx
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 11:59:52 +0000
Received: from duge-virtual-machine (unknown [183.192.221.67])
	by APP-05 (Coremail) with SMTP id zQCowADXbBCiNaBpASUuCQ--.42115S2;
	Thu, 26 Feb 2026 19:59:32 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: krzk@kernel.org,
	ulf.hansson@linaro.org,
	adrian.hunter@intel.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gaohan@iscas.ac.cn,
	me@ziyao.cc,
	Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
Subject: [PATCH v2 0/3] Add SDHCI support for Canaan K230 SoC
Date: Thu, 26 Feb 2026 19:59:20 +0800
Message-ID: <20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXbBCiNaBpASUuCQ--.42115S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF1DKr48uF15uF45WFWruFg_yoW8tryrpF
	Z8uFZxG34DGF4ftF4Ska1ku3W5Zrs3XrWUGr1ag34DJws5JFWYqr92k3WYqFyDGFZ7C3yj
	vw15XFyfC398ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [183.192.221.67]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_035946_558262_096B5F5A 
X-CRM114-Status: GOOD (  11.20  )
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

This series is based on the k230 usbphy series[1].

This patch series adds SDHCI support for the Canaan K230 SoC,
which uses Synopsys DWCMSHC SDHCI controllers, include MMC0 and MMC1.
The hardware designs of these two controllers are different.
The MMC0 supports eMMC, while MMC1 only supports SDIO. Detailed
information can be found in the vendor's manual[2].

From the vendor's K230 manual:
 - MMC0 supports eMMC5.0 and SDIO3.0, usually for eMMC chips.
 - MMC1 only does SDIO3.0 in 4/1-bit mode up to SDR104, and the manual
   clearly says it can't handle eMMC because of pin count and limits.

Therefore, there are two separate compatibles and the driver treats them
differently.

Link: https://lore.kernel.org/all/20260121145526.14672-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]
Link: https://github.com/kendryte/k230_docs/blob/main/en/00_hardware/K230_Hardware_Design_Guide.md#mmc-circuit [2]

Changes in v2:
- Change the clock minItems to 5.
- Add comments to explain the reason for setting SDHCI_PROG_CLOCK_MODE.
- Write the power selection logic in the phy init cleaner.
- Replace manual delay loop with read_poll_timeout.
- Drop unnecessarily braces where a single statement will do.
- Add the match_data pointer to dwcmshc_pltfm_data.
- Add dwcmshc_k230_match_data struct to separate eMMC/SDIO config data
- Split K230 into individual emmc/sdio platform data instances instead of
  sharing one.
- Remove redundant have_phy member in k230_priv.
- Replace of_find_compatible_node with of_parse_phandle to get USB PHY
  from DT phandle.
- Link to v1: https://lore.kernel.org/all/20260204082908.27501-1-jiayu.riscv@isrc.iscas.ac.cn/

Jiayu Du (3):
  dt-bindings: mmc: Add sdhci support for Canaan k230
  mmc: sdhci-dwcmshc: Add Canaan K230 DWCMSHC controller support
  riscv: dts: canaan: Add mmc nodes for K230

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  29 ++
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  56 ++++
 .../dts/canaan/k230-canmv-module-dshanpi.dtsi |   7 +
 arch/riscv/boot/dts/canaan/k230.dtsi          |  28 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 288 ++++++++++++++++++
 5 files changed, 408 insertions(+)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
