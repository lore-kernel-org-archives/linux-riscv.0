Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7B5C77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Apr 2023 16:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+5SIsfUGtcwq2S0FvUBCW3eIISpBcrsLjK02h2vgwfk=; b=YbTz5fPPrzD+gY
	q7Q7GQbBp9klfHfJ+B5ZxbcgZ52txniFXyieHfMYyKaXdBq/2tUocr7HZCdJ8aLnihsOzECyKdTi0
	sh8+RW04IJYkMQXV6DT4vJ96Yh9Y7TehxMOsOb4N+rUkW8eF/H2mEWXwsJ9LbAq7AD24Gg4i7eGgZ
	q0yQLIPTkdwmHxTFQ++PkHMunTFg3uCFzO/LgOmXJ0yA4lnpXuqOQ1frcYstLx+hdjg46oA2sroAs
	AdAZ2p2/6fbO/sOhWX5LkrLpyPv4k/6oGUT0ndkqaHaSynW4FylfD0WIMeP2SGcNIwfTD9nIwDodD
	umcutLZCr1/YQOE6arIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ps4bg-0070fH-26;
	Thu, 27 Apr 2023 16:36:32 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ps4bd-0070eZ-1G
	for linux-riscv@lists.infradead.org;
	Thu, 27 Apr 2023 16:36:30 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f19afc4f60so41757795e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 27 Apr 2023 09:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1682613387; x=1685205387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1E1TWVyqrbpkDmXEhMTPIQIWAldDkDry5PT9gSgTT70=;
        b=NSYz7qPcyQvzoxSx7yU0bJe8WIITUpjpQ7PinGv6EEt7O+CFRVLhAL/9YJCAxtc20X
         nT26mtM1xTfQ6f9EteL3RDAzi64rKgCl6w6tOF1cXPj3i4w0OLtSghnKioJJviHZGgvu
         m8pLoprFcOjkoeALw+ufQq3R1AADOsgMoVySIVyTpHPAtdpfc5DvG4gTVybewhvWEE4z
         9lq4VbFJtBRrPXyXzcdOqkT3XeNPY5pUJMzTGofETIzPxEdxpPPcg8tPmhQ3BjGIXOa3
         qN3n6uUpQabQ5MYmJnUs8ToN/j+U2zRX7UHKYuLPLfHhaPKe0fOIvMZNmiUuAScmlvA8
         hYWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682613387; x=1685205387;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1E1TWVyqrbpkDmXEhMTPIQIWAldDkDry5PT9gSgTT70=;
        b=ZmDqwhITDvQ6T76D3hO5IFDts/e5YXEl+h0xiK5kxzr+s3V0J/Z8iHnPJrLt1HWR4X
         hbQstnzCCWVyi0M3DwwC65H4VBnDoyoo8fiNSzPKRSJXnUiPww3GzMzQgPb5ee70neNm
         8dEbUs1IIdVEQEzNVE5cJvBXEBDk0RlEkEI2/pe4Vu+U1NvYFtwgyzlCKeaLyPr7NGB9
         dSGqGBu4nIPYIxUWMIEZ7rX12L8GLUleEQTccGjNeNgTVTGRYrjBjFty2I0vrQS7IoVx
         ThXv0YJUNy6A57a8GSw+SGQhkhdlkGRsZm/Vb+ETSQdALI5qNI1BXnKrt+3R1jr09MrC
         UDBw==
X-Gm-Message-State: AC+VfDzjez05cis60I5osRYenhQc3su5sbHYk4zo8iqz/YcLA9xCVk4a
	yfyntK0KYEW+dbjG8jgY6pyaz5LiEgvVvCxBje8=
X-Google-Smtp-Source: ACHHUZ4xsPKpQls0bBSSBx3gYhbqy4FQ4MGkOPAIfQVqHHI0/nNYIX6RdMzy+RNSfnAwyUGQMZrBvA==
X-Received: by 2002:a5d:5492:0:b0:304:a984:7cb5 with SMTP id h18-20020a5d5492000000b00304a9847cb5mr1884886wrv.50.1682613387546;
        Thu, 27 Apr 2023 09:36:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id b2-20020adff902000000b00304aba2cfcbsm2600200wrr.7.2023.04.27.09.36.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Apr 2023 09:36:26 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-pm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Cc: "'Rafael J . Wysocki '" <rafael@kernel.org>,
	'Atish Patra ' <atishp@atishpatra.org>,
	'Mark Rutland ' <mark.rutland@arm.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Will Deacon ' <will@kernel.org>,
	'Daniel Lezcano ' <daniel.lezcano@linaro.org>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Anup Patel ' <anup@brainfault.org>
Subject: [PATCH v2] RISC-V: Align SBI probe implementation with spec
Date: Thu, 27 Apr 2023 18:36:26 +0200
Message-Id: <20230427163626.101042-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230427_093629_454802_D98A0523 
X-CRM114-Status: GOOD (  14.11  )
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

sbi_probe_extension() is specified with "Returns 0 if the given SBI
extension ID (EID) is not available, or 1 if it is available unless
defined as any other non-zero value by the implementation."
Additionally, sbiret.value is a long. Fix the implementation to
ensure any nonzero long value is considered a success, rather
than only positive int values.

