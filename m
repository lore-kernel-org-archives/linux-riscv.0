Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A244FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  2 May 2022 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q27DGyZsN3LBcaQIzX7ng9aMb/SLq0a3Sz3DZdE8Ec0=; b=R1/PirbIGlHKe0
	5ey8ceoJfo7uB5MZvqfyX5C8Cd70ysLS6n5n3NgK3WFkDnGiQOlCmSoWD7iKO+m676h9IkEcaqCJd
	+0WVSKjyNjMm+kAvQs6T3V3RLOn1Eg6BrujyYE69vTE3ojgXy3+U1u7EoihJTibhS5D2uOf1C9BVA
	ZwxA7CSQelX0iO9EnK8or3OSFZYovbOIaD18T8QHHUhnTNEnVN3pnVg6h3/5FEmapuSBY+WPhb7p+
	An+0yne9R2c0cZyo3TVobXSeYLblGxgqYYcFaCvLsl5EyApbR31gi0AIhTRVOPPqqftfCYrvVAHRd
	JFApmEGQKFvawK3IeWGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlVVQ-001Aw2-HK; Mon, 02 May 2022 12:50:24 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlVVN-001AvM-Ol
 for linux-riscv@lists.infradead.org; Mon, 02 May 2022 12:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1651495821; x=1683031821;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=U7ic/RNoQY4d0W/UOAxEPCaLfnfBqlR3LVnngKZ9Uio=;
 b=BwXxM4DhyElN6KsLx7Te0DKqDwTP+ycYa4MZgEIpYcGY3Ao8vyu1h2lL
 NiGx0MvPCLmpYXgJddJ9Ib3xA/YpFwro/FXlL02lFN+ImAklcFRZdlfAf
 q2J762jUHlicshGV1zzvid30mESQczdDkeMmuKO4hti/Adi+GeSBT+YBM
 Za1F7pHMVa2s+1/jdoaOYHefnBLy6ibQ88KIsQ+Nh0M8PfTzfr8XiDngO
 HnJeBMZe+ReJQ3nCWFh5yr+PgXUMxKZife+6pkgtf2VfcS+tLKF+R3mTg
 2QGBqdRWIE0R6wqNcgfE8biiM8eQTUBV9niigbyWOF4MMC5X1wkoQdnUn g==;
X-IronPort-AV: E=Sophos;i="5.91,192,1647273600"; d="scan'208";a="303547575"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 02 May 2022 20:50:20 +0800
IronPort-SDR: GY+Mf2Ce6m+bV79bS+iXst9JWcjvT8AQbl4KyGVcyZb44D7vg/cvQ7ga2kTOtCzOAvJdSO2944
 jJ1nkzNVp/4ZW66icf4HaDGk097+6xXeCSqZGuNvGiUKypVMcj1gAYVaLQfX6gqWRcBxRGIqow
 atH7VNHGVRvhke8uOowA+30sn2Ypi2SE847NinpVMXJ/bwPsNbFLv9sE4pcIN2OmvJuxuQunxw
 MpcghmzNHAunUYiF+OQqJ4RG8jyfM/JE12qhiH7hmovAWZla9dafKoUjXpTOCmfouTEOHDn7tl
 usiW6J4lj5U2i78JQSPWBqr7
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 02 May 2022 05:20:25 -0700
IronPort-SDR: MwkCDZ9gDyn+1jyd5PTxjWBSvx5Bev0XnzApQ2tsiAAd/0x5+jWR10pFiQdnRkoru1q/vF7LAL
 cZaL+VDP7rx208jPcxGF3XPbYg8ffszXsQD5HtoUC5O9973lPx1JKwMNLlKBtCc2AuP55s18gI
 J6X9xxyo1KEFbWikElQR9jjse8rCtHSdimcDXJRMepdClr5PFZUmRl0RJuCvWUeukafo1JV+zx
 IjpkbdJRVV0Q1YH5c6dbdEMH3UuAXVAuwX1WM7Bsr1UsYWHWT6AYZ6PrB6QlMqceHc0nQETNrP
 8pE=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.66])
 by uls-op-cesaip02.wdc.com with ESMTP; 02 May 2022 05:50:19 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Niklas Cassel <niklas.cassel@wdc.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/2] riscv mmu-type minor fixes
Date: Mon,  2 May 2022 14:50:12 +0200
Message-Id: <20220502125015.1345312-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_055021_986147_3DE40110 
X-CRM114-Status: UNSURE (   8.98  )
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

Hello there,


Here are some minor riscv mmu-type related fixes.

The first patch simply adds "riscv,sv57" to the list of valid mmu-type
values.

The second patch fixes the "mmu:" print in /proc/cpuinfo on nommu systems.

Please review.


Kind regards,
Niklas

Changes since v1:
-Picked up tag from Rob Herring on patch 1/1.
-Send both patches as a series, since they are relate to mmu-type.

Niklas Cassel (2):
  dt-bindings: riscv: Add mmu-type riscv,sv57
  riscv: Don't output a bogus mmu-type on a no MMU kernel

 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 arch/riscv/kernel/cpu.c                           | 4 ++++
 2 files changed, 5 insertions(+)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
