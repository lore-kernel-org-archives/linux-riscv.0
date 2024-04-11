Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99AECD11C2
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 00:10:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJBGI/j7LGok5c09K+vZGS2rYCJgLkdMK6rRzYb6NzY=; b=ClZqgMen5B7i/b
	neCfMQhGyb4ec4HaqLC2/O0W2Okj4K5KvnMrTMDksutmuz4LmWA+R5zyhZMZx4vgKU8YUvN/YoAAu
	zKtXGQxcjCqaUoDLZE/KPLdJRd523u1AafaYcMu2JZBmvnRTKZefRdCnvQZgCtgLSfns1gKLhnbDN
	VnwfPyHcpVRlMeXolXQHPugxtHc4Ojjh1joqQC70trbna44MBKIK8lPDmW58mesEi7NW6gV0d36X1
	rmYLda7nsism1OUto1mWDvkid2N9hqtCWeZrFZ/uEayo8R4tCTA3L5g15P+cTCsVqmWWDGzlgb9CA
	qHgGorTWisPq5GsjDdow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rui0n-00000009awf-0RLh;
	Thu, 11 Apr 2024 00:09:53 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruhzz-00000009aBk-2N60
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 00:09:08 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1e0bfc42783so62297025ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 10 Apr 2024 17:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712794142; x=1713398942; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=;
        b=r562uw4Ev6WwgLogBkM4xZN8kxrdeETNlZqhIi5iQGtxMA1dsKExKzKZRII3Nl8jhm
         YihmWodpmqp2QW0PXwsagX7J4VVEy1qyjhEE4Yu2zObtAlh7JE+9vdF+qTonzYHXYPB8
         f8rTSDPi04+k1qODvpDE7bVwKSMh2YeYtCyVZ6Dkxa1KjIGvspOUm0R7hOHsOE+BwePT
         Pyb3PxlFZaOLX3KKemOKFFlTKp16tQkXCysRrWJ7oHspLfanzUayp6re1HwHq5DNZLro
         PgKjWaLmtnX8PpMzCapFm5LKsTqBioAeQ2EKERkMlgR47YmutP8P5DFUd4eKmezvfAtb
         CUFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712794142; x=1713398942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=;
        b=Ru9JNjDeafjmJAuuq7KepiylbGPpeXi0PVrBhNl3mwA3RolRdWM7fFupKyUJPXid00
         BgE/CeuOWuLimGbG52yC6Jmu1RehCDrGA+jyZJLAharlCSnYnnV0FghMIWmltABuojae
         HfKH/OM0w/h4Q19q87d1Ysa70VZMMcO42D890fAYyfg4basB3tE8OCCDYEF6/a0J03Fa
         0O3DOhfBHOU9ZjEDoPMhWdepDyVqu8QMfUmE2+vD4NRLIRdFtVZKKap5JT8o73CnjseT
         y2IYq8yFTorr1teGpt0CEAvZtZE5MGKWtA7USJ7Sr+diFhC91s2IzplbNpoawdmOxnkY
         CFIA==
X-Forwarded-Encrypted: i=1; AJvYcCUpNEbqSxDo4oRAX5gkyPNyQY/aIiZflXTAA35ZopuLt1biTt7sUi0l/f92MLLR5it7DJU4rQhlmXinyQeP2+ngeRf7cFAeXeTz6hJ/8+5m
X-Gm-Message-State: AOJu0Ywl+WSGSrfc/VG88TgD2/YbOCpOGobTr+Hswf8kK3GnjCFIx1ad
	4K3K6x+WLb49FN9+CP5sCsdB/uPe/uhL6IFhAQbG7kLAWL/vYU66MTZaiqMlNH4=
X-Google-Smtp-Source: AGHT+IG9J9HXbtRVLSclepSndaNOO3YP1PmjK961uyHs+6U9yCFE0uBVf0I5e8DD6IADWcXAgbLPbA==
X-Received: by 2002:a17:902:8341:b0:1e5:2885:2 with SMTP id z1-20020a170902834100b001e528850002mr1720294pln.68.1712794142555;
        Wed, 10 Apr 2024 17:09:02 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id f7-20020a170902684700b001e3d8a70780sm130351pln.171.2024.04.10.17.09.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 17:09:01 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <alexey.amakhalov@broadcom.com>,
	Atish Patra <atishp@atishpatra.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Juergen Gross <jgross@suse.com>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Shuah Khan <shuah@kernel.org>,
	virtualization@lists.linux.dev,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v6 20/24] KVM: riscv: selftests: Add SBI PMU extension definitions
