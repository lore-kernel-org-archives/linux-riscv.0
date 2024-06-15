Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68419C2BA12
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 02:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=22dRUznyzuuLam+9eAHiu5DKjBNyMQycATEa/JRZX1g=; b=sFM7fVVUEwf9QP
	kWdSRnjMKQQSKHdU9ndsIUaEoXV+2SW3goKl3ouIQ9tXrE1tELiengihahOLcXXEV7WKFi70CQ1TF
	rRCuOIZ5/i52de6oDi8ZvQtu7tX+QJ957Q7VF71dWu9gENWr1k4+2bR0iyLYeAm1nNoYDrAZSHf1j
	jlxbmNykva3Us819CtGOPBet66rdizX1FVNk658uAKjkTzN8fefWUaRbbni2PPBeGJARPqZSQoYpM
	HTxiqeC1kkU6nSB6LrWyC9SZcz8zT29AK02HVKMNcUawwvgsbrVHmg/TSX15UPx/QFkEIlnOTBNrA
	DHv5NRESKq9x26oo3ysw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIIx8-00000004TWD-07Vb;
	Sat, 15 Jun 2024 02:15:38 +0000
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIIx5-00000004TV1-1OeI
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 02:15:36 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-374528b81ddso10179345ab.2
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718417734; x=1719022534; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8cWoOmqxKfRTYz+fqWWX+hQL/rBm7CI/FqFLj5thyk=;
        b=BKf0BBfBzrS6U/tR+dV/C9fTWf7pzv4OhDHIUCjeh7YCWGRAqYlnIFU9FG9FQY01Nz
         fxub1JSpec7krX4F7G0LnpDxoIgrE30FKqUJfrgXOuUeV5LuvWOSwzyaI6FSfykeeI4R
         66MzDBTWo83R+M54IyvP4qbv07uCIYpUBJTofxmcTdoSzVAnoFS3YjLNBFhepZRsPyG6
         Wv/Y//HAT8B+3FGHu7ZZElBXKjAiNJonnkq1yDl9kFH7SzDl+Ft8n1jFwrOmaz1FuF4F
         zENDm/QoY+OF9p/DHVxUaA+qU2j/UmyaXW3AThFOnh+aiUQ1doJd2m4gTzoCx3Z2ndng
         kJcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718417734; x=1719022534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A8cWoOmqxKfRTYz+fqWWX+hQL/rBm7CI/FqFLj5thyk=;
        b=a9PQiZBhCgyZu20VT/9/g8CD3+lwQrndInJNlowF5Z663hsk3dKn7r0kDL1ZgO4U0W
         PBsyA6MiFQu+YN9eBX43rqP7cVSmZyV/ieUcDaCkcFsaQuBohZDlRPFVnOzn28MbuHlU
         c0fA8C8wI2MX6GkqqfYbes4oLv5ZGjrozFxpr5imdL09Dba8mHMx6knRJEi5rMdAfoys
         WqpdnZBTj3gsya9Gd6LJrxdfjy2ALHDbmxBkdxc6At3wMe4bTXUz6rUGBkfrIPIwq/iF
         cEPtg6RDqoB2HeAcYbojzOgvmzO+xsrxbJNTK9Gx6uxxG6duB9/NSAbvDfof+4JOuV+k
         PUng==
X-Forwarded-Encrypted: i=1; AJvYcCWzTZwMkIrokaxJfOM67J9M6vasQ9KmElXMs99T5qadN4ouDMPgmJv4zkTvFygQ+3uTCFzGpxcO4g2iJBNeFw2NV/TbJHKxEeBATsFb+Azu
X-Gm-Message-State: AOJu0YwtJDPaSwEhyWbx5WKwG6EgsLl4jc4QGAjQXDJF5mEKcCMQvW5s
	Ndm2tukRPMTEdjf3hlCSu/+r0XG99tX515TZVZTQsXwyTOzJ7+/9
X-Google-Smtp-Source: AGHT+IEsxdDM+X77Oe5QUXk7TKdHtOzNf1PKhlMLCNfRyW9jVFxiwyhgXHeMc52hNowy8T+I2Z4zIQ==
X-Received: by 2002:a05:6e02:2163:b0:375:bece:db22 with SMTP id e9e14a558f8ab-375e0e12fa1mr49667905ab.7.1718417734297;
        Fri, 14 Jun 2024 19:15:34 -0700 (PDT)
Received: from ga401ii.. ([2401:4900:1c28:4b16:65cf:ef28:5753:2be4])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-705ccb3d2acsm3717839b3a.124.2024.06.14.19.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 19:15:33 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
To: 
Cc: kanakshilledar111@protonmail.com,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND v4 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
Date: Sat, 15 Jun 2024 07:45:04 +0530
Message-ID: <20240615021507.122035-3-kanakshilledar@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240615021507.122035-1-kanakshilledar@gmail.com>
References: <20240615021507.122035-1-kanakshilledar@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_191535_398952_27EA1D73 
X-CRM114-Status: UNSURE (   8.74  )
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

removed the redundant properties for interrupt-controller
and provide reference to the riscv,cpu-intc.yaml which defines
the interrupt-controller. making the properties for riscv
interrupt-controller at a central place.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
---
Changes in v4:
- Change DCO email to @gmail.com
Changes in v3:
- No change.
- Rolling out as RESEND.
Changes in v2:
- Fix warning of `type` is a required property during `make
dt_bindings_check`.
---
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +------------------
 1 file changed, 1 insertion(+), 20 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..f1241e5e8753 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -102,26 +102,7 @@ properties:
 
   interrupt-controller:
     type: object
-    additionalProperties: false
-    description: Describes the CPU's local interrupt controller
-
-    properties:
-      '#interrupt-cells':
-        const: 1
-
-      compatible:
-        oneOf:
-          - items:
-              - const: andestech,cpu-intc
-              - const: riscv,cpu-intc
-          - const: riscv,cpu-intc
-
-      interrupt-controller: true
-
-    required:
-      - '#interrupt-cells'
-      - compatible
-      - interrupt-controller
+    $ref: /schemas/interrupt-controller/riscv,cpu-intc.yaml#
 
   cpu-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
