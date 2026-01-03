Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B442FFC6175
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Jan 2026 07:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2mL4mq9SibdDBL/2FWKEVpk7NZULAd4F1K6CVeBqYhQ=; b=v5MS1BrSoCNglb
	1ZSMVLKw9/NupVZSNt4PfrjdSFdENuM+JiRJ4fNWmvqZIcBUNaRl/VadYiijITpvR+edEbjz/t1BP
	jr3aKyU8zHHAgttpHtcaDNFqkwjJc9hdh1p7I5uEzB/7/GPv7qcFVJBk/Zle4PyGnTV27QZgF6H/G
	sMm4wMIusRIz0YDaeTWfn5evqd8v5XY2tO8II6KpDIyQqgI4In2gdlH4EBHgqJTcr4xbK2nfSWNq3
	xk0zPHWUdf+3R5PGjRpYl+dFg3NU8bM7iiFYiQ9WBVCGaUO01/fRqIO0R6Ta0TUBNr51e8dwQI8PE
	8Mgi7S90gLfUO9q2cK/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2Y-000000093Wu-2zmE;
	Sat, 03 Jan 2026 07:27:10 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbw2W-000000093VY-07pK
	for linux-riscv@lists.infradead.org;
	Sat, 03 Jan 2026 07:27:09 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 3B42B341E7B;
	Sat, 03 Jan 2026 07:27:02 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:26:15 +0800
Subject: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
MIME-Version: 1.0
Message-Id: <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
In-Reply-To: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=979; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=zX/4qEo/Fm6O0cbgUCvQ6GVe+DPSF8s25eCUmnf2qUQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMStJpUS3UYf8rEdkVomPqtVtP/dlWvqu3wkk
 P61QmbryzKJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjErRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2J2hAAgFknf+s5p+06k4LgUhusHp3VVobF4c9Ii57EJgYVCXhghn3K+8frz
 O9iEjLi9fy/agfM7hJ6b8xQvsh5w6BxatapMh3zymUh5pBBLOVo+LnXqRYe+fuPGIW2RRRfBAer
 J9zl0KF8hcVilKY0B2JJno5PXekPC7dUR+qxVuDK/18+v3yKJ3K5d45nrGN4Uh3P6gUi9R2w4wt
 bmQx1YLWCtwzBV2+CygujEeo+qOw59AaWRF0XNJyYdVY5mqtIrbE33y3ikGe469PqW/Bx7p7Klu
 y/4E9N67amhGD7N97K3tm9mWTTT6XQkEiEzanxCyFMhgQOYnaD94IZIJymhXn6Kq4DCH3BD2GEt
 oR0JCU08ymWVLfkI1H88SB3V1oOFDMY02YwDeL9KNsuCllmOFl6Eu8iNSXx33tZ5d1uzE6dVtXD
 ZQuYapz+I4I5HtTVUD4702GSZdl/lSVIw+8tAGvworOatDk/OHtfkszR5Z35cGC0pd75K2H/PHw
 p/Sz1bhFXJNRg6j7CUS4x1mlyZ8pX0Q85f1hFnfUm0ayL3K2z8H6rjINYUcCsBhlq5Wge8fM1Im
 XYeMTt4NBbwFSKHLarOdZMkXvbsfiURVrOpVZ1tha56olIFZjWQddiVo/tpdNTwIvD4gjoWnmcG
 6t9BkJHm3mJttAf0N73Wwa9Zmc1OdY=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_232708_277519_4745D247 
X-CRM114-Status: GOOD (  10.45  )
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
