Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDDBCAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 04:17:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2GA+JpQG+4So+o/RKV0yQ3CungPtQ2SRItWlo+NQVho=; b=Jtqpjb3IQA31Eo
	g2KSv3o/RY26WbLPg+e4KdcblDIUeulCvQys7iu5c/5i9Z1ORf214ywxXHrSpxMdM7uJKN3FLy4P1
	0msyILx8h7kk6CV22ZnigJOHb27G3otgGNn+AQ5Y4Lpd6eHSq+Rpip3BRvp2SxHpYktW5lsbOLIIy
	I137ZrGJ9zLZyfcv6kl30WjnRRwFHFPqzfsxUUZE8jaGiuko2IVA1DuXK4DLCTSEZcAiRSVwEN8A+
	gmMMU1IyykeLyKkr/8sGOX+rVKToecLl05Tl7Bcc37vt/t8Fo04WvSljr7DcTCJ+szvnKsqS9xDIz
	vz+rgu1w1Dnwwg2y99Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ir3-0000000Dqfv-3a0G;
	Sun, 28 Sep 2025 04:17:45 +0000
Received: from out-189.mta0.migadu.com ([2001:41d0:1004:224b::bd])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2ir1-0000000DqdM-2DFP
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 04:17:45 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1759033060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7hnJ9V2+O/9JNd2svkagPx03LH+xVK8zdgO2LOELRXw=;
	b=wxArW5BHqHrxBGaM19jgFpgoUBXnZ+ZDkD1PecV0WVtZhck6LzBCfqGvmv03vk2YBaneKs
	j3OrYbCoB7CNX+Mq4wNzGukhqvGNRyu3IBzdXfF2ixCFhi7+KmgbXNCajnCxgeoMnFZ6Ep
	YG/5Xn2i073rUlLgbTuHXko1AMhXehM=
From: Troy Mitchell <troy.mitchell@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: riscv: spacemit: Add MusePi Pro board
Date: Sun, 28 Sep 2025 12:16:48 +0800
Message-ID: <20250928-k1-musepi-pro-dts-v1-1-5efcca0ce3ae@linux.spacemit.com>
In-Reply-To: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759032880; l=1047; i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id; bh=Xa406oxoTdde1q8R1dFXjFrJavfAJIsCzaruS6XW7Pk=; b=v7YS7SlCqtK95zADSi3ZhQBZX8b7uh2sBKjUxosZ8j8HR4AfRgvrSaKGia287z5Mgn8AvBu/i I3kQzd2ZF5JCX2w0hGBHP0pRfcGmlRti4+l3Ce2qqdBRVEA0ytAKhza
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519; pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250927_211743_714172_D8006F19 
X-CRM114-Status: UNSURE (   6.78  )
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

From: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Document the compatible string for the MusePi Pro [1].
It is a 1.8-inch single board computer based on the
SpacemiT K1/M1 RISC-V SoC [2].

Link:
https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf
[1]
https://www.spacemit.com/en/key-stone-k1 [2]

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index c56b62a6299ac24d3cdef7edcdfc407dc62a1846..52fe39296031f21d1c28c4f1ea5ca9fe28caf45a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -22,6 +22,7 @@ properties:
           - enum:
               - bananapi,bpi-f3
               - milkv,jupiter
+              - spacemit,musepi-pro
               - xunlong,orangepi-rv2
           - const: spacemit,k1
 

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
