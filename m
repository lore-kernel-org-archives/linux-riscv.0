Return-Path: <SRS0=qsF3=BI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC4CC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F19752074B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2020 23:37:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dI3SDbmt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="YApo2ZKu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F19752074B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1umPXkIVQHPQCS1yTh55sW4POQ14YuwTY5okvhadl7E=; b=dI3SDbmtvbNTjdc72slXr5Umt
	X4ojFw7HpGCz+aQQIFKi9KLucKTn226xEgC9/OauX3wSMrIYEPRWFv+OhOgiQ1WGV6KdAo9JCjTBB
	XmuIXKdBHgB1gXGqdXSh0+Y9D+PBbkGQ5VlEN7u6yuSu57h4MpKV4dne9GvaOlhcC2D8mkEfb2mTC
	x2I6rMpv1ipA9agcpP/cO2wOWN6hMldaD+ZzRMJ4NSvRSQzOVtYbA0MkYX1kHxYHWCVxtcLiuiSaU
	fXvNjkzuDOqo0XauMYHjiLqWi8KSSumPqsyGoPSBxxl1nTwIjKAxdLsKssMovXh+Hf0k9NDvoHQRl
	p5fkZn6Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0vdG-0004xL-EC; Wed, 29 Jul 2020 23:37:10 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0vd8-0004qb-Hg
 for linux-riscv@lists.infradead.org; Wed, 29 Jul 2020 23:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1596065822; x=1627601822;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T6HBziqjPfpEOovieQwcPFPkqxzZPptEH0FVtMgRIac=;
 b=YApo2ZKunepGLmE0BJ6wJYETY9qh0KcHhyB0UgmG8oCn67JTZMACXMsf
 Z/boKE+OpHEUxWkeQeIj7/Ij/leHNJ2ZxJZCqPx6N8KClT/y1QXn91kMv
 KXRbCGCwqnA1dc22Uaf14HAKMfSsLWMjeUYezWfBby38FwlDRABUSozGG
 2L0Nzcx+LJGeE621KNaT5NQa2rgMOH+MdNMnqU0vMOIu9qD0oZJ11PUpw
 H5C/m5W047nBngsGXZjjCINJcuX3nTmQ7Od+62Qa0VbFiKUramjuTaiDB
 PS/+VPsryLtlXRY9IxveGm4/fj5mHRlnSfM8+moJ+7aakBwaIcjQdSQGF Q==;
IronPort-SDR: SRBEdtCgdGnHiiKhcq6cQqBhKrQA51+esb8bQBTtPDO4MiWsf2UsljhcdNtBWEZOQcfx628IeH
 tOr91Tez4MUxsOFCpO4/7UIIwJ7AneGXH/vQLd+9/zVvg8VphqtrRxIGbmODzJVPnTGs972BMo
 hY3du0hlD0ZuSSzKoNQ47zbm+1taC82gpNX2qh09YoVcvKuurVsPanFw3rDmJs5w2rx5/oaool
 GOCU805/q7UPIWWHXIvqRLpy0B7NafpEit/GBbSQqNx2cxQUU1dzfKRwNlFgSpF5qHTIrsNgsF
 EVI=
X-IronPort-AV: E=Sophos;i="5.75,412,1589212800"; d="scan'208";a="253037264"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jul 2020 07:36:57 +0800
IronPort-SDR: vbAnU+tLFWPTFHz+e0BEDtblL8QY6hhCPnUoV6fnRhftn2AtlLqezV1pY+slEzrkUBwIrZKHnp
 Kmb2TsLzO9alUdED8ud/pi6h5ELNr6IaE=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jul 2020 16:24:27 -0700
IronPort-SDR: be71gRvQ3Pgce42+Ak3b5nRel+0Bee347V5NKB6PgQByjA/0utLtd9N5rvAb9q7KmJrMRzzigZ
 XbpOBDDZ4Mfw==
WDCIronportException: Internal
Received: from jpf009043.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.210])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jul 2020 16:36:57 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v4 7/9] efi: Rename arm-init to efi-init common for all
 arch
Date: Wed, 29 Jul 2020 16:36:33 -0700
Message-Id: <20200729233635.14406-8-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200729233635.14406-1-atish.patra@wdc.com>
References: <20200729233635.14406-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200729_193703_037042_C1D3A4F3 
X-CRM114-Status: GOOD (  13.22  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-efi@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>,
 Nick Hu <nickhu@andestech.com>, "Paul E. McKenney" <paulmck@kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Anup Patel <anup.patel@wdc.com>,
 Yash Shah <yash.shah@sifive.com>, Ard Biesheuvel <ardb@kernel.org>,
 Atish Patra <atish.patra@wdc.com>, Arvind Sankar <nivedita@alum.mit.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

arm-init is responsible for setting up efi runtime and doesn't actually
do any ARM specific stuff. RISC-V can use the same source code as it is.

Rename it to efi-init so that RISC-V can use it.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/firmware/efi/Makefile                   | 2 +-
 drivers/firmware/efi/{arm-init.c => efi-init.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/firmware/efi/{arm-init.c => efi-init.c} (100%)

diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 7a216984552b..61fd1e8b26fb 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -32,7 +32,7 @@ obj-$(CONFIG_EFI_EMBEDDED_FIRMWARE)	+= embedded-firmware.o
 fake_map-y				+= fake_mem.o
 fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
 
-arm-obj-$(CONFIG_EFI)			:= arm-init.o arm-runtime.o
+arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
 obj-$(CONFIG_ARM)			+= $(arm-obj-y)
 obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
 obj-$(CONFIG_EFI_CAPSULE_LOADER)	+= capsule-loader.o
diff --git a/drivers/firmware/efi/arm-init.c b/drivers/firmware/efi/efi-init.c
similarity index 100%
rename from drivers/firmware/efi/arm-init.c
rename to drivers/firmware/efi/efi-init.c
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
