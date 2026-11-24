Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577BF606A31E
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 15:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=V5WHmHLK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=qNqW2onG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:To:In-Reply-To:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=swA+ubMvkRBUh0bc5UCRrDj8IaVP45vgciIEP/Nnz/I=; b=V5WHmHLKWLle/m87/W6pWLhpt5
	7rdE6odj4syW9FR8ZVzMonFYs20lmqsQQpbEcjORn7sam5ATYcTM3iHV9HmViQsw7HEUtTRcwADcJ
	oqpOcwPFo23c87yMlb4PRKi24cHzGbnp5Rb1q2EI341WSCjFHSu7uwhMXWZbanJ2k5xGn2InqRDuH
	aecmbEqLEfDkrcRsuJxGC0Oa8Dj6yxHp1lAq0/7JbsJqT53jqk4uG4XXf8OX9UtnWIvdWC76Mvv0P
	8yFl5neHIJGlc4OGg5XEFwxOdtCYfng1wn1gIzPwygpJXYLhn7tTa5iCOp0wTO5g6jz+72JxLCNET
	d0eSiFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsrI-00000006zBE-24y7;
	Tue, 24 Nov 2026 15:55:04 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVsqQ-00000006yFi-40LL;
	Tue, 24 Nov 2026 15:54:12 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20261124155409euoutp0115dd4b784b83c26480159369f887c045~rBijgrkOC1661616616euoutp01h;
	Tue, 24 Nov 2026 15:54:09 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20261124155409euoutp0115dd4b784b83c26480159369f887c045~rBijgrkOC1661616616euoutp01h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795535649;
	bh=L4+kx50Yc4T0yCDoRUpYz1zoQnaZm52p9pwh+JogV7M=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=qNqW2onGKL1h7vqNJ3xTyk4JV+Dq96xMAq2etjAdwUPfT9cXwCz1Sb/sx7UCdLDtq
	 AMqVT3qI/UwTPIDbNXgLDImJxYz7sozYO25znwVVR97V6F7t9+/vj+7q8T7hPlazny
	 PXznFfi6ziuSKCCrmuYn8AkQ/bOvKlUkcdkIoXO8=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261124155408eucas1p205755e13b741cc44224d944e46575e28~rBijL-s3h0317003170eucas1p2G;
	Tue, 24 Nov 2026 15:54:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261124155406eusmtip17e07464be1acaa26cdc0aa668b45efa9~rBihiVo470174001740eusmtip1T;
	Tue, 24 Nov 2026 15:54:06 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Tue, 24 Nov 2026 16:52:41 +0100
Subject: [PATCH v8 05/18] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261124-jh7110-clean-send-v8-5-de92635dd857@samsung.com>
In-Reply-To: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Robert Foss
	<rfoss@kernel.org>,  Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Philipp Zabel
	<p.zabel@pengutronix.de>,  Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>, Heiko Stuebner <heiko@sntech.de>,  Paul
	Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Andy Yan <andyshrk@163.com>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Yakir Yang
	<kuankuan.y@gmail.com>,  Dmitry Baryshkov
	<dmitry.baryshkov@oss.qualcomm.com>,  Michal Wilczynski
	<m.wilczynski@samsung.com>,  Conor Dooley <conor@kernel.org>, William Qiu
	<william.qiu@starfivetech.com>,  Xingyu Wu <xingyu.wu@starfivetech.com>,
	Sandy Huang <hjc@rock-chips.com>,  Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1209;
	i=m.wilczynski@samsung.com; h=from:subject:message-id;
	bh=Chyv4ZadRgB9O0cDMv2nCKKdOMuhURVPdmM716Hfnu4=;
	b=owGbwMvMwCGWumv6zndzRCIZT6slMWSzbhZVTree6Ct9QLaGcZ/ORd5VO7U3zL72zG9t+Cb/q
	o87/LU/dZSyMIhxMMiKKbKc3RhtJPmP4Wn58ce/YOawMoEMYeDiFICJNNQzMiyvu1Y1+f7KC4tK
	MwyUc756XdLduzlZS8/B5rxs4LqLvxoY/go2b734OtzymNOcE5U/dtvsCZOu//q4Qm42x8dvd34
	3GPEAAA==
X-Developer-Key: i=m.wilczynski@samsung.com; a=openpgp;
	fpr=CDB15B3219FE00E577C7E3FA65BA97B9EE9C1459
X-CMS-MailID: 20261124155408eucas1p205755e13b741cc44224d944e46575e28
X-Msg-Generator: CA
X-RootMTR: 20261124155408eucas1p205755e13b741cc44224d944e46575e28
X-EPHeader: CA
X-CMS-RootMailID: 20261124155408eucas1p205755e13b741cc44224d944e46575e28
References: <20261124-jh7110-clean-send-v8-0-de92635dd857@samsung.com>
	<CGME20261124155408eucas1p205755e13b741cc44224d944e46575e28@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_075411_316603_2D87E34B 
X-CRM114-Status: GOOD (  10.13  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Joshua Peisach <jpeisach@ubuntu.com>, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Chaoyi Chen <chaoyi.chen@rock-chips.com>, Maud Spierings <maud_spierings@murena.io>, linux-rockchip@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, Graham Markall <hello@big-grey.co.uk>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The video output subsystem has its own system controller, documented as
dom_vout_syscon. Among other things it holds the mux that selects which
DC8200 output drives the HDMI transmitter, so the HDMI controller needs
to reach it.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
index 0039319e91fe6e6aadc4300114626348e4dfb7ce..cf9b657d0e8a3ed5c5688336fee4123e14a2ac58 100644
--- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
+++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
@@ -24,6 +24,7 @@ properties:
           - enum:
               - starfive,jh7110-aon-syscon
               - starfive,jh7110-stg-syscon
+              - starfive,jh7110-vout-syscon
           - const: syscon
 
   reg:

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
