Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7FBE103E177
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Mar 2026 13:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U89otEJGNarD9WUhi/wFh87CtYcUsNfgbsK7szvYuaI=; b=Q6slsD/gmc1HL/
	g/g+uIDxUvNqFvJegbu7M7xSWpOQ9QQWB7tVEbPNV6xpG5tLYy+I7bjtb/4pd/R+QnrsCXGIlv/V9
	NfyT5WBcrqfaioJnWHlt8VYQgmGect0/ibYhSdUit+OtE5AEYWVywtyj7rnzTSD8hAQDYCr8LjSSH
	maFm6jE23byu9SUH/m0zZ2j6nG9VfNy9Mgz87AFbdUzOvt6PU6JLMUxumn+zJU9IQJDPop7Xqc2kh
	oL7lVzrkaWJqTn3TfQBb2wFM4uVRoABnjiTv1l2z3s+p+0aWQf6+9Kz4A3ywRCOEj9FQZj64KKN99
	WMmDmRYTdT7VBOPj8Klg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qmW-00000008Sro-3V0B;
	Wed, 18 Mar 2026 13:17:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2qmV-00000008Srg-1a79
	for linux-riscv@lists.infradead.org;
	Wed, 18 Mar 2026 13:17:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71B0460054;
	Wed, 18 Mar 2026 13:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 992B6C19421;
	Wed, 18 Mar 2026 13:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773839870;
	bh=NWoOHxrlHQBNsiY+UBVVePy1w1a1sjeoXf1OTtfhM7k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1t6aZ4DV8idhy50Zvde4N76URkcYhAPWskzmGqXzZo4gJPa673NLgFrVAWL1PpS2
	 Jew1loWVXwaM2ZGlzwanp3fR5krtkDMdqqmAJPoylZl86TH7ec4ux3orzvfncRMyPh
	 s8FdopOgPYPiGQF0SrcvbOzAvCyzGVjmM5ytqMPa8AP5jbJs8p76ONUVs4r/T8K+ij
	 EM0JvYsC0cCBzIQcvc4i4M6dHQlQBCe1iAfvH4JG9kPyockIkv0tJwAQXzPGxusqF4
	 s2RciUDmH/ixJZ0JhcDq6s1y4zcnpzJuR0OVFa1kJa++9btEuOonLDa8tHc0i96SIu
	 Dn40kXyplPYqg==
Date: Wed, 18 Mar 2026 21:17:47 +0800
From: Yixun Lan <dlan@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Junzhong Pan <junzhong.pan@spacemit.com>,
	Guodong Xu <guodong@riscstar.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@gmail.com>
Subject: Re: [PATCH v3] reset: spacemit: k3: Decouple composite reset lines
Message-ID: <20260318131747-GKB488271@kernel.org>
References: <20260317-01-k3-reset-usb-pci-v3-1-e4b9a43c7d45@kernel.org>
 <3e9022faae3dc6f5066a1e7cc3752a0193a55bc9.camel@pengutronix.de>
 <20260318131043-GKA488271@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260318131043-GKA488271@kernel.org>
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

Hi Philipp,

On 21:10 Wed 18 Mar     , Yixun Lan wrote:
> Hi Philipp,
> 
> On 13:39 Wed 18 Mar     , Philipp Zabel wrote:
> > On Di, 2026-03-17 at 02:36 +0000, Yixun Lan wrote:
> > > Instead of grouping several different reset lines into one composite
> > > reset, decouple them to individual ones which make it more aligned
> > > with underlying hardware. And for DWC USB driver, it will match well
> > > with the number of the reset property in the DT bindings.
> > > 
> > > The DWC3 USB host controller in K3 SoC has three reset lines - AHB, VCC,
> > > PHY. The PCIe controller also has three reset lines - DBI, Slave, Master.
> > > Also three reset lines each for UCIE and RCPU block.
> > > 
> > > As an agreement with maintainer, the reset IDs has been rearranged as
> > > contiguous number and pushed as a fix for the driver, and reason is that
> > > there isn't any consumer of reset driver so far,
> > 
> > Unfortunately that does not seem to be the case for all APMU resets.
> > A lore query for all changed IDs [1] yields a patch that adds ethernet
> > device nodes using RESET_APMU_EMAC[012] [2].
> > 
> Yes, although the ethernet use this ID, but I don't think we should worry
> about that, since the ethernet patch is still under review, and ideally it
> will be merged after this reordering patch, unless you disagree? and insist
> the RESET_APMU_EMAC should not be changed?
> 
To be precise, this reset patch will go in v7.0 as a bug fix, while the
ethernet DT patches target for next merge windown - v7.1 cycle

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
