Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A0FC282CD
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dk2wR21qBLABWCXte4HWd2+GxPKj2DvyiOqRtv5cglc=; b=NrIukIqSihruhP
	KznMkh2xEBbs0nEUsaQsluhhLs8oT8lucBOeBoU98Z9uvtJUgoy9zq38riguTvdsL5TOvv2erK4nq
	I2uKQmrHPbw2UXbdkcjUeoOv6VbkhdrpNmBVa5IqM3Lg8VbacWFTMaKZ0XXUcI/hNDKzG3HHUgjD0
	Cl94yZ36svn35A1fzNE6hjyrqFanHdVFp+uWWxAShd7WpWqWTrwS5Ty4XxApmE5wyFFRm/dd27Qyz
	eoGRBS79EZFBg6V9KbvS/8FkNmHXnZsQLP0ZZkc6cwbFtRJIZg7ZsRXYRmPKF6bcp5mO6o6M+fF0M
	MWVnGxAkGc1B1kQAgr/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1GV-0000000HXfZ-1rPM;
	Mon, 03 Mar 2025 08:35:07 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp1G3-0000000HXam-0KZa
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 08:34:40 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-223a7065ff8so21328455ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 03 Mar 2025 00:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1740990877; x=1741595677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=di2WoUZvURtoNarBPZOzepS2NtA7sut6LRw/YPG0p/I=;
        b=jGoOtNmlsXYk3NFJhgDwHbAlsJaTRLNS/qGbUaQUUGg4Bvquw5OBtgtQEcrur2sGt/
         XvprSt1lB3nPuQyHS74LRRemJieLxvlJoxCOcD1AwpCmSLhzX4xsbCm2msehgs5/Yirr
         Hb+dnFDXsC0yCi2AF0eyblBaIfrYAqKSGm7L3TUQbSR/ELbdvEWb6io2PbLM55ivhn4a
         esLCayo0h9foohvvB2dUJegdITJIEwx2yZQPXna9cxZRqEJON9B55FqXdLb0n3NVI8uO
         duNwhUV7JqbqfMvSpKg2Qe0rflvTP4oO9ynQTDO1toqQXYmhUv8wJc4K0y/27IdYZypS
         ByZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740990877; x=1741595677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=di2WoUZvURtoNarBPZOzepS2NtA7sut6LRw/YPG0p/I=;
        b=WsLbEaoAYVLUmVshRDYoyvHdIJOHQ4jz4j690ze4zDRBbd2NUsJrG3aSn93xcToT9D
         /EPaIUbghz9UBBm8f3ywaizve/O6RCTSWrCJhTHJrjRZN3cvodE5FfdpZPCgzFgjLh0H
         t8VCdTbl1NPAKPEn948XSh5BSDwjjCwJLGmZhVjLyGdhizEU1EqUH5BX7DRNrhIhwYur
         KZJqU7R/Smg/UkDbSheDOFI0/kFzbmbB/tfBBUZx0QAfgDTQlEDhaz4LknPFbT9/4gJp
         CQd3qOmhMtkEtcGK08sk9mywrPPltFQgEqx+tjPyeqeWKoyNWlWQj6+iJ9entxt6IkFY
         wDLg==
X-Forwarded-Encrypted: i=1; AJvYcCV/T/NY4n7dvCdxRBOg/Wy7G2NJHljp5Fgb6bR+nGcK/t+5APxSns9uONL1ZJ2B1oTgQGW9JIvixqjZEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YySpdtz8KfZ6LWKXJ7e4CaFuf5mA6BjIaYRTLXsrW2KueHhZCKv
	4HJr1NWlW7KyWP9KAqBmG8gQAm39/xtU0ShCPj84plhHbM2TRRi0I4MCX0DTdOM=
X-Gm-Gg: ASbGncvv8FDsnWxqBuc+780yHdkmjYtUsiCCwzISRdDLysy8MPu2Qcz3JdebIyOkOBF
	5whYqMXDfN33QkuYJ1P9NZ+pu7RPJUTORoB0wNa1nO1k5eHYnZ5Ehf6bS8wFvtt1o5fkdhZT1tz
	1vnPjouL2QQ8oHMzq+GdGIg9HQZMbjzwkko7mHzOiRozpT9Fia7bqn81AhPvZjyDPrDgNWt13Pq
	pfWHutjtpL8Vy3RrgtH1dAVATDbbTLsN+d2UguVjAtAv4k/Np2ojZdgjUv3FAFHAt0AURlzh1xI
	P5tURtPfglG6shnwEQskTMAQfXRlohpEuZh8EoyZLwNP/jM6etR3NMfB60W4uGTpdZ6WeJb8/ko
	0reQ=
X-Google-Smtp-Source: AGHT+IEk0WrjnIZ7AWKUanS9IbxIHGJTjqY1Da4XJZVIQYRkq7p3R9SLY1NnZNNc1YpQ+wvncNLDAA==
X-Received: by 2002:a05:6a20:c891:b0:1ee:c093:e24c with SMTP id adf61e73a8af0-1f2f4ddb73bmr23471716637.30.1740990876998;
        Mon, 03 Mar 2025 00:34:36 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.253])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7349fe48882sm8289808b3a.48.2025.03.03.00.34.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Mar 2025 00:34:36 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: apatel@ventanamicro.com,
	atishp@rivosinc.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	cuiyunhui@bytedance.com,
	samuel.holland@sifive.com,
	alexghiti@rivosinc.com,
	jassisinghbrar@gmail.com,
	takakura@valinux.co.jp,
	valentina.fernandezalanis@microchip.com,
	ruanjinjie@huawei.com,
	charlie@rivosinc.com,
	conor.dooley@microchip.com,
	haibo1.xu@intel.com,
	andybnac@gmail.com,
	ke.zhao@shingroup.cn,
	tglx@linutronix.de,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: print hartid on bringup
Date: Mon,  3 Mar 2025 16:34:24 +0800
Message-Id: <20250303083424.14309-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_003439_439040_C25828D9 
X-CRM114-Status: UNSURE (   6.86  )
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

Firmware randomly releases cores, so CPU numbers don't linearly map
to hartids. When the system has an exception, we care more about hartids.
Adding "dyndbg="file smpboot.c +p" loglevel=8" to the cmdline can output
the hartid.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/kernel/smp.c     | 2 ++
 arch/riscv/kernel/smpboot.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index d58b5e751286..e650dec44817 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -48,6 +48,8 @@ EXPORT_SYMBOL_GPL(__cpuid_to_hartid_map);
 void __init smp_setup_processor_id(void)
 {
 	cpuid_to_hartid_map(0) = boot_cpu_hartid;
+
+	pr_info("Booting Linux on hartid %lu\n", boot_cpu_hartid);
 }
 
 static DEFINE_PER_CPU_READ_MOSTLY(int, ipi_dummy_dev);
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index e36d20205bd7..601a321e0f17 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -231,6 +231,10 @@ asmlinkage __visible void smp_callin(void)
 	riscv_ipi_enable();
 
 	numa_add_cpu(curr_cpuid);
+
+	pr_debug("CPU%u: Booted secondary hartid %lu\n", curr_cpuid,
+		cpuid_to_hartid_map(curr_cpuid));
+
 	set_cpu_online(curr_cpuid, true);
 
 	/*
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
