Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3DA606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 09:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZKnL1Yg/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=ultrarisc.com header.i=@ultrarisc.com header.a=rsa-sha256 header.s=dkim header.b=f9ipurVX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=AzCk7IUUIqy4ZxToeo1Xeo/qVGSv5TIbbtoOla4dSSc=; b=ZKnL1Yg/oMC2CQvxxjGXGXE+61
	wCh2jbbWh1UEUrqAx08mxPciE3ElIeT9qebixuMXiJGJqVelqY4CcH+YgPPwGzxkc+jX13wuLeavp
	wNDA4W8/scsGtEIEW7l2fXKHWnJXGkeL1xgZsfcdtDF+iM7zRKlGppL/JyVJKC1g7aVs9uAcm6Uen
	+AwYeWlO5rkl3oPTnoLlSAZ055XRACzNdv+XCZgtHm1B+eixVeUytBopEkX/cuClF7sMwtPaDQ8Sl
	nJLkFhwd99PkDeuJHjN17+/+mI2VNHSpH0kSX4e56sptRxR3krr9TTlEkepnthKoQAcvGnctanTnd
	67P4qUsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStEF-00000001oiX-1OJo;
	Mon, 16 Nov 2026 09:42:23 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xStEB-00000001ohD-015z
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 09:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Date:Subject:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	To:Cc; bh=An7UuIxp03IASJQVhCkrJ11j5LJvQXg6N+oWMG7q8QQ=; b=f9ipur
	VX/UghcfN/mb558IYBHJS+c63qswbFranYLmCjgbj/iokuRDa0D2fMmMXEZueWi8
	4eBZKfLOqSYxXm8kMIeCMGHRmkhN+xGSgrLDdOQiMs/VbJBY5KpGBlRni+TMjA33
	K+NLZ9kXCoIvYrziIQsGg88KXVcP/SPVFS4sg=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwDnrwbGz_pqSvUDAA--.1734S2;
	Mon, 16 Nov 2026 17:41:26 +0800 (CST)
From: Xincheng Ji <jixincheng@ultrarisc.com>
Date: Mon, 16 Nov 2026 17:41:31 +0800
Subject: [PATCH] MAINTAINERS: Update UltraRISC driver maintainers
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261116-ultrarisc-maintainer-v1-1-f58706ae438c@ultrarisc.com>
X-B4-Tracking: v=1; b=H4sIAMrP+moC/yXMQQqDMBCF4avIrBtwIkr1KqWLGEc7oqnMRCmId
 2/UxVt8i/fvoCRMCk22g9DGyt+QgI8M/MeFgQx3yWBzWyFibtYpihNWb2bHIaaRmLoqu2dZo3V
 FC+m6CPX8u7Kv921d25F8PFtwHH+phzXFeAAAAA==
X-Change-ID: 20261110-ultrarisc-maintainer-965d85912a3b
To: Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Linus Walleij <linusw@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org, 
 linux-clk@vger.kernel.org, netdev@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Fei Chen <chenfei@ultrarisc.com>, 
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Xincheng Ji <jixincheng@ultrarisc.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794822092; l=3017;
 i=jixincheng@ultrarisc.com; s=20260922; h=from:subject:message-id;
 bh=ISg1g4ONyICVsyMrVHbkY7NCHgvfTE297DDq/TSYiOU=;
 b=nczyInXsPH5sXfo1MLZNPno9PuLSKd3gFkJQMiE/xCgmrwPeQuSEY8uiC49TYcn3m9dHbb7IP
 QWW6JkKynTlAaOBT2GxoeMmkYPYBFn/kkvxpTc/A8PIQFWZtE/f5n+S
X-Developer-Key: i=jixincheng@ultrarisc.com; a=ed25519;
 pk=n848dcS5D6g0vLad/rjp4Gf/1eedTe1a3pYUrkt2260=
