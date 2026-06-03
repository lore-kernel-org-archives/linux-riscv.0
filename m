Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B93CD6E5D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jun 2026 23:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pezj3CurSQCkk7qSb3UxeiOTybnk9xAeM4wA8/DdlQ4=; b=18xcLRv27tnhc+
	p8gZnjlCm4qKtOOhWpGk3pcDvqczTzOz8vTko9qT9SbHoPFXrYxhzqhMSQJ4muTuKZd2Bx0qvX5Lc
	MW3xMZFiXJb27jYgf/IkOI5bON8AgM64fMzZvSAIxi8VqiWzV+72yZpBvSAHFutwL1DaJAf17bERf
	OIlowflC0DhFRggbH37d3tqqLjZkjVr6t0DczUhg9vXXU36F1CSkAnmwEEhUpXKz9lIuFttsJaDT/
	eKkS1aPOkPLdG9URgJ7OTPGQEbH5oLWlL6GIlWBcSzgTVNDjzCurzgtMVwNaDf3NVEEUnWj1GWG5B
	oXyKL6XtnI8lUky1ehuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKN-0000000DwKd-0LD4;
	Tue, 02 Jun 2026 23:15:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUYKL-0000000DwJY-2RDM
	for linux-riscv@bombadil.infradead.org;
	Tue, 02 Jun 2026 23:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=4UKSxPZqE0keejMk0VWDVENbRB8BR+XN3og3EZcymsU=; b=Qd61kV6orRdrmG8/sEEzmNvojb
	jsastjUS5VX2Ttr4TM29T2EVhIzf2PQgRyPVuZmDc2BBY2eJmpsRAnY5rJ/a02Xdo1TcxuRo3yvZS
	ieo7d3pQMmOTyIQ6PXcu3BZopwbCjUjbVAzr/Yhgxe3Ow6i8ZvwYqRSQdoHXDlm1cUWNcvWLjv0W+
	wk2pOeoAo5o+95AWY8+hYw0p1xppG/2TEJ5hzW1kt7BblN3tXbht1+ghunE2Us0pKkMDFOftIl46q
	mnXiajEAPnPJt7QUkXPqwT6MkGUAy+JqYzwkSxztQbZk0hFX9JPSx5sYwvNfh1jCowiIBosbASIes
	W0u/6InQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUYKG-0000000AfrK-1qp9
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jun 2026 23:15:15 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-36d9794d82aso1851967a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jun 2026 16:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780442110; x=1781046910; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4UKSxPZqE0keejMk0VWDVENbRB8BR+XN3og3EZcymsU=;
        b=J+Al6QqVqpPgQWWWWeTcSTz8TLyOUhELYC/HfN6Qylh5tzsu4eCTYgu/K7ROGv8GTc
         fN85lhzkisFVM2cODtqFDb6P8cXVoMbuxx0cjjOGGABH0S32P/ZR+cARP3Udc9g6YUtH
         vu5Ri8Hd2ysOlqlQiJx8cJ7KcI1k6b44o5LEG4Pvu673Qz3tkNFFWkqfA9+sLWieGcmL
         kwkrcoC3c0yC/7Z8EHNdksI9Ejb65ObzbMXbb1NLZt9W6PURvlzqO/rpoqCpiGkG7Qtc
         P4E0cdYFQkEQzvZDi+5BSXMbVWtf0mLA99yGJkrF60W1keb6XdS+Jyg20Am+xDYMUbov
         EUYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780442110; x=1781046910;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4UKSxPZqE0keejMk0VWDVENbRB8BR+XN3og3EZcymsU=;
        b=aZYScigCUhXekjCKPh+HUh3UjwdQVlGXmS2FLRllDi/gNRYJ6s8+uKetIjqsdHpV1B
         G81nmwUOSUOxY4cWHT23g5W5dvZ9jcal1p7fWQ4yi0okGe5YA/7iGghp+QwCb4Ozb2c9
         YOw1cGhIJlUHPqoZK0qqdxYIRQqRHdHpM0GLN61NrnwTpTQfLsgHEni960qctLJsbMTD
         B2/pZb3jENaxwoHInCHXIp86EVLAzBynqxBc+/ntC7iObu8+1vYXbN5YoV+WJSwog2NJ
         q4YeO6D0B/u5JYB15BSMA9FfkxI4VjYf2828mt1834ZR1D4chwRzkXAhA1SRDtL+vwwP
         TsOA==
