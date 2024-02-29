Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B8E5C5478C
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 01:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHRXZ+atkHPPsPujQiOhtCF2kdbooMaFJQvuiQURgOA=; b=pcxiKgjgDlUORs
	V60g4TsXeEIWHEYZE8vdr7/tbWDbh9hTqWglsRBzTabUTTAhqbKxfFv1Cslvyb5xALeYRXEJxyxfY
	G6ldQFhHX/EyRF+XhGO0CmOwFqybIEZogEI+0Jh9UiD5TW8WvPjvvzVlv1IesxhDnS/5uvaW/h0eL
	DSqKBankDVQ8VM2RUjhefWPRQG2dxOv89OfMowOqeqbTT0z8D0nVKKBCX2kANJ1jwvcvQeHXjx4Ep
	EjfjuMr+592pZUF0CP+pSL0B1rthfGUsHbluilWOUUAqadGJUGPqkMGN9LI6TEc5uCIs542eVLin4
	s+veaZicpa70BdTdyrFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUp6-0000000BWu3-3dtQ;
	Thu, 29 Feb 2024 01:02:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfUoF-0000000BWCj-0t3j
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 01:02:07 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dc1e7c0e29so3765225ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Feb 2024 17:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709168522; x=1709773322; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VD/948XWBq0x/qa95YGc01R9c0TbIYHVZYjMe5MrY6w=;
        b=faEqxxzyLMrcc6HqHmGeRsgu0mV2SY8uMEfHMfG/kLfW8pCwZ150WiRnQIEQRxupRi
         4DYTnd1uaseRivtPBZnSrKe852LGog2KU94CaeVtokdcNUQn3heC9UXIgiB5PzDkUU3N
         xkyQjiZvjHqTLayfvlBWJqJdffJbBDDN/5xqQ2+qdpHZ+r71/GBgL/3laJVtfkgB8tdj
         spjpXL5VtiL2E718AdRqBgdSSJzt/nmBAifd+QIABG+M/y2Nk89pmNP+NucpWQwcvEDk
         psqZ0yj0pvV6mHjArWDhbP7/g4FOqqPBs+fybZvyaJbVd5HZX+bpKB/nbif231UvI+HA
         Ikyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709168522; x=1709773322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VD/948XWBq0x/qa95YGc01R9c0TbIYHVZYjMe5MrY6w=;
        b=pxhTWTD5gcCu11MJj98jDRC/XgJGst13Yo7PGMVqlk44nUOOctFKbPjhfJyS1oUzr+
         6CW9IwGSAAiB2MsW8qIsuysyOLchrQyEkJzdmmzEzYr+x7rL6k5dU5I8JmMXnmG8GuG+
         EzmEeEZSmirKzR656BXfl9U7qBaceNZbiFiU6ZIv+YSPPkFb/OoyS7BqFAv9WoEAc5NF
         EQ1ZzyG06EtMjmGzI4YfZWAyuO57u8Z3sTh6v5uZhYKoGhfu8rqQNAoNcoK1Jcsc1SV+
         QH50s8QJR7TvC7vjqoKBMIXJraI5Tx1VurkYUBC+0sl0vkhOVaSXaSsx/SSylFkB9N7h
         oTYw==
X-Forwarded-Encrypted: i=1; AJvYcCUoWk7MCbpjMKb4vu9b8KC1/sKo3Q67C1tEkhfiN3Ickbc9cDCqcht6iuv5QheWibHXv0pa8ROCI4Op3UaEylUmS3wJGIHWvL5TAxbaRHXZ
X-Gm-Message-State: AOJu0YzHH2AaCWRUHAIjO491pPJQQF6L2CYKN296aFUtbHIvO/W9Qla6
	oknyyDuda/gQ82SAEfj5jkezSMg4nCo12b6cPX8UJWM7eE7lQ1DFUBTqvom/S0o=
X-Google-Smtp-Source: AGHT+IECcPOsQd/Wcs/NXzfGXSpVCP5gcdN7koVt3lBZSHounAjkyFjG1eItkUqy7PPWX4hGVp9DAA==
X-Received: by 2002:a17:902:db0a:b0:1dc:38c7:ba1a with SMTP id m10-20020a170902db0a00b001dc38c7ba1amr731926plx.25.1709168522225;
        Wed, 28 Feb 2024 17:02:02 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id j14-20020a170902da8e00b001dc8d6a9d40sm78043plx.144.2024.02.28.17.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Feb 2024 17:02:01 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/15] KVM: riscv: selftests: Add SBI PMU extension definitions
Date: Wed, 28 Feb 2024 17:01:27 -0800
Message-Id: <20240229010130.1380926-13-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240229010130.1380926-1-atishp@rivosinc.com>
References: <20240229010130.1380926-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240228_170203_565735_0C8FBD35 
X-CRM114-Status: UNSURE (   9.41  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kselftest@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, kvm@vger.kernel.org, Will Deacon <will@kernel.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Paolo Bonzini <pbonzini@redhat.com>, Guo Ren <guoren@kernel.org>, kvm-riscv@lists.infradead.org, Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SBI PMU extension definition is required for upcoming SBI PMU
selftests.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 .../selftests/kvm/include/riscv/processor.h   | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)

diff --git a/tools/testing/selftests/kvm/include/riscv/processor.h b/tools/testing/selftests/kvm/include/riscv/processor.h
index f75c381fa35a..a49a39c8e8d4 100644
--- a/tools/testing/selftests/kvm/include/riscv/processor.h
+++ b/tools/testing/selftests/kvm/include/riscv/processor.h
@@ -169,17 +169,84 @@ void vm_install_exception_handler(struct kvm_vm *vm, int vector, exception_handl
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
+
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
+#define SBI_PMU_CFG_FLAG_SKIP_MATCH	(1 << 0)
+#define SBI_PMU_CFG_FLAG_CLEAR_VALUE	(1 << 1)
+#define SBI_PMU_CFG_FLAG_AUTO_START	(1 << 2)
+#define SBI_PMU_CFG_FLAG_SET_VUINH	(1 << 3)
+#define SBI_PMU_CFG_FLAG_SET_VSINH	(1 << 4)
+#define SBI_PMU_CFG_FLAG_SET_UINH	(1 << 5)
+#define SBI_PMU_CFG_FLAG_SET_SINH	(1 << 6)
+#define SBI_PMU_CFG_FLAG_SET_MINH	(1 << 7)
+
+/* Flags defined for counter start function */
+#define SBI_PMU_START_FLAG_SET_INIT_VALUE (1 << 0)
+#define SBI_PMU_START_FLAG_INIT_FROM_SNAPSHOT BIT(1)
+
+/* Flags defined for counter stop function */
+#define SBI_PMU_STOP_FLAG_RESET (1 << 0)
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
