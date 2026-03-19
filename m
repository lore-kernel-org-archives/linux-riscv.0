Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6EB11088E65
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 02:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zrZ5MtIZI2J2fiQc0zgZp7W9jaW3YzSAYlbPmDNdXHk=; b=ifaG87IFstCD4G
	aaFA+iJuMpohbPpos1bsihsmJn/yR+LkswJaRHYfuCQrCPJHIGlgCs6O/hXSDb57gebPoTg4F6OGW
	gy6PoOsDIJtzdM5Y5j0vm0ZxTjiicVXUM+jdyX4pklQJytsPzZy6+XW6Rcj+alrupV5x0T9TRXXEO
	pVVNYZMF1TaEUSlt2m+welX1bnjTAbhZsdVT/ag9a3DbXEnpatSe/5HC1mGiDt1U8bDJNYpngGitI
	ZiCsGhRwHH0xQpDfl5UrASVa8btOImhlt2GbJc7yD7oAdGVC7R1qvMMp3rZCUrPsCbFEqju7+BXcz
	I3gjKtIycAwVdTvKtUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33KD-00000009lpW-45aU;
	Thu, 19 Mar 2026 02:41:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w33KB-00000009lp9-0Bnz
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 02:41:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 53FCE4344D;
	Thu, 19 Mar 2026 02:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0BB0C19421;
	Thu, 19 Mar 2026 02:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773888086;
	bh=0YnP0cX3MOJZgYSvb4gihkYukDmX2h84D3ADD5FXdlA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=L6ZUK1lqkr0Ua+ipa9dcLBgDnGGBlJvcoNOB5C1O8WnuVfKIeUQ+DJWDy7dohNL4L
	 rR37FEj7qh9YiJx9m27wX7qU7NcJNrOc5ZPd8sAiU2/Q6m4FVYS6ou7GVU2gEazrcR
	 5b7wlNnJHQquBjC93+eZ7LOlrYLdn8jQTK6jDKbLF3BxmcI0dB8qNgvAkFBJZ9AU8n
	 b7+31FsaSsZ7d1x0sslfDgUwF4tn08Jfq+zX+8au2oO9XlkfHHvwrCBoAbsk35mFDi
	 V53+XwVUy4XaSG404BZ5/5T7owqvGFBBJOZM9wzFD96NiAdw2kr2efZWodWNpcdowT
	 C9XFRJycPcrSg==
Date: Thu, 19 Mar 2026 10:41:24 +0800
From: Yixun Lan <dlan@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ze Huang <huang.ze@linux.dev>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: usb: dwc3: spacemit: add support for K3
 SoC
Message-ID: <20260319024124-GKB489299@kernel.org>
References: <20260317-02-k3-usb20-support-v1-0-d89f59062ad4@kernel.org>
 <20260317-02-k3-usb20-support-v1-1-d89f59062ad4@kernel.org>
 <20260317-shortness-gecko-72f14fbc79f2@spud>
 <20260317214435-GKA453922@kernel.org>
 <20260318-crock-tinderbox-ae12024627d9@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318-crock-tinderbox-ae12024627d9@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_194127_101284_E28C1705 
X-CRM114-Status: GOOD (  19.82  )
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

On 17:21 Wed 18 Mar     , Conor Dooley wrote:
> On Wed, Mar 18, 2026 at 05:44:35AM +0800, Yixun Lan wrote:
> > Hi Conor,
> > 
> > On 12:55 Tue 17 Mar     , Conor Dooley wrote:
> > > On Tue, Mar 17, 2026 at 11:53:02AM +0000, Yixun Lan wrote:
> > > > Add compatible string for DWC3 USB controller found in SpacemiT K3 SoC.
> > > > The USB2.0 host controller in K3 SoC actually use DWC3 IP but only has
> > > > USB2.0 functionality, and requires only one USB2.0 PHY connected.
> > > > 
> > > > Explicitly reduce number of phy property to minimal one.
> > > 
> > > Is this valid for the existing compatible, will it work with only one
> > > clock?
> > > 
> > I didn't change clock binding, do you mean phy?
> > 
> > Both k1 and k3 work with one clock (no change here)
> > 
> > for phy, the existing k1 requires two. for k3, one controller requires
> > one phy due to only has USB2.0 support, other controllers requires two
> > phys - USB2, USB3 PHY
> 
> Yep, phy is what I meant. Sorry bout that. Since you're relaxing the
> constraints for the k1, can you please add a conditional section to the
> binding to enforce 2 phys min for k1?
> 

To be explicit, the change should be applied to both K1 and K3, even in K1
use case, it's perfectly fine for designer to choose enabling USB2.0
only, and leave the comb phy to pcie contoller, so only one phy required

While revisiting the DT file, the phy related property should be moved
to board level, but this is another thing we should fix..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