X-Forwarded-Encrypted: i=1; AFNElJ9gTIwzdJxBF7q8kdClJ4LFlz59AMwFGkdSoUNoX+kaWy795jpMm4AoxSHYJW7APUixp4/4bbzHTGWr2A==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpSYtpd8qrFMiZXYg5d6zCBVLIA64xzHVkjjLUZbivZcXd7t90
	nRvzL3kTJk8vPvMe7bbdjwUo+kw9cqVZSy0p4sTY3kVKjvbT/QmOmhSW
X-Gm-Gg: Acq92OH5V+/360AtxyYcym0B1AbtSoBMpgJosuSoYVpchrFPTK6xayXtFM7eN5Hebkb
	gnD0+EnPV+5/ac6ktWQC5C47F70AqiaLF2XEbNQP2bMMeWkMFDZ3hTWSkkhiTJzJRBtWOZD7wDZ
	DfdJJEmxZvBUUiI87nKxJrUIBnxzndY3CK2qaAce1pIQSvo5PZApe0ButHLQ4o1Az5a0QmiTBO6
	GvAGwPZxAshdYj/K7Ul1y2MnRL0hlIHCaOMXRkB1kMCz4JvmEEP50XyLZFsWloVAETSh0rRBoKM
	qLV7jyZ5X69u2dodPRZ0BhLafCtmoV1G2lDDlduB0Hfj0EblgKLYmp+hIvUzSaz1vVomKIUD9fB
	jTRUfOLn1RwnMVmmqELLl7gqGVqVgKPU/dvRBSVd3hV6+fj8U0/M+/5ykgNNnRtCfvjHyDPzDxg
	wkPJ0YjOB4LA==
X-Received: by 2002:a17:902:c946:b0:2c0:c3ac:4ae6 with SMTP id d9443c01a7336-2c163fac80cmr7638215ad.19.1780442110481;
        Tue, 02 Jun 2026 16:15:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a12:a305:4::40e9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c16649d2dfsm3302965ad.75.2026.06.02.16.15.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 16:15:10 -0700 (PDT)
From: Guodong Xu <docular.xu@gmail.com>
Date: Wed, 03 Jun 2026 07:12:08 -0400
Subject: [PATCH v3 13/15] riscv: cpufeature: Introduce ISA bases bitmap and
 rva23u64 detection
MIME-Version: 1.0
Message-Id: <20260603-rva23u64-hwprobe-v2-v3-13-5529a7b28384@gmail.com>
References: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
In-Reply-To: <20260603-rva23u64-hwprobe-v2-v3-0-5529a7b28384@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Zong Li <zong.li@sifive.com>, 
 Deepak Gupta <debug@rivosinc.com>, Anup Patel <anup@brainfault.org>, 
 Atish Patra <atish.patra@linux.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Shuah Khan <shuah@kernel.org>, 
 Christian Brauner <brauner@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 sophgo@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 Andrew Jones <andrew.jones@oss.qualcomm.com>, 
 Charles Jenkins <thecharlesjenkins@gmail.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Guodong Xu <docular.xu@gmail.com>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=5841; i=docular.xu@gmail.com;
 h=from:subject:message-id; bh=tZ/CiPcUsZvtBR97R58s9oCTI1Bte0oaCzSODfd3jpM=;
 b=owGbwMvMwCXWtEl1Z3CGpCDjabUkhiwFHraPLXPmpXIEPhB+/Gib1PlNR0K6Hk7843AzqHBdx
 NRb0v3MHaUsDGJcDLJiiiyHj7Zkb33lE+37nPMHzBxWJpAhDFycAjCRw1kM/z11PpzaICMkPeVW
 ddw6Sz4ObisRY++ezaLPfa82eRh9OsHwP81i0/VjrCEFZ/P4+Vl/xR9gD5Hc+Uq/gn1TxhPHN9v
 1+QA=
X-Developer-Key: i=docular.xu@gmail.com; a=openpgp;
 fpr=90B1DC3DF0BD10FD1227BD6344F254AF42F143EE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_001513_790630_635AC989 
X-CRM114-Status: GOOD (  13.73  )
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
index 79ff431768139..15b708da98a1c 100644
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
 
@@ -1321,3 +1324,90 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
+	__set_bit(RISCV_ISA_EXT_ZICBOM, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOP, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZICBOZ, ext_mask);
+	__set_bit(RISCV_ISA_EXT_ZIC64B, ext_mask);
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
