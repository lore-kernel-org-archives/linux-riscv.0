Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAD7FC531C9
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 09:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nF84SNQrRP+Qn9riPvk94UsWkCATunK43uVrYIZY6Qs=; b=Ui4SLb4Y9OQM1c
	izIo4k0uAdFzYeU2o/C9Kx+9sRDpOxxRIyKJTJWxxied7bXCzd0Oq54G4/72qgqmfsNcBXA4geoVz
	fhmfA96RWMsFS5ELvP24hS2FjsNrzlRmwmmyIYPH5NNSuqmSTS1CyyVEiojBJiTb/Ma0uG0leUu96
	yyRZhcmlBhMqQ51Xx5476CnB+e2AaEZ+IU7HKheZFUuC5qUF4DCGUeQvgZac0hv5m79u4+Cwos75I
	xcvW0ukcqpVk14q3YAK3fEuUCCEj2MqaioRS7ZhiIK2lmDgizVFqsvdqLBR+2rF6TtZvek5WEjG7F
	RcdvTod+F50mZ/6ShY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYWd-00000000D9C-0Ur6;
	Sat, 25 Jul 2026 09:18:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnYWb-00000000D8s-0Xoh
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 09:18:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8E534600AD;
	Sat, 25 Jul 2026 09:18:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6F3D1F000E9;
	Sat, 25 Jul 2026 09:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784971108;
	bh=zXZsG0yYtOm3DPrrBAksWmNTNjdQy47MFZdmr+uh6nA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RBoBT3pQC4HZDzXPYlv465ebdNWya3PFbBQO0BhRZBjPKeigSZtYC0wpYvRvwni/T
	 TK9LZikpL2GY9InqD5sYoaTZvU1aQqqVRtD64lHIHsEXhCQoO4/uuhXjL5yto5wkNo
	 mjelapnSn6P5754X0AkEbKludJ6AMNo8qjK4tWp/IAi+18YfhZ5Tkxo9LqOA4z/W0q
	 f5aDXFcz4tiw07HH4quNHafTvUzFtYrO3H+NFeWsD3962JCWj7ORjqctL1EeMYGcnN
	 Eu9R0rj3jIb/p26ZaYcpoJ0+jXlF7VzPqxN3YZA5RfRl6RTnjb/mSZu0NtRRjSJ9q2
	 8rd0iYUj6Rnmw==
Date: Sat, 25 Jul 2026 09:18:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
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
Subject: Re: [PATCH 2/3] scsi: ufs: spacemit: k3: Add UFS Host Controller
 driver
Message-ID: <20260725091824-GKA77545@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
 <20260702-08-k3-ufs-support-v1-2-1a64a3ab128f@kernel.org>
 <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7x3b4sttnc4oxkuvxmpkihfi76lkapjcigo7khgcgfytvol7w2@v5ykuyrk2z3m>
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

Hi Anirudh,

On 15:16 Sun 12 Jul     , Anirudh Srinivasan wrote:
> On Thu, Jul 02, 2026 at 02:31:36AM +0000, Yixun Lan wrote:
> > SpacemiT K3 SoC consist of UFS (Universal Flash Storage) Host Controller
> > which has features compatible with JEDEC UFS 2.2, MIPI UniPro v1.61 and
> > M-PHY v3.0 standard.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  drivers/ufs/host/Kconfig        |  12 +
> >  drivers/ufs/host/Makefile       |   1 +
> >  drivers/ufs/host/ufs-spacemit.c | 931 ++++++++++++++++++++++++++++++++++++++++
> >  drivers/ufs/host/ufs-spacemit.h |  90 ++++
> >  4 files changed, 1034 insertions(+)
> > 
> > diff --git a/drivers/ufs/host/Kconfig b/drivers/ufs/host/Kconfig
> > index ff170c0b6da0..4f53b7f7688f 100644
> > --- a/drivers/ufs/host/Kconfig
> > +++ b/drivers/ufs/host/Kconfig
> > @@ -132,6 +132,18 @@ config SCSI_UFS_VARIABLE_SG_ENTRY_SIZE
> >  	bool
> >  	default y if SCSI_UFS_EXYNOS && SCSI_UFS_CRYPTO
> >  
> > +config SCSI_UFS_SPACEMIT
> > +	tristate "SpacemiT UFS controller driver"
> > +	depends on SCSI_UFSHCD_PLATFORM && ARCH_SPACEMIT
> 
> Can you add SCSI_UFSHCD_PLATFORM and SCSI_UFS_SPACEMIT as modules to
> riscv defconfig (or just add the former and add a default y if
> ARCH_SPACEMIT in this Kconfig entry). This will let defconfig kernels
> to boot with persistant rootfs on these devices.
> 
Ok, will consider adding one entry to riscv defconfig, but this should be
handled in another separate patch, for making it as module or built-in driver,
I'm incline to choose latter one, but would be glad to hear different opinion

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
