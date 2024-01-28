Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC079C47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YSqdnReLkU6lZmyeD2X2KMQVkQooN9RhoaNdk+TcaKE=; b=xqkjmJTIUGlJ2m
	YF9aMHaRN7lUpDk8kN3QiOMT1V2HTxCmdiI4Y3jqpXHnnMXCalS3HF89m+bJ9V5T/oSxjqIRH5/7H
	CcGpxSGiDOpYNWBb2AKPYcmgVhd4Dt6De1apr5OwiBasB2fZxEbYmNa5KGS5dokFWvfBZ9HCdWMwH
	pFmE/Od7ip+cxrZuF+nJ7RUtrzKTixSDLBa1ljYkAnmwt/ZgcNa/OMU/LguW6NqPiPpwe48unByb5
	gqfrpITg0KfQ6mr0oVEEuheCvYaR2DbLGiyT+ANtFc4Qhh1n9vZgly3WNwhhaHW3iLH8hqfkWbfed
	/BXPIWWT+00B6Axu1h3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9YA-0000000ABuE-2qMa;
	Sun, 28 Jan 2024 18:06:34 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU9Y6-0000000ABsc-2dpf
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 18:06:33 +0000
Received: from localhost.localdomain (ip-178-202-040-247.um47.pools.vodafone-ip.de [178.202.40.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id E5F83413CE;
	Sun, 28 Jan 2024 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1706465185;
	bh=dLYNl6OEot/tkl0vnc26UAKkt+SMWAraqyc+cGDkzMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=tIOrCohyNvMGB/Xqa1hFx6N+xOZi4izO98fMk2/D1/9U/Wv+AXMuaLhHlxiF0x7x4
	 UYEuEsv4QiCaW/Vy+U00+80z9rbqssgy8+1neN7fe5975fWaNsOHHgunsSTwFiMKea
	 /I6PmGlncnhqJZfkLgN+T41qROW1YkM9GeA+KvYZjO5c1XRHlwG4AdegTN/Wb1Lngk
	 a0KGLvHHGwy/k9QaNOgfs6uqZqmBgqyMiN2x2NaHUdaYi4l5/bJvJpVzQ/k0+6FkcE
	 SCsIZCprhjCX5Ke/TQdxA0+nIeR3xAgJGoTTG+RD/LrSE4BPFoHEZKqr+dj0NTJmqg
	 61At2TvNAlroQ==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] dt-bindings: riscv: cpus: reg matches hart ID
Date: Sun, 28 Jan 2024 19:06:21 +0100
Message-ID: <20240128180621.85686-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_100630_973846_B2913983 
X-CRM114-Status: UNSURE (   7.40  )
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

Add a description to the CPU reg property to clarify that
the reg property must match the hart ID.

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index f392e367d673..fa9da59d9316 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -74,6 +74,10 @@ properties:
       - riscv,sv57
       - riscv,none
 
+  reg:
+    description:
+      The hart ID of this CPU node.
+
   riscv,cbom-block-size:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
