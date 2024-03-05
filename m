Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E8A4C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:39:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfXAcabfZlKVKjrPxhvy258YNXoddtXPGIU83RRam4M=; b=34OyIF9PS7H9Um
	DeV1Lu44wcMPoVqFPuNQ3P2YnpWjsVxT9Q3q0nOU5vwM1CDfd2ezS/CbB72DMoEF9Rd0fOIs7Zkom
	nfNww7NvcyUQZX6giN+oYjIYgHBoWaUheyA2clgI2V7Ht4Z8om34lBM1uAboaKc/2ik49Ctq8Qelm
	9ykWWyzhiv5mrP3iglHXIqm4AIxQgrcX+I0V4RVRUjEyOdBti5c3SdQp3oAK5BHUjHsKkt8TVq1YT
	1IxGkoZnTFhbAa4wJkRx3osx/Vf4Mu/RBl5xqZ3zvMm4Qp6TUl5wY0AwVRRWO7z3dm9nNqwlMttxk
	DkU+N7s1SQco4u/zp5yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhadE-0000000F2V1-2MLi;
	Tue, 05 Mar 2024 19:39:20 +0000
Received: from out203-205-221-149.mail.qq.com ([203.205.221.149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhad8-0000000F2Oj-2SsY
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709667541; bh=kvuS7K0wl30nwl4M5zznAdLvDfFhfeZr9JFWkFZyoG8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jUyF7ZVN5cOHT7Ywj3qEcddLixQuTHRJrzo9lFkEJxCwYW8k7439qmqKjiwiemxg1
	 u11+9RnBc4uGQLNtOFC3HLqX5Mob3ZRWgZBMBr1WIIvR9jUkxZqAzIF7VtJsiOg7YJ
	 fTCyVOXDR3ZVb4HntwdA2boDQoLQiR4co5s/KeyU=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 9B6B9246; Wed, 06 Mar 2024 03:38:54 +0800
X-QQ-mid: xmsmtpt1709667538t7sldulm3
Message-ID: <tencent_B68EA2B8703102213B8D437C47820EDA0608@qq.com>
X-QQ-XMAILINFO: OVFdYp27KdlJUb+gPn8mDFZOGW5r7i3+Q9v+18k8KucXeEc9YIuJb4I3WmUHxm
	 ihIZ6cZVFvYl74RBcWeAG3JRyn9PVdZXSoQ2MzQqJOfIdCk2c0jbDEoLDQD1NxDYaf2tHMvB7lmh
	 tz+aorrbtZavPnn8lBWPPhp0xm/3kXOQqG143oUbiHXNfBi86aK608GSWQx3I2BjyA1vizn+da7N
	 9mfM82wP9I5ai89I6PmQfY/K6fw8+p0jnRjxrQamwe5aJw0RPkNnjwHMePCHgRsb0gtH1kCZO9j/
	 z2tOqw5g2mQmKMKZ2oDs3WJByl8I0hk1ot8Lm5UuQcUUbGXajXTWLLIoHlzJqq0U6O/xpxQ7CWuN
	 ltqIed8qHEXB4JFHPvQdSOFeAZy+Rviij/wDLPNt8s3asK+H6jRNSI72mBM+nzgw3JQI1pr1wIiu
	 sJN7uLZf7t50ygrUDDocu4wmwE2ZPSIjT6hgPhEPVneCuvgGMImdFzkEOV1aSgcp/6zs+biuFZsv
	 Gag4oU2UCHUwIiPdjTBceksB6YSz7BoNqaFfWrS1Sze74wBYs1249eylSiBqFaheQGP9sB6Ca9qk
	 RWqa65y7tNcTlrI++Pcd+YMsbP4/u23W54ayQ59MZ6S/V/tAh930LtZtGS33tUaIUu0ed5bSzbrE
	 9Ja5fUU46WGS2yl9UgVQrBzrqBF3kTP5P43qBLtwFp4BoeL9qUDfFvLTxMrkTZq52DJZybhCzTuM
	 6J8C4nkA2NSj0fsgoZj8vs/Y5Y4yrSaN3mo0rWchfso9MKWw/9eT+5rzQ37crmPfF3fCWzj2Hi0a
	 VtbRM3zXiWO+uhKKAn2WeKff/cx4suP5fhgO0VZoJp9FIwsradJrIc0reNwH2utTTgMaog5tmN5T
	 Hq6C5IZAxkmmwm1l4GL60KXDniW9NN2UBRo8dZACfMFAu1yQ5XIAYVS3HstxYQLa8OXG9XYnYnIb
	 Euws5HmKNhRtXJKzG45Rqpk/VoNnFuCZzZTM4bj7pZek0K3gfC5GtvoscGH9W9bV0TJqOG7yMMeV
	 tNWJhuPDOti+sDmSK2Eq3Ug1DG7tA=
X-QQ-XMRINFO: NyFYKkN4Ny6FSmKK/uo/jdU=
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
	Yangyu Chen <cyy@cyyself.name>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/7] dt-bindings: add Canaan K230 boards compatible strings
Date: Wed,  6 Mar 2024 03:38:26 +0800
X-OQ-MSGID: <20240305193831.1084556-2-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
References: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113915_086874_42440743 
X-CRM114-Status: UNSURE (   9.28  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Damien Le Moal <dlemoal@kernel.org>
---
 Documentation/devicetree/bindings/riscv/canaan.yaml | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
index 41fd11f70a49..f9854ff43ac6 100644
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
+              - canaan,canmv-k230
+              - canaan,k230-usip-lp3-evb
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
