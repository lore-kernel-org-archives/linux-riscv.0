Return-Path: <SRS0=Rdmy=ZK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FFDEC33CA1
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 22:57:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CE2122310
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2019 22:57:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D7JhiDq0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Xsvmr9V+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CE2122310
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YvK+Vv0/w6CTf0cQzsiAQNqCy+vwZRGUDxzwwvSYyyE=; b=D7JhiDq0MzC8gx
	WHvieqtqcrIG7maZrSD4Y9uhsfHmdkIo946qmvVxayzvbeQDp4/NTnHvdoCi6Ro30fWQkFyL2ceGH
	mJMbgDs15UAhh7ofdRSjVI24ZO0smMKmdQzJshtc0nnOVkP9j63T56ld7Ca5yteY1HjbqYgE8/jqK
	KJHJEudN18+pl3QFjOo+Eq1mbnnDeHCMYf798ahujPOp914D55t5yo/AsLdBRhmxQjVrIoo+9BZwB
	BAvLRKORzLESyb8W/4BQ0HWqoTYNxTJzhdwLpt7Wo4BNU65UcEgvcyOfbd4v9H9AyYDae4S+sKWgz
	LBzp5ZBlSSUAspcu2TBg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iWpxQ-0007RB-W7; Mon, 18 Nov 2019 22:57:21 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iWpxL-0007Ko-L0
 for linux-riscv@lists.infradead.org; Mon, 18 Nov 2019 22:57:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1574117835; x=1605653835;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2Cl3Yy4laR6Em8oB4Zv8FAgT/XtNVIz5adorAyEv8c0=;
 b=Xsvmr9V+lL/9yJLqdE6wAOChFmwzth4w5ywxu5PVfNgPa7t7tOjEheuJ
 kitzzn5JXPQ734onmn9wyKbTSvx1eCv98zr85Jlf1FY4juqE40X9FLEBh
 rViq430IAiLJLnKnBZuTvTfGavU0CilR/ea4Bp88zSKAp4NdOR4dagvuD
 FBhI6WAwjRGHl+9DaJnEP2ELMPBozrT0CBAn4ahYUWmiV9rI2hmQ85g7A
 I/7FB6p0hFFJpVAmaTXsE4gfqBNML3D38wXdOZPYeO+ygIuPMPtT1dr1t
 Lbly+avv/meyELjCN0pNNhdypSkXJ3b0cSWfIwLrGa2s9Wj6hXWLdM//P A==;
IronPort-SDR: Q2AGnnAiMHCU4O+VDeq9plUIWnbj7U807EyyHT/igQ+w53FFIpotL69KUzmKiODJKupq2uKlF4
 FI/POI/DP3cPI1y7E2u78qDmx6DPuP5dczbWwCKRB4Cbefw+pjgXKgXH5ooLZqrC11yBmjNHOK
 K9ftMKLCcnH/rsFiwvcdfszsba6x0EPPsFHluINY8ysT8OgA5bImujeZxfa9bOUJKCSlUHOkwq
 DpkuceijBgygZa2JuGesCg1n4nxfvqmjYs32x5drit9vSvT80LOWviZH6p7tkJgg23wZILDeOG
 Fb0=
X-IronPort-AV: E=Sophos;i="5.68,321,1569254400"; d="scan'208";a="124142839"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Nov 2019 06:57:06 +0800
IronPort-SDR: ZfNf4O5L6CXld/B30fT3362HNTZwRAW3vSJSKx/9n2nnGN3Uv2an3CspiljQG53d541DDzADnU
 KZ9VCvDZ82/VmT45RjzM6G/17clQ5R/2Wtz5zjroW7DVL9Nc/e+X+cn32e7hGRK3iuxr2E5If3
 Fyl1wM5qPYchNW/5QngGWvcYQYsshSOcUUr8sXPupIyC4HM7yXuBJSM621QvfTch+QltW8lphk
 l4sPipCVIUOsXYxtPBpt30hSG6Te60X8L+yqMbRgc+X624cdmjv04o6WutEGO6zKdtbPTnseNk
 hT3tstrMj6Fcdudmfls+YZox
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2019 14:52:20 -0800
IronPort-SDR: 23SWddq2Pkm9apBV1nKKaB2btadRLUgOpJYF3Iq4CYXbv1XQ+fa+Q3PtfqUAfZlrkwfFeNqOMc
 tC0OftSgpKyENBIeqsRbQ7mgMBQV91b9jHmAYWrjyn8qObEF5L+5K2rIoW32EQBo1N0ZuDZ6/Z
 pCB5SIlloSevTDgnY4HNnz1XuoH3bzboYqUHv0PDOQNdVqduunUe7yTKB16cKAEkZcg4HvpYUS
 y3485++2vy4P0HUXTcu5JqP7ef/4aIl6Uj/k5mmU5ZgslAeL/qpXNB/LCwjXUVAs/+x9IjYB87
 G8s=
