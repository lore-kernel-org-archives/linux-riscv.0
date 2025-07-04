Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5446C83030
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 02:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ar7b1nYkAS/F7c4mmc8uYgUjVbDy9Yk+5NshcLbBXV4=; b=bW6QUZ3t9GJMku
	Jsb3Me9NCOl1pLruyKsLNlbgcRi+UAtsYgjxgqk89BMdQ/yZO+/2Hrsb8x5gx0Q1ISJ4KsqYYOmhL
	Vae1wlyFSeuTDgaCu0VBue3s0ck4KK6vxMPHZUsTlS72fC4/I5I7IsyY7tVDbv5ipnqfa/yNjUriX
	7PAxm6WpjoOThuY0e+m3aNHbSOli6Uq2YJAL4bYZmgljekS7yUtI8gsClItGvRkteaQ/Ya3Df83Ll
	TtEWvFjNpo0OA920k32/mM03ofKam6lUYUgOXE+3Z8nelnEgRatMC73+vEu7UP1xIM31d4moVoFRR
	3vJay0Wkiyxpu/4KgXIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWTE-0000000D6Lo-3UQS;
	Fri, 04 Jul 2025 02:48:12 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXWMy-0000000D5dW-1mn2
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 02:41:46 +0000
Received: from localhost (gy-adaptive-ssl-proxy-4-entmail-virt151.gy.ntes [114.94.8.21])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1adedd589;
	Fri, 4 Jul 2025 10:41:31 +0800 (GMT+08:00)
Date: Fri, 4 Jul 2025 10:41:31 +0800
From: Ze Huang <huangze@whut.edu.cn>
To: Frank Li <Frank.li@nxp.com>, Ze Huang <huangze@whut.edu.cn>
Cc: Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"spacemit@lists.linux.dev" <spacemit@lists.linux.dev>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v4 3/4] usb: dwc3: add generic driver to support
 flattened DT
Message-ID: <aGc_W5Gfyiw8deYK@cse-cd03-lnx.ap.qualcomm.com>
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-3-63e4e525e5cb@whut.edu.cn>
 <20250603012029.4agja77rdoneeyrl@synopsys.com>
 <aD5jL5DK6S8ii-DT@jean.localdomain>
 <aGc4EibLNTEj/H11@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGc4EibLNTEj/H11@lizhi-Precision-Tower-5810>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0hJVkhKH08YHk9JSx4YQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk9VQk9VQ1VJSllXWRYaDxIVHRRZQVlPS0hVSktJQk1LSlVKS0tVS1kG
X-HM-Tid: 0a97d34f7e8b03a1kunm074d1ad6206a3a
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6P0k6DQw5VjEyATkZFEMRMDwM
	LU0aCjBVSlVKTE5KTkJNQ0JISk1PVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlK
	Sk9VQk9VQ1VJSllXWQgBWUFJT01DNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_194144_672196_FDCFF073 
X-CRM114-Status: GOOD (  13.57  )
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

On Thu, Jul 03, 2025 at 10:10:26PM -0400, Frank Li wrote:
> On Tue, Jun 03, 2025 at 10:51:27AM +0800, Ze Huang wrote:
> > On Tue, Jun 03, 2025 at 01:20:35AM +0000, Thinh Nguyen wrote:
> > > On Mon, May 26, 2025, Ze Huang wrote:
> > > > To support flattened dwc3 dt model and drop the glue layer, introduce the
> > > > `dwc3-generic` driver. This enables direct binding of the DWC3 core driver
> > > > and offers an alternative to the existing glue driver `dwc3-of-simple`.
> > > >
> > > > Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> > > > ---
> 
> Any progress on this patch? If you have not time, I can continue work on
> this one.

Hi Frank,

I was planning to submit everything together for full functionality, but since
Alex's PHY work[1] is almost done, I'll send out the USB generic driver part
separately first.

Link: https://lore.kernel.org/all/5084a99a-9140-4c4f-9873-f5478f48a49d@ieee.org/ [1]

> 
> Frank Li
>

Thanks,
Ze

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
