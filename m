Return-Path: <SRS0=gb7b=AR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4EBAEC433E2
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F50620724
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2020 17:26:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2ayvq760";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="FU84EyBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F50620724
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sjyo4WrFZPDjSJp844uYZWw5N+yzalH6f06rX4OB8yY=; b=2ayvq760MbFESPWt7JsP/Su/p
	JupDaVTxcfhIO4uiDiSHeAm/cwRnnA2KVvrcaHX0ZZjPhoysRWOMOpN95E6uY5C4FVyKQTXgDbOnd
	VFcBBMQ/AhcYQkpYu67eH734ACGRAvCRj0rflm9rQQwsxe3RKuPGI7KR8j5hvpj9viwcUtcOQMR03
	2TEHwfMnoqpKD30j47Nf+tI8r1+qqpN5d9WjYlLiOMEfFXVAWYR5VtwzOLgKJVFSWKPfYfo/+eh34
	wg0K88CqhmSW6FevLQyRFE6KODPZSuIbvuo+EENI20f5NIV9bo4vtt17SGjJ5hVhFplB7g+ikO6Ee
	l+a+V2Ksg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jsUtA-0002iU-U6; Mon, 06 Jul 2020 17:26:45 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jsUt2-0002aE-1u
 for linux-riscv@lists.infradead.org; Mon, 06 Jul 2020 17:26:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1594056397; x=1625592397;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=e1f5tFToh6jF2Fr3c6Bri7MNiVrYpT85jVmyBw2a1o8=;
 b=FU84EyBHtVo2J9NtLuzr+5HBu9uiJKd9nS0kTolagEDxzIUmWOr/GMQ4
 EJe03uc1bfJC5vjFhUMlLTtx/bFyZlXajPAFvuL0OgCsJ+xwDq22O6UFf
 PMy+eOztS+ClVPlVErKyUtZBHvc7EJSIoIfLWX4oRKPUijXA0mCl4egKc
 cbVwvg6JrFJxOu/QdNE1/vAzyibTcSymD3EdeQkm6zpqYaV4lpANohO21
 wdPBF7ayDl+FvLRWYnD2Da5IQG5eh4nVJaaLSwen4T630PFqYq32g2n9u
 bNNCeJwU/1Pg76tlnLkE6DA+GsH7fg3H7qtg2t8hE1bkv/QP8LMqXrSje g==;
IronPort-SDR: 9uJ1vP5GG/vOHOvmzeJGAAVX7k1NTfsgkO9ePtRkLWYUpyRukO+sAgN59aYqww/fnOuj5Z8BiM
 J06H4lRSBbVjY3CBXQ6tFyq6MusQNxZZ2x8RShu4MTgnii4/40rouH5VkZAlUhIuVDbw6lnTND
 NNZZPsDLzIxacLIaMaUn/GrypLZ9mhIJQJvrQgDG090CQpNtO0Cfyd/hAG6KXnUsrf+uPakXwW
 07Ipe87xOcC5GfyrgZJTOOSoZUQxwuQV4QB93VtjUuuykExC0B+FlItdOd5itHBcaf0yerD3ly
 ZP0=
X-IronPort-AV: E=Sophos;i="5.75,320,1589212800"; d="scan'208";a="141930683"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Jul 2020 01:26:32 +0800
IronPort-SDR: qeyZ7GgWYT5sSkxMMDptqqEMFHs8Z7k7tizgCXcAUzKt0g4Z0xjfUlZb2mhtrJ7Lab359nnoKS
 1ZenW66CZoGFTmkqJMt3Ay9EupzMdfSpM=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jul 2020 10:15:12 -0700
IronPort-SDR: CHjz5i2GjUVTmaMZrAcRniyPnGuPcM9Gy5cG1qRK1yg2uNoB0XlDvdxeo/vNoIt0F32gPm//zW
 EI3N8t8F03OQ==
WDCIronportException: Internal
Received: from 6hj08h2.ad.shared (HELO jedi-01.hgst.com) ([10.86.57.161])
 by uls-op-cesaip01.wdc.com with ESMTP; 06 Jul 2020 10:26:31 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 05/11] RISC-V: Set maximum number of mapped pages
 correctly
Date: Mon,  6 Jul 2020 10:26:03 -0700
Message-Id: <20200706172609.25965-6-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200706172609.25965-1-atish.patra@wdc.com>
References: <20200706172609.25965-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200706_132636_303433_5FF2D669 
X-CRM114-Status: GOOD (  12.75  )
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
Cc: linux-efi@vger.kernel.org, Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Masahiro Yamada <masahiroy@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, maximum number of mapper pages are set to the pfn calculated
from the memblock size of the memblock containing kernel. This will work
until that memblock spans the entire memory. However, it will be set to
a wrong value if there are multiple memblocks defined in kernel
(e.g. with efi runtime services).

Set the the maximum value to the pfn calculated from dram size.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bad60686d080..4021706aef81 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -147,9 +147,9 @@ void __init setup_bootmem(void)
 	/* Reserve from the start of the kernel to the end of the kernel */
 	memblock_reserve(vmlinux_start, vmlinux_end - vmlinux_start);
 
-	set_max_mapnr(PFN_DOWN(mem_size));
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
+	set_max_mapnr(max_low_pfn);
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