Date: Wed, 10 Apr 2024 17:07:48 -0700
Message-Id: <20240411000752.955910-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240411000752.955910-1-atishp@rivosinc.com>
References: <20240411000752.955910-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_170904_111273_6EB0F292 
X-CRM114-Status: UNSURE (   9.80  )
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

The SBI PMU extension definition is required for upcoming SBI PMU
selftests.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../testing/selftests/kvm/include/riscv/sbi.h | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/sbi.h b/tools/testing/selftests/kvm/include/riscv/sbi.h
index ba04f2dec7b5..6675ca673c77 100644
--- a/tools/testing/selftests/kvm/include/riscv/sbi.h
+++ b/tools/testing/selftests/kvm/include/riscv/sbi.h
@@ -29,17 +29,83 @@
 enum sbi_ext_id {
 	SBI_EXT_BASE = 0x10,
 	SBI_EXT_STA = 0x535441,
+	SBI_EXT_PMU = 0x504D55,
 };
 
 enum sbi_ext_base_fid {
 	SBI_EXT_BASE_PROBE_EXT = 3,
 };
+enum sbi_ext_pmu_fid {
+	SBI_EXT_PMU_NUM_COUNTERS = 0,
+	SBI_EXT_PMU_COUNTER_GET_INFO,
+	SBI_EXT_PMU_COUNTER_CFG_MATCH,
+	SBI_EXT_PMU_COUNTER_START,
+	SBI_EXT_PMU_COUNTER_STOP,
+	SBI_EXT_PMU_COUNTER_FW_READ,
+	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
+};
+
+union sbi_pmu_ctr_info {
+	unsigned long value;
+	struct {
+		unsigned long csr:12;
+		unsigned long width:6;
+#if __riscv_xlen == 32
+		unsigned long reserved:13;
+#else
+		unsigned long reserved:45;
+#endif
+		unsigned long type:1;
+	};
+};
 
 struct sbiret {
 	long error;
 	long value;
 };
 
+/** General pmu event codes specified in SBI PMU extension */
+enum sbi_pmu_hw_generic_events_t {
+	SBI_PMU_HW_NO_EVENT			= 0,
+	SBI_PMU_HW_CPU_CYCLES			= 1,
+	SBI_PMU_HW_INSTRUCTIONS			= 2,
+	SBI_PMU_HW_CACHE_REFERENCES		= 3,
+	SBI_PMU_HW_CACHE_MISSES			= 4,
+	SBI_PMU_HW_BRANCH_INSTRUCTIONS		= 5,
+	SBI_PMU_HW_BRANCH_MISSES		= 6,
+	SBI_PMU_HW_BUS_CYCLES			= 7,
+	SBI_PMU_HW_STALLED_CYCLES_FRONTEND	= 8,
+	SBI_PMU_HW_STALLED_CYCLES_BACKEND	= 9,
+	SBI_PMU_HW_REF_CPU_CYCLES		= 10,
+
+	SBI_PMU_HW_GENERAL_MAX,
+};
+
+/* SBI PMU counter types */
+enum sbi_pmu_ctr_type {
+	SBI_PMU_CTR_TYPE_HW = 0x0,
+	SBI_PMU_CTR_TYPE_FW,
+};
+
+/* Flags defined for config matching function */
+#define SBI_PMU_CFG_FLAG_SKIP_MATCH	BIT(0)
+#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	BIT(1)
+#define SBI_PMU_CFG_FLAG_AUTO_START	BIT(2)
+#define SBI_PMU_CFG_FLAG_SET_VUINH	BIT(3)
+#define SBI_PMU_CFG_FLAG_SET_VSINH	BIT(4)
+#define SBI_PMU_CFG_FLAG_SET_UINH	BIT(5)
+#define SBI_PMU_CFG_FLAG_SET_SINH	BIT(6)
+#define SBI_PMU_CFG_FLAG_SET_MINH	BIT(7)
+
+/* Flags defined for counter start function */
+#define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
+#define SBI_PMU_START_FLAG_INIT_SNAPSHOT BIT(1)
+
+/* Flags defined for counter stop function */
+#define SBI_PMU_STOP_FLAG_RESET BIT(0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
+
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
