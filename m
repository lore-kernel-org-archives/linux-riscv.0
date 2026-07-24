Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE26C531CC
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jul 2026 00:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ekiHA3X3a8EMt3rUlOpGkI5PuruDYgfqgUNG8MXoN8=; b=437LCv+roHGElt
	vzOfpJL/HsKH9X6iMCskUeBtYi/zZbdb4TCGB2DzFf8NAXXRyYOozbn0xemK/Kk4u55GIgYjG1gx6
	7aJXESJxWtY4V09q2rE2zVKIPXeYCfN5Ht74erT/a7HHnGJR9JBZsnlCGEwD/iPQz5tgST6/G0hfQ
	Uk92VVLCT3CQFOjOLWlsznR33/pYJOhXHCrEU0tbVMHRn1nO9VmoG/6Dj0cGV1UOybJ1BcGWk2bMt
	+gBnRU+ebunf4S27gzP9ctzzXVlvYEJWxthDagNCy8sncYrbwvgDdHzGn8Nq9frAMKSMouYkX7FZW
	dvsqtcMnsl39/7Lr3oIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3Qw-0000000FHXC-3igX;
	Fri, 24 Jul 2026 00:06:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wn3Qv-0000000FHX4-2kd9
	for linux-riscv@bombadil.infradead.org;
	Fri, 24 Jul 2026 00:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2KI8AfOPOXl0f250iINHG39YRU3B5MnXfsv7pT1KX/g=; b=ApMTEXNwASiwwJfNedo/qWiIf4
	81EwnjkRWBoxMNOScKQ35BwwdrFxZriWMEFkqdTsNg0J0Z4LtMvizjczosTBnUX37WhPxOHJPD3b8
	8on3EglbPuE41t60Ekt/F9egXy+2kltDLOLktiwsmReGff+buhZU3Gx2PHC3lqRY3LVOUdBJThsSa
	3OgASfonDUiGQZsb3bSEJSqzI1wOiR+C8OaK14+WvE/s77MpaQbAtvM5XV9YBsj4lQPdSRKRhRDOt
	jDgrfGCfVy4Htw3YdhCQaTqHkLHE/iXPo30GfhKX2EUmktAXdIMqVx44fyRW206C5pCcupStRUMM1
	n7sdybdA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wn3Qp-00000002AGO-395f
	for linux-riscv@lists.infradead.org;
	Fri, 24 Jul 2026 00:06:32 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66O05crZ6816527, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784851538; bh=2KI8AfOPOXl0f250iINHG39YRU3B5MnXfsv7pT1KX/g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=cjk4Mu1NmfnwTJBZcnMDXzJMHkenqntKCcNrpFKczgluAvUizFrKtjpifNaf3wNVj
	 q+CSk56M5MCweQQ732WkNMGNXlKVFPnFos1Aq0PJJ8KqAYPi/9H5TjUCefRL3aVW9Q
	 19lk8mWGBmVzXnAzIGoASQS7AVBof6gpYA3Pisi3uKfpoRiSlELSobP8yYdkSzNQKa
	 fOZx04Woq3UTNGHpmIxKTIcNeq6sEE3BGL55iv5ghvtIQ3tuHe2eRib+905fqx/NEu
	 vdu7B0SX9Wnx0Z39esj0Tkz1ok5P+lirO98xxOnduiLSy1BUz3atMYg9MgQ70/91XH
	 Fb+21GvWMnWTg==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66O05crZ6816527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 24 Jul 2026 08:05:38 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 24 Jul 2026 08:05:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Fri, 24 Jul 2026 08:05:38 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Fri, 24 Jul 2026 08:05:38 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
CC: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?iso-8859-2?Q?Krzysztof_Wilczy=F1ski?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, "Aurelien
 Jarno" <aurelien@aurel32.net>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "spacemit@lists.linux.dev"
	<spacemit@lists.linux.dev>, "linux-wireless@vger.kernel.org"
	<linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to
 linux/pci_ids.h
Thread-Topic: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to
 linux/pci_ids.h
Thread-Index: AQHdFXehTbmbDPtnB0KyE0vFNWAFDLZ6Vr7ggADV5ACAAKiGMA==
Date: Fri, 24 Jul 2026 00:05:37 +0000
Message-ID: <e437ff6da5ea494e83edcfd2605632cb@realtek.com>
References: <073fbf4b41804285b2df6fbb4efce0ed@realtek.com>
 <20260723220140.GA865834@bhelgaas>
In-Reply-To: <20260723220140.GA865834@bhelgaas>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_010628_834785_4B0996BF 
X-CRM114-Status: GOOD (  18.22  )
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

Bjorn Helgaas <helgaas@kernel.org> wrote:
> On Thu, Jul 23, 2026 at 01:19:47AM +0000, Ping-Ke Shih wrote:
> > Hi PCI maintainers,
> >
> > Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> > > Move the vendor and device ID for the existing Spacemit K1 PCIe Root
> > > Complex to include/linux/pci_ids.h. Also add K3's Root Complex device ID
> > > to this header. This is done so that these values can be referenced in
> > > the rtw89 driver to enable 36-bit DMA ability in it for WiFi to function
> > > on the K3 Pico ITX board.
> > >
> > > Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> > > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > > ---
> > >  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 3 ---
> > >  include/linux/pci_ids.h                       | 4 ++++
> > >  2 files changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > > b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > > index be20a520255b6..f89c6d46c7684 100644
> > > --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > > +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> > > @@ -21,9 +21,6 @@
> > >
> > >  #include "pcie-designware.h"
> > >
> > > -#define PCI_VENDOR_ID_SPACEMIT         0x201f
> > > -#define PCI_DEVICE_ID_SPACEMIT_K1      0x0001
> > > -
> > >  /* Offsets and field definitions for link management registers */
> > >  #define K1_PHY_AHB_IRQ_EN                      0x0000
> > >  #define PCIE_INTERRUPT_EN              BIT(0)
> > > diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> > > index 1c9d40e09107d..d6f26cacc8e35 100644
> > > --- a/include/linux/pci_ids.h
> > > +++ b/include/linux/pci_ids.h
> > > @@ -2640,6 +2640,10 @@
> > >  #define PCI_VENDOR_ID_SUNIX            0x1fd4
> > >  #define PCI_DEVICE_ID_SUNIX_1999       0x1999
> > >
> > > +#define PCI_VENDOR_ID_SPACEMIT         0x201f
> > > +#define PCI_DEVICE_ID_SPACEMIT_K1      0x0001
> > > +#define PCI_DEVICE_ID_SPACEMIT_K3      0x0002
> > > +
> > >  #define PCI_VENDOR_ID_HINT             0x3388
> > >  #define PCI_DEVICE_ID_HINT_VXPROII_IDE 0x8013
> >
> > As patch 2/2 obviously goes to wireless-next tree, can I take this
> > dependency patch to my tree?
> 
> Yes, that's what my Acked-by at
> https://lore.kernel.org/all/20260716164336.GA40813@bhelgaas means.

Thanks for the confirmation. :)



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
