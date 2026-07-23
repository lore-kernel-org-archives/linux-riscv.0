Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB2BC44536
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2026 01:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9GvPe3vCFt5noRQ0ArkXKpQdZjMzgNVozH9v0NJgc8=; b=GU8UYK8AqQ2egO
	EsahcBqs7sQffBb1L99s06VSApN4gom6eUP99t0pembeAG3oNBZYbhiZqLbYYZxwe1+bTcmZUeFaO
	mNuGIResZ68x+BzhwOtNHIvnRhW0Ck4VDYUeEvRPbCQJmaxUGbqL7OzpiZwt3qbndTk69buBKFvaS
	61oaRC5j9dKQGqgj1QMU5drF8D9JDVtfWAKlIOeUtoVudyvggszUvr0qCgqldBLeB7LMxlKqCKigc
	xMp9jNwhjhB2q8t80atdzhYnHg/zQ5pd/t2NRapbu/8un5ROhZwtE/qHwjmxb9bjHD6I5prwuVM4U
	MKxHhIj0bAEocPsXLU/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmi7c-0000000D29u-0mZK;
	Thu, 23 Jul 2026 01:21:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmi7b-0000000D29o-1A8K
	for linux-riscv@bombadil.infradead.org;
	Thu, 23 Jul 2026 01:21:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l+BcWxEYxghnenlldtXOwu+zC99qYehVhMZWM49Kkzk=; b=YtRI0MP7S/S4UBwBXBG8H7FbNM
	lsPq+ls5oJGL5zqH74HekmX6buLRHsZ65wsk+FxRkKLxRcAgO7jxaKAYX0xbnh6NAmUUzlrG1iUeR
	I1hXLWjhsMh65a18SVrGU7lAIl2brDaGYSAUqMSAsCjfRR8WKNRDgO0yqonRp1NmS3tEzho++Qo0+
	fQZAYUjbhWVbm57WYp1V7QkACnetJj2y2e7DvQIYZWcWGZtjooPBdZpZhTrkbleakSrECTr6Gm/OX
	Yo7E9vW7yu9w1YV5k/dJGA+9WcWg7r5jtB/NcQwTJfrmMOzNqCeGFkRsNtwJ5ehkivL/tl7AuqY73
	NzLUT8Xg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wmi7D-00000001Jr4-3pt3
	for linux-riscv@lists.infradead.org;
	Thu, 23 Jul 2026 01:21:09 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66N1JmFU2096485, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784769588; bh=l+BcWxEYxghnenlldtXOwu+zC99qYehVhMZWM49Kkzk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=HV/hg6puvpwQe9ORCUlxRgkV/B22MlLrGYspS1yYlv80QkBDjvjTBORNAWpBvckxP
	 hcf3621kkn+yWd8jQiKIbCzljy1OpmY9yGZiGD7ZSk0rSovfktxcUKiJESd7162HCK
	 OEZ4mmxIHg7iA9qXia99x9Rn82qU39ewR0CuGvRCJTPoAR+sa/jM026szBRPb0JQlY
	 2R/0Ie1yW3L9pW/XMQuFefhditcPVTdUOmVH6bwcgynk17W89d9FAMBifc94kfxXPD
	 HHi7dbOtXZ0aTBy1jlBcnoQFLk9u45FELFf4xMrlxUhxWy04AaWSv/n2T28NxMncSs
	 I6WM2YNJz5DnA==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66N1JmFU2096485
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jul 2026 09:19:48 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 23 Jul 2026 09:19:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 23 Jul 2026 09:19:48 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 23 Jul 2026 09:19:48 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>, "Aurelien
 Jarno" <aurelien@aurel32.net>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to
 linux/pci_ids.h
Thread-Topic: [PATCH v2 1/2] PCI: Move Spacemit vendor and device IDs to
 linux/pci_ids.h
Thread-Index: AQHdFXehTbmbDPtnB0KyE0vFNWAFDLZ6Vr7g
Date: Thu, 23 Jul 2026 01:19:47 +0000
Message-ID: <073fbf4b41804285b2df6fbb4efce0ed@realtek.com>
References: <20260716-rtw89-spacemit-k3-v2-0-392b577ebf75@oss.tenstorrent.com>
 <20260716-rtw89-spacemit-k3-v2-1-392b577ebf75@oss.tenstorrent.com>
In-Reply-To: <20260716-rtw89-spacemit-k3-v2-1-392b577ebf75@oss.tenstorrent.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_022107_526450_D7F2408A 
X-CRM114-Status: GOOD (  15.81  )
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

Hi PCI maintainers,

Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> Move the vendor and device ID for the existing Spacemit K1 PCIe Root
> Complex to include/linux/pci_ids.h. Also add K3's Root Complex device ID
> to this header. This is done so that these values can be referenced in
> the rtw89 driver to enable 36-bit DMA ability in it for WiFi to function
> on the K3 Pico ITX board.
> 
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 3 ---
>  include/linux/pci_ids.h                       | 4 ++++
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index be20a520255b6..f89c6d46c7684 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -21,9 +21,6 @@
> 
>  #include "pcie-designware.h"
> 
> -#define PCI_VENDOR_ID_SPACEMIT         0x201f
> -#define PCI_DEVICE_ID_SPACEMIT_K1      0x0001
> -
>  /* Offsets and field definitions for link management registers */
>  #define K1_PHY_AHB_IRQ_EN                      0x0000
>  #define PCIE_INTERRUPT_EN              BIT(0)
> diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
> index 1c9d40e09107d..d6f26cacc8e35 100644
> --- a/include/linux/pci_ids.h
> +++ b/include/linux/pci_ids.h
> @@ -2640,6 +2640,10 @@
>  #define PCI_VENDOR_ID_SUNIX            0x1fd4
>  #define PCI_DEVICE_ID_SUNIX_1999       0x1999
> 
> +#define PCI_VENDOR_ID_SPACEMIT         0x201f
> +#define PCI_DEVICE_ID_SPACEMIT_K1      0x0001
> +#define PCI_DEVICE_ID_SPACEMIT_K3      0x0002
> +
>  #define PCI_VENDOR_ID_HINT             0x3388
>  #define PCI_DEVICE_ID_HINT_VXPROII_IDE 0x8013

As patch 2/2 obviously goes to wireless-next tree, can I take this 
dependency patch to my tree? 

Ping-Ke


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
