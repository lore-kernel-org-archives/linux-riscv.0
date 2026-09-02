Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A3C0C624D4
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2026 08:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UytgHizqPwUd7lw0q5+X43GNEQAMjbFWovksPYjlx7s=; b=4GFM6WBvuXAHgM
	U5cAKj9lIfDKTOt0+hjGa1PrRKImJ3yNunRwt9X4baT+MALZ22Il4z1aI4fUuhawUj5l+ZTdsYWci
	pVVyOTTrUnIQmYckkLUePpyLYfLng0wH+DnFv5YmqxcRVAL7eanTCL33sypCDwo4LDOe37p10k5Du
	4fEjkqDWYcC5HBRvadpClpzWElisw5XvDYkw8KKzC9TTtTlP/RVbVSwr5vV/wTtOlEUeT5x93eoeS
	Fb7Px5QSKwG+92U3quD/5M4w1JHbLGx3C/l29O+hWqjMaJxj6KBtQVX2jXrX1CHH0ToFRFPV/bitZ
	949MOsJk8n8TX8BLa+6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fxu-0000000E0oK-46qY;
	Wed, 02 Sep 2026 08:05:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1fxt-0000000E0ne-0U9B
	for linux-riscv@lists.infradead.org;
	Wed, 02 Sep 2026 08:05:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D99FF42BA1;
	Wed,  2 Sep 2026 08:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED0931F000E9;
	Wed,  2 Sep 2026 08:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788336300;
	bh=96ghYr0ZPRNX0SyCe3YbnY6934jg3ns8SdHr3LhspW0=;
	h=From:Subject:Date:To:Cc;
	b=XcDa5P2AlpeA3lCBCmkr30dwPO0A1Nho2aY/n8ya+RQdYC8g8Ne4ux+m1adDwT5AF
	 2G9H0xpmzfSFlRMkhICBP9pugf8LrAyqyp3EribTaJqzZv6lx4aBWUmz6MAyOB/o/s
	 KncGDO+KGEGOBRjf9GLyY/H5vcd+1YS1iMbcEOZqUuRePRDDEZlY2ukjiED+wVMJdF
	 0OGsyFT9SUZq9PltaKaQ4xp9/Df3rgOxZone/crrRHLEIwnIcaVRv6m/dFqnuVjcXD
	 6qCCCwRDposqxZyni1LU89dZZtzlng5xSuemSABzv/jPuZ0/s31X/mrxqv+Y3hjoCz
	 AxJHKQ+nz0JUg==
From: Yixun Lan <dlan@kernel.org>
Subject: [PATCH 0/7] mmc: spacemit: improve clock and tuning logic
Date: Wed, 02 Sep 2026 08:04:21 +0000
Message-Id: <20260902-07-k3-sdhci-fix-v1-0-b15c5d0f64fd@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIXYl2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDSwNDXQNz3Wxj3eKUjORM3bTMCt3kVFNz8xTDlCTzJDMloK6ColSgMNj
 E6FgIv7g0KSs1uQRkjFJtLQD6l7gYcwAAAA==
X-Change-ID: 20260901-07-k3-sdhci-fix-ce577d1db7b6
To: Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>
Cc: Long Wan <long.wan@linux.spacemit.com>, linux-mmc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=993; i=dlan@kernel.org;
 h=from:subject:message-id; bh=RekbWYYSIhRmOI7Xf07ekTwqNLkhgD+mZEct3lEXPyo=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBql9iREqcrHdqHC1dL7zbIsY8qNpeuZg2zC5Z9k
 tRYbLzJ/k+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCapfYkRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0oDxAAh8B/B+4HJ/2P/17kMsUM85/l3r8nkEK3sPjbNRk2qx4hfK3FFsaSy
 vz3l1cuekRFtmE5BQEKCV+swAqJp4l0DILsCgB7qMjel3S9uOfbWpICbBQpYzfZjxUEpVmqKG/j
 HPq47J9gh7lsIysCQIE8JOOznUTmy116gpsIDVCTn2hhBiQVK5tzvXjIZv36iXO0WMyY024Fobo
 egOsu4DDocXFIB7cGYhNNAqD7/YspgW4OtNQ6jstIkjmNar2j6zF5YUMQPCDPGNpF80tUFM9wWw
 ne08Uf3sXiWZjgWSRyKbv4sa7tLXQYW/74vUuDF+mUczFaIAt0Zd15y58RZMOfaxkZiMQJ9KG8f
 L64gNvRrWj8wgr1N09ZMVKtxwaJCxhJDchNTxGyk5tYCLkm9Dd8On0ik4KjU/xVxUVhgnuBgVp/
 V/gZaSVGSr/T6YBacdD0+9lK4UeeYalTL+XafKH9OD7TQWYB64i+27uZ94S/ZnFVntd03PNeuYQ
 K04cPvK2kSRw2KQgMrYugNjC8tLIFi9umS3lyDPv8sRdx9cKaoWKS+BRWoWzgoBojWVbRs7j8Q6
 038OgiTW7vK6xiBbmr0o1tZiL47wiVYHIEN5zXuB/F4I36MAqtqu6X8TbiUI0V9gP4fM459Hkr4
 MC4Axhtl53OTpZ5BdjpmmhfxaEr8c8=
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

This series includes some bug fixes and improvement to
SpacemiT SDHCI driver, which relate to pinctrl, PHY,
clock, tuning logic. Most of them are quite independent,
but put them together here for people to easy review.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
Long Wan (6):
      mmc: sdhci-of-k1: no pinctrl state switching
      mmc: sdhci-of-k1: configure PHY mode
      mmc: sdhci-of-k1: Improve power control
      mmc: sdhci-of-k1: Use finest delay granularity for RX tuning
      mmc: sdhci-of-k1: Improve RX tuning window
      mmc: sdhci-of-k1: Implement SD clock gating for voltage switch

Yixun Lan (1):
      mmc: sdhci-of-k1: drop duplicated voltage settings

 drivers/mmc/host/sdhci-of-k1.c | 80 ++++++++++++++++++++++++++++++++----------
 1 file changed, 61 insertions(+), 19 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260901-07-k3-sdhci-fix-ce577d1db7b6

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
