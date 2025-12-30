Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94A30EE020A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 15:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmgccuw5dEjxmCszcVXkfJ+Wl5Z5GFb2W2AtEvl3/Mg=; b=WXtjaQ+9MUmFC7
	dRrYRRkqOB433EnmU7D3QJR2wMrr0vpxpy7BdmzSBVdl7w5y4iGpe7SaVUQMGkvIzjdI3e0h70y5a
	hqFEV29eSVpDLLOMJMDNdyGmVPPLPm2WSlZip52h0DQvAuIgcCVbqchj5OP2uVVSiXMwjqrm00pK/
	COijVG3aAMuciennO9WjAcFD24+XJRMOgGgTwUTqDI5u78uwMwvY70O8ilQyBX7z5LLifhKAeR+Al
	k+gd6fAat8gMuq0MxA9e2fJUT6RqBRuSvTyWtLcw5A4FXW7c/JP15Q9IDkKAQkHq3Nm2L5EKraMek
	gFetfqDhSXcnfEuAb6bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabJR-00000004ypt-3NS4;
	Tue, 30 Dec 2025 15:07:05 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vabJP-00000004ypU-19xd
	for linux-riscv@lists.infradead.org;
	Tue, 30 Dec 2025 15:07:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2a0833b5aeeso136665665ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 30 Dec 2025 07:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767107222; x=1767712022; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tIBqKSox5UwnVaoV8Kjau6whEf+LnmnAR93Js9qWwVY=;
        b=fOldKeCjmpkiKcxKQjZjTuJysINbBKm/zopHg71fGIhsdKlnmT+3G0/YgZq6XD8ZOl
         JXaeBQ+LEThiOLHci4dV1S/t+z+B1eqlCeTEjXGLJNJQtxdCZVx+L6H7PE7NRu99Y9PV
         4fHdLda+ggTOKKHRD6KQfQEdhIkZDRFEhwhfYSm6vsgwLHOuEJjmKeKoX7DBuoLcEVgV
         LZaN1JbSJIHfEBzproIRNDuOqH/mljftu+Np9VbuqzT/lwsaqpLmMm6MWZGqrc5EjnPW
         /XoZGu6y9Y0/QPZIeZ9EwHB4ycNgzxC24+06fEbHPqVUXFRCGUmBB8d2BlM1Clrd+tnZ
         xR6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767107222; x=1767712022;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tIBqKSox5UwnVaoV8Kjau6whEf+LnmnAR93Js9qWwVY=;
        b=tL22Je6fiiXOVPVPGT1hkouW/ndxXyQohe6aUfPM8gLi/Msk2OttXUJRvy3pp1k6zn
         Z/dl7h01nUD5hADiqh073HGY68kY6NlYJBXmvtcG160t9K5cWczpKPcPregYh9Lnp+/V
         U7ok5LmsdMgbs7wDftGUDdonm16mBAumAYYmegMifwT1oTDbNguZ+/fqxxdCEDgkVp0u
         bSpIIEEOoDJXOdsaUqpdneFjmM1AZjnm1Ygxekgt4/LanYEi42Rrag/uHlff4P4H8VSj
         3GL8rKrb8uFWPUt4T6EsjBBCIJzz5NR/0n4w/jJjCgLCNJZZGHl7GOu63MRfYHxx0scy
         iktQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYG0WHibzyZRjVo6Uony4GoXrr11RA5ik/ON0ITsS5Tz697+M+5UuOy0k+LDzq1AlUSQnjSIAxiQ5PCA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8/vpXdGOAsxHsUSu9rLoZFF1QgQCq4YaNe5VKGX88B7LcIzhY
	e9bJox4Cp0BKHnaFIAhihntwl3OGnc3yFpJwAH5vt/Qqs3PQXPdnC/WY
X-Gm-Gg: AY/fxX76+4P55HCGFf/PWgtLOpvjAvmiY+BXen7o0gARy1s2cvicGdinISYdbiGPuI/
	yJmrYOxq/7imn0AuKVrmzA7VQdjOe2nkS8ZrMowOCJhOde5VgkgxBqWXSsLUfnrWnePu7epcNH9
	BU7WPW2G6OK0nHpHOao1aDJ85JDdDPLpWPdq2rjuPl+ONS9PdIQlpaF9bm4BbXKgHi/7IMRFGxF
	cRCQkw/jzKfSOjmQtppGCCnqK6brv8XcSHtrXJIgi8O0T8VpihMov1DT6+DRgLw6lCes4kWvf2s
	i0K9dQp8UYEfuXoiGBhSPsH8wgwTMEnb2NGrMZPNmSL2XldUpn3beZ9BlvhxItJPc40PMP3qF1j
	Yeu2eWh5UmlPImF4Vc1QwrdB7cR+QuJmnE1/PDA8KlDLJSqTzON+wYoV8gMxG+bDa6OpxyTLBrl
	rKK0QY
X-Google-Smtp-Source: AGHT+IF4mlQHloICVoZ4fRZRB5k6TueSAxDDvE3GQmVRBYhsflqEoWLyLFOrsYFcTTyvrCL2lLxibw==
X-Received: by 2002:a17:902:e945:b0:2a0:9081:8a6 with SMTP id d9443c01a7336-2a2f232c8a5mr357039835ad.20.1767107222036;
        Tue, 30 Dec 2025 07:07:02 -0800 (PST)
Received: from localhost ([211.94.234.112])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c88d0asm298919885ad.40.2025.12.30.07.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 07:07:01 -0800 (PST)
From: Encrow Thorne <jyc0019@gmail.com>
To: jyc0019@gmail.com
Cc: alex@ghiti.fr,
	andi.shyti@kernel.org,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	guodong@riscstar.com,
	krzk+dt@kernel.org,
	linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	p.zabel@pengutronix.de,
	palmer@dabbelt.com,
	pjw@kernel.org,
	robh@kernel.org,
	spacemit@lists.linux.dev,
	troy.mitchell@linux.spacemit.com,
	troymitchell988@gmail.com
Subject: [PATCH 1/3] dt-bindings: i2c: spacemit: add optional resets
Date: Tue, 30 Dec 2025 23:06:51 +0800
Message-Id: <20251230150653.42097-1-jyc0019@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_070703_442880_E7A5EDA6 
X-CRM114-Status: UNSURE (   7.48  )
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

The I2C controller requires a reset to ensure it starts from a clean state.

Add the 'resets' property to support this hardware requirement.

Reviewed-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Signed-off-by: Encrow Thorne <jyc0019@gmail.com>
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index b7220fff2235..5896fb120501 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -41,6 +41,9 @@ properties:
     default: 400000
     maximum: 3300000
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
