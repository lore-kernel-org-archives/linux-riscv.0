Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94349C48BF6
	for <linux-riscv@archiver.kernel.org>; Sun,  3 Mar 2024 13:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ForLPrDeWzfd3z8RcWtdLf+MRL9XT4eJF87dp1EqVNA=; b=mzQ/e++Ok1K8cY
	hoxoy/9sqIKo57bmbBFW0hbBwTZ3k9DzGyA+xbo2ww41gFccjhVXXo3AYQeL/vgxlIAoSYv8As5I9
	aoY/Kupe75+AzOa9kKl9Iq7o74rYqcVBGwhtboRJomP0bX5CEezUlSR/UYfOV9Gs7itt0iDRf5xr/
	mUZadbmdm5gqf1v/gkcVqx84WeQxEliyyD4SkESIsWXgKWjPF3F1P5NUivfo9LUXKn5PtTlqTcJ4Y
	h0ZgNftvPYoescRqt/ZP8PyvladzSTjbiX3Kj2zjvmN1PkA9GUk+XuTudri63rCf6ajT5eKevKyKc
	d11pnPINPcuw5SL2tgGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rglsA-00000005xwR-04bc;
	Sun, 03 Mar 2024 13:27:22 +0000
Received: from out203-205-251-60.mail.qq.com ([203.205.251.60])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rgls5-00000005xuT-1NXC
	for linux-riscv@lists.infradead.org;
	Sun, 03 Mar 2024 13:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709472431; bh=i8Bxkmf2drHM5vNPWa5iX+GHyc2vunjy4ejEFG4DAMI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O5ImmSGw49BZHMe1ELU4Gdp7IOsDCovZ8nrQUKN2ux+dQQd6NOTtUn0nUQ1t++cuG
	 P5CwCjpPPkELDY2FgEqz26Aosh95uXeAyc4fxMsLzr5Qq8w/WGg89ERhoIYnpwRcfU
	 LGDhlPK9Uj9RXFItzBfP5E3dimOZpiFloQkcrdkg=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 6C4A707D; Sun, 03 Mar 2024 21:27:04 +0800
X-QQ-mid: xmsmtpt1709472428tcvk4o5e0
Message-ID: <tencent_D5188EA5B85A31AC21588DBD7C7482ACDA08@qq.com>
X-QQ-XMAILINFO: M4wVjRC01ue0+G33WpsO1cBFfVWuRqPaxKy/FWVo5X9yBGqFkDQrfnMOHC/Tz2
	 U56uBIQiZvr1QKE/j7s2Q2sbpsN9KtmeRCeU5jEIeN3FsFUhMUnYBUXSKYMg7WyIPMBiiQ1z3Dv5
	 lZypDLwRGAou+VtVO355nzWHjEfE1IV48aeVVSidHESKxbzt4FYb15QtZm8eUy1tN8wAgBpiR1ey
	 IyBoOITnA2HWIdnEcPw3TUh4BcJF3VGM5gHBMNYRWOaNf9QrbsuA7CbZRa9TPZV3G267Mti/nmE8
	 US2NUmCbAVS46Lp1FVbMIosZy4xulbc/3WH1UPIs+igrDHrIJiwIGXD6H1RGpJV2CIhbe2civi/R
	 tJgVSEUz+j9RBuogd95PQDGHskqPoBrrSBRZeDm8E2psrFOy4jSZ5IVjqzTU4n6WPYZxqr9flqFO
	 strx2E8Vr6BdP1w3mqKh/jV1ph/aRtbsm7tnM6KS7z1p8sDIp00yH87d9KjTP5/a2v44Nu3Umct2
	 1gUbgLjoZf6dBFjIzA3FPF2A+dRXuOKae5xr9rM2prsYF3xugxdNOORdCmF+6+US0e09GitZl7Cg
	 6UDqs/BDbVtYBTPvDlLRSlWOfoQdHfeiJDfG/iNXjpHUW3A9i5Md/lfh+QnhnQSZ7ms/xp1HJ+69
	 bbAoOXuxOX1cBNs1uhMOITgmLCgTfN195AFdleqDYZj5Qnvw/17mOiXXCtKiq5CkbODcZ+xzZ1pY
	 pIZb7E9fcj2XAwhv4KZQ1nGXdnA0ndLqktaT2gpLlyVQgWDAJeTddC7rTUCuvUPtRK1kIF8IoMwX
	 ZsduIJvNrgYZzqK7YAETEHh/yboDYms36P1zXl+GKIZ7/vLc9H1cfqNwRloOk6P7mhgSSu8fjk3w
	 BnBSFDJKT8pRgHIQk8v0foOEbcoNy5ZY8lBRgJQ7dHIG6AsRHJZuHHUh0Ftw6dLfub0BqC/w5c7m
	 aStITdTwbH2WtICxRjHkoAuJ0Y2FvYveheIbQt6EoNl/L6y8yKZkq7YNPJxV5+hQux0tcbovk73p
	 VJdFa0Gyk5TYu/i4Is
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH 2/5] dt-bindings: add Canaan K230 boards compatible strings
Date: Sun,  3 Mar 2024 21:26:24 +0800
X-OQ-MSGID: <20240303132627.553698-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240303_052718_212799_C24DF49C 
X-CRM114-Status: UNSURE (   9.92  )
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

Since K230 was released, K210 is no longer the only SoC in the Kendryte
series, so remove the K210 string from the description. Also, add two
boards based on k230 to compatible strings to allow them to be used in the
dt.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..444758db964e 100644
--- a/Documentation/devicetree/bindings/riscv/canaan.yaml
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -10,7 +10,7 @@ maintainers:
   - Damien Le Moal <dlemoal@kernel.org>
 
 description:
-  Canaan Kendryte K210 SoC-based boards
+  Canaan Kendryte SoC-based boards
 
 properties:
   $nodename:
@@ -42,6 +42,17 @@ properties:
       - items:
           - const: canaan,kendryte-k210
 
+      - items:
+          - const: canaan,k230-usip-lp3-evb
+          - const: canaan,kendryte-k230
+
+      - items:
+          - const: canaan,canmv-k230
+          - const: canaan,kendryte-k230
+
+      - items:
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
