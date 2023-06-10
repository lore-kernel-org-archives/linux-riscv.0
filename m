Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FA0AC7EE2F
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sW8wKyCmoshHcdJPlmUMp2JgM/epImdwJEjJ5cDJE1s=; b=wsdGQyXnv9ce4J
	gwDcLquP3FLihr/WoRATbB9BqA2eR00vFmmQphshqEk3zBGn35e01OnEbSSspve1ufn2FxoBPjyOp
	9gOK75nahlL7XcW3rTrwiqKgRiKcitewDH8ZooP9lOWTihZmnvPhripYpnVLczpqWGdKpyQHyBndC
	TyV7DGl4Bj0uQwzK5H7q1Y8/eynFfqvah6TE4NJP82gRiR1+t1lDvw17kz3yZaHE12SiX2f0bdbI7
	QfgB22qu1Tq89ZQlz7BuCK14jcBwxE7jv7D+wCE9VXELBtM7XRCeqQrfgUTMoqn0CS7q/JZsAC35j
	CBJ6KUFkhFWq4YsTwlJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L5-00Getg-1k;
	Sat, 10 Jun 2023 17:25:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L1-00Ges9-1j
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 17:25:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1E59F61010;
	Sat, 10 Jun 2023 17:25:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6A38C433EF;
	Sat, 10 Jun 2023 17:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686417918;
	bh=/RSEb/8qn2JLiYhnJeSUa2LgkGU8ITV00j06razkRQE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MKz//IfoXGIJk1GU06Ba9/I9/7ZmNONwLt8CzK8x+IPV1H2itwjKDt/WpAXMZ/Amc
	 AqN5ATQtQql23Uq/mZ6VIOLcHi1v4bAfwmLIDT9Z1TgnrhgYZ/zF1qEnl7pk4f7xGx
	 iCU/r7kifl4RxHD9wz6lp431152q8xA2CN27MgZe9++mn1A2Tatx7W/5L9vLw5F64I
	 3FUcPpMi13EQiAFRr05KldhNeCp21j/bA/c2XJ0CYklvOzNpbh+xWdq19ZvEFl6Jp6
	 qP0eQbxQ+6lC5KDwZ1MIPk5i0VK6BskVlgbGkYroaqAbpCJenkD4wLo72Udl7cHzfN
	 FekWYHTiBr7Aw==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/6] dt-bindings: riscv: cpus: permit operating-points-v2
Date: Sat, 10 Jun 2023 18:24:51 +0100
Message-Id: <20230610-jacket-king-486b50a4e01d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610-snaking-version-81ae5abb7573@spud>
References: <20230610-snaking-version-81ae5abb7573@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=888; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZN0D8JIh0ZTCyrgQ1QBX5wAql6+LOTcbl870BurJKZA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCktGx/mXXoWcv3avliRBZZNMf9TLI7OKN/09sEutSJJ7 Q153Jted5SyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAivssY/ie6r/idKv/Wdo+z 08cdf0xZKwLWv9qWEJJ0/aDLc0u3/yGMDOfu8/z7eebuqzD7pZlX1Tezb5mWH/+Z8dTfhz0v5ty oe8kFAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_102519_618884_D19BA5E4 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Conor Dooley <conor.dooley@microchip.com>

To allow setting "unevaluatedProperties: false" for cpus.yaml, permit
the operating points property for RISC-V cpu nodes.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 9bf2b72a9460..00d1e273f1a9 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -108,6 +108,7 @@ properties:
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false
+  operating-points-v2: true
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
