Return-Path: <SRS0=v94U=NR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F230C432BE
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 13:20:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9033F60FE6
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Aug 2021 13:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9033F60FE6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57A6cezmotZVMk5bFBNVSXqJ5mnjRm5gifdPeMKg7yk=; b=qidq/A0v7GPhBm
	KrG7JVpfTMAv0eOvHhrG3ZmtF9gf887x1KPV7U53ApJsJVtM60QWNXoIrKoanZoDeWfIstCQ+Ixmg
	UF6hfex6vcL/NsGWklrbWfMGnKTWimpXVnYKk2TS2rWXPb7remP/POX8c1TXctmkSpEcKhjYvJPYe
	cOTv+UT1SueETC2eSc7BwJqM1cX3+wOl22etrNKtO1LjMLZcF1BfwIR/Ftba3hehBZxrwxRfLbKPQ
	zxhvdV+JLG5AySt2Y1RllREluckgx9tOpGusOpSKWqTW7Xe44801HzY8maKDUNA2gNaA4FIiYH4UG
	50IkgRn59HPmSxIFcb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mJFIO-00AECo-8F; Thu, 26 Aug 2021 13:19:52 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mJFIL-00AEBJ-FV
 for linux-riscv@lists.infradead.org; Thu, 26 Aug 2021 13:19:51 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:91f7:1ea1:147b:586f])
 by baptiste.telenet-ops.be with bizsmtp
 id mDKh2500934CCxU01DKhqY; Thu, 26 Aug 2021 15:19:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mJFID-0064Nn-1B; Thu, 26 Aug 2021 15:19:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1mJFIC-00Daia-59; Thu, 26 Aug 2021 15:19:40 +0200
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atish.patra@wdc.com>
Cc: Bin Meng <bin.meng@windriver.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>,
 Bin Meng <bmeng.cn@gmail.com>
Subject: [PATCH v2] riscv: dts: microchip: mpfs-icicle: Fix serial console
Date: Thu, 26 Aug 2021 15:19:39 +0200
Message-Id: <01b0aaeb50a960e36077669449a854e5d4c18a83.1629983839.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210826_061949_704032_94156365 
X-CRM114-Status: UNSURE (   9.62  )
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

Currently, nothing is output on the serial console, unless
"console=ttyS0,115200n8" or "earlycon" are appended to the kernel
command line.  Enable automatic console selection using
chosen/stdout-path by adding a proper alias, and configure the expected
serial rate.

While at it, add aliases for the other three serial ports, which are
provided on the same micro-USB connector as the first one.

Fixes: 0fa6107eca4186ad ("RISC-V: Initial DTS for Microchip ICICLE board")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
v2:
  - Add Reviewed-by,
  - Rebase on top of 417166ddec020c4e ("riscv: dts: microchip: Add
    ethernet0 to the aliases node"), as requested by Bin.
---
 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index baea7d204639a185..b254c60589a1cc8b 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -16,10 +16,14 @@ / {
 
 	aliases {
 		ethernet0 = &emac1;
+		serial0 = &serial0;
+		serial1 = &serial1;
+		serial2 = &serial2;
+		serial3 = &serial3;
 	};
 
 	chosen {
-		stdout-path = &serial0;
+		stdout-path = "serial0:115200n8";
 	};
 
 	cpus {
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
