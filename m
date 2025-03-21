Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B46C35FF3
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Mar 2025 08:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eSAUbROCc0h00o9rCl4v6AngEMCGFxb3dUWame2CIoM=; b=pcgN0KnJ1u76Rm
	j7BOoQOuIjmtStxI4eMpP/AcO/X8DyAL7FeaVQbSfWDYuH4/DneO5z+GHCEdITpvEEPNnfbsRYCpb
	mMbMZRckQYh3O55p9AZPC6cCKfHSb/FWgNwqAq44VFX+RqwNJniXUAWUqOhCgpJ+v5LMQrBk4qvqg
	JDP4DY1/0QxHx/O69aut1zMMLrhEslcQDYOg2bCwTUIrcDsL6e+U0XaImogOi2ga71h2bliFQoIi3
	sv46r6R5XboMRV/kYlruWbEqdNZrbc29mQ4AXjwRjt0Xk9pTnMIyWXcJqSx9ku8P6uRhhRx1EAk28
	Dsvxj2ctenKSsY+pf1+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXqc-0000000EG0c-1I1F;
	Fri, 21 Mar 2025 08:35:22 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvXqa-0000000EG0E-2ZkC
	for linux-riscv@lists.infradead.org;
	Fri, 21 Mar 2025 08:35:21 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-22401f4d35aso35115295ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 21 Mar 2025 01:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742546119; x=1743150919; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KNIYAxNTxrJgvNOeOr0z0lxXWvmJniaTC55sev3rziA=;
        b=NhTZo4Kf1Z7FAKq8IpNEV4CWpM/oHM9DLnO5ZbiNWM1u9a1ELfoxSeHrIn0d1hIL5W
         TbiCf626/lF6wZximCfjcsrgQWnAkafF49AepKXKN0/lO0XNAsuqD2u9Ye7BMnhU8MHA
         Rv/skPfE3okzyn5+Y9zhlXmTBecJrsEzRh8K+ccH+VuzQ1pzx6qX7GM0soBNou1BRBD+
         G84+K3iEndgo+YFqSHXK5DdG8LLzzYTWAP6qvy+U3lLaK2x5/YHGzAuAwg/5wtZWUD88
         lrvUMlK+Yr05zWirsZ/2xOBmCDWb8RWr5h+aZk0DqVRQNYXpmYa/fURdQK3t05/JqDSP
         EjXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742546119; x=1743150919;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KNIYAxNTxrJgvNOeOr0z0lxXWvmJniaTC55sev3rziA=;
        b=U2iG6gumQK2QOohcGbQxH/oMYN3WzVqKl+Y3KZ6Y0f8tR+C/lky/WObL5kTJJ2cDKs
         obul2bU6z4iF0682MD8QuC/un+RE1rduDd977qu5SwrrblNr+qbrEu2zlnCQH7MaW0K3
         yfsKRrV+CZKHEoM409cCCeVkxJeXgFNxHquTAMxzUEv6uMBpNmC4V5mhiQM71zhVRLwd
         5OQxCO3dHYKUnHlvMaH0IHWGQNstcQyMMMKw8IPNvdjPdoaYZUCuWo9QgEo9Ns+oMJWU
         /LnSU9R4r0958XbvH7ftSXHxonlRkkDBYfScIQI3z7Zj12SzbBQhGg/6lFtlFZ6We/9r
         Bycw==
X-Forwarded-Encrypted: i=1; AJvYcCW8JNHlcYXxVsptuluj2DehogWHBw1lXd2wkxSjj1DYg+HPScUifiLDiMkgc1eAs+lx/W7kY0itfbPrCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx6VtGyTEMG0y/TkR6Z3x1lROjuAAxCpHoqEG1mIugYNKU6APkm
	wwRnspWWoodokY1dG4qs3V4ewvewn8ZabS9o/uIHDZGGG8yMxl8smAtrs65oXtk=
X-Gm-Gg: ASbGncueoDbV7dmVTedd956RT4vH/cvGoIPt9FiwReyhBOtT9N3SsY2NI4yYIkPSrWk
	UIApTF8gD4r1aRL4oEzyzoAHPVul+d3rQ+hxKHagfIEIwaP7SCuE3ZgRpXBmiNLm/EJnEHDmEIh
	s2XZ40e+/1Y0n7/wiJv7eCl6+l9y0RBI9FkUrX6pCiV52LRKmJLqqvgi2goCYjI/oissxnjUggW
	aiUhLxHhcjgrevdrwCJlR4tgui/Dt/TFdpOui+/rOjov1fTAYyqiO56hmktPljc3T8uxGR2aZLl
	cSB9oxKBqAFfBGc473sEQEiuhR2S+xUc8Z7oftg76lvHS92+olpWt5aPV3wJP5KJ+poTJaksvWF
	Vkg==
X-Google-Smtp-Source: AGHT+IGXFGLuEoU/vQJUliqJjmPIq4zF6xy634F564ds+E0ZTlK8S163nLM7MaGqqNkry0aYcIfGgQ==
X-Received: by 2002:a17:902:ebc9:b0:220:c63b:d93c with SMTP id d9443c01a7336-22780e234c5mr34978645ad.44.1742546119383;
        Fri, 21 Mar 2025 01:35:19 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-227811f1462sm10857625ad.210.2025.03.21.01.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 01:35:19 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Nick Hu <nick.hu@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
Date: Fri, 21 Mar 2025 16:35:06 +0800
Message-Id: <20250321083507.25298-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_013520_656404_FB0E77ED 
X-CRM114-Status: UNSURE (   9.25  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible string and property for the SiFive CLINT v2. The SiFive
CLINT v2 is incompatible with the SiFive CLINT v0 due to differences
in their control methods.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
---
- v3 changes:
  - Add the reason for the incompatibility between sifive,clint2 and
    sifive,clint0.
- v2 changes:
  - Don't allow sifive,clint2 by itself. Add '-{}' to the first entry
  - Mark the sifive,fine-ctr-bits as the required property when
    the compatible includes the sifive,clint2

 .../bindings/timer/sifive,clint.yaml          | 22 +++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 76d83aea4e2b..34684cda8b15 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -36,6 +36,12 @@ properties:
               - starfive,jh7110-clint   # StarFive JH7110
               - starfive,jh8100-clint   # StarFive JH8100
           - const: sifive,clint0        # SiFive CLINT v0 IP block
+      - items:
+          - {}
+          - const: sifive,clint2        # SiFive CLINT v2 IP block
+        description:
+          SiFive CLINT v2 is the HRT that supports the Zicntr. The control of sifive,clint2
+          differs from that of sifive,clint0, making them incompatible.
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
@@ -62,6 +68,22 @@ properties:
     minItems: 1
     maxItems: 4095
 
+  sifive,fine-ctr-bits:
+    maximum: 15
+    description: The width in bits of the fine counter.
+
+if:
+  properties:
+    compatible:
+      contains:
+        const: sifive,clint2
+then:
+  required:
+    - sifive,fine-ctr-bits
+else:
+  properties:
+    sifive,fine-ctr-bits: false
+
 additionalProperties: false
 
 required:
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
