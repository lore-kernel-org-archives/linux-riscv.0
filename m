Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DB5E7AD40
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 06:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=r8GptvE6TWjjsiF1u8zRzqiLbE4OOHsqW0NslboPHzg=; b=MS3NnpH/MOqmB8
	FnX7mBjDJSw6nj8Hi4KVtP5JwNm+BYbNWzTW9on3aLn8JJB8/sz970IBeKYD7Q1nuOloukEBPipXU
	GLMvfiO51G2IqzHHq3+MY9KBCjXTA2vhuKoJhBaG+KPr9bfJ2bXG2yem/oBiSBunU41bDE33O/iy4
	P7WskClRHNzhewAM4cQV+sgvbyUO49JGzue6uLu77fvoos6WhUV/Yl5lYYUIn87hwNkE8LCU5QDgM
	VeLnZ08v+Y5sIejDdgLPl3/R89igT064qK1jrJqvGW53wKIXWuoVmyL6+WFaur3yDA/c9wqJ1GMLZ
	BbufsGOW+bS8HegQfF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYemR-000000007jH-3qbL;
	Thu, 25 Dec 2025 06:24:59 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYemN-000000007iL-2dHA
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 06:24:57 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-34c2f335681so4980072a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 24 Dec 2025 22:24:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766643894; x=1767248694; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4w9uwIbipKy4DZy4jYoGNs4+hV0eW+R/XR+IrE6gXTI=;
        b=Nh+R5R7Vbw9Y9DOeVmDmI4xOJKuVA6bbh7QWsTHojMIhd6eypyTgLGRXnyyxnL6beP
         hRsdV4qPkSGh4CrXPM+bqSF+2BfnhTqC61FwAAz16ZV44Cg+eFULS1qkDP+mw30ZB/aT
         5FIkddqYPILem+1JjLI6O2lERmtGMuoMpp2rmUqXZzvQSwu4zfAKW2ZbYxuDlM14JsH8
         e0tRbl7ldgjEDVCjOnYq8pDK1/mvIhq8ZlSrKKFFD8HD5ynYSXPJ88cOq6YuqVCD3S0c
         ClEcWr1myqcNyEsZzv8dwt0KvY2tDfUxkT+8gvn5CssWEB/E59feKUISqGWYftwXZngl
         fT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766643894; x=1767248694;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4w9uwIbipKy4DZy4jYoGNs4+hV0eW+R/XR+IrE6gXTI=;
        b=HuRU381VGI6WAVtvYu9D/cK8oCnzQd3isXkJpsHg6Da0tDoXxdfshksdS6re8YQTWu
         bmJhHohzjRWKj8ZJuo3DF9RPmMDHLw+i2Vbm2Si/2lIdzu9e/1/gXqZ2asb3TIvEo7K/
         oC/qbT7kIvyGXOmoOcWXvLeH4/aMBCA6DcgtLvdweWuC4uZKThw2icQ3t4qigghW/6yc
         W08CE8hKBemRW3q/ambNQr7uoTkCq09xSOXaPXEg9u9GS6vBbLwpvqHMAB/KHFHfCWfl
         aNGLKBW3HhoKcD+wh6DDJVw7PLK+278qcUqilPTeGBwxPNpzcdnluymKqQnxQTPDxvG2
         FEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFfFBa71AtQY18mGCxmo7nMPFfqRRchm4yrt27dey4KfPH7NOtYivN6L96B2IEy76N2zaXQeJo/17LVA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzcz6mA70dvLMOZW+P+owIvEapANtehicGZaN2lEqgANvSeOpE5
	5SorrtbzOrhVcQdoPfvIj0ciFTH3HTYMiHmoFbs3nVuWMv+lJN4p10k10+9UgOxt3l4=
X-Gm-Gg: AY/fxX42NMW+tZzdRKcSL9XkMjhBIAkqdpMxOm/TzplGZlDg7Nc0DKDDfA4UGntDgw3
	OpZqDrhvVmPhx3YaNoNhKpVqYzVsgGg/2+2M5v+IupncmFQ4q6uDMtdr1coqOViJGX5nRtTtRjG
	OXm6lGU2yx6rGWxkq46otdSkJZgp6uoUqszSh14mZmrVuDAIsRZAI2bcA0R+otBjGZ+wnTMtRow
	5kx5dp1C1nWi5pbmBF0J4bS6jhOJtKFLQajDjtAQfSzQ5MD/AbEhsX22/nakHUnH7Xs9/0/aMKq
	PKx6hatuBnpqx4BWOqAcmgphrmL/JA5+Y4YSZf2SgNxTaH34dUptyqIefk28MZVyDnnmZ80Mqcx
	yZSzjxbBv267fLqOXg/k+1IcpQ4BXJe6Rvwx3Fsr8TL/Qx7JnkULR2PjEONVfuOBkNIm4Pkl5Lw
	jERuwXTzmGurulb/Ux9raWDc1erNv/Su8=
