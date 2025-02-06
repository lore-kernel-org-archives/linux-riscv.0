Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5535C02198
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Feb 2025 07:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lix5SmbZfrKca7YHGqoI2Sdp9+yO5HC+T7X0NFJSbAg=; b=Y5GWnq0ejj36Q0
	lcWGtnWyCcJANStvQdWyMeWz9J/kbBSHdXZS+njzscLoEY5b2k5a1RnAm6cVp+Ki59XBsGMv8wtIt
	PhoAWj+G6h8Dlkky/oaT53QRq8DoTF837MI/5g85yH9D12QSBgYLhqVqAUd+CRGejTBbObjtpUXyI
	v1BKGA1crcIarJMLj/5kRSklGa2kDQfg48Wm6ZZJOMZl7ZHAzJ4yR/OMAC3x+UpVSjP73cegHook9
	YSaXZBvbvJhiFcVDqnDnhvZAs3ZpDsH9hJXSfthCO+hq651HQjekP0Qnhs6O1UCWEQtL+D6c2PyIw
	KeZ/rWBIsNFuOfDhMQ/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwMQ-00000005b2i-2Cr3;
	Thu, 06 Feb 2025 07:31:42 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfwER-00000005Y2P-2ynt
	for linux-riscv@lists.infradead.org;
	Thu, 06 Feb 2025 07:23:28 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2f441791e40so770613a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 23:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738826607; x=1739431407; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=ox2hM89X/h2Q7gAIvwpIenb6JJX5gJwZJPK2rjhnMlfNNrR8z1ab1XIcxjE8MltzIL
         YddkLF2u3Zz8ZLKfCxa7gv6A6LUV6HNtHUBP8VYGdf3a7B9dpmv1J6Sk7K80Bb7QPSS1
         BA6nSsokEKc9oGDyK/AYa+04LMJnXEaI6y7sBJ2FTRzfgQE8SU7cBAxCfeLUUV6Lwh+N
         nH6SH1uwsr+uOgO3BZ0uUYOW/xWTvAPT8XBm+6uJldMCDwKSoQrqRy2iptrLAhUquCyW
         07SA3JMfzlDbN8Ixx7xEZGELPhnjMz9DUbUJQ3adj+7q1lkEP0RGoC+mjLqZkubyfPXV
         tGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738826607; x=1739431407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d05MBVkD267pj0+O4130zpeTcKFWk4W9qDVXtG5klp0=;
        b=X4towd7ui28EBANMIaPjFMOAb1cq0rCcHSQvEWA+Z/lCEiV9cukUmogtB+8roUuoxR
         7rtfAb/GSH2K9z56BU9zCGn6tdyH6E8R6ghTD/kXujibMnFyuh+JtgfqUJRJ5p4Al0GP
         gBCjJtqxKuDtetlVhwXQFlcyslkKfx7+ULcFUjyuNssZ60T0CBQ8nuAou1l43fzLLF3F
         +kOKSfnpbFexzgNUTb6MQKGvVlJ6FDYrjSUPD1N6mypFVciEb1S+mwJKJ+G/I70xkAQ3
         tcR1XSmHREGl9/Sa7meeBCSdz0uCGStPu5S0Brsj6oUhX5fNbpAneqSk0zMVUUonQCa1
         64xw==
X-Gm-Message-State: AOJu0YxDH6t+zHFDcHnxnMQEooadq93pootGw4TrW97M+c9+r7lfNlbW
	eukHtWE/Vp958fUD6rqp0cJNg2gCy79COrKbJvXlMYfNECzLcbb0HctauY+2/ps=
X-Gm-Gg: ASbGncvvoHpyWvoxbb+58raaspF27fVLhaSa57bRi7wmaB1Rq7rlE97NMMSOkFkPV6J
	HHsCPM1BBjf4tWhPSNXtxiopYNCQ1fWA/BwgRiWh5r2gJryDoU54zV2Xak2bN1gcQWy+A1/lptr
	NVNNHV0rlNzH2zVlite26IgAgCqt3o42lchn87bhlDd2s7sb943k2iSFGf5QGfXG6O/Kr94X+BN
	EDVP+8K8qWB7qRLnqNsih7A6lxoAnSCWyY67nO47S01CxES9Siie03sB7Ix/0TTO6CcZtR7FZnt
	r/y1NKYmq6Ei4s5L7VbZ1x9OWFOC
X-Google-Smtp-Source: AGHT+IFKe2kQczxclY80PslHuvYzWPmjNnKAp1q2ypYQZ9arePKPx5YXWSLFOApkuW37i5EznoN6cQ==
X-Received: by 2002:a17:90a:d410:b0:2ee:cd83:8fe7 with SMTP id 98e67ed59e1d1-2f9e08682a8mr9427110a91.35.1738826606814;
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fa09a72292sm630883a91.27.2025.02.05.23.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 23:23:26 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Wed, 05 Feb 2025 23:23:12 -0800
Subject: [PATCH v4 07/21] dt-bindings: riscv: add Smcntrpmf ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250205-counter_delegation-v4-7-835cfa88e3b1@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250205_232327_772962_6BBDA106 
X-CRM114-Status: UNSURE (   9.06  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 42e2494b126d..be9ebe927a64 100644
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
