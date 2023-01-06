Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A45A2C4708D
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Jan 2023 13:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TXKyaSQ22EesLNIaoCPvM0BmlG8wcfLUvtw3tQrwyd8=; b=sPeYMiKeZjFhSG
	gEpJUBJs9nqWnrRTytJ3qXC04pG61E9QjwUpqCmwkXvCNFRikvLvRgLTTpM3xiztA/rP4FuFjP9rr
	DzH8H6wkFHYkf8Fryq1loimd+Pu4GDVxeHzho36Fw2jX0AtCmRxFj/ekzh7YaB/VdqYZTYtCpVgVC
	2N7i4WhdrSaXfJP6WbW2H4ZS+o9sZVn5/C1h7V9bv0HMN1QmJHcXT4XpiYGRruEdcJe7R8E0cbLan
	vrZN1fc/7A6Wza1kaRvaAg0sNG62zUHLHEhDZhdmilOkOJFS3bekKIeNOh7ggnJ/VcJr6yITR9saL
	YSPYemqqcu+ZOsKvQkqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDn1z-008Y9J-8o; Fri, 06 Jan 2023 13:45:11 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDn1v-008Y5p-P0
	for linux-riscv@lists.infradead.org; Fri, 06 Jan 2023 13:45:09 +0000
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1pDn1n-000vm9-TQ; Fri, 06 Jan 2023 13:45:00 +0000
Received: from ben by rainbowdash with local (Exim 4.96)
	(envelope-from <ben@rainbowdash>)
	id 1pDn1o-0017Am-1Q;
	Fri, 06 Jan 2023 13:45:00 +0000
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: robh+dt@kernel.org,
	palmer@dabbelt.com,
	krzysztof.kozlowski+dt@linaro.org,
	zong.li@sifive.com,
	linux-kernel@lists.codethink.co.uk,
	sudip.mukherjee@codethink.co.uk,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>
Subject: [PATCH] riscv: dts: fu740: fix size of pcie 32bit memory
Date: Fri,  6 Jan 2023 13:44:56 +0000
Message-Id: <20230106134456.265891-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230106_054507_833802_DF7ED28E 
X-CRM114-Status: GOOD (  13.69  )
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

The 32-bit memory resource is needed for non-prefetchable memory
allocations on the PCIe bus, however with some cards (such as the
SM768) the system fails to allocate memory from this.

Checking the allocation against the datasheet, it looks like there
has been a mis-calcualation of the resource for the first memory
region (0x0060090000..0x0070ffffff) which in the data-sheet for
the fu740 (v1p2) is from 0x0060000000..0x007fffffff. Changing
this to allocate from 0x0060090000..0x007fffffff fixes the probing
issues.

Fixes: ae80d514808557018e44190 ("riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC
")

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Note, this is probably a stable candiate as it looks like it has
been this way since it was commited.
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 43bed6c0a84f..5235fd1c9cb6 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -328,7 +328,7 @@ pcie@e00000000 {
 			bus-range = <0x0 0xff>;
 			ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
 				 <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
-				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
+				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x10000000>,    /* mem */
 				 <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
 			num-lanes = <0x8>;
 			interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
