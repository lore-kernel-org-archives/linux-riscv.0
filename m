Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD9C9FEC0FC
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 21:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/5Eh+WueXREuiPTGiNq4zK4BdrmePoOyEpHshLof7aI=; b=x/yq828pkSGsfv
	E403LH07sxc9y+7Suz3WjHAEWUGyUR7OhUH6W66DgfmLIldXJ1RKoVwFCm4y1GxW3hMp5bXa+Iw9t
	RHSh9oB1UFJlEVeYy1rN2ldwq27jJlUf5VLmvNF3bIMhD/IUFOWv8LD+l7kcV5Srht++yxgTM7Xt3
	uPHXNOMOw9VrdYwtPtNzNUQBejSK7TAWXHt7g7Pz4pl1lmdP+7Sof+G/Csn1yod3GGa1iXVbaTkMb
	hCwORih0gcmyN799qdqfVitwDlrAOZoMVPjaw1Ch7s1vunU32r0lt6Q7u4oIb2n4SLBFXJevcqGrL
	fXgxytFbFEl/6U3Csxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w599d-00000002FZZ-3CT2;
	Tue, 24 Mar 2026 21:19:13 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w599a-00000002FYk-2mrS
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 21:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=In-Reply-To:Content-Type:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Content-Transfer-Encoding:From:Reply-To:
	Subject:Content-ID:Content-Description:X-Debbugs-Cc;
	bh=5Qp9pw/xlq5gZ1dNLakBcf07LSncdySe5C25zgQ+rzs=; b=u200+ftT1ds3+6px7BRODPNqvZ
	IHKW0PZUmrbtdyv/qJjFSCFSZQ6DOMsG3eCE64bHiHAzqOZsh0qcfr/6+4gpmJps67ePBMFveTWWy
	8GV6lCGQZ+v8fS6VDr7m8R3dbHPXBMnFb+gI16Kg46ZvRyqZwl86vGh1y289pQ3YQMvHJtAYiSM48
	uj35dv0WXBNDb1hSbBjmNOfzvMY56r9Qdm811Kxzz05hJ7RvOQacKsE3vPX9x6VuBNenyvz/hjVpZ
	gbhgDM6e4RPJGifCUJaJ/6vRTNuQs78QrL7JtydJKYqgYRMa9TGZOCyGPM9XXSseHTx7kSqUAuzbJ
	By3Y5zVQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w599Q-0000000Dcjf-2TLc;
	Tue, 24 Mar 2026 22:19:00 +0100
Date: Tue, 24 Mar 2026 22:19:00 +0100
From: Aurelien Jarno <aurelien@aurel32.net>
To: Yixun Lan <dlan@kernel.org>
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
Message-ID: <acL_xPYiGXUp_Tir@aurel32.net>
Mail-Followup-To: Yixun Lan <dlan@kernel.org>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
 <20260324090220-GKA739629@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324090220-GKA739629@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_141910_708878_DA470E89 
X-CRM114-Status: GOOD (  21.31  )
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

Hi Yixun,

On 2026-03-24 17:02, Yixun Lan wrote:
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

Yes, it's works. And the datasheet also mentions fast read being 
supported.

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

It is currently not used by U-Boot, currently SPL support is not 
available, but patches have been posted to added it. I just wanted to 
anticipate the addition of the Milk-V Jupiter board in U-boot, but if 
that hurt, i can remove it (or you can removed it when merging).

Regards
Aurelien

-- 
Aurelien Jarno                          GPG: 4096R/1DDD8C9B
aurelien@aurel32.net                     http://aurel32.net

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
