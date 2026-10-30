Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CA6E60A381A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 18:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0vP9BJcp;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eTpNv1es
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yaJzfkP9y9iDamvtqCbigqghZhkKgEWpe9ASvBB0FOA=; b=0vP9BJcpsHrKxg85vwLQN/IOgQ
	nBQwC+QPb96OXCzI1lmnjn9v3eDAvticpNPf7tpDGmeIZNIB+xCHHAMm9Se/hujv/3aMV6IfY2i9C
	rBKF5H3aY+Hbvyvek/uR9xvTPhG8SeO6DRTSmyem+EbANyJjHQ08wC29phARgSWe7xct6c9kvFqkF
	HNe9Y31e6pDQMhac6QXx9jOf4sKGnWpOttJ4cNCHSonJ1IzaAMoBw0ZoXmD3X4elwVKniV9a3yqMt
	T4dx+/cOiOpV1DXQzSKJiPykNrj5Zt1n33Fc9V42gF7wek+y68X4RrU4wPFEOZm//lWLdRFCSrOoy
	bf4O91OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr8u-0000000CNqd-0M3m;
	Fri, 30 Oct 2026 18:15:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMr8s-0000000CNqQ-1AOb
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 18:15:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0DE2940A7A;
	Fri, 30 Oct 2026 18:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 495E01F00A17;
	Fri, 30 Oct 2026 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793384153;
	bh=p6XBeS28YdeKR1FrvM+4ypySmOBgmuPeaEe4fr40c/Y=;
	h=From:To:Cc:Subject:Date;
	b=eTpNv1es5b+ljOxmfoakZGsli9Xn2JnIbLUIyejGvKlPgVxycFZH6IGqIzhd41hbu
	 eC1jvCjpYBnT7aD/5MEvPnkcKR+W3N4yGPgFNXg2Tdou5EnHQBxsG7WDTG+TFBGBvt
	 e07VrI5qFeD5DDHzmOgbwJitvJv7HhX0+GuBZe5Z4t1211Os7y0TI3xXhkaGzNg143
	 h3VPFDB51fwauqkGh4ZQQt2Kxl7Ehahf3oe+R2hv4zyImywT/aV917PRZ53oMqJ6Dl
	 m0O76w9SUPMOTlzn3Y+qj2+o58xofh3f1+MylqAgm6tB/zGm4oCTMjMitgKDG9abAA
	 0JvfCu7BNGjAw==
From: Conor Dooley <conor@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-riscv@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: mpfs-mssio: remove unused mutex
Date: Fri, 30 Oct 2026 18:12:14 +0000
Message-ID: <20261030181214.2448140-3-conor@kernel.org>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1905; i=conor.dooley@microchip.com; h=from:subject; bh=Cij3GL7z2OJhW4lZm9udhmYEzhHSkCOKSkfmcKM8MXI=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDFlP7v4TOJc0NWfPD/FD8yOXiQYenj4hRGPidQk9A9Gof j0LqfqKjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk2V1Ghl9P5GUmdTEmGc/7 JH2PY23eaj8+VoWqq3s3HO+cN+vyoTSGv4IT17bfF01YuCNk33L/+StcnQ4Wy/HGLd7gfyOxP6q zhRUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

The pinctrl core creates a mutex that is used to protect things like the
generic dt node mapping functions. The (currently) unused mutex was added
when the driver was in RFC state and contained a custom dt node mapping
function, and used the driver's own mutex to protect it. The driver
probably could have borrowed the core's, but this is moot since the merged
version of the driver no longer has a custom dt node mapper. Remove the
unused mutex.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Linus Walleij <linusw@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
index 8da0c5312ce3..17c6d4190053 100644
--- a/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
+++ b/drivers/pinctrl/microchip/pinctrl-mpfs-mssio.c
@@ -56,7 +56,6 @@ struct mpfs_pinctrl {
 	struct device *dev;
 	struct regmap *regmap;
 	struct regmap *sysreg_regmap;
-	struct mutex mutex;
 	struct pinctrl_desc desc;
 };
 
@@ -677,7 +676,6 @@ static int mpfs_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
 	struct mpfs_pinctrl *pctrl;
-	int ret;
 
 	pctrl = devm_kzalloc(dev, sizeof(*pctrl), GFP_KERNEL);
 	if (!pctrl)
@@ -703,10 +701,6 @@ static int mpfs_pinctrl_probe(struct platform_device *pdev)
 
 	pctrl->dev = dev;
 
-	ret = devm_mutex_init(dev, &pctrl->mutex);
-	if (ret)
-		return ret;
-
 	platform_set_drvdata(pdev, pctrl);
 
 	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
