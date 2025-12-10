Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC38D3C927
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Dec 2025 16:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wScAwbPunxccmWMR+0YjnQJa/kpqskSJtSVoYsa4c0Q=; b=QvwHGKTWgMwAga
	UkBTWoxXm6cLFPZUhnv1m3l3SJ1hIkQxczHMwthwkipko8n3zJYg5Tk7DzXMVyI/sSquIKafYj7ep
	xWyPt+kwYQmBQzwN7xga+aUXSuTBQKgGXxrp2meGskjHF4+POQCujActwYAVfng6m3uO448Yh1Df6
	gul85u1+JKFxH2FiOStFfoTAFUkg3M9R7muvJnWM567oCk4p9kbE1QpyN6CFqGF6lt/VMbOqt4nRT
	I7HPH8y4XwlRYmN4rkGWE52cdITMiDzgCB4M9ef0A5S0f45t1kOvdLAnRHfFrduHQclW5IW6sX44F
	fVIh9YDfdR8rXfpHe9SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMck-0000000Fb6j-3czo;
	Wed, 10 Dec 2025 16:01:06 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTMci-0000000Fb5J-0XGr
	for linux-riscv@lists.infradead.org;
	Wed, 10 Dec 2025 16:01:05 +0000
Received: from mail.maildlp.com (unknown [172.18.224.150])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4dRL663K34zJ46cf;
	Thu, 11 Dec 2025 00:00:30 +0800 (CST)
Received: from dubpeml100005.china.huawei.com (unknown [7.214.146.113])
	by mail.maildlp.com (Postfix) with ESMTPS id 9F4254056B;
	Thu, 11 Dec 2025 00:00:48 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.122.19.247) by
 dubpeml100005.china.huawei.com (7.214.146.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 10 Dec 2025 16:00:47 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Conor Dooley <conor.dooley@microchip.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: Paul Gazzillo <paul@pgazz.com>, Necip Fazil Yildiran
	<fazilyildiran@gmail.com>, <linux-renesas-soc@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linuxarm@huawei.com>, Arnd Bergmann
	<arnd@arndb.de>
Subject: [PATCH 0/2] riscv: Fix missing select CACHEMAINT_FOR_DMA
Date: Wed, 10 Dec 2025 16:00:45 +0000
Message-ID: <20251210160047.201379-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml100005.china.huawei.com (7.214.146.113)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_080104_311978_65220CCC 
X-CRM114-Status: UNSURE (   6.87  )
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

The drivers/cache/Kconfig menu was changed to a menuconfig so as to be able
to hide the menu for non RISCV. The select of drivers under the original
menu were broken as the menuconfig itself could be disabled.  Fix this by
adding SELECT CACHEMAINT_FOR_DMA alongside the driver specific symbol
selects.

Jonathan Cameron (2):
  riscv: ERRATA_STARFIVE_JH7100: Fix missing dependency on new
    CONFIG_CACHEMAINT_FOR_DMA
  soc: renesas: Fix missing dependency on new CONFIG_CACHEMAINT_FOR_DMA

 arch/riscv/Kconfig.errata   | 1 +
 drivers/soc/renesas/Kconfig | 1 +
 2 files changed, 2 insertions(+)

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
