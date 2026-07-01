Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F1CC43602
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GxjNOT30FJD/kKkiq5bg46IUBgdbQP4cndswIyCqP0s=; b=cos4QZCPQPtZQ4
	RwmX7nTGxaQsfAfH8Ps3vOMgvNj5rsbX9m5WVrxiJZRg/baRnd3fMK1J2/lIKZuuOIsAeSdkOiOz1
	IaNVlx3Ka4iGDDrS0fweeGhS57Q9cFr4vcW1POs9ZCueAzcF+P5u+LfBprJvK0FApW2qWtxAj0tHv
	DxYqweq8jwvyumY0dgHsiGPVuCUQazDEq9kUyHAeLRL3Ou/jDvnR2eo20eR8J5GbWfCDkYbScMxif
	jFeQLgnzc3LWF8lrPUbW8WRyMKjd5A05z0sD0/Of2Xcv+PB/5uvkUjhlTcYxMGe49Zsuze/GIj+Ke
	HRuZha7d/zWjcn5m9vTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuTD-000000024eH-1vvo;
	Wed, 01 Jul 2026 12:55:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weuTB-000000024cw-3nSf
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Jul 2026 12:55:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=EroqQiItWF/5lEtz72HFMxBsfBPJ4HAZsMtLOvEmqnc=; b=Rwj7kCxrvUn5b9+EZDekCVEGMh
	WoJswAEmYqqh7/edlpRpd5Ui/+1HfNt55Jwy0PDPpIZvqcP2vPsZoXb6BmMzBViUe4MEWPgnJ9rxe
	kyIL1V2dUyp1NL3Tjc1xvWoVNzpOFfs9QeQSbtsgYKXAuLkwzCwg5lxSrufDIHEVdrZBe3Kvr2UX/
	AppVr9sYGYlqrFtlItXrq47vs8bKZ6HOXWXco3WlDMIVcksKN3Ta1EATLN15BypzC4zPYXzEVEyX0
	TF9GYnojIEGK49j+oQG4mGYDPZa88xw49Fw5AjFsI4GjqlzblsSwJ/c5p9NdI5kQHAh6b84NnrLY4
	4h5CxWew==;
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1weuT8-00000002mn0-3NJk
	for linux-riscv@lists.infradead.org;
	Wed, 01 Jul 2026 12:55:12 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-845537740ddso354559b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2026 05:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782910508; x=1783515308; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EroqQiItWF/5lEtz72HFMxBsfBPJ4HAZsMtLOvEmqnc=;
        b=hVCIEb9HTSSq/JjecH5ybF7yAfbQrfyag+QbJTjVb68Erj/boYLtFC3GLnHbz+rhAD
         ukfW6GrnemBJlnrJh98SW30FIv26Om7exKVpTAjbD8Y7bwgINiVTLvUppxgqp7B9/EKB
         crkrlldZD8kmIoRDF+KYlI6IRlU78T8wrH4O/A/PMecRCtV+LtnjYAbYoak/qaxdIyp6
         CPOcaVZ2LCmnTZ8y4U6fLLQctR5AvXRi+lsirfItSjT/sqyVOSxxQAYkd+7RJAzyNSms
         rzlq9CzrrhgYbRks/Vl9CJruJpNfH0esMv2ebpM6tBl/sLbUqfDMkjt63ekl1JzpzBAD
         7kZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782910508; x=1783515308;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EroqQiItWF/5lEtz72HFMxBsfBPJ4HAZsMtLOvEmqnc=;
        b=Cjv3Pfxb739tSLw4oXbCX3yKSNSDYx/YE2votkHQyBmoVEDqOKNb/6TNaG1aRV+ZfK
         rCcubKhtUzFV0orqEXn24VZAIUX7WF+CR5uOU+X/kZuqbPpLft/CcD1UzR64k4VMQrak
         XS8+g/0PdD36HqKyTbEEFMk+eBJeeleRP7U4ewuJPgxrL1YOInObE93MsKW6OyriQOB5
         lX/h8A64SbxRylzfN3ddkWWs5jcIvZmNTRA7ONDryqt6GgH5SQYh+hnwkqrMUCv/PqLj
         WRg5QZtkigsfiGRHYI6xNAQHq8WSt86NYzKKKPrKJiahBZqowhRojDP+9RacBuWkej7i
         ZGcQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr5D0vG3dpVjHZB+22sea3co8th9+yz+Wz/Q/0oOJHvGAyYqQjMklOFvbKAmC+eGTA44KHEbgq5HZQAZw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3aK9xvYb0BBqjxalQ/HqTh+W2sptj2dY+htJx49ca0eXkcJrL
	92RyiXmy8Hu+WDtgmDkpvzYDBFxYOu6hFhoErR/IFCmdIEpYgOsTtI0E
