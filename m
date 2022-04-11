Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91CBEC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Apr 2022 10:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HowN/HS8M2ZK3QIGDYA2O15JO6rWckjRSYQ1ZsucY48=; b=sijwGoW1igxNhJ
	xX9TC+dOKIkDzLKH0TnSvMWL1t+MWemXN0Ak6ZpSgT/OfVB/GHNgKX+PW2kn7giuhNz0OaVyXCn/y
	peki8XPw3dJWEPn1z0KNiesH2yuRCwNknx7TYP9lSwLimFBIodzW1naEc0fDWBfmPDTKw9QDPKVYW
	Zd08aKS9vYuUCb5Fg5gwZEDzmX96HW2q3EdChpSSYbJm0J4gjUZuGGalyBBelGtYLf958eJdh0iSz
	QIMor3Ev1GbdAM408FVT+keyIuJqVKF+vjOClDDd4QPp8KvRDJ7sjQguvueWmmz8YnHSXgOwcA/Cx
	Ec1A+Kzohn44yOjiYIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndrcI-008Uho-7R; Mon, 11 Apr 2022 10:49:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndrbL-008UJG-0N
 for linux-riscv@lists.infradead.org; Mon, 11 Apr 2022 10:48:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 758AC61504;
 Mon, 11 Apr 2022 10:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C2CC385A3;
 Mon, 11 Apr 2022 10:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649674133;
 bh=PYoKjVNaZaP85+VTrMLYd0+rrD4W9IKBqmtGHK94kPQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HvadtOZf2dSKdYcMt3y9aytIYryVH5LRSa5Fg3QzHVo7zMhoMIbIoWHUw0D2Q6cTR
 lFpn6Pd6Tfvy787XXpjYzoQ5jPr7tkKYUJ5u//qj2oylMh4c4SpP4EmkiHzMfgXEU2
 vE0+1Ky6rrslhjr+I/OVminEeEwR5ZJoE/xN0etO+JP3RS9mpR2NxiOp8Zpf8cehIC
 xZsZ9TyuAxN04MOn5YleIngCXUbax5qRVXIYuyCBlf7dq/TOMou09benIqN+vCTx+p
 i8GAfm8ToTMmhlz+Ov/cZImsojQ9mdLJv5u8xmJHuIWRqPl6MpWuyVFUIiTis5V2zy
 lFU4EgDZDEP3Q==
Date: Mon, 11 Apr 2022 16:18:49 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Zong Li <zong.li@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Bin Meng <bin.meng@windriver.com>, Green Wan <green.wan@sifive.com>,
 dmaengine <dmaengine@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v8 0/4] Determine the number of DMA channels by
 'dma-channels' property
Message-ID: <YlQHkeZhHvC/n0G5@matsya>
References: <cover.1648461096.git.zong.li@sifive.com> <YlA1DwdIMoQ1dXZS@matsya>
 <CANXhq0ramPvr=CL2oPsPAnWiF9X0eYVt8HGAVWPE9mZ5PfhG7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANXhq0ramPvr=CL2oPsPAnWiF9X0eYVt8HGAVWPE9mZ5PfhG7A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_034855_164217_968C59C2 
X-CRM114-Status: GOOD (  14.88  )
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

On 11-04-22, 10:51, Zong Li wrote:
> On Fri, Apr 8, 2022 at 9:13 PM Vinod Koul <vkoul@kernel.org> wrote:
> >
> > On 28-03-22, 17:52, Zong Li wrote:
> > > The PDMA driver currently assumes there are four channels by default, it
> > > might cause the error if there is actually less than four channels.
> > > Change that by getting number of channel dynamically from device tree.
> > > For backwards-compatible, it uses the default value (i.e. 4) when there
> > > is no 'dma-channels' information in dts.
> >
> > Applied patch 1 & 4 to dmaengine-next, thanks
> 
> Hi Vinod,
> Thanks for your help and review. For patch 2 and 3, does it mean that
> we should go through the riscv tree?

Yes

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
