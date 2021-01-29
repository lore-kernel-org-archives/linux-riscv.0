Return-Path: <SRS0=yqCT=HA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB817C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:01:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 542F764E0B
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Jan 2021 19:01:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 542F764E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HLTgggGxxwY9WnNjoYDnnAHuWE1X++xlBrPx8p1bO2Y=; b=oXkOQGbH6EqXXtiT4l9Fvt/X6I
	dBrM6IvjhbuUkLVC5o9mksbIkGvvBgwwErQOYNZBzj173zvo7zcqlesjAVh1ISrT5UddrrDFqmaYj
	V2FnZcR8+iOPsHPQ/Sq9H3sVP2eU6E0BpfmgPX2J4dtijI//2ts5bg1DgZZy+4OYepmfY9Mcrytti
	67huxzt/s5VM+Ykh5tsVsUXOMhsQEYHFbyLS4h5QzqueXZ7RenrQn9fiTY+SxphguVWhGYtYIYu7z
	f/f8jbpf2LDBB4VhlJ7NamhO/zVmTtFH+NS5xShcD2T/WshiPFa2+gWXiyEC26a1lP7Gasf7DXAbh
	ceapCkNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5Z0u-0005ph-Ck; Fri, 29 Jan 2021 19:01:00 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Z0r-0005nv-2G
 for linux-riscv@lists.infradead.org; Fri, 29 Jan 2021 19:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1611946857; x=1643482857;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=n54GfTxo7ki//EqLnS1Ir9viRWCH31o1XwXpCjE5Z+Q=;
 b=Zc2YbeP0biDPa5nyVLeUlCvNhuFQBRlDmAnRBuwmb/UkK9OjZVxrjtFQ
 tGyq7cE87s3GOxvAy74qsC1GK26u3DALyhoZ1Q72mYANb+Z5LxOBzK7tK
 hHI2pbsYFvVFwz0Tz5lU0Dofr63gjGcmkFBUkKVtEDabJmL43Y4LvG7nX
 DiAyNNVo0OOiwEDQd0I3rgeB0rtQPYp+W8mOlOOen6f0fI/VSY1jfTPFz
 4DgkIjnpRgYSRviUG22NboB1Yflnt8nYlIf0GueO43ujiphEwnWdUYqga
 WMwJN3JZZSQ4DIPbxHkKi0D7BD0QDHS7gTmyJK0QnglIuW5/ftVCxWG+b Q==;
IronPort-SDR: M1Sl7mQNh6hCYYC1/WRIobSa/H7I3g7sDPk1Q41zeyVKHxZUB/FPK0F6feqgDZvWk1YHZZLIbK
 LS72H4mXmcEXeLdM8oqDz0A9E0O1DGaXaILf+8LDpbEMEtLYtP6kdtx9MU8VkqL2BdSRoxnpJX
 ItPe+TqSA4qLuiEgoWXDBWyf6//8r/czTtcSBAdvGfG3pqWZ4VLRt7PJxgz0oTQI27EyvjDbNK
 hnMEsQAidEVtEtot4K7B0EOP0ZfdDWChfPLDI2y22eLIusP0k4hrCt1fOHdcoUpLi9DMD3kQtq
 FSU=
X-IronPort-AV: E=Sophos;i="5.79,386,1602518400"; d="scan'208";a="158658724"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 30 Jan 2021 03:00:54 +0800
IronPort-SDR: CsbjItvEt6ezQmGvjprtnxAvH6BnC97ZS7kfcWsYXEeWE6XTamBaHzfF0EPsGT9oPPmrfppjdx
 uZo8/DYpa/us9WaFp7O2MwZKMt/10q6KJar0Z2B4ZmQR9W3CBxoTE5pD61hAs3k7bopxDKvmT8
 4GMjjEJnXxbHFzATlwW4weha2yJyxfOepie9SZxcQNtsKZTQdeqp9TRYTalb1786VxUwmmrcly
 hcfd9iIOYdgGAD+rOzu9wQOPDos1z3e4zKpp7yrDzwkaHbM5azs6Lnn2HlQcpXQt799fH4WUCs
 Y+azg+Bn1AIBYklmTa1g842x
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2021 10:45:12 -0800
IronPort-SDR: ePbdRRjjbFrzTBLS92BttP6hleZsjSEvHAUUnd1DU6vHKn1v37kuOKJ3QNt37TuS960hslrCOi
 j/ihp4eNzLKnWfW5uRKyrfFXCDWzvMdPBCltWL8bQV58nwGBvogIaMXV8M9kNKAB5Dvgkm6Nj5
 WDqkjFFyfSVlCHH+DhY3TNpVHwleqAR2SkxKeivXQyyWEqVJ/sCtr0BjPbNTFBfn6+sxmUlHK8
 uBWjwmPmyGvbr/k1XYiDBNldK1Rlq9q+aYnHMe/ft0UW7QrJKaH72cfWUuBqoHxZ3YNWgl/Iaf
 plg=
WDCIronportException: Internal
Received: from usa003967.ad.shared (HELO jedi-01.hgst.com) ([10.86.63.124])
 by uls-op-cesaip01.wdc.com with ESMTP; 29 Jan 2021 11:00:54 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] RISC-V: Fix .init section permission update
Date: Fri, 29 Jan 2021 11:00:36 -0800
Message-Id: <20210129190038.1001626-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_140057_326513_DE0CD8FA 
X-CRM114-Status: UNSURE (   9.34  )
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
Cc: Sebastien Van Cauwenberghe <svancau@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup.patel@wdc.com>,
 Atish Patra <atish.patra@wdc.com>, Nick Desaulniers <ndesaulniers@gooogle.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Ard Biesheuvel <ardb@kernel.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

.init section permission should only updated to non-execute if
STRICT_KERNEL_RWX is enabled. Otherwise, this will lead to a kernel hang.

Fixes: 19a00869028f ("RISC-V: Protect all kernel sections including init early")

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/setup.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 3fa3f26dde85..c7c0655dd45b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -293,6 +293,8 @@ void free_initmem(void)
 	unsigned long init_begin = (unsigned long)__init_begin;
 	unsigned long init_end = (unsigned long)__init_end;
 
-	set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
+		set_memory_rw_nx(init_begin, (init_end - init_begin) >> PAGE_SHIFT);
+
 	free_initmem_default(POISON_FREE_INITMEM);
 }
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
