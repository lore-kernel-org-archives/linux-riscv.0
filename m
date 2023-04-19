Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E697EC77B73
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pdprnsNgGWENRw5O5N2f2nBpsq66Qg5wY690PJJkVkQ=; b=hpzYtkRgsSpKH8
	CxAlgq97NNjnD4A1DCrYmBzwwTWOTA9seqDv9VDGg39pg4RKzgTuSPnrovC/lv7alf6sY7pCvnlN8
	Mr3LC7A0B2jiC56wEbi0npQFj9YiKfcgjCn4kZy2LvIAkHyL+Vdg4zZ/FYlkBtKU3W2DZGlnpjS/A
	Mc0HTy/l2iwarrl6Dv+cPuBTBirefWUIcSklMsk08uUoInEIvo53zpbgcbGhZJO75U+a9Afh5LPsJ
	xe3T7eI0Ng1jtYmKVDdOyAxX1Fr32lYNRAkD9YvDdFQ/nAA1EUvaBRbyusQZtzyLhA8JseaHwyPxf
	C+iaSsqYVS8lAcQQ/www==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGyb-006ck1-0q;
	Wed, 19 Apr 2023 23:12:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppGyZ-006cjg-1C
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Apr 2023 23:12:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=YhmpWINWx68bxRl5iJymJMR8koMWZ3k0vMo650bJZTU=; b=WHnX7sHlsVqi8VMckMDhRra9vO
	EI+BD+ALcmEcin/JwbXg7GvwVjnQX3c2QUQDahioTnboQf5v14aMsjD9DT1sJkeRfAAWb9hoQDZ3X
	vZLMdLvFGli6LtLCfoPGNrWUVSeSoMoqP+vUDfsftujdw4PLg0NpJGw5tknaiSJjnCYKVZtLA117k
	i6ZmY70gzRmi3CsZFHqdnmiKeWvIQQ+aYpmdyhXmj0tN0qQs/XniXBV6rirL59AUurARDN1BjNBrd
	qCZ5LhbueLS6/s0V14DZ7utOVsX1T6FIvkhc7FO4NS8ZtWekCEKTXVsGb4uTeUNo/oO5K/I1NUVLx
	gd1aRmxA==;
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG7T-0021HF-1e
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:19:51 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-51b5490c6f0so264570a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942660; x=1684534660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YhmpWINWx68bxRl5iJymJMR8koMWZ3k0vMo650bJZTU=;
        b=ub984HbNYnZCS4cYMVeGAOsRXSkOK2FPD4icQUHZlHix4aKpIqyXeuVfQOuD1xHj9v
         vsKnnlhxdpBXKMy0/ROqMjpZOfEnWXQbDuHp5T383/Vm/+FQmuzlPZpnUGhvlMFFe7rt
         8HkCX+VPliU1MmnP1Ss2H9IInj7b1S/ZGGfNasP3k5lYx2EUDdBQbfa+gCsPCMfJr4EM
         doY/zh1GbMfgfCGSFTcIGG6F7Q7zICkSwwBAXaUPKIzJ8MoIZKG1DSX+I00o1o0F5UZi
         WiH33xlJMuVTKRgbJ22ofZQJq8VWsCC+jXY14LMcf4NAwgljQxOy08LcxeWTlGXumKfv
         zGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942660; x=1684534660;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YhmpWINWx68bxRl5iJymJMR8koMWZ3k0vMo650bJZTU=;
        b=Z06qaVox+4rc2+8r8Uv4+lx2OfZNqdiRuchLNivLeI7fsu92Ejnqouxopugiji8gFG
         FuWtJNlYd7CWV5L1Pms9Q17EMcvnfrljhTGjX+q3TEnm+HaytPhEC7syLLZCq6BUize2
         I5UozFuT6sMes4SiScuWumvkHriqssbcjmBWZBI/ZicRmIj1nhUnMu8pNK/2tNE0T28/
         KlrkhafUXMQQTBuwtnDVaLxCyiq08NXiaC8XzB7vZ1FxmW5pFFrJTJPcGQo1RREa4htu
         rdBVKIo5siHFOae19ikt1dTcywj3T+o//xRNORpMOxiXzwRs/d2aRheKB+pckfZzjeAn
         ly7w==
X-Gm-Message-State: AAQBX9fGw6HhOI8uhN1xWW8i7xyAht//mWd0xEAZo7wegmYBtO2lP0AT
	eJ51zBhcbNFsLRmQ4QJ93PMrLg==
