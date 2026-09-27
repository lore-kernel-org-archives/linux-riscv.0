Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA40C9833E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 02:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3s8vxw6U7FBCyL7KYbz2UlUPK7e9tekYGVSgW98H5VY=; b=Gj9MfPYn0YQzie
	jicKe2GMDRmsDXtIC+JcziuH+8cF6wuy7DEBoKLyZhoPH7dlmnXsjjAkZrTM0TXgMSsslREG/6C6S
	AxV0AsR9dMu4ghV9tUT828dXUBX3pREHr5dfjkfyvnbmSI7NG+pisUU6bE5vGG96q9aneImMrcre7
	QPz/tnEAJFrBQYoXCWgRufTOvWU8ie2LkI4DgBuknH78uYgEJ63VDB/OOhAxk/ecNA1uuWcxRzI1/
	TqY36p2sjPgXPvCP6VjhGOk1AXVrvHSU8djuHEjA+peSGP4+ENLN4POUmLzUKv5rVtXKIfDSLTomO
	CIOmgdKn/dnMkcne3ZXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4V-0000000Fxbo-2A1C;
	Sun, 27 Sep 2026 02:56:59 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAf4K-0000000FxVw-0tb0
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 02:56:49 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df4aa80a73so11348595ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=embeddedlinux.blog; s=google; t=1790477807; x=1791082607; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=odWue2yHt99HR3pvG2aKLP98lwM+LnRQXQEpVj7myQE8FWN5ZRuhGLkowP+gHa8H/X
         +UvUQ00hkJi7GmodKAs03TUYg2lqaFzCk+Z+uK024StOCJGlxcz7QyTNoMS5+EbD2Ual
         8OkUauehk8camq7SHNTOdc+s++h1pptIJ5o0H1kHdqeNl3JZbzM+9yGGe+fk/TMohAnb
         3oFMSXPuD7Qv1wvY6PAyl0miBjKSDdla75IF8z+HB1+M/pl9hSo9GQSrlqo8pfP9C23J
         D3lDT7zwlevs5dIbptsi0fE+Tc2tbYgzN4CxRfpNomRETv4Hwxd1CGNZQc4ImFYH/Cy9
         3Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477807; x=1791082607;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W0OAcRU9c9mu0nqvpBUc1aIVBrp3XjCBrBUSr/EQyOo=;
        b=t2bql6MkYTgSP2O60R0oyu+JB9LRJb838IyvKkVMFstRykKwcdm7xxGg6RlICRSezx
         4QM6r5hcaqGgFE/bGPf7RaLs1eNuF8LvmSKtvbaoujReWgtOq3PlH0DHMbriudF8yAyT
         abFXI+3C/4nerwvrRo9xdqmwKMZcYWoPi/M53/BZPKR7uleMhYCVCukfS2nmWR0cK5xA
         pgqeG3tW+/+BeilTZSi9VoKX26g/t69yR3yfoJFtTONy7ze5mbDuUn7F96sGHXPEMh96
         JwdcLla+Vln7kRiotG1T9II5hTRw1mWZyLstwPQh3FylMTrPAj1kI13/p8tQPFkAvVF8
         6bfw==
X-Forwarded-Encrypted: i=1; AKwUvBxKHK2Bveq2TZK6Dx1ZYIL+UefWg5zKhDbTffe6Rjaude4ERC+jrS3HpYraBG0lgCQPiBstTxhbJiCIbQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYInln7ZNBWFaWsv17/l6MtIZmqdOJjj6p3kJqa8GvYk0cPiwmr2
	nCJmGlcI0luhDNotPEn0/k50C7CdElf4UUXeTiEDTw85wtYgL9sxQc1MOJIA4XaEw9rG
X-Gm-Gg: AYBFou05pMMLiuX1W+4Jzhqa4zxaqKi0EbyX+4GlDsWfRUHzBn0FUd/XnhO5xSPuDal
	aUM+xxj81dUaKaaAeBf3U9setjfOPoJ5q7igc+TRSUYVL7FhOrF6NBdo+EVHfDQguDgKzVHcgxV
	HoLsmGvCVe8llnMlLoGgfgm+eGisQk9vyeuzVVdwHif6pEJSsTtfPEpspT06Zf2F3ZrQOH6Uhzn
	dlYukev0dGaGGFv5cOGJIjPDKH/QxJ0oi3Wa/MVuj0EjsSMlJD41KxZi45H7ohgxGH2oNZBYBC1
	b/SPSS8LAcwsfeKeHdQGEtDiBQWJ8eA45LtgtiONtexRkU8eqJL7hXwdrVhOat1K/EzOF4LfIq4
	5EG+ZwNyym5rK1D9seVilEzyugGVaQ55LCKk5eQshIP/o8MEIlHR+42ImlsocJCUKS7iA4Ng8KR
	496YETJFWnXlZEEisksQqlYANYwwZOq3nrsng/iHvaIWTyVQif8mT318u9EjSkOHRf+g==
X-Received: by 2002:a17:903:228c:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df7dc41d3cmr92788095ad.26.1790477807346;
        Sat, 26 Sep 2026 19:56:47 -0700 (PDT)
Received: from ltu.. ([171.245.4.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df9142bfd4sm25512285ad.52.2026.09.26.19.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:56:46 -0700 (PDT)
From: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	Bjorn Andersson <andersson@kernel.org>
Cc: Baolin Wang <baolin.wang@linux.alibaba.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Andre Przywara <andre.przywara@arm.com>,
	Bastian Germann <bage@debian.org>,
	linux-remoteproc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	tien.nguyenminh@embeddedlinux.blog
Subject: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add compatible for Allwinner D1
Date: Sun, 27 Sep 2026 09:56:25 +0700
Message-Id: <20260927025626.69614-3-tien.nguyenminh@embeddedlinux.blog>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_195648_323927_0240D767 
X-CRM114-Status: UNSURE (   9.18  )
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

The D1 and T113 have a hardware spinlock with the register layout the
sun6i driver handles. Add a compatible for it, with the A31 one as
fallback.

Signed-off-by: Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>
---
 .../bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml    | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
index 584cce3211..13f9a20ae1 100644
--- a/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
+++ b/Documentation/devicetree/bindings/hwlock/allwinner,sun6i-a31-hwspinlock.yaml
@@ -15,7 +15,12 @@ description:
 
 properties:
   compatible:
-    const: allwinner,sun6i-a31-hwspinlock
+    oneOf:
+      - const: allwinner,sun6i-a31-hwspinlock
+      - items:
+          - enum:
+              - allwinner,sun20i-d1-hwspinlock
+          - const: allwinner,sun6i-a31-hwspinlock
 
   reg:
     maxItems: 1
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
