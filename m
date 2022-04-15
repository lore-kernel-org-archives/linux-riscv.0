Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187B7C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 12:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcb4SN+7++MMqMGBZlcTHqISE6M07WDeqc0RSMwInz4=; b=Fv3Vps9Foa6qgo
	NyhZnjxrOVFxtduAnxMFycrZB08me9TaWpBmf0NsWL93NSDmh8stc9pl2eHX4W8gQqVfbR04vzw+W
	PNef1PRp9QhCml442TvLsuOe+KpS331H6rqhPUMRczJ8Gjum9JmnawW71ZlCHWulSE1KTIj12IZtI
	s9JthidLDFJZmicsj/y0FZ0WjmbuAi7a/RPV89WUu/mc19fKNw0th8bCicLqA+i1irjZEq1d4r6Fx
	wudjxssw7PFwEDkWwW5C+z1XRbi2v2utlzsTg1l92u9uru4kv4Y75zn0cJPAmzUsZ3WuuDN/j2uhW
	utb7Vwe3S80nP2t7Cbkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLT1-00A9dn-Tl; Fri, 15 Apr 2022 12:54:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLSa-00A9P6-N0
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 12:54:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650027240; x=1681563240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RLw1mhSx4JnJWY7T9B+yYOnuF2rUPtAaGFAVz/XWDdQ=;
 b=KehecNjTqTZ0+CaUW5t4HXZeVPglJj9yxVWna5Lf5Y2p5hEiHp97Ow2V
 uXxR4MNP1NK3Cmb0jT6FWgs7o2dKfJVtBanwFSVPELExX3RgVI2RUrI1c
 INARuXok+4XXNEE5B2wcWtQ7oLVV9i+ePbS5wldtPH8F8A7WkBEr7aArG
 FerTOPuEge5gzhUxCJQQ2v00GOGooz5onhDNaQTSyUdxVsUP6OP7WjAg4
 smX8VrghOK52+1VhpLtufDgBLHEeRGV7G8vbJEcfYUZybFVvY52hbPPr+
 qRagY9MAhNlxiwuHWmCaZC6kZeryFL5jTkf9hGA5cSbuepWk0wizEj9jv w==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="155680097"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 05:53:58 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 05:53:58 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 15 Apr 2022 05:53:56 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 3/4] riscv: select vitesse phy driver for polarfire soc
Date: Fri, 15 Apr 2022 13:52:21 +0100
Message-ID: <20220415125221.2871991-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415125221.2871991-1-conor.dooley@microchip.com>
References: <20220415125221.2871991-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_055400_864758_852403FA 
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

There is a Vitesse VSC8662 on the Icicle Kit, until a better option
exists, select it in Kconfig.socs for SOC_MICROCHIP_POLARFIRE.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

---
Palmer: You said to put in a comment, but I have no idea how Kconfig
expects a mid line comment to look. kbuild didn't seem to complain about
what I did, but lmk if that's not what you meant.
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7f93c729d51c..ff2b8b90db19 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,6 +8,7 @@ config SOC_MICROCHIP_POLARFIRE
 	select HW_RANDOM_POLARFIRE_SOC if POLARFIRE_SOC_SYS_CTRL
 	select PCIE_MICROCHIP_HOST if PCI_MSI && OF
 	select SIFIVE_PLIC
+	select VITESSE_PHY # present on icicle kit
 	help
 	  This enables support for Microchip PolarFire SoC platforms.
 
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
