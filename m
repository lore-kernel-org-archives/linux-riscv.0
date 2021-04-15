Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A822C433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:15:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8ECA86147F
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 06:15:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8ECA86147F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yMzzhc9MCsYvX+m4Cs9Zz3bQthBIw7j2/DANC+p8kkQ=; b=IWnxrDM4tSCiAMsF34FRA8x7d
	1pfvoPCxthBosfnbyw44K2x/NIr4iTxnIi3uma6sl9QRkNZCXK2RgnUVgH95pMtrjt5HUUP0XH42N
	VhXEn88tdLK/5DOBLv/n3ND1i6PqWsXiDx72kbYrjR/J3hxEz66U9YNItudApOOlSRaCcc+1k6ehZ
	XTb4fsdTvuTvsdCgh9GPqchC/Ix3IOiN3LoWlqJUeDZYIec5neiO4u8fzrIq9V7PhF715PvoeZRKg
	7IthmsY/ncSUcW6+Sl0x0OYPIkBBQls4F/ZmRyFVF96bJUr3RdVoXkWfGYysNxaeNBIOtTxFPFKTV
	JZJxlFkhw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWvHw-00F1w6-9D; Thu, 15 Apr 2021 06:15:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvHY-00F1tN-UE
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 06:15:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=a/HM5MB0NzsasexgWl3GtHsU78KlXw2aWYGpVrNXcQc=; b=Xsox8vEVXI8mACM+Mf1uNpK+ya
 vKtvwHDwxaq6IX3aNAAiTI1CQRhiYbHB3S/MCyqxZS0uMZ3ww0idHdkstkUT6y2HzQ8YHdRkhE0E0
 0jH2KWtAZJVnZAoYx3Ws+6zBWKD7gBdVJBDH8z9jICPb68yQxlhKr4nda3EdrN3ppvzFxnOCjD+Zu
 Cn6pbIpSc6zNkA6gclaxj81TQgNCBpGPfp+Q2AZpA+CMCzPpLI38QspDsYcvfwHwQDhoxyDcvunsM
 54YyX/NjsIvz0K98WH/BTglckcWdJ51wVAxiPqS0+L05cKdhVZOWfrjtQ9oANN/EwUOo2IppTGRSh
 kadEr/dA==;
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWvHW-008Iy4-Hz
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 06:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1618467314; x=1650003314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+vC1bp9TOZdk9mu2+skV17UchlT5/1kRNmCw0/3ydKo=;
 b=AKsVD/QgdKQeARUyRjRIilwDDnscdUVXD3UiqpAB6wTDUNtRPYkXlx6o
 qnInRy7+/2Kc7NqbpO5Ru7S9RiYAXHzctbbyFuKCZAwcBLU5SqELR9+C3
 b7eGdJ/JK6O2th7kSD3klURdPJ7+64aBw5GsNZUCrDNUJZcd7tfy7yN4k
 /Y2kwcUf6IwoEzfSIGH5/KWejlq2Ft0FOxjMSLsjszaH0lfP7VHO/uGcB
 IT96stkGfOQ/koBrr1FssL68Jk/Lo5zqOzprvPBXJXzJN7R5PUCJZcocJ
 slsFKGAtMGrweL2yrv7xZBX0A/UTudHEou7tE3siWg2qSq8l4E3ZF+I/6 g==;
IronPort-SDR: gbQaNvf8yPaJUpSz1rXQ0N9NHseb0kd3Vx0kvai24wyFAsF/pTEM+6oVmfNEBYbBNKS6dVIPA6
 pnak0bP6+hb9ctdRf6P5yPFJUxJWIpJFpwI936qChHr+YAHNp3Lj/gjLm9guXSgQgW1wYsguO3
 3Ialng5aWJNo5twFnXJVU35ZeGNo0YcyRntaEbHXwn5TogBl7cUpebKt133OXTAvNSiA19TYk4
 rVcS3KwVSMUcQqTS3iRuxFqOx8DLazMDlpNUdST75WX4zCUy84Q6OjyyO/8Uy2zv81qhnbqDix
 1Xc=
X-IronPort-AV: E=Sophos;i="5.82,223,1613404800"; d="scan'208";a="169391948"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2021 14:15:14 +0800
IronPort-SDR: YL4ckYhF6xC0H2scptAN3zmKdwMSJ1/qS5fc5HaX/4TszEl9N0gUFWl4tB0qRfvA9PG8Izgd64
 UQ5XhBvpSgITBopy7ZsvX73fvfI5zbMFSfT6t0CMbGK+53O/Uti2yOoORxrzkiXvOTm1IhMsFG
 gOMdWAcSDdKXBOmO3myIaUHt9T/2Xjk3kmChFUBvXmc2SXpPSHXirfreqgA+7YzHqDySjRBXYP
 Iya6WbWw/H10AeshZ871OGl0ogaHJvDWuihp9LfnYvDInmuq4U6l851cYIPS0U5wTthi/O6uAN
 4w9J6LkwNHOCzcDfUQRSX4u9
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2021 22:56:11 -0700
IronPort-SDR: CORGKa2wMbDvLePNZsaaczVddMUkq4eTnPAarxeeOWCn9jhVx3X035/H6mVM8VRLZUUUSwjZ1z
 Y6np024svUqxcbyeXHOXsZlBrEQ6VmuLT9qP7b846qMDs2vXYPYGkcq1DrZSnoyTn9pXC4pyyu
 Ltc7ChaWYVrcL5U5n9d8jVlTH/BhdbXIrYeQ9Rhyx7EMA2WUHkhvSpPFh2GN6vsAdYFLN05OMa
 /usJ77OXNCf8umuZvXDJjgfE+W/Hn7loX9EXXSX5iwJ8KpGjPFZ/isGxELOMgrBEm86b9A8COE
 5pI=
WDCIronportException: Internal
Received: from unknown (HELO twashi.fujisawa.hgst.com) ([10.225.163.118])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Apr 2021 23:15:13 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: uclinux-dev@uclinux.org, ugerg@linux-m68k.org,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-kernel@vger.kernel.org
Cc: Max Filippov <jcmvbkbc@gmail.com>, Greg Ungerer <gerg@linux-m68k.org>,
 Anup Patel <anup.patel@wdc.com>, Christoph Hellwig <hch@lst.de>
Subject: [PATCH v3 2/2] riscv: Disable text-data gap in flat binaries
Date: Thu, 15 Apr 2021 15:15:02 +0900
Message-Id: <20210415061502.7248-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210415061502.7248-1-damien.lemoal@wdc.com>
References: <20210415061502.7248-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_231514_623579_FCE3C567 
X-CRM114-Status: GOOD (  10.18  )
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
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
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
