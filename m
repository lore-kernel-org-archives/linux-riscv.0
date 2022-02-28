Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27652C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 09:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ck08PT+hYfh1I01WJTY2nsvTlzDkLzWkai4iWdMwgvk=; b=WlUtd1F5f55gpK
	cHao70WOLW2EpIeO1RRMF2ABJRfRT/HPz6x4lsHS+FOKNHy50xVEZYbA42OzK4Ys/DyPNrKrwAaAj
	OzwnV57NpGhzTEzWjDyLjHimTQ2XZQ5pvCVInKtrs75ButNKE1nzJY57AnwAHKL8hJHb9vUXxuJCy
	Rc1StWm/x3ljWdujzWDG7/UnIsRY5ILbuS+cIZzfoxNzQyqKdEqf5GWkJNSiBowe06bNaCoQD0NdP
	j5y+YkUyjugXKVHK3uJEMCbppUTM5w3klVabqEwSzt23TUrGay6ABKYV4YC/KSDzbaI2jjFtht+4H
	gLkmKY3okhlEtH3nrLBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOcYV-00BISC-6n; Mon, 28 Feb 2022 09:42:59 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOcYK-00BIJf-6s
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 09:42:49 +0000
Received: by mail-oi1-x22d.google.com with SMTP id j2so12623287oie.7
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 01:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nZwHRuTuQHHbyYlmVo+wQ56EPoPlbAZZW/TgYQjt6EQ=;
 b=KxbNxI6daxarqDSPoYJrgu16gYJElhaFFKqjm0lQ+eTNJ5pyfjlXpLMB50fYeDtwww
 NstSnpNuRFCiV+ymuW5x73HIl3hpt1IZKmviLs7TOxSVAlw67xkFc7ZCNpAgxhL8OD+K
 qfWdvT8xdStfW/CIHFYW3d0hvFb8JwryRbocRJrzme+9qGlQhFslkXsfixPDdCy8Tk90
 UBpC1ypuc9dxsasUJ0PMVaFw26CcB/VvAmIUhQMs+mvWnCymmgozneCHLJ8+SkDIlxop
 EE/9sxjtQUbIk4pPv5DAipCk/vgo4T86nNGNrYjQnbcIA9qe0YodJk7C4++9wugV2Lvj
 SBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nZwHRuTuQHHbyYlmVo+wQ56EPoPlbAZZW/TgYQjt6EQ=;
 b=Qhcm8Prt5Jm6FtjpXVUHEGL+soCgxV5NlkStM4kNoROuEsx1yRmfuJsYnIsCmWUWcj
 R2pdycmc6f0gd0lKvJ1JU8QYHXzXvoWMbROvZ8E+esrpG+SO7G1X7/lXdyZ0Z2c01Z5D
 feq608wNSdN8MPw676Vz6gWwO0spFjHl6Zoc9JoWhyVwt/itRKYuK+di0sDKqeuUqcGD
 Juc/SzWWWgvFplMsRic+pDN7fvzdkMN8GCq1Eo/LqYMLHmD86sxcnv7JHAC9La9tFMhK
 22ntDCqnBSAiT+1DsctX1DDmP9Q7boEQa1EXuSmmcoqYMxDpYSOIBMb2S+O22Fu4bzdJ
 I1Ag==
X-Gm-Message-State: AOAM532+LlkDbKhs+ag42SPl00vBouJSJ+PhaF0TwLUSL1aHKHegrZme
 5IJ9F4bm/T20s3PvQbDHvJQ5Q/+oJT8MiQ==
X-Google-Smtp-Source: ABdhPJyLIFFgNymyuMZ2b8GlMCcdf2pTdM5RU1i0+xsx0tOzZUQL6nDHFWoz72TNTT3cndvEUXQqUg==
X-Received: by 2002:a05:6808:208b:b0:2d3:a5cc:540 with SMTP id
 s11-20020a056808208b00b002d3a5cc0540mr7723881oiw.41.1646041367488; 
 Mon, 28 Feb 2022 01:42:47 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190]) by smtp.gmail.com with ESMTPSA id
 bx10-20020a0568081b0a00b002d70da1ac54sm5936852oib.19.2022.02.28.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Feb 2022 01:42:47 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, kvm-riscv@lists.infradead.org,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [RFC PATCH 3/6] RISC-V: Prefer sstc extension if available
Date: Mon, 28 Feb 2022 01:42:30 -0800
Message-Id: <20220228094234.3773153-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220228094234.3773153-1-atishp@rivosinc.com>
References: <20220228094234.3773153-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_014248_296861_DA6CF36F 
X-CRM114-Status: GOOD (  13.27  )
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

RISC-V ISA has sstc extension which allows updating the next clock event
via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
if sstc extension is available. Otherwise, it will fallback to SBI call
to maintain backward compatibility.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/timex.h    |  2 ++
 drivers/clocksource/timer-riscv.c | 22 +++++++++++++++++++++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index 507cae273bc6..dc0ffed04ea1 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -48,6 +48,8 @@ static inline unsigned long random_get_entropy(void)
 
 #else /* CONFIG_RISCV_M_MODE */
 
+extern struct static_key_false cpu_sstc_available;
+#define cpu_sstc_ext_available static_branch_likely(&cpu_sstc_available)
 static inline cycles_t get_cycles(void)
 {
 	return csr_read(CSR_TIME);
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..f032da8a4272 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -23,11 +23,25 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+DEFINE_STATIC_KEY_FALSE(cpu_sstc_available);
+EXPORT_SYMBOL(cpu_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	uint64_t next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (cpu_sstc_ext_available) {
+#if __riscv_xlen == 32
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMPH, next_tval >> 32);
+#else
+		csr_write(CSR_STIMECMP, get_cycles64() + delta);
+#endif
+	} else
+		sbi_set_timer(get_cycles64() + delta);
+
 	return 0;
 }
 
@@ -165,6 +179,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (error)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
+
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("S-mode timer interrupt mode is available via sstc extension\n");
+		static_branch_enable(&cpu_sstc_available);
+	}
+
 	return error;
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
