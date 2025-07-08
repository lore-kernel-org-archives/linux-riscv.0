Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF908C71130
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 01:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yS1ItMehgM+tgJUc0NoQjQ0PsZTqk697uVFKXbG8Sr8=; b=It/sSosVJcDRpT
	L82uzhz85Pe3j1W4nQoTQ9NpwXawEiQGBqyvanVsaoBiiblpq6FpVjProJYVe0GoWALiUGKJGvp1s
	jpafPRiE/kfywLzQwQcUvdp7CzFNTZ1NUWupDrMfNmMmTLDuvuMwPaS5KZDKYkTNeHfmTA2RjaAJM
	e40JVPkqsIBY3y280mgkqSi1kQk7+ju+ZZHPR/Ir4G6xtZOneF7NQzCQWktTa6UELAPaIkraQY2Ls
	TBmRI2KgeBoOgdWjNX+s3pnDY+I6WlrX9d1UVJ84Zx9dLtS4jgZ55dGXUTjxr1zVqtWLjpKmgpeu8
	1qDavm++hsrK3MOqIeDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxOT-000000040Bk-2a2W;
	Tue, 08 Jul 2025 01:45:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYxOQ-000000040AN-3ILW
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 01:45:12 +0000
Received: from [127.0.0.1] (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 35948340D1B;
	Tue, 08 Jul 2025 01:45:05 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 08 Jul 2025 09:44:56 +0800
Subject: [PATCH] riscv: defconfig: spacemit: enable sdhci driver for K1 SoC
MIME-Version: 1.0
Message-Id: <20250708-02-k1-sdhci-defconfig-v1-1-73c631717338@gentoo.org>
X-B4-Tracking: v=1; b=H4sIABd4bGgC/x3MTQqAIBBA4avIrBsYpejnKtFCdKwh0FCIQLp70
 vJbvFehcBYusKgKmW8pkmKD7hS4w8adUXwzGDIDjTQhGTw1Fn84Qc/BpRhkR6Z5dtqbIdgeWnt
 lDvL833V73w9zJmOmZwAAAA==
X-Change-ID: 20250708-02-k1-sdhci-defconfig-e099c1d25fa4
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1203; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=DND5Hg+FtbnxrbifP2m8JGMpr6rBRSxqH5N/7bwtAy8=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBobHge8G18X+Mhp+CBSQ6ZdE9TrfQtejcKsnbZg
 ewJzJ935l2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaGx4Hl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277fyLD/9j/olE0QLiTGKumY
 noTFZYOFJbQi+xwectDOv+C1hN/+Ah+xXeFL+daxQyDZ5ZI+6UF35dIWnQwZ4ROy6rBy4ga73nS
 cmpOHDlWtOmzAqdxfsMPPbWCxn4s094y4GO420pU9wEDEaUNVG8qdV5/DXrFu+qd0l9gNPgIGZL
 DxjgQ9pCXKeK9gMHejSXUIeTW1zdTT1WWKW7hRLVIAcWPcgBWfnA1ry750wxlrktcmK5Yfxpdpc
 k35aRKh4XW81f7sKgN9B9iaip7Qdd8mzTX/csJdjZeEnozy5yuTYs/7XyjZKs3nl/lrRHrnfU0b
 eiYIOPfsgP4nUtLXmE68r2kNli9ne/MaEJ12XOMTvPJ/W/udzS0V2O4bpK51wgJaK1K2fp1C1gN
 S8xbGFgJ2N/litO867ikP4ZW90qxRbUlaEEehQmhE+hheTdN9zxLJp7zoj5SMncJ7daTTW050mJ
 JOKeFFSqJLmbCKGe8mVr9tbBUXIzgkR7V8q+P5KUf387VSGAnpH800VprdwcUGn9gw3qJCA0kW0
 TjLU+gjaKwM4HgTSc+mQgfpWqsKVfsOpbT//J4tdtVlsE5FV3MSIgpn3eWgmT3nm9/lxr+euHoX
 Bu/MzhojeqUrvkhfisQd5oyLieG8ZfPGwx5hR6slr8MhTjQiM40ZCB++invQH3VJ6D4Q==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_184510_853194_14415F44 
X-CRM114-Status: UNSURE (   7.46  )
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

Enable sdhci driver support for SpacemiT K1 SoC, so eMMC storage
will be probed and activated, Tested on the Banana Pi BPI-F3 board.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
Since the K1 sdhci driver is already merged, and the DT part is 
queued for v6.17, so let's enable defconfig of this driver.

For the convenience, this patch is based on the branch 'for-next'
of riscv tree[1], and generated by command "make savedefconfig".

Link: https://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git [1]
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 37c98c0f98ffc0ee9d021e4d07aa37a27d342f7a..d8e1593ceeca487c6af67c73cb176c488f38bf13 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -230,6 +230,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SDHCI=y
 CONFIG_MMC_SDHCI_PLTFM=y
 CONFIG_MMC_SDHCI_OF_DWCMSHC=y
+CONFIG_MMC_SDHCI_OF_K1=y
 CONFIG_MMC_SDHCI_CADENCE=y
 CONFIG_MMC_SPI=y
 CONFIG_MMC_DW=y

---
base-commit: fda589c286040d9ba2d72a0eaf0a13945fc48026
change-id: 20250708-02-k1-sdhci-defconfig-e099c1d25fa4

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
