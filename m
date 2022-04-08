Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64ADCC4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T8TZQCkejAZGB7FQwEmSmnR6qDIIFndUb9LriHMEKws=; b=lzJsas9Zpb2fEh
	C6w0B/pD8/xV2TyLz2NvM8NiMPddR8W8+uVKguLC0RHOh0spS4nEtPiykyXUxfjjilfVLIsCwYwvN
	r2+yKUOenVPRMn4GGzGf81Dx/CXhaCUn2ny9LcgisPKXHlFLWfl7E9Q4v38QEtukvXKH/cdrrI2pm
	O2CkVV3hamIoUYTC8TuVzhHL7zqaWFh3OjL87wNq+y53vSiuAAiirGDL233Y+obQ8Wd3VF5hDZfuO
	LdGk91MXxQyD+Z8PtV4JgzWqH6Ev89FtYsJ3QDRtiDzWA6qTb14S13NqrgjBPp4oIatXvH+t1i+81
	2w3xzvZe+oa2KTa8HvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncomr-00HOGm-UQ; Fri, 08 Apr 2022 13:36:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncomi-00HOAT-PK
 for linux-riscv@lists.infradead.org; Fri, 08 Apr 2022 13:36:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1649424980; x=1680960980;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m7Q9iuSfmYsfFoilGURKa9oNj4A9f56Xqh7ewQcurjA=;
 b=us9DkpN5gCgPX3/WqqiAijku2/0WQaBpOHw57mnt6RgFV6oBonYbtGMR
 IMTmArfsfsViIvGar0VKF0nIC6DFxz3WCo4UqiCJxnDAY7Du5GavbEBHG
 tS6Smh3lf43Z/FcdlgiyIxCsj9bFvsQY9Fd5JR0ilwpSu8/PmrYTxk1Yp
 o23LlHRqR2sTG+oTKZYj8npGJUz78XpbANuS26zDqgeFaCNC9c6rPtjrG
 Slej1Vl/xZ3+0EunWcJNwRAZBYG76h457hmrA+bG2jvLSgW5zldfQRlp0
 W4uyj7MJx9yYLFGRMaKa/XtJr6EnGGUIXKEdTowBCxOB3RgO/ReW+g3ot A==;
X-IronPort-AV: E=Sophos;i="5.90,245,1643698800"; d="scan'208";a="168956543"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Apr 2022 06:36:17 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 8 Apr 2022 06:36:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 8 Apr 2022 06:36:15 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <aou@eecs.berkeley.edu>,
 <paul.walmsley@sifive.com>, <palmer@rivosinc.com>
CC: <daire.mcnamara@microchip.com>, <linux-clk@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 0/3] More PolarFire SoC Fixes for 5.18
Date: Fri, 8 Apr 2022 13:35:41 +0000
Message-ID: <20220408133543.3537118-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063620_879861_6D8735AF 
X-CRM114-Status: GOOD (  11.80  )
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

Hey,
After the clock driver for the PolarFire SoC was accepted I started work
on the onboard RTC & found out that the reference clock for the rtc was
actually missing from the clock driver.

While restructuring the clock driver to add support for the rtc
reference, I noticed that there were some problems with how the FIC
clocks were being used. The FIC clocks are the cpu side inputs to the
AXI fabric interconnections & are not the clocks for any peripherals.

This series fixes the problems I noticed:
- the fic clocks incorrectly had the AHB clock as their parents
- the last fic, named differently to the others, had not been set as
  a critical clock
- some peripherals on the fabric side were incorrectly using the cpu
  side fic clocks, resulting in incorrect rates.

I added fixes tags to these patches in the hope that they will make it
into 5.18. I kept series separate from [0] as that fixes something that
is broken, while these are only wrong.

Thanks,
Conor.

[0] https://lore.kernel.org/linux-riscv/20220408131352.3421559-1-conor.dooley@microchip.com/T/#u

Conor Dooley (3):
  clk: microchip: mpfs: fix parents for FIC clocks
  clk: microchip: mpfs: mark CLK_ATHENA as critical
  riscv: dts: microchip: fix usage of fic clocks on mpfs

 .../dts/microchip/microchip-mpfs-fabric.dtsi     | 16 ++++++++++++++--
 .../riscv/boot/dts/microchip/microchip-mpfs.dtsi |  2 +-
 drivers/clk/microchip/clk-mpfs.c                 | 16 +++++++++-------
 3 files changed, 24 insertions(+), 10 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