X-CM-TRANSID: AQAAfwDnrwbGz_pqSvUDAA--.1734S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAFy8ZFWDKrW5JFWxuw1rZwb_yoW5Cw1fpr
	45CF15Cr97Jr13Wan7Ka4fZas5X3W0krWUCasrKw1jyF1Fkw18Jrs5Kw15u3Wq9F48AFZI
	yw13urnrta109a7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9l14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
	8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
	xVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcV
	AFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8I
	cIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r
	4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-CM-SenderInfo: pml0x0xfkh0wg6xo325dul2uoofrz/1tbiAQAKDmr2s7AAAQALsQ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_014219_533565_C24D3A1C 
X-CRM114-Status: UNSURE (   8.51  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.3 (-)
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Jia Wang and Xincheng Zhang have left UltraRISC and are no longer
maintaining its drivers. Jia's listed company email address is
no longer available.

Replace Jia Wang with Xincheng Ji and add Fei Chen as a co-maintainer
for the DP1000 PCIe, clock, DWMAC and pinctrl drivers. Remove
Xincheng Zhang from the PCIe maintainer entry.

Having two maintainers provides continuity for maintenance and
patch review when either maintainer is unavailable, as suggested
by Conor Dooley during the UltraRISC maintenance handover.

Link: https://lore.kernel.org/all/20261112-legend-outcast-c2226b5e02a1@spud/

Signed-off-by: Xincheng Ji <jixincheng@ultrarisc.com>
---
Hi all,

Jia Wang and Xincheng Zhang have left UltraRISC and no longer
maintain these drivers. Jia's listed company email address is
no longer available.

Fei Chen and I will share maintenance and patch review for the
UltraRISC DP1000 PCIe, clock, DWMAC and pinctrl drivers. Having two
maintainers provides continuity when either of us is unavailable,
as suggested by Conor Dooley during the maintenance handover.

Thanks,
Xincheng
---
 MAINTAINERS | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..994c3555c423 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21869,8 +21869,8 @@ F:	Documentation/devicetree/bindings/pci/starfive,jh7110-pcie.yaml
 F:	drivers/pci/controller/plda/pcie-starfive.c
 
 PCIE DRIVER FOR ULTRARISC DP1000
-M:	Xincheng Zhang <zhangxincheng@ultrarisc.com>
-M:	Jia Wang <wangjia@ultrarisc.com>
+M:	Xincheng Ji <jixincheng@ultrarisc.com>
+M:	Fei Chen <chenfei@ultrarisc.com>
 L:	linux-pci@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pci/ultrarisc,dp1000-pcie.yaml
@@ -28749,7 +28749,8 @@ F:	drivers/usb/common/ulpi.c
 F:	include/linux/ulpi/
 
 ULTRARISC DP1000 CLOCK DRIVER
-M:	Jia Wang <wangjia@ultrarisc.com>
+M:	Xincheng Ji <jixincheng@ultrarisc.com>
+M:	Fei Chen <chenfei@ultrarisc.com>
 L:	linux-clk@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/clock/ultrarisc,dp1000-clk.yaml
@@ -28757,13 +28758,15 @@ F:	drivers/clk/ultrarisc/*
 F:	include/dt-bindings/clock/ultrarisc,dp1000-clk.h
 
 ULTRARISC DP1000 DWMAC GLUE LAYER
-M:	Jia Wang <wangjia@ultrarisc.com>
+M:	Xincheng Ji <jixincheng@ultrarisc.com>
+M:	Fei Chen <chenfei@ultrarisc.com>
 S:	Maintained
 F:	Documentation/devicetree/bindings/net/ultrarisc,dp1000-gmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-ultrarisc.c
 
 ULTRARISC DP1000 PINCTRL DRIVER
-M:	Jia Wang <wangjia@ultrarisc.com>
+M:	Xincheng Ji <jixincheng@ultrarisc.com>
+M:	Fei Chen <chenfei@ultrarisc.com>
 L:	linux-gpio@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/ultrarisc,dp1000-pinctrl.yaml

---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261110-ultrarisc-maintainer-965d85912a3b

Best regards,
--  
Xincheng Ji <jixincheng@ultrarisc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
