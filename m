Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31A9AD11183
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Nov 2025 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/CA547pXUMnyNDtsswkYLdfzrc8LPkD5lx7avzOyAY=; b=fXMrnJo7ZUYopT
	9z97WzTpwtimI6D12fmbGhOaU3dNPEDPNVJ78RcojmuWZB1itz1T4ux8JCN9N2clZetjV+Yq4D0In
	s5zoYOWYezM+NVnYJ1LXr0W1JF/mafolgMbHWaJPO4TMMfeBP318FkRUvIR/szc5kbZr5EvJv5PmR
	ta8jwNZ2N5qDKSysag7GqA4K7q2NM2pbtVZPYfuAdNsFbcwsdGJjz+5u3El3ynyHO0YzjMhVxt304
	DElb66SJV6YVmxFoV983WTfWZxnjea1yhrFn4bQUQAsxys/mCch+tXbEFFX6q4+ZgwGVdDK9K4XyH
	cCVtMpLkwkUavGwjRWVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVj-0000000Gbns-04f4;
	Thu, 27 Nov 2025 12:54:11 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vObVg-0000000Gbl6-3ieO
	for linux-riscv@lists.infradead.org;
	Thu, 27 Nov 2025 12:54:10 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-297dc3e299bso8307545ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Nov 2025 04:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1764248048; x=1764852848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M+jTpL/HthRsBGxB3Q2ZvpHSHqmwjwHrkZeOIM2209Q=;
        b=MfeUI89dSCKTolRl5bAgYeBnpgNpfj/t6buj55EonQXI+6XDrG26tuaAPzSUsk/cKX
         v+uPAk8fEPUdBMedmBxtI77XGjqm1lGg2g0sIZo3OIHkTl68n1VHbMhJ9mdjo0E83DZn
         geSid/fw7KGPRq9XUVZO6urPOQeh3yAu2X318d2GsH26krL3kBduKwcjPs5A/vBTtxB1
         rddxH1pENGSES/zEx8fXC4/2jEE1r8+RckkG5O2SI5F2EBePU3wdTZkjeZfIUHsyAR0Q
         4oLqopRxg0/ufkCOpUz5HZIhc2FNuGrCLgObw4jf/3evch/d+4NnCIbukaAKFvANEoUJ
         tw6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764248048; x=1764852848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M+jTpL/HthRsBGxB3Q2ZvpHSHqmwjwHrkZeOIM2209Q=;
        b=Q48DBHdCp0iD4HBC9BmFJ6HKI84W9CadFoo1MSRKiI1/TOOnMpFrVdlMBLeHObU/3t
         nsFK9fzJbTILpdqylxSzj54a0+dWF20Lf48URpGXm/3KHCvHkFzXJPwWuI/mahLREUpz
         BdS8k/yA4LETA5mDs0vC8W9kEKoQEl67VQkKk8luFoMpEgtpRNpVnHsOeCCtv3VMUg4+
         HBo39JXjgLxfs08RGDvC99CLDF3HbX5d4iHqQIE/3uOusW2chARasZ82Awdqi2biQp8X
         6vpPmKGzBREVL/Zre0/Dju2h7yM9+TW6pr9xoksY120vQNZVyrn4wNNO9ElY+pStrAKp
         iolQ==
X-Forwarded-Encrypted: i=1; AJvYcCWA/4hyNEe+taqi+OwbaSq8deAYU0E4FC8BESvctrZhKT8CuLYFwVRghJiUqiYge9UmUmi2Vb+kuugMfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRhrGpKGAq1Np98wjne6eEse87AALaGrawJM+Tn2PhoEBU3vIf
	8H5XwyKxbQfI5+ViF5Z/eeFwQJ12C9WbOnQHrVKqwjU23ipU82rv5yXQxHknh6nsaNI=
