Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD9AC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 18:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KJBGI/j7LGok5c09K+vZGS2rYCJgLkdMK6rRzYb6NzY=; b=mMmcobrspNy0r4
	vft+QG4ybEjeachy9KE5GIvDsO2pIJqHd7Vlf9LDsjx3j15YrrB1IBGWqQI9dLR59XW/hBU3epNZS
	4iq308KsYAYrs2Mne/rrDZgVSsjmAZTYq6Q3lltG4Ea7GAZ8i2dHj5RxCNs77IQBVTn1qOl38X+DI
	rmkuehZut7ZVfDb2TBlqBb0/mSH6ePrgTvukRAp9h3pnu46y87rXbQxIViXq1PUeKlUh0U3aBFB+6
	DJbObbhyjFT1z/U2rA1MaW1S/aNuE/XfRCDNAVbkZg6wrIh6e7SLbxF5tBnuwUH49YwLcfgyTLGm9
	ouvUDfHFTd5RQjPxEGIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnpe-0000000DNz7-0NM9;
	Tue, 16 Apr 2024 18:47:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnw-0000000DMcK-2IK6
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=; b=lQFmTVDKlvLJh+OaUgtmDxfLCm
	G6FNJMxaN+gSryVOqY1ckDlOOo9+e2hCfPXdcG9bin5+0p0WfcoYeFkQT6xt88TXbcBZhrPYtdpH5
	wsxPmWkPxTPFj8cswxMP12TnMJOMdB1NPNzBzaSirFuWPxM4D2zcvPFvaafu9SrmEPWPqKOLHfLpA
	d7hlcShVtMaiK4yBNBGFBU7R9xQb/MdRv5cPock3OtALZezl/6wr7mI12Sod9O4/UNS2EnKAGQyRj
	hXy+WNTsRJqEHbFmdiMBrLOF7BRSQsvUcDIZeuQGbdd+9/GyEsWoc87u3hvoUrt/ySxJyoNKIopLW
	yKzCR+2A==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnns-0000000BCN6-0bR5
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:15 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5c229dabbb6so2750290a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293110; x=1713897910; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=;
        b=RsgkbzCyS1G86dm9uxeISHtn60JmtoEo8DBOefphVpmo5jGIog8Ptp2FnjYeLLvQkI
         75TUplH+bSDhAleex8BK8MEJj6QgOWvxvLAi+CsHcXwrDX7o4zwM1lZRgo+HUReFc4p/
         2fHTX6LqcTHIno47j1kmICigg6tfyPcCRDROHetWNfL3K12FcpsQmzq3x/cR/JYN3X+R
         YVZFfZYVqber428jTaHMnyeC2LcfCQ13AwT15dhlrh03oGQ9acrABleqBWUHffXQouja
         4YAEANBDBWD6/DjY1nkz/65eOUd4zAA7ZAuEPan6kbq8Ro2Cjnz+4UhJ92eaneJ+rv0N
         JoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293110; x=1713897910;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9soA5cn4wIINjbEEbaSFa4z0U18KoF+cjavdbqPH+4=;
        b=eNsgBid5OQaYp2P8vzq2R0ClVAB6ZXp6z0J735bWQxcrKVRLFWVqbW2uusuB+Vu1j4
         xYimlFjIsbjTtJcIOsogxfGOh4mXstn+/f0Xq4XCWmuPFI+SYqQ8x6FdcS3hOt/n6I+Q
         ngDY7axj1EoieuCArUEcvhyK+sHILVhMKcx2EkcxcwJr35ErsfqyVrz0mivEaRVJ7XLT
         8YwzChaIkLjvP9KXyrCEubyTyKytbumcf58RJwVONsXGAhEhX3herScSfF88LFc+oBZH
         yNNZ58IEoHCvtCONp7UZLHDI9IHNmr0iIuoVeedKtnQZGf6wz/YN2dX1/yA5K+ZyFewS
         lVyw==
X-Forwarded-Encrypted: i=1; AJvYcCUg3+yaq1X0UFNCRnid+O1/Iu1wBxolIoWjmeXUiLNqwoDnTaNFOmDUZvWzq5XYobRuMtnwRPUn+w2ZYa4Q/PMKQqRZ30nYAxXmx9VOn85q
X-Gm-Message-State: AOJu0YxY6Yjxmn8XSt2tY6hUz4Q0j+RMDBibKoU9cKjN6wDWjAuPS9nK
	ActnPdGLEmn0JrgvF9LpyA3p7bkhOJnLpUliKQA4rxlVYxr8q+aHjDMhohWsd4P+Ylujxy7yQ18
	Y
X-Google-Smtp-Source: AGHT+IHDTeNVga9tFzBdGXfnm4TEDY0Ha5j2XCWgAdGdaU558CfadIkSKiQQwMLkSusHLb3PPhohFg==
X-Received: by 2002:a17:90b:180a:b0:2a2:55de:93eb with SMTP id lw10-20020a17090b180a00b002a255de93ebmr11036026pjb.33.1713293109672;
        Tue, 16 Apr 2024 11:45:09 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:45:09 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
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
Subject: [PATCH v7 20/24] KVM: riscv: selftests: Add SBI PMU extension definitions
Date: Tue, 16 Apr 2024 11:44:17 -0700
Message-Id: <20240416184421.3693802-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194512_599697_FC4FAB52 
X-CRM114-Status: UNSURE (   9.57  )
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
