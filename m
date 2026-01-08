Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0642FD185F8
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWGQrF024KIuGpJWghAXAaB0+0swQ7nbHpq3gGUUmdY=; b=eEXvCtscCGJmU5
	+QRSpI66kaj2I2pKqBAx1IA2O2ewQOTyxvicdRsD3Lz6abnEl64ONkLwgNCmh8qmTAA68rDv5UBje
	hhDaYvbYpkncxP2uDesPwUEpFgIlOrCMXpbTobI8AMdzROr/5E+ZOlGpXtruGoJQOwK1ws9B6eMJX
	V1fsD32+YtAptd4c8xA+GB6+QzoqEDFtzcYou5aOWPbZt0Ma211c8kP5A9qWqxJJvWQbnI++NadgP
	iNNmkYE1W0UAftvCw1GhKjCJgnqbh5m8SdAKzWacbyvAMzjNOY5sSsvYOZEy941bhwBKNt5Dn5VQ7
	XHWTf/+q9aEiT7IsYg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFZ-0000000HCQt-2ed9;
	Thu, 08 Jan 2026 13:40:29 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdqFW-0000000HCOz-0FJX
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 13:40:27 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3494C341ECC;
	Thu, 08 Jan 2026 13:40:19 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 08 Jan 2026 21:39:25 +0800
Subject: [PATCH v4 4/4] reset: spacemit: fix auxiliary device id
MIME-Version: 1.0
Message-Id: <20260108-06-k1-clk-common-v4-4-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1394; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=1H8Z3f7ZzM80z/iMzeQsDFj5WxSrKZyntFw1N0hz2E4=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Ou6VH6nun8PKQLWXt5Ac58rGXOK5r0iKto4
 WcVU0dBwyGJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zrhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+0LeQ//f826Vjtrq9fIHoahuT856hkDj2NVqRN3NHXTcOkZyS3uUUudjEUiY
 ZKZeoP2HBQUbLY1NeEXiwrtwIww3azIT6Xqtlk6ZN6KSRpTYWxwydqWPBtRj/LRadXZaJwSJOcS
 enxpiZHkzJZBzjmrQ+LDQoOa2Lc21PGtjmxqd9Im/4486ZFB/Ma0TUQjhDDiF9WHt1U3gCR0JQZ
 5QBgChycoK1o+G4UJSpUTWt2b9HeR+ymAbj2sv1H0xPpK2v/Shek+2N3+HxDyzoIK2g9Q73FMYI
 m61NuNlscttcozUH6+LKTp2GCGMCscJpLiaV7c3ke9cSuKjA2EhyC5yg+urigai6m6U1qR/hOuC
 Bnq7yGwXbJ9WE/DXF8wmWCvMO3KEmGYCiGI998ElinPAlD6tnhmGrkBF8bJPC9CKbPmpQ2o/Yz9
 /m+dLpOHMtC1qhiR30rnR7Bz5Ivg3aRqJuOx8CSjMRYRKjCzfb1vmE5x4D1KKHIs5z5o6UYKz/1
 481AHojGbvUMwHiYTo7TScIxcc4iIP6if6hY8Q0aZ6iCH3VaD0WhkMHwuSOYMGD3EpcF674yx1K
 ttLBE5Y4mm0e5tYSndNYI873Id47FX9J21hzpBMI0TVycek1+ZrJA+ZSfi0rqR1pQVH6y2QSXTQ
 ZQKhssjoMpCS27Pg1vw8YGO8NJZ/5I=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_054026_129588_A5E64A5B 
X-CRM114-Status: GOOD (  12.42  )
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

Due to the auxiliary register procedure moved to ccu common module where
the module name changed to spacemit_ccu, then the reset auxiliary device
register id also need to be adjusted in order to prepare for adding new
K3 reset driver, otherwise two reset drivers will claim to support same
"compatible" auxiliary device.

In order to prevent the reset driver breakage, this commit is necessary
as a post-fix for changes introduced by two patches below, and should be
merged with them to make the patch series runtime bisectable.
("clk: spacemit: add platform SoC prefix to reset name")
("clk: spacemit: extract common ccu functions")

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>
Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/reset/reset-spacemit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index e1272aff28f7..cc7fd1f8750d 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
 
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
-		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.name = "spacemit_ccu.k1-" #_unit "-reset", \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
