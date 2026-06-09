Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE0D8CD8CBE
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jun 2026 11:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WZRQuae0g+Ttf8boAHGg3AMZv7GFnwiudAbB0wCv8TU=; b=a63bigbNuMwgd8
	QHKeo2xcpO0z9d1KelamEjNqDxXFIfKweTkGnglUaPkqX2q9S75HR6WWrSvdY8em1ZUFzg3F/UghZ
	c2D/mofekFG7oO46U+Mz82mHLpYx0uwbugTDnoTE5vjojsCUvy2YqDXTWPO+3B6kmngjUamYI/zam
	JoUJgsZ/HCEoBQpS6XJX5gbpG9QiSa4nnpe/Ws7nQSGqcZ+5TwF0uO8Yg5QFAwxUQ7+KivwR/5ydP
	J+GB4ZyLmClJDDC782lyrTLPUuVvKND75D/9K5f526LCYt2i283C5J1ggTchbpLO1o/MXntI/yXCq
	Q3rFy1B9MrojYjpFG9sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWudt-00000005RWO-3UeV;
	Tue, 09 Jun 2026 11:29:13 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWudq-00000005RW2-3VuQ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jun 2026 11:29:12 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4gZRWL1Dvlz8XrrZ;
	Tue, 09 Jun 2026 19:29:02 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 659BSrsS033473;
	Tue, 9 Jun 2026 19:28:53 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Tue, 9 Jun 2026 19:28:56 +0800 (CST)
X-Zmail-TransId: 2b036a27f8f811d-2718c
X-Mailer: Zmail v1.0
Message-ID: <20260609192856874Y8AaPpKL5TnmbgiWI8DI3@zte.com.cn>
Date: Tue, 9 Jun 2026 19:28:56 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <linux-acpi@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIXSBBQ1BJOiBSSVNDLVY6IEZpeCBmYWxzZSB3YXJuaW5nIGluIGNwcGNfcmVhZF9mZmgoKSBmb3Igc2FtZS1DUFUgcmVhZHM=?=
X-MAIL: mse-fl1.zte.com.cn 659BSrsS033473
X-TLS: YES
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Tue, 09 Jun 2026 19:29:02 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6A27F8FE.000/4gZRWL1Dvlz8XrrZ
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_042911_066773_66F23200 
X-CRM114-Status: UNSURE (   8.95  )
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
Cc: zhanjie9@hisilicon.com, aou@eecs.berkeley.edu, alex@ghiti.fr, rafael@kernel.org, viresh.kumar@linaro.org, zhenglifeng1@huawei.com, pierre.gondois@arm.com, palmer@dabbelt.com, pjw@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Wang Yechao <wang.yechao255@zte.com.cn>

Commit 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in
ticks for non-PCC regs") changed the CPPC Frequency Invariance Engine
to read AMU counters directly from the scheduler tick for non-PCC
register spaces (like FFH), instead of deferring to a kthread. This
means cppc_read_ffh() is now called with IRQs disabled from the tick
handler, triggering the warning.

This is the same fix as commit df6e4ab654dc ("arm64: topology: Fix
false warning in counters_read_on_cpu() for same-CPU reads").

Fixes: 997c021abc6e ("cpufreq: CPPC: Update FIE arch_freq_scale in ticks for non-PCC regs")
Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 drivers/acpi/riscv/cppc.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/riscv/cppc.c b/drivers/acpi/riscv/cppc.c
index 42c1a9052470..5dce0377a8df 100644
--- a/drivers/acpi/riscv/cppc.c
+++ b/drivers/acpi/riscv/cppc.c
@@ -98,16 +98,19 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 {
 	struct sbi_cppc_data data;

-	if (WARN_ON_ONCE(irqs_disabled()))
-		return -EPERM;
-
 	if (FFH_CPPC_TYPE(reg->address) == FFH_CPPC_SBI) {
 		if (!cppc_ext_present)
 			return -EINVAL;

 		data.reg = FFH_CPPC_SBI_REG(reg->address);

-		smp_call_function_single(cpu, sbi_cppc_read, &data, 1);
+		if (irqs_disabled()) {
+			if (WARN_ON_ONCE(cpu != smp_processor_id()))
+				return -EPERM;
+			sbi_cppc_read(&data);
+		} else {
+			smp_call_function_single(cpu, sbi_cppc_read, &data, 1);
+		}

 		*val = data.ret.value;

@@ -115,7 +118,13 @@ int cpc_read_ffh(int cpu, struct cpc_reg *reg, u64 *val)
 	} else if (FFH_CPPC_TYPE(reg->address) == FFH_CPPC_CSR) {
 		data.reg = FFH_CPPC_CSR_NUM(reg->address);

-		smp_call_function_single(cpu, cppc_ffh_csr_read, &data, 1);
+		if (irqs_disabled()) {
+			if (WARN_ON_ONCE(cpu != smp_processor_id()))
+				return -EPERM;
+			cppc_ffh_csr_read(&data);
+		} else {
+			smp_call_function_single(cpu, cppc_ffh_csr_read, &data, 1);
+		}

 		*val = data.ret.value;

-- 
2.43.5

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
