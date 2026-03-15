Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3848D58B11
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 05:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VU2koVG4bkhCGTOYUm0462AGiPwumAy72Tnuh2Pti/k=; b=YGKQY8XU5f+Zml
	Qj2yA5sE1oJhksIQYBmeBoU/DwTmbNgU6JepvGA3qeM8X12zFbZxRuXQNkQm4yvHc/AJg4DxMShRN
	7WV3pDOlxiH1//RZnGRaYRCvmG+77Elv8RT2X1uECijd9Bnx344cj1q4MdQMSdIuIBaPsurpKkX8I
	H7jd32btP6aiEotejHindY9ZoBMr139s/yQwCvzxkLzW+A5Zu4EJV3nCVbuYl2nJz+FrteFuN+xDE
	PVYEBATjwH1CKivySpJah02czCQTMTU/IXBH8WNmH9kQhUTikTXAXTCGSCTpr5zifjf60yawAU+nk
	Y9CIBxLgighqYd23fkaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1eHY-00000002PJr-3HKO;
	Sun, 15 Mar 2026 05:44:56 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1eHS-00000002PIA-2T7I
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 05:44:54 +0000
Received: from duge-virtual-machine (unknown [183.192.222.244])
	by APP-05 (Coremail) with SMTP id zQCowADXaQ1BR7Zp5WGACg--.20291S2;
	Sun, 15 Mar 2026 13:44:35 +0800 (CST)
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
Subject: [PATCH v4 0/3] Add SDHCI support for Canaan K230 SoC
Date: Sun, 15 Mar 2026 13:44:23 +0800
Message-ID: <20260315054426.18383-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowADXaQ1BR7Zp5WGACg--.20291S2
X-Coremail-Antispam: 1UD129KBjvJXoWxur4fJF1fCw45Aw18tF1rXrb_yoW5WF1UpF
	WUurW3G3yDGF1ftF4xKa1ku3W3Zws5X34UGw1ag34UX390kFW5Xr97C3WYqFyDJFZ7Gw1j
	yw15XFyfCrZ8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
X-Originating-IP: [183.192.222.244]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_224451_022491_290AE315 
X-CRM114-Status: GOOD (  11.83  )
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

Changes in v4:
- Drop the unnecessary line wrapping.
- Drop the extra match_data pointer that was added in v3.
- Add struct k230_pltfm_data which embeds struct dwcmshc_pltfm_data.
- Use container_of() to get k230_pltfm_data.
- Link to v3: https://lore.kernel.org/all/20260310064513.140093-1-jiayu.riscv@isrc.iscas.ac.cn/

Changes in v3:
- Drop the clock maxItems.
- Add a const void *match_data to the struct dwcmshc_priv
- Copy the match_data pointer to dwcmshc_priv in the common dwcmshc_probe
- Link to v2: https://lore.kernel.org/all/20260226115923.75670-1-jiayu.riscv@isrc.iscas.ac.cn/

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

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  28 ++
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  56 ++++
 .../dts/canaan/k230-canmv-module-dshanpi.dtsi |   7 +
 arch/riscv/boot/dts/canaan/k230.dtsi          |  28 ++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 277 ++++++++++++++++++
 5 files changed, 396 insertions(+)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
