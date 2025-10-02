Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D41CCA472
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Oct 2025 06:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WxneDP03wW8FJDb5G27rHwjxgxG3OMdgJBCaeEzTdY=; b=4Cmwu+wwcosUwG
	fvD0nE6WTc3zcxaRHtzo0q1eu+TtAq8R5fdpd4kwZ3psV7VrLR/CihPmsciqOsQs+unNrrJSYfRMT
	9thOIbpjTcv4lEb5sYXCy78LcwhC2NVfsgrVpyeCE+7wzyl5+NV9QvzIniDeM99Ig9LrBfswmCkou
	kIlGsVXlEAW5NOYVmEh5131u/0KBLvWs6USfgl5ENFtpVUtdecrPyGXTW7VTxBmjOsfMUKfY4lCn9
	EUoDna+SbKjsq9fpEm2JA+Ur/ZlB9BqfjSdaGj2YLiGZIhcnl0HwOU09E0a329KUC9TWZmuaPus+N
	9zm/BSQkHhlrylw7zQFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVd-00000009hku-3KHI;
	Thu, 02 Oct 2025 06:09:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVc-00000009hje-1qMV
	for linux-riscv@bombadil.infradead.org;
	Thu, 02 Oct 2025 06:09:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=MF1UBNl0YQdxkCR2Wq/BcrNYDGhukTT3j7EdaD4pBPY=; b=hXdRG+dTq0NccANvDmBk4XRmhC
	pu9RBgRFsXm8fAh9n34gzzyiasOVxFdktwJB+gyp3SdBWLSXY2k3oQsBztiz2dvwBRIrlSM7GM730
	H3xDnDiexXPpNAb5O+rf6/YgQ8x/r6ujeLHoypQUrX0rHx/bVvl8OMLenbXAxmg7qhaf/rgmbT+Hq
	8SAyQ/2a13/JOzs++Qa0mv6IT5POSprhlzUv6f+x0XQRK/G48RaIciP3nBFsXmptE3k1XUfGtFyqe
	PPTstWjnIawgfalWdLN+1d6FZLxqQKjtQsSOn6PyPtsV5g6Bf8GWsLMgwbp8QdHvfOKSDLdWolUoI
	gQgnDuMA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4CVW-0000000DsjO-3Esq
	for linux-riscv@lists.infradead.org;
	Thu, 02 Oct 2025 06:09:43 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-33292adb180so748199a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 01 Oct 2025 23:09:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1759385377; x=1759990177; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MF1UBNl0YQdxkCR2Wq/BcrNYDGhukTT3j7EdaD4pBPY=;
        b=JImNUV8/KAVg2eTAvwzSA1kof/f3W8eeGOGUdwe8hr8essYGgn0AYsFgdAGfR9VVLz
         BLaqR4Qz93wI+w88f4R0+OoJsbtXQ3fyhez08YRoSnipWYMVWxEKj5sfbAwQJRK1kwHY
         DTcFn8pOk4alpjQCYXCtUEzOUa6m0LtC8AKnKZsrWEoTHJ5bew6TTWHDhJDX7+4Ovzuj
         mAfF15xAhxUJ7hojA59RWi01rJU3fOEriOUyXEe62YYOfnjZotJxKf7nQQRJCjiaPtaG
         E3qToUYhMWagE4v/HlHEj9ionAr/OVBWT6Np0IynxkzfW/ia7I9rnoJk7cNcJc4Pgymd
         LZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759385377; x=1759990177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MF1UBNl0YQdxkCR2Wq/BcrNYDGhukTT3j7EdaD4pBPY=;
        b=vvcRU6iei0q8hK3jICGo0u7l72PNXoUy6rTO4u006zV3OtxcK1pr7XG1uvu+Yl0OuA
         D3oze/JPvynVoLYWL1UeO61htbzSTxd7BzSzGMYHaEfnN+/+gxUvbKddItbFh2yZKGgg
         IitPovUEfHsRsJqlinGgE5NJiIYF6Ot/TDLnpOpwQBPoJUgXyS6ytCThfQ3gTzdmEU3a
         BHb7suahgliqQNJ5AJJ6COTjv0NjhChG3FHhXm35xy4LNdwQV7nCnjbUv/hMV7pU2G9G
         sSTyPXAdyIOJAKyaQ24c8bq0W52vp/AQTXzTITkIkKutsPegFuPNX+APAWU+SWUX8uYv
         NAPg==
