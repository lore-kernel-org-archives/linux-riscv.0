Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B48C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nneTPa6n14BSuqw5V3kx0xdun48lR/kvsPfis0A38Ak=; b=Qk58yZPzeawTmV
	BJlFPoas6WF0z/0PrhXpN6QQMEB4RxMnkIckB6Ho+mvelXMf2yE0tNPgPy6zFFc8Q3dL0SBS0npG7
	w+uqPpFYuD60PLwLXTsjLx8zB+G9wl/IucIG/cWbkyuWqlzqswHY3HHNbonI196u1T3SdCQfP8nGz
	EfMNFF0AOKVvMEvRP9M7aga78bVMfodR7nUjMqFiZJQrWNNqV6HVnitiJvFEBLM1VzjdqJJqXCpCA
	Jqpc1XZJ0IaKmXKexwh+E79yBfDxKNo5mWJ1TKacIdD27Moe8R4MxX38s5RKr/c05pZTVeSweCgib
	rVy7xe1zvP5nNQzDwsdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vxH-003EFA-3A;
	Wed, 22 Nov 2023 22:44:23 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5vxE-003ED5-1j;
	Wed, 22 Nov 2023 22:44:21 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-1f0f94a08a0so203325fac.2;
        Wed, 22 Nov 2023 14:44:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700693058; x=1701297858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9DHIDd+1coJ1issLj7LfnrEV9ADKsNgebdRxQ/ZnRwA=;
        b=hussHRB+cT/f4nW6MxvKA5kep6tJLW194xziIhjXlcW/z75L+QMkqwxtcoBEAUL/0y
         1h4Hs2t1+F3pdOTbjbA/7E8VEIQkaWRfFAzKmZpHq+lMP3VDi7PVrrNuOHCNBmOTjMyn
         YPTpAB7qXvoMWn9MwOSrLOFPgG7cuE+h3sVevvGCgf8CDGSolIWm9ChiouuVlTZxXlTZ
         KlJXq21nkw376qfjN1WIufP4cCOrtBrdHCCdqvnqd4Cn78gA56W7xeWktAKSsTpTwr7d
         OK80ddYGTJno5x5h1VFwTOSzhqsgsbQRchXmlF0diCviCZupIUNPWa1kOd/9qeP8Ujry
         uwZA==
X-Gm-Message-State: AOJu0Yx+CiHL/bY8BeOvJgEjAd+PZnG1iArmtveEkwyQD6ref8C2giP8
	5X/t/tLLUyljMdv6w3Wjcg==
X-Google-Smtp-Source: AGHT+IH54k3Wt4YCyLNeCPNtxdcOcnzfdu9XRieLXF2USnfJqpXF8QjTk8RLDRkHS0d9SOXRDgqRrg==
X-Received: by 2002:a05:6870:5ccd:b0:1d6:5133:2f37 with SMTP id et13-20020a0568705ccd00b001d651332f37mr5144535oab.48.1700693058677;
        Wed, 22 Nov 2023 14:44:18 -0800 (PST)
Received: from herring.priv ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id j27-20020a02cb1b000000b0046675345998sm98374jap.96.2023.11.22.14.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 14:44:18 -0800 (PST)
Received: (nullmailer pid 2809289 invoked by uid 1000);
	Wed, 22 Nov 2023 22:44:16 -0000
From: Rob Herring <robh@kernel.org>
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: perf: riscv,pmu: drop unneeded quotes
Date: Wed, 22 Nov 2023 15:44:14 -0700
Message-ID: <20231122224414.2809184-1-robh@kernel.org>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_144420_569449_DF202E95 
X-CRM114-Status: GOOD (  10.52  )
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

Drop unneeded quotes over simple string values to fix a soon to be
enabled yamllint warning:

  [error] string value is redundantly quoted with any quotes (quoted-strings)

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/perf/riscv,pmu.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
index c8448de2f2a0..d01c677ad3c7 100644
--- a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
+++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
@@ -90,7 +90,7 @@ properties:
             bitmap of all MHPMCOUNTERx that can monitor the range of events
 
 dependencies:
-  "riscv,event-to-mhpmevent": [ "riscv,event-to-mhpmcounters" ]
+  riscv,event-to-mhpmevent: [ "riscv,event-to-mhpmcounters" ]
 
 required:
   - compatible
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
