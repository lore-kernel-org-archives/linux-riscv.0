Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A782C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 18:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=errLoNqTxjGdC4JOOTJwbYyY6O/POXKf4fucZkKgsog=; b=SftAYf3uO0PhuV
	ET5tAVRyw3/nyRaGB3aB/ug+M9FArR35bhqHCHPbG0REkEWO8g6r3h5y8arp8xh/N5ff6pb27SFud
	p13+Su7NLI+lQbqOBd24OkEljnC65oQ2jiuJoIqOF81a5DfAr/JLc6KT3XPyzSu95f3+Z/smdCQGy
	sXT7Yr63Mr9IjJkaXx3U7DLi0zmpnTiXGiA5Jll9UsQEZOtry090feZ/hhdic7vBwoTM7D125kbcK
	sW6faW+1Xpg904eU06LZd+/tNiVx64qfMhY8AoD4JuP55dSqqEZcakX1itW6LOvvjNQAwtjwFJldL
	bIFox4OwQRsiG8qqVe3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf6-00BHrd-Li; Thu, 21 Jul 2022 18:12:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEaf1-00BHin-7c
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 18:12:33 +0000
Received: by mail-pg1-x52a.google.com with SMTP id f11so2358098pgj.7
        for <linux-riscv@lists.infradead.org>; Thu, 21 Jul 2022 11:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7oAEso24XUyiMu0RhEG3Nlz67s2VkRn8qN/IYX5xGk=;
        b=e4v5kYM9VG4DZw0IIxSlfEM9WcRpuHzW+aUXV6hSu/yuTBN2zvgBptWTPIqr+OOL7U
         M4p1sac+9UivJeffTW/Ct3miDf1y/PJKINANXsgviIQD8x4vSDwB7iZY9AmXGxYTsU+7
         PiYJhVOIkGlfMUm/SJWbgAj8qdHQz0JF8WWC3+1f5cX5AXhUAcoK0UrRXNjCSoLnytGl
         /TFysN8Zgm2nGPj7DwNU1xZamTCq2hQ4ShaIS1en4EsSn1KBqsuin2lvgPecVOPcUzaf
         tlBj+TNJofOJs9cx3SwLdVEmD37KwfTpI/HdSOI5j08fFkQGsPS3hLEIrJXM1oXtfipw
         kGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7oAEso24XUyiMu0RhEG3Nlz67s2VkRn8qN/IYX5xGk=;
        b=FzCT8PPet+BYvIl2Qmro6jelNfK2iZZO98l3upzXgRS/Nul7v8GK50CDCwD9GKR/5O
         YI+SszG22VKYbzckcRPNVZIBKELAR6R2Gcw+xz/nauUUz19LBWyZgf1iJ3lmvl4h0M6J
         r5+UeZMvn4vmHJ6usohHyJOp1zLZHGHoILV/v4oHHPzTJjLyesw23V/Uv7U1SEJzjegG
         IYL0E76RLIsiv6v7YKBxImJWfNSg6WdShroFqd0KAb4Se1hxYCW/r89xmVWRTxLh31WU
         9DleEFqcrsqnYQ7eSmSuogtCNuAVUxeehUj62st8jl08q1Z1jmUJcFbUCg27Y5AuYw1J
         4D6g==
X-Gm-Message-State: AJIora+55SMKg7Ulndeg9m2jDbhahtdalqWYJgwpy37MJk0bikzrij5H
	aZbr6ORTV9kJ2oOGkcz0JwTbbA==
X-Google-Smtp-Source: AGRyM1t6vxRkdk5QsbyWbVO79Sk4ZCIpAMQ4DLkJlBMooxcrWoVenWvw9yGMAn+ygbbtEoAGioMJbg==
X-Received: by 2002:a63:c53:0:b0:412:6f28:7a87 with SMTP id 19-20020a630c53000000b004126f287a87mr40570740pgm.136.1658427147128;
        Thu, 21 Jul 2022 11:12:27 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id b12-20020a1709027e0c00b0016d3a354cffsm617358plm.89.2022.07.21.11.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 11:12:26 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v6 3/4] RISC-V: Prefer sstc extension if available
Date: Thu, 21 Jul 2022 11:12:11 -0700
Message-Id: <20220721181212.3705138-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220721181212.3705138-1-atishp@rivosinc.com>
References: <20220721181212.3705138-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_111231_360258_157332A3 
X-CRM114-Status: GOOD (  13.73  )
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

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/clocksource/timer-riscv.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 593d5a957b69..3f100fb53d82 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -7,6 +7,9 @@
  * either be read from the "time" and "timeh" CSRs, and can use the SBI to
  * setup events, or directly accessed using MMIO registers.
  */
+
+#define pr_fmt(fmt) "riscv-timer: " fmt
+
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -23,11 +26,24 @@
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	u64 next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (static_branch_likely(&riscv_sstc_available)) {
+#if defined(CONFIG_32BIT)
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
 
@@ -165,6 +181,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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
