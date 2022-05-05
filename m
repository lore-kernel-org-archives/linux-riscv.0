Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B6C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 10:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QLBE3sEWhK1tZTrXazLEqtaSwk6gJJr+PBq8vurFUgc=; b=JGcRLJ13sE3uPi
	UtLbfXHtAINTEUW/DYGSM57pofdXRmb78T8B2SeACnwnbijdGTeOyaGUs5Z1jcQ0gZ7Q/ne/vpCui
	t1D6tI3IB+WEr6eqk7ysEM2P2YT8FQJXRvZlJFWqVtW8bP18eQ13oOs7jqMwWn+/sbpR6xF3cuAfp
	hCBay9gIK1TVYtCuqzCsN344VAngQtrWgg4q/Tb/fLyZcLaQLMj+EqYT3w44TDxSX+WKQNMJnqxib
	hqP5dWFy+EiIZ0UIw4eRgeDhUNdpCFyfrJCuMNWinmFHQX2NQFyvOMCv0dozw9kKrAdYuoxBCJmnh
	Dcc5997S9y5l5GGvzYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmZ9x-00FLnx-Fc; Thu, 05 May 2022 10:56:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmZ9v-00FLlU-DT
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 10:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651748195; x=1683284195;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xlM61Y37Naj7kWV5fF8LkJvKRN7akCoevsKIFW0HQ70=;
 b=h04JDmquPstKI5KgGQGavFZns4Qxt0D3CIunIb0sAK1OqIifcv0hmggu
 CIvXqiPjmK+x9NY6a43ybpsZ0idV4AI7lhnpYjX0UgM6Mvu8acoInLsV4
 t5/+T5S7g9PVF8dfFOdpW+VBBzM0SOrKaMDtuMMOibkerq2GJfgF9krp8
 aCvqfsY2CGfZTs4Ra9B5lxRzpcgL3l6Qf9ASZ6+OZTl3YqYacXOCCc+Q3
 1XCwDKeADohERSR0ZJ1ScpFr5e5Ccw3umKP35MYBgKQ9EquxmWCNkLyco
 w7Cv6uH8mds9o+lSpBVj059bVwhKfd/rJ3Sp8ZvXBm8s89iBOYsUOwEg8 g==;
X-IronPort-AV: E=Sophos;i="5.91,201,1647327600"; d="scan'208";a="162828730"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 May 2022 03:56:27 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 5 May 2022 03:56:27 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 5 May 2022 03:56:25 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v4 0/1] polarfire soc kconfig/maintainers updates
Date: Thu, 5 May 2022 11:55:25 +0100
Message-ID: <20220505105525.3881259-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220505_035635_490316_37126712 
X-CRM114-Status: UNSURE (   6.57  )
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

Hey Palmer,

As I said yesterday on IRC, for v4 of this patchset I have removed
the kconfig changes, pending deciding on a better/consistent way
of using the SOC_FOO symbols in kconfig.socs.
The only remaining patch in this set is now the MAINTAINERS update
which was patch 4/4 in v3.

Thanks,
Conor.

Conor Dooley (1):
  MAINTAINERS: add polarfire rng, pci and clock drivers

 MAINTAINERS | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
