Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5151C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wboUsb0vycI9yd9Igvt5avu2hydxdTlbTk/2lP6a5rc=; b=1JJUeJKlJpLUAf
	c4/GhxRVUv7ihURQwYRmxH9IfiJafYhOHVKke1bKGh8yKteYs9K8xAz4YfMLTD4WSg1Q4ipGFJ+Zm
	T7MYqrGa9lL7pXPG1hWP2pZp2FaKfocqStwLiNr6mC5W45UPNQz5hUNsKNn992Q2pLCZcFJMMh6mX
	/wfYdz4O7PMw5kmiF6UsyGhtlTCkr8TaCkDWRpu+0IVW2GzGfz69gDlG+WucNIPD1fs8C6wZ5cYyl
	DDZMhPx28ykOBDi9T22p/6U7lVDQik8Jmy3DaHSmxGR0+vvWHFGihC7GruSnb8ZcS6BUzxlqzy0gK
	VOCyQV46M/FILIpMsQGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L2-00Gesi-2s;
	Sat, 10 Jun 2023 17:25:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82Kz-00GerI-0o
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 17:25:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id CF66661567;
	Sat, 10 Jun 2023 17:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6377EC4339E;
	Sat, 10 Jun 2023 17:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686417916;
	bh=v1UrSNfLWrNGAmPVc1KJdoO4pG/6O2Mh0GZGIPz0/A4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ORGAxlFHkQ3ZHHANOC+UtsEuLI10MLZoN3T99DVNonN7otkMYIeJ44lVXOemdQsyL
	 6ZoeJemcCEjkZptDvm5nsAQorTHdZ0ysKFPuSo0Y/u83RC3mE7EZyUOW1/IDfPswyt
	 ZqcZOru4TLVacbE3pYEpCzNJuqvRYVRLUgI0rqLR0C8U15VzEGA+XrgLL6Z8/YGuPp
	 Em72uhsR9xWc0iVxtDb5evaBcDfhkSUr4AMWU+3Y3+7tUYb5F0sTqUcz6kkOChD3PE
	 exJeMReWwrUmAD319dGgOXtqQy6J3TPRtd6PCBoYCJfKyjkmmf9i1RPhaIuZC7sN+G
	 kmkh71DajuYig==
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
Subject: [PATCH v1 3/6] dt-bindings: riscv: cpus: add a ref to thermal-cooling-cells
Date: Sat, 10 Jun 2023 18:24:50 +0100
Message-Id: <20230610-antiques-provoking-f58da8e39262@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610-snaking-version-81ae5abb7573@spud>
References: <20230610-snaking-version-81ae5abb7573@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=X44cJQynNyxLh/lbSBWZ7y3BLAT7CFQ+L40vuT60PNk=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCktGx8qCVzRUiqUtpi0QbWzUzFQYdEurTsR2o0zLj2Kf 9TIz2XeUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIm4b2Vk2C6ztf3XTmPzUo0f oQ8/N867LCZ+qKmRPyZBtvT92ZXqFowM+zkFpp++bHgsqDOSqS9dz7Slfsq5pV1c2+oSutfq3r7 EDgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_102517_331742_30356612 
X-CRM114-Status: UNSURE (   9.69  )
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

With "additionalProperties: true" removed from cpus.yaml,
dtbs_check complains that #cooling-cells is a disallowed property.
Add a ref to the binding in which it is defined to satisfy the checks.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 3808a6703b2d..9bf2b72a9460 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -25,6 +25,7 @@ description: |
 
 allOf:
   - $ref: /schemas/cpu.yaml#
+  - $ref: /schemas/thermal/thermal-cooling-devices.yaml#
 
 properties:
   compatible:
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
