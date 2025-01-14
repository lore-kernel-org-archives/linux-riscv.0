Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1A1CE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=01ohGbSh3bvsLL/9P6+wSadBdNau7on/mNQkLlsLpac=; b=4qo1B7cGIfCt6s
	r4WR14E++6VV9/mT+g1Uqf2FdL3HzHCabShgOjembz6Xr7wktBRPAf3n5VJBUBICbK8B73EVq0XkO
	BiYQEIBM+/tBkZhAAdNzUEp1mZZvQag1DD9PIxEstnWXzb/oBdeLLFmnzqVj2wwWpnl/1YAGPZrWR
	MzGKkwFBJz8qDuM7biUO7pY9f988ZhCYn87uhD6w579L03JUrsPkHT9oR1zBizEem8Hr5G/2QWKNk
	0vrXFl7z5ayhoXqpB4CYG2OOoa0hshnQnl2NeRozD+c6ZlFumTiiikH4S9iez7r7wQiJ60jmVIaFH
	V/40eguqjIF3qv2ZiaNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXpxk-0000000A29i-2J02;
	Tue, 14 Jan 2025 23:04:44 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXprc-00000009znD-3icQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 22:58:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-21a7ed0155cso105144355ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 14:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1736895504; x=1737500304; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+nuV14UWlVLpKqlK5QJyBaxP+s4wgcBZS80Qr+dhQF8=;
        b=c1RaLdvo+aIWIlyDyFlBJcIouc2F0D+SyJHodeeL8yiv2CiyCpjZfpdXc0kJZ3PDBN
         EXUbKqPZPYBX1dC39CMM/D7YAdGdfIdscP+HdytM8LxAy1O5u0kAtrxNZ5DBkZDp4sCO
         2L94r7FqD6AzhdkC4SheeImULxZuSDQALzsx0qy1d+epNrEzvIg1apGstT6C5ZROwW9K
         dDfeR2K9uSN0JSAp9rXzlQ/b4iuMJ429xRdCyvDS3OvCtlxq8SmMMwbftqI/ANGGo8hH
         BJvNDAecwoPYDRu3RyE3DojmUO5pJFxFFbc7pVJDrJ5gHZbipM4psVP6v4GlQDQ5Yvg8
         B9Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736895504; x=1737500304;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+nuV14UWlVLpKqlK5QJyBaxP+s4wgcBZS80Qr+dhQF8=;
        b=ZOh2dkkVBIKhAHfB3z3TBXOTJj8vmVKX/mWqw33Eu1NLQKZonuZEMIyGRi9ZIVKUHL
         0ftI9pWYJvZkbo5UJ9mwTJRHo47tBEJHktrugmIx7QqZP7wkHlkdWDiLqHqdBupVjEAB
         rcXV8/Fgk9D6YILN90F0mKzD1cbhWPCS2AiEpU4Kzb3QYQqaMA759KY2MaJK7W5jy5bK
         irooEXebZ0x9IkkFSeaV6Ao102+hBJlRe2bh7vdelDUF6ub3JnSEhskc3bvRziWwDSmI
         tSE2CJGnhxcyjTWB94SQR3WOL4FW8N+w0fEy+r9BPbPYLIn93UixMr0atcLSKJsTIt0+
         xOoQ==
X-Gm-Message-State: AOJu0YyB115SRuwMRUwwCe3lve3CtqW0LjmheGgcugCxDvjmw0oq6ao5
	+q3/aH8aM2+2YmXeOhffu1zwRRdFYKfcGV3qPCVlxY5avyzcM1lv7yK7+b+nrPc=
X-Gm-Gg: ASbGncu87sM+vl5BBgwfP4iMDIaY8Lu02IGNaeAojAZ7khisvEE1z6qi4u3uhNy7jp/
	j714c4N3Q1VAFsguczTya5AhgH7gwmXKwkfFjVqqMIeYZuWXBHQ+yi82yPC4+sGjPSk5ELG4xKA
	WYpI/UJlC4556BqOf7whD02lETWtdEI3yysL/ev16CFgADS4JJXC/kmNQf6B8LkGTNpFryhkS6Q
	x6UXJ1wCSxIX2nU0wiYA+/CPJRWHULg4myh2RcpXkFCXZmK1dWqd+faE6PPmkCg+5JA5g==
X-Google-Smtp-Source: AGHT+IEV9xqrGE2EwbwN10kTDKoQE5y094MCv+vKIzLtISYj8DvmatP2DVPnEqTLBoPDrnLS9ZbWpg==
X-Received: by 2002:a17:902:d2ca:b0:211:8404:a957 with SMTP id d9443c01a7336-21a83fc0619mr405796975ad.41.1736895504307;
        Tue, 14 Jan 2025 14:58:24 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10df7asm71746105ad.47.2025.01.14.14.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 14:58:23 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Tue, 14 Jan 2025 14:57:29 -0800
Subject: [PATCH v2 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250114-counter_delegation-v2-4-8ba74cdb851b@rivosinc.com>
References: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
In-Reply-To: <20250114-counter_delegation-v2-0-8ba74cdb851b@rivosinc.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-13183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_145824_989444_10FAAF95 
X-CRM114-Status: UNSURE (   9.15  )
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

Add the S[m|s]csrind ISA extension description.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 9c7dd7e75e0c..0cfdaa4552a6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -146,6 +146,20 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+	- const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Smaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in M-mode.
+
+	- const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+	    indirect CSR access mechanism defined by the Ssaia extension. This
+	    extension allows other ISA extension to use indirect CSR access
+	    mechanism in S-mode.
+
         - const: ssaia
           description: |
             The standard Ssaia supervisor-level extension for the advanced

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
