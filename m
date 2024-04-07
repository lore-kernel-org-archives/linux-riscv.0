Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A6DCD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UPv5m3XyljSPrl/rYZvfvLGkOiWcHq6oqXSyM1Zr7gQ=; b=uGHvEoCtVOeVOc
	ScUb0m24vdX8gX5xbKQNWvIAxwBIN+oDSCEXd+xgMTyqNS1YRneog3N5pfqem6FK/uHdmxSWLF6fj
	0mg4YHKmog9YYR79kCJ+5VguaOThu/o6fq0cL9BIh+B0K7Jlrj/U8000VPbPSd0rAPRx0OC29NLnj
	DjF6+l0DERawSfbVm12bHcq/FF6oILVRpHJM5sX/eDIdNDrBhhJyz9eU3CduulKn7yRhUODeI4id9
	KzIOsTsY9pQclDxhk0sqQio8pqsolJysLPqmm5npXZoAIlwyy6dbLw4Sw0DPYB7G1EmYt0lDfJwsT
	3CA03igNsOAUath7T0dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVO3-0000000D0sA-17Bt;
	Sun, 07 Apr 2024 16:28:55 +0000
Received: from out203-205-221-240.mail.qq.com ([203.205.221.240])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVNz-0000000D0qn-1bCY
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712507328; bh=jaM56XVEDkeOpfko2CLF+2oPCWKBzRPYG5Ofw5dlTQI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R71tx7P3W14n1lVLZeFpCtH8wDu6JTyR2MdqplBbCuzv1+tw6aEsdNJ4nxqRNN4dp
	 ibWDIVHnyiDxGSdt+qIYHvhyGlKPFinfIX6GAEsSo5u23LgXbeHMaEcsikJwrbFQ0K
	 EE7ZNTGOT7rR04oAXhEp/+O5hgQ06w0LFIc3ozio=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 726A94B5; Mon, 08 Apr 2024 00:28:38 +0800
X-QQ-mid: xmsmtpt1712507325t5ks6qhnw
Message-ID: <tencent_9DD48D047C4682BDDA948EA4B82931992108@qq.com>
X-QQ-XMAILINFO: Nfm/+M6ONQ57Qt6yN5iF/TBLIB1w+PKYNvuvJze4N61HwImZaNRggBtEY+Ezus
	 nfpnHx8vStyMYeCQTLPsWIg2ZqUekXYZouaoaAgpNrgZmVL7QkrxFLbPO6zCjIxndt2uu/6fpoX6
	 moVNFQ4y0syjixv/Vw7bLkQ37JsCiUnkLR5ctAFbKW3sFWl8ggstiMtonysk16NBwBHfjGOD6a0g
	 HYh5Qx5s7HloVh6OVQAkv5SQrcBDQJgXh3YLwYycs4WSX5O26acyqt+ujah5zKyevNUKUrPKc9X7
	 921Nlvofo8Mif8VYUZag2c9qP1fqaCXw4elRbtonmwKW1qmxsa2KIBQhQqPVIhDFR9BkQQYpPWMu
	 ndKTnJvfwWEEl+M19kOf6U92k3WydrSfImK1FPGEyCfpII5FVYs23NGatFLl1sbVYilTrNMuSMPH
	 DDBvMUUJMy8S6YqfNMaKmKTw+bhlnMAE1L+A37ABZ/0XOFFPkTTjsPJSjJIzpTz547R2iG+TgI3e
	 qndClDSE6uO32nnX6ulYf9Sa2cidblGGWXRpWboq+Rk0m8hmtHCwJwAwolGMWnrPiWGhPOKr9cwy
	 8uUXZ5mM8tOQ7xDjjXvN3Q5eYiUN+daFfH34R5isCmxM5EiDWnxtmfwFpHml7eeTozvL7RXE5iMb
	 HiRIPgtzyVdgNn0xpbv4pYAYkL12Kg06fzZbC7OWoO1CPKNKB0dGEOfSzKyVeamaBN1V5l5z3320
	 G143C1VRor+nKRfdLhYagZieXsnFv9SRce+sKLRPdeftGgGrueuSLWZOIl974VW8Qac85J+S391S
	 Re6uRQBSrUgtCY8n0jBtz1Ote6pAC3tTB6o9Kw2+Sk5G6HRPml9cM9kcJOhUcRL1H2IjsDGUCyFD
	 rjEIXT6kNWOF6rwx21EXRDUqIBCJP4amPzXnT9rK26Op7JHm6OjhVQbMFoF8rvpz8xSchC6MwA7T
	 5tzNUpTmg0jAVLxYv382KjXR35Vr+EV9njfJFPgfJrUvBgWLwYmZeodCbu8t8ZLe8DJz08YLMU9l
	 zhuewI9plCYqhHFSqNuMb1mfu0YwhON7EJhUXXuw==
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v8 4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
Date: Mon,  8 Apr 2024 00:28:33 +0800
X-OQ-MSGID: <20240407162835.3199788-4-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_092851_778630_0014FACD 
X-CRM114-Status: UNSURE (   6.83  )
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

Add compatible string for Canaan K230 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..122f9b7b3f52 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - canaan,k230-plic
               - sophgo,cv1800b-plic
               - sophgo,cv1812h-plic
               - sophgo,sg2042-plic
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
