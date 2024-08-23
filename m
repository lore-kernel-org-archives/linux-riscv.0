Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 979F2C52D7C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 09:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ybV2nWUesG4tDaLqNzrDJwN0BXr2jkAUUEnQjjyjRYs=; b=GIx29t1yHmTKag
	Mi8ifHgxNepGpptlYz+co/dIdJt5eUkIs2MviJ4r2hUJVB3blMG2cuwtdI/I56MqgBEU/58EjWxvp
	d+A/w5Y5aIlsI14i+nrZ+0p9tV2ZiqOfaN0V2waMDLreyBbBYKdiC0co5VGCtv26VwG6N/jozmmfx
	WV/83m3DOfwzgSCFIA7qVIRGS0mSckYsj57s5G0momdHz02BEXQIBJ6VP24HjH5RxC6e1OWGCxg4r
	DAZSRUAzHJ8W6npnjT37sjznoPSc74RTAiXciPGiaG3z+VACYlcbF+GwYkZlcWypzerK1DO7Fndo3
	nR+cHugQF87VLwamk96g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQMn-0000000G3HT-1mX1;
	Fri, 23 Aug 2024 09:13:57 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shQKF-0000000G2VP-0eVb
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 09:11:22 +0000
Received: from qiao.. (unknown [210.73.53.31])
	by APP-05 (Coremail) with SMTP id zQCowACnjzomUshmLIdhCQ--.39627S2;
	Fri, 23 Aug 2024 17:11:03 +0800 (CST)
From: Zhe Qiao <qiaozhe@iscas.ac.cn>
To: qiaozhe@iscas.ac.cn,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	evan@rivosinc.com,
	tglx@linutronix.de,
	andy.chiu@sifive.com,
	cleger@rivosinc.com,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Report error when repeatedly recording CPU hardware ID
Date: Fri, 23 Aug 2024 17:11:00 +0800
Message-ID: <20240823091100.598162-1-qiaozhe@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnjzomUshmLIdhCQ--.39627S2
X-Coremail-Antispam: 1UD129KBjvJXoW7WFW7ur45uw1Dtw18urWrGrg_yoW8GFyUpr
	W8Grs0krs8XFs7C3saq348Wr13JF1vgw4ftF1ft3WrtFsrCwnrJ39Yga43ZF15tF1rZ3WF
	yrs0yry5KF1DAa7anT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r4j6F4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFylc2xSY4AK67AK6r4fMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUjAsqtUUUUU==
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: ptld061kh6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_021119_581311_1B0B3BA8 
X-CRM114-Status: UNSURE (   9.39  )
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

In the of_parse_and_init_cpus() function, when the __cpuid_to_hartid_map[]
array records the CPU hardware ID, if the same CPU hardware attribute has 
been recorded, an error report is issued, thereby ensuring the uniqueness
of the CPU hardware ID recorded in the __cpuid_to_hartid_map[] array.

Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
---
 arch/riscv/kernel/smpboot.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0f8f1c95ac38..698f9fe791f7 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -118,6 +118,16 @@ static void __init acpi_parse_and_init_cpus(void)
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif
 
+static bool __init is_mpidr_duplicate(unsigned int cpuid, u64 hart)
+{
+	unsigned int i;
+
+	for (i = 1; (i < cpuid) && (i < NR_CPUS); i++)
+		if (cpuid_to_hartid_map(i) == hart)
+			return true;
+	return false;
+}
+
 static void __init of_parse_and_init_cpus(void)
 {
 	struct device_node *dn;
@@ -131,6 +141,12 @@ static void __init of_parse_and_init_cpus(void)
 		if (rc < 0)
 			continue;
 
+		if (is_mpidr_duplicate(cpuid, hart)) {
+			pr_err("%pOF: duplicate cpu reg properties in the DT\n",
+				dn);
+			continue;
+		}
+
 		if (hart == cpuid_to_hartid_map(0)) {
 			BUG_ON(found_boot_cpu);
 			found_boot_cpu = 1;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
