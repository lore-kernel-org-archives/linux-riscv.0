Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84C5ACD3427
	for <linux-riscv@archiver.kernel.org>; Tue,  5 May 2026 17:58:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2JHwq8rGWhwCdLvcvh1feIDkpjiqT88M2lcC2gFg43k=; b=mefsNq0/RaAM5/
	Oxo9i4DflC6fG+7R5Nle7yC+VPmiyrTGxdXRjWn8V6TpADzhTqNluTFhXXOGpznzx1OKo+3mh+Hu2
	989HpdwkvXLTLTDW49NCijOdBcFoppP+jyihLLQP6YPegWn8avquQqaiszKOQte5ztaiqQ1kQBXVl
	EJKz+oBTiUetZEVDMG5kUWA/WKFvMIhib/rKGUFfo2oNBJuhefD9xfOZArk0FSaKAwEvYtPx9FAH4
	YC5GczuEC8LHGnjIkFn440EA3Km/qCuX3mK3wsDnAs8DRixz4smjWC9DMplQ59PkZ7QkFwKzHcL8G
	JHAGZgPfC2icZe1c774w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK1q-0000000H6Yy-0Bc0;
	Tue, 05 May 2026 17:57:54 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKK1n-0000000H6YI-3NDE
	for linux-riscv@lists.infradead.org;
	Tue, 05 May 2026 17:57:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7767F408B6;
	Tue,  5 May 2026 17:57:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BA09C2BCB4;
	Tue,  5 May 2026 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778003870;
	bh=CVoF/aMvFZiiQJ2jem9yrxKDBn80nFnyrlVLhIRdosA=;
	h=From:To:Cc:Subject:Date:From;
	b=ArMc8fDVcsmjBKD7s6parLZQ298K1YD0Ki7w0CyVdtMHumfu7gz27pCqVsF0ZS7O2
	 R8n1fRC+/Ij/9jD3dFX69yCyWTSRBycqIvayLuJMwzC3TUlRLJMtE87UuYQCrWaOF3
	 vz9ql8d3QegfzBGObI6x/2mNgPw52miXVkiw462IEBlbpjC1nJ8dcmGrJ4GJaTnGIw
	 1GCKDz7KI/Yl7XuDVFRWtmKBbrKqhonj0wQJeQC7/UYr0mj8YH1AO5V4XjDBnTTfaf
	 IFaNDIbRuNhyXPL/7TDC/V03o/y/G2CnFZngNTuMMvO8XWhryB04I2Z7BNqtVeaNDW
	 pCJlsW5ZEE5Jg==
From: Arnd Bergmann <arnd@kernel.org>
To: Mark Brown <broonie@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Alex Elder <elder@riscstar.com>,
	Guodong Xu <guodong@riscstar.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] spi: spacemit: avoid 32-bit integer overflow warning
Date: Tue,  5 May 2026 19:57:33 +0200
Message-Id: <20260505175744.900750-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_105751_873119_8621F58E 
X-CRM114-Status: GOOD (  12.03  )
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

From: Arnd Bergmann <arnd@arndb.de>

Calculating the bit rate in nanoseconds does not fit into a 32-bit 'int'
type, as gcc-16 points out:

drivers/spi/spi-spacemit-k1.c: In function 'k1_spi_set_speed':
drivers/spi/spi-spacemit-k1.c:393:38: error: integer overflow in expression of type 'long int' results in '-589934592' [-Werror=overflow]
  393 |         nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;

Cast the value to a 64-bit constant to force the longer type for the
calculation.

Fixes: efcd8b9d1111 ("spi: spacemit: introduce SpacemiT K1 SPI controller driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
----
There is probably a way to rework the algorithm to avoid both the 64-bit
multiplication and the following division, but I kept this as a minimal
change.
---
 drivers/spi/spi-spacemit-k1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-spacemit-k1.c b/drivers/spi/spi-spacemit-k1.c
index 99db429db0b2..215fe66d27b4 100644
--- a/drivers/spi/spi-spacemit-k1.c
+++ b/drivers/spi/spi-spacemit-k1.c
@@ -390,7 +390,7 @@ static int k1_spi_set_speed(struct k1_spi_driver_data *drv_data,
 	 *   ticks_per_word = BITS_PER_BYTE * drv_data->bytes;
 	 * We do the divide last for better accuracy.
 	 */
-	nsec_per_word = NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
+	nsec_per_word = (u64)NSEC_PER_SEC * BITS_PER_BYTE * drv_data->bytes;
 	nsec_per_word = DIV_ROUND_UP_ULL(nsec_per_word, drv_data->rate);
 
 	/*
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
