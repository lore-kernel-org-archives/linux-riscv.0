Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D223EC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:04:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5717F61922
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 00:04:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5717F61922
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=mail.ustc.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=frTCa0aiuNah+v9NQ7JPLm/KUR3HRimO48AMKI1Ci9Y=; b=lBoD5RPRk3FG4RWFXaJ/32j9B
	2pTXsEBR4TGuy8WZjUs32VF2v5Smp59Jg88kvt8QDE+QGIBZi3A7IKBbHV3F4g4gj42GOKICc3ZNo
	45LoGrZdQLAwtxLFmAPLRRX6r1GG/5AROZd6C9raQzX/6bp/3cVm6cbHaRfG64CLt159iivnBJZw8
	IckZpW7GIwQWT4kKc2OFkuMyfraBVr3uyWG1Hy2zlACi6XYyZQPSpBhbKNJ5bJOICWLkQBIq4SWP7
	T6v4MWZIo6FXYszIuet7cVI0OQhiT8A235sQa+jJ/F1NkFcFMPQ7BfExi/Yl4EQ893scxqmVq5MQc
	6Esn3mM7A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR1ro-0026Or-WF; Tue, 30 Mar 2021 00:04:21 +0000
Received: from email6.ustc.edu.cn ([2001:da8:d800::8] helo=ustc.edu.cn)
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQwdJ-0013SW-OR
 for linux-riscv@lists.infradead.org; Mon, 29 Mar 2021 18:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:Date:From:To:Cc:Subject:
 Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
 Content-Transfer-Encoding; bh=X3JnzAWB/wP2byqIVYcRzkGaaPhYaCeo9n
 v6lfgBPe0=; b=ciYwCT3No/H9XxjptM0VF/OY2o4gT28I5Kw7VbmnXEjTsDu4mf
 YsC1hh4Hvuul3+7dfes7tXCpnxr5rNaeT3+rm05riOI1g4KMOnote/sxQ5EcgzWR
 OEgbeXuq5a1pXFFi581bdlA3cwdSHNOFbsIHEz4ICpx4YZi1p/j/ZTpXU=
Received: from xhacker (unknown [101.86.19.180])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygCXnkpiHGJg2vRpAA--.2864S2; 
 Tue, 30 Mar 2021 02:28:50 +0800 (CST)
Date: Tue, 30 Mar 2021 02:23:54 +0800
From: Jisheng Zhang <jszhang3@mail.ustc.edu.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andrey Ryabinin
 <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, Andrey
 Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, "
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?=" <bjorn@kernel.org>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
 <andrii@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Song Liu
 <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, John Fastabend
 <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, Luke Nelson
 <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, netdev@vger.kernel.org, bpf@vger.kernel.org
Subject: [PATCH 4/9] riscv: Constify sbi_ipi_ops
Message-ID: <20210330022354.385a9a52@xhacker>
In-Reply-To: <20210330022144.150edc6e@xhacker>
References: <20210330022144.150edc6e@xhacker>
MIME-Version: 1.0
X-CM-TRANSID: LkAmygCXnkpiHGJg2vRpAA--.2864S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFyxuF4kuF1rWw17ZFyrJFb_yoW8tw1kpw
 4UCr45CFWrGFn7Ga43tFWku3y3K3ZrWwnIy34Yka45JFnIqrWUAan0qw12vwn8GFyDuFyS
 9r4rCrZ0vF1UAFDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUkKb7Iv0xC_Zr1lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
 0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
 A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
 jxv20xvEc7CjxVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjc
 xK6I8E87Iv6xkF7I0E14v26F4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40E
 FcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr
 0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY
 04v7MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
 0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y
 0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1I6r4UMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
 W8Jr0_Cr1UMIIF0xvE42xK8VAvwI8IcIk0rVW8JVW3JwCI42IY6I8E87Iv67AKxVW8JVWx
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnUUI43ZEXa7IU8tKsU
 UUUUU==
X-CM-SenderInfo: xmv2xttqjtqzxdloh3xvwfhvlgxou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_192902_779660_1620F28B 
X-CRM114-Status: GOOD (  10.75  )
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

Constify the sbi_ipi_ops so that it will be placed in the .rodata
section. This will cause attempts to modify it to fail when strict
page permissions are in place.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/smp.h | 4 ++--
 arch/riscv/kernel/sbi.c      | 2 +-
 arch/riscv/kernel/smp.c      | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index df1f7c4cd433..a7d2811f3536 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -46,7 +46,7 @@ int riscv_hartid_to_cpuid(int hartid);
 void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
 
 /* Set custom IPI operations */
-void riscv_set_ipi_ops(struct riscv_ipi_ops *ops);
+void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops);
 
 /* Clear IPI for current CPU */
 void riscv_clear_ipi(void);
@@ -92,7 +92,7 @@ static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
 	cpumask_set_cpu(boot_cpu_hartid, out);
 }
 
-static inline void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
+static inline void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
 {
 }
 
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index cbd94a72eaa7..cb848e80865e 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -556,7 +556,7 @@ static void sbi_send_cpumask_ipi(const struct cpumask *target)
 	sbi_send_ipi(cpumask_bits(&hartid_mask));
 }
 
-static struct riscv_ipi_ops sbi_ipi_ops = {
+static const struct riscv_ipi_ops sbi_ipi_ops = {
 	.ipi_inject = sbi_send_cpumask_ipi
 };
 
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index 504284d49135..e035124f06dc 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -85,9 +85,9 @@ static void ipi_stop(void)
 		wait_for_interrupt();
 }
 
-static struct riscv_ipi_ops *ipi_ops __ro_after_init;
+static const struct riscv_ipi_ops *ipi_ops __ro_after_init;
 
-void riscv_set_ipi_ops(struct riscv_ipi_ops *ops)
+void riscv_set_ipi_ops(const struct riscv_ipi_ops *ops)
 {
 	ipi_ops = ops;
 }
-- 
2.31.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
