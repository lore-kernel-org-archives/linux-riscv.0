Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489AEC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 18:01:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QKEpZ6PXCIIn/xfVSOOYu2Hf+Xt5gQXxKjfifTE64BY=; b=IdXrD/CW13A0Vd
	+1WRptUrvJUBn7dOGNVHAfQPJyEqu/bHiIwhP2xR4iiRg3u0McBEzQzVyF7piwnJyw3mPjz6Q4Vwd
	pGzpXvA7+H3Lr8+mCvS+nhD1PTB+TSd72lXC/BprFiLX7ZaMsRmSqNZE5J2M+xt1Myyco86YQCxN+
	7bMq3dlXDQOmpi90x0RKrGIJiMQTTSEa5WHLr+rZK4wIxOov3hfPieNOqXfXy2L6WvfK6XxgWyP5z
	ErEg11QbYezam1Yg05d7lOpouc/iDf+quev8WOpzVBzFLwzPst1qb/6CPzwCMEGeWJbdQ3OcEmupW
	EE0bMq16Y8AcnM/Zy/3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwxJ-008gH3-9c; Fri, 22 Jul 2022 18:00:53 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvrc-0084vK-Vp
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 16:51:00 +0000
Received: by mail-pg1-x531.google.com with SMTP id h132so4862421pgc.10
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 09:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z3XlA8t9TDZtl4uJYv9cJwWL/SPmBlhXJhsAi+NFr/o=;
        b=7tomhJF3u9LLXyYKG/mq8DM+QQ5eXZlTmLQ/bRtzbuFTsoGyHBxFMuvLF9qFtb26F0
         7nLXbAx65p0+2AImCE2S5PQ8m6o5oHJbnmu7aaNWTr9cmaTfyX/W8lpenujNRCaLf7Dx
         pZ1WFMUz4YOgIr5bZZrSJir6FzhWmkFhsJ85EqoL+hdVXHW/QxnfSaFeDh09LlnVytZi
         jCUXfBfbQ8tEWhDDuY9lEVL0Pbx0LjXwtUjFT++6Ejxse9NuUgPOiP/1ts68BBDr58U8
         5oUiDb67b1rZgKGa+zUEfvOfPfGea9NSwkjUv3c1t7fUFb6Ja+kV3bW2HBmJNIJUhAJ6
         aong==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z3XlA8t9TDZtl4uJYv9cJwWL/SPmBlhXJhsAi+NFr/o=;
        b=g7T3d6GBDPAwfdegXozoxsaPD+5K6KCDd5CoMAgPivg3qz5jHUHvrLYwdSpZrPi4TT
         055vV7dzovPiNN14xTWQU8ROE6UgD/rJ2XLVExBZ/ixO5+RgOY+zlDAqdvU06Z2VbpGx
         t/N8/KuUZAwESc6LVrgZD/ESYINWWdS5kPOMdfWqK9unAWwLEABh2VOnUSNVm5jIsF0J
         lpZatitrjH2lp4sfgq0zskYdJ5jyHaWoYf/hd7B6oUxk3GviuEKBhsIsD0nYiZute5yM
         8OxFVLWa4APGSAfEGMBQInq86lsqkJRIL9X+DqiJhG6PEpK5K+jDGfSv/3uxP4iZmraB
         1Qvg==
X-Gm-Message-State: AJIora9LagFZG4blsRFYjyOjGh29OhXma6Pmtij7q8mmgWUq9lYvDr07
	BVsfc5qeVwOqjFVG5w+mz53Gmw==
X-Google-Smtp-Source: AGRyM1s+HPeBLYkB+YD2xjmmGBSIoqOGqhGo5tNM6KQjvnM0lOzs/Zmq8GIH6N4CmqMxSOzReT4cUQ==
X-Received: by 2002:a62:4e85:0:b0:52b:3245:ba20 with SMTP id c127-20020a624e85000000b0052b3245ba20mr767732pfb.5.1658508655499;
        Fri, 22 Jul 2022 09:50:55 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b0016a3f9e4865sm4028476plg.148.2022.07.22.09.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 09:50:55 -0700 (PDT)
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
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v7 1/4] RISC-V: Add SSTC extension CSR details
Date: Fri, 22 Jul 2022 09:50:44 -0700
Message-Id: <20220722165047.519994-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722165047.519994-1-atishp@rivosinc.com>
References: <20220722165047.519994-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_095057_045660_E2F9E00F 
X-CRM114-Status: UNSURE (   8.54  )
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

This patch just introduces the required CSR fields related to the
SSTC extension.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 17516afc389a..0e571f6483d9 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -247,6 +247,9 @@
 #define CSR_SIP			0x144
 #define CSR_SATP		0x180
 
+#define CSR_STIMECMP		0x14D
+#define CSR_STIMECMPH		0x15D
+
 #define CSR_VSSTATUS		0x200
 #define CSR_VSIE		0x204
 #define CSR_VSTVEC		0x205
@@ -256,6 +259,8 @@
 #define CSR_VSTVAL		0x243
 #define CSR_VSIP		0x244
 #define CSR_VSATP		0x280
+#define CSR_VSTIMECMP		0x24D
+#define CSR_VSTIMECMPH		0x25D
 
 #define CSR_HSTATUS		0x600
 #define CSR_HEDELEG		0x602
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
