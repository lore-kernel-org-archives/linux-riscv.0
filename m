Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A08FC6FD1F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 08:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=taAv8F01lunIW/cYAq+3ujz36MHueuWelu8fFu0Vgp4=; b=x9slT7QvV5FevM
	yGBTnjDYfJ9UVpLAx7nni/d+HZ9u8cd/gYQ1Y2eunqUWZbPFL/koBhlTf3rdxi0UyhpmL9jRcXidm
	3qXYaZkjKqzKTygMiXkE3yFRkaMFzkihNePvEH2hJR7r1ijpVqgcdrP4i6vCQNW62B25h5e3UZMBQ
	jFi05rbO+tXR/LVe884KknLkRqz47Qj2CzN0KB0Cvsjxd4oE5Cr5bKtvXlFycIIb40kOEepkKkjxZ
	OmxZDoaz2dyyYUOSy3c6s1Ngb93v99wjSXuBsVDRVG7iZgvDQ+6R+eZqhKp9YM+tDxfNiz8thoG1f
	uls6JaKqfZX/8a1am5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcj-0000000Eifh-27VN;
	Wed, 03 Apr 2024 08:05:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrvcc-0000000EiXn-2hTC
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 08:05:31 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1e267238375so5039175ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 01:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1712131524; x=1712736324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cY+c1Et8e4Cu0t4snI2MWrn2141KaT0UNrXkfFbuJA=;
        b=upLhoxyZIdpIf4Ctum6bUwXyk+NSnE+fk3ldx6H73jCLymigLCvmOanSrzaiZSbICj
         YcmqkLKhgt6H8BRmnK11NJmOnj0L05VKSnyuDYu7eD8YPiTPMpmBU2TGWjCZ1aIomQPs
         7PrW5GyjB8Xiu01fYpkn5MA3uKc4j4JBV+GHCNU4OrxebPygUx1D4XtmRhHJ2l8ZpGae
         id/gRNSurTVOvsn2cuecgy4DGHiuCugZBYcPxSTf5rg9YqNOwVjei1re9svMiKenqfZp
         TUuBEtlj7fpIUQbv/y2QIX1FS1JGrh9lUFtTNjfv3ctfm74K/upwiNO0zLjk3LxZbMPV
         OarA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712131524; x=1712736324;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cY+c1Et8e4Cu0t4snI2MWrn2141KaT0UNrXkfFbuJA=;
        b=ogPSJUrh9K68iabLbIYJEquj8HHIJ9A4bXx4zFcTKJjwbDxeMI/tCugxRUcoe5CBo9
         BFT4REr38rYQWkliTrMN2NnViRBiGcmsGSGADye3ysK5xdTD/oXVr7vKFthAKKAdaXpl
         phDniQ07Gy5/vyz8/Z9g9fVhmN5iornLrjBdgKUxUMQTQI2yLwmRY9kv8oFlZIaspIi4
         TM67Iu3QF+d7UJCkLjLlxaWPTkBa33O4a+7CjSktTOHJhN/D59Yq0jTiAjuyPiq+MyQK
         JN1hTHx5maeFaImpaDfoD/rWlk01gBTbYH7A4ygZIPH/keIwVr7nHvi6KrTvbfJLi/4O
         Kfug==
X-Forwarded-Encrypted: i=1; AJvYcCXoTN3zSuzhTn88FuvfCKZ1GlTHBpaJgk9gk4Om7XIvowK/zk9rvy2qjS5YX2TOnjcMz21xUlLQPXByO05xAcds59M6q0JfBi946+ke1O85
X-Gm-Message-State: AOJu0YzypZfQ5/2sXhIuqNOlY4APm7i5CDBGvr63eszuYbOw6zpKqx+/
	j6X1kYFh/yVpfYGM9CL9N1rlcxNgH6vC/914A3xNWuIbYIVaDO0Rk1NNi7lA40Y=
X-Google-Smtp-Source: AGHT+IFKoJgtWxPYCEvG4otnYA6GehE6Ju467AMTWra/Y4iLfyYQ+vCfm0Zt2yPKMvFR+PhSvC1EhQ==
X-Received: by 2002:a17:902:c412:b0:1de:fdf2:b483 with SMTP id k18-20020a170902c41200b001defdf2b483mr2836035plk.8.1712131524245;
        Wed, 03 Apr 2024 01:05:24 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id c12-20020a170902d48c00b001e0b5d49fc7sm12557229plg.161.2024.04.03.01.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 01:05:22 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Ajay Kaher <akaher@vmware.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Alexey Makhalov <amakhalov@vmware.com>,
	Andrew Jones <ajones@ventanamicro.com>,
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
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Will Deacon <will@kernel.org>,
	x86@kernel.org
Subject: [PATCH v5 05/22] RISC-V: Add SBI PMU snapshot definitions
Date: Wed,  3 Apr 2024 01:04:34 -0700
Message-Id: <20240403080452.1007601-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403080452.1007601-1-atishp@rivosinc.com>
References: <20240403080452.1007601-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_010527_947498_B3826EEC 
X-CRM114-Status: GOOD (  11.63  )
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
