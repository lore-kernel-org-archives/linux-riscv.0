Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE47C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Oct 2023 12:35:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Af8vfaOBpHELCfRrfPEQurhroWY66f+cPKxIA4mYRL4=; b=XetUbghKEEPieu
	05/6bBRmxMZYxP0oZ/l3k7PyBROzhbKWIaRvLttHgVL75j/f2r8kXYByXFz7PxB+5JxhVLztAmZQY
	QRuoDmJ7RtGn6m1A4sLjLDBHdc9mWqs8NVw1zgJ+cHgc1sNKW/KeTcMnJckDwTrXjbRw9NSBiFZID
	qetMpG5lDAySdKIj44KuB84rookCrDFPo7iP1i7CQsuQ8xB48qTUM8o+SrgXwoJ5z47Jghd1lNsgv
	OZ18IgNRvm5tQ3qoGv5EQpeV/0usX2f6vMLIaHPA8BNK6lu0G6ZNfUAlO8bS0Gi5qC4W/EVFPOGAM
	auYtQiwVEyzNerVQSg5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qx50a-001jjK-2r;
	Sun, 29 Oct 2023 12:35:12 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qx50X-001jit-2V
	for linux-riscv@lists.infradead.org;
	Sun, 29 Oct 2023 12:35:11 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-5a8628e54d4so31214897b3.0
        for <linux-riscv@lists.infradead.org>; Sun, 29 Oct 2023 05:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1698582907; x=1699187707; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qK2cFDGn1hazlPIsHpN2XXghPuIbnQBG7tAHB1/AOio=;
        b=CGVuAulxVieC6Dej3SJPJMUmLKlNFJ9cd82Fuh5ayNMtUu87w4MHQhf0erNzHxOHB4
         DBmWjZ2g1wIUV6HpaIpUkDROM5/8cv2c8uxtSofhAC8eYmMyPwkbSS7gLlcFXROCHt6g
         kUHGTGXbX+knVP6LWAkZ/AL2PNkfhEpbZ2VF5DDI/SyYYCCiKOEhEjaZMCgu8RZqybui
         4pAtw9DaoSkIWoZduD7W1OVXGIw+AcbgKlcZcqBgxcMXMmtZUj6sEBPx/UJ+AYWyyQy+
         hZ9IVkmxCdbOFe3Q7salxIUpiw6iwJVpGgO3NwTtA5Ge0BZFka3A1/i7IceWiINmG+Rh
         7e1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698582907; x=1699187707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qK2cFDGn1hazlPIsHpN2XXghPuIbnQBG7tAHB1/AOio=;
        b=h6NRQilubTPHIQM7g6JBpMhoclej1ppOWJ6f7JS6otyiE+le0l2rn3c6NeniijEjTh
         QYOLzQyU9/FBAJJuQZuiuvkfbSciVDMvvGaNjtwTxCwPdu3bVkvtmtxcZbTUR0XtHS4o
         FxrMmjOJdnE0rPaJci3TDG7bjKA3VAg3dSY3t1frFGVDQGqbcrfAPcS6589kQKlQKDZa
         1yDAfAhGNoYJ/I/9ZhqgWB2jtLA2QgVnqDtKygVDWED8WnNTJ5uC4BHnzIxdRXR8vByU
         lPgQvshXv3rbwjMQ3X0oF4PRwqIXEEhVzAynDA4ycql4HXRa6mtozayoTsh3FocDQY42
         qkYg==
X-Gm-Message-State: AOJu0YyZ6NqTTNSVB+HhYo8WPFlPPlZ5ieSqMbnoxCCkZcgew9FBl+iN
	VGyPtM5orA6bkF0dc6euHGmpckIR6YJQ8TTAeyc=
X-Google-Smtp-Source: AGHT+IH7fzLWL07EynDIYmE/tSQk2rwURQM1vbYkVOwEutKRbG7eUCFv8eX5N0Ws4rGqC/5Ip1CR/A==
X-Received: by 2002:a81:4149:0:b0:5a7:dad3:cd21 with SMTP id f9-20020a814149000000b005a7dad3cd21mr8015564ywk.10.1698582907095;
        Sun, 29 Oct 2023 05:35:07 -0700 (PDT)
Received: from grind.dc1.ventanamicro.com ([191.255.2.33])
        by smtp.gmail.com with ESMTPSA id t3-20020a0dd103000000b005a23fc389d8sm2959318ywd.103.2023.10.29.05.35.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Oct 2023 05:35:06 -0700 (PDT)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: apatel@ventanamicro.com,
	palmer@dabbelt.com,
	devicetree@vger.kernel.org,
	ajones@ventanamicro.com,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] dt-bindings: riscv: Document cbop-block-size
Date: Sun, 29 Oct 2023 09:35:00 -0300
Message-ID: <20231029123500.739409-1-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231029_053509_843435_BEDDAB07 
X-CRM114-Status: UNSURE (   7.18  )
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

Following the examples of cbom-block-size and cboz-block-size,
cbop-block-size is the cache size of Zicbop (cbo.prefetch) operations.
The most common case is to have all cache block sizes to be the same
size (e.g. profiles such as rva22u64 mandates a 64 bytes size for all
cache operations), but there's no specification requirement for that,
and an implementation can have different cache sizes for each operation.

Cc: Rob Herring <robh@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 97e8441eda1c..1660b296f7de 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -78,6 +78,11 @@ properties:
     description:
       The blocksize in bytes for the Zicbom cache operations.
 
+  riscv,cbop-block-size:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      The blocksize in bytes for the Zicbop cache operations.
+
   riscv,cboz-block-size:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