X-Forwarded-Encrypted: i=1; AJvYcCW091bS4rOAuaxqwe0Sz/QJ3848PHXn7DPdmCtoG7YXRJzW7/yj8TvqarppfQ/jz+NCuv+4a+gIIhIaGw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1EKNsjcy/kQrJeUgimWicWvSL/x+Ua9rJfD2v9USm7IX02K9V
	vpkQzr/DFYMXUoCyX2faqd1usjE5dUXX3GKjW9RQbSEhjcUv5+V5pWivsgHL/z0iTgQ=
X-Gm-Gg: ASbGncvjKkJQmEQ7BRTtEHcKuF2RYRhD4gsg/dvy4mWgPv6qvkt8o3PNX981Ye89bpO
	zWMk6MKo5nxq54OlCx/Z8AvFYAMp7JH17dxPE6wWxqfCnrliW15YMRXyVr1aIUbN0/eaJuDletd
	G94U8spDmZEDNJpFBrU8pA1fXW/Q+x9hNQVA+EwcMQ36qGS0hthlDbENMAnNiVkqMraKU9xMiyU
	0poS9obhaMLZ3pzLem5rpKwp9ayBHXFIYcZwglk9Htbi3lSUiwkLjQWZHBbXzMMw+WFWnKAMIw/
	IDOUup+wSQOMlk7rqnoOj7dNJ09f+Y0CoqDD/NpDJyT4+2taVs6hUBzY4Q9Xwv+Oh8h94aJsYBE
	JGnRpTCpf+JBopKdh57vCEnY0Tf0NX1f08kFT03QlR4DPMHP09G1vsP3G+TLSdPYBkKFFmoypSi
	6ix8k=
X-Google-Smtp-Source: AGHT+IHhhHbJ8hJGnY+jVzo5XBMGx1xaIAa5m44vk4uxyjS42YcaIHBNHmkiTntGZfiB3yhY5MXCRg==
X-Received: by 2002:a17:90b:1e08:b0:32e:70f5:6988 with SMTP id 98e67ed59e1d1-339a6f84cd2mr5872201a91.32.1759385377284;
        Wed, 01 Oct 2025 23:09:37 -0700 (PDT)
Received: from localhost.localdomain ([122.171.19.158])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6099f594afsm1205029a12.37.2025.10.01.23.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Oct 2025 23:09:36 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Greg KH <gregkh@linuxfoundation.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Ian Rogers <irogers@google.com>
Subject: [PATCH 11/11] MAINTAINERS: Add entry for RISC-V trace framework and drivers
Date: Thu,  2 Oct 2025 11:37:32 +0530
Message-ID: <20251002060732.100213-12-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251002060732.100213-1-apatel@ventanamicro.com>
References: <20251002060732.100213-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251002_070940_065341_6C6D74D2 
X-CRM114-Status: UNSURE (   8.38  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Anup Patel <anup@brainfault.org>, Adrian Hunter <adrian.hunter@intel.com>, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Jiri Olsa <jolsa@kernel.org>, Anup Patel <apatel@ventanamicro.com>, Mayuresh Chitale <mchitale@gmail.com>, Namhyung Kim <namhyung@kernel.org>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Liang Kan <kan.liang@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add Mayuresh and myself as maintainers for RISC-V trace framework and drivers.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 969df0192fc1..898b51d3dd8a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21800,6 +21800,17 @@ F:	include/dt-bindings/power/thead,th1520-power.h
 F:	include/dt-bindings/reset/thead,th1520-reset.h
 F:	include/linux/firmware/thead/thead,th1520-aon.h
 
+RISC-V TRACE FRAMEWORK AND DRIVERS
+M:	Mayuresh Chitale <mchitale@gmail.com>
+M:	Anup Patel <anup@brainfault.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/riscv,trace-component.yaml
+F:	drivers/hwtracing/rvtrace/*
+F:	include/linux/rvtrace*
+F:	tools/perf/arch/riscv/util/auxtrace.c
+F:	tools/perf/util/rvtrace*
+
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
 M:	Jack Wang <jinpu.wang@ionos.com>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