X-Gm-Gg: AfdE7cmZdaEuW/31gVP/6/C/Fm2LN+Wx1VUHxs5fzAzTXLxe7oTNhmt8MAf0l89F9KR
	uOQO7ZbC/v18KHxnscl9m0ApLxD1txXqUV+8u67Dij4mnxucVVzjABRLFDts+rwTg8pXmwpRw/Y
	4W3iswHQVoCwyYFh/crLchaerJeRTgqJRO9TV5K2Z3fGrb2rge1XZR2qblgMg0Q/oSd/WLRFqQq
	rM5HSnQlCw9EDoEqEBWysE6+icFa/pIqkoYF63FZLwLlB63PNlNsY4bWwCAhyc3vPWrbzdqf4l2
	vZUv7dOHiqrIxd8mcxLSEX9aU5W/1d7cFY/EzC4Fxw7jGAc6lwhU0gcyXWBKsuk+u6quaHYEQso
	u4yYI9wQtMIVW2aFHGkq9xlJjjw2hBCXBaW2BeZIJGzD9LU+TWXY4s9QhvntZ4BRVK1RRonuuMT
	YRCfD1A9whoKk2GERZupj7
X-Received: by 2002:a05:6a00:4299:b0:845:d274:c024 with SMTP id d2e1a72fcca58-847c51eff2bmr594580b3a.61.1782910507939;
        Wed, 01 Jul 2026 05:55:07 -0700 (PDT)
Received: from [127.0.1.1] ([120.244.9.45])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a03778basm3999403b3a.49.2026.07.01.05.54.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 05:55:07 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 01 Jul 2026 08:52:28 -0400
Subject: [PATCH v5 15/17] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260701-rva23u64-hwprobe-v2-v5-15-2c61f94a695a@gmail.com>
References: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
In-Reply-To: <20260701-rva23u64-hwprobe-v2-v5-0-2c61f94a695a@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Chen Wang <chen.wang@linux.dev>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Jesse Taube <jtaubepe@redhat.com>, 
 Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, devicetree@vger.kernel.org, 
 spacemit@lists.linux.dev, sophgo@lists.linux.dev, 
 linux-kselftest@vger.kernel.org, Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=6016; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=SVIa4L8k84ckCPyHRMWQbuV12ITePXE/vVAii5SjE4s=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhixX3vbKL4XCy56dmdCTfL13h/g5z9/zTESLDzx4rOa37
 YTe3pDFHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCR4gOMDJts5O7KtM5beqor
 6MtRLmZtzvajOpL55t//if5Rm+Tyy5rhn/qeOwf+P8wT5ufQmXriU9G58k/5Z46smxZ3oCUp74S
 IPBMA
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_135510_943721_8F7381D9 
X-CRM114-Status: GOOD (  15.11  )
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

Introduce a per-hart and host-wide bitmap of conformant ISA "bases"
(named profile-class sets such as IMA and RVA23U64), computed at init
time by riscv_init_isa_bases().

Register riscv_init_isa_bases() as a subsys_initcall so it executes
after core_initcall(tagged_addr_init), which probes senvcfg.PMM and
populates have_user_pmlen_*.  Without that ordering,
riscv_have_user_pmlen(7) would still return its default false and the
RVA23U64 detection path would always bail.

