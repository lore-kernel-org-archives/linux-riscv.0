Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0855C27C50
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 18:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUOtNrgYWRpjjrgAisQ9hzhpP4xZcZr2xvBXbY1gDMs=; b=mmtT1MUOTmVFlX
	FuGVfKQExGUfUPpl4jqrqxFxdDn65d1I9V+UBIm1Sv7d7C/wcv6iBPPG8hOQlUHSzcrzExXOxNh0K
	lC6LNHlcEQ/UeNET98D456aVMKIkSxpnNgtN5RvTGbs1Q32lv+f9HkxGvLnM/C61HaWI9FRnwzxTa
	XziJxH31ICGsk4WbjRIzas5gQ7LmeQ3jv6nv+fZbxpxfPNKU+69Z+d9wPqtW8Xh9KyR5DQY/7nLDs
	xyTL1nelpf86ol8PbFQILV6A7LaEZr4l5hKiqE34e/C18ARsZ+Dlg3rV9snIsewj7otda6ZXg8RK/
	3nzN63VN1Try60DGN80A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORd-00000005G9v-4AUy;
	Wed, 29 May 2024 18:54:42 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCORX-00000005G6E-32ah
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 18:54:38 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-35b447d78f1so25100f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 11:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717008873; x=1717613673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BSkmcpX/DU8tSqXScAea3itOYSZ+Zk7JjFi4MBclVMg=;
        b=L9AWwN9xwMPwJrVWKToFASTjosrcTemAwalBrECH9sFPmOYNUf5Unq4izmtUOgfw8C
         BlEvoO8K/ASS8E6zrPXSUnqgjfEjGlmnb0xeyQTMdof25y3x7DAStlVU+Q4PkNSm1W/G
         FnijtsdN43xYuAjhgGGCoAggHknMh5puUNoUHXQg14pJ2MOXr3FH/FFpYYvZvm4hM2pz
         twMETr6plKpUGX235Mf03pmiPv7dSzkK6hhPGOHjrUkmZc6r/Y7bIOvvM12QyI0qTjtw
         NastD9Dcvb/eppU562ENuzXM6TkWzAMd3U++PPaMuXh8auRF2rJ8m9QboJ/yo8OmVJg7
         ++Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717008873; x=1717613673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BSkmcpX/DU8tSqXScAea3itOYSZ+Zk7JjFi4MBclVMg=;
        b=QCec+Pd4GzkwTH14ozbACm9Xppug6Sf4v6V9KW7ryng5uZug6F6zYTckF/W0jKxV9H
         0uivX1ixuRVD00sIudHlCv7FJbDeHLXhJ4nOqi1QADsS89i6/JfXMfaMc0KdVZ2mEk7W
         iQ9S69lvPEZlt2Z6PlMyKeoGdsY5NycecVBsuXWJqyJKBFh/zKg96aEc4iVZuiwS0qYc
         y82MCj9TgwHzVjdcFivV+Eg4ccwL+ZbosvyNeQ4EwR1iVjDJuu/+aFXWmOwWO64cun75
         p2PakOfOtGGlUfvYizEidTRwS7GME2jMNEh9LK2lCxYPsYG0Q1pdOsZJe8pcHJZtIeOO
         lPNw==
X-Forwarded-Encrypted: i=1; AJvYcCWO/orAd4XKhnkicm+sfm94IJwNk73cn7TcuNgB0rCyzNhEtoOy/GkDnRpBhEwvT4t/4rUZvvGqrEzUUMQQ9Cy84lAb3QV+2Q7og4/AperC
X-Gm-Message-State: AOJu0YxR8NpTMQAsNVf6+DYgvSdjr7xm4cbYNlhaJYrzI5ZhF0Hx4I+l
	D22NG8hPUps+7fF42j4FJXu0NDD3GqNsVMkjwax/S1/ENMPtGbzunPmUh/sttmk=
