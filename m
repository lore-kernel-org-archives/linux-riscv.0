Return-Path: <SRS0=zS8+=NV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE9FDC4320A
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 12:00:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E7A611BF
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Aug 2021 12:00:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 98E7A611BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sHIDhZxVb+5b7TfEbCbPLweko/6VabbsuZLKewzgJ88=; b=BoA1+d15ioKG+T
	9TJDNXKrMmeqJvspG2FyJjYN/uXVdpGaEXTzZAJEDSjGosWMbqkhmSDN9+2A/er7sZ/Ox97/xmEKw
	PT7ALWt8++FCpHQPN7qQEBcHlE3lO4hIFxwCQTClO8neLncJUQKMCKk2zIWgyD1Eu0WH8z9RG1A5V
	P18tpXL0ATaufJm7p3BmcigcASKWnCfZVHG27uNtLiNcQYQVl5LOmf4ZGAI9ToOagplcZnQ2NYvJd
	j7gIlkSot6MDCDA8ZUR1C1gfwVpBJnNAXYNrM1xxI87BiGSoHlYMgYnRtk8/4n6XjTrhaKMsShz6Z
	nm+8B4y3pDzWBDcsL+Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKfxK-00H9UM-Cd; Mon, 30 Aug 2021 12:00:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKfx8-00H9Qk-5N
 for linux-riscv@lists.infradead.org; Mon, 30 Aug 2021 11:59:51 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E83D961152;
 Mon, 30 Aug 2021 11:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630324789;
 bh=oFtGd9wBKas3imSbUBcVzBp33A85ze2Juxm8A9r2lhw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dIH5FOxM/WkgMuIe++n+u7MKz4o90V7fmh6OkL5dXf/mxGw2zxmALgcTNKPhqyc2d
 TczUVXn+UXam6TijPzkjk+8EXDW9CjNJ/FTpRUgHyYpwdtewoJ0dTnCSQRnlHSHecP
 QPu/s17c+MehMbt1/v05acETSsSAcyJW6w4D8JkEkVDXg55mSPJEYZrtPrxNWGHqAF
 56OgEDOp55J/k1m8pkUAoL6GdRKFuUOTyr1SzNtfmxCFqoEyd/4Kjv9IaKYWXpANLR
 /NMAR7Xm4Jn8/Eu2H8qbZMzIqAZaq/JdWrxC07pzOcUCSU/fS9LORWrZng2IMLnnXJ
 X34lG1UY+J4Sw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Bin Meng <bin.meng@windriver.com>,
 conor dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.13 05/14] riscv: dts: microchip: Use
 'local-mac-address' for emac1
Date: Mon, 30 Aug 2021 07:59:33 -0400
Message-Id: <20210830115942.1017300-5-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210830115942.1017300-1-sashal@kernel.org>
References: <20210830115942.1017300-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210830_045950_268941_C7110697 
X-CRM114-Status: GOOD (  10.59  )
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

From: Bin Meng <bin.meng@windriver.com>

[ Upstream commit 719588dee26bac0d5979c122bc530c43dc5d07c7 ]

Per the DT spec, 'local-mac-address' is used to specify MAC address
that was assigned to the network device, while 'mac-address' is used
to specify the MAC address that was last used by the boot program,
and shall be used only if the value differs from 'local-mac-address'
property value.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: conor dooley <conor.dooley@microchip.com>
Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index b9819570a7d1..9d2fbbc1f777 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -317,7 +317,7 @@ emac1: ethernet@20112000 {
 			reg = <0x0 0x20112000 0x0 0x2000>;
 			interrupt-parent = <&plic>;
 			interrupts = <70 71 72 73>;
-			mac-address = [00 00 00 00 00 00];
+			local-mac-address = [00 00 00 00 00 00];
 			clocks = <&clkcfg 5>, <&clkcfg 2>;
 			status = "disabled";
 			clock-names = "pclk", "hclk";
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
