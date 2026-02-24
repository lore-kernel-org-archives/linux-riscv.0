Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3841F3C9AC
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Feb 2026 16:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8EwMWCSFGoGtAZ0MikytU6TfqiqAPtALQMUDRZ8+wGg=; b=yFUmV1f5Kyvhh2
	LFT4ocDywr7LcwW9WtbT38mf4aX4U5tu92mlwU/UPLY5+vNyB3Xr01kx0MReYFoMF/6apffRmsuKv
	F6TgKBQ61sSxmS7g8M3mMqkwxH+OYQVdJ1thJGAu3CkBZeIBa4Nw7yhhw4MepnB2bI7olqOOkgQ7L
	3zbBy49JIZhCDmT0CMfVnLqazdLfrFwQkGYGkQCQo/NX8lqqi96T4Uyi824/9WkyUtzVqZEPAJdCo
	j9aj9gfnogplXiE2b+fXmC0so6oBf+4CC+VfW+BWnUhgHzGbVKfYVq/Zfocpc9I413lMfboEicpFG
	Nqc1BStHAWhJSLd7ZQrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuv8u-00000002OYP-0aLU;
	Tue, 24 Feb 2026 16:20:12 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuv8r-00000002OWb-170o;
	Tue, 24 Feb 2026 16:20:11 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fL2wr4V2szHnGjG;
	Wed, 25 Feb 2026 00:19:24 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id C0C2D40570;
	Wed, 25 Feb 2026 00:20:04 +0800 (CST)
Received: from localhost (10.203.177.15) by dubpeml500005.china.huawei.com
 (7.214.145.207) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Feb
 2026 16:20:01 +0000
Date: Tue, 24 Feb 2026 16:20:00 +0000
From: Jonathan Cameron <jonathan.cameron@huawei.com>
To: Shawn Lin <shawn.lin@rock-chips.com>
CC: Bjorn Helgaas <bhelgaas@google.com>, "Vaibhaav Ram T . L"
	<vaibhaavram.tl@microchip.com>, Kumaravel Thiagarajan
	<kumaravel.thiagarajan@microchip.com>, Even Xu <even.xu@intel.com>, Xinpeng
 Sun <xinpeng.sun@intel.com>, Srinivas Pandruvada
	<srinivas.pandruvada@linux.intel.com>, Jiri Kosina <jikos@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Zhou Wang
	<wangzhou1@hisilicon.com>, Longfang Liu <liulongfang@huawei.com>, "Vinod
 Koul" <vkoul@kernel.org>, Lee Jones <lee@kernel.org>, Jijie Shao
	<shaojijie@huawei.com>, Jian Shen <shenjian15@huawei.com>, Sunil Goutham
	<sgoutham@marvell.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "Heiner
 Kallweit" <hkallweit1@gmail.com>, "David S . Miller" <davem@davemloft.net>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>, Oded Gabbay <ogabbay@kernel.org>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>, Karol Wachowski
	<karol.wachowski@linux.intel.com>, Min Ma <mamin506@gmail.com>, Lizhi Hou
	<lizhi.hou@amd.com>, Andreas Noever <andreas.noever@gmail.com>, "Mika
 Westerberg" <westeri@kernel.org>, Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>, Xinliang Liu <xinliang.liu@linaro.org>, Tian
 Tao <tiantao6@hisilicon.com>, Davidlohr Bueso <dave@stgolabs.net>, Srujana
 Challa <schalla@marvell.com>, Bharat Bhushan <bbhushan2@marvell.com>, Antoine
 Tenart <atenart@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>, Raag
 Jadav <raag.jadav@intel.com>, "Hans de Goede" <hansg@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby
	<jirislaby@kernel.org>, Andy Shevchenko <andy@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Mika Westerberg
	<mika.westerberg@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>, Robert
 Richter <rric@kernel.org>, Mark Brown <broonie@kernel.org>, "Nirmal Patel"
	<nirmal.patel@linux.intel.com>, Kurt Schwemmer
	<kurt.schwemmer@microsemi.com>, Logan Gunthorpe <logang@deltatee.com>, Linus
 Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>, Sakari
 Ailus <sakari.ailus@linux.intel.com>, Bingbu Cao <bingbu.cao@intel.com>, Ulf
 Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>, Benjamin
 Tissoires <bentiss@kernel.org>, <linux-input@vger.kernel.org>,
	<linux-i3c@lists.infradead.org>, <dmaengine@vger.kernel.org>, Philipp Stanner
	<phasta@kernel.org>, <netdev@vger.kernel.org>, <nic_swsd@realtek.com>,
	<linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
	<linux-usb@vger.kernel.org>, <iommu@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, David Airlie <airlied@gmail.com>, Simona
 Vetter <simona@ffwll.ch>, <linux-cxl@vger.kernel.org>,
	<linux-crypto@vger.kernel.org>, <platform-driver-x86@vger.kernel.org>,
	<linux-serial@vger.kernel.org>, <mhi@lists.linux.dev>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, Jan Dabros <jsd@semihalf.com>,
	<linux-i2c@vger.kernel.org>, Daniel Mack <daniel@zonque.org>, "Haojian
 Zhuang" <haojian.zhuang@gmail.com>, <linux-spi@vger.kernel.org>, "Jonathan
 Derrick" <jonathan.derrick@linux.dev>, <linux-pci@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	<linux-media@vger.kernel.org>, <linux-mmc@vger.kernel.org>
Subject: Re: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors
 allocation
Message-ID: <20260224162000.000001a5@huawei.com>
In-Reply-To: <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
	<1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
X-Originating-IP: [10.203.177.15]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_082009_625663_131E67B9 
X-CRM114-Status: UNSURE (   7.05  )
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

On Mon, 23 Feb 2026 23:29:40 +0800
Shawn Lin <shawn.lin@rock-chips.com> wrote:

> pcim_alloc_irq_vectors() and pcim_alloc_irq_vectors_affinity() are created for
> pci device drivers which rely on the devres machinery to help cleanup the IRQ
> vectors.

It might be worth adding some details on why we need the is_msi_managed
flag in the first place vs just doing conventional devm_add_action_or_reset()
with pci_free_irq_vectors().



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
