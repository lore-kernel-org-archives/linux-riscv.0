Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E7DE668AE
	for <linux-riscv@archiver.kernel.org>; Sat, 20 Dec 2025 01:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xi8gJlY7r3J7pRRoLvM9+XBlqkmZ1AQad9qmtpxyxA0=; b=yfK7v0REBdnTsO
	F/Bqi4L3Yw03J60Ei9Ke7IPN8gsXtgnOM4Yi+LqslmG7/9SUCJYkoytfgK7D1AgHdZIVX3ooxfYn/
	fyC8BAA3Ir2GHlIiYPqM5nKlwfHnKm1MtjrcTscZCYO1BuKulBHnaaKMEs0Ldm0vDQiwzB/hJgl+x
	FI32D09qVxx5wZqQCppW55AhN7D6jZ3bvVDySdNEJj8zvxOX3SjBx3Q52fkTdc9vQKWEXYDwgVfwp
	2VbPkfZuQggcUhW6yXFgdyTRPqpuLbYd/Htxr56dVy8PXpHW1rGKoiuA1ebsX4Nx5zdXte7A9Cat2
	orw26vvD/xwoNiNnkLsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlVh-0000000B9lp-0Gzu;
	Sat, 20 Dec 2025 01:11:53 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWlVf-0000000B9lO-1G0E
	for linux-riscv@lists.infradead.org;
	Sat, 20 Dec 2025 01:11:52 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 96AB23419A3;
	Sat, 20 Dec 2025 01:11:46 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 20 Dec 2025 09:11:20 +0800
Subject: [PATCH 2/2] reset: spacemit: fix auxiliary device id
MIME-Version: 1.0
Message-Id: <20251220-06-k1-clk-common-v1-2-df28a0a91621@gentoo.org>
References: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
In-Reply-To: <20251220-06-k1-clk-common-v1-0-df28a0a91621@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=809; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=pZvlBGt2pzETwcYnjHwAYqZuge1mnwnMowldtQqPkxM=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpRffGaVMaBy6OarV3nXnOEPmHtzZ2cThSGeAbp
 UvTzM+so8uJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaUX3xhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1hIQ/6AsfDedYnwBCpUgxJ5z3nN5XFQCRKptDFDZzETpb9nRy99TCqBdm6j
 tJUK9p/1rqtRkAvk1SVmT1DP6fouk+GCsYOj/js54J5gMzrogFn2oINQKGz+ZQAdVZOM+BCXdKz
 N2S+4NgO3aKyIReIsN58bQeUpNmm3hR3EUJSORbMF1iYt+dgJq2tevEQ1zRSdYsObBwKBbr+fvA
 o4jxHc4z/85FV4nxRbjm8qGPLEUgTGCIDrsbawRKqNJ339Tag9guevBZPu9wGBGbAFaUbaxWMV3
 tlwzHXTpCJIX27QSnHy8IyZl3WAejBTg3ot5GvEGZ9ohjnOEE09rmLrWohoH3LTi+b2/H3dPaQU
 QXrApoLxPiIEB54ye1Nj9ND4YIp0aUWsP3Jf3B0zhN9rmVQ1Cl9qAL9JEeaUR3H3Eaj1x7wmOcM
 GMyJu6X3EHJ3yFNrOKPpwb2uRO/x02sfxSz2z/lkDAqgQNnin9oL+Pdqzc9A0u9d63RRX+grPzc
 yM2kef+ZWpH5c2UTWvGO6xbvE2x5pEIPRjVIR73eaoecQCZ/HS2XkKJVw8J+y7ZTLVoa84xNmVg
 8610yrpkd8TYWTnyOWnD47abFK1PyF7zeFy/w1IG2CfrSVGvF4Ksg+ABcGF+eUXqqok6YztnH7s
 vCUivuTWyk+zXasKyeUO7Wcwq399XY=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251219_171151_365249_190B2B38 
X-CRM114-Status: UNSURE (   9.39  )
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

Due to the auxiliary register procedure moved to ccu common module,
the auxiliary device id need to be adjusted, otherwise reset driver
will fail to probe.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/reset/reset-spacemit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-spacemit.c
index e1272aff28f7..0bfd90567011 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
 
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
-		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.name = "spacemit_ccu." #_unit "-reset", \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
