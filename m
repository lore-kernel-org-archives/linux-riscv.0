Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1E91C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Apr 2024 23:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJBGI/j7LGok5c09K+vZGS2rYCJgLkdMK6rRzYb6NzY=; b=0oL7q9oiLd4A7l
	KFwFDB0qOp+AG3vz+xccHJPEdpZFOTIGg5b+SBPj0H+zyPDaiDQjQKSGIz7dWLoo/6s731+NzW9UD
	Yg1ZA77OnWfasfBilWQAwUkHHZC9Wz+ydhFj1lDZ+rL0SgymmHMqlFrSh1ZUNJxorfdHDgx1srxsU
	s2vGjqNRSOFAAFw4T7VilWpvU0plrEtHOe8p9x1+/xFTAI40xoUSeN6d85Nmqk736CXp4mWvv9N3o
	hHfh6ZTM09igNxqSDN4zvWU7/K+gkEPW9Uoaa3yiHVAVj1oxPy6I0OUiEiaJYx4oxdrPJnbf/tejX
	hEKgtYO6jhVFsbh/TdiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxz6-00000007K1g-0wfO;
	Fri, 19 Apr 2024 23:49:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxy1-00000007J69-1GIr
	for linux-riscv@bombadil.infradead.org;
	Fri, 19 Apr 2024 23:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=; b=hQORsTP5cMyzxM6RKW2t2vtjWF
	iiqduc0KcKw+KcIMvN3r5AImmrbKj1HozgDJjAkry7z0KMQF+QfDGrJifmy6o7mgLbmkT+wgbT5LF
	ED9vmou/Xi4w9EN/PkUxeMZyJYEVosXfgRexvXp43hH3Dk2VxYVcu6n8prX4OeuI8x5NiZ8cdFQD5
	yY3q473rOtTBqrKg3rUjdPLGctMXpPE9E9wY/d2g3OZQ1Yw7MVzRJHZGWpt7T1RJ+Px5ZyKsGaxLc
	VIPXZXtetCUdL1IMU+Xlgcfcx5C/8Q/mcAOajnzFUkNdg46J+gG287idJbNNcv0QWP4KtHzP4X3VO
	wyGNLrMQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxxxw-00000008nJC-1jHe
	for linux-riscv@lists.infradead.org;
	Fri, 19 Apr 2024 23:48:28 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e3f17c64daso19863755ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Apr 2024 16:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713570501; x=1714175301; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=;
        b=lPOIyQqMitgg/Ia/uJr5L3yI8yUPi4Wq/k/Aeb0IX0W0EtHXIWO/0Wv5kvM2h9PXkI
         /pGeJ46wXpJ4lvkgeACTnU6XrJsBRAfLX4OyYFnCr7ydFgOv55HtJlIiKxU8/JVhII4h
         IHBUKepMjiu9nb5c8OU8m299u2VUGFDhKSF+XDYLc0rrL8a/NZGJOL6hCXbWdrtSZY0G
         U0HhvKj+5BOFVKWZCDmUvFlstwIHJdieCq3azb91EAqHhzd9BG8HUIh2zKxzcdiJjKEe
         2UKixFZhVJLmUD8e3ao5eZrGHl9wK5pLCSGVvBp+SSyeJekRQIN3vvdh+H6MAqYmwfR8
         afEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713570501; x=1714175301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=;
        b=fAlu0EqmQ6U309nuagRGLGsLBNVASVRoUZKZUuZOVapNnZdCMENnJK+y7Ds40AaCze
         GLuv+G77L3zKF1Ft0P51pSSeXCezyrIkyZBbZOG9VhN/hoLJhRW3B/WkJVdkXR008bzh
         2FC3tsx1TUa1q5ZX67vVFdDJwblc3Telz19e5Rpa1N5ci1EvcTwpMQ/GvNRiEIUY+7ZA
         +L0ut/tMyB74y9G9eZlGW85oGA08P5oFvSKZl43DMBI0LIHlE+XmK401Uj1VILkD6ME4
         tIkhr3pxiGSCIC0XQOOb4HC46xGLKyqZOXth/5uhOxsjei83px7lbaSTO9d4DGkLxHwS
         tDkA==
X-Forwarded-Encrypted: i=1; AJvYcCXZ8FPQNFXaGsfCN3OE4/Y84b6VXdZG/cxhTUpM/K8hSoEz01IpJh8p0pAJLzRacv7JE7dLiPkvM1RTvmt/IhXAzYlkKmM3JY5DbByFiWNm
X-Gm-Message-State: AOJu0YxKvH8Av67rgtsIoSwdamypYtp6xL6wloG1PCj+WLipu95inCno
	+4FP/7FraG0BqL3RwGCkq50vOOvj7KCGuQ8KaqvD3y5QppHzvJUNgxqjYsbyh3E=
X-Google-Smtp-Source: AGHT+IExX7jSBzI9snc8ZpgJeYyDpP9nMeKJ6Hd3nM6HLbB59ikb+ctX7/mUd/kE+BrHwRoKJsb1xA==
X-Received: by 2002:a17:902:edc4:b0:1e5:1108:af1b with SMTP id q4-20020a170902edc400b001e51108af1bmr3327140plk.22.1713570501082;
        Fri, 19 Apr 2024 16:48:21 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001e42f215f33sm3924017plw.85.2024.04.19.16.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 16:48:20 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	samuel.holland@sifive.com,
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
Subject: [PATCH v8 20/24] KVM: riscv: selftests: Add SBI PMU extension definitions
Date: Sat, 20 Apr 2024 08:17:36 -0700
Message-Id: <20240420151741.962500-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240420151741.962500-1-atishp@rivosinc.com>
References: <20240420151741.962500-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_004824_571671_4686495E 
X-CRM114-Status: UNSURE (   9.78  )
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
