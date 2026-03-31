Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B433C10F92EB
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 18:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mWvXLhx+pdMLFOwah1XGFke1XnLglDcoMHtDAcoUZrY=; b=pNr9kklF6PMpzZ
	Q3PKSRTmJl7+q9QpfaWJgx0Q4yPjowa3a+hurlGsyqbcSMLxFLT4uoCZnsKZhm8jbAK4ZOjZU/0EK
	DU4ZdI5l0877NXzZtRfyyYmGSCTp3/PtFi/kgMkLmbCCw04HwzLwqb8hQefS5NI7k/wKinbrZZl8B
	mqN7iVFesX9AJga9x6B19/5UxBA3J2oK5+cQH+vC97bOd82PeTffzUQLSl+adRZAnIberIBeN+h1I
	jRuCF2OID0SRDO1QFOryDNwHl+uysBld/DpVhL++oBc+ua6cJUu+9VnMW/Wn/0ry/ncoqncHD3NOv
	jqnEsgoyIceyw4SCRi6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eIG-0000000DRSM-1SvI;
	Tue, 31 Mar 2026 18:58:28 +0000
Received: from mailout1.hostsharing.net ([2a01:37:1000::53df:5fcc:0])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7eID-0000000DRRy-21pp
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 18:58:27 +0000
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by mailout1.hostsharing.net (Postfix) with ESMTPS id 28B51361;
	Tue, 31 Mar 2026 20:58:03 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 16AC560293F2; Tue, 31 Mar 2026 20:58:03 +0200 (CEST)
Date: Tue, 31 Mar 2026 20:58:03 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-pci@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH 0/2] PCI: Allow disabling port services on broken root
 ports
Message-ID: <acwZOxbEJoAJrvGb@wunner.de>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_115825_667582_7C87152E 
X-CRM114-Status: GOOD (  14.01  )
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

On Wed, Apr 01, 2026 at 01:56:56AM +0800, Han Gao wrote:
> SG2042's PCIe root ports only support MSI, not MSI-X. The MSI
> controller provides only 32 vectors shared across all devices behind
> each root port. When native port services claim vectors from this
> limited pool, downstream devices are starved of interrupts, resulting
> in zero interrupts delivered and driver timeouts (e.g. amdgpu fence
> fallback timer expired on all rings).

Have you considered setting the pci_dev::no_msi flag on the Root Ports
to force them to use INTx interrupts instead of MSI?  That would seem
like a cleaner solution.  There are already several devices for which
the flag is set in drivers/pci/quirks.c, see quirk_no_msi().

> Some PCIe root ports break MSI delivery to downstream devices when
> native port services (AER, PME, bwctrl, etc.) are active. The existing
> pcie_ports=compat kernel parameter works around this globally, but
> affects all ports on the system.
> 
> This series adds a per-device mechanism to skip port service probing:
>   1. Introduce PCI_DEV_FLAGS_NO_PORT_SERVICES flag and wire it into
>      the PCIe port driver
>   2. Apply it via quirk to Sophgo SG2042 root ports [1f1c:2042], which
>      fail to deliver MSI interrupts when port services are enabled

I think we should try to minimize such workarounds or at least make them
as non-intrusive as possible, so please try the no_msi approach instead.

I also don't see why the stable designation is needed TBH.

Thanks,

Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
