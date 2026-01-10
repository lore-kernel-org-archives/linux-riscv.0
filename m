Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D89D1D277CE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UnpyAgfsv/UqzPfMTppNeJZ4+xS8+rMLMRR9tp8aQ0I=; b=ee0H0I+GiAY4eO
	rbZDylz+WiR1VK3fP7HMhWSNPHndIp6/0pE1JKhhusJhXYdA/RLzJ0fxdc6VrACeeIyvgVsvlA8j1
	5yFtKMH8cAa0KpzsXFfLXBpZlcHrsXlBEyAbJgvNc9f4odT7tuLkUVXyOT0eUS3Vb49+LslPDa0p5
	em3hhguv86hczkf4LgWO5Ob5D3g2PmzFla7goKLrPU5lvQYE3r3jXMA90MDq1P0spVt70zVe6zyNG
	Rn3AKUF2I7w2QSASJ1dXpH8KxzkgGvI1PUCL3BMNJlqp5IR8nZfjfGKLnUR5vdPnhmVfdZoYkIBNH
	eUG8UiMGGPy6vMfNHrnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROO-00000003G4g-3tDl;
	Sat, 10 Jan 2026 05:20:04 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veROJ-00000003G28-3M6d
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:20:03 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-2a3e76d0f64so17131955ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022399; x=1768627199; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jgbhy2bR2/d0ajbeUdzL14ozIkLKVnJeuVGHx2O7OYs=;
        b=ukCdEa50FCQcv0zB7QjHqSf3ddkbYxKaaOqSOQ8PWQFu2m95/29NbraQYRcTzQ9tdD
         ISy7jPSTcyr86Sl9kUnP9G2fPZnTUUxkqpsyEdtaYaYi+aXiZCiovPcmAc3ScJUVc/0P
         jo8HK+SlyKXLgblxcimiWiEcNtgxEigv5UHKvJG5FPl05+xZF8KJiatR/zS3jRUZo0DM
         YVUfhXVucc7BEBahZVO9ShiiWiiB1OG2gA+UeBlOaNVxul/DuvaNTcRanzxEvrJmeEY7
         19h18xmuq0nB2TTEK6YbuArKgPnnxibQwIca7cuXS8qLACo1ksw0qgyLTKbCPx7CyIsO
         22kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022399; x=1768627199;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jgbhy2bR2/d0ajbeUdzL14ozIkLKVnJeuVGHx2O7OYs=;
        b=WYOlKuh8+iEbbx6lftBWnzXIjsAgc0xKzkTKqL8vE55OMK0PfaNL009i+9D+EOMDWB
         Apzqvh0fy3Sj/zQB5ClZpxThw0xEoctwe+kpA/SzA8W6adI6nitp3aEEhdr9cejtHT4y
         CqQH/DLtg+2Et4ySLqgPXlz2cDdKYB10ZgCqX4ptUeQH8n9zSoBh2RQosHsRVbsSn9Ea
         hf4rDdQ+Bmml7JChd3We4Bp4D8nVYItzGYAFd3HYI6CcuUEZzAf3aCcM7kCRBw12O+Ze
         Ccx3BUZmNbPLjDPSKHDZ2qR9RsbFHfccoM6khu64LqvDDM7GddFbhEIPo/dowP2ASkN0
         2mRA==
X-Forwarded-Encrypted: i=1; AJvYcCVw6JaxV9S5qpV6VljNXh9L6dbP5jkVPIXrqXnFnU0D4EjAOmDtsZkRGqA0PHAvW0oGTwX7ebUwZEECtg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0qBWUyqYurc3WbAHLMoYi2q4VVBAccoGZMqp7AaLTsZYWPFUO
	ZEDUctGsn6lpvXg9up0I9HoqPuT331AfvJUiwpyml0wM9daO9phpmKHTU3VShSAUAOg=
