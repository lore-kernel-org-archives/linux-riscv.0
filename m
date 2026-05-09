Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44926CD343F
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 12:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzvlLatzxGJKY5QJ9JCi6kP/158hloD0iCFVHIH4vBs=; b=v6JqF0rBfptX00
	/WtmJOI8JswAMstidiAnl14Od0MF+m1i3toYT8ExCrXC6eoXEqQ+aiyWtOaQBr0jHxriW4e6Ap4RS
	IgiFs3L9os1au7GV3yT/AKdF2mZCQEQbIQUtbrYD4RG8PpmojPhWAI2LRO/gzxWYCxmbGMmeUte8J
	7cceP1DXxRd+tTj/LZQ2mMQF4eV71RYMnsbwaWShuoljLT/OvtDy5bkEn8bos0ujKSpG4zab3xBv6
	pITp/7EaELrFDo3GDMz2ODG7KJusKjxD6x6m8ZqiyVMPIQ+uF+NmkVDkVO+GKIxuF99W63gJpkypO
	pAtIFOnFiWyz9r+/E83Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgdF-00000008uUU-0Ff9;
	Sat, 09 May 2026 12:18:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgdC-00000008uTt-40Sh
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 12:18:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44B1C43E8C;
	Sat,  9 May 2026 12:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86A9FC2BCB2;
	Sat,  9 May 2026 12:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778329086;
	bh=e2oFXTT2JCKAlsxuWsZ6hENzU/VoBbUd/BrLIBFBNP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HGRVQTciuPangxRxax8jZyIRUUotI2KItf+rr+a5pIP/kRPNqBkBffgLG+LPr49j2
	 Sg/CsTt4o1qiPlKxruGVWNJlhcF0/pN/2uaZBtNzpC5yFQM1YowZQrDGTMP6k1XG9V
	 jsVqryep0OA0ba/WJ6mfWLmkF1meAicdVTLNXod78+9fyAnh0pYyTo97nQ3x2l8PNj
	 IRGtblwh54w8OKgoFq3nxuGkCGLukFGi3T882Zk+RrJTrENoU9QcEWtOC3ZDdzHRmE
	 r+o9vx0PKj02EGFS7Ls3CqZQWJx66H+llTxwvHwqxyvx6rkVWxikxW18DZEv6JQbhD
	 sHrOPfOpKqHXA==
Date: Sat, 9 May 2026 12:18:02 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
Message-ID: <20260509121802-GKB3601591@kernel.org>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
 <20260502051906.8160-2-linux.amoon@gmail.com>
 <20260507024524-GKA3579608@kernel.org>
 <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CANAwSgQLhgC6puNy2dkMjL=hd+yTYizBBFykd63KJDbw48219w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_051807_057000_87FC6C31 
X-CRM114-Status: GOOD (  24.76  )
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

Hi Anand,

On 13:06 Fri 08 May     , Anand Moon wrote:
> Hi Yixun,
> 
> Thanks for your review comments.
> 
> On Thu, 7 May 2026 at 08:15, Yixun Lan <dlan@kernel.org> wrote:
> >
> > Hi Anand,
> >
> > On 10:48 Sat 02 May     , Anand Moon wrote:
> > > Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> > > DC input. As per the schematics, vcc5v0_sys is the input power source
> > > for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> > > to correctly reference vcc5v0_sys as their parent (vin-supply).
> > >
> > > Cc: Han Gao <gaohan@iscas.ac.cn>
> > > Cc: Ze Huang <huang.ze@linux.dev>
> > > Cc: Chukun Pan <amadeus@jmu.edu.cn>
> > > Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
> > >  1 file changed, 12 insertions(+)
> > >
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > index 5790d927b93d..9727ecdd9f6b 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
> > >               regulator-always-on;
> > >       };
> > >
> > > +     reg_vcc5v0_sys: regulator-vcc5v0-sys {
> > This will fall into the catogery of "non-controllable & serve no devices"
> > see similar comment for 'reg_dc_in' which raised by Krzysztof
> >
> > https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/
> >
> > or should I ask, what's the real problem if regulator has no vin-supply?
> 
> If the device tree is not configured with the correct power source it
> will affect performance.
> 
Please elaborate, or provide enough evidence to prove this, because the
conclusion you gave here contradicts with what Krzysztof pointed out

> > Any probe failure or something bad happen? (besides /sys/../regulator_summay)
> 
> Not really; the regulator summary just confirms the PMIC used the
> correct power source.
> with te device ip blocks.
> 
then I see it's unnecessary to add this

> Bananapi F3 schematics.
> [1] https://drive.google.com/file/d/19iLJ5xnCB_oK8VeQjkPGjzAn39WYyylv/view
> (page 24)
> 
> Please check the shematics VCC5V0_SYS page 4
> VCC5V0_SYS->USB_VCC5V0->HDMI_VCC5V0->FAN_VCC5V0->VCC3V3_SYS
> 
> Please check the shematics VCC5V0_SYS page 24
> VCC5V0_SYS input for VCC5V0_HUB and 5V_VBUS give the USB hub,
> which is enabled by USB3_PWREN (gpio pin)>
> 
> Plese check power tree page 4
> USBVBUS->SY8386J UXXX -> PCIE_VCC3V3 for pcie vin source
> 
> So, this series tries to fix the vin source for USB 3.0 and PCIe nodes.
> 
This is not what I ask..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
