Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB71C10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 18:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=volWgzCZAkhyUXl+HsBiNnQKv1guR9hI02H8w5GtWeM=; b=MwgTJTZOLVfN1l
	a7Ym5ARKuSiSJWsycThqsw7hi9iRIR90gWAcyXSUeWE/hEwKiccSrEWPCUj5gDi9+UMhVuSJvTj75
	hzzWeHFkaLzXCDU/fe04DOESSpb8jVFq98mOrC5xFhqgankcCLDjMyHEErYjtn1QMisoFl/77Kt7Q
	hLvqoJGqBDb6QPTCbOy+KpfXlTbvUCBWBEH6PHBdZc5OzoqSTsxfQou4KLGnsfNsEII++9BQ/3JA9
	mnJHV4kUiI9WhtcZ91Tt8ET3bZ/h8Wjq96jbAvw8+1PudR4kVCMZHj4aK0f83804wiGUtR00V67/I
	nX8THoCBZcRC2+ynuG9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtL-0086lk-2R;
	Tue, 05 Dec 2023 18:11:31 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAZtI-0086i8-0v
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 18:11:29 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a1d450d5c11so17740766b.3
        for <linux-riscv@lists.infradead.org>; Tue, 05 Dec 2023 10:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1701799885; x=1702404685; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUVfYhEWEIN79Rgo/fTCZLpVlj3ymRf4CHKAY/mO0w8=;
        b=e2Ia5GAGByM9PRGkQEizXgGYUP+mVnQdgI2Z38I6bYzuSrYJQiSSbEPnHLI6VO7d2y
         xy4M8ZVfwGXNV20ux7FOtwD/ckWaJpgXfxDD2XDCpSb7xpmtfP/IFB2wdU47dk9m7pQl
         RpvleJQIkUuMmIasfB7rVZUn/GCWwKHmN6YvlxqHjxjmLovY6B54FrcR7J56STL1jNYe
         2u9LiEyqEuq2+4kWa4WFLl+6wU5Om4RR3TlGpFqEwNmqGw3yrlOr4scge0Xst0wiITYi
         vxD6MxeV83jUCl3nRUwmVF1cXZ2XDwDlK4+t0AUME8o8DvjWqBjgO1hE8wyPNsc+qgs9
         YASA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701799885; x=1702404685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUVfYhEWEIN79Rgo/fTCZLpVlj3ymRf4CHKAY/mO0w8=;
        b=XVL1kwUyoNOBN6/C26qPjJgVTmuGmOT/BAq0Ulaq77GHwIqd/A1dZ8GpcyHIhVAswz
         mLd2OJRVNxPWyauBTjJzPsL7hoOB3udREN4ofwNaaD3GUE+FJsEHgQh5cAfzu0t21mOp
         Zb/9Q76+mbqDMGe+OIlgAUZswOtAsy8mEEtbElrsokbpWewOziyfLaxmzch/ukYtiwWb
         7cf55iDkIKG7ODgXpJMo9kktx3VY4izk+prPK0bnEk43peTqgVd2CdnhJStb7Q6u7CEy
         xAs7x3o07Dg2SObFdBfJ3BlMb8a8WdFhSfbKhEPLxsWgXT1twcwe/lXDzvwVUim2fGP+
         HpAQ==
X-Gm-Message-State: AOJu0YzfImPTHmnnXl6fQzKV6RSh0/NZSjS2jwWp/lOgoTdYGOn1XJTF
	plPFhZmrmPT/SrcLVsLDRXrnIg==
X-Google-Smtp-Source: AGHT+IGlKEyEdezq1VEkWw9MEwXrbWWNV5JvIs9OhSKBme3XS3JbSQ2K0LCihus5cFUwdwbwAmPiUQ==
X-Received: by 2002:a17:907:9254:b0:a19:a19b:55ff with SMTP id kb20-20020a170907925400b00a19a19b55ffmr720720ejb.143.1701799885049;
        Tue, 05 Dec 2023 10:11:25 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id o26-20020a170906289a00b009e5ce1acb01sm7024197ejd.103.2023.12.05.10.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Dec 2023 10:11:24 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org
Cc: anup@brainfault.org,
	atishp@atishpatra.org,
	pbonzini@redhat.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	jgross@suse.com,
	srivatsa@csail.mit.edu,
	guoren@kernel.org
