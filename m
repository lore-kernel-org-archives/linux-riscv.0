Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC24C5478C
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 15:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KkeOZhXx6hmSFH2x851bv6xvLSyPSgq3t99poSnGNPw=; b=K+jpFchl5f99p6
	Y9+2W2m7bgYjtsjTSHF+as1zNVe1Zw8t/BobxnHWMgINvNvAQrFrjR6m3j8FLidFNgeL26o6t+NMV
	HDJKY1HWOZChCA84ccePnrlQf6IL4eNwy4YHGCbziVv/YOfOtVHdwSfqOUZbJafwYKnwxg6sT+Tlk
	8NFI5SXPP3hCH1KngEsyFhOmLKfKLSLuQx0GVJHDLkK0S2xvowZaPgq6TJFPXm0B5mBlVBUVY+7qT
	tRa5buWEWMCSsnPLMKc39JB5dqEiGLytc+Iz/TXU8x2dXsNu2lXdmYVfbl3hFaZesgcxaaXM/IBS1
	fpikK3ZQTKW2exJDlu1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3n-00000009XIy-3fFx;
	Mon, 04 Mar 2024 15:16:59 +0000
Received: from out203-205-221-192.mail.qq.com ([203.205.221.192])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhA3e-00000009XBT-2jzn
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 15:16:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709565405; bh=QCJNzCmklfQ5NgNTmfCMQlcAPni2vZ8VItHC2T73jcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ZopN0P2UfwiSVQdqXOystS1rlm7GgMbuVJ1XdgrsIc9sCzVDJ/PjshZ5hZ1ipVr//
	 rVuqfdVzMfFisIzr4W6h2HtEtPdPIEjqebCvyEtR8uFiydWi08VxCpJNbCTIj7TFe6
	 UVqMOCYYRKxRqrg5s/zGBjJYbIA1N99Q+QTgTLPA=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 42726AAD; Mon, 04 Mar 2024 23:16:39 +0800
X-QQ-mid: xmsmtpt1709565402t1mhl1zai
Message-ID: <tencent_1DF18DF87C3E8281DA758E55B82831AD2108@qq.com>
X-QQ-XMAILINFO: MB5+LsFw85No+fsVuxhrDBql3W1UvGQ7Qv5D8q4s73qVKZ4qGKfodgjOikGJh+
	 F9YqSkX5fQPcm8/c6VyllKAcvCCZxmJTQdiMDhj//C8hZM1dd2O9gyyzK31uvCtmNo2A09Xx5Yzm
	 eNDPyyep4R4r1c+aDBoT8DJBMFCisvtHfFgzVHv7tly0J0rXOCd0/uqKN60O9cNZROD2dwic8+pp
	 t6Kc8+kzl8n030JmczW81szdQQNT9wS6Z6QgeW0MtDIofa4A45JXSmZNxPpap7qhQvVIMts7MVKE
	 FAk6M8PLaM4JDh1jf0nAh9D7fXZ9kC+L7AePrN95G50dVeP+7J956qCbdYysK0Nowj6+Byt3arxN
	 A50Bi3yfH3FD4VOHgSdjLziPcFYiLFptMJyXRzhWFNLlfjgwKGapgeiac2TpcCgtBySzzRcehepL
	 4qHhpAQ7UPhgu4QLyQPiEPN2hF0Wis1tVgc27zwDAv1J9lY4kh3ChLFaug5jtrXj1CKUnDUTNhk/
	 VALbq5xXut53jJhuDo8vgK0LwR28FGRHIUWjjCFwwPatxXSzUBkbb6GIpjTbRO5+D3kulTCEIbCK
	 mBUMjzbNTvAnWTcvE12N1gHrQIJ6NkZreSe3zmO7b8ZUJRKBEAM0LcIa5wWseQUO5Fu44x2a9hhl
	 21CuNmQ7uZLwDA5RYuAy1Ziw9/W2gHU4woZ3QT9pKd4aLu5HzsErs+uJuo1EKl+fjsgOT2EfXxQH
	 lq7S9Wqc2ZYMZO211bJis17odpggPKDUjQS6tnLwZEy8OX7Yar1r/sD7MZCY9XDwj1kHnXFYikvE
	 +6RlACioxjttm9TCiCc37EIuAvLoXIukKyGZcdGVk/8lqCl9obhdZuPN0dmegbr+G7Kxj/DD6hO/
	 4OFlkRXAliQ6/VtbjIg3E5enggsm6RIuK59Pjq0+/n3G3z24R4ByBLtohFS/+b4XcySFynsjuJK9
	 PTPC+HIaeSsL+9jQjASfOr+KX+vSDki+SipDqeGzf2aP2T9itPl+CuuZPRImxyIuZPkJj7t0/NqC
	 u3PjXi/QMNQOojx3MzaGlusomeygNb2OaSf4ku1VtvEGjKsyBdMad7rYDD0PpciFqdSrWcFLnq0l
	 J9L5s6
X-QQ-XMRINFO: MSVp+SPm3vtS1Vd6Y4Mggwc=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v2 2/7] dt-bindings: add Canaan K230 boards compatible strings
Date: Mon,  4 Mar 2024 23:16:21 +0800
X-OQ-MSGID: <20240304151626.759150-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
References: <tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_071651_281301_1AC4BAE5 
X-CRM114-Status: GOOD (  10.09  )
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

Since K230 was released, K210 is no longer the only SoC in the Kendryte
series, so remove the K210 string from the description. Also, add two
boards based on k230 to compatible strings to allow them to be used in the
dt.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..12a78bc95992 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Damien Le Moal <dlemoal@kernel.org>
 
 description:
-  Canaan Kendryte K210 SoC-based boards
+  Canaan Kendryte SoC-based boards
 
 properties:
   $nodename:
@@ -42,6 +42,12 @@ properties:
       - items:
           - const: canaan,kendryte-k210
 
+      - items:
+          - enum:
+              - canaan,k230-usip-lp3-evb
+              - canaan,canmv-k230
+          - const: canaan,kendryte-k230
+
 additionalProperties: true
 
 ...
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
