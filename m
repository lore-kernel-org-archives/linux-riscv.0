Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 497E1C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 03:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9BZMiaR8QabiJTe6ejToGtI5OrYT4w0d68Zpkvr47HI=; b=kSg2gPcyevHX8+
	NOXKFeESmyl8UuHhaapcPj0NaPW+QU6sTe7iEFGRUcCjYEZwmRGW5vu5+bqz2A9rfbdZuSXIAjbUa
	JebQV0XpgoqbTQArfK8WlH9nHIbKKNNxoG+oTPW1ZEuuyr3YK+Lk5U5YsTwAB42fvGTuAowPR/Yzq
	kIuWMFNkalBa4WSGu9RnEcLBEqVHSbhxeMEL+JDgpdFnMsvilVDtafJGLXiQ6c4Z+lBoErSu48hd6
	Vq8DhU8iNTuOr2ygI7nZNZ3bzheunvOwFXQ2amstE2mH6xbG5wqqyvStFUrk2mxLHw+4umuv2b+ar
	TpO3r1ZmjkI64fO4ZMEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj99k-0000000Db24-3kDz;
	Wed, 28 Aug 2024 03:15:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj86F-0000000DRGX-0mp7
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Aug 2024 02:07:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=cBLBtpXcxfQzmOyUBk4IUQHmoLQCCNDtpqHJRXc82Cs=; b=mxO+DUNObkXs8qydYv6igIciZS
	ljMra4O2U5INL8nrOi12u1W12BRJ+6Sw2A2AsVQ7d2QaKAJOIqZLMJ2QCd47QYa1JA7/s6nhHp+jy
	zAM/1hcs1EJIqyXk9fDmZvCfJ48jY/YtSQc17M3yJbS3FblFFFA9GCEUvR6sSsRB5agFTpre8d7fU
	hxGdxeAjk6nVXn7DFyQzGNPg+DesJMlvDady/LEdYh1N2mqxe+0IDeHCDaaB8OoEkyiIf5DHEtC8a
	1WZ96nMobziAVROE1434SpJ7F/YF/qOYvTmX+Q0JumMsFphonmnAAVGQmIei9w4jstqTJ8fT219nx
	quBuDdlQ==;
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sj867-0000000B0LU-05pr
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 02:07:54 +0000
Received: from qiao.. (unknown [210.73.53.31])
	by APP-05 (Coremail) with SMTP id zQCowACnEUFahs5mJkzmCg--.9771S2;
	Wed, 28 Aug 2024 10:07:24 +0800 (CST)
From: Zhe Qiao <qiaozhe@iscas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	samuel.holland@sifive.com,
	evan@rivosinc.com,
	sunilvl@ventanamicro.com,
	ajones@ventanamicro.com,
	andy.chiu@sifive.com,
	tglx@linutronix.de,
	qiaozhe@iscas.ac.cn
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: Report error when repeatedly recording CPU hardware ID
Date: Wed, 28 Aug 2024 10:07:18 +0800
Message-ID: <20240828020718.46977-1-qiaozhe@iscas.ac.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowACnEUFahs5mJkzmCg--.9771S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1DAFWrKFWUGr15KF45KFg_yoW8Jw47pr
	W8Grs0krsYvFsFk34Sqa4xuFy3JF1vgw4ftF4fta4rJr1UAwnrJ39xKa43ZF15tF48X3Wr
	AF4Yyr1YgFyUCa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [210.73.53.31]
X-CM-SenderInfo: ptld061kh6x2xfdvhtffof0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_030750_491853_DBC17828 
X-CRM114-Status: GOOD (  10.46  )
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

If the same CPU hardware attributes exist, the boot is aborted.
Ensure the uniqueness of the CPU hardware ID recorded in the
__cpuid_to_hartid_map[] array.

Signed-off-by: Zhe Qiao <qiaozhe@iscas.ac.cn>
---
V1 -> V2:
  1. Change the error report to BUG().
  2. Change the function name to is_cartid_duplicate().
  3. Modify commit description.
---
 arch/riscv/kernel/smpboot.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0f8f1c95ac38..f29a6fd55aa8 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -118,6 +118,16 @@ static void __init acpi_parse_and_init_cpus(void)
 #define acpi_parse_and_init_cpus(...)	do { } while (0)
 #endif
 
+static bool __init is_hartid_duplicate(unsigned int cpuid, u64 hart)
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
@@ -131,6 +141,9 @@ static void __init of_parse_and_init_cpus(void)
 		if (rc < 0)
 			continue;
 
+		if (is_hartid_duplicate(cpuid, hart))
+			BUG_ON(1);
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
