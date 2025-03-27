Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0707FC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 19:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r2KfaXyEiz9QVv+6Dbtd4h/y3Mp61JRgnk1bULnMPOE=; b=1wJxstggoSQhS9
	cGRah3kCcHX04dVg3k2mOXp6fJ1BusHfgIggsCDgCdTdiSjSKpM/MjCtA3WvkSTBsPFyC8sp1U8wt
	8lvmqEb0WN1A/Hh3Vdcnpp90BfaZyEnQQqiUeUMsRBPlfVwI/lShe1RsLleb5L4V1MafvXEZsPu3x
	/mxqVEONrAoYDbbzCYfAGzmnvFWfuGgrg8cmEfX0S4tBeTf8LNlNuElIv3OR/OLpCIjYIaZDUL2tG
	vg+1PomrwIKmtKqG0B/B83jkXFLsrt/mGo1OBCMIS5g+/sLSUqBX2d9XtWk8l2F/cdPo6AIb5G8HO
	4Hww8v6nNZEZO0spQt/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt8Q-0000000BrU9-2ieC;
	Thu, 27 Mar 2025 19:43:26 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txt1X-0000000BpVw-1LXa
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 19:36:23 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-227aaa82fafso31555735ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1743104178; x=1743708978; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=PwVBWpSGX0jD0UwvozDu0KqNWDPI0iWH8jEEUx0AdQufkmZtOD9VJIWkNL80S+h3LV
         liPxuHKVKUx9Ji/nzhtmaUfExxhp6z6xwwQAH/JMmgFpwqfjsTLZzcuq3FGOmGpSKuti
         mrUaOSOpmvE+areIbpjF2AA7bDImMWWYW5KtcB/DekOtTCCWoSokqbicnAoRBs3SaegB
         37qzt/+AUFxNLG0ePZHClDHP9Z66c1yZJYQfhSGj6dECWDtH9exc5onpi4SYelFmkF0n
         s796QysiCLAb87+hUs1ublyKx+m/KcBpHIE9sPjvPmmSh4dMBXdmQEIYLe0iJXnOyJEN
         2y2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743104178; x=1743708978;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v6J8uS8Dr+ClMIERwU7Q7iLa9i915e3rRw4ioKbElXo=;
        b=QlyH9cn0TVCxP3+T7CEeuAh+7+0dCO2L4H6tZLJl8HWcWCrk3PJYbJMrAA5XuNvjm+
         +kBzs2JdQNVdqMbx4sbtgplSl2YoT6T+bFAkxjoM/hgWdSy+tCaYNcVkDhNJkYazGxGT
         NKZlRQsljThhfA7llZzNAx3B4hgvG8XNZpT3je0GkUoTtxqlsAsR6xePaTO/Kgpod2xh
         BeLThSz4lyVwpCRVJc4TLxLUeNM0pjtMdsgcIZzCWlZiMfCqbO3ZXGT3gPWdpRXhXr+7
         GwmMfxYnucfP1FM/SViI2txvk40iy1XhAuxe2ONHWgioKlJRWxFxk/7dQaaePFPn0Wyx
         YaNg==
X-Gm-Message-State: AOJu0YxADIXNE85h3zeH1ANklwWLXD5z7XwGQVmXXW72GdfQAYQNLqwY
	wcfmwg1xbRcpxEnYghWxGfhuDLOEvywFgWemH2E+S0hVQlQXngiNSctMjZhiPSA=
X-Gm-Gg: ASbGncst3E78QSg6sc3wl7JOCgNHdout7as1UfehpIhJeaCjz6sK26ygO+VKmeULbbJ
	nsttcIHh+M/SrnIDRabyDKrgQjZEq2URXVkoyNndrGuGqjPPiBHCufW+r98rshxUNd4uKRM2mht
	rmAyda59gh5Go2EfElIspUPizh42/ko0N5ZTbSIW7qkXwVkfsbkhX6tqRyDHGjWi3Daq8TJTVMr
	lgxZV2Pwka/eWxrIZq7ATuYyTh6mBCRRJS04OJWqla0Ncj3U2pPujXg/H9RrsUJgqeHeraNYErX
	BAF8UkkPD05MVGwZBDA0JfpFKxaVN+OJZm1gUvRPsOVmbXouRs0l310bX60J8MbyD3Tt
X-Google-Smtp-Source: AGHT+IFOxM4SmbXuuTZ7zfbjNBSt3NF5qSX8XxUdDdxMSJ9Gbp2tgCBb+BZDCQPwqEBKt7x+Gq+pcQ==
X-Received: by 2002:a17:90b:2801:b0:301:98fc:9b51 with SMTP id 98e67ed59e1d1-303a7d5b724mr6622802a91.5.1743104178125;
        Thu, 27 Mar 2025 12:36:18 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f6b638csm2624220a91.44.2025.03.27.12.36.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 12:36:17 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 27 Mar 2025 12:35:45 -0700
Subject: [PATCH v5 04/21] dt-bindings: riscv: add Sxcsrind ISA extension
 description
MIME-Version: 1.0
Message-Id: <20250327-counter_delegation-v5-4-1ee538468d1b@rivosinc.com>
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
X-CRM114-CacheID: sfid-20250327_123619_364284_B9957EFC 
X-CRM114-Status: UNSURE (   8.87  )
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

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a63b994e0763..0520a9d8b1cd 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -128,6 +128,14 @@ properties:
             changes to interrupts as frozen at commit ccbddab ("Merge pull
             request #42 from riscv/jhauser-2023-RC4") of riscv-aia.
 
+        - const: smcsrind
+          description: |
+            The standard Smcsrind supervisor-level extension extends the
+            indirect CSR access mechanism defined by the Smaia extension. This
+            extension allows other ISA extension to use indirect CSR access
+            mechanism in M-mode as ratified in the 20240326 version of the
+            privileged ISA specification.
+
         - const: smmpm
           description: |
             The standard Smmpm extension for M-mode pointer masking as
@@ -146,6 +154,14 @@ properties:
             added by other RISC-V extensions in H/S/VS/U/VU modes and as
             ratified at commit a28bfae (Ratified (#7)) of riscv-state-enable.
 
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
