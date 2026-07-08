Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBC6C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 02:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXC7hNibclN+FYSZ2B1AMDlc+EwAzj91L33o/rA9QF8=; b=wyj82yqLcJeweR
	Xp+GAgheXJST0Iy+Tz3Yj0zC+Xs6mpkexJmTRxd82hHqeV1LlvYuBAsBzMY3V7lnF93HRdguQxycL
	hdRaXfWmTYwVFgrxYpETNvu6m3koQh6z/IPoLOgbvYUkWqBMnr3h+qkJCHkCdQgCr4Dv5ELkNalHn
	LfXv8BQ3x5yI5ZU8vJ2O+GvGfUaf+F+D4+S4iZ+KJM5I8qbLh9gPByBuv+OfFjHOU/BmnP/SJpar9
	Aee3U7McbHECzW1bsTridt4mpheZBJs3+jLes28inpwhKhJMVDojYssqsL9W9kfcnpPn+aCU0zLe8
	pOW5oVpUCIqWCcw1hXWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHrI-0000000G975-3fja;
	Wed, 08 Jul 2026 02:17:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whHrH-0000000G96u-1EBq
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 02:17:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C395432AD;
	Wed,  8 Jul 2026 02:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBE81F000E9;
	Wed,  8 Jul 2026 02:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783477074;
	bh=kIHZQkBG4dVsKYZdSJUwIGIZF8zO/xu9yTXMYf0l6VQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Y6UWUk8VT6ihOiUv++Oz7SIr67DpWO6YoStjUxH4/PfZiOWTU0OcaZf892wY1UDvP
	 F0MapI4xSAZJ+QFGVi6A50PRDgS1Vujai4RQ6dY6Db+OmxUO7YzwRZnnFSv7nhzYUE
	 ZZUKUSnWUglSMeq9MhoFk8exLwWi8L+7W3IGwZ7xZVZnzuR1FmLSNn1KHbzkkbGPV5
	 QvLMJpf0/pSlOaST9j7bjr6enu+n9J/DAPVLsemdgKhFsBbL+E3n2tf2MtZharPatR
	 6judu/G7/szzJ9gfcZKN0n5pbornbc4f5hVwsbuWJK5YUTGxv3qglsIhW0JzO+0zDo
	 voCxKcQzB/S3A==
Date: Wed, 8 Jul 2026 02:17:52 +0000
From: Yixun Lan <dlan@kernel.org>
To: Jennifer Berringer <jberring@redhat.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: k3: Add UFS support
Message-ID: <20260708021752-GKI35811@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
 <akkSL1nQ5UieqHNs@rhdev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <akkSL1nQ5UieqHNs@rhdev>
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

Hi Jennifer,

On 10:01 Sat 04 Jul     , Jennifer Berringer wrote:
> On Thu, Jul 02, 2026 at 02:31:37AM +0000, Yixun Lan wrote:
> > Add UFS Host Controller support for SpacemiT K3 SoC, and enable
> > it both on both Pico-ITX and CoM260-IFX boards.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts |  4 ++++
> >  arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   |  4 ++++
> >  arch/riscv/boot/dts/spacemit/k3.dtsi           | 13 +++++++++++++
> >  3 files changed, 21 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > index 238bb03d0e9e..b37e1c7b03e3 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> > @@ -19,3 +19,7 @@ chosen {
> >  		stdout-path = "serial0:115200n8";
> >  	};
> >  };
> > +
> > +&ufshc {
> > +	status = "okay";
> > +};
> 
> I believe k3-com260.dtsi would be a more fitting file for this change.
> UFS is soldered on the underside of the compute module and not part of
> the carrier board.
> 
Right, I agree

> Because it is next to the microSD card slot, a picture showing both can
> be seen in section 5.12 (TF-Card Interface) of the PDF version of the K3
> CoM260 User Guide. That picture is notably not visible in the HTML
> version.
> 
> https://www.spacemit.com/community/document/info?lang=en&nodepath=hardware/eco/k3_com260/com260_user_guide.md
> 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > index b89c1521e664..f1560a5a9031 100644
> > --- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > +++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
> > @@ -221,3 +221,7 @@ hub@1 {
> >  &usb2_phy {
> >  	status = "okay";
> >  };
> > +
> > +&ufshc {
> > +	status = "okay";
> > +};
> 
> Nit: if sorted by label, ufshc would be before usb2_host.
> 
Right, will sort in next version

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
