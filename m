Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20AB7C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Feb 2022 05:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7AHa5d9FnZS/NS08lZcmylJckA6+/umy6crPdll/17w=; b=RQJqa573O5ld3q
	YSJ48EE5yKMRoSRljMoRcphcdhLcF1yV8ryBzgXCrFtro5bg97l6a3LxeWY8ubyTqhz/Al/l7h8Pj
	WTyGM5jLXu6Z12RmKWKgyyuFlInhG3Nowr+1aCBTOSgqyis9SB5PJJy+6KoPFzXSbAtrEZxjb9gnQ
	kInEm0tfdkM4F3JUk+eml1Eu11GXhKITlIZl9NmZeXxbRdG/zBtG7mYpZXGOKM+fU7IMvfGm6P940
	L9HSuj2IBTBm8sXJttC1H/jK0WQnKBan/5TEWUlH1IsDUKpQWoNM8Ee6vmlQrElR4pbzafA3AAi4h
	4jN7ocAlGO2xeNY45Vqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLeUL-000c8o-M3; Sun, 20 Feb 2022 05:10:25 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLeUI-000c63-5S
 for linux-riscv@lists.infradead.org; Sun, 20 Feb 2022 05:10:23 +0000
Received: by mail-pj1-x102c.google.com with SMTP id b8so12027483pjb.4
 for <linux-riscv@lists.infradead.org>; Sat, 19 Feb 2022 21:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=64Kf1jBnaPXE7HWaq/CWbgAlm0Fq5kx6l/oMdBTVwE8=;
 b=gsu7vUkBTXloZBY5crdjWG0a6kF7Rp2Ufl6WjH9zPwubBpnczQgxvMINFx3UAPUdck
 KlS4IRWAqBOnHgtnkUuInOwXQgCVfVtYHHJxHv52k0eVJKxYQxmKLXKaSZSKhvyMc2lE
 9or9uESFqi+dg0FwIWbOenYCzntChMCJuslU+vDeF1n1JbXpRtH4KTIP2hIxKZPoNNpD
 5P8T2gz09S0UnezL0u3Zm1L+Lrjo2NjueLOme9YaubfxrWp5ht2G7aYZbQSQDF38Tucb
 bPO0/iJoo057zszFRMWRRkQECn1PxqIBbRbF6DcWu6h+ch9DPKb0MH3PyNImUQOfBFv7
 XiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=64Kf1jBnaPXE7HWaq/CWbgAlm0Fq5kx6l/oMdBTVwE8=;
 b=l2PlP6QDcOWPxmGC8AxjmTbNrnnfgDyzyVCMaoaI0BbhJNgph98GpY/jPh6OEDpPqX
 jMYDaWTk+kKsPaKtqfvtKYWd97NJT1xR1XjPLNmEKaVTFgEmrt0kM/OOaVTCQz+0Gev+
 DCeg5oyNCqfU/ncmnLWU4JR4rGehkE/6Hg80f3giw/zmL5Fua0GdleuN6Pb4esX2ax8T
 OHbCwwbhXngCzf+Rtz0OKEQqRQwfFX7wkH6nJs+9wiQXbLGZ6PBRXQ1Nyod7rI2LPKNX
 OZE8qNygcLpsq2Sis1w0sZEvdTMnC/oCBQQIVoXnQrddgTf2rNs9VIKxn86F2vQrV+0E
 mGQQ==
X-Gm-Message-State: AOAM532bRUpYONcXT2pPmveG/ExzWB8YzH0f1jdM++AFRU/fuKMzuilK
 KD1rz4BvOZ+0gOB7UdP/rpAAkg==
X-Google-Smtp-Source: ABdhPJy3DExU6NKhqlkQTY+VUHkVb8Ep/VbycLbZh8/S5TbSH+UpC9xVOXzmgADpJWI3zRLlmngV/Q==
X-Received: by 2002:a17:90b:1104:b0:1b8:b90b:22c7 with SMTP id
 gi4-20020a17090b110400b001b8b90b22c7mr15685794pjb.45.1645333821280; 
 Sat, 19 Feb 2022 21:10:21 -0800 (PST)
Received: from localhost.localdomain ([122.162.118.38])
 by smtp.gmail.com with ESMTPSA id 84sm7602730pfx.181.2022.02.19.21.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Feb 2022 21:10:20 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v3 6/6] RISC-V: Use IPIs for remote icache flush when possible
Date: Sun, 20 Feb 2022 10:38:54 +0530
Message-Id: <20220220050854.743420-7-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220220050854.743420-1-apatel@ventanamicro.com>
References: <20220220050854.743420-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220219_211022_246226_3673D21E 
X-CRM114-Status: GOOD (  12.95  )
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

If IPI calls are injected using SBI IPI calls then remote icache flush
using SBI RFENCE calls is much faster because using IPIs for remote
icache flush would still endup as SBI IPI calls with extra processing
on the kernel side.

It is now possible to have specialized hardware (such as RISC-V AIA
and RISC-V ACLINT) which allows S-mode software to directly inject
IPIs without any assistance from M-mode runtime firmware.

This patch extends remote icache flush functions to use IPIs whenever
underlying IPI operations are suitable for remote FENCEs.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/mm/cacheflush.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 6cb7d96ad9c7..7c7e44aaf791 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -18,7 +18,7 @@ void flush_icache_all(void)
 {
 	local_flush_icache_all();
 
-	if (IS_ENABLED(CONFIG_RISCV_SBI))
+	if (IS_ENABLED(CONFIG_RISCV_SBI) && !riscv_use_ipi_for_rfence())
 		sbi_remote_fence_i(NULL);
 	else
 		on_each_cpu(ipi_remote_fence_i, NULL, 1);
@@ -66,7 +66,8 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
-	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI) &&
+		   !riscv_use_ipi_for_rfence()) {
 		sbi_remote_fence_i(&others);
 	} else {
 		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
