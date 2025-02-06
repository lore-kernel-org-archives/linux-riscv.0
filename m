Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7276CC02198
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQkl3iX4U0A6+7QJQu3k2gi21dtPaYtng0v1njg1xf8=; b=xORjN635N566pe
	qB2+Xa3tBF+EvVOz8DD7xz9USqieNzS1p53SgSCCEsO842MHLQJJXqRlVrywiiUuaPnrsz6ucsthp
	QbXuaRKUBKNLvNXZx9PRRpcNTah6cX9kvXjLOrgz12SUcvYSJaVtSMZU5lsJp10FgspW42TjZG+Ej
	pkHw2uGlYbKWb4o2VVqXufqQAZGkhR801hFgO6IH2C6XcIKqD/rskNe3rhs2NWjMBf7UHQWEy3OPx
	kT2/HYU7UbNVRwF/4arhrTV7I3C7QDz3Oiu0s4LsTsFk9bLO4pARSV584KnJg59WwZUv1qMY9hVMA
	ea4if1kGW+la5SiIfhTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwQS-00000005bor-1A03;
	Thu, 06 Feb 2025 07:35:52 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwEW-00000005Y7H-1pQU
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:34 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-21f20666e72so12263645ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826612; x=1739431412; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bxHoYiVqgOBhm1wpVoVRMHPjl115bpEgggXMBP5Q3iA=;
        b=xzLy8Fit/VigAm9+binRgu0zhGOGFcp74CH9QJqHO12aUVBIu4wDcoBy1k48+mD1GS
         1XknV1LKkDqOmzWz5x71B8rqsTsBiK3zmSbmOTs0gQ9kr1qfmXdVzY8Q70riaRExPpV8
         DxE5yJ+IXr+CAiGxp9/q5iruyMXcGkUpDK77uLrWlkXk4yvsh3tzPiuqnLqe8jUBsblu
         HU51Kl8KmA/64kYCdmADu/iFiOckgdc7oyOHn0UmQweFwmtISk7ow139jhLGPPG1bBen
         dZFUxIBWPsikZCW+u/oqJHCl4OpUHRrPGQg3YTpdzi9gicXOWmUk3vd8Cb2BktzMcBi9
         ByUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826612; x=1739431412;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bxHoYiVqgOBhm1wpVoVRMHPjl115bpEgggXMBP5Q3iA=;
        b=WGg/b4TFwGOfMR1s6lG8CxSZ/O38vlo8kiEz+7sAZZ8Kp6XmceulP3kIWSjETf9jg6
         Px0zmNM2y7/DTJH3IB1/YWy2pttm9hxFtbPnRhRxk3f3xsJV98EfthsHPPPEdssKFcqa
         JVPlXvxWwRcP9CgPF2iiAwNjszeBIUHy+tgyTHkwqVxQlgOMm6doqtlGl5HgMnggDS8q
         lP5ktP9B7i/WTnB3pFiBOHSEEI643evT+zY4IQmiz8ZLllshkHcLI3/kR9m5ytp7mAyu
         jBbiehpDDD0uHCX4JWH8RnMxiMnC1zrDeZo28z8oOEjemNaarEa/e1hwPjEgUuvjlJFq
         I9Jw==
X-Gm-Message-State: AOJu0Yx8DxaRp1wPohjWou8xLe24RH6+1niLXetelxPd2OmKKkeSCv46
	4Z9cVPLLeuWohHnmmI3i+pxqysFCJvg/ysae18xtB92njOlPaDAdk75Y/0uyWQI=
X-Gm-Gg: ASbGncvARFRt+xrvAgVibj50wXkSDsrJGWLaTRKgHs+ib58VoogOjLKDVrvDSDWkgND
	tNnaJNydGFubKlfNzltH10+m1U7rb6aTEZ2+5QPfJ2KXMTudKE4ACqvWo+Xw429HvCTznKNTgHg
	8EQnZlsNehVaKhyfUC5yA39iYKIy//Lj/PdspnpgtepzYc+MxCRy7ND1nkVByCrTdwrWDIb3nzJ
	Ut07cp2Xjys6HqnUGjbBZxuitDegdbut38ffF1Q10JLHsKCTXTlN6phRRqbaNyaglHV1jLupwYS
	bYafmbYsbd18Z5woQ7ZEDUBN0EhB
X-Google-Smtp-Source: AGHT+IHdxb765FF/tuEHMIXniBEbzBGChueSqoBlXVwelYSzs5G+a6kTSb+Hcc24wmC4wtSYLVHKkg==
X-Received: by 2002:a17:902:f64b:b0:216:7c33:8994 with SMTP id d9443c01a7336-21f17f32366mr113621535ad.53.1738826611778;
        Wed, 05 Feb 2025 23:23:31 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:31 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:15 -0800
Subject: [PATCH v4 10/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-10-835cfa88e3b1@rivosinc.com>
References: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
In-Reply-To: <20250205-counter_delegation-v4-0-835cfa88e3b1@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atishp@atishpatra.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
 Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, weilin.wang@intel.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-perf-users@vger.kernel.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_232332_523112_2DC18FF4 
X-CRM114-Status: GOOD (  11.24  )
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

Add description for the Smcdeleg/Ssccfg extension.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 45 ++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index be9ebe927a64..b20dc75457d2 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,13 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcdeleg
+          description: |
+            The standard Smcdeleg supervisor-level extension for the machine mode
+            to delegate the hpmcounters to supvervisor mode so that they are
+            directlyi accessible in the supervisor mode as ratified in the
+            20240213 version of the privileged ISA specification.
+
         - const: smcsrind
           description: |
             The standard Smcsrind supervisor-level extension extends the
@@ -175,6 +182,14 @@ properties:
             behavioural changes to interrupts as frozen at commit ccbddab
             ("Merge pull request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: ssccfg
+          description: |
+            The standard Ssccfg supervisor-level extension for configuring
+            the delegated hpmcounters to be accessible directly in supervisor
+            mode as ratified in the 20240213 version of the privileged ISA
+            specification. This extension depends on Sscsrind, Smcdeleg, Zihpm,
+            Zicntr extensions.
+
         - const: sscofpmf
           description: |
             The standard Sscofpmf supervisor-level extension for count overflow
@@ -685,6 +700,36 @@ properties:
         then:
           contains:
             const: zca
+      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
+      - If:
+          contains:
+            const: smcdeleg
+        then:
+          allOf:
+            - contains:
+                const: sscsrind
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
+      # Ssccfg depends on Smcdeleg, Sscsrind, Zihpm, Zicntr, Sscofpmf, Smcntrpmf
+      - If:
+          contains:
+            const: ssccfg
+        then:
+          allOf:
+            - contains:
+                const: smcdeleg
+            - contains:
+                const: sscsrind
+            - contains:
+                const: sscofpmf
+            - contains:
+                const: smcntrpmf
+            - contains:
+                const: zihpm
+            - contains:
+                const: zicntr
 
 allOf:
   # Zcf extension does not exist on rv64

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
