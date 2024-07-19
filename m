Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E897C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 16:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=alKt62dpOT1KD875EgnNayCq/Q7UHyMp6gqX/eipFkI=; b=OsVjY1v/xRUJVh
	5NvjSPpVg5n6TTIkGASju9aWtxhWdBEt3zIHWBlvcp/o/sn7ypu0Bq1RBd6wWcBZ8Z0KKulaemyxU
	/cfn48iBrYbgQgy09Rgroa490aBfPuKn2PA6yrGP3DCBJIkkuf4VeIKL1BO3Susr7PFluFnF1EWWQ
	MbdvJeS8n/jXhzgFnhM7+uO4Zwf/cph30F39encYJvL0A5QeNRuojajDHVm7XRqbCCjDrQikhbTh7
	ITR2KBDlo6d2AOkgIv8VBU+xf5QupkqP5KkqQ8bKUhTx0cBnliZwW7uEctqfFTHL+Y3NDwHtIFCIT
	QQYg/cMMwD7QvOgWnOdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqK8-00000003EYs-2woO;
	Fri, 19 Jul 2024 16:19:12 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUqK3-00000003EUk-3r7L
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 16:19:09 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-70b1207bc22so846608b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 09:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405946; x=1722010746; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=SvveYGIkXZx9BV4RM6wBNiiPybWVXDeKiyyrw/nqqO3X7lLU0sFmvSftRB1qpqdo51
         I8EJvSVODpcdlHQb9zxx4RgcDLxmLGSZohDVhqkst/YDN3w/sgJ7oh25gYs22aVDqtKy
         v+LM3IKFOlfpdzPzAclI67eOKQkNe8KgaX8xdw48xRouJm7Q4AFJ/12jaLFyIYN3hpjg
         LmUrrP4lObMay0+ZvJl4RFQjqGrnDAQjRZ8pnqmLxa6ZyqDzPa9gftboYN9E2B3Pfr1r
         c+yMVuCahToHecMYxVbLCHZeLy1f2UGQB/7LoYH3R7Y8DiCPJ89gNUkqYoxaHOyS4a8o
         KHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405946; x=1722010746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=oeyPhQKGj1up0sZ4CygL96engLxRusWP1sccUBfNMimDtaMulA/GSqobY0h6TIH6zn
         1YW7kNXnt/BWrQRGSkjWWS0adZafb9rV7n4cTJZnDcgReCRK7rPXbjUcfuRzabjRkHuu
         qjfGS1bPHCYZlyeSN/HTlKsKsKuZ04W2PJ4WqNedslBSgXGw2hbnYgcGHHIIyIunDNae
         aE5J+1wENvJShXeKx6dv4naEgYwPH74ysAn9PpszxV6S5jvBICymu6kdKKca74Qrhk52
         uzWyhJg92hdl+5jWqxrirBb6AUYdVsxJvxfz3hwW0mrZQwkspJCiYU/Oj8j7HErS85fJ
         d7EQ==
X-Gm-Message-State: AOJu0YxNARdfA0ZqyrloG8uMx33zqdN2OjUJ4dqABzo5s2Q0ok30geJ6
	yBU+nlxBmMTsWUHezm/2I9Fmm4JeFtv+41XBab1CjkVerAy5p2A+IRgf4e9Uq9M=
X-Google-Smtp-Source: AGHT+IGpQhUEwosdUI2ORV/BIO0qcpTdq9x4hIAJhJLSNNmuRVn7wMx1hzMhRlqkrC8mFLZV7jFOKA==
X-Received: by 2002:a05:6a20:841e:b0:1bd:2894:4015 with SMTP id adf61e73a8af0-1c422999ce3mr610323637.50.1721405946497;
        Fri, 19 Jul 2024 09:19:06 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:05 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:18:57 -0700
Subject: [PATCH v5 02/13] dt-bindings: cpus: add a thead vlen register
 length property
MIME-Version: 1.0
Message-Id: <20240719-xtheadvector-v5-2-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
 b=vw3ii77Xw15MDoMhfXizqGACv7IxGNe+JbN5fE16N5Xx1rFH9BejYgL8yDj9OHaqBl1IRVuc9
 e+QVMtkstlhD4KgcoWg7ljr5hN0kd/hJvXchgNzP2IOQ3m7fneQUjL0
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_091908_011315_D85C6495 
X-CRM114-Status: GOOD (  10.84  )
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

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 8edc8261241a..c0cf6cf56749 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -95,6 +107,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
