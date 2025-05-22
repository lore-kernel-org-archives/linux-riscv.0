Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7B9BC54ED1
	for <linux-riscv@archiver.kernel.org>; Fri, 23 May 2025 00:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75PECl6TozLNVAmWH00gB8nQyLjaB/002erWEoPH4SQ=; b=P81nYZ+UM1dmCU
	2dEMPscqpcnARLmm1dzPxE+VG0ybBQBXAOxNRoilsffp9FSA/VfzeM0I9z+GzvZ/V80mzcDKprcBf
	KTqV2XJ9ViavU+Y75PmugpkX92bDWf2ByE+GF3qH/9fwmXGTE0r+NV6bHe6cUV3ziAJm4lEkVoo7D
	tyaMq6Cw0RoGoNt5t7/Fi4tDGeWTlMecrY3cb2X4KZjC8san6Uj/SP5Sgh35hzWbIGfRrwSU+clH/
	+Hhze8Y+hWTdRzJHMtmd+G8xe2IdvNj5xN+ZBw+NVkP9rlF1J0Av/JOKjv7qZ+xpfk/XR5VMjm+dZ
	WqyDP+vrB0xF3fhOSoVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIGf1-00000002bmj-0yZ9;
	Fri, 23 May 2025 00:53:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIFIu-00000002Rp7-3nTd
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 23:26:27 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so69649265e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 16:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747956383; x=1748561183; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2TGQ9Um79TGA1rdJIfqkWtDlxZ0F5uqHcIUUMheXtuM=;
        b=t/rOV+qhYim1Mt1m3WDaFVZSQ1MhGI29juHQcFUrbjfT2bzwffQnAVrd9e38h64aAO
         eB6/3R23A2ZXIVhCgM/e8rb+XY5sSCa5d1Jk33HYi4GRm5+7Z4UfxCQn+igyctmj1ckt
         Gt9p0sc6/YUcqPlUuiCagTHHWZg6u8ZSSYYPyLTSke5vnA4MVBOo+nhgfDMy72fXIKA9
         KsOg+VKYK4ovgljzZOoSw51k3Jj7q5bLPOo3TZSSroV1WQYrdWKxjhYh0+rZFO7/6DVb
         1AepoIaOLhLqn20BIPqG0vM/R5z/gKaFHfsyTeanBwYl/ftFzvFebX2OoYGhVsAG29Nx
         PT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747956383; x=1748561183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2TGQ9Um79TGA1rdJIfqkWtDlxZ0F5uqHcIUUMheXtuM=;
        b=P90++Eox/llUyfGgviE47kNPpiN8x46gWnVZ0zOLRU59qUBNA7ATJwsu3HlJQ2HzPz
         nMUSPAfESAdTLybq1gHWc6/X0VRdu94bb+rOfhtjlqhltp7VNqCWk+3LXuv9L/0WGqUj
         kH59uweHRasEds9LXKQOHY6Ns6mONP4G5uw7JaAYMy4ZLchl8trc8txLiG13bPGAkgws
         r2yuYhqeWWfs0Fb9QxK8Nc+qhO7skdYC3Nh6B5IKpvuLlZWnTgiOrij+QGHLztJNVChg
         TvaPlEVPUiY6PMvc+vgRPo7oTzSnxspAaNbCxZ8bESmFZchb6UCt2n2EDORyXBBGDb11
         C2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCV14Gfg0zDH2lXcFmk9NzJxoKA0Vgohf8l7Du4N2z5nxslNEbLi3NyrHYrNpBYxdwX5vHbSqDb6in3MHA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTh/5647PH26aZFsicPqAq8i3cMoY7GZ6eSz5R2Vj59sbFkat4
	mXQs9wqvkYkMfcWB8f/6ZvhbrUy6bwV9qGTvGgKjnSTeKG5e4BcicSDTo30ZmsU/ZGc=
