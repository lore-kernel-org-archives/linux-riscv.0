Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85BF8C10F1B
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 00:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tsn2QjJiTJE5yv0zTHQkmwj1ePyuJ/HPvrKW/sjjxtI=; b=1rDRTnR2aau8/a
	0QGwx8g/J+GkyWlmSYkWEKbriuLvdEPB6SOv6fXcd2i9xPo5ZYZ5KAmyayHmidwkeU/76WRq9kppA
	YI/mRgzPELlErhCWLtZj32JoJBZlWO3qO2+Z7QwsWpqc3S0mAQbxnEnEaxp7JZYW7Po3AzzWtbwur
	qoehsBxyTPLWRXa3KSZmcprO8i3513EParHB0qUPuL2Nkvd1FrcSyvshH+ABHN/6dFtdt1o5i5jS9
	Zkab6w3tje13+i/Gk4FPLvJTXyhy/CegRkWYBaaXp1RhFYUN9V1P24ClncmE0IBLbQ4/+mQqU/vIs
	lu2VxZ3vYjunvdn1Ko9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAKYw-000Ceg-OX; Wed, 28 Dec 2022 00:44:54 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAKYt-000Cay-RX
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 00:44:53 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id D7B5B5C00CC;
	Tue, 27 Dec 2022 19:44:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 27 Dec 2022 19:44:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672188286; x=1672274686; bh=lJKh5hLUSVyNtGb27sEl8iKUo
	pQtksa0I8JjuVzm/jY=; b=zsXQvkbc4qvvStb1M0jQ5bPd3f+tBhq0STct4u3nu
	QFwp83KoW0i4X//TVOFdjcNsGpo1Oc38whYYa4fcxGZZ2eckTsIBQzascSQqMPP8
	6OVXIpr4QS8lrMMTycvQ91m6h4MABLc40u0OqDZrJBcGVSwkIfn+8Ccw333WRn/o
	OKeY58lnAe0WBBFmQeUQFR4qZzeXq7m4JcZlPBMBwtsb30OK9N8DOfDdvrlofZtM
	PaYpS2orM7rveegfgrhS8t5AIsR+VvHlMG/64g7Eu8EEkiqSvkapcpYnVuxzuOtO
	wltFE3GW16yFFeXEIMF+HykbGcx2QWkWNG51VzbZTeSdw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672188286; x=1672274686; bh=lJKh5hLUSVyNtGb27sEl8iKUopQtksa0I8J
	juVzm/jY=; b=jpUgIno+86qYFaeGQn5+s30NUnkg/CCRVzjVp9GW/E0dR7mLEL6
	0DZXdgLmi4IMPbDCHBE6s3l6QB+KlxDqkQernCkEGU2ihv+i16/qN+hh+qornvRW
	iFBeM82wFAPlLX4qBIGjFMdw3ttGCWogLIZoXxqtEM2fEHC/r5Fg5EzdEBMf8lLV
	0DRy/AoepLZX1Gdu93AduwHcuDl1i957/hv5Es+1pO6bFDj34JJty1Af5u5HfPdF
	qbkN18LEkOeCeLS54EDRbc9ELnnqA8p7qMbMtdxFAKtYA+m/eQlKTsStnCSvhrOL
	aT/WId0KvRn/4djCWMHJxr8BoTi89658xVg==
X-ME-Sender: <xms:fpGrYwPR4xuCgO4e8y3P4kgryvMjk42PLPqwkWkoMEUIv3yhqZ5w0Q>
    <xme:fpGrY2_Mgh6SUqXB3ZIOmu2p2OjixDgn19CWxyBsVtHs3SKDvCDgW-jpLL_dugSev
    Pd_XqC8j6VxseP_hg>
X-ME-Received: <xmr:fpGrY3QdETEsIgjk2Ux7Dl81HunUTSYYv6VmsQTyWSeYgQ58vR-14Tv6BeEuJHSIP7YX_dYVHSb0qiLGdqbCW_3sULwLMM941T22UNW1VjW0fAFXaWEVWGinr7qTtQOzWC2YNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedriedugddvjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
    keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:fpGrY4suk0hdHM_fE1N5dEqeRltOyr9UMHDbkEc3qJa3vTaFnMv_wA>
    <xmx:fpGrY4d349C_7MaAlYDu9H52k22l5DFzr0D5ndAdsyDjxF0N6r2nLQ>
    <xmx:fpGrY83KlxEYWxV4AhgP7btqrSfpWVu29JBVjUs1vfimRgLwes5UBg>
    <xmx:fpGrY2tQhPmgQHCdvI7buI3rSUz3bXzdEKsHeUnnZLA2DefNNoaDMQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 27 Dec 2022 19:44:45 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Prabhakar Lad <prabhakar.csengg@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] clocksource/drivers/riscv: Increase the clock source rating
Date: Tue, 27 Dec 2022 18:44:44 -0600
Message-Id: <20221228004444.61568-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_164452_588378_07397065 
X-CRM114-Status: GOOD (  10.39  )
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

RISC-V provides an architectural clock source via the time CSR. This
clock source exposes a 64-bit counter synchronized across all CPUs.
Because it is accessed using a CSR, it is much more efficient to read
than MMIO clock sources. For example, on the Allwinner D1, reading the
sun4i timer in a loop takes 131 cycles/iteration, while reading the
RISC-V time CSR takes only 5 cycles/iteration.

Adjust the RISC-V clock source rating so it is preferred over the
various platform-specific MMIO clock sources.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index a0d66fabf073..55dad7965f43 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -73,7 +73,7 @@ static u64 notrace riscv_sched_clock(void)
 
 static struct clocksource riscv_clocksource = {
 	.name		= "riscv_clocksource",
-	.rating		= 300,
+	.rating		= 400,
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
