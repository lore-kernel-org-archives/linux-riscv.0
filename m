Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A10C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NEa8XQHN78pV67+JS/oFj2j3n+PKY9CMfwdD4CV25W4=; b=SqyCdW/fPaWIbl
	xwOuSJBjFmHNwGXUDBT4kSauIQm09kmneeSVWLZXElUbF4XI8fZeLC2TG1To5A9YzxikjhP8URb1l
	Ay81jc1TAvUZgXJiEyjUqsq26A+rcNrb+rSR4X1jqrypDsYHA/VElfEh4SxWKHDUlvfkPDiOuHwm8
	V3wyF9EDEw5JBpVrkx8+fKLESab6preZ5j8QdzeaTbKAUnMAdscdSVqvWLXhkBKCRW1AOfziE1hRY
	h3vjd39tAcJXddzu2VVjE9V7NJweZN1CIK12Fu7Kk30iUdod2WrnD9hsQt0dZYCCgCscCDA/XOaQY
	4pG6Sbxz2zpk/287+zCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuS3-000000023vn-3JMV;
	Wed, 01 Jul 2026 12:54:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuS3-000000023us-0SoW
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=; b=RfEWNjHgDmaBGHIrGqK/g7c2gC
	l1Doh7yspd/K+QXB9o32jg6jx6sxFtkNWhvcAQ8GB0KKORdKmD4nri0tECjudUjgHzA40VoKYAF4l
	uKLzO3EPt73bUXlyp/DIUV7fZyKxBAL5kaWPoG7SyYFmjiQ5dJC7sZs0qVEVyOgclnpT/XfQwGKAw
	lMNfcSqOZh060QQXU4hyPhA+tmKXLMbNii+IlYSzhTUKSSVvRCmoOj/S2f8CXlj2ryH5s5a3sPwyo
	UimkJjivDtMiDHudYTBFD+mFtvfuMJQKw6wRM5tFn1hXShzz7J4YWEZNsZb+j3cNFZ+aFZKtDi8v9
	tO19dtyA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuS0-00000002maH-1VKF
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:54:02 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-842338c18e0so362497b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910438; x=1783515238; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=DlKUWDy1b0FZ5DLyj7g+X+2yLoxogiZ68V80gZcNlU1X4USpdUuziCx2kNdudI8HVV
         aDuacZNk9KYw7vf5GTIMZl4AwZ+m6Dsee5reNGKjpi3f9/MTtn/erLgJETbHPuSa+NXH
         nislkYDq/nNuynh+Dm+gBaUJpOmk0jqT+DLsrECpny9t1OBdXsgXaqsZ6uHdzN5+CBg1
         4BhdAaVqbuxQuZY1qFvVqg1x68Vtuy8KRjKxfSUK3I6n7WIQGISLWgvig/D+e2DVxJNe
         ps+7ejvnUyddmlh/OvMp5ZgSf2zOyl+xYoVLZTtZjzxfCbho2zufokXrkchnica+chXU
         UYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910438; x=1783515238;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cf4ggToYkrlCapEBsvBHakBfX1zXebmGeq/ps06lv7Y=;
        b=GPQS4zpZNjdGzsAV4qFF/MBbTunZs/AEjd/0L2P0FxaqACdF3w5JiEDqgx2wSl87u9
         hT/dl8xuNY5VueJnHmgVVuxJp6k32p+p10SqQBVgNILgvjPdM9/G796SHq2LtOvwINf6
         /bvley/KInTnhIvpzIHtU0j8epLZLrctW/OsMoAeiuapYUp0OlJlzRa8nI/ag/eg7gK0
         fgkLC7Onzst7tTe1uGd0Q2UUCuameSKYyu6697qCcZAd4Grlxxcj6Ppt8umhYOQT0EtC
         CzbSP0+2m5FP+nlr3H+3DbXiKE9lpVhw5Tg7ZjayJLNw128/0aTf9kml6GajbtaTYZ2Q
         36aQ==
X-Forwarded-Encrypted: i=1; AFNElJ917vcxB4KicMfsFc81RWDySXSecnxVD3HkRR3yIUbaqZPR1B1S9cWAE/3eVcyN8+1QQT0/LY87OjpKiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1WqGKSHobo2Xaq7hADrpdIJRxt3F8NPeWk2cEdm1V/fIoy5u4
	+6KA3uGWj0X7r1eKOsY8r85OdDgTkVlpDBmM90AFXklWGPx0mFZOSU3u
X-Gm-Gg: AfdE7cl7X8WYZuNieqcURtd1Rg7TAPfTLFUDC/IfI8CTifm9AoD0syFcVxVW3ejxRFa
	xt3AdF1BJCTRFk1vuKcMVGPP6Bm4zbdHzXxurtNsXPcwwSBWO26AH+b4tFRagU5k59U6INHbOjq
	6b0WEfZnlM8OufZEKZ7hh+0Pd+eg35S4D1uzQQ0BxD2aYwmODhQGQLu8nWpCFXz8ODRDMLdmbDg
	4zCkVw6hzKog9sZFlPC9Df8deoQkTjx2WWdBJDT1Yjm/xnk0fNTYQ7kAbzOyAZiN+yzcb7Y4pNF
	V2igJB2RuE+LT9d2HnR1LHKRYrRN3JI7sTzvFoSe8xaoZZ8HLGJigCYr8QI+k3gPFINfFQEph1B
	yGxIST2rwfPJDiv5RgAZs8h6kBRjoegniArnrjqENRYSFAp7Qo5n7tQ9sSF5Y6K9O0tsvMnZTTQ
	uWXsBU3BsuO6qPkC3oWh2B
X-Received: by 2002:a05:6a00:1807:b0:842:614e:cc94 with SMTP id d2e1a72fcca58-847c07c470bmr1460384b3a.26.1782910438134;
        Wed, 01 Jul 2026 05:53:58 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.53.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:53:57 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:21 -0400
Subject: [PATCH v5 08/17] dt-bindings: riscv: Require block-size for
 Zicbom, Zicbop, and Zicboz
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-8-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1580; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=qUpQI6roeceadtMZx+l2gkdH7v1ZAYzyOmrKiTnQRwE=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3tZJ0Su79v3RdX58lNmxpiXmJtcKlQyZK/LSqzvea
 TYzF0p2lLIwiHExyIopshw+2pK99ZVPtO9zzh8wc1iZQIYwcHEKwEQkuxkZOua7fZ3pvVejxeEy
 +4eeNdKc7+brz377VsVu1amK7kMbXjH8007YqzrX6+sFsXM73URmzGLLvRK68UNyxWSL+++Ufmz
 W4wEA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135400_476230_4ADEF59D 
X-CRM114-Status: UNSURE (   8.36  )
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

Zicbom, Zicbop, and Zicboz have no default cache block size, so a
devicetree that declares one must also provide the matching
riscv,cbom/cbop/cboz-block-size property. Make it required so a
missing block-size property can be caught by dtbs_check.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: New patch.
---
 .../devicetree/bindings/riscv/extensions.yaml      | 26 ++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 5ffc40d599c02..f4dd34d446c02 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -1142,6 +1142,32 @@ allOf:
           not:
             contains:
               const: zilsd
+  # All three Zicbo* extensions require their block size property as there's no
+  # default.
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbom
+    then:
+      required:
+        - riscv,cbom-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicbop
+    then:
+      required:
+        - riscv,cbop-block-size
+  - if:
+      properties:
+        riscv,isa-extensions:
+          contains:
+            const: zicboz
+    then:
+      required:
+        - riscv,cboz-block-size
 
 additionalProperties: true
 ...

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