X-Google-Smtp-Source: AGHT+IHHl9KK9z/L8izKsRybmVqfP8bMjXHwVAHsTsF/TnNuIRcfgvHrqZiLQ7fq4FiWPMrXEUFK7A==
X-Received: by 2002:adf:f6cd:0:b0:354:fce5:4cc3 with SMTP id ffacd0b85a97d-35c7a8477f9mr2527916f8f.19.1717008872954;
        Wed, 29 May 2024 11:54:32 -0700 (PDT)
Received: from rkanwal-XPS-15-9520.Home ([2a02:c7c:7527:ee00:7446:71c1:a41a:da9b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4212706a23csm2787885e9.27.2024.05.29.11.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 11:54:32 -0700 (PDT)
From: Rajnesh Kanwal <rkanwal@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	adrian.hunter@intel.com,
	alexander.shishkin@linux.intel.com,
	ajones@ventanamicro.com,
	anup@brainfault.org,
	acme@kernel.org,
	atishp@rivosinc.com,
	beeman@rivosinc.com,
	brauner@kernel.org,
	conor@kernel.org,
	heiko@sntech.de,
	irogers@google.com,
	mingo@redhat.com,
	james.clark@arm.com,
	renyu.zj@linux.alibaba.com,
	jolsa@kernel.org,
	jisheng.teoh@starfivetech.com,
	palmer@dabbelt.com,
	tech-control-transfer-records@lists.riscv.org,
	will@kernel.org,
	kaiwenxue1@gmail.com,
	Rajnesh Kanwal <rkanwal@rivosinc.com>
Subject: [PATCH RFC 3/6] riscv: perf: Add Control Transfer Records extension parsing
Date: Wed, 29 May 2024 19:53:34 +0100
Message-Id: <20240529185337.182722-4-rkanwal@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240529185337.182722-1-rkanwal@rivosinc.com>
References: <20240529185337.182722-1-rkanwal@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_115435_840607_076AC95E 
X-CRM114-Status: UNSURE (   8.70  )
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

Adding CTR extension in ISA extension map to lookup for extension
availability.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 4 ++++
 arch/riscv/kernel/cpufeature.c | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index b8cc459ee8a4..aff5ef398671 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -86,6 +86,8 @@
 #define RISCV_ISA_EXT_SSCCFG            77
 #define RISCV_ISA_EXT_SMCDELEG          78
 #define RISCV_ISA_EXT_SMCNTRPMF         79
+#define RISCV_ISA_EXT_SMCTR             80
+#define RISCV_ISA_EXT_SSCTR             81
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
@@ -95,9 +97,11 @@
 #ifdef CONFIG_RISCV_M_MODE
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SMCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SMCTR
 #else
 #define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
 #define RISCV_ISA_EXT_SxCSRIND		RISCV_ISA_EXT_SSCSRIND
+#define RISCV_ISA_EXT_SxCTR		RISCV_ISA_EXT_SSCTR
 #endif
 
 #endif /* _ASM_RISCV_HWCAP_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d1fb6a8c5492..4334d822b2f2 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -298,6 +298,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smcdeleg, RISCV_ISA_EXT_SMCDELEG),
+	__RISCV_ISA_EXT_DATA(smctr, RISCV_ISA_EXT_SMCTR),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
 	__RISCV_ISA_EXT_DATA(smcntrpmf, RISCV_ISA_EXT_SMCNTRPMF),
 	__RISCV_ISA_EXT_DATA(smcsrind, RISCV_ISA_EXT_SMCSRIND),
@@ -305,6 +306,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(sscsrind, RISCV_ISA_EXT_SSCSRIND),
 	__RISCV_ISA_EXT_DATA(ssccfg, RISCV_ISA_EXT_SSCCFG),
 	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
+	__RISCV_ISA_EXT_DATA(ssctr, RISCV_ISA_EXT_SSCTR),
 	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
 	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