X-Gm-Gg: ASbGncsKM1oflJrm45oIL/9Czyeujwv+qrXI8vuE028ZX1XB5JMCfRBoO59byEVpp+Q
	LDuPqHvowck/cj3llqXWl4IxT1bEQmi9NTqaMWOMHxRAoCFnPKLfiX2jHAxPxAklxeSG3EsyqqA
	WbQNSvzK9EHKwKMSSQJATlcFZdWZJr+BOagc9vY6RsgAvNAdkUkEH4ERsZwdr9+UWUqTRiqtgj1
	ckt2K+sfqqCNt9MCf1UoPHribbFTETtq+WbQdJi0BeslJJ5UeYuTBv1xTnl/Oy1EyYQwuQlCiHl
	H3XO06Z4w580HFIrcYpF/MjL6N3/cNaZrAlwAlNvvSsIj8kq1IG1tg==
X-Google-Smtp-Source: AGHT+IF6ivtK0jlTOWplkDrHgDgHgJQdZAf+be8xON8uguEYmscbWhUXECsK2nYD7OUkDLNgE9SoYA==
X-Received: by 2002:a05:600c:8207:b0:44a:b9e4:4e6f with SMTP id 5b1f17b1804b1-44ab9e44edcmr45387425e9.16.1747956383213;
        Thu, 22 May 2025 16:26:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:c7c:75ac:6300:c05a:35d:17ae:e731])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f6f04334sm117825395e9.10.2025.05.22.16.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 16:26:23 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
Date: Fri, 23 May 2025 00:25:13 +0100
Subject: [PATCH v3 7/7] dt-bindings: riscv: add Sxctr ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250523-b4-ctr_upstream_v3-v3-7-ad355304ba1c@rivosinc.com>
References: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
In-Reply-To: <20250523-b4-ctr_upstream_v3-v3-0-ad355304ba1c@rivosinc.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Beeman Strong <beeman@rivosinc.com>
Cc: linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, Rajnesh Kanwal <rkanwal@rivosinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747956375; l=2497;
 i=rkanwal@rivosinc.com; s=20250522; h=from:subject:message-id;
 bh=4/41jFZ7X8VawKTZS2OnRtVeXztOo2HbkndVhYtr+SA=;
 b=jbzPeS5MNGd7AFFPThGCJziNnql/9Fc4HHGH91C3BLqfIJnqOWhSXa3ocJBdIz4rrC/pVNW7X
 eE6pHLfkSXrBFviRejtBWb+GcQKMp69KtkiO2MuH6iYL+oRko9WVfgD
X-Developer-Key: i=rkanwal@rivosinc.com; a=ed25519;
 pk=aw8nvncslGKHEmTBTJqvkP/4tj6pijL8fwRRym/GuS8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_162624_973160_5488FF81 
X-CRM114-Status: GOOD (  10.63  )
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

Add the S[m|s]ctr ISA extension description.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml      | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index f34bc66940c06bf9b3c18fcd7cce7bfd0593cd28..193751400933ca3fe69e0b2bc03e9c635e2db244 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -149,6 +149,13 @@ properties:
             to enable privilege mode filtering for cycle and instret counters as
             ratified in the 20240326 version of the privileged ISA specification.
 
+        - const: smctr
+          description: |
+            The standard Smctr supervisor-level extension for the machine mode
+            to enable recording limited branch history in a register-accessible
+            internal core storage as ratified at commit 9c87013 ("Merge pull
+            request #44 from riscv/issue-42-fix") of riscv-control-transfer-records.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -196,6 +203,13 @@ properties:
             and mode-based filtering as ratified at commit 01d1df0 ("Add ability
             to manually trigger workflow. (#2)") of riscv-count-overflow.
 
+        - const: ssctr
+          description: |
+            The standard Ssctr supervisor-level extension for recording limited
+            branch history in a register-accessible internal core storage as
+            ratified at commit 9c87013 ("Merge pull request #44 from
+            riscv/issue-42-fix") of riscv-control-transfer-records.
+
         - const: ssnpm
           description: |
             The standard Ssnpm extension for next-mode pointer masking as
@@ -740,6 +754,20 @@ properties:
                 const: zihpm
             - contains:
                 const: zicntr
+      # Smctr depends on Sscsrind
+      - if:
+          contains:
+            const: smctr
+        then:
+          contains:
+            const: sscsrind
+      # Ssctr depends on Sscsrind
+      - if:
+          contains:
+            const: ssctr
+        then:
+          contains:
+            const: sscsrind
 
 allOf:
   # Zcf extension does not exist on rv64

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
