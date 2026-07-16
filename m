Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EB4FC4450A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 09:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zaXIw6Q7v4jVt3PXzHWQhinfX5fZmiWYH4xz9/5VTQ=; b=QM9p5vaXjD4mCY
	d3LviG9LQ6sd3FkLXoB0FDfH45RbsT09t/siQndwNWpcfUdItb/n89O1ynQ5c5FvDegWpA+E0d5rV
	G+NBqOTU2Ofigkpqa2wngpR6dTyAXBgJtXO8eoFR04J8DwInjgzRqMTs7lPqZUtT3SCUrNtSwEY3B
	pH+iZAxP880ll11JIZHVtil1fO9GuFlR8rja5zUJJe/Fwssuml8c5QkH4SUHY1hjvradvFRhCiZYe
	EEey9NttYYa/WHwhNCABv5f9zOKL8oEw4P3+hgAeCVsbjOKArHhc0ubb7tJqDB+bNxbrIgZfKBE0g
	XhaDCo9ToYzsGnIaHy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIJ8-0000000Gqjs-0VqD;
	Thu, 16 Jul 2026 09:23:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIJ6-0000000Gqjj-3H1V
	for linux-riscv@bombadil.infradead.org;
	Thu, 16 Jul 2026 09:23:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=oWR/+zaRnb0CksvjCoRnlIkdqqWHcmWebf50cRymkmw=; b=m/4BRlXnqC2ZkCaVQaoWy1ngI8
	OSNM/oMsXtWppP1ow6QKzx9lDeT9PQTWcu1RxegraJLezkrJLfgNDuWcoLfYZgD8LNNjZUEQeInJT
	lMi8JsnqzRRg6n+kpc1D/wIB2R9iVexBEjqxDDmwajoKzs+FdLvFCPrtfmrddzd0BTpS+zyPFbnZM
	AVHNaF94wlA9xy/jzsMcYGwDeDKlNIacMiGv7t/wqI06b+Vvi54RSFAcCjLGNHRQxKaBTazl7RCL+
	FrEiiQktWQz6wX/yGg2U8bZbpBtzOMuTK+RcFI4m5y3Td1rUbC4pSQP8VlgleDxXkQGGXNoaA25EV
	+p6pFCQA==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wkIJ3-0000000DuzB-0NXA
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 09:23:03 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 66G9MIdvC3536744, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1784193738; bh=oWR/+zaRnb0CksvjCoRnlIkdqqWHcmWebf50cRymkmw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:MIME-Version;
	b=RxHhN5Lu3I1LU0f6JBkimisE+FmdRFhb3cXIRcmmU7r4yYjhjJb8Vv9+PtuZrZxde
	 PinFV0xHX+Bxp3dgiIdr6xpI0YuPOUc5zgoQGLgXp8kZns6CYOQVRkiVDXtCiNQ/zf
	 UckzKBl/7rjpthevb9o/Gdc5rUmcA+kntCA1JbvaOin0Zhp5MyA9030V8wpX0XqUC3
	 OOquG0hZ4AZ+X6df7pyWtsuL3m+k7rEQA4VBFwGPZFBZ3NVjro4qt8O5A8ElhnXS8f
	 UKYAnWrQoz1R/HNYRow48MX3Z9+2HGS4S/75VdkPG+ly0CQCWj1JDiA/JKh5gv/awT
	 AbXTyzenX9F1g==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.29/5.94) with ESMTPS id 66G9MIdvC3536744
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 16 Jul 2026 17:22:18 +0800
Received: from RTKEXHMBS06.realtek.com.tw (10.21.1.56) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Thu, 16 Jul 2026 17:22:17 +0800
Received: from RTKEXHMBS06.realtek.com.tw ([::1]) by
 RTKEXHMBS06.realtek.com.tw ([fe80::e6fd:5a3f:8946:92c4%10]) with mapi id
 15.02.2562.017; Thu, 16 Jul 2026 17:22:17 +0800
From: Ping-Ke Shih <pkshih@realtek.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Bjorn Helgaas
	<bhelgaas@google.com>, Yixun Lan <dlan@kernel.org>, Lorenzo Pieralisi
	<lpieralisi@kernel.org>, =?utf-8?B?S3J6eXN6dG9mIFdpbGN6ecWEc2tp?=
	<kwilczynski@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Inochi Amaoto <inochiama@gmail.com>
CC: "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>
Subject: RE: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Thread-Topic: [PATCH 2/2] wifi: rtw89: pci: enable 36-bit DMA on spacemit K3
Thread-Index: AQHdFNJRP59ehs1nXEC4sFhzEXMQ0LZv3oqg
Date: Thu, 16 Jul 2026 09:22:17 +0000
Message-ID: <e7a43955e41c4dbdb864e89edc3d9fe6@realtek.com>
References: <20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com>
 <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
In-Reply-To: <20260715-rtw89-spacemit-k3-v1-2-e577bc63706b@oss.tenstorrent.com>
Accept-Language: en-US, zh-TW
Content-Language: zh-TW
x-originating-ip: [172.21.6.42]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_102301_806164_35BD20E0 
X-CRM114-Status: GOOD (  10.35  )
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

Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com> wrote:
> The Spacemit K3 Pico ITX Board has a RTL8852BE pcie card behind a PCIe
> root port, but the SoC doesn't have any 32 DMA addreseses which the
> rtw89 seems to use by default. Enable 36 bit DMA ability that the driver
> has when this particular root port is detected so that the driver can
> probe on this SoC.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>

This patch looks good to me:

Acked-by: Ping-Ke Shih <pkshih@realtek.com>

But I wonder how this patchset goes via which tree. I'm happy to merge
them into rtw tree and then wireless-next tree if people can ack
patch 1/2.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
