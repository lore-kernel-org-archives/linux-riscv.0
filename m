Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D0BC61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 11:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wcvl3xUG0c+OZtLFLEG57Ntb3dLADm9xOVG5UX10Pdw=; b=wPcVgihsxnkHXm
	K/QhSGY2eI8sRrma9wQ+4VFvhDNyUh1S0spE8XLsX5yOd/xSNodJ9738D7IcJdx1IZDffs7maOBa2
	Vre4jTfiBw9HpxNMKmor+lSrjeC9MueJoOXmcZDVHMdXlwk3GQ+sQLPp4L7QHRD6O2dEHEy1a0Mhb
	VUKPauccxke7GxqhAVqA10kKlIzR9a8AfA2HL+rZyAVFVBOq8TXr7987IiGXeK4G+c1OwjmSeeg55
	97imv4Wyu5vFKV4ZvF6945rB6Ut1/z9mn/cdbmP7ILhOHJlk6e20fnVfm2LqhLvMCrSL9fymowx39
	XVMg8rz5OkdSbTcrZ/Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPcI-00DE0z-0j;
	Wed, 15 Mar 2023 11:48:26 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcPc9-00DDwp-2t;
	Wed, 15 Mar 2023 11:48:19 +0000
Received: from localhost (unknown [188.24.156.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 366496603056;
	Wed, 15 Mar 2023 11:48:15 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1678880895;
	bh=33Dl4++lH2paqP+E34n30hxUALKXJWejZRw6a5N0108=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HCNZxmYd7Rk0fF2LXGnK5jUM8+WvdGbJ1/NIbtWczIWZsLTe0DuVImLuU783oGdnB
	 9MgSeJidV8hn6HPZM++7HUy3sXUZrkaeQbaAO8SetTyoixcptmM/FMussRM/6ALQev
	 qTce1dWZHlFBn9T7ZwNr6fRhFRshrcBmWEasojVTt2v83vUO6Bg618LUuG61r5Tnxj
	 57jwTbsNaLZA8Yn1g1GWa1uhzdXktVk1kVGEdpHA1st3WVMGAvC3DgiBoNS4sgHZ4/
	 MFsmFrwUaYPfSWvnglvF0eEski/0pojYpbepZshIvy4ZUcJrJrjRVr8WwJBoj6DMlg
	 UKR3/uvf1PnSQ==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Drake <drake@endlessm.com>,
	Katsuhiro Suzuki <katsuhiro@katsuster.net>
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 01/11] dt-bindings: firmware: arm,scmi: Document assigned-clocks and assigned-clock-rates
Date: Wed, 15 Mar 2023 13:47:56 +0200
Message-Id: <20230315114806.3819515-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
References: <20230315114806.3819515-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_044818_081727_69766E8B 
X-CRM114-Status: UNSURE (   9.78  )
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

Since commit df4fdd0db475 ("dt-bindings: firmware: arm,scmi: Restrict
protocol child node properties") the following dtbs_check warning is
shown:

  rk3588-rock-5b.dtb: scmi: protocol@14: Unevaluated properties are not allowed ('assigned-clock-rates', 'assigned-clocks' were unexpected)

Add the missing properties.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 Documentation/devicetree/bindings/firmware/arm,scmi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
index 2f7c51c75e85..10cc7ee46893 100644
--- a/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
+++ b/Documentation/devicetree/bindings/firmware/arm,scmi.yaml
@@ -246,6 +246,9 @@ $defs:
           Channel specifier required when using OP-TEE transport and
           protocol has a dedicated communication channel.
 
+      assigned-clocks: true
+      assigned-clock-rates: true
+
     required:
       - reg
 
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
