Return-Path: <SRS0=Jr9t=KL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEE8C433B4
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 13:05:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D595C60C3D
	for <linux-riscv@archiver.kernel.org>; Sun, 16 May 2021 13:05:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D595C60C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gyvQ19KEAkEW/dgtDhYQzDOGToMUN1z15JBA9n9EzcE=; b=XsXw0SQ53BZtH/
	2PWrF3r3THbH4nqGiGyb1ee5CtD0kvkhCF2yjfM67q/BLtVlgT8TYjAQabt2E90L6S6TlAbBiWOJP
	R9xJT9LH7aB6YEMsSvmlQZZyNT4FWEjp9ZoyAcaSmtmyipqwSboLmD0UFKCociDpjF17nVdg0xw3Q
	L9GjipyR1gWlIVw+H4UDTyb8vJv4B+sOr7iQE7Dby5nunUnyYYMm6dPNR2jzrkmQioCm2Q+Mozi/I
	+nDPuxjYZ0+m92SW8G328OTzNfx+u/SoZ3EZKBhGOQB8mHbu9Tv5ARe0aYZSap0FAClznFiR3XNjl
	/LEscFsmdTr0gGBMsd+w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liGSP-00CGMC-Ka; Sun, 16 May 2021 13:05:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liGSM-00CGLy-Rr
 for linux-riscv@desiato.infradead.org; Sun, 16 May 2021 13:05:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9XSWgvtGgHdvv9Bbyxs7s1XV1bpHtBG/T4fhJlW4Qv8=; b=j0BPer4vb/OLrnMIxJTpPrE4+m
 ripyXnkZIRjj+IGemJInKEEH/NJuuzg1wArb/ToQ4Nr6tzTOcp63Y9az9ssqtZA83AEXRNn1VNiEq
 aiAEcZJ2Kp4XrSGqpRt3zvzWIp5YDXhUaHgNk+50n5lbd5jiw4J6g0X3wau8f/pbWCl/+Y5uxj0oh
 58AtF6ZXh+LcnML4nUzaP0JA7roIZMNVx2Rt5lAV11u2HwExK598uphsXQq/5AcLzlxqFaGQkeLol
 /JSXIcIh4RwSNZgDBIROtJ8JADDpOC3UaY9LMvqUMdDdKafQVIA4YX7cOLbabFufPpTNn4Z9co4nI
 LVCyHHMg==;
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1liGSE-00Cvl6-Or
 for linux-riscv@lists.infradead.org; Sun, 16 May 2021 13:05:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Subject:
 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
 bh=9XSWgvtGgHdvv9Bbyxs7s1XV1bpHtBG/T4fhJlW4Qv8=; b=RuVSp13QeD5l6
 CTo0p/2zptFllZH4Vpzp1xS8ZSomDQO/9f8nReNr5SQNl0puyCDQJoSaArGr21ui
 rD/XbdRjoTUogL/YYZoS2iKF7FsAow1RnMEnCWduJZgmV2tFEfrbQKvTPJrjtkSq
 8qYzOh1dXYwVnBapXxIcLUM4qu1IaI=
Received: from xhacker (unknown [101.86.20.15])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygBnbzd7GKFgmcroAA--.17615S2; 
 Sun, 16 May 2021 21:04:59 +0800 (CST)
Date: Sun, 16 May 2021 20:59:42 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Add __init section marker to some functions again
Message-ID: <20210516205942.4671f4e6@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygBnbzd7GKFgmcroAA--.17615S2
X-Coremail-Antispam: 1UD129KBjvJXoW7GFyDJF4kJFWfJry5XFWkZwb_yoW8Jr4Dpr
 W0kr4F9rWY9Fn7Ca42yrykuFy5J3ZYg3W3Kr1UCas5JFsxJ3yqv3Z5Za4UZr1qqFykuF9Y
 kry5Cry2vw18A37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_tr1lb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I
 8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
 64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
 Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41l42xK82IYc2Ij64vIr41l4I8I3I0E
 4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGV
 WUWwC2zVAF1VAY17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_
 Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rV
 WrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
 Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07jY6wZUUUUU=
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210516_060511_825603_19914A31 
X-CRM114-Status: UNSURE (   8.67  )
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

From: Jisheng Zhang <jszhang@kernel.org>

These functions are not needed after booting, so mark them as __init
to move them to the __init section.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 arch/riscv/mm/context.c        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a2848dc36927..d959d207a40d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -59,7 +59,7 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit)
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
-void riscv_fill_hwcap(void)
+void __init riscv_fill_hwcap(void)
 {
 	struct device_node *node;
 	const char *isa;
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 6d445f2888ec..63dc0b9bd8aa 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -213,7 +213,7 @@ static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
 		set_mm_noasid(mm);
 }
 
-static int asids_init(void)
+static int __init asids_init(void)
 {
 	unsigned long old;
 
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
