Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8440E8FDA0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Dec 2025 06:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTFmcqv0zov8Xj4GcTOVTuenX3+FA/LzGMSj1dc9fjw=; b=Hjzirl2Fg71Yck
	2ACu9RCzDEHheuGSAoRw+33qcjtCSQ+57lRr6mtt7YtrOtuuQB2CccruEbtGbNEhPAnZ0Eb441ag8
	l/yBcDN6/C5f/zaXf12TYrr4yCSue0qKEinelUUz/tIT5WsgECv1ATJGWxrzGH/KZVyCIKYxFGDgt
	4eRliBcexwhjTOnVCRVWt6aX08hJn4DNUGNFXSc4XZhMvmoJbxtf3nmhktNDHxjyRpc1+4Pb2s//N
	wb9eRblDcczbMJLY/ZhbViNeFL/+KUHLQmOBzCaheHfqrCx+YrriWmB/hRzDpRn2vBGer0QCXUaZz
	mx8F/BoqA+Xp1+XRqjqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1kN-00000000ykV-1c8o;
	Fri, 26 Dec 2025 06:56:23 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ1kK-00000000yj2-2vWq
	for linux-riscv@lists.infradead.org;
	Fri, 26 Dec 2025 06:56:21 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 92449340FF7;
	Fri, 26 Dec 2025 06:56:13 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Fri, 26 Dec 2025 14:55:27 +0800
Subject: [PATCH v2 3/3] reset: spacemit: fix auxiliary device id
MIME-Version: 1.0
Message-Id: <20251226-06-k1-clk-common-v2-3-28b59418b4df@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
In-Reply-To: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=nZt8LczdeEYtuXJI/rXMtv2yMXU27iWRkv3bAqS2KIg=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpTjF5VDd6l/FLTRfQrAj3nlV36Lr8SOL8oeon8
 fkW0K12Y0CJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaU4xeRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1iLxAAjNip2N4yTDRtJTqrhY8r8mz8gTkNfoCQEMKFNdEINtSAILbGasR8C
 1pWHgkxG+N4hU9EbxDYSJDngPpw/pExvST7FtKhNabyZps9xIgoPcXyeCaV/dQj9twprwdeswkn
 QFREIkGEpDAFiNPVnIfxWTNRzQFXjVHcIBbpebmqX31FoP1IGEky+SqsP5xpL4pnLmparPvsMcK
 iC+sP0kMuh23dGuz33HGXA1OPycxz0Y713L5YHj+JOjKOiz3km6dDv6cAc798h5WDR4YUCIEk76
 8gaxk70zU6IJ4Y9+9/3JU/Un5YtfUGTgfr0yDkiaxJJgPvbhp+d+e6aedOoN++lcy+nxNTtwxos
 2nf0kK/Lhv2B44e9LCt8AghD848V70sq4JU+4Wd+MloCWcm/ObojqBy+pBkoWlweHqQfQMw2o/7
 FtiDrLj1gS0KjnI88ccjfZZu9bAsEUVaPQfWnoLMuoFCPZxhxE2Ce7jHkraDo2ghL+TqLj8cN8U
 ml2wOD5TimEt7/jbOwEKSxxe6AqIAHbtm5zy6PeQNCLtQVvzUS2aO4nb+uubHpgeDMM9wEIFJrj
 hA7HzjHu6Yb0pU/R9HxGJXnQcA03VyAFKuYPsp/QHiC4fNibcYNCU+JotYQNlFTyu4WVCkKo+s/
 SIhP09p0t8mJdB8oQ/QX0oQBRJY0oE=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_225620_778075_3214B162 
X-CRM114-Status: UNSURE (   9.77  )
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
index e1272aff28f7..8922e14fa836 100644
--- a/drivers/reset/reset-spacemit.c
+++ b/drivers/reset/reset-spacemit.c
@@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_device *adev,
 
 #define K1_AUX_DEV_ID(_unit) \
 	{ \
-		.name = "spacemit_ccu_k1." #_unit "-reset", \
+		.name = "spacemit_ccu." _K_RST(_unit), \
 		.driver_data = (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
 	}
 

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
