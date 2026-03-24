Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8E13F54ADA
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 17:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=km0E8ulNdFr9zBHu2vLxbNgxTmNXHCZ/HOOwkkFNpWs=; b=b/JvIncolvh0fa
	ox068A/CqY+nNxkAeE48ETbi1E1NI7HEtWW6rG/nNFkZfPxTszphxTF1hqRTEyJN44B4NU+5KNJMt
	vPpu5s+c4znJ20Y3LOU684EBdoh7BRBoW6wMIEqZ8RZv4TFhBkJroQrp7nTb4km0tpEqUYLTBGTwq
	tdsdc+Hg6aFUovin1mrvfshm8D7YX2OUz28mvX4DETm7PTwbyn1nycR8W0OOP1Dyua1lEo9j8XUnt
	9KwXQ1bxubOZgroZ6cEtM1M5M+f2ia2MF/pNIOvHAoaR7EbzTKJOEeSV9mBhCCalGwhBvULyp/Bjm
	iPzazBhbnMZIKcr3dXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Et-00000001yZL-0pS2;
	Tue, 24 Mar 2026 17:08:23 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w55Er-00000001yYz-0Hgk
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 17:08:22 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1774372085; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MYHkYxhl1kzsmMPu+YSWcmmrZLgIFDepwqCYYTJVmnWBBiOSPXoeNy7/5b6gDQStizKS9VNvUz0zjveuguJXJy48VYplJsPVWgklwVT/ZTpA7Xgj25ODq6uSVtM48MaZPDcGlI8RdTVY/+QFb4VMHF70YGAHtj0MY8bpOPx1zBM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774372085; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yis1W3CG/QCQD456WDjoHGPyDG1Mp4/onsEgXHy2b14=; 
	b=T5telFO8kWN0M5y2Oyx5U4Te9xi+q909DUtU0a0LNq9Jo5NvPuhd+Whw4dmsIv6ifHjE2ljzkysofhhV/fumQjCJeMFo/9UgZPlkCkty3OXEiNo+/3NRF5Mq40ONsdLlD33U+d2ckXkefX5tGrRseF/TxjjK+mcoDEoi7hJQ0lQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774372085;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=yis1W3CG/QCQD456WDjoHGPyDG1Mp4/onsEgXHy2b14=;
	b=iDX/j8WOlY/iWQX7G/cLaG8bbz1UIdDs5XuFY4SgibTZIcUKEEuV2I2ZwrebApkN
	HoT00F82R+5XhE8SrHQp+xK0kIyp2RpaGW8cHuycHMacYW5H65pxZUolcj8VYEwT4UC
	kT62Rtc39TNjWUTBsLoSunrHGoVql1JyUy1aw0j8=
Received: by mx.zohomail.com with SMTPS id 1774372083024696.6013806809772;
	Tue, 24 Mar 2026 10:08:03 -0700 (PDT)
Date: Tue, 24 Mar 2026 17:07:51 +0000
From: Yao Zi <me@ziyao.cc>
To: Yixun Lan <dlan@kernel.org>, Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <acLE5xnEBoCtW4Vw@pie>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324090220-GKA739629@kernel.org>
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_100821_151678_8ED24A99 
X-CRM114-Status: GOOD (  21.43  )
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

On Tue, Mar 24, 2026 at 05:02:20PM +0800, Yixun Lan wrote:
> Hi Aurelien,
> 
> On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> > Add the QSPI controller node for the Milk-V Jupiter board and describe
> > the attached SPI NOR flash (GD25Q64E).
> > 
> > The flash supports a frequency up to 133MHz (80 MHz for reads), and the
> > SoC supports a frequency up to 104 MHz. However tests have shown that
> > the flash is not reliably detected above 26.5 MHz, consistent with
> > frequency used in the vendor kernel. Therefore, use this frequency.
> > 
> ..
> > The m25p,fast-read properties is taken from the vendor kernel.
> > 
> So long as this is verified and works fine on board?
> 
> > Add a corresponding flash partition layout, matching the layout and the
> > names used in the vendor U-Boot.
> > 
> ..
> > Also add the bootph-pre-ram property to make the device tree usable by
> > early firmware/bootloaders without modification, as U-Boot is stored on
> > this NOR flash.
> Is the dtb file actually used by U-Boot? I'd highly doubt about this,
> if not the case or has not been tested, I'd suggest then not to add
> this property..

Currently no, but it would be a bogus if we could do it at introduction
of the device, if it's really necessary in pre-DRAM stages of
bootloaders, e.g. U-Boot SPL. This would reduce the duplicated work of
downstream projects if they decide to switch to Linux upstream
devicetree.

As SpacemiT K1 supports booting from flash, the description of flash
nodes are likely useful for pre-DRAM bootloaders.

> > 
> > Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