X-Google-Smtp-Source: AKy350b9J0w/WoMpaq+FxHZfAsQ/ItbJjVOrBVDU6LQmeWRXpZ0GrubHeMgcOdfazZVEwzQcIEKGsA==
X-Received: by 2002:a17:90a:f696:b0:246:a782:d94 with SMTP id cl22-20020a17090af69600b00246a7820d94mr4315223pjb.7.1681942660612;
        Wed, 19 Apr 2023 15:17:40 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:17:40 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 05/48] RISC-V: Add COVH SBI extensions definitions
Date: Wed, 19 Apr 2023 15:16:33 -0700
Message-Id: <20230419221716.3603068-6-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_231947_705176_0D8EA0D7 
X-CRM114-Status: GOOD (  12.77  )
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

RISC-V Confidential Virtualization Extension(COVE) specification defines
following 3 SBI extensions.

COVH (Host side interface)
COVG (Guest side interface)
COVI (Interrupt management interface)

Few acronyms introduced in this patch:

TSM - TEE Security Manager
TVM - TEE VM

This patch adds the definitions for COVH extension only.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/sbi.h | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 62d00c7..c5a5526 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -32,6 +32,7 @@ enum sbi_ext_id {
 	SBI_EXT_PMU = 0x504D55,
 	SBI_EXT_DBCN = 0x4442434E,
 	SBI_EXT_NACL = 0x4E41434C,
+	SBI_EXT_COVH = 0x434F5648,
 
 	/* Experimentals extensions must lie within this range */
 	SBI_EXT_EXPERIMENTAL_START = 0x08000000,
@@ -348,6 +349,66 @@ enum sbi_ext_nacl_feature {
 #define SBI_NACL_SHMEM_SRET_X(__i)		((__riscv_xlen / 8) * (__i))
 #define SBI_NACL_SHMEM_SRET_X_LAST		31
 
+/* SBI COVH extension data structures */
+enum sbi_ext_covh_fid {
+	SBI_EXT_COVH_TSM_GET_INFO = 0,
+	SBI_EXT_COVH_TSM_CONVERT_PAGES,
+	SBI_EXT_COVH_TSM_RECLAIM_PAGES,
+	SBI_EXT_COVH_TSM_INITIATE_FENCE,
+	SBI_EXT_COVH_TSM_LOCAL_FENCE,
+	SBI_EXT_COVH_CREATE_TVM,
+	SBI_EXT_COVH_FINALIZE_TVM,
+	SBI_EXT_COVH_DESTROY_TVM,
+	SBI_EXT_COVH_TVM_ADD_MEMORY_REGION,
+	SBI_EXT_COVH_TVM_ADD_PGT_PAGES,
+	SBI_EXT_COVH_TVM_ADD_MEASURED_PAGES,
+	SBI_EXT_COVH_TVM_ADD_ZERO_PAGES,
+	SBI_EXT_COVH_TVM_ADD_SHARED_PAGES,
+	SBI_EXT_COVH_TVM_CREATE_VCPU,
+	SBI_EXT_COVH_TVM_VCPU_RUN,
+	SBI_EXT_COVH_TVM_INITIATE_FENCE,
+};
+
+enum sbi_cove_page_type {
+	SBI_COVE_PAGE_4K,
+	SBI_COVE_PAGE_2MB,
+	SBI_COVE_PAGE_1GB,
+	SBI_COVE_PAGE_512GB,
+};
+
+enum sbi_cove_tsm_state {
+	/* TSM has not been loaded yet */
+	TSM_NOT_LOADED,
+	/* TSM has been loaded but not initialized yet */
+	TSM_LOADED,
+	/* TSM has been initialized and ready to run */
+	TSM_READY,
+};
+
+struct sbi_cove_tsm_info {
+	/* Current state of the TSM */
+	enum sbi_cove_tsm_state tstate;
+
+	/* Version of the loaded TSM */
+	uint32_t version;
+
+	/* Number of 4K pages required per TVM */
+	unsigned long tvm_pages_needed;
+
+	/* Maximum VCPUs supported per TVM */
+	unsigned long tvm_max_vcpus;
+
+	/* Number of 4K pages each vcpu per TVM */
+	unsigned long tvcpu_pages_needed;
+};
+
+struct sbi_cove_tvm_create_params {
+	/* Root page directory for TVM's page table management */
+	unsigned long tvm_page_directory_addr;
+	/* Confidential memory address used to store TVM state information. Must be page aligned */
+	unsigned long tvm_state_addr;
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
