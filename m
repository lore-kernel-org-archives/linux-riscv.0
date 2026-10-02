Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E883CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 11:25:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JqTozsdwCPh+oLaL06OJXOPezc8D5peLYZHp/fXR/xk=; b=cOxvfoDk8SWzB2
	dlfb1AYmrokmMVCHz2ZoTle2475V1igi4LWyAROyCJN2Q3rAskjYyIQiFZ9lPQNyhuiFQ098uEWBh
	4lD0aYvEdog9MsCgVBTIIqtgHu+1n3n5PN1XisARGD0OAeoK9Mxjr6rqLfBOj74llqMQasDZE20HC
	KzyVrgta83E+zmA9GgL/tQ5YVHSMx46tN0tjBfVu9terlXiv3SZdqxqZXVCLbyRCABzhEKVRNTk0k
	mLuyqkpbCpX6YROCA9RRLy0S02hCLE583MhYs6AdRedUOZdlicRcYIZEAizEvdwGaPyZ8/irzqwhZ
	eCN8mrfOV1x6axk1lzAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbOJ-0000000BT87-1dF9;
	Fri, 02 Oct 2026 11:25:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCbOH-0000000BT80-4AKy
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 11:25:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6992640DD9;
	Fri,  2 Oct 2026 11:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5AF51F000FF;
	Fri,  2 Oct 2026 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790940325;
	bh=VDnaG8ES1kgEtz+L3OdHjOgrH6Sl7lj4ASDqs5ASdL0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Fm32CMEq6YjufXbEd1WTX0th7pgJGNVwhI683WdbZqydnB59XCI2FvSpWMusALNvy
	 DB3v90xse6AJBlSJ+KCiRmDxcbfC15VrKeLhNppilRFoCxtQtd5PcyLEuuTjeZTmVu
	 HAZH5tuythh7b8gNnboEybnT/ELOVB5mYlvX9bZDutwHmZJ7nd4jXEXZzL0xRn9NxL
	 pY7b/D5LMPGmfp9b0U4rfBmsqDnVyRMS8uXoZR1Uux5gSONzy9M1w8ogt2ZWOj8TAh
	 RIksj+Ro0vSlEgOKSNObb98eV6WPV5qGfyGx0RSOPJfLKAxqtX1sJyDXwJFdLY6kWB
	 aG2xAh4/AH9KQ==
Date: Fri, 2 Oct 2026 11:25:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>, Guodong Xu <docular.xu@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	Conor Dooley <conor.dooley@microchip.com>,
	Bo Gan <ganboing@gmail.com>
Subject: Re: [PATCH v3 5/6] irqchip/aclint-sswi: Add support for SpacemiT K3
Message-ID: <20261002112521-GKA60800@kernel.org>
References: <20260918-k3-aclint-v3-0-cf4fd4050e14@pigmoral.tech>
 <20260918-k3-aclint-v3-5-cf4fd4050e14@pigmoral.tech>
 <20260919000611-GKF297024@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260919000611-GKF297024@kernel.org>
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

Hi Thomas Gleixner, Radu Rendec

On 00:06 Sat 19 Sep     , Yixun Lan wrote:
> Hi Thomas Gleixner, Radu Rendec
> 
> On 00:29 Fri 18 Sep     , Junhui Liu wrote:
> > Add a match entry for the spacemit,k3-aclint-sswi compatible. The K3
> > SSWI device requires no special handling and can use the existing
> > generic ACLINT SSWI initialization function.
> > 
> > Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
> > ---
> >  drivers/irqchip/irq-aclint-sswi.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> Ping irqchip subsystem maintainer, how do you expect to handle this patch?
> There are some dependencies between dt-binding, the driver and DTS file..
> 
> Would it be ok if I take it together via SpacemiT SoC tree? and probably with
> your Acked-by? Thanks
> 

Just FYI, I've queued this patch at spacemit soc tree for v7.4 merge
window, but let me know if there is problem, thanks

https://lore.kernel.org/spacemit/179093990819.1237110.17149048431287759426.b4-ty@b4/

> > diff --git a/drivers/irqchip/irq-aclint-sswi.c b/drivers/irqchip/irq-aclint-sswi.c
> > index ca06efd86fa1..d3ef2cd3b5c5 100644
> > --- a/drivers/irqchip/irq-aclint-sswi.c
> > +++ b/drivers/irqchip/irq-aclint-sswi.c
> > @@ -179,6 +179,7 @@ static int __init generic_aclint_sswi_early_probe(struct device_node *node,
> >  }
> >  IRQCHIP_DECLARE(mips_p8700_sswi, "mips,p8700-aclint-sswi", generic_aclint_sswi_early_probe);
> >  IRQCHIP_DECLARE(nuclei_ux900_sswi, "nuclei,ux900-aclint-sswi", generic_aclint_sswi_early_probe);
> > +IRQCHIP_DECLARE(spacemit_k3_sswi, "spacemit,k3-aclint-sswi", generic_aclint_sswi_early_probe);
> >  
> >  /* THEAD variant */
> >  #define THEAD_C9XX_CSR_SXSTATUS			0x5c0
> > 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
