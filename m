Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26459CAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3031FvNX8X8BeR4rJSBX9y+vGrnrlcrMTFgg6PrWTk=; b=AP/mBIIeysCnqr
	tJ28VrWWowtdSbvBNggLEFeAwQe+zI2O2P53VHEdu5m2KlQAHF0EVa60lmR9FuVFRpIM8nrvoU9lW
	bB6fNV0rgCwBdFHDNV7TljQs3lJKHMJVOEAH1/T7IW/vYBDAhvnKMh4qRb2hp1c2fp1fZhqLaXbzI
	j93YXrxe47WMFqcC5oH6bZexKOmFiAgojFK0/row6WzLJW5Q3qLFO7rdPy/DBmWwvHNhBcnGjNnRK
	fAN3p7haBsHHD5vA9bwa6r2sqq80GgcD2ZWQERJY7cPYRDkf119+BMDb2CGvWnGSRsjI/ToVPHjZm
	ePL8wCaC+8g1ewnX2FlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2n6o-0000000ERea-3ZCw;
	Sun, 28 Sep 2025 08:50:18 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2n6m-0000000ERd6-1rhV
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 08:50:17 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E00AB340824;
	Sun, 28 Sep 2025 08:50:14 +0000 (UTC)
Date: Sun, 28 Sep 2025 16:50:10 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add MusePi Pro board device
 tree
Message-ID: <20250928085010-GYC1344940@gentoo.org>
References: <20250928-k1-musepi-pro-dts-v1-0-64d0659dfdbc@linux.spacemit.com>
 <20250928-k1-musepi-pro-dts-v1-2-5efcca0ce3ae@linux.spacemit.com>
 <20250928080003-GYB1344940@gentoo.org>
 <3074FC8521909735+aNjsSWwkd1aH-moh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <3074FC8521909735+aNjsSWwkd1aH-moh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_015016_507984_2C1240C1 
X-CRM114-Status: GOOD (  17.19  )
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

Hi Troy,

On 16:05 Sun 28 Sep     , Troy Mitchell wrote:
> On Sun, Sep 28, 2025 at 04:00:03PM +0800, Yixun Lan wrote:
> > Hi Troy,
> > 
> > On 12:16 Sun 28 Sep     , Troy Mitchell wrote:
> > > From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > 
> > > Add initial device tree support for the MusePi Pro board [1].
> > > The board is using the SpacemiT K1/M1 SoC.
> > > 
> > > The device tree is adapted from the SpacemiT vendor tree [2].
> > > 
> > > This minimal device tree enables booting into a serial console with UART
> > > output and a blinking LED.
> > > 
> > > Link:
> > > https://developer.spacemit.com/documentation?token=YJtdwnvvViPVcmkoPDpcvwfVnrh&type=pdf [1]
> > > https://gitee.com/bianbu-linux/linux-6.6/blob/k1-bl-v2.2.y/arch/riscv/boot/dts/spacemit/k1-x_MUSE-Pi-Pro.dts [2]
> > > 
> > same as patch 1
> > > Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> > > ---
..[snip]
> > 
> > while you are here, I'd suggest to push as many features as possible
> > instead of this minimal DT, which say - PMU, emmc, ethernet should be ready..
> > (ethernet is in next, should show up at v6.18-rc1)
> Good idea.
> I think I should split these into multiple commits, right?
> Like, PDMA and EMAC should definitely be two separate commits.
> 
IMO, not really necessary, but I wouldn't mind either..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
