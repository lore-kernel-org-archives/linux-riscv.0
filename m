Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AFD3CD13DA
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 19:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ri8tt8lJGOg/BxzBqe2tzYQMYzKzwxfY3VzQHV6m73s=; b=EEc40KxZydh5rl
	vJ0ns2AX/SIP9XRPnKw2bkhcr9FthPInaEk8bkw2KSG4J+2peYkLD44Z20FaR2rzEFts+CUjL9sY5
	KNMGrnwlk6W3l+UU4WPVegjAm/kuWgvGQuKpi4fikbIei/ZmS2rUMZt6SNzACEncCu5HqCb/WLZ3g
	ypvgWUmsvlcRillnzoAlb1EybZRECw2i1ek9otzAqRim3w+edOPCMeibn82TdhkVCm0SJ1PiTl81G
	Q3JZFsCQhcizjz4P81X1xH0SYmpJcdWW9q24jZtUap2pOWbvfi4DZWiAlnXoxXd10yTZyt3NrdjJS
	QHLHVR49FThhPx47l5BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJGOu-00000009bq7-29I4;
	Sat, 02 May 2026 19:53:20 +0000
Received: from mailout3.hostsharing.net ([2a01:4f8:fff3:b8::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJGOq-00000009bpF-22bR
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 19:53:19 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout3.hostsharing.net (Postfix) with ESMTPS id 97365C1D;
	Sat, 02 May 2026 21:47:17 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 5975B600D3D5; Sat,  2 May 2026 21:47:17 +0200 (CEST)
Date: Sat, 2 May 2026 21:47:17 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
	linux-pci@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>,
	stable@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
Message-ID: <afZUxYhkCQ0wG0Uu@wunner.de>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_125316_704164_6FA529C2 
X-CRM114-Status: GOOD (  12.88  )
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

On Sat, May 02, 2026 at 09:58:04PM +0800, Icenowy Zheng wrote:
> The problem is that the MSI controller has only 16 MSIs usable (it's
> wrongly described as 32 previously, a fix to this is pending[1]), and
> the failing device have an onboard PCIe switch, which created many PCIe
> ports (and corresponding pcieport devices).

Is the SG2042 only used in that single product?  If it is used in other
products which do not have an on-board PCIe switch, why do you want to
disable MSIs on those other products as well?

My point is, you want to constrain this to a specific product, not to
the SoC.  Can you maybe solve this by not specifying interrupts in the
devicetree for the PCIe switch?

> With pcieport devices activated, 11 MSIs are requested by the pcieport
> drivers -- 3 SoC PCIe ports and 8 switch downstream ports. Then only 5
> MSIs are available, but there're still 10 downstream-facing PCIe ports
> now (and 5 of them are hardwired to onboard peripherals).

pcieport can make do with a single MSI vector because all port services
support a shared interrupt.  But I assume your point is that this
particular product has so many PCIe ports that you're still close
to the 16 MSIs limit?

Thanks,

Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
