Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABEDEDA68D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rM6hWbEi1iWrcq5qWZlW+OpGBAGbe+ef4CYpYN4LEAs=; b=Rv9d/tckmJn310
	rQgfLj4RTfjUhsWRtyyuckN5MWe85ZIVBfdDjbSbaSO/RzxdaL+5G9cJJ2F6ZTinKl6tFV+qio/5P
	/DQojIxORQk384Fm0BiAFk43dv5ylDZPRn/g6xav2kpk3E/m2Vp5xRyaVLNWeevrEmQ9P8XAzzuJi
	277yDQcEkHo42apqEtos2pSzQoJQQ/iOT3RbiQF91/AaDfwJwsVgQq6Wbhbv/NolJJLkd91kMGlld
	cac67gOJz4j9NyQm1L+V1UwVb5X17vf5dW53QBRxsUP7vaA5yOLQB575Wbf3WGKHaMtfz1aZK2xC3
	eN+AIHCHn67whqpHlhpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSi8-0000000FaH8-0o5s;
	Tue, 03 Mar 2026 16:35:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSi6-0000000FaGd-22KV
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 16:35:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36CCA402B0;
	Tue,  3 Mar 2026 16:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDA98C116C6;
	Tue,  3 Mar 2026 16:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555702;
	bh=HyqZMtRcUrfGU9UNlm5NhcKJckrPgBuMi0FqgbdPt2Q=;
	h=From:To:Cc:Subject:Date:From;
	b=msenSNMh8KjFxvpvnerBh4NvvxBkgSl7OONTO6jmpZG9mczAJrRC82tqX8/oLylTo
	 fxjMk+QDEEZp+/oCZu0d+PgxSALZN10mMQHvsa7SlzX5sO9D0k7tF7pB9Ti3U2AUmC
	 o5q11S8Aw/Yj4v6Pge0xGaIeF/geRlk2NcE7bGI9R9r6bMIljIIYy4NyGwNscyfOxP
	 FKXTnAuzWwT2nCzqg7ZTzwmj/uywWGvxgOgNk6zQaJsfyykV+21SLHWRPEnRURO6tn
	 PVqbSyIOxrEpN/emw+GchloKjZUuvBaRjFSQxv2LzFO9uazAck7a7eXA7TbVOH8N32
	 NeF22Ku8klBcg==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: i2c: microchip,corei2c: permit resets
Date: Tue,  3 Mar 2026 16:34:54 +0000
Message-ID: <20260303-clang-earthling-8a4904cb8a7b@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=23oSag2Y7V+S+9pFwJOyhqecZQK8YjdMRoaWJl4XUFs=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnLedepBlzn9LzYnMMuunH2Z8n2+qupActWST0qC54gX n9M4TtTRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZivYyR4e7FB8reL5rj1nG0 ZhX+M7p4bFKx0gqTvyEdj6rMp1d+esDwT+vsHYa6ffGVNSdc1QqdMo9cefM9fhH7HIaoWZ7Z3tr 63AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_083502_548239_C0DD300B 
X-CRM114-Status: UNSURE (   8.84  )
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

Both CoreI2C and the hardened versions of it on mpfs and pic64gx have a
reset pin. For the former, usually this is wired to a common fabric
reset not managed by software and for the latter two the platform
firmware takes them out of reset on first-party boards (or those using
modified versions of the vendor firmware), but not all boards may take
this approach. Permit providing a reset in devicetree for Linux, or
other devicetree-consuming software, to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index 6ff58b64d4962..bd63c70aac6bc 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -37,6 +37,9 @@ properties:
       modes are supported, possible values are 100000 and 400000.
     enum: [100000, 400000]
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
