Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25AEDC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 26 May 2022 10:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uxmmlFVGqpKasymHD20rq0YqUdMlr4nq7NaqeO1Ulrs=; b=oQj7g8b790KKWr
	SRpPZowmhtqk1dPTvK8rKNU9+2ZmAjVoVnxDskTOdnwzoTKUQrHbZQe4aNsogUOPfSo0vDT4O4IOm
	3RHchHZP9jB44VE18xY4J56nqRrV7ejJB0l/gm1jBGpOuHogfglkoFmUAaw0xyY4kd9YK0jNB+3jT
	+V6yT9TnkKiY+DI67woPILElsFd/aG6oMNjJGxDgBB1WJ5wCaAwobpbrN7R9O5ls52D9F6pa+J1Pl
	rGkAleGEdFQOq8goHp0I2B0GGGpC5xr0KxLxmeMSy96NvmVYg4hGRCqRZ7CNsSQTD3AYGfvotlo49
	OcMFYL2PEaYtVeM8ywdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAT6-00ELTN-Ty; Thu, 26 May 2022 10:11:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuAT3-00ELRH-Mp
	for linux-riscv@lists.infradead.org; Thu, 26 May 2022 10:11:47 +0000
Received: by mail-pj1-x102a.google.com with SMTP id cv10so1340841pjb.4
        for <linux-riscv@lists.infradead.org>; Thu, 26 May 2022 03:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R1Oz1yAZDHQvhQh2SWx4vMTfkt8zOrGF2iQud75B5Lk=;
        b=MeBvlYLKJh6EnE4Nk4fnvlwLHRYUqSTpb3CTh8pn85TV32ZdSCclJiU4pcvaTDtwkA
         RZbKn8P//rgHWSQg9zJ8xqvTjG1wd8fm2yEN7plSFM4jAukcfO5ZPNZLN62yaHGP446f
         OsYZwKq12ORSAtDuUkFSQa3gr9WaXe7cH1K+StKOeIZS26YGAlqMye3q8lokxQ5dSMcF
         jKEKvVeOJ9qWyneCm3ObTYXlMLJK1mEq5SeCL4CISyt3QDyZVcMYYWoKUkSRXRt/iNOJ
         y+BTc8jKia4Tyw239NwQz9dEOEI5n8gY6PO71NKx3vrvGN9W1RCwgirGLD4gqqsJjqf3
         ohBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R1Oz1yAZDHQvhQh2SWx4vMTfkt8zOrGF2iQud75B5Lk=;
        b=zcflCqRTZL3hVmB/lKIu1+brZenBuFtMNieI7I5JKQQanOSj78jzyKyizV9VIjmrl8
         W4uWwgFuyc6Pp0GjlsU72L0h6YScHpIU08ceeQ9fM2edrNZPMCu5u+u8F170lrQtXLzS
         vjCSnivaX+YFeLbjk/f4dR7OGZryj4X5X70kWDnhoGorFCSl0OlhQ9TN6TD0FGZx1hrD
         CpvsTEfslBboGoH2daz5/yz8GAsIdDkyV63ANMvoNGflAy/62WHBNCDObkPRustZLZab
         JlbZ7KS495WT91wPfIKUFH9F+0FUeMYOR1TuB8A2CUIyQPNMa5csPLFo2orE8VfC0Sa2
         e7rw==
X-Gm-Message-State: AOAM533BRx6VAC4QDS/Wp4O3T+d1+9pN+qq99FZyIwS9VRgD4XZ1I6FN
	5SBMubNewlezujJcQptmlIR8+w==
X-Google-Smtp-Source: ABdhPJyAv5zPzU2IwZPeCQVSm/VsddqxuggiHGPcUvNa4rsGUhxfdC58ncib9zaXi0NWNziwb/aigQ==
X-Received: by 2002:a17:902:8bca:b0:15f:28b6:ad46 with SMTP id r10-20020a1709028bca00b0015f28b6ad46mr37153228plo.69.1653559902867;
        Thu, 26 May 2022 03:11:42 -0700 (PDT)
Received: from kerodipc.Dlink ([49.206.9.238])
        by smtp.gmail.com with ESMTPSA id z17-20020a170902d55100b0015f309f14d0sm1114861plf.56.2022.05.26.03.11.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 May 2022 03:11:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <apatel@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Sunil V L <sunil.vl@gmail.com>,
	Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH V2 1/5] riscv: cpu_ops_sbi: Support for 64bit hartid
Date: Thu, 26 May 2022 15:41:27 +0530
Message-Id: <20220526101131.2340729-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
References: <20220526101131.2340729-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220526_031145_799351_7AB8E0D3 
X-CRM114-Status: GOOD (  12.33  )
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

The hartid can be a 64bit value on RV64 platforms. This patch modifies
the hartid variable type to unsigned long so that it can hold 64bit
value on RV64 platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Reviewed-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 4f5a6f84e2a4..efa0f0816634 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -65,7 +65,7 @@ static int sbi_hsm_hart_get_status(unsigned long hartid)
 static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 {
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 	unsigned long hsm_data;
 	struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
 
@@ -107,7 +107,7 @@ static void sbi_cpu_stop(void)
 static int sbi_cpu_is_stopped(unsigned int cpuid)
 {
 	int rc;
-	int hartid = cpuid_to_hartid_map(cpuid);
+	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 
 	rc = sbi_hsm_hart_get_status(hartid);
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
