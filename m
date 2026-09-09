Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DC9CC79F82
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 02:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZSLjM8Yy/otrLufjkjaTYUs5BcAMD9B0nWK8E1G9Aw=; b=vjHb3pit4bccYt
	GRVDJ4qjDv+WqLXl+j5tcacyEeYKoJaQ833aDbts/CRCsMaNYyvGcJtP30SJI7oJExMaMg6ml76gQ
	tN93S+IwcX5Ec03tcp8OhRKg3k+rNDQbhjeAiT2uW8CjSfMvmLSoOaHDAYt997c6DhMltOvtFkmOb
	Xk5PBrmcdLYyRXJti/WsHg8yGuZJtHPodOo2ZtQnZ/WfoW8l2Pi1/LNoOu+7XHrNc1HWZA41nNkPH
	MLIZMgJwaXmnG8ki7GKN7HeZPS8lH1q692Q2Hdj/4/lG99k/wTWzpYNbTTPtKOozRkyvTecdQdZaP
	S4WIgHLvI0eRUFZi1mhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47oU-0000000Aelh-3SPu;
	Wed, 09 Sep 2026 02:13:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x47oS-0000000AelY-2k0k
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 02:13:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 251CE601FD;
	Wed,  9 Sep 2026 02:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 629F01F00A3A;
	Wed,  9 Sep 2026 02:13:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788920002;
	bh=aj7lS4wbLim438IKRoJg6uP0XjtEK8zqH0TnLDS7ljM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DOyiux90L4WR4WXBcnBSN8C+56L0qkvN3MzL1Yz66twQXHTaFpr9ydMEJ3wtJx9Se
	 FwOJlpQnoA9ty19of931FX9pnQRvoqH7erIJU7kqrIapmzaaqfhgPS7/Nrq/JTxSma
	 BczN+nn0rxUP98dq7RRXWYcLv1vwn2aQpo9yYhGTCLCzSZWz9XXYNlw/qRhzzclKuk
	 0l3g7p6lelhrreTYyiZxFL5DXjzM+ZWslbavFaOGubsZC52bapl6l/WMsIA9sxj7tA
	 V8uIUpXOzMBhfOazJPsKK9KyxxKK+2c1UZIiAbQT/PJduEhkBHr/zsvuACEMfcyLHv
	 VrZ18rFEPWieQ==
Date: Wed, 9 Sep 2026 02:13:20 +0000
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Alim Akhtar <alim.akhtar@samsung.com>,
	Avri Altman <avri.altman@sandisk.com>,
	Bart Van Assche <bvanassche@acm.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K. Petersen" <mkp@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Jennifer Berringer <jberring@redhat.com>,
	linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] scsi: ufs: spacemit: dt-bindings: Add UFS
 controller for K3 SoC
Message-ID: <20260909021320-GKG2330@kernel.org>
References: <20260908-08-k3-ufs-support-v4-0-22aa2bd97d3b@kernel.org>
 <20260908-08-k3-ufs-support-v4-1-22aa2bd97d3b@kernel.org>
 <20260908-carnival-curve-5762bb5cdb92@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260908-carnival-curve-5762bb5cdb92@spud>
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

Hi Conor,

On 18:59 Tue 08 Sep     , Conor Dooley wrote:
> On Tue, Sep 08, 2026 at 07:42:03AM +0000, Yixun Lan wrote:
> > Document the compatible for UFS (Universal Flash Storage) Host Controller
> > which found in SpacemiT K3 SoC chip. Its features are listed below:
> > 
> > - Compliant with MIPI UniPro v1.61 specification.
> > - Compliant with M-PHY v3.0 specification.
> > - Compliant with UFS HCI v2.1 specification.
> > - Supports up to 2 Tx and 2 Rx lanes, up to HS-GEAR3 5.8 Gbps per lane.
> > - Supports standard low-power hibernate to reduce power consumption.
> > 
> > Signed-off-by: Yixun Lan <dlan@kernel.org>
> > ---
> >  .../devicetree/bindings/ufs/spacemit,k3-ufshc.yaml | 56 ++++++++++++++++++++++
> >  1 file changed, 56 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
> > new file mode 100644
> > index 000000000000..dda533c852e8
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/ufs/spacemit,k3-ufshc.yaml
> > @@ -0,0 +1,56 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/ufs/spacemit,k3-ufshc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: SpacemiT K3 SoC UFS Host Controller
> > +
> > +maintainers:
> > +  - Yixun Lan <dlan@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: spacemit,k3-ufshc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 2
> > +
> > +  clock-names:
> > +    items:
> > +      - const: aclk
> > +      - const: ref_clk
> 
> It's the usual refrain here, about having "clk" in clock names.
> "axi" and "ref" perhaps?
Yes, it's axi clock, I agree and will adjust in next version

> Otherwise, looks fine to me.
> 
Ok, thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
