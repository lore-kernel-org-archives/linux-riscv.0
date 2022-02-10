Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF74C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Feb 2022 21:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xlKCTLx2G1G97WjEiS+s4zNwYdwtJB+41CSdfsSOjTY=; b=EjT8FooTsrD8sC
	u+GttO42Vu6N3R0hOai4b/s3cwfmrzwojPz4yOBbsXPGmFR9iH7vR+4ZgCbKQTrBa9HlIJUytwAGI
	7rCLrbtBrJUIeYoQqLlUkUYm3Fgn7SKy6ns8PcttCYjjL3h13SsFqz+YOm+HCEtaH2vgOuYaw/j2d
	l1eR61udfYK1xFuHtNZmIR3u2sFFVaBFWWk5cYddU0WMlU0yWlRxYVFZdO058gOz3y6tdbkQ9DA5U
	OwIpRwr9dvQ3rBg5t4kU9OjIoq3JPi1DxYSwLsYiUb7eujIjOk0Ks3AYN7Y8Zacemq60qsjfTHAog
	wX4t3xjaflDc66tr/bRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nIHBB-004xFr-Om; Thu, 10 Feb 2022 21:40:41 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nIHB4-004xBj-O5
 for linux-riscv@lists.infradead.org; Thu, 10 Feb 2022 21:40:36 +0000
Received: by mail-oi1-x233.google.com with SMTP id x193so7554448oix.0
 for <linux-riscv@lists.infradead.org>; Thu, 10 Feb 2022 13:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gfak+qx3drveGV1Pvkzt57Jl+W0jEgrAmoVtloDMaBw=;
 b=b5WIG4HsEF5Iod1jlBRBnYuxQFaXxoMA8iP1rJdZ9dXaGNSGjPXSPmZnGU7z+N98i3
 PFUIm+xNgTyD24P1KmltetZbCHaWJt9LqJEf5KV+Rq949EsJphUQp5Q+jf2tZt7Qy7c2
 Zt9J61HUTUscpV0smpFM2mhfbNXsZxcRZ828cU4AB7GvTUvUHmVhPml1mkHo4ptzYRRB
 o2+8U3fQcZMV6Mjj4RR8QjhftLH50cjfmPJgOWDqPVNlM1Ri2IQ6mTlaEx+U0p0RgBOn
 UlGy3tsfSb1cSMykpj9Vgdw6vDPziX7U52avE88Xpuwl3zSPHr9RwkywA8TqDnBQxfFl
 PYcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gfak+qx3drveGV1Pvkzt57Jl+W0jEgrAmoVtloDMaBw=;
 b=t2NfHSzhybftzw09z8WKK4bgnISu2pq+4xA0hRhhIvtzvgZrLuniNyfdyMCL/mJeyM
 HVct8sOdVjVuFTHc7JxX64OWP17pvqnlyJFYLVpLYm4OMMOj5fXdaFnh+X9DtOOPUKCv
 QJq0IVCkaJTDF7GPG/KBI3pmPlW2oFFq2zIVWFwge6bv5Uayv8rw5o2TWJxLjjuBeAFP
 ZLiK3Ph/+Kozn4tKjLR3yz/+Xx2D0SzH1V4F4ISsiduur6UwVJ0Ig419ct60Sx8cCFyd
 fijAvTwu2Fb2VHtIajwjwmjiLS0dqViESvrDkq9+iqzTgCBMoAN1KB6UCrh0AqeVP7X+
 x5tQ==
X-Gm-Message-State: AOAM531nzKcCtsIfsQ8UQkAhx4jLZtNJgcuI5/U0LooptOnc9Yrc1j/E
 Th/cGHRFoTLtja8J46iSTt3C5iWjDKUy3QHZ
X-Google-Smtp-Source: ABdhPJykAnYvG8sqBibAI7XjH1k9J0mAOKTMUjlZygKx4hyhEIURQ1Wi20CpxOC5ed/s+MjwLZlz4g==
X-Received: by 2002:a05:6808:229f:: with SMTP id
 bo31mr1819283oib.107.1644529233614; 
 Thu, 10 Feb 2022 13:40:33 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id u5sm8700000ooo.46.2022.02.10.13.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Feb 2022 13:40:33 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Thu, 10 Feb 2022 13:40:15 -0800
Message-Id: <20220210214018.55739-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220210214018.55739-1-atishp@rivosinc.com>
References: <20220210214018.55739-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220210_134034_816610_42630352 
X-CRM114-Status: GOOD (  12.64  )
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

From: Tsukasa OI <research_trasio@irq.a4lg.com>

Currently, there is no usage for version numbers in extensions as
any ratified non base ISA extension will always at v1.0.

Extract the extension names in place for future parsing.

Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
[Improved commit text and comments]
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 41 +++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e19ae4391a9b..e9e3b0693d16 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -102,6 +102,7 @@ void __init riscv_fill_hwcap(void)
 #endif
 		for (; *isa; ++isa) {
 			const char *ext = isa++;
+			const char *ext_end = isa;
 			bool ext_long, ext_err = false;
 
 			switch (*ext) {
@@ -119,19 +120,39 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (!islower(*isa) && !isdigit(*isa))
+					if (unlikely(!islower(*isa)
+						     && !isdigit(*isa)))
 						ext_err = true;
-				/* ... but must be ignored. */
+				 /* Parse backwards */
+				ext_end = isa;
+				if (unlikely(ext_err))
+					break;
+				if (!isdigit(ext_end[-1]))
+					break;
+				/* Skip the minor version */
+				while (isdigit(*--ext_end))
+					;
+				if (ext_end[0] != 'p'
+				    || !isdigit(ext_end[-1])) {
+					/* Advance it to offset the pre-decrement */
+					++ext_end;
+					break;
+				}
+				/* Skip the major version */
+				while (isdigit(*--ext_end))
+					;
+				++ext_end;
 				break;
 			default:
 				ext_long = false;
-				if (!islower(*ext)) {
+				if (unlikely(!islower(*ext))) {
 					ext_err = true;
 					break;
 				}
 				/* Find next extension */
 				if (!isdigit(*isa))
 					break;
+				/* Skip the minor version */
 				while (isdigit(*++isa))
 					;
 				if (*isa != 'p')
@@ -140,20 +161,20 @@ void __init riscv_fill_hwcap(void)
 					--isa;
 					break;
 				}
+				/* Skip the major version */
 				while (isdigit(*++isa))
 					;
 				break;
 			}
 			if (*isa != '_')
 				--isa;
-			/*
-			 * TODO: Full version-aware handling including
-			 * multi-letter extensions will be added in-future.
-			 */
-			if (ext_err || ext_long)
+
+			if (unlikely(ext_err))
 				continue;
-			this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
-			this_isa |= (1UL << (*ext - 'a'));
+			if (!ext_long) {
+				this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
+				this_isa |= (1UL << (*ext - 'a'));
+			}
 		}
 
 		/*
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
