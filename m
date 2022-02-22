Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ADB4C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Feb 2022 20:48:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KOKdZFGr1j2EkrTXjBruVmD+ww7aTBgibrdcSHv/ypw=; b=lbxWcKlXMpRhNi
	v2dnAPmglIj//mzGbi9I0xYqa2KWFfp74g5pu/cN/UvXGs6LVgVeM7X+tWmHueevNudYFTvMgeSVU
	oMUblZ1pyMiDN7NXFU3Og82hFHbINxXz2m6NDuRl5iOXAKseLCAdEzSmmdt4HuY52ybrm85rDUnom
	fbcvbfLazl1Jn5AP7wJ7sQTmbKIN1Pw2dP94wmmgBjJskvghUcTrzK3ZcFk7aQzErKlbLVd//Ix0Z
	N5Xojo3UByDgc5yzImjcf1zUTrXSF97/ZLGRitHDmc4Rv75moSxA0TnYaH3s8ZJK+Sf3ZH/Mmzn/w
	cY4fgMflULhgtoYtdvMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMc5K-00BZcC-2x; Tue, 22 Feb 2022 20:48:34 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMc5F-00BZZ5-49
 for linux-riscv@lists.infradead.org; Tue, 22 Feb 2022 20:48:30 +0000
Received: by mail-oi1-x22b.google.com with SMTP id i5so15977822oih.1
 for <linux-riscv@lists.infradead.org>; Tue, 22 Feb 2022 12:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c80lDSr4/XrHo4HXuUiUdwW2N5759X0Jr8s3r01G4uw=;
 b=qi2CLkoTpNf+/7KRpxJWRKKedV3ySUp6Hi5CiH/Rl69V/1ZYKrlbplu5LuSaHdhRIr
 U3qvvNSC3b8wbwX2/jLQsKii0fmBsrukVOjWCg8MHzVUm8SSVTFJXjwemeX/p3d7bn6Q
 +m87Kf9FB60c/CB+MHLc7aTiHvLqierIr4BTAMkPS7FbbukSEVFc7B/wbjSfrQvOn2Jk
 E8yxCnUIUCRB+eJ5tkE7gfAvVChYIkBzF1uoQFj7V7qm3IKD0Nr14+iqzwFSYX/sG6p8
 N4+OOxN8twd0yzhKVeF35CuuEGVtvYulguhNHU0z+MdnBFRUedC9fBtzQri9+gdN6jNK
 01IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c80lDSr4/XrHo4HXuUiUdwW2N5759X0Jr8s3r01G4uw=;
 b=CZLmvPKbmCeuXGL8NnOEqwXXw8TZiPFldi3SvEWYz9GuhYylkGczkhFnczkG0hsnT6
 wcwioKgS5Oh/bSEzAaq/Xk4a3ozVkPoLaRhGfps9USmgLTUsuc55SsgMdgh4FOSfgu/c
 P/hC11zlkqCldx2qA9fg7Gm3ymX8nf8Xzgj6VTRvCQa9b3oLWVoJ7VMz2c15v8vOozug
 GLpLvF3PxTuHbyFcAkGNV9gytgf2xZItrvqJFkvtz9wFoFTmWhd27AICQpgcy3i6f7zX
 ByEB6Fadp0ovBOvm873TIDbEJxgNqX4VIlCJ3PqJFTIcj7rDXos8lkVYk0pIE54mY1MR
 BmmQ==
X-Gm-Message-State: AOAM533ATeL41jWjSyd53SQEylcbrsrNPBkR3M8SxIYzPIXUwHlqhqew
 fjUlI7nTwg0lKYju5KWGb1jfsw==
X-Google-Smtp-Source: ABdhPJz2U8KLjdjNRUB//gea/ufjet3hLSc2A6nlzGRCQGTmGSKt0aTPN50GrrZNsqro3BBTDjNyuQ==
X-Received: by 2002:a05:6808:2106:b0:2d5:3244:ca43 with SMTP id
 r6-20020a056808210600b002d53244ca43mr2968470oiw.263.1645562907949; 
 Tue, 22 Feb 2022 12:48:27 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id o14sm16508197oaq.37.2022.02.22.12.48.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 12:48:27 -0800 (PST)
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
Subject: [PATCH v5 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
Date: Tue, 22 Feb 2022 12:48:08 -0800
Message-Id: <20220222204811.2281949-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220222204811.2281949-1-atishp@rivosinc.com>
References: <20220222204811.2281949-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_124829_213247_23698E8E 
X-CRM114-Status: GOOD (  11.87  )
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
