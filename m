Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AE0E77372
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 12:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Q2C5dX9yiUkMFoVk3mZhIasGQjZ8eOdiyuw/qABDl0=; b=lKLRBLX1gkDGLw
	OVt9HigVeYT5KsfPMkgNs4Yt8MH1AgxXySE89C2niCRdws96h5D9H8BvYHo+hSyae5Sv4nXY3owmm
	i2h2+AkbgSGgY/rEEPva5HUh/+K/Z+/aDG0zE6qV7N2kSdIZ897zhW2u3FmpCNY6W9Q+da+uQSWI2
	pw5PRQBHVTju6yb6QyYVpt1P18LfXnRl8FrLqhSFlw5InrJRUkNZD6jiTH78HabBzj9vzKvfFtVDn
	XTaBIML0BPeohzDKOwlutiQLiRox56wWGUaPeOMfu5/DuIpLXVhiTgpZp66N/Plna0vGUCc9gRw+G
	d2KDVpKh7GD62elG9+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZSC-009XR5-1E;
	Sat, 30 Sep 2023 12:52:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZS8-009XMI-0j
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 12:52:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 12113CE1171;
	Sat, 30 Sep 2023 12:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9D39C433CD;
	Sat, 30 Sep 2023 12:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696078324;
	bh=0cXR+wjSxc3y0eRPOSPa5epHEc/W4j4DDvL7tCSFcHw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=REmv6J/ExFC/eGAjHAiMAIVg67CrBH31GFPnanZkKftD5wWdukAWx+UAjV0OtHQu1
	 rXunINX7W15Rzcb5lR+QRcBRZ7pcFbZctii84zTu6GjrTZUu594QrJ2moVSBSnCc37
	 my9zZcN2LSVReCLhxC4eMY6hvKC5kqRh1Tg/i36anJCfBggWdN/nAz+JvHgW2DX0w0
	 njgOMh7nPiXoXJvHM/nAoEo0LpXBNuwgPLyS9+/9Pt1EiB2zuSkRPLi3urIEGkmO2m
	 v+/50sD4iWUUyYGoRhAV6SwO7b3tpI4ZEAwrJmvuzH8KdgEW0rksWCxxxmIg2/0yyf
	 r1VWlOi8eXAaQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: [PATCH 3/5] dt-bindings: riscv: Add Milk-V Duo board compatibles
Date: Sat, 30 Sep 2023 20:39:35 +0800
Message-Id: <20230930123937.1551-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230930123937.1551-1-jszhang@kernel.org>
References: <20230930123937.1551-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_055212_444019_FCC16A61 
X-CRM114-Status: UNSURE (   8.07  )
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

Document the compatible strings for the Milk-V Duo board[1] which uses
the SOPHGO CV1800B SoC[2].

Link: https://milkv.io/duo [1]
Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 4e8fd3c6a6ff..6db241c9d00c 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - milkv,duo
+          - const: sophgo,cv1800b
       - items:
           - enum:
               - milkv,pioneer
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
