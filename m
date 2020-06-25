Return-Path: <SRS0=bAcz=AH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 228FEC433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCB75206DD
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Jun 2020 10:52:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hS3/Q/C9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="HCVLpkiX"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCB75206DD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=drOZiB1Pc0OAB8qGFf9vlAyWseF60vXtq5k/EmYrD4Y=; b=hS3/Q/C9tGyX01Mx7u1X783pj
	WKqWjn23P1/JLYhOkwY5xlahWbLeSw2fn/COyVKTLVxdxPI2AQBQjyAXk2LkMdpoBrYPxkltEYp3V
	1wpdnCm0sr+Acee5uzsq3C7rNs4cQ8NCIqCeyuzY4iaq0biy62uC3hpc933LF3C1765fXhUBHPn2Z
	XCgS/I3RWzyMgn41Qkejq6Lk+n9BU5U7nbY/fubF+stA9+Q3TclbufYKwaUnz2kr4uYQrSUof3mqv
	NPjiq9MuRYFuMumTlmeiIK1BB0SQmCDl2T0E00WeO28/aiHhPYBobqvIweU/VIiF/WLVn2Ne5tG72
	xes3/EKXw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jolxy-0006Nb-NP; Fri, 26 Jun 2020 10:52:18 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jojl1-0002Se-8H; Fri, 26 Jun 2020 08:31:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1593160252; x=1624696252;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dZDSjJ3t1MSIr8n8TsrQ491YhsMuw7KafK1O8BitsUU=;
 b=HCVLpkiXVsGxwUf+YhXywCKruNLprqUA7Ow9xW8VVqf4PS+X96/fRCeb
 KsxN/ZrNAKYtFtio/IzFbUtLxykTO9FFDZN0xwDps8kY2sV1L11HTJyRa
 C0kHxkOR1wf+RMoN7rIRMzolVdnBOupFrKf+lZRXNRWhm8UrP2L0xFFJ0
 Vbh5M0dcKqVIwwD9uSs5qgaJ1by+A06/N9Z/ZT7Eltp7ahFDyYpF+l57p
 uh69uwno2S+x9sBhau1iLmuKuaAowOLpvkisdJWxnp28GLEX7gi0sOcKo
 HiHlizcJ/LSVu5y+abnVaUl99S6kF4QcKTWulT7A5G0dXWAQ6lx/k3jYa Q==;
IronPort-SDR: pL+O3ZDy5LErZM5NOZfkr+cnRx6RUv+Bzv7oOuheitmBYy/MhRchVuJv+7BYutMwuv4rKrxNxf
 J9sNqERP1paUXegwLFuEWnqbbW2bix8IpdkSWC4yWX3p0KxoCgnrwsjci4wuDDH5aq2pljmr9H
 w0ow5mLLcvZhV+/wjAjE/6JeQvLWqQ8iaH2viU439ILBmJRkvzWV3Fpy2RHhrqAnQ9Y7+/p0Lt
 BlI4M7FyEhFau/eb2wvNzqMc+JEeYFaUeZuDbCWyWgNPq0kaGRm3Jjcuapu6HsJ1keQeLCPZF7
 dXc=
X-IronPort-AV: E=Sophos;i="5.75,280,1589212800"; d="scan'208";a="243966111"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Jun 2020 07:45:54 +0800
IronPort-SDR: AjJp13nAaT329s672GPo0jcWwEqzRBRfbncQh6diVy2i4nhenp8/XX7RMEWlwIfIY9Uv+ZNTBa
 oQ3kaf0QfNXDqdZC3ucwnclug+IsEuw6c=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2020 16:34:24 -0700
IronPort-SDR: hEw8ADmFsS1UNhDNRtJDi5RD8kl6Gt14KhsVC7MOMicSCEZm24PLXIM1GWGlN1n4WMslGowcYZ
 4BLBjmH2ILnw==
WDCIronportException: Internal
Received: from 2349pbt5e4f.ad.shared (HELO jedi-01.hgst.com) ([10.86.58.78])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Jun 2020 16:45:24 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFC PATCH 01/11] efi: Fix gcc error around __umoddi3 for 32 bit
 builds
Date: Thu, 25 Jun 2020 16:45:06 -0700
Message-Id: <20200625234516.31406-2-atish.patra@wdc.com>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200625234516.31406-1-atish.patra@wdc.com>
References: <20200625234516.31406-1-atish.patra@wdc.com>
MIME-Version: 1.0
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
 Ard Biesheuvel <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

32bit gcc doesn't support modulo operation on 64 bit data. It results in
a __umoddi3 error while building EFI for 32 bit.

Use bitwise operations instead of modulo operations to fix the issue.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 drivers/firmware/efi/libstub/alignedmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/libstub/alignedmem.c b/drivers/firmware/efi/libstub/alignedmem.c
index cc89c4d6196f..1de9878ddd3a 100644
--- a/drivers/firmware/efi/libstub/alignedmem.c
+++ b/drivers/firmware/efi/libstub/alignedmem.c
@@ -44,7 +44,7 @@ efi_status_t efi_allocate_pages_aligned(unsigned long size, unsigned long *addr,
 	*addr = ALIGN((unsigned long)alloc_addr, align);
 
 	if (slack > 0) {
-		int l = (alloc_addr % align) / EFI_PAGE_SIZE;
+		int l = (alloc_addr & (align - 1)) / EFI_PAGE_SIZE;
 
 		if (l) {
 			efi_bs_call(free_pages, alloc_addr, slack - l + 1);
-- 
2.24.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