X-Google-Smtp-Source: AGHT+IFLWtU4qKEihShuhezxTO9lDSSxFj0Dko8j/Z6S3uN3KATVV89l1O19MjyHHzgp3Owj97LuvQ==
X-Received: by 2002:a17:90a:dfce:b0:343:a631:28a8 with SMTP id 98e67ed59e1d1-34e92206166mr17418529a91.37.1766643894304;
        Wed, 24 Dec 2025 22:24:54 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4031])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e7723c1ecsm9967135a91.3.2025.12.24.22.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 22:24:53 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 25 Dec 2025 14:24:20 +0800
Subject: [PATCH v2] dt-bindings: riscv: update ratified version of h,
 svinval, svnapot, svpbmt
MIME-Version: 1.0
Message-Id: <20251225-h-description-v2-1-b0c66080c704@riscstar.com>
X-B4-Tracking: v=1; b=H4sIAJPYTGkC/3WNPQ+CMBCG/wq52Rp6xIQ6aVgcHdwMQ1uucoNA7
 gjREP67Dbvj+/W8KygJk8K5WEFoYeVxyAIPBcTeDy8y3GUNWOLJIlamNx1pFJ7m3DQYnO9SwER
 1gryZhBJ/dt4T7tdHc4M22z3rPMp3f1nsHv4BLtZY4+pA3lWhdNZdhDXq7OUYxze027b9AFpCD
 ye0AAAA
X-Change-ID: 20251223-h-description-2b9adfb2fe8f
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251224_222456_032955_B4E582C2 
X-CRM114-Status: UNSURE (   8.18  )
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

The descriptions for h, svinval, svnapot, and svpbmt extensions currently
reference the "20191213 version of the privileged ISA specification".
While an Unprivileged ISA document exists with that date, there is no
corresponding ratified Privileged ISA specification.

These extensions were ratified in the RISC-V Instruction Set Manual,
Volume II: Privileged Architecture, Version 20211203. Update the
descriptions to reference the correct specification version.

RISC-V International hosts a website [1] for ratified specifications.
Following the "Ratified ISA Specifications", historical versions of
Volume II Privileged ISA can be found.

Link: https://riscv.org/specifications/ratified/ [1]
Fixes: aeb71e42caae ("dt-bindings: riscv: deprecate riscv,isa")
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Changes in v2:
 - Added Fixes tag.
 - Added Acked-by from Conor.
 - Link to v1: https://lore.kernel.org/r/20251223-h-description-v1-1-98bea93b0919@riscstar.com
---
 .../devicetree/bindings/riscv/extensions.yaml         | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 565cb2cbb49b552959392810a9b731b43346a594..6a4697b36b8d540ac14bcad6373ffcf3db13d3c0 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -117,8 +117,9 @@ properties:
 
         - const: h
           description:
-            The standard H extension for hypervisors as ratified in the 20191213
-            version of the privileged ISA specification.
+            The standard H extension for hypervisors as ratified in the RISC-V
+            Instruction Set Manual, Volume II Privileged Architecture,
+            Document Version 20211203.
 
         # multi-letter extensions, sorted alphanumerically
         - const: smaia
@@ -202,20 +203,22 @@ properties:
         - const: svinval
           description:
             The standard Svinval supervisor-level extension for fine-grained
-            address-translation cache invalidation as ratified in the 20191213
-            version of the privileged ISA specification.
+            address-translation cache invalidation as ratified in the RISC-V
+            Instruction Set Manual, Volume II Privileged Architecture,
+            Document Version 20211203.
 
         - const: svnapot
           description:
             The standard Svnapot supervisor-level extensions for napot
-            translation contiguity as ratified in the 20191213 version of the
-            privileged ISA specification.
+            translation contiguity as ratified in the RISC-V Instruction Set
+            Manual, Volume II Privileged Architecture, Document Version
+            20211203.
 
         - const: svpbmt
           description:
             The standard Svpbmt supervisor-level extensions for page-based
-            memory types as ratified in the 20191213 version of the privileged
-            ISA specification.
+            memory types as ratified in the RISC-V Instruction Set Manual,
+            Volume II Privileged Architecture, Document Version 20211203.
 
         - const: svrsw60t59b
           description:

---
base-commit: 9448598b22c50c8a5bb77a9103e2d49f134c9578
change-id: 20251223-h-description-2b9adfb2fe8f

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
