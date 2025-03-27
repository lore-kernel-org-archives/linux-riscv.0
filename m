Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCC1CC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yVf+Y83m6PmqxtMItmpJwRJoKdopOAdeXOWyJVyGs2Q=; b=IEsnq+opZ5oNfi
	X9Xz3ne1Hwy1MqMAwXzOHIE8c76S5fHD5HpZKUJZGaw5qgWK6m4132dA3wVBIjr+lS4lntymN86M0
	AykMXWlmCfLz58eHPySVcXQxtgBPxrghV0LrBuIGHN3hWj4TQie7B0IreLVDKhX96aNcV28Et/qcB
	6Ll7bAzFqD6IROlMqEDtUTSqIHvRLPD/ZePCLKAWGy5PZUPIIlKGMcfJ6Tkzkn7pLFyJPtTIYKjH2
	/tyyWD2ZaaBPyWQ2wQkwbfqnNbJuu4ATYYtI3PADHLVokQ9X6EtQ+y4mXZXqmWvDJWfJTznhiEFy2
	uLDZgrTu2+1RI2jR3mQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtDp-0000000Bt2t-2mee;
	Thu, 27 Mar 2025 19:49:01 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1g-0000000Bpe0-4B5c
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-22548a28d0cso40640615ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104188; x=1743708988; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s83Mk6RgxI6aiEowidkzKeBlKABMqOiz10QGBc1rI7A=;
        b=rTebztBh/bdVYynTwm4oYABkR58UaIDL/Ta92GuH/sgXMC3PzU7juz3T1J+oRkQTVF
         9Y6HEEDd8EJufnHcUXzaGtFL84IWjFnjV0rwfz7c5HRY5tEMFlgiwhQGcvk0V25lyBAv
         v3lgZuOcQLCXXEztK/DAyHgcEvF/RycRigD/PLgGEEZOHnzd6qIzoYLwHgdKunUI5yms
         1gPREN5i4eEgxtNv0ruA6LuI8ijWMvD8cgrSj2mRTYhI8TRRDKYI6Meh2+CSYK4dIRrU
         AIzG/Oba+ysIJe1SLIpZfcPx4S8czM0bVjr1xB8gDPNT0TeU+P0c3unK01Dl8oHIrPSu
         HuKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104188; x=1743708988;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s83Mk6RgxI6aiEowidkzKeBlKABMqOiz10QGBc1rI7A=;
        b=RBR/k0UK/wq4TiEUK9HGgaggOEezyoa2gjx+wD27fMmLhhnHeqIy26tQRmQOt8OQl9
         cYrZI2QKaGwroujdGaM3Hp5/i6TbH22LbjwHpKzqZ0euN4NN/oHRT3UZ/MCz1tNEOxqC
         uH9/tFDkDbjCoKVj8lyWkE5rOrdTqah/+yLARSCnXOyhZfPrOuK6c1TZOlrGIChw0OKC
         2yjcgNleTRhlxUNAeQ6SdGkCqcCAtplPpf0TtMTUCFT8OLi76sV0fX9mVmN9GjJ/bYDh
         lmw+D60I+wbhPnNvjwBSFo4TTr9CUyEJo7kb1bzVJ5OmExuqr4gFxzgFprx35RuEQkbi
         HDNw==
X-Gm-Message-State: AOJu0YwhRxIaK8nzX4n6VX1R32ZehObH8K9hfOjd6j5zd0unP3FfQY6s
	u2yseMyn6JaJJ7tjRsG5lUGcP9RQsAM8jcTYGqamhnBkW+jBkIFVE49zByIbaL0=
X-Gm-Gg: ASbGncvkb2Mcgf34sCYJLC2Zin27rin1ypU+jVyipzVoAWyDav2WjT3SV3FfADLi6Om
	/s/x6HNqL80yNu77M0cEZ1jMCwWFXyIzELOTLWILd4GwmA19ynb/20231x6uSVo+MuWF0oG0rOm
	M1eQqSZ695WR/Mx/06mB5F0xqa4unMSSRtmeP7uj/BiIwX0Rq8v3nijkqLxALpG/vOEz13ruzuD
	w4CYEjj/ZPZ8Q//uHX7/LDLWFMkvDy8IIIH0/KXuiCMfbcSeOOC2LIqUBVRcFzTy9vslokvVn4Y
	PFvUG3nfircy2U904qYVMbKUhxsAae8x9NCHNaVLJrQHd/qvzySjWlv3oA==
X-Google-Smtp-Source: AGHT+IHcFi2A17uZl//MFCIpfjuKn+EFOYp/l4E4mHRTjmt5boV1yhfvP5TVOYsG92qRlQyi5Fyr8Q==
X-Received: by 2002:a17:902:db0a:b0:220:f59b:6e6 with SMTP id d9443c01a7336-228047fbe38mr65571275ad.8.1743104187938;
        Thu, 27 Mar 2025 12:36:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:27 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:51 -0700
Subject: [PATCH v5 10/21] dt-bindings: riscv: add Counter delegation ISA
 extensions description
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-10-1ee538468d1b@rivosinc.com>
References: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
In-Reply-To: <20250327-counter_delegation-v5-0-1ee538468d1b@rivosinc.com>
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
X-Mailer: b4 0.15-dev-42535
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_123629_072149_B8C134FF 
X-CRM114-Status: GOOD (  11.15  )
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
index c2025949295f..f34bc66940c0 100644
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
@@ -695,6 +710,36 @@ properties:
         then:
           contains:
             const: zca
+      # Smcdeleg depends on Sscsrind, Zihpm, Zicntr
+      - if:
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
+      - if:
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
