Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91805D18144
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 20:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pgK/ZA6WBe/0Ec3h4RJNFD/qg914dGYHXvBT+7jsfNE=; b=q9KkvVYsW/TiFM
	8dkvwTogr6rAx+0onxeVoBsMYenHoC4bySSXonkullWhUcofTkmn0nvcYPVXPV3LiY5Fh4aJt8v/x
	+lOKjlBhXmwXUNJMyLQePLST5AOuYmq65Qr9zmJ8f4m8470aCmy8wo0JlM5JBN8cZm7h4zrqoCF+R
	6tAjabJej//QdAcQmDAIxYNeOtsz/vEmGoH01etTRgs8Oi0vSEIbQmVOkGneM1abCHu0gAgIS+GWq
	5qFEWm4VlDEVmHqllLYi6ap5vYn3iIv/d0z8+O+Q8uVh/zu9U6ypjb73IIUBUOeEESFeULuPySDeE
	tsap0ROtWYB4YgU57QMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0Rfb-00000006O52-1yNu;
	Mon, 14 Oct 2024 20:27:59 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0RfX-00000006O4b-0huw
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 20:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=HhkcX725e/3oAWjz9xZVWQiKXqdRkr07/xexm6SenoI=; b=lZYwal+FxlOb7aLLzWJsDONhrL
	DaHhLlN9YQQTB/thexylNscem+ElDuw8zEc3SrbSzTkisNiWjYaS7PA3CI+3eFVdX9iN5uBwGKbCx
	3TDR/OQZresaAepfP/oNvjtP0yELldkRAdKnyY+7ybzBumz1SwW+qitha/+yGjd/lcbbNpStIypmZ
	rxJ+et0dfo3mF8MEqvBHTrCXU2hq379X5FY8c+Nr1IG7Yo6bC77jAuPwYrwRedLfAHyNwaZzn0st0
	PUzlKWtFNf4f4SUQ/LGnmS7FdE/xD7rdyFxvhSNdOo/DHIPhRaWq25++4RJGOkbbxGY2BO6Vyt9lR
	DY5Udb0A==;
Received: from ohm.aurel32.net ([2001:bc8:30d7:111::2] helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1t0RfJ-003pXv-2A;
	Mon, 14 Oct 2024 22:27:41 +0200
Date: Mon, 14 Oct 2024 22:27:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	E Shattow <lucent@gmail.com>
Subject: Re: =?utf-8?B?5Zue5aSNOiBbdjM=?= =?utf-8?Q?=5D?= riscv: dts:
 starfive: jh7110: Add camera subsystem nodes
Message-ID: <Zw1-vcN4CoVkfLjU@aurel32.net>
Mail-Followup-To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	E Shattow <lucent@gmail.com>
References: <ZQ0PR01MB13026F78B2580376095AF7E7F2442@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZQ0PR01MB13026F78B2580376095AF7E7F2442@ZQ0PR01MB1302.CHNPR01.prod.partner.outlook.cn>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_132755_661072_A7C9D48E 
X-CRM114-Status: GOOD (  20.22  )
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

Hi,

On 2024-10-14 01:08, Changhuang Liang wrote:
> Hi, Aurelien
> 
> > 
> > Hi,
> > 
> > On 2024-02-18 19:27, Changhuang Liang wrote:
> > > Add camera subsystem nodes for the StarFive JH7110 SoC. They contain
> > > the dphy-rx, csi2rx, camss nodes.
> > >
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  .../jh7110-starfive-visionfive-2.dtsi         | 49 ++++++++++++++
> > >  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 67
> > +++++++++++++++++++
> > >  2 files changed, 116 insertions(+)
> > 
> > We have been asked to enable CONFIG_VIDEO_STARFIVE_CAMSS in the
> > Debian kernel, which from my understanding and given the device tree shown
> > below also requires enabling CONFIG_VIDEO_CADENCE_CSI2RX. That said
> > doing so triggers the following error in dmesg:
> > 
> > [   25.143282] cdns-csi2rx 19800000.csi: probe with driver cdns-csi2rx
> > failed with error -22
> > 
> > From a quick look it seems there is something in the port@0 csi2rx entry. Do
> > you happen to know what is wrong?
> > 
> 
> You need to add your sensor node. You can refer to this patch:
> https://patchwork.kernel.org/project/linux-riscv/patch/20240119100639.84029-3-changhuang.liang@starfivetech.com/
> 
> We suggest that using the imx219

Thanks for your answer. I do not have any sensor attached, the goal is
to build a generic kernel, and people can use overlays or patch their
device tree to add support for additional devices.

In that regard, I have the impression that csi2rx device (and maybe the
camss device?) should not be marked as enabled in the default device
tree. I think they could be enabled by users as part of the change need
to add the sensor node.

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
