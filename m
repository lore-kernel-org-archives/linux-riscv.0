Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C95BAC4706F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Dec 2023 21:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fsJY1V6el+DUSB9G3dv/Tfwa9/krlxcfLcxLC5k1J3Q=; b=VruTugTJWcPJ9/
	TLHj12WAxtRigURC7BfHkOSAYw4Wtk4bF8H4CRwC0iB7t2rtSW3QID/y0JQdJdj1IF2bzdT1/NaHz
	UOO6S+RcwreZoFz/5/ZdkyzK2uhGKHbzLRJHsFEgicu+OzwonYVcXmxEEdAczcfqlyq+J5a1q4fMU
	JQAmI4NROIM+oLXAb/C0bNtvATK26ZO23zWmYIDmX/iKOM3p8x8BgvJUdCsLfk3I96hio6LhwoWCE
	UpL6QCRVPUlOCzSPLWSSClywsmtZ+Ki8K6mnltaBBQJ5MCh9dy5cJ9qoJtGVPggrScLOnuSYSFw/3
	KVQ/uHArenA89vuo0n7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk7-001boH-27;
	Fri, 29 Dec 2023 21:50:11 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJKk1-001bj8-33
	for linux-riscv@lists.infradead.org;
	Fri, 29 Dec 2023 21:50:07 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6dc05409086so1461287a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 13:50:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1703886604; x=1704491404; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQnx2W4Ek1hjKyLE2uCBAG/NCAjRLiMW8LRvzu1a/Ms=;
        b=uzoN+ajZW635EoFKgOYMu3BPlUn9SqnNBNAmMJn/f7TB11pTd35kV67Hx2VdDvnegH
         l+XltYfisoUFkZbMoX5qFvV91Fapr44t6qVQIzUh06O1xc/T08P3N+soCFBBbh6W0saX
         1nZWJLlQie0vSCB/LbhX6d2uFUbe7vwyii0aE167gfsJEkqjV71K9VWWQ/9hsB9p8m31
         k4yM7aqnVeLxVlDm2foV6HeM3eFdVZuPeyTvf+8ZrXpqrrGH81TFiRR8m7vRdNgJPKP1
         B+Bdqwui0b2dsJAdzkPgNgCFRnX4YYkr2Y9iJ9UNhyfLBrH/uC3WHC2jq27iwJct0Ojh
         1ZuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703886604; x=1704491404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iQnx2W4Ek1hjKyLE2uCBAG/NCAjRLiMW8LRvzu1a/Ms=;
        b=IR2RtXHqH1h75hBEyImXls74jlbKk5+90LPK5vMHEYQ5D/tC9nlU2bulJJagkFKAsT
         UDNG2qx77sjBJT6YZYMGCZ9CUfO40fJ1uvunKTsgukJhkDcwmics5BQWjH2G7XsXAcZW
         bx112OLStuo45tbBrUCGBmhC45cMzdnc7yYLicKr+e2mY3av/iQwc3v9WfNTfAAipQQu
         aRzb4JIe3DahvvLOxV23vFUOodCVk8UR2pRm4wUV2RgxF1IcC/AM4FisPIjt5yzxkrZH
         bJz1AUXyliGN4TqOzudHE24HKTIFjKnhAuFwTZsfMf0tgrK8lMuXwG0rW5Bs7V1Dbwu3
         sccQ==
X-Gm-Message-State: AOJu0Yz/OSNn2KtpprHQPafV+tvh/HIb8SQR59acMr1+LYuEP8AVnAiX
	q4Te+CJHevSlwqPwDoZjV4Pd1FawWzv1UA==
X-Google-Smtp-Source: AGHT+IGmwpkM+uVHGjFQccXxZaaYJeJ1IhrumVOeH5sSfp7pqnUVUDaH5arZfjBaoHfdSXN04lAOjg==
X-Received: by 2002:a9d:7f81:0:b0:6db:e98c:23c6 with SMTP id t1-20020a9d7f81000000b006dbe98c23c6mr5087739otp.2.1703886604078;
        Fri, 29 Dec 2023 13:50:04 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id r126-20020a4a4e84000000b00594e32e4364sm1034751ooa.24.2023.12.29.13.50.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 13:50:03 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Will Deacon <will@kernel.org>
Subject: [v2 03/10] drivers/perf: riscv: Read upper bits of a firmware counter
Date: Fri, 29 Dec 2023 13:49:43 -0800
Message-Id: <20231229214950.4061381-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231229214950.4061381-1-atishp@rivosinc.com>
References: <20231229214950.4061381-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_135006_018398_BCC0749C 
X-CRM114-Status: GOOD (  13.78  )
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

SBI v2.0 introduced a explicit function to read the upper 32 bits
for any firmwar counter width that is longer than 32bits.
This is only applicable for RV32 where firmware counter can be
64 bit.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_sbi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 16acd4dcdb96..646604f8c0a5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -35,6 +35,8 @@
 PMU_FORMAT_ATTR(event, "config:0-47");
 PMU_FORMAT_ATTR(firmware, "config:63");
 
+static bool sbi_v2_available;
+
 static struct attribute *riscv_arch_formats_attr[] = {
 	&format_attr_event.attr,
 	&format_attr_firmware.attr,
@@ -488,16 +490,23 @@ static u64 pmu_sbi_ctr_read(struct perf_event *event)
 	struct hw_perf_event *hwc = &event->hw;
 	int idx = hwc->idx;
 	struct sbiret ret;
-	union sbi_pmu_ctr_info info;
 	u64 val = 0;
+	union sbi_pmu_ctr_info info = pmu_ctr_list[idx];
 
 	if (pmu_sbi_is_fw_event(event)) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ,
 				hwc->idx, 0, 0, 0, 0, 0);
-		if (!ret.error)
-			val = ret.value;
+		if (ret.error)
+			return val;
+
+		val = ret.value;
+		if (IS_ENABLED(CONFIG_32BIT) && sbi_v2_available && info.width >= 32) {
+			ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_FW_READ_HI,
+					hwc->idx, 0, 0, 0, 0, 0);
+			if (!ret.error)
+				val |= ((u64)ret.value << 32);
+		}
 	} else {
-		info = pmu_ctr_list[idx];
 		val = riscv_pmu_ctr_read_csr(info.csr);
 		if (IS_ENABLED(CONFIG_32BIT))
 			val = ((u64)riscv_pmu_ctr_read_csr(info.csr + 0x80)) << 31 | val;
@@ -1108,6 +1117,9 @@ static int __init pmu_sbi_devinit(void)
 		return 0;
 	}
 
+	if (sbi_spec_version >= sbi_mk_version(2, 0))
+		sbi_v2_available = true;
+
 	ret = cpuhp_setup_state_multi(CPUHP_AP_PERF_RISCV_STARTING,
 				      "perf/riscv/pmu:starting",
 				      pmu_sbi_starting_cpu, pmu_sbi_dying_cpu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
