Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EBEC61DD6
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xIAG+ZlbeYqo0rjXjZ/I3oIX/PZPyC21FqodPmu5ZcU=; b=AL5SJaVKNbFfKZ
	Vw5ej1bfu05h21kvKsVPSNyRI84cA+LC4Ag+QnojOMmgXLuZASkMlzOYq4+kIcjbWJQ1Vuz00BSwr
	lw6vTqemMMIX9JsJqnKS4TMVQr4ysmyD7HXv7by+7eCttE9WGIim2W3tu+08pC1KXHCnHk8an1jid
	2P1jDtY41ywb6pdpbGW6LTG8EqDlBP4W3nDS6u15upcM9f2w9itrQRQwRPg7m66T9OjoIdP/yT8Ww
	HTQK/AIr7EAriVScVAZaipR3sYgwtAjdjm4DkGCkqpX0+5Ypi5jJ7vQf+SUoq4YtWERNuX17a85Gf
	IMgKIKTbGYBv+pqA2Hew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fxz-0000000E0qb-0gIi;
	Wed, 02 Sep 2026 08:05:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fxy-0000000E0qH-1X07
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CCCFE60218;
	Wed,  2 Sep 2026 08:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 062551F000E9;
	Wed,  2 Sep 2026 08:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336305;
	bh=oOt6rzGyB9+dcVCWANgFL5IswuKEaIiQvhJRIFhDyWc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=VZKdsy4ezYtgdIoGNNvPFpCPEWFtOUJhXLtGk+hzU2rpgLgdLa86S/Gv+el2VBXBX
	 7qJGMZb3fW7F5cpQpe6+t9ogsbvPYEiBUad9XAUL7sL7wrq0q2VmvsgBBAhlSYAo9L
	 0207pVa6aExNtDCf/47ar1m36tHRXdJQBc8zPq/+I4l7SE8pHDMYKQ24gpbYHZLiYY
	 oOj8lEdkcpncfjXcDSuatozO2ZLDElK70Dtdh3QbF6+lbtyyWDpR60/dMwXJ1+COy5
	 MSTqijODXDytN09AeohRe7j62SgXTgmX2bURIUw67rkh09KMyk1Ikmby8ED20XaWFC
	 TOBnfsUMnm32w==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 02 Sep 2026 08:04:23 +0000
Subject: [PATCH 2/7] mmc: sdhci-of-k1: drop duplicated voltage settings
MIME-Version: 1.0
Message-Id: <20260902-07-k3-sdhci-fix-v1-2-b15c5d0f64fd@kernel.org>
References: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
In-Reply-To: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=dlan@kernel.org;
 h=from:subject:message-id; bh=TywnkrfNejt6BzR6cv7EHCSdNE4iapaJmw9uveBcbaw=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql9iXmWeCcM3ycd95fOAQxxiCl2Tb/s3R1OYru
 lqOo5IK67GJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfYlxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+06wxAAoIwJiACs7alFPcjAN1xkJ/eHgS52onSDqrH1BvvPXNSP85XdbnCTu
 HWSeJZqkmUYHw62VgpnNo0BGzJ1tlVWLlVsPtjctxWOdO0x417o78cWD9Pirhii0L9EvbgX8eGY
 wkpjiNY6TNVTdBB3kwx5o3ZqotKKlBhFxDFJciDoNgI7gG8M+yIA1hCi54OT4PjKo969KJZrss2
 r0l0Z5zpe6ukNYxRAnIbwoeUZawVYAPTQcEihJdcLxPF8Cn2cYf7dzgbLejaDKKwcznD8Lq35sy
 H0jWG/vgxJF4G88zmcoiehL57wxnwTY2SGlHXdJk1uUA7hrSoX8xik8/PiyvOFtwV3g74JwgEaj
 onEzYdcTKyxMC5lnDk58UJpY1QbPP/+nUxD9pf3wrcW6sxlIVkfitTzozLjxXVk6QYZv+s5eG7H
 9p70sFzckmkBE6p5dsf0zhFrjxClhFYbx3jSlt5xNTDYnmnFQG1EU16W7XdyMFPBq/+8dTnHMQy
 dbWec12vYdwcsPAmaXIZcn/dffuyOPiH2GK63yPOo9V/LsB7T0UdjK2jUHHkTqupB1hh9oCXw7N
 EaA/PfSGP6dXYwmaGcYlWYetq7M9zX4YBV0QfrktU0pqYY/5g5w2m9JablMkgbuVSmjKfaHLSMr
 o9gYu9em+t9oX+OjJHHe6m1UHj6g4A=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

No need to set 1.8V Signal for non-SDIO hosts, it will duplicate
what sdhci_start_signal_voltage_switch() already handled there.

Fixes: e5502d15b0f3 ("mmc: sdhci-of-k1: add support for SpacemiT K1 SoC")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/mmc/host/sdhci-of-k1.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0916340d3265..afd9536f2368 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -195,9 +195,6 @@ static void spacemit_sdhci_set_uhs_signaling(struct sdhci_host *host, unsigned i
 		spacemit_sdhci_setbits(host, SDHC_MMC_HS400, SPACEMIT_SDHC_MMC_CTRL_REG);
 
 	sdhci_set_uhs_signaling(host, timing);
-
-	if (!(host->mmc->caps2 & MMC_CAP2_NO_SDIO))
-		spacemit_sdhci_setbits(host, SDHCI_CTRL_VDD_180, SDHCI_HOST_CONTROL2);
 }
 
 static void spacemit_sdhci_set_clock(struct sdhci_host *host, unsigned int clock)

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
