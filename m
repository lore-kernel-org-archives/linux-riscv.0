Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3AAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Mar 2022 20:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOKdZFGr1j2EkrTXjBruVmD+ww7aTBgibrdcSHv/ypw=; b=49Bs4GPyE3EsrT
	KLCqdIjQrX3PXg5jPynzTtqCP1OPEU+80tWnMIep9/DQjuL0bZ95+rBZ1WSeE1BQ2WPEHWwnmE1AN
	AuSRiWbAvBJn9FoZNgOjrUoO8dqUeizFBS1gmfL3rpNIexGl5BvR1lP5irkskX+NbiQRjfotTtDfK
	FQXTulnoQlx07nJd4MeYhCUywZX7F/Sx9iXS7gCrU12aw/3EsjVuqYxaArxbcD5TadanpOp9wi93i
	cdJT7KMa16+0sftTqA6m/OEgCJwt99IsByU3VB+Rx+pTHn1Qjsoe9wNCKr+mVnbm5FGeSumwGjlsp
	fYXOSvTUR4u8JvPFXYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTrTE-006ouq-75; Mon, 14 Mar 2022 20:39:12 +0000
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTrTB-006osd-GV
 for linux-riscv@lists.infradead.org; Mon, 14 Mar 2022 20:39:10 +0000
Received: by mail-qk1-x735.google.com with SMTP id v15so13853976qkg.8
 for <linux-riscv@lists.infradead.org>; Mon, 14 Mar 2022 13:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c80lDSr4/XrHo4HXuUiUdwW2N5759X0Jr8s3r01G4uw=;
 b=RSQTwbMTlvf/XdTqYO8yvJZyz1/z+kSqX7ohzLBcVXa38yJV0hhUloVCQYRq6ujmIA
 1cYw+Qz0pz0ig3z21KfyxAF4wuZdIjqUCD1nZNzev4zKBsAc844/u04qkmilCVeIda69
 69+HG1rhQvW+SWGgf9KBGiy+9NU4OlGDr5ehIrJeatZ2TwB4eyZh7WTtKYZ3EM44qWjp
 oiztRuPBGGY2Oyh4IZmc2Q7p993UmfEGaUxuWkpEO4xcn/S+Op9RJnpbv4U1jwb/qrfB
 RbUquhN7Jq2jUlky5oVLorpXAlR1sbmgGdwKhlb/IHjmGYf5JFbdCo224DC5xz2sgncV
 HvMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c80lDSr4/XrHo4HXuUiUdwW2N5759X0Jr8s3r01G4uw=;
 b=emRrsl1hjqJPn1mh2gzw7ZaC0POHNrheFuDVjgvFh2K8ZrV+OgP6BkqohzLPRGqbgI
 plFngd4yaxP3/70lzRF0+YjrXG0NmchQS6mYwVa1icDUwukVy48Q98ErwRFhf9fcg2EN
 1ViLtV1YzcBdBROCvPD/v6LiwQbtIF/4wEa0PNF15pQJLFk4XFkvkR7IsX3jR80sERhX
 JL9U+YX4IR3WCYyxBY9c43BmgadDswnovc5DZl7l6iYGRi4Ed/GNT7piIEMUx/TA7BXE
 xu2UkIh00XsJrwB5Oda+s21jfEY57WpBgdE9XkQPCUj8nI4W9VndD5NW0j8Qs7lIr9G3
 Nz+Q==
X-Gm-Message-State: AOAM531EwWGA2v7k6rwGfVItVANtGOAZxjUOoZvymRL69Bz+Jf49WgG6
 nS8Sd+zt9kKQvfyIxgqGVjOW0g==
X-Google-Smtp-Source: ABdhPJyo2wKJnYHR1OhUhhyhMQ4ds5vaGNsAWSD7I6VKTRF9r/58irDDodxIqoeGfB0DsyRbNRTMLQ==
X-Received: by 2002:a05:620a:1a92:b0:67d:b2c2:8311 with SMTP id
 bl18-20020a05620a1a9200b0067db2c28311mr6926282qkb.594.1647290348212; 
 Mon, 14 Mar 2022 13:39:08 -0700 (PDT)
Received: from rivos-atish.ba.rivosinc.com
 (adsl-70-228-75-190.dsl.akrnoh.ameritech.net. [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id
 j188-20020a3755c5000000b0067d1c76a09fsm8597023qkb.74.2022.03.14.13.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 13:39:07 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Heiko Stuebner <heiko@sntech.de>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v6 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Mon, 14 Mar 2022 13:38:42 -0700
Message-Id: <20220314203845.832648-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220314203845.832648-1-atishp@rivosinc.com>
References: <20220314203845.832648-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_133909_584079_F1F4CFA5 
X-CRM114-Status: GOOD (  11.94  )
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

Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
[Improved commit text and comments]
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 35 ++++++++++++++++++++++++++--------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 72c5f6ef56b5..b0df7eff47f7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -124,8 +124,28 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (!islower(*isa) && !isdigit(*isa))
+					if (unlikely(!islower(*isa)
+						     && !isdigit(*isa)))
 						ext_err = true;
+				/* Parse backwards */
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
 				if (unlikely(!islower(*ext))) {
@@ -151,14 +171,13 @@ void __init riscv_fill_hwcap(void)
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
