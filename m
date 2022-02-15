Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86291C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 09:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF6zxkzweXbUVXR94o6DHZl2JzPZvYFg/dEbMzsGF+U=; b=1RbHTMCbLm3ioX
	USxb9CC15k6W/HB1SYt66LcuPAgpmYa6ONAoCXURyT51DWfYo+isrJNDcAVRdySy9kiZohBh30r2v
	+CfTMS8NuL93//CehJ3KRXingTW7Nomj/P16It7WIDYascZ6LGBbxzsQb8ecRECBpLDgRiECy+ALe
	N/njXd3SxScKH1Dwzr1BD4bnZsUR3lH6ZGqXEXj7/pvecU3c2nMGOl5zG+rsWanFwLWPQbfomtAjA
	Iai3IMgwSyq9fYHrOXfap7uR7oqXthe2Som8UFxd318SWDU1030c3bQEr1Cw4BfBRdOELtbZhg3HQ
	d9k29p5das61c6/qiXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJtjR-001skm-Pd; Tue, 15 Feb 2022 09:02:45 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJtjJ-001seS-Vm
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 09:02:39 +0000
Received: by mail-qv1-xf32.google.com with SMTP id f19so6541324qvb.6
 for <linux-riscv@lists.infradead.org>; Tue, 15 Feb 2022 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PZTGGlFqOOOyiaN6gxsek+e4rLg8IgrL4zDsxITUV58=;
 b=gOICOmC4IxU3X4MSsiyEWM8HxOs/j/5mUyNV4SqSm8mbgryc6hcSAyRYKiMAKb21Cw
 CsnNzdrkCsv6rcH/9wILxHZWjwEGCaojBEUp67oc0qGRCrBgdUODQlQ5YjZ0gna9zMWA
 6FfOeIaDQH1mY7dRYm9KK0qBYX9tTq0tVr/UVAWPQMQZaOVjtjcVnTO3blVbEcRMI9iY
 Jakd730gszKr8ibDUuEGKyA0BfHwN4wGL36ZpFRgQvrotS0TQuTUBjuyPerOD0Rnl6Aq
 duWdRplQ8y7EokINuJqpCrO9+RY2eyqxJ287GvW+WylZcV4o/P3bij/VAXexWlkJ2oGY
 aC8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PZTGGlFqOOOyiaN6gxsek+e4rLg8IgrL4zDsxITUV58=;
 b=YEk11BISoYOtLzXaM/zTGuPrv9/4LHRjg9G7dQwmVGY13No2ZxV+JdlNENWdYu0YY4
 tVbmxf6Q6/2QPCRmyA6M4RQ87wgrs5L5EiEi4DTdThigU02rQnYZ63f7gJ42paRw3uPH
 8okV1KNaoIweQxzDR+15adDPLHDLUafDLFqEtY7lHGY5sB+YNyuEZlHnImipchTSvXKG
 R+EH1oD8XnFutcS723NM/DwfZ4Nl2/UcbgZj2xZfz/T/ifqRSs2VPVsLK7ktDqX8/KMN
 BhY+rd8byx4mJ/IBQCml+XBfi0cRWSLFGvYroAiW5+Xlw2ZRcAhdfaIk19afbTWvGks5
 6fGQ==
X-Gm-Message-State: AOAM533Fc9wx9evb5eGu8YCuoQ3GqWWa9bGCbfJhPgahaACT8+497MSq
 tToUcgkE0VhJHwPGt1M+zS189Q==
X-Google-Smtp-Source: ABdhPJxX2hGcT3+xRwhjlKaaOUOvbc5Anj8eZx1sK0eZAfvIjPN0L0OGcFka5qnrXcEjmuM8VRTJmw==
X-Received: by 2002:ad4:5941:: with SMTP id eo1mr1976230qvb.50.1644915756363; 
 Tue, 15 Feb 2022 01:02:36 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id w4sm17711158qko.123.2022.02.15.01.02.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 01:02:35 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Tsukasa OI <research_trasio@irq.a4lg.com>,
 Atish Patra <atishp@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Tue, 15 Feb 2022 01:02:08 -0800
Message-Id: <20220215090211.911366-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220215090211.911366-1-atishp@rivosinc.com>
References: <20220215090211.911366-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_010238_133591_90D50403 
X-CRM114-Status: GOOD (  12.18  )
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
Tested-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/kernel/cpufeature.c | 38 ++++++++++++++++++++++++++--------
 1 file changed, 29 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 9d5448542226..cd9eb34f8d11 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -119,9 +119,28 @@ void __init riscv_fill_hwcap(void)
 				ext_long = true;
 				/* Multi-letter extension must be delimited */
 				for (; *isa && *isa != '_'; ++isa)
-					if (!islower(*isa) && !isdigit(*isa))
+					if (unlikely(!islower(*isa)
+						     && !isdigit(*isa)))
 						ext_err = true;
-				/* ... but must be ignored. */
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
@@ -131,6 +150,7 @@ void __init riscv_fill_hwcap(void)
 				/* Find next extension */
 				if (!isdigit(*isa))
 					break;
+				/* Skip the minor version */
 				while (isdigit(*++isa))
 					;
 				if (*isa != 'p')
@@ -139,20 +159,20 @@ void __init riscv_fill_hwcap(void)
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
