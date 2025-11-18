Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310B5CEBF9A
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Nov 2025 02:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mY1c+1+Q8P4ryyXxDuT5blNlwhwx9WDfoNyRIia5hzQ=; b=vyzMKs2Xk1dgwv
	3C2/fFbXa/1Lijcnm/9TjDRvY5MwHojsEGCb2SWU1qoEv+fmw0w+0wMHGzMGj/xQtfrPBRhDOJPhr
	K6IFzo7n+t77E8OpMGocOJW2ymhYOf57KVc/LEXf0E1n6RZeby7nJ8qNh1lsGLhQ1CfkPffe4GSPU
	RKf/fdbtj5RUBWhtjyUThR/Mxd+cf7lohL0rz8G/BoGbE3tfiauxKLSQEXBEpVAOPHiSDE3iMY7vE
	gqzyupc4UJP3vSEX6Xb9USN035yrwfon3IvuQSz35QMbv98W8xKEbdmUnBcRcqgcs4yVuH7zUHq+I
	nUW1d1w/EVrzZB0LQ7fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBod-0000000HFy9-43Nj;
	Tue, 18 Nov 2025 02:51:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLBoZ-0000000HFrt-1KTT
	for linux-riscv@lists.infradead.org;
	Tue, 18 Nov 2025 02:51:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2958db8ae4fso46037635ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 17 Nov 2025 18:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1763434290; x=1764039090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5nYyWY2TGtfq9g9njXBwfNvKTwM7Y4XVBx38hReH0kU=;
        b=UmwfSDcS2D8zgV4CWEH3Xej5Dk2B1EIDjPKaFUlbPCBBY3u583FUY/025Jw+IlbCi5
         wrmSoa7VqZVi5nvyb73/hr/Fp2zFMiO8cd31+2M+g1lirFYcVLlEapbotcZKv5E7v6lY
         UrY6fIBffmM/cV++r5XeuEcwlASA7KTtDKBwL2d8vTAwnqC2TdB9NyAL1JA+IZVLHJi7
         z0+uiDBRWOoqZ/V2c9bYBH0HcLD5scqv+Z588Ziu8FMTMA/7YLLyRAtPAmd1xATnvm1m
         py75Z0zPS6+ZBDmss4uve76XyO7qqDzV1XjkOPAL3xAzM/wF3v/1inhfpaXA/eCImFdT
         kSvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434290; x=1764039090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5nYyWY2TGtfq9g9njXBwfNvKTwM7Y4XVBx38hReH0kU=;
        b=SQnqYbGxHmz0RqA/TtIHSQb+l5mgLJZYg3f63cpN1VMcE6NgSyIt73T+caQ3SswaDa
         iVnBcLKnyIK/1AC1ybDQtuXEx1sMo8R9ZWZwL1bONiHrETYSToSJnooudi56rQvMkbfj
         Ca6rdhIzZ2WaiG6Kbj7Jx2r7tRUrvH9Fk/0ZAFIo2Is+PQPz7XY3SoXtS5qtjjvp13Q5
         yw30XkVC5TDNfUseQPMS4FyI9QmnoaC1s+hmwfrMzWjbTURtka4UHW2BQbaJutJlrE1c
         Dxt2PnuPdS4AULLyk2Z1Fhwdt1qVMCLSk+RW+8F4MaB5R+FKKi/vnYKLs8zQxqTRbaQ1
         idZg==
X-Forwarded-Encrypted: i=1; AJvYcCV30AjlOfONOmgyXseXw7jfBTvY16Qt+uV8UAt/Z7KgipV/gNoBcGn4VLCEIddkuIfnyAMClwqpGuQfZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyO/Ck3ny4QXUJCQ4pVsA6SVJ6fq6Jri3gUDgQb8IvCcgCB/7sG
	vlBTxHAO3pfIRBZz9gvuNJq9vJVU6+AtK9enmaBsujtygVfuUObFsMS5KE6kI6XOXj0=
X-Gm-Gg: ASbGncuotivgYyI0p2C0MjqqVPtd5umW7X0OXPzSG4wK7TTtwyuieQeoWgnrDhoOydY
	0QW2k7EhqvOaWciEFUP+piJUltdfwFirir0mDJv0xSSkQQZ0J9ZqfvkTpo4sdAUije65aiSj++f
	m2bc4s3Ghc0A54Y7cI/lO9d0nNr05aZntU7XxjKkpk5/cNooWrmIWrVH2KyBwtjf3cS+fVSPdVd
	4fMrROJTjav2laAn1tFrDLYVi7Axukmi8xJfg4gDi47l67ItXkukv9C+CJIz4aLxyke5jfmb2sr
	8C7UWiLlqPG9jzboqz4fCsBfJbJM+PtPxPGEjIFva6BPICDwpPxJuLAjglq72S6ujm8OujOg2ez
	TbBY2UCCGe9QPw9VVfaklWXoIYc5s/a5auqbdbJ+HT9UJX0iJ+28O6zuZNG8Kv10GJVJR1DqTwX
	hT8TqT5dEfG19yM7NMpxRZpZldwFNBO8DaPA==
X-Google-Smtp-Source: AGHT+IEMHfTR95UbanA62fl6Lb5xKnkuHEFGjCY9sBUiiwSPhLsMAn/FbJIuDYjKBwm1CvRaJJMcQg==
X-Received: by 2002:a17:902:e947:b0:295:7b8c:6622 with SMTP id d9443c01a7336-2986a6b8751mr177078655ad.11.1763434290379;
        Mon, 17 Nov 2025 18:51:30 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c234809sm156022065ad.19.2025.11.17.18.51.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 17 Nov 2025 18:51:29 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: conor@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	cuiyunhui@bytedance.com,
	luxu.kernel@bytedance.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	jassisinghbrar@gmail.com,
	conor.dooley@microchip.com,
	valentina.fernandezalanis@microchip.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	maz@kernel.org,
	timothy.hayes@arm.com,
	lpieralisi@kernel.org,
	arnd@arndb.de,
	kees@kernel.org,
	tglx@linutronix.de,
	viresh.kumar@linaro.org,
	boqun.feng@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	cleger@rivosinc.com,
	atishp@rivosinc.com,
	ajones@ventanamicro.com
Subject: [PATCH v2 7/8] riscv: smp: kgdb: Use NMI for CPU roundup
Date: Tue, 18 Nov 2025 10:50:14 +0800
Message-Id: <20251118025015.42491-8-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251118025015.42491-1-cuiyunhui@bytedance.com>
References: <20251118025015.42491-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_185132_216642_1029E558 
X-CRM114-Status: UNSURE (   9.97  )
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

Use NMI for kgdb CPU roundup if RISC-V SSE NMI is available.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 5 ++++-
 drivers/firmware/riscv/riscv_sse_nmi.c | 2 ++
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 26083fe0a5df6..b1cefb2b0b8c2 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -382,7 +382,10 @@ void kgdb_roundup_cpus(void)
 		if (cpu == this_cpu)
 			continue;
 
-		send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		if (!nmi_support())
+			send_ipi_single(cpu, IPI_KGDB_ROUNDUP);
+		else
+			send_nmi_single(cpu, LOCAL_NMI_KGDB);
 	}
 }
 #endif
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index cac940b7e8773..5035d4ec485f6 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/kgdb.h>
 #include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
@@ -58,6 +59,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
 	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
+	NMI_HANDLE(LOCAL_NMI_KGDB, kgdb_nmicallback, cpu, regs);
 
 	atomic_set(&local_nmi_arg, LOCAL_NMI_NONE);
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
