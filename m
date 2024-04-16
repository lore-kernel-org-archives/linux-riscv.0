Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19275C4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 19:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cin1ldJdDPmIJJteR1liF2UZpvff1ImIdVXd9/ftSro=; b=SKHCTSZy9lEq3U
	IKIT3wpx7dgkAVp7itPlhCVlk6CAY68iRL7QfVdIgj+6LqrMvKgRHbd9OgHEfkT+dKdXr4S1Fmt2R
	7AzOFvHpq73q2I55bEubUUig0MV6XA263pByWTxZ0p2/tl+pTrBh0UOIvI9wH+ApPSJr0CA7uloJW
	F+wCgXMlV7hFN2x7Zfv/4jijIjqG6IErQoYnWt2JawvDWYhbMsg3PySs1A/UTT+a7nu/G6Ll9h1jY
	JgfwVwY2CO1VBVigrWhoONVyWCvEXGs1XnCgp8BGnQpxUJFBwoKmXlyTCcSD5n3S4fqzBkSF0D+v9
	/xqLc8TAakMX+elaOOHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwokk-0000000Dain-2BWY;
	Tue, 16 Apr 2024 19:46:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnj-0000000DMPz-3nXD
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 18:45:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=; b=UWBtDd11Fj+PDFrfuL8x/0d2OM
	zbh3r2Xn2AIw0efrO8ybJJ8wyYv+1XAenmTXhDxToa5GBXKQW3OO+PweEppwmsuTpqFkgnFENdmGU
	VZvJvkGXI6g3yZ1nyxchh+62+OxKusDS9E8v30bb3bme5YTUpq1vfCzdBCV6rjPy2rtqYcBdCR8oZ
	1X8ifZfVoEBY8mbpcL/FmUqH9jbrAtXqkd6vXnWAiC3ADGZfNNHUpAebcH82y49yJ6+57I94cBQSg
	IjwKbKjcZUFVp5P+HiS6mXYztsug3TCnP4A3Wg3eTR4R5CIMsMLXnFzFsGYZi4kGwtIu5ZnYho9Ql
	8uwO9tug==;
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwnnd-0000000BCDy-47Ri
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 18:45:01 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-2a2d0ca3c92so47442a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 11:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713293088; x=1713897888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=;
        b=Zk9n2R0PmZHyW03QVgL7AasUCD1D0xAUPFdjTdpllN1liPDc7UbQ0kT/0AXrXby/Wq
         mT4eVqYr43Vf+u65cF1jfnFmj5Zz9u1ROg8dQBr3v7uRnlhGqAec2GyrQCbH9uV6mA1Y
         NAU1MyuVgqs6DTV4JlwhzkYMW1nWVi72ryHpfaIbUx4SQFSQsbEwlaSVB5ks2O76vXxW
         aeA3pjK4hPw4MO6TOD7pEGNF+hnAl6CmmieVbwtPvIOlrUizRsvYwq8F1BBo6ZTn/F7u
         JreFLMOhPkNSjAgnEP5eUYEH/tnovGpu7JMpnwLQON5Y7eXpH26rjSHD7of728eJB7x6
         /4pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713293088; x=1713897888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y0lXa0RA4+kQWkomLRJk1QW7kf666EFgaJ2j58l79bA=;
        b=A3armRopIk40Qcwzc6ErtSRrFabmX9lZ2p6ojl8BRiGenMvc0YdftrN5u7Cmb5G7jU
         tKsx6YeVNKtJu73E84YMEq+QUKu6NtATczfQG+pyqce3Zp4ZJ20kb8ev561s4AXJbalu
         6b+AF7fhfGiZUsBU9zqL8qKnyU5F37VqwmfMo9LD2Ji9PYjYTNOnlMGM3nY3gewEcE7S
         kzFbOttZYaktUGBwDvo7Q8LZv7zfioU2xBTlLxnduBEti2QR6NgFvuBEhYeVUfEPuDOV
         XhZ0X3tcGaxs5VdYElf/Ueqqg7YdU7aOy8gkuUkegebJNE3Dy/18l+dp/jo84Hak6kn9
         3Unw==
