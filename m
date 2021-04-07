Return-Path: <SRS0=uKmQ=JE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F7A3C433B4
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:50:00 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26DF161279
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Apr 2021 15:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26DF161279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NBTHUbkQP0gPG9DIdLryf9bcSSmYB7mm3OdQgQu81SU=; b=l2KrljC3arZH9UDCiRcIel7XR
	BF2TsjZNT5D78rvBkOV6L+XzLTdiKNg8dB1rf1DyDWIG3Rj+qoY8IADGv0kX1V3UfXF5/+L1w2mfZ
	i6i61sFucL5jy4PvE+Ut6yUZTCqzSV2zHS5PuOvf4C/ZQhvSWwxNaW6or1bRQ3NKMvpXkDRqtbJTi
	3bkEw5S7RWbwnjKjbuoTXDVv3o+bQBdA+FqqbsT4q5LVZoKBK0k+O6eI4m2MmOdDDsIMoLNzorQ3M
	/R1lPNt8tgl79E5bu5OKpxfQhfG33wSK6bl3geiieHPhC2sNSNffzbRoKgPOIxybUZUwbdawPr18b
	Vbr92APvg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lUAR8-005K9r-HS; Wed, 07 Apr 2021 15:49:47 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lUAR2-005K6m-90
 for linux-riscv@lists.infradead.org; Wed, 07 Apr 2021 15:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1617810580; x=1649346580;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=91UF3XDHR+5BK9OsUH3n8K3X1hOKJSJ2ZUtlIirwwrM=;
 b=TpqVVRqakbT/s49eQvKrtCE+GgcjPJNYhGQG0lcFzaE6rGoUJJhCUflY
 mhzYR+nGCrWC51gRjKF6TNW/5AQwP/XQy+uRar5DhcENOIMPx5Mx443RM
 shO2fa+OMq8A5NcixK3L7YMDRyNDZ1iqDy8vbRMWNi8VczuNG8j2hkZ9W
 q8vz2zA4c8Xur0Nx+6w34+UHhyX8Q6m6TorS3qUwNjKTiTAaFQLae81HC
 x0cUTsJlBywFlkKJcfDWXfBpzv5lYCbYh3DN/+LWVA+XaWRwEesUlHc4D
 JkbVIpMLZBBpWJKeKUHBegvjvMh7vejJ2hp2UM/tit/QHEqG9VP62XL9g w==;
IronPort-SDR: 3Egt0XX7bqb3OKYIlc3dzdhFnmkvDnZHEn+iA2VydRLKc9iTh8dcyYcIX3fBxZqlcbsOr69oHO
 LueEGq3BQtkCJc86jqXMurefVgEIJz8ZEuXjM2ax9wNGIW/GRnshn2NvAAJnj1L/HxFJQ6sbLs
 crwZWIA13V+/CIh6wXP2vhhgqQ3TrJkAiQoqsLwj8PUFbD61nwWAS4adkHN7QOq+90ZzzGQF+e
 uCEkPRGLZ8Vh3606s/SHQJ7cCUaLaerxRrOhD1gG2MIIrU4YVhTdnmE2M9/PmQfWSOu82OSUdu
 1kM=
X-IronPort-AV: E=Sophos;i="5.82,203,1613404800"; d="scan'208";a="274931699"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Apr 2021 23:49:33 +0800
IronPort-SDR: +mf6ZkDUKUPYXsivE2FanFSWv7GgwX//7XKVo4imWzOF4lLGOvjjW3fWEGOxLLs6py0z2ShkLR
 HoizNQqtVwZyLX6clp8eKXMwiC01Llnl4179LB0rxz7bVz8RwP3ULUxmkW0HSe6MpzepAuiin3
 4FjhYLl9Wlhgxf6pgHURiSqII59tL2Od3TLsGp/F9Ps2/7+BuXOJ4SdZjVk8D9bjdnSslN0xvJ
 G6tWLZMZEXHjp0Qd1ac+pWNFcv3EvbR/f9ILfjkW2DQq2Jxd4A3ZFHm9Hv7Pfsk1J4SEwAy50T
 lqA3xGPkK6llYNNDKL6KPmgH
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2021 08:30:53 -0700
IronPort-SDR: S/zRMmFYPV/GfPI1LS+wpGzLIjw7o2v/mGiuL8CAguAfgkFeylt/UnGYKywFpaTukM6ayibUy8
 U8s6c8bznjYQF/fFN25skPrIhbKmj2+f4YegA1lx8mRySeparspDzx4toCMPUWOEK4phZjpe8T
 1T6E8/kKepyQacW34LF5dGeONW75ZVW80qbMzgxKyO+I3QnqEukPhCkDP2SZMlhn+WTyYTra/j
 7mUbbYKqIMyhmpoftI+CByFNFaxFhOB56JO2jdoGin5eh4rAnp+vCFkZ/ZOsFVxFOzfCpnh4fZ
 P3I=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.90])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Apr 2021 08:49:33 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v2 2/2] riscv: Disable text-data gap in flat binaries
Date: Thu,  8 Apr 2021 00:49:24 +0900
Message-Id: <20210407154924.1557489-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210407154924.1557489-1-damien.lemoal@wdc.com>
References: <20210407154924.1557489-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210407_164940_963742_B7A34BA6 
X-CRM114-Status: GOOD (  10.65  )
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

uclibc/gcc combined with elf2flt riscv linker file fully resolve the
PC relative __global_pointer$ value at compile time and do not generate
a relocation entry to set a runtime gp value. As a result, if the
flatbin loader introduces a gap between the text and data sections, the
gp value becomes incorrect and prevent correct execution of a flatbin
executable.

Avoid this problem by enabling CONFIG_BINFMT_FLAT_NO_TEXT_DATA_GAP
automatically when CONFIG_RISCV is enabled and CONFIG_MMU disabled.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0d0cf67359cb..6a85fbbd056e 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -33,6 +33,7 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
+	select BINFMT_FLAT_NO_TEXT_DATA_GAP if !MMU
 	select CLONE_BACKWARDS
 	select CLINT_TIMER if !MMU
 	select COMMON_CLK
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