WDCIronportException: Internal
Received: from yoda.sdcorp.global.sandisk.com (HELO yoda.int.fusionio.com)
 ([10.196.158.237])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Nov 2019 14:57:07 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 4/4] RISC-V: Implement SBI v0.2 replacement extensions
Date: Mon, 18 Nov 2019 14:45:39 -0800
Message-Id: <20191118224539.2171-5-atish.patra@wdc.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191118224539.2171-1-atish.patra@wdc.com>
References: <20191118224539.2171-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191118_145715_712702_AC1E11E2 
X-CRM114-Status: GOOD (  10.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Alexios Zavras <alexios.zavras@intel.com>, Anup Patel <anup@brainfault.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Atish Patra <atish.patra@wdc.com>,
 Jonathan Behrens <behrensj@mit.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Mao Han <han_mao@c-sky.com>, Gary Guo <gary@garyguo.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, Allison Randal <allison@lohutok.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Few v0.1 SBI calls are being replaced by new SBI calls that follows
v0.2 calling convention. The specification changes can be found at

https://github.com/riscv/riscv-sbi-doc/pull/27

Implement the replacement extensions that makes way for a better SBI
interface in future.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h | 22 ++++++++++++++
 arch/riscv/kernel/sbi.c      | 57 ++++++++++++++++++++++++++++++++++++
 2 files changed, 79 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 75ad7a190b1b..09beb0bfa3b4 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -19,6 +19,10 @@ enum sbi_ext_id {
 	SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
 	SBI_EXT_0_1_SHUTDOWN = 0x8,
 	SBI_EXT_BASE = 0x10,
+	SBI_EXT_TIME = 0x54494D45,
+	SBI_EXT_IPI = 0x735049,
+	SBI_EXT_RFENCE = 0x52464E43,
+
 };
 
 enum sbi_ext_base_fid {
@@ -31,6 +35,24 @@ enum sbi_ext_base_fid {
 	SBI_BASE_GET_MIMPID,
 };
 
+enum sbi_ext_time_fid {
+	SBI_EXT_TIME_SET_TIMER = 0,
+};
+
+enum sbi_ext_ipi_fid {
+	SBI_EXT_IPI_SEND_IPI = 0,
+};
+
+enum sbi_ext_rfence_fid {
+	SBI_EXT_RFENCE_REMOTE_FENCE_I = 0,
+	SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+	SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+	SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA,
+	SBI_EXT_RFENCE_REMOTE_HFENCE_GVMA_VMID,
+	SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA,
+	SBI_EXT_RFENCE_REMOTE_HFENCE_VVMA_ASID,
+};
+
 #define SBI_SPEC_VERSION_DEFAULT	0x1
 #define SBI_SPEC_VERSION_MAJOR_OFFSET	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 6c864fd7fb95..02e7bf581183 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -120,6 +120,14 @@ void sbi_set_timer(uint64_t stime_value)
 	}
 #endif
 
+#if __riscv_xlen == 32
+	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value,
+			  stime_value >> 32, 0, 0, 0, 0);
+#else
+	sbi_ecall(SBI_EXT_TIME, SBI_EXT_TIME_SET_TIMER, stime_value, 0,
+		  0, 0, 0, 0);
+#endif
+
 }
 
 /**
@@ -130,6 +138,8 @@ void sbi_set_timer(uint64_t stime_value)
  */
 void sbi_send_ipi(const unsigned long *hart_mask)
 {
+	unsigned long hmask_val;
+	struct sbiret ret;
 #ifdef CONFIG_RISCV_SBI_V01
 	if (sbi_spec_is_0_1()) {
 		sbi_ecall(SBI_EXT_0_1_SEND_IPI, 0, (unsigned long)hart_mask,
@@ -137,6 +147,16 @@ void sbi_send_ipi(const unsigned long *hart_mask)
 		return;
 	}
 #endif
+	if (!hart_mask)
+		hmask_val = *(cpumask_bits(cpu_online_mask));
+	else
+		hmask_val = *hart_mask;
+
+	ret = sbi_ecall(SBI_EXT_IPI, SBI_EXT_IPI_SEND_IPI, *hart_mask,
+		  0, 0, 0, 0, 0);
+	if (ret.error)
+		pr_err("%s: failed with error [%d]\n", __func__,
+			sbi_err_map_linux_errno(ret.error));
 }
 
 /**
@@ -147,6 +167,8 @@ void sbi_send_ipi(const unsigned long *hart_mask)
  */
 void sbi_remote_fence_i(const unsigned long *hart_mask)
 {
+	unsigned long hmask_val;
+	struct sbiret ret;
 #ifdef CONFIG_RISCV_SBI_V01
 	if (sbi_spec_is_0_1()) {
 		sbi_ecall(SBI_EXT_0_1_REMOTE_FENCE_I, 0,
@@ -154,6 +176,16 @@ void sbi_remote_fence_i(const unsigned long *hart_mask)
 		return;
 	}
 #endif
+	if (!hart_mask)
+		hmask_val = *(cpumask_bits(cpu_online_mask));
+	else
+		hmask_val = *hart_mask;
+
+	ret = sbi_ecall(SBI_EXT_RFENCE, SBI_EXT_RFENCE_REMOTE_FENCE_I,
+			hmask_val, 0, 0, 0, 0, 0);
+	if (ret.error)
+		pr_err("%s: failed with error [%d]\n", __func__,
+			sbi_err_map_linux_errno(ret.error));
 }
 
 /**
@@ -169,6 +201,8 @@ void sbi_remote_sfence_vma(const unsigned long *hart_mask,
 					 unsigned long start,
 					 unsigned long size)
 {
+	unsigned long hmask_val;
+	struct sbiret ret;
 #ifdef CONFIG_RISCV_SBI_V01
 	if (sbi_spec_is_0_1()) {
 		sbi_ecall(SBI_EXT_0_1_REMOTE_SFENCE_VMA, 0,
@@ -176,6 +210,17 @@ void sbi_remote_sfence_vma(const unsigned long *hart_mask,
 		return;
 	}
 #endif
+	if (!hart_mask)
+		hmask_val = *(cpumask_bits(cpu_online_mask));
+	else
+		hmask_val = *hart_mask;
+
+	ret = sbi_ecall(SBI_EXT_RFENCE, SBI_EXT_RFENCE_REMOTE_SFENCE_VMA,
+		  hmask_val, 0, start, size, 0, 0);
+
+	if (ret.error)
+		pr_err("%s: failed with error [%d]\n", __func__,
+			sbi_err_map_linux_errno(ret.error));
 }
 
 /**
@@ -194,6 +239,8 @@ void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 					      unsigned long size,
 					      unsigned long asid)
 {
+	struct sbiret ret;
+	unsigned long hmask_val;
 #ifdef CONFIG_RISCV_SBI_V01
 	if (sbi_spec_is_0_1()) {
 		sbi_ecall(SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID, 0,
@@ -201,6 +248,16 @@ void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 		return;
 	}
 #endif
+	if (!hart_mask)
+		hmask_val = *(cpumask_bits(cpu_online_mask));
+	else
+		hmask_val = *hart_mask;
+
+	ret = sbi_ecall(SBI_EXT_RFENCE, SBI_EXT_RFENCE_REMOTE_SFENCE_VMA_ASID,
+		  hmask_val, 0, start, size, asid, 0);
+	if (ret.error)
+		pr_err("%s: failed with error [%d]\n", __func__,
+			sbi_err_map_linux_errno(ret.error));
 }
 
 /**
-- 
2.23.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
