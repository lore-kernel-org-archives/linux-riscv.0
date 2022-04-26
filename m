Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092F4C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Apr 2022 18:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3QlARXyZRaGf9fUMzROUyUaioiVg+RGRGZ8gpFvQY8=; b=eezunzXv9fHaIS
	eY20MxFsLcyr6FLEXaZXeTW2hLymFlED7bqR9CbtXds3MeQ2twrw7r/WJyIEp/JWe9fInBQd2tERx
	rl+N39xGy0zYRTcVhhJvrT5EGmi1u03XlCQ2SA9lFTOJnrbKstZnuh5IGoQCCEY8wdq5SIyMcwzQa
	wJ8nf2wxYkprgk/t0mHSP26/NgEcQXFvo/7vP2MzIVrzlbwnnuZ228ajLU+8SKRgdLoVkeOu5bXIc
	i5vAOWfcvl0FElKWJ/r1sNCw3izToh6KkjCwIT5TrYbRisoZ9y5O+xVv5vpAHwmz0d8iYT9EfOePy
	2I0Zv3ioqGHZ2EpqcJaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njQJV-00FrIs-6j; Tue, 26 Apr 2022 18:53:29 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njQJF-00Fr9g-JR
 for linux-riscv@lists.infradead.org; Tue, 26 Apr 2022 18:53:15 +0000
Received: by mail-pj1-x102b.google.com with SMTP id
 t11-20020a17090ad50b00b001d95bf21996so2953741pju.2
 for <linux-riscv@lists.infradead.org>; Tue, 26 Apr 2022 11:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D+SXwT/SJ1BJbq87GGWyit7MKCT0yhEbjDVEHkS9JaY=;
 b=Z9GOxXKVlrR5xV0gHPbY+4kKmmF1WY+8H+M9B0psxISWmGz2FVgBqU9huy3KkQTC3V
 6bFgG7obRq96JTn8NkAYyml28WP2VHD9d/+A+rqpT96V3DLLPpHwRV7XeeOkj+s25kx6
 TJ4Holc+whFhjUX0Gsmza/Wzb7jz00dboknTTWY0oha7C2dcZuPhkqMuEnqlYWWH1lIX
 Juuy8ObgdDHPqRAFmGp5wCC1zlYuYDF+W2W+m+2TcowHRc+yRIheJtG0+PlOyAy8aJpY
 JXrUdgOc6WjB5VwDUBExmoEkoLEcmbh79m5h5PksiZ62NmruVMZRl2dokqfkj2USAktx
 mZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D+SXwT/SJ1BJbq87GGWyit7MKCT0yhEbjDVEHkS9JaY=;
 b=P2Vyk8nsHlj0zx4r0vUOu2NqphHem5yM+FPpZLOKakjKZp7xRcu76fw6R65OCrkj1L
 x5XbjAP5dKkOLd9ntjVBX+vO/6U/5dp8rC7US1AnBG/ioiEzRKLEdJWAHAVWoXf1D5Td
 zSUBZcU3o+VVr0YV8MQnrbGPLaeyf14u8dA+fev6Lb9ekdxAoM/uYqGJsQIm+35Rf8/+
 nryPXu6ASRqsvIClzqr4HoQt001+oNE+dpo0oFE++kbeEK5YCXhpzuCij9LCq4+8vAuT
 J5v+tvVy9nOtGFUSAf2XA8N7thQ++izsqqjTYCt0B2qlpUGER10jx/ciWSjDLNlN3OIF
 D71g==
X-Gm-Message-State: AOAM532Bgidkv1rNjUs2mdhR5E/fymYEUwMNEEacnIDXNEqFZ8tNqiV3
 SA+dKRoce/trlNt8uOIKGbBe+Q==
X-Google-Smtp-Source: ABdhPJzuRCCRkiCXmkQ4uct0ET1s6jpxuw4eppcALK9l9iv3G2BJT4A0mDWv47ZfhzCx8cMo3QuMAQ==
X-Received: by 2002:a17:90a:f3c7:b0:1d9:6832:7be0 with SMTP id
 ha7-20020a17090af3c700b001d968327be0mr14406860pjb.209.1650999192070; 
 Tue, 26 Apr 2022 11:53:12 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
 by smtp.gmail.com with ESMTPSA id
 cl18-20020a17090af69200b001cd4989ff5asm3839664pjb.33.2022.04.26.11.53.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 11:53:11 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Atish Patra <atishp@atishpatra.org>,
 Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 devicetree@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 3/4] RISC-V: Prefer sstc extension if available
Date: Tue, 26 Apr 2022 11:52:44 -0700
Message-Id: <20220426185245.281182-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220426185245.281182-1-atishp@rivosinc.com>
References: <20220426185245.281182-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_115313_711966_7066E7E3 
X-CRM114-Status: GOOD (  13.17  )
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
 drivers/clocksource/timer-riscv.c | 21 ++++++++++++++++++++-
 1 file changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 1767f8bf2013..d9398ae84a20 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -23,11 +23,24 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	uint64_t next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (static_branch_likely(&riscv_sstc_available)) {
+#if __riscv_xlen == 32
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMPH, next_tval >> 32);
+#else
+		csr_write(CSR_STIMECMP, next_tval);
+#endif
+	} else
+		sbi_set_timer(next_tval);
+
 	return 0;
 }
 
@@ -165,6 +178,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (error)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
+
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
+		static_branch_enable(&riscv_sstc_available);
+	}
+
 	return error;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
