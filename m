Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD7BC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hEm1pbM594Z/YBlAlQ/ZgR7/RSDO27Vv4Voqg5nvhA8=; b=yiHhZ8hyL7rp3d
	BiZ8tJMfT6VvruszZHUYoUFh5Zgq0fR+fzVhwyUA8R2PHNUMpoXME9A4syOU7Sgolt2sRfs8AaLEb
	8JkKLmEiuMySmnmopHJuS2Q/RnsDDitRRv9JpUyzE2adL+yVjFNguH5QIfWwt5hZx8rcFGDeFmNDp
	aqNIdfVlyHobHG2PJDTybHyApIeapKXDGFB/y1JHUFdwKtSDA+SF1HT3qIpUhjQbWyHbaG02cVvbb
	pY/tiMFi/q/28JF7oICNik7UhLeJILtcg5ZS9iqe2kANCGkZBUZzbsizNKvWzkYldtONeYZCq+gnr
	rTedhOwT5fws+Dj8rbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSeU-00CYYn-GO; Thu, 21 Apr 2022 08:59:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSeR-00CYX1-Fg
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 08:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650531539; x=1682067539;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jpQn21lfBJqxHASJ0XDepMTCjpzWE4fmKlR+6b/wZig=;
 b=sXJQ5Z7+4Ylhx2hBD5SZjoAfwuXT0wmnYMrE9/FPMw+JsBjHXMWyBFXI
 hchDoE2rvTDX9vTGPmT4BsiaWaL9b8U6IQOp208BBChw9+imXzTd7/k/1
 DQPXD+WiO9Nk15H/ULf0LiDrWolFnz+FvkIaCdT1S2+iiN6rc+zawmXd8
 Is2T+veaui0rZE5WbR0ZcFhwHaXNe7fJD1xx8kid1r5VmZ03VEoND6qBq
 +orl0T8/dw7G2B3wOVTnLXc9yBurQW4jRcWnSK8ZQP0AEYy2PsHrG80I3
 vejpWMYMMqKjw++dMflL9WmtDqvYmcQkFzirehp2JUutLBBmWQcS041sN Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="93073109"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 01:58:57 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 01:58:57 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 21 Apr 2022 01:58:55 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v2 1/4] riscv: select peripheral drivers for polarfire soc
Date: Thu, 21 Apr 2022 09:58:03 +0100
Message-ID: <20220421085805.1220195-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220421085805.1220195-1-conor.dooley@microchip.com>
References: <20220421085805.1220195-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_015859_620919_96266324 
X-CRM114-Status: UNSURE (   8.45  )
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

Update the SOC_MICROCHIP_POLARFIRE kconfig entry to select, where
applicable, the supported drivers for the SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 34592d00dde8..7f93c729d51c 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -3,6 +3,10 @@ menu "SoC selection"
 config SOC_MICROCHIP_POLARFIRE
 	bool "Microchip PolarFire SoCs"
 	select MCHP_CLK_MPFS
+	select POLARFIRE_SOC_MAILBOX if MAILBOX
+	select POLARFIRE_SOC_SYS_CTRL if MAILBOX
+	select HW_RANDOM_POLARFIRE_SOC if POLARFIRE_SOC_SYS_CTRL
+	select PCIE_MICROCHIP_HOST if PCI_MSI && OF
 	select SIFIVE_PLIC
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
