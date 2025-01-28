Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CEFC0218D
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jan 2025 05:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0IZ91LM8gscRTm6QDvR2yvYgzElsFamA8vp46PHADe4=; b=MJohCehHeJ1xFb
	ZRqhnokc/wp5uLKzLMGlKVAvBTrFuTOcB5BEj3p5kyNFRZet+uDv8ThqCP2VMrajocBmkvk8hqlbD
	sTipHUwNPlCqbJHZ4RFpcMRQw1tREfpAvq656kAmnV7ohT4KS9230vp+d4N2d7EsyAFmM14i1nAkx
	Ge8cs5FXA06oL4pGfmLKBhhceNhuWognjxNk472UJWBFt0/sfZ4l4KdAr0BlKNvCw6EtHWmU3YG50
	jxQrpChtkM93RT1e/yfKwAgQf0GzKTQ1FGSp8k2fPDympqm+tG11EbMuO5TJ5RvdpCoIdU9vwqII1
	tir5W4LxpOp5nuvFkr8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdmr-000000046Ec-1QQZ;
	Tue, 28 Jan 2025 05:05:21 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcdhc-000000044NY-1ipa
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jan 2025 04:59:59 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-2f4448bf96fso6932440a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jan 2025 20:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738040396; x=1738645196; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/3d11Vb185MzE7T3v4uIyT+JXKKpmn0Bb8O6L8LI7W0=;
        b=liNXcdMCg449+fRei2z9lNi7q5lNTvJxVO65Iz6hPf/KPCFrLR+DeLAWTaOlCDA9lg
         2QtmqR9aEnTiaW6NVmS5jsbIKeHP+MjTomkJwkodgt/EiUmXD43KUUQl4Gk8CUeALa3+
         BiOgrM2DzhW0tSgsFyN6agr+zLYc6MFhjGaAq34rAgACtSJyOsdo1IPADGwl3sHWjeOA
         b7U4TH2/UxyM5QDOAAiVfTm+M9AebnEcSaWnAsndT15guTEUhzn51YDhfkTKaGkOI4wY
         NBq+mifRsDVW+XObCUQrpI9UBChlGhs8yp3RR/ncInw4N7bWiVj91Z7DIM+Eaotzl4Ce
         a+LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738040396; x=1738645196;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/3d11Vb185MzE7T3v4uIyT+JXKKpmn0Bb8O6L8LI7W0=;
        b=BMO0NCg1hZdosgLOi0e+Uws1SXDfpXUrz+MP49iTX4mRQzw00k1Iot410d3RHp6Gcq
         ZJnuFIEYgzx7f4NbDqTlL7PbzcyiLy1DMCYXToY9kiK1RqQ8lq59OUPF4wZl5HcModqu
         cO+2ERiV7z0dn+R5W0GpM6Nc59Uthf/amh1z/rqV2NsFEXOnC/EeKVwL+5IPm9cYEGVC
         xovdfi3ea0925PTRilQlxzZengzRUPFKJWYZn+z/dHb7NGIomTO3xxmr1TdKeSrKCg6d
         ZpEia8DgjHmbBc2v3eyohWjOPweHDv1DBCVKqh8L/jAY5UyLFJ4D+KdzX/96vpTmGqms
         /V5g==
X-Gm-Message-State: AOJu0YzbhE+k5SI2TZQQMqOnahMnisuoWbZGXkLs1SU4+km527UETnfc
	q633r6D+Dyt/NcL0vp6ql10qaKIxMUCGMs1k2XZBzpQMaAEm89JQzlUfDq/KrQw=
X-Gm-Gg: ASbGncvu4NzqVf1jm4ArkSmsRB5EopbrrNCN237Zy0Qz2w5LjJhRjWdcXAiUZlnomTe
	TekFq8VHvtXtHHWLEe+lT8pQ1DFjec/KD6R7z1KxKj8mEwPoqQK3jOlTpnoAHiWB6P2o8p4lvih
	BUqODKOEVp06n67t99ADTa/2wi2jlmMSlTMNVy/qkxBztosBj5lGLSOfx/rq8tDwS+BxteHcpn6
	RVQgtNXa4HnNM+vbsthiEtndAs5sm40TMWspqio8PADx6tR66FT/4NSw83orc2maGszzjM52d+J
	UFDTKWMyHoD959H9Cn4Sw9pAYqUj
X-Google-Smtp-Source: AGHT+IGKJLoG1w7HBodanThehp9jcOrQlRY8JCeFJh3f5TphJqozkTpJC2i92zo0GQX5LVcI8mvvTg==
X-Received: by 2002:a17:90b:5448:b0:2ea:5dea:eb0a with SMTP id 98e67ed59e1d1-2f782c4d75cmr60425683a91.4.1738040395871;
        Mon, 27 Jan 2025 20:59:55 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7ffa5a7f7sm8212776a91.11.2025.01.27.20.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 20:59:55 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
Date: Mon, 27 Jan 2025 20:59:45 -0800
Subject: [PATCH v3 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250127-counter_delegation-v3-4-64894d7e16d5@rivosinc.com>
References: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
In-Reply-To: <20250127-counter_delegation-v3-0-64894d7e16d5@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250127_205956_493843_4A219BC5 
X-CRM114-Status: UNSURE (   9.36  )
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
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index 9c7dd7e75e0c..f47d829545db 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -146,6 +146,22 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
+        - const: sscsrind
+          description: |
+            The standard Sscsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Ssaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in S-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
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
