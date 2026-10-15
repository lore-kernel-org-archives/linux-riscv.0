Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FE76CCA464
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 18:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f97STwtnzxmPNWCUwajb1iXPoxoUvpVN2xGO0rbTG/8=; b=BKGPE9yud8cooV
	Pph/L0R0KUH6l8R0VrZx4joV2NtOXRo/6dCbde4xyhG2nJbMwNNRo9+1aIMh05YqwryLv6o14igak
	mpSc+EqBdOT2xl6HnlFxHWFMUhTuRCpS+wAVpKq/ODPCfl3ZbTq7yRRvMRC+4nNB5o8Tvi942t0Ne
	Tg2D5lDVmeIx/ZtqyiuLf0h8s720ue5FSH2E1+Q0iKJiGQF3BQeCWXn0G3T3vrqgppfa+OrcziLfB
	d3zG0NBoV3GmH/QweqdKAtSK4hDYgra8lAwdtrZY0fjF4izNPasdUbwIXsve7AhivEGZ3AgHpdWWW
	+yetH4ulZfOxNYYv2+dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQd8-00000001DVq-2onn;
	Thu, 15 Oct 2026 18:56:42 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHQd3-00000001DUA-2gHo
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 18:56:41 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso23172985e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 15 Oct 2026 11:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792090596; x=1792695396; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=L9uaqJAPXarvarEtcfkwHExBQaEeunLqH/UOPPD8OgC8e1vW+Ypp/ZXjV3fQfVb6xO
         Ez/cSWXaQrBYVj/gYHPSpqCEpIHKMechGt3b/gLFig1tEU08g6NbTd27EUJx05AKRkHp
         LhBn9S9daXSSCw/ETn6gZkKDoCRhStZHXj36tuX8eDuGJ1QJOH1uVa6RSrTvYm1DxRn1
         iZ6yZF0lMhtvqqEV5EtQly1LSwFAi3pbCMbzGnfK/mFMC1BUpUd9o+4eLyP7u1CbWtkr
         EWo6JqS0eyg/KbtZi9n2+G/XAnHD0FnytfMV3lP2TMiZ8e9z62inracbbTuD/dNsRCKp
         RYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792090596; x=1792695396;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7ni61b90g9iD83/OZasQVP93JejUptEHkbkJ81F72Nc=;
        b=GVwulyahjByPYKce1RKzd2O/FLjuAcHVQdgl7C1rl+vmRKkCkbo09K/cgmVfHBmU6u
         8ScAb0WxzeA/1dHZwpu80CmzJbv+mU9V5YRaInLr4Qb0tomMWUQkulbjUsqgWhqqBmBK
         yBa6+Yaqeb1JF0m/MSd8UhBxoUBtEKqyyv+FuFhmGmoIxn1SxrxI8cL0DW2RJlzGO1PU
         KB8Zh7M6lblTmomokHu1FuKADqDXT7by55bt5X40ab2sQxu7w/3nTfdhyIDTdmkkMVbT
         2Al0oyCfhLNETn3FIP40JmxzKg+D1Ktd+P9bKXpmDMgRIVKZr8vIlEnpzTLTTi1cDTMt
         DMZA==
X-Forwarded-Encrypted: i=1; AKwUvBzTNHQTXYg5VeZfLwX4wNNxQmd4noPB20qKEBhCoV4dTM4qNA+fnHj561J2FVLUL7bIMVOiFV50vl+I0A==@lists.infradead.org
X-Gm-Message-State: AFq9FYJzFO6elL7p/bvdnV5BVSrlKZFSI2ojgYtIoSTxeg5nsJTIecwb
	L8eFgjCpdZ45cd/HLIYGHOUrs1i7D4qNIWzhVfzM6EwUJIAwCy/Kzxtw
X-Gm-Gg: AYBFou02zPvckU24L2Nf+hmLYD1M0GdGTFDoU3g/BuObFMs9QYKpZonU20SVweX1HBu
	HRNSe2nGkRkFtcGfzge0ZXTowIfLGthuVUl1XetRJk1cDmTZEvfi9LE2AMx/9PzxFqG33RrGsRB
	2kDpfe7yodem2zl3AtXHJoXUd4ii3jEipQn73J0X7MrgsgAEDyoo2BHMJm3UH6twWm1Nr0SVBmy
	7W9uvZ5mWHWFdsRuyW1es/zyQPWBK2TCzLnxZIip33lblOiyjaciZwfGE+9eo7cPc70nBQGIEnh
	WnZ+IxRYoX08H30AKv/og7TXXzkyzo0hrA+ZpNrwpQqcCcwg2SIrBRD/9Tb4Cz6BE4ai6mr7z+k
	aih8z8sKeCVGjNjC3x7hFMbs0JiTdkMgPvo7HpJ3RmGe118gt1fTQzi2TAB3Fn2CVcWx/XARgKM
	GrjOdPOIOZiGJB2ote8dVDrptpx+ZBRVfBV8pCimqXs26dGnPJ5A7jpXcRwwbNGAKPzX1dY5PeP
	vqp/S5/qsvZmKUTVX1+Bb4HOEg1gBN9JFTAkEObwg==
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr399234465e9.4.1792090595555;
        Thu, 15 Oct 2026 11:56:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bdc036a4sm106148295e9.11.2026.10.15.11.56.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 11:56:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Thu, 15 Oct 2026 20:56:06 +0200
Subject: [PATCH RFC 2/2] riscv: dts: spacemit: k1-orangepi-rv2: enable GPU
MIME-Version: 1.0
Message-Id: <20261015-orangepi-gpu-v1-2-03566a615660@gmail.com>
References: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
In-Reply-To: <20261015-orangepi-gpu-v1-0-03566a615660@gmail.com>
To: Alessio Belle <alessio.belle@imgtec.com>, 
 Luigi Santivetti <luigi.santivetti@imgtec.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: imagination@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_115637_710617_7A7E7707 
X-CRM114-Status: UNSURE (   9.26  )
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

Enable the PowerVR Rogue GPU on the OrangePi RV2 board by setting the
GPU device node status to "okay".

The GPU will use the clock, reset, and power management resources
defined in the k1.dtsi SoC device tree.

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index b907a1396b21..cc375dd1a77d 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -384,3 +384,7 @@ &sdhci0 {
 	sd-uhs-sdr104;
 	status = "okay";
 };
+
+&gpu {
+	status = "okay";
+};

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
