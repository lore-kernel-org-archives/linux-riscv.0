Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE416C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHLPeILZFe7FwmcEHF5l1DLceovL1+oy+f/UzpS7How=; b=fzJjlFv00WU5TR
	rH1udfyg9y53+jzb2Oy7oGInTnlhySo8UcTMYe2Q2h66IhXAy3jV5PyuNdHM6uONWMVo8Tx27qApm
	KbxKbkG1AqmnQrDeySMl1TiJgi5mwgLR35WCRnegJAqTwmYSuA8E+mLyS7QGEoT1j1g0g7CM82Nrd
	DOT02RKYyF6g2i67zP4Kym+Yz3M/fSIlRfNHB2HKHmk6bTxBy4JKTxP9H+SZXvXMWhPu2GEbJCD2q
	3M/2cTSqRwiQnyF6pILvobOylBb85kyyayzLPK5Lwd7Y9vE4+hkxRNf4BI86HaajCai+jCTcLeIcz
	aV4nxoc4v2riED/ROkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZRj-00CAfu-En; Thu, 20 Jan 2022 15:33:55 +0000
Received: from mail-108-mta141.mxroute.com ([136.175.108.141])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZRg-00CAct-0D
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:33:53 +0000
Received: from filter004.mxroute.com ([149.28.56.236] filter004.mxroute.com)
 (Authenticated sender: mN4UYu2MZsgR)
 by mail-108-mta141.mxroute.com (ZoneMTA) with ESMTPSA id
 17e781aa05f000bdf2.002 for <linux-riscv@lists.infradead.org>
 (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256);
 Thu, 20 Jan 2022 15:28:37 +0000
X-Zone-Loop: 1d03c6aa5808dea27d3e8a63bbb826cb17136d4f2edf
X-Originating-IP: [149.28.56.236]
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ds0.me; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JVQnv3AVsUWy3ZjxZJjNI7QObG4R6sq0+QS/JmmuFdE=; b=BHtxwMqbuCOrh5i+9PW87UjR3Z
 shdKUIWt8HVX/Q4R5RJ8L8tXXo5mt+zn8ZqWivYivdEdEDt9H17hFYjryZr3HEG+FBZmv3/x2ggoL
 Err2M46S5F0MdpUug5lgrHjIxkBl7rl5VJ/rqWM9CyKbqHIhRAkEkNhACM2gHnUKHO8bbM8HgI9Fj
 BPxWEfhvjzRCvjMvrOBtBtlkANGH/tTHcoaqHyLz2q/L/HftRq2MK5pytRjgPiXeJe1OCN4wkhl8L
 jVZyYhyqgGaTBxBFjUgid4GrGm92sxKaNclKxesBXV2Jg/GKdGeq5W4pkDYUS/EJd/JlSQPIvxyNG
 5BfcLToQ==;
From: Myrtle Shah <gatecat@ds0.me>
To: linux-riscv@lists.infradead.org, paul.walmsley@sifive.com,
 palmer@dabbelt.com
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: Fix XIP_FIXUP_FLASH_OFFSET
Date: Thu, 20 Jan 2022 15:28:27 +0000
Message-Id: <20220120152828.4089364-2-gatecat@ds0.me>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120152828.4089364-1-gatecat@ds0.me>
References: <20220120152828.4089364-1-gatecat@ds0.me>
MIME-Version: 1.0
X-AuthUser: dave@ds0.me
X-Zone-Spam-Resolution: no action
X-Zone-Spam-Status: No, score=5, required=15, tests=[ARC_NA=0,
 MID_CONTAINS_FROM=1, FROM_HAS_DN=0, RCPT_COUNT_THREE=0,
 R_MISSING_CHARSET=2.5, RCVD_COUNT_ZERO=0, FROM_EQ_ENVFROM=0, MIME_TRACE=0,
 BROKEN_CONTENT_TYPE=1.5, TO_DN_NONE=0, NEURAL_SPAM=0]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_073352_132943_D1BEBD49 
X-CRM114-Status: UNSURE (   8.44  )
X-CRM114-Notice: Please train this message.
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

There were several problems with the calculation. Not only was an 'and'
being computed into t1 but thrown away; but the 'and' itself would
cause problems if the granularity of the XIP physical address was less
than XIP_OFFSET - in my case I had the kernel image at 2MB in SPI flash.

I believe this approach is more generic.

Fixes: f9ace4ede49b ("riscv: remove .text section size limitation for XIP")

Signed-off-by: Myrtle Shah <gatecat@ds0.me>
---
 arch/riscv/kernel/head.S | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 604d60292dd8..b1ca65abeb1e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -21,14 +21,13 @@
 	add \reg, \reg, t0
 .endm
 .macro XIP_FIXUP_FLASH_OFFSET reg
-	la t1, __data_loc
-	li t0, XIP_OFFSET_MASK
-	and t1, t1, t0
-	li t1, XIP_OFFSET
-	sub t0, t0, t1
-	sub \reg, \reg, t0
+	la t0, __data_loc
+	REG_L t1, _xip_phys_offset
+	sub \reg, \reg, t1
+	add \reg, \reg, t0
 .endm
 _xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
+_xip_phys_offset: .dword CONFIG_XIP_PHYS_ADDR + XIP_OFFSET
 #else
 .macro XIP_FIXUP_OFFSET reg
 .endm
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
