Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E70FC44515
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xji4oU0EWkhPPOqabB2pxm9/Z+ZZ1Zsn4nOIvCr5h5g=; b=fHh3qzQ628zNr3
	Yn1JSQCtWpLcvipvSvl7nEIEVNwEUujXgkzJZWtG26QPs+BbrUlGWi3ToqyQkZTpbot5oeZHsrl73
	dB5QT0YxuA3jklgHCcu13b7GhKBFFc7oRcS7ywiiE4mtpXe17jtOs9KKxJzUihoq4mwBbI4f06DiK
	bmic74ly5W1jcyHIZ0LLGztAzJoiTvK8WTtXpOFx3pUJxZyFThMg+ir2bWDpmwU3az6tULuV45Bj6
	Yi0Bwie5Bnzb3pGqO6LiPo+PT0iIYYLWuzIl2vTGj6ZcFKREI2jHkB2YXQaIanPwiANi2N2vL2NjS
	0F5lLPxHyQgajkYve8YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyX-00000001RZN-1MxR;
	Fri, 17 Jul 2026 07:27:13 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkcyR-00000001RLU-2Vz3
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 07:27:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273193;
	bh=38PhwQsCteVhWqZvbvzqZlrs6p1pYCdri5yp22jYWIc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=WsIvGZeKaRqjAiH6o1CXJHG2gS0lMrYVJDKfcVfMhqH4QdAi8wCX103FUhyD5noo2
	 th71H6jTpjvZXRFK4oPcfGRk/nfduNjj9UXCE2PG6k4bUqwhM4Bn5sxfww6o3twq9+
	 HTieYpgPZax7TA7lV/5rglnXmmdN+p244vgIAs6c=
X-QQ-mid: esmtpsz16t1784273185t0cd49d46
X-QQ-Originating-IP: 0qEVPKCqEdQ1GXAUHe8Nd/dZrwlIlPynUoTPLD47rxs=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11695669700659989284
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Jul 2026 00:26:03 -0700
Subject: [PATCH 3/3] clk: spacemit: k3: fix missing /2 factor in i2s sysclk
 dividers
MIME-Version: 1.0
Message-Id: <20260717-k3-clk-fix-i2s-v1-3-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=jdxLhGznkgDupAqCdXkunU0hq5sAmj1K4l6yG/K9+Gc=;
 b=kA0DAAoWmAnvgPkzNC8ByyZiAGpZ2RGh+AjRw2mKqB/RlTGH2MU1+TNKyWxQw3vLFQRAyynTK
 4h1BAAWCgAdFiEEi+AMtnBMWj1wEHFNmAnvgPkzNC8FAmpZ2REACgkQmAnvgPkzNC+BLAEA7Uki
 nKszCL3B6P3wkkKECxf6bYm/ZqdNV9iiVEh5n80BAO39hlDprHKXIIw/+nK2k3F+aH1Aj99x1ae
 jGDlBe2sI
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MhbIMYBflAap/6Y+LPeSAXJUHcNydZE34fdWk5C0Ij/QzXw+0ONdnzJA
	NDuVE0eeYxS60NfGPRyLypJ7YoajQIwooZAES2Zkp5BPlIpI+0yi3h3NnwS1om+vSbAJC4b
	FdVXE9DZLogFM3VNZs8nWyoeSg9VitPtATw4jnWsutM8JAJk8cFGlR5yNkITzC/wcNM6JUH
	BYaUhE9gEze1/zUJmSBpGzC8kGMTSNOHsfB4vdUArCfG318w4glt5pzuG6qEbnw1LwOxej8
	e07tROvyBmOOJEbjHTIo6shtippRJRbAPhR12vBLR7rFaf8weN1dDeYirTmFk2qzI81E+5F
	fta2ETm7isFlz1eOS+3WtpQ6/a5lpotsvO0LilHAw/1zVKk14HBqQ2TErWAFxRr7z91zl47
	QnSz3Et6nmsFt2YpnzYse2mr7YQJhelcvDVqMC7gWYy7DoXybwstdfLOhg7jb5R0Wg3Vqpy
	pGzYdt9TT3AMwBT6PZiFioPt3Hvy9jDCNw3BmxrSuDrzyJQDOYqqsPzb0nmkKMKv5oQ5H6X
	XXDozR+wmDOvggswHpHci7ZXsdK/wXskqCc+OpbBYcguALBXWAqfZLHDu5FYgidyJpfmDQW
	wyNJoLX+J+kSmYMozDjUewTb25tV2wwAfw7cindAhqJttQdfZuNFCLP3KW67mpi44JLX+Hq
	tUWphnmtkCYtrCq2Nc2U2aOsPSLFlB46/+TL4eKjcADy10I3gR+1aqd3tM6REGWg4MqGyOe
	GSiqe08AL6FZqk6ooOhrcY7c0uvJ6X8oQBkbkTeOv1QJP2WwrMZfixUXHKk3G5RGoIC3ji9
	fao0/04LjTBxk58doQUN9mR7K3Z8Hmf7JcRRnqr6IX6gzDZPegukddKHf6AwZpEffgrxE/j
	dPrQ/H50l8Op0fnMkcBZWimNmOPykKI+6FECWM3v2sgjrAbEAUijDukJIkjIyR28dtv6MsL
	j86AkPE2MK1rv0xTapUx0oxThdlrcK1q1abPWsZCpWP2vVk5Q+w2gschc8ZBW/BwNWbTo9L
	yM0Pf/D7sAduYWi0LzndnVKUqKVK7YrwcdF15HJLgkKvot+GFWX/e9RSV3mb/FAaZwkMQEV
	V5ITIqCuMwOHsze2OOxp3g=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_002708_093506_FD40083A 
X-CRM114-Status: UNSURE (   8.24  )
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

The i2s{0,2,3,4,5}_sysclk_div DDNs have an additional fixed 1/2
divider in the hardware IP after the configurable divider, so the
real output rate is:

    rate = parent_rate * num / (den * 2)

Set pre_div to 2 to account for it.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index abcc5caa67bd..675cf03d98f0 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -244,11 +244,11 @@ CCU_MUX_DEFINE(i2s3_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 12, 2,
 CCU_MUX_DEFINE(i2s4_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 16, 2, 0);
 CCU_MUX_DEFINE(i2s5_sysclk_sel, i2s_sysclk_parents, MPMU_I2S_SYSCLK_CTRL, 20, 2, 0);
 
-CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16, 1, 0);
-CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 1, 0);
+CCU_DDN_DEFINE(i2s0_sysclk_div, i2s0_sysclk_sel, MPMU_I2S0_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s2_sysclk_div, i2s2_sysclk_sel, MPMU_I2S2_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s3_sysclk_div, i2s3_sysclk_sel, MPMU_I2S3_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s4_sysclk_div, i2s4_sysclk_sel, MPMU_I2S4_SYSCLK, 0, 16, 16, 16, 2, 0);
+CCU_DDN_DEFINE(i2s5_sysclk_div, i2s5_sysclk_sel, MPMU_I2S5_SYSCLK, 0, 16, 16, 16, 2, 0);
 
 static const struct clk_parent_data i2s2_sysclk_parents[] = {
 	CCU_PARENT_HW(i2s_sysclk),

-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
