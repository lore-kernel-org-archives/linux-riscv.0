Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED6AC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HPjfe9wvT3Ji7Hf6FKr321UJV/P+q28WU6zmQc0MjvA=; b=O2ZjrGph9EkaCG
	hBj6g8FNd9x3KApKKEBBBEg/1LGSNBnEXmGYa6IrOLVK+yejUJctohPQyswPTjkKXkaWm7Z4XiWVb
	OQCx0To49RvG63vFlrCxuhHp3YUsGN1QV6U0Wcegln+EyStdMM4KnhDWojB1Jq2QU6NA8XZsK8bYs
	ts6STnRw7FG1lrvi6cB8GX9zLuF+5tpxUIbTTV15rXMXcpDX/0/W/bksq15ZeFmPVkVfH+KBHkLF1
	pqq2BfnCaE6ZYKgcattSvB/N9ZBB1ISYkUhgEUFeAv5CE/qI6xd4RZXiqtidQ0tHaWwFwT1MZn9Lo
	EaSzRDXlDWWGJiplqKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txtAP-0000000BsFv-0a0y;
	Thu, 27 Mar 2025 19:45:29 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1b-0000000BpZ9-2uh8
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:25 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-301302a328bso2433389a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104183; x=1743708983; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=YT5dUm6WNQ0YcXw1O0GoDkkawjtB5NTI9OJ16GNh0MSa8shr7otHQKhUvfpGht7W25
         mtIdmHQqp3xbG1n07qlUwTHB6w2dif1l0udOxEt6u4qWTaGHVWVugCQAWUkmzK+YutOa
         87Kv0cLD37NoriWrLTQpQ1mku5ASeUjc8Yl4FFjgjRD74a7a7WV0o4wov5jx/cNsh/tA
         ljiwilB+i5L9kIWULzC75+z2oFuITbeAAqiGeWzUopgyYiWfc2pGt2UpqQ87tiDFCX1K
         1hqo3pWQnkBrF4vFzD+yfI1PTC/n4DcXDc/CR6fmmK2R5yhqWahJyV1BcYRUxziYQ5t4
         Y9qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104183; x=1743708983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4ywNrrIlqtPHHPtOnGWyS/tkdlFoi23/SobZTYSCzB4=;
        b=Jr2eGJNQQXXpAjZBUUfMc+y49uXN/0Pk7g/8o2aeuH6NrKTn8PWOmm/Ck0Oczxew6Q
         HRpEuD2OWJf2BefWeKeZTYNQkKNx+FaPAk2ZhVIJIcvJ5amkN2M6q1RZIzTICZD8oSBo
         p3r9ZAgMNYpIu2g76p3K3LoFG8BMRrd8iU0KEfKdozx+tTNWHuAVCmAYRrEo5Gcykdey
         YmB+RAmGdNzFf/izLjXmWzGp6Ey/HohReRB5WGQS0NjZQB3zzcE1640r4nk54T63dY95
         vUGj5yfFfzr5PxuC7K6cyOaNkn3khz2Aswi9u63VBZdBIdbVscOHEyPQGay5dJnHx2/x
         Z1UQ==
X-Gm-Message-State: AOJu0Yxj0aAPaMfP6SAsyFJ7zqoGCpwwH2UM5juBDdsMzfFkHO69FZGe
	znWZ40HNZ/EM3hrKbX+XQdpriY4nXXebyfJRUERrPqlvXE8o9Ek3uZqlAqKi1jQ=
X-Gm-Gg: ASbGnctx4rNoiHQfr3SIYuFOJoQmHuOtMpBxnXLMwrIouBRbo0CsxfdExfyfks4Vcns
	bU/EDEnGgYh5bHNaCZzj/U+W1TTyKv+bLv2ujWo7+/ScTw2sORJeye+2kjfr8leswl6VlPs2bTi
	l7CXim9S4LLjdXTRzxKkJk3voIS0vRbsIU2iIfGieVxwtWs3piNVRp9tub4izlDZTITxihWoRk7
	YWdstINb3dzMpQ3rulrduCA/x4ksi+cqxF0znWco0U2HAKX8/7D/F+20ohlb8apr5H78PZZsnxB
	G5RX/SyzED0O/aMFE3z0CIX/jwWLG/E70+bpGkvBdw/M/8/DueUq7mV4HQ==
X-Google-Smtp-Source: AGHT+IELdinWh4rp6i4iXWGA5H/t+4IAyyZGzK+iwJMmKFoXazqziiKFSDj1cayIDmLBdm814eH0Qg==
X-Received: by 2002:a17:90b:5686:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-303a906c678mr7028440a91.27.1743104183029;
        Thu, 27 Mar 2025 12:36:23 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:48 -0700
Subject: [PATCH v5 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-7-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123623_795885_1403A35A 
X-CRM114-Status: UNSURE (   8.88  )
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

Add the description for Smcntrpmf ISA extension

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 0520a9d8b1cd..c2025949295f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -136,6 +136,12 @@ properties:
             mechanism in M-mode as ratified in the 20240326 version of the
             privileged ISA specification.
 
+        - const: smcntrpmf
+          description: |
+            The standard Smcntrpmf supervisor-level extension for the machine mode
+            to enable privilege mode filtering for cycle and instret counters as
+            ratified in the 20240326 version of the privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
