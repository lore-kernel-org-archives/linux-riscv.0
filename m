Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 200A8EE01EB
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4Ogg+dImdSIaKIDo/kTrGDRYItzKteggITm6gfp+3Q=; b=oSBMzLUSXKIuMK
	yqE22zToWWOjB3NstUNeLoutsF36Ib9458+OMqCkN4ofaMhWcgSZ481G05vEzx74k5qRtr+l/EF2L
	GlK5ybZEzTx2Wmz5Jwe4boMj7WfsjU5GDrBUauvJAJL7HSm0e5U1UnucItH3Zwua+u6yZXtlFLOC6
	1VvdjP5wx5ewIqy0hzdWbyuYb/Bzv2qym7CX+8rIpgLKYfxL1cErQVLXcvKHmOd6YJsCw9Y3N5hee
	V5uIUpKGv4YpkapOUpg3DXmI89OzqA5Wl1v6FIPqq6NouN/g1onf5vwm0aLOCdJOM5BlgqOQGIZgL
	oEw1ZgJonJQNbFlVLUYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSwP-006O7B-18;
	Wed, 13 Sep 2023 16:42:13 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuF-006LYY-2g
	for linux-riscv@lists.infradead.org;
	Wed, 13 Sep 2023 16:40:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1c39a4f14bcso39826005ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Sep 2023 09:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1694623186; x=1695227986; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqR2RDc36TENwkhRWI02ORvUk5zlxgidXHuawQH9lCY=;
        b=pb3+fe3yMV/VvI9cHSBHRp57ityZmH6XQKfaK38bLZxP+rzyISJuVAYnYPTqipbqPW
         EqmZXZKFgirLSvtzX++dJis6iUblDNQK86wT404wa/DDHgR34wpEbHRWkTN7l72E5GZB
         VITd8ijPhxVbZdWmpODicGAb/lNhYtUkkx8cdSUVGnxdMvkML0ZfWaLaHOW+1Q48Gxil
         r+NdauHlkyWtNQ3KJgMd9W7HjeuLQU+5ShG3XjBMUoXz6Q1mOUsUG/JkePQpeRZsi9b3
         UYrXk+1BJy4KC0SZE+n4egRn02lGIWToFP7GZN0OG5cUYrFSYdTkVVw5iSa/MRFoyZum
         9DaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694623186; x=1695227986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqR2RDc36TENwkhRWI02ORvUk5zlxgidXHuawQH9lCY=;
        b=VJLmPHNNzYw3ShAGvMh9FUGp618hRXgryM0ATviTFYKZqg2wCJvJHFcOcisaUZ/VW0
         d2M2RADLs6zD5071JLpF5sVRa87F/q85FmNCHO/NMB24AGIB22rIcE8hDOVitdgfAs+4
         IIhoUHwI70i4sjus1quKAeANIdfFJziWWoBbNj5x2XdvVmsosHtcVMn+dkkbvOdnNOCS
         3Uc7qctv8q0GkSFaa/WwYzI2N+7Wk2gT1SZfwdEvUk8DbUlr4SMb9K9ecN655X2wj+8Z
         D1PnyWVQlEFxeApLB3iihAsFTZU7GeT2ZsRzNANnCZdhBeGE2vhCmMvmPdzDnd825QaE
         ofzw==
X-Gm-Message-State: AOJu0YzKYbYO3Liw2mFhT+xFAn9X0/04WpoBGfJHb/WT9bTUmnYbzhw+
	Eu847BkVWThKCAYqmgRqUX5rnw==
X-Google-Smtp-Source: AGHT+IHMtbIOTfz0kRmTGyfIpfQHbUb9g1Cnj+NRQvjNsmXJk227T21iqKzhdHXAvFmjWS65dl3poA==
X-Received: by 2002:a17:902:7589:b0:1bd:bbc3:c87b with SMTP id j9-20020a170902758900b001bdbbc3c87bmr2860052pll.41.1694623181428;
        Wed, 13 Sep 2023 09:39:41 -0700 (PDT)
Received: from mchitale-vm.. ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id je15-20020a170903264f00b001b243a20f26sm10577756plb.273.2023.09.13.09.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Sep 2023 09:39:41 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 2/7] dt-bindings: riscv: Add smstateen entry
Date: Wed, 13 Sep 2023 22:09:00 +0530
Message-Id: <20230913163905.480819-3-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913163905.480819-1-mchitale@ventanamicro.com>
References: <20230913163905.480819-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093959_928148_4EF1E500 
X-CRM114-Status: UNSURE (   8.24  )
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

Add an entry for the Smstateen extension to the riscv,isa-extensions
property.

Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index cc1f546fdbdc..36ff6749fbba 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,12 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smstateen
+          description: |
+            The standard Smstateen extension for controlling access to CSRs
+            added by other RISC-V extensions in H/S/VS/U/VU modes and as
+            ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