X-Forwarded-Encrypted: i=1; AJvYcCW65qK45eR/SJAe6ZJq4KjpQIJnQPy9uV2Yg5IlWB0l3bnoKTO9RI7jewOv2rxJQAsGO6YI0LLgzTnpRaLOYckYe29PtMj+WqVNJLSS5KfK
X-Gm-Message-State: AOJu0YycZiWx0SZauWXDYVgt29FrDpTTnzMzJpt6KbU2giKJdXPeH1n8
	vy2w4tfEJQmClADkU94rPuHoF7q4C5uY+9xwc8zpMRM7W3HG1UUNkmIvMrUBn78=
X-Google-Smtp-Source: AGHT+IEy4ZrQc6VpWHcofWnBnFX841IYpr0DACATgSN6h23DP3YRcVds0NngKjdBNkuEvrMjPFCw+A==
X-Received: by 2002:a17:90b:4c8e:b0:2aa:b56b:5bdb with SMTP id my14-20020a17090b4c8e00b002aab56b5bdbmr3174156pjb.9.1713293088546;
        Tue, 16 Apr 2024 11:44:48 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090aac1300b002a269828bb8sm8883645pjq.40.2024.04.16.11.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 11:44:48 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
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
Subject: [PATCH v7 05/24] RISC-V: Add SBI PMU snapshot definitions
Date: Tue, 16 Apr 2024 11:44:02 -0700
Message-Id: <20240416184421.3693802-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240416184421.3693802-1-atishp@rivosinc.com>
References: <20240416184421.3693802-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_194458_352122_F36D1A8B 
X-CRM114-Status: GOOD (  11.57  )
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

SBI PMU Snapshot function optimizes the number of traps to
higher privilege mode by leveraging a shared memory between the S/VS-mode
and the M/HS mode. Add the definitions for that extension and new error
codes.

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 4afa2cd01bae..9aada4b9f7b5 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -132,6 +132,7 @@ enum sbi_ext_pmu_fid {
 	SBI_EXT_PMU_COUNTER_STOP,
 	SBI_EXT_PMU_COUNTER_FW_READ,
 	SBI_EXT_PMU_COUNTER_FW_READ_HI,
+	SBI_EXT_PMU_SNAPSHOT_SET_SHMEM,
 };
 
 union sbi_pmu_ctr_info {
@@ -148,6 +149,13 @@ union sbi_pmu_ctr_info {
 	};
 };
 
+/* Data structure to contain the pmu snapshot data */
+struct riscv_pmu_snapshot_data {
+	u64 ctr_overflow_mask;
+	u64 ctr_values[64];
+	u64 reserved[447];
+};
+
 #define RISCV_PMU_RAW_EVENT_MASK GENMASK_ULL(47, 0)
 #define RISCV_PMU_RAW_EVENT_IDX 0x20000
 
@@ -244,9 +252,11 @@ enum sbi_pmu_ctr_type {
 
 /* Flags defined for counter start function */
 #define SBI_PMU_START_FLAG_SET_INIT_VALUE BIT(0)
+#define SBI_PMU_START_FLAG_INIT_SNAPSHOT BIT(1)
 
 /* Flags defined for counter stop function */
 #define SBI_PMU_STOP_FLAG_RESET BIT(0)
+#define SBI_PMU_STOP_FLAG_TAKE_SNAPSHOT BIT(1)
 
 enum sbi_ext_dbcn_fid {
 	SBI_EXT_DBCN_CONSOLE_WRITE = 0,
@@ -285,6 +295,7 @@ struct sbi_sta_struct {
 #define SBI_ERR_ALREADY_AVAILABLE -6
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
+#define SBI_ERR_NO_SHMEM	-9
 
 extern unsigned long sbi_spec_version;
 struct sbiret {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
