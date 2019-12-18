Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29C41C2D0BF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 21:39:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC4D6227BF
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 21:39:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Xf0F0sVZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="dLitjokm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EC4D6227BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h16CsA+7dnlqx65iQ1V3c5bLlKu0sSrCK+owfSjPLZM=; b=Xf0F0sVZz1DSTZ
	J4FgiCB6iL0e29qwmLLif3xzoyFDaZrVARqYkOxRxOqKx7qBY3yfyKrUZoPkbKoml57nE8+hD/KaM
	5bZ3zzo/MNBhnIY2Xs76fbUm0VRXk7wiBmsQ6jIpt8UH6wrhP+b/EbvWv/Kmu3k4ECaGiddoMLjn0
	S91IE7A1lDH8rPzvx9jeTzRWvdn0Vz3rMnV/p6KAjHxA8pstGh2UsUWnageysqizP9dp3/IrHsuNV
	ngrTZ6jDXNChTQkVAQzrAUP2HD+H0zIrNPMjyfide+mnCovy+np5nRndA7hpszj93NGCL5NSe2nnJ
	TdPfLP4FTFIs2umBiu7Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihh2o-00079M-Hs; Wed, 18 Dec 2019 21:39:46 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihh2j-00073o-Ks
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 21:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1576705182; x=1608241182;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+loTlbtAVmDNqKG5gyPbZ0rjffG1s2UyA+gSQE4hEM0=;
 b=dLitjokm1hZUOXCg9foUcW31X/dOyfitXY/g8f5w7ufelfoDEkvAQO1v
 UTv7f5zaZ+MkCTlsXBIm/qCGlYgip1bWVaBaSNUuSVZs8W/EQCWNGMDwc
 jOXMxn2M/BZ41IRo0x2nLFQ+RGRvpBhu/WxefnDE/UMJQ7Wqv7VAdRqzS
 2ExZ+exwPC718bmo6//hbke4ibPGIDAZg95g47mcIGpFW9zNaFgT+ityR
 +91PCCYNAybFWkl3pq9Zzxnny16Vwl1iEn1dpvInsXrtjkeGWxS/usis1
 pp6X/N61T175lT4yhTA+FeMvKbPKuvm/VWkwJvWWwu9IC9KwtLi1KYGac g==;
IronPort-SDR: A+dSutqxqplIKeF1evlvu6aZdmdzyF17GqzaMSbokZAqe8MFoRm4kUpGtUrUQbMA/DK0jvt8/q
 Cca/JBRfjQfp20wcS7ZEZPpfDpI+dRaD3JtBL8wkXA2y9Tqk+CnjYaALQXE0vjmADFGnnUcGHj
 Jz+s1yTV/snbTrzpvLi5eiSDx7MUQGmcJ9tOzJ+x43MKGNwzgKUNvbqfcoHnMVVUk7y62YgVRy
 AAYQii+bj1YpVbJY95oIRtiozDtqHS8vpP6P4wM8zRwIMoJszBoJcA3K7FwzwgUImJ5IjaJPJ4
 bu8=
X-IronPort-AV: E=Sophos;i="5.69,330,1571673600"; d="scan'208";a="130100632"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 19 Dec 2019 05:39:38 +0800
IronPort-SDR: Zu3KPGrDWbcwgNs9dbaItOT3risj9YYWf2h8ZKcb0NeU8DTOHSadSPyfCsS6jwdY15CV79nJ5I
 TH1xFSmnsycyaQ1q9Fasj5DPEniLEstFFeCNmlA7kg1Iri80I6xIJxcaUoYu9hzeUeQM6S2507
 DetaQWi6Low2dFU2YthWe/otsrUEhdd9IueWVPk2as3Z23dLDlCkT2Iu3E8A+CXhzlo4FqeN4X
 J1+zGXvPNKecdPIVRFjz4GqJ6RFmVL27oaw+sYZmvo0cehwN0piyvAOgeQYVxRFO2K2CHdNjbb
 AdWAK1ZaNLY4I3RoRGFDt7pO
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Dec 2019 13:34:00 -0800
IronPort-SDR: xQtxRi5tOp6wtw3UFUFR8RLs/sz8SPKL5YegLH+fLmwbLuGpaRhr13w1P7+0yGrtqav+M/2sp2
 yyjSE/QjG0m+ybkav//p7yzzr4ku/R0+hjhMrt9yFWvK7QbYAGEyNb6oZCEyTk4sqFN5IcG6GG
 jerb3VEbEGtNSBjAI2Uw93tY4KwYCNVxsGgZVzgDyuLZrMe5Z53iiXGWSKkFOL5I/STDpEXu2x
 E4g284Cyy98Dfjr1LZAbMFU3wbvo9UGh6ul4bQkhccYEc4wFLzpiJsc6a9VnL4lXakTWcpglUh
 LLo=
WDCIronportException: Internal
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 18 Dec 2019 13:39:38 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v6 3/5] RISC-V: Add SBI v0.2 extension definitions
Date: Wed, 18 Dec 2019 13:39:16 -0800
Message-Id: <20191218213918.16676-4-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191218213918.16676-1-atish.patra@wdc.com>
References: <20191218213918.16676-1-atish.patra@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191218_133941_695220_16C47B24 
X-CRM114-Status: UNSURE (   8.15  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@atishpatra.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Few v0.1 SBI calls are being replaced by new SBI calls that follows
v0.2 calling convention.

This patch just defines these new extensions.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/include/asm/sbi.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 1aeb4bb7baa8..9612133213ba 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -21,6 +21,9 @@ enum sbi_ext_id {
 	SBI_EXT_0_1_REMOTE_SFENCE_VMA_ASID = 0x7,
 	SBI_EXT_0_1_SHUTDOWN = 0x8,
 	SBI_EXT_BASE = 0x10,
+	SBI_EXT_TIME = 0x54494D45,
+	SBI_EXT_IPI = 0x735049,
+	SBI_EXT_RFENCE = 0x52464E43,
 };
 
 enum sbi_ext_base_fid {
@@ -33,6 +36,24 @@ enum sbi_ext_base_fid {
 	SBI_EXT_BASE_GET_MIMPID,
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
 #define SBI_SPEC_VERSION_MAJOR_SHIFT	24
 #define SBI_SPEC_VERSION_MAJOR_MASK	0x7f
-- 
2.24.0


