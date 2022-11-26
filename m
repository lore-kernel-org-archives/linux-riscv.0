Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124F1C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 06:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZ8qzDRFNKjG3NazDc4OIuKv5IHf8nKShNsym7ppqVU=; b=hQ4VqFQ0QrJLWU
	nQfytNU48LPrCB04DQFfd3oO6Dl2BZGJbvQyalii+g/m6f439uZ7j6D+Iw/uqCzlAG2EoCDEXQ2rL
	brCRPrLiW5L1m3eGPVFrq53BBPXFogtsd2tb3SKc8MqZSBjMdClO843VIkEocn9l0KOw0nX/JO6YJ
	fers6Ed4pIUGzG/k0OO6ufCrOk3Z8XIuDnxYa+Fwzr4MxUkbXbPQz8UkFCO868YZyjecnAbzV8jHz
	96aEgJgCyVzC8+lfl2zxzAbY5i6BRUsX4BvEKTF2bI5iklTChC0QLNnP/JEokxcCe9GIuKqpNkO8h
	IZvT/iBGrvSFwg9Mqz2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyoTw-004Tdy-2G; Sat, 26 Nov 2022 06:16:08 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyoTn-004Tcn-HD
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 06:16:00 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id B10075C00BC;
	Sat, 26 Nov 2022 01:15:58 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Sat, 26 Nov 2022 01:15:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm2; t=1669443358; x=1669529758; bh=hLJUpZI/f7CpelvMplO2oQQt3
	hxU+GpZrdXUTH/HZis=; b=oK3G74Mh1+qwvqE8Jcp19vt9rSZediknoMzlwigqV
	NgAhattWRXTqTb05nFF6I0HTMVS9l5TACIM+WLaN/XE1seaoRnXzOmTViYHPtLY8
	VNFXyHaVOmUkath/fAySUAd99SCSX90LzoYrKXbEqiN3yLjMMAfphD+R3gneKeMk
	WpeRn8efsMd2rcLggV/Espx+b4kSy0fsRZpWN5nJTujh+iBgYfARAVcmMHHbpHY7
	w/boQXEQ984IwBKjrInfXYl/VqLH82dmFheuaJ8vkhOGJfRwrgEgwYaX7ruVEO1G
	VafT6R4A6lNTsg9rCYr/pMHh+6dz5N9I25eaZOUjQcUVw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1669443358; x=1669529758; bh=hLJUpZI/f7CpelvMplO2oQQt3hxU+GpZrdX
	UTH/HZis=; b=YjSv9StU6p9jBx6hNQEX9xloESK42X7RLve5kT4VRiXX8rINBz/
	5V5mPerP/s+hYqVOaXcs7ePX5TJ1HUJYfRu43C8rvi2YeUr9Uk5+YuqjYfeSuWVD
	Vtz6ww0Kcp4eDQsnSMEKYuGi8M6/+iXF++EkzUz8Xu8O+IgkpddcleZaove/kjXD
	auJqd+0VWS7aanSAVOXQevXWvXhRe8KEwsJjUAQVQkY+6JcDJXfjA9wbvS4Wwuzc
	wkm5KWzgPet02XKFvuDHpH4TlQnQpvC1RHi6c+pIvQ+6upDi8vmKEUr7+xmScaZV
	JoRNfhPJ3vHW75wdxJ06wA7Jvl8DLrbnpyw==
X-ME-Sender: <xms:Hq-BY6O9A0Jcru6yMKlTvJo4ChWa2ofbiRZkxCzUMCxmp-51pPKrSw>
    <xme:Hq-BY49MMuyPMEA-NgXmLJGRKSjA1jA7UiI8YOPDQMnOKqmbOOXI_Vz6tVymdhQUj
    4F-vhO4xuXFowNMWA>
X-ME-Received: <xmr:Hq-BYxRrZ0_Qq5tvpsao7BiCj3oa71L9RVUCkGbhATh0Vnkcdh9pRD2sMp5V1VVQnehNwcNh9K6LIUiTnvpE58RJSi2etjhFCOS0bLtOe165bLNY1qAAovBY231ARHYwzox5bg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
    keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:Hq-BY6v7jwyuvbep-2IxUawV_KxYC8TlqvyUrD549pT82kB3CPqPuw>
    <xmx:Hq-BYyeOUT3hIbwbDlfQYV_Ubi2vsqA1fDsZ0UhEdoFlJ0y2BOf2Og>
    <xmx:Hq-BY-0sS8Dv4TgqYzM9hlT79gs7Zbw8k9p_v6V8uD4eeRCdDmjooA>
    <xmx:Hq-BY6TRt4N3yvc4Xh9sVSc3b52Xw7IJW0LKw8apnyTfB1WRshe_Bg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 01:15:57 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Fix NR_CPUS range conditions
Date: Sat, 26 Nov 2022 00:15:56 -0600
Message-Id: <20221126061557.3541-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_221559_674868_803E6CD3 
X-CRM114-Status: UNSURE (   7.84  )
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

The conditions reference the symbol SBI_V01, which does not exist. The
correct symbol is RISCV_SBI_V01.

Fixes: e623715f3d67 ("RISC-V: Increase range and default value of NR_CPUS")
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 arch/riscv/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fec54872ab45..acbfe34c6a00 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -319,9 +319,9 @@ config SMP
 config NR_CPUS
 	int "Maximum number of CPUs (2-512)"
 	depends on SMP
-	range 2 512 if !SBI_V01
-	range 2 32 if SBI_V01 && 32BIT
-	range 2 64 if SBI_V01 && 64BIT
+	range 2 512 if !RISCV_SBI_V01
+	range 2 32 if RISCV_SBI_V01 && 32BIT
+	range 2 64 if RISCV_SBI_V01 && 64BIT
 	default "32" if 32BIT
 	default "64" if 64BIT
 
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