Subject: [PATCH v1 03/14] RISC-V: paravirt: Implement steal-time support
Date: Tue,  5 Dec 2023 19:11:23 +0100
Message-ID: <20231205181119.207204-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231205181119.207204-16-ajones@ventanamicro.com>
References: <20231205181119.207204-16-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_101128_336320_915C1AAE 
X-CRM114-Status: GOOD (  16.12  )
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

When the SBI STA extension exists we can use it to implement
paravirt steal-time support. Fill in the empty pv-time functions
with an SBI STA implementation.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/paravirt.c | 67 ++++++++++++++++++++++++++++++++++--
 1 file changed, 64 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/paravirt.c b/arch/riscv/kernel/paravirt.c
index 141dbcc36fa2..b509bcc7292a 100644
--- a/arch/riscv/kernel/paravirt.c
+++ b/arch/riscv/kernel/paravirt.c
@@ -6,12 +6,21 @@
 #define pr_fmt(fmt) "riscv-pv: " fmt
 
 #include <linux/cpuhotplug.h>
+#include <linux/compiler.h>
+#include <linux/errno.h>
 #include <linux/init.h>
 #include <linux/jump_label.h>
+#include <linux/kconfig.h>
+#include <linux/kernel.h>
+#include <linux/percpu-defs.h>
 #include <linux/printk.h>
 #include <linux/static_call.h>
 #include <linux/types.h>
 
+#include <asm/barrier.h>
+#include <asm/page.h>
+#include <asm/sbi.h>
+
 struct static_key paravirt_steal_enabled;
 struct static_key paravirt_steal_rq_enabled;
 
@@ -31,24 +40,76 @@ static int __init parse_no_stealacc(char *arg)
 
 early_param("no-steal-acc", parse_no_stealacc);
 
+DEFINE_PER_CPU(struct sbi_sta_struct, steal_time) __aligned(64);
+
 static bool __init has_pv_steal_clock(void)
 {
+	if (sbi_spec_version >= sbi_mk_version(2, 0) &&
+	    sbi_probe_extension(SBI_EXT_STA) > 0) {
+		pr_info("SBI STA extension detected\n");
+		return true;
+	}
+
 	return false;
 }
 
-static int pv_time_cpu_online(unsigned int cpu)
+static int sbi_sta_steal_time_set_shmem(unsigned long lo, unsigned long hi,
+					unsigned long flags)
 {
+	struct sbiret ret;
+
+	ret = sbi_ecall(SBI_EXT_STA, SBI_EXT_STA_STEAL_TIME_SET_SHMEM,
+			lo, hi, flags, 0, 0, 0);
+	if (ret.error) {
+		if (lo == SBI_STA_SHMEM_DISABLE && hi == SBI_STA_SHMEM_DISABLE)
+			pr_warn("Failed to disable steal-time shmem");
+		else
+			pr_warn("Failed to set steal-time shmem");
+		return -ENOMEM;
+	}
+
 	return 0;
 }
 
+static int pv_time_cpu_online(unsigned int cpu)
+{
+	struct sbi_sta_struct *st = this_cpu_ptr(&steal_time);
+	phys_addr_t pa = __pa(st);
+	unsigned long lo = (unsigned long)pa;
+	unsigned long hi = IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) : 0;
+
+	return sbi_sta_steal_time_set_shmem(lo, hi, 0);
+}
+
 static int pv_time_cpu_down_prepare(unsigned int cpu)
 {
-	return 0;
+	return sbi_sta_steal_time_set_shmem(SBI_STA_SHMEM_DISABLE,
+					    SBI_STA_SHMEM_DISABLE, 0);
 }
 
 static u64 pv_time_steal_clock(int cpu)
 {
-	return 0;
+	struct sbi_sta_struct *st = per_cpu_ptr(&steal_time, cpu);
+	u32 sequence;
+	u64 steal;
+
+	if (IS_ENABLED(CONFIG_32BIT)) {
+		/*
+		 * Check the sequence field before and after reading the steal
+		 * field. Repeat the read if it is different or odd.
+		 */
+		do {
+			sequence = READ_ONCE(st->sequence);
+			virt_rmb();
+			steal = READ_ONCE(st->steal);
+			virt_rmb();
+		} while ((le32_to_cpu(sequence) & 1) ||
+			 sequence != READ_ONCE(st->sequence));
+	} else {
+		steal = READ_ONCE(st->steal);
+	}
+
+	return le64_to_cpu(steal);
 }
 
 int __init pv_time_init(void)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