Consider this as the cache that subsequent consumers (hwprobe's
RVA23U64 base behavior bit, /proc/cpuinfo's "isa bases" lines, etc.)
can read without recomputing. System-wide consistency are ensured.

Signed-off-by: Andrew Jones <andrew.jones@oss.qualcomm.com>
Signed-off-by: Guodong Xu <docular.xu@gmail.com>
---
v5: No change.
v4:
- In riscv_set_isa_base(), reorder those __setbit(RISCV_ISA_EXT_X,m)
  lines to make them conform to the order they appear in the RVA23 1.0
  Profile.
v3:
- Add a blank line before the subsys_initcall() registration (Andrew).
- Set the local ext_mask with __set_bit() and test the mandate set with
  !bitmap_subset() (Sashiko).
- Require the Zic64b ISA extension in the RVA23U64 mask,
  instead of open-coded cache block-size check. (New, thoughts from Andrew)
v2:
- Implement riscv_init_isa_bases() that runs at system init time,
  after tagged_addr_init() populates have_user_pmlen_*.
- Split RVA23S64 placeholder into a future patch.
---
 arch/riscv/include/asm/cpufeature.h | 14 ++++++
 arch/riscv/kernel/cpufeature.c      | 90 +++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 739fcc84bf7b2..facc31b2960c6 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -25,10 +25,24 @@ struct riscv_cpuinfo {
 	unsigned long mimpid;
 };
 
+enum {
+	RISCV_ISA_BASE_IMA,
+	RISCV_ISA_BASE_RVA23U64,
+	RISCV_NR_ISA_BASES,
+};
+
+/**
+ * struct riscv_isainfo - per-hart ISA state
+ * @isa: bitmap of ISA extensions this hart implements
+ * @isa_bases: bitmap of profile bases this hart conforms to
+ */
 struct riscv_isainfo {
 	DECLARE_BITMAP(isa, RISCV_ISA_EXT_MAX);
+	DECLARE_BITMAP(isa_bases, RISCV_NR_ISA_BASES);
 };
 
+extern unsigned long riscv_isa_bases[BITS_TO_LONGS(RISCV_NR_ISA_BASES)];
+
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
 extern const struct seq_operations cpuinfo_op;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 4c3bf813af052..fa8471aef42ee 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -41,6 +41,9 @@ unsigned long elf_hwcap __read_mostly;
 /* Host ISA bitmap */
 static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
 
+/* Host ISA bases bitmap */
+DECLARE_BITMAP(riscv_isa_bases, RISCV_NR_ISA_BASES) __read_mostly;
+
 /* Per-cpu ISA extensions. */
 struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -1304,3 +1307,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
+
+/*
+ * Compute the set of profile bases (IMA, RVA23U64, ...) a hart
+ * conforms to, given its resolved ISA bitmap.
+ *
+ * If @isa_bitmap is NULL, the host ISA bitmap (the AND across all harts) is
+ * used.
+ */
+static void riscv_set_isa_bases(unsigned long *bases, const unsigned long *isa_bitmap)
+{
+	const unsigned long *isa = isa_bitmap ? isa_bitmap : riscv_isa;
+	DECLARE_BITMAP(ext_mask, RISCV_ISA_EXT_MAX) = { 0 };
+
+	/* IMA */
+	__set_bit(RISCV_ISA_EXT_I, ext_mask);
+	__set_bit(RISCV_ISA_EXT_M, ext_mask);
+	__set_bit(RISCV_ISA_EXT_A, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_IMA, bases);
+
+	/* RVA23U64 */
+
+	/* Supm with PMLEN=7 */
+	if (!riscv_have_user_pmlen(7))
+		return;
+
+	__set_bit(RISCV_ISA_EXT_F, ext_mask);
+	__set_bit(RISCV_ISA_EXT_D, ext_mask);
+	__set_bit(RISCV_ISA_EXT_C, ext_mask);
+	__set_bit(RISCV_ISA_EXT_B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICSR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICNTR, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHPM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCIF, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCRSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCAMOA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICCLSM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZA64RS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTPAUSE, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_V, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVFHMIN, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVBB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZVKT, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIHINTNTL, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICOND, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCMOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZCB, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZFA, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZAWRS, ext_mask);
+	__set_bit(RISCV_ISA_EXT_SUPM, ext_mask);
+
+	if (!bitmap_subset(ext_mask, isa, RISCV_ISA_EXT_MAX))
+		return;
+
+	set_bit(RISCV_ISA_BASE_RVA23U64, bases);
+}
+
+/*
+ * Populate the host ISA bases bitmap (riscv_isa_bases) and each
+ * hart's per-cpu isa_bases.
+ */
+static int __init riscv_init_isa_bases(void)
+{
+	int cpu;
+
+	for_each_possible_cpu(cpu)
+		riscv_set_isa_bases(hart_isa[cpu].isa_bases, hart_isa[cpu].isa);
+
+	riscv_set_isa_bases(riscv_isa_bases, NULL);
+	return 0;
+}
+
+/*
+ * Registered as subsys_initcall so it runs after
+ * core_initcall(tagged_addr_init) populates have_user_pmlen_*.
+ */
+subsys_initcall(riscv_init_isa_bases);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