Fixes: b9dcd9e41587 ("RISC-V: Add basic support for SBI v0.2")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
v2:
  - Added Fixes tag and Conor's r-b

 arch/riscv/include/asm/sbi.h        |  2 +-
 arch/riscv/kernel/cpu_ops.c         |  2 +-
 arch/riscv/kernel/sbi.c             | 17 ++++++++---------
 arch/riscv/kvm/main.c               |  2 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c |  2 +-
 drivers/perf/riscv_pmu_sbi.c        |  2 +-
 6 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 945b7be249c1..119355485703 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -296,7 +296,7 @@ int sbi_remote_hfence_vvma_asid(const struct cpumask *cpu_mask,
 				unsigned long start,
 				unsigned long size,
 				unsigned long asid);
-int sbi_probe_extension(int ext);
+long sbi_probe_extension(int ext);
 
 /* Check if current SBI specification version is 0.1 or not */
 static inline int sbi_spec_is_0_1(void)
diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
index 8275f237a59d..eb479a88a954 100644
--- a/arch/riscv/kernel/cpu_ops.c
+++ b/arch/riscv/kernel/cpu_ops.c
@@ -27,7 +27,7 @@ const struct cpu_operations cpu_ops_spinwait = {
 void __init cpu_set_ops(int cpuid)
 {
 #if IS_ENABLED(CONFIG_RISCV_SBI)
-	if (sbi_probe_extension(SBI_EXT_HSM) > 0) {
+	if (sbi_probe_extension(SBI_EXT_HSM)) {
 		if (!cpuid)
 			pr_info("SBI HSM extension detected\n");
 		cpu_ops[cpuid] = &cpu_ops_sbi;
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 5c87db8fdff2..015ce8eef2de 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -581,19 +581,18 @@ static void sbi_srst_power_off(void)
  * sbi_probe_extension() - Check if an SBI extension ID is supported or not.
  * @extid: The extension ID to be probed.
  *
- * Return: Extension specific nonzero value f yes, -ENOTSUPP otherwise.
+ * Return: 1 or an extension specific nonzero value if yes, 0 otherwise.
  */
-int sbi_probe_extension(int extid)
+long sbi_probe_extension(int extid)
 {
 	struct sbiret ret;
 
 	ret = sbi_ecall(SBI_EXT_BASE, SBI_EXT_BASE_PROBE_EXT, extid,
 			0, 0, 0, 0, 0);
 	if (!ret.error)
-		if (ret.value)
-			return ret.value;
+		return ret.value;
 
-	return -ENOTSUPP;
+	return 0;
 }
 EXPORT_SYMBOL(sbi_probe_extension);
 
@@ -665,26 +664,26 @@ void __init sbi_init(void)
 	if (!sbi_spec_is_0_1()) {
 		pr_info("SBI implementation ID=0x%lx Version=0x%lx\n",
 			sbi_get_firmware_id(), sbi_get_firmware_version());
-		if (sbi_probe_extension(SBI_EXT_TIME) > 0) {
+		if (sbi_probe_extension(SBI_EXT_TIME)) {
 			__sbi_set_timer = __sbi_set_timer_v02;
 			pr_info("SBI TIME extension detected\n");
 		} else {
 			__sbi_set_timer = __sbi_set_timer_v01;
 		}
-		if (sbi_probe_extension(SBI_EXT_IPI) > 0) {
+		if (sbi_probe_extension(SBI_EXT_IPI)) {
 			__sbi_send_ipi	= __sbi_send_ipi_v02;
 			pr_info("SBI IPI extension detected\n");
 		} else {
 			__sbi_send_ipi	= __sbi_send_ipi_v01;
 		}
-		if (sbi_probe_extension(SBI_EXT_RFENCE) > 0) {
+		if (sbi_probe_extension(SBI_EXT_RFENCE)) {
 			__sbi_rfence	= __sbi_rfence_v02;
 			pr_info("SBI RFENCE extension detected\n");
 		} else {
 			__sbi_rfence	= __sbi_rfence_v01;
 		}
 		if ((sbi_spec_version >= sbi_mk_version(0, 3)) &&
-		    (sbi_probe_extension(SBI_EXT_SRST) > 0)) {
+		    sbi_probe_extension(SBI_EXT_SRST)) {
 			pr_info("SBI SRST extension detected\n");
 			pm_power_off = sbi_srst_power_off;
 			sbi_srst_reboot_nb.notifier_call = sbi_srst_reboot;
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 41ad7639a17b..c923c113a129 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -75,7 +75,7 @@ static int __init riscv_kvm_init(void)
 		return -ENODEV;
 	}
 
-	if (sbi_probe_extension(SBI_EXT_RFENCE) <= 0) {
+	if (!sbi_probe_extension(SBI_EXT_RFENCE)) {
 		kvm_info("require SBI RFENCE extension\n");
 		return -ENODEV;
 	}
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index be383f4b6855..c6b599167036 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -613,7 +613,7 @@ static int __init sbi_cpuidle_init(void)
 	 * 2) SBI HSM extension is available
 	 */
 	if ((sbi_spec_version < sbi_mk_version(0, 3)) ||
-	    sbi_probe_extension(SBI_EXT_HSM) <= 0) {
+	    !sbi_probe_extension(SBI_EXT_HSM)) {
 		pr_info("HSM suspend not available\n");
 		return 0;
 	}
diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 70cb50fd41c2..4f3ac296b3e2 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -924,7 +924,7 @@ static int __init pmu_sbi_devinit(void)
 	struct platform_device *pdev;
 
 	if (sbi_spec_version < sbi_mk_version(0, 3) ||
-	    sbi_probe_extension(SBI_EXT_PMU) <= 0) {
+	    !sbi_probe_extension(SBI_EXT_PMU)) {
 		return 0;
 	}
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