X-Gm-Gg: ASbGnctgRfOwc/cv4pQPi2DHQvQPbcDV+UiXcgCFiyMQa55SEoJWAHujsDiE2elfu5D
	qZF49hyvQdLsjuC+cUilSr2LAifJ11r843RA8ubazxbJ8qxw5GTxVIdHW0Yqvh6cjj6EQ60zWgO
	4jKXSFD81Mp049UAOKFg4kDWAWtEQYB8DFh6Ox7QrZsL248/nwC8XKdTwCKAGQVqLvUEv0A31Fp
	g+d2kflcAHgEKavMn+5kRz5hTWuBBabFWwdqtS4DTpe3EhpZmS3tEVER5QEOm9kyrSe5SDRD5cB
	jGhyfeMPK2Tg1O0Hv43JYkfcI2U5FAKzkxjQvehtJ0G+Wwe6/x+yCMmCR5onvoCwjKuAaZbklMU
	USqJa6RShrUVSdwhVyBXojpCa5oN0+BEXFPth8uMfPEn2wDUSStAgoPUvb7rMBptKmwT1D5jhE4
	sKHG5JIN08cz8NOKnj+FANqwY55jPjBBuvEmoa8xdRWvy9
X-Google-Smtp-Source: AGHT+IG7drzon1SEfVMmYQlVlllrpZTrqpn/kBxmqkQQMT6P+x5y8+0dsVV7yCSCC0f84pvUbVhN3A==
X-Received: by 2002:a17:903:2412:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29bab1d73ebmr115182445ad.52.1764248048104;
        Thu, 27 Nov 2025 04:54:08 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.225])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce470347sm17771255ad.41.2025.11.27.04.54.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 27 Nov 2025 04:54:07 -0800 (PST)
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
Subject: [PATCH v3 6/8] riscv: smp: use NMI for backtrace
Date: Thu, 27 Nov 2025 20:53:03 +0800
Message-Id: <20251127125305.89961-7-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20251127125305.89961-1-cuiyunhui@bytedance.com>
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_045408_961447_DC56EA3B 
X-CRM114-Status: UNSURE (   9.68  )
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

Use NMI instead of IPI for backtrace if RISC-V SSE NMI is supported.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c                | 12 +++++++++++-
 drivers/firmware/riscv/riscv_sse_nmi.c |  2 ++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index bca95ec0b0f74..6d9a67c2c2a6e 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -342,9 +342,19 @@ static void riscv_backtrace_ipi(cpumask_t *mask)
 	send_ipi_mask(mask, IPI_CPU_BACKTRACE);
 }
 
+static void riscv_backtrace_nmi(cpumask_t *mask)
+{
+	send_nmi_mask(mask, LOCAL_NMI_BACKTRACE);
+}
+
 void arch_trigger_cpumask_backtrace(const cpumask_t *mask, int exclude_cpu)
 {
-	nmi_trigger_cpumask_backtrace(mask, exclude_cpu, riscv_backtrace_ipi);
+	if (!nmi_support())
+		nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
+					      riscv_backtrace_ipi);
+	else
+		nmi_trigger_cpumask_backtrace(mask, exclude_cpu,
+					      riscv_backtrace_nmi);
 }
 
 #ifdef CONFIG_KGDB
diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/firmware/riscv/riscv_sse_nmi.c
index 02e2de2bb70f7..a138d6bdbc0d1 100644
--- a/drivers/firmware/riscv/riscv_sse_nmi.c
+++ b/drivers/firmware/riscv/riscv_sse_nmi.c
@@ -3,6 +3,7 @@
 #define pr_fmt(fmt) "SSE NMI: " fmt
 
 #include <linux/atomic.h>
+#include <linux/nmi.h>
 #include <linux/riscv_sbi_sse.h>
 #include <linux/riscv_sse_nmi.h>
 
@@ -59,6 +60,7 @@ static int local_nmi_handler(u32 evt, void *arg, struct pt_regs *regs)
 
 	NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
 	NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
+	NMI_HANDLE(LOCAL_NMI_BACKTRACE, nmi_cpu_backtrace, regs);
 
 	atomic_andnot(type, this_cpu_ptr(&local_nmi));
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