X-Gm-Gg: AY/fxX4eHtW5HDB9nUxNEcKTyN2NxgvcmvChX753LkVKBVltquGqCAHXHWv8WIlvITR
	c5kbwyvt1lQzuJrOEW7w2zfR9itriU8N791i/RPXOiVkmSM4VO7L3LdyYg+tq5+CL+7S4MmlsZd
	ax5j75LRVG6Nua9EkCTqHGsU5aCgOwYpRrKEJ88L3jr3lhIgpVu0bJtuA3Z+9HcElPSX8hGxfqo
	jCwtLrvN16wjJ4M9SnlbBGZLLre5Qqu+gcdCgoRvYBe2Li9OSYIrCJQD4Y2yd8QZQ+dCS1LbJVt
	Sc8e8MaotvGh1UJHgt4eUc8kvDiaKy3cQRAekmywl2HN+9vftZqKvAgU5tKXfmu5mfrsRcjUVMM
	v0dmpw0f4fgUmJt1cUuDxR7O6NE3oGV5ZYvj0rHfnjSL3786zZp5rAfJgKUFTh8zX/iKofWiK2X
	SO0NHN+DQX0xBVBLXuC5OvHALb7F3KGhQGFj1T7pJ7gbCIwa7808hdqg==
X-Google-Smtp-Source: AGHT+IGNuBpZhl78Zw5IbiS1grRE/HsJVf9xBHrMUUqcEcHDzEu/FhyxEhd8ywpJ3q/0ESFdRnbphg==
X-Received: by 2002:a17:902:e545:b0:298:639b:a64f with SMTP id d9443c01a7336-2a3edb0de06mr132346145ad.6.1768022398915;
        Fri, 09 Jan 2026 21:19:58 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.19.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:19:58 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:18 +0800
Subject: [PATCH v4 06/11] dt-bindings: riscv: Add B ISA extension
 description
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-6-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_211959_850421_33229A69 
X-CRM114-Status: GOOD (  11.55  )
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

Add description of the single-letter B extension for Bit Manipulation.
B is mandatory for RVA23U64.

The B extension is ratified in the 20240411 version of the unprivileged
ISA specification. According to the ratified spec, the B standard
extension comprises instructions provided by the Zba, Zbb, and Zbs
extensions.

Add two-way dependency check to enforce that B implies Zba/Zbb/Zbs; and
when Zba/Zbb/Zbs (all of them) are specified, then B must be added too.

The reason why B/Zba/Zbb/Zbs must coexist at the same time is that
unlike other single-letter extensions, B was ratified (Apr/2024) much
later than its component extensions Zba/Zbb/Zbs (Jun/2021).

When "b" is specified, zba/zbb/zbs must be present to ensure
backward compatibility with existing software and kernels that only
look for the explicit component strings.

When all three components zba/zbb/zbs are specified, "b" should also be
present. Making "b" mandatory when all three components are present.

Existing devicetrees with zba/zbb/zbs but without "b" will generate
warnings that can be fixed in follow-up patches.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: Update the commit message to explain the retionale why B and
     Zba/Zbb/Zbs should all exist in DT.
v2: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index b615083f2544..f671299ac819 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -109,6 +109,13 @@ properties:
             The standard C extension for compressed instructions, as ratified in
             the 20191213 version of the unprivileged ISA specification.
 
+        - const: b
+          description:
+            The standard B extension for bit manipulation instructions, as
+            ratified in the 20240411 version of the unprivileged ISA
+            specification. The B standard extension comprises instructions
+            provided by the Zba, Zbb, and Zbs extensions.
+
         - const: v
           description:
             The standard V extension for vector operations, as ratified
@@ -752,6 +759,30 @@ properties:
         then:
           contains:
             const: f
+      # B comprises Zba, Zbb, and Zbs
+      - if:
+          contains:
+            const: b
+        then:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+      # Zba, Zbb, Zbs together require B
+      - if:
+          allOf:
+            - contains:
+                const: zba
+            - contains:
+                const: zbb
+            - contains:
+                const: zbs
+        then:
+          contains:
+            const: b
       # Zcb depends on Zca
       - if:
           contains:

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
