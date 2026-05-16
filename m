Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB54CD4F21
	for <linux-riscv@archiver.kernel.org>; Sat, 16 May 2026 05:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1OG5MBHiUV5SHC10HLNKT2zOp7VFrpmabJtAm3zzJDM=; b=OTjQHAKOmV+ysH
	Utnc8KcyceI0A5eti+MRe7jZmfBGVIMucdiZgGT9xyvy7ImsCJIYSl9ivtY55qMacNTLAZCnJbKeD
	23UeHW/CP5O83ZLGeZfvQGolAyzxwgK1kBNn3KgB0bpAkiKOIfZIzq3rRaKC+WI515ozGAOI31rH2
	Il7B8rOTIQmcvPaYT+H7uMg82M1AVUM9xdsJOJS/tpuymMPZfYLgfeuGNfwgCy0YUyVK11mcYmrIl
	9oxNPfIyvSM1UbD05dfDOklSMZl6/i7mZ6/wEa41efizPRB9MVRwB+uhdjgB+HiZ5PQXKmBFYKOXd
	TXdNPaIn08rq8d5Noa4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7iT-0000000ABkc-1ZJi;
	Sat, 16 May 2026 05:37:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wO7iR-0000000ABk6-2B5k
	for linux-riscv@lists.infradead.org;
	Sat, 16 May 2026 05:37:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AA6E408C4;
	Sat, 16 May 2026 05:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64DF4C19425;
	Sat, 16 May 2026 05:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778909854;
	bh=8yBvfhLzYDJAvKIHnzpbKWBDmTKaskcNlT36hAQ0Img=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=fK1aSbm8mudfk4ee6EzKpdHjeIFsFfF7nm+GOPlpahSUotCWY0ksHkUGF0m19EPrY
	 g7GKFh7EWTb+zSaVr5DrMQOy8/YmU9Euao08L9AS3Ba4d3BU0ce17We++sgwaXZb3k
	 DOpv0NSN11xQ9ubjC1lofG9vE+ItMhTPE/gwz5/JPDrGvwxuDNmJgF7SHeIxz+oLay
	 0A2DxcvfWSluN1ERcvKOpZE4ITsDfuM85GDxsK3YAR/Z1/cfpszJTjxW7bj2JHODv+
	 DpKSTCb+zmpj+AO9EyQbRjTYA/dfhXJ9v6RdZLSIX2HUUGLnzXlhft9Ym9XMKMnekg
	 C149fh8jHax6Q==
Date: Sat, 16 May 2026 05:37:30 +0000
From: Yixun Lan <dlan@kernel.org>
To: E Shattow <e@freeshell.de>, linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: enable eMMC on Milk-V Jupiter
Message-ID: <20260516053730-GKA3675990@kernel.org>
References: <20260514160356.1642075-1-aurelien@aurel32.net>
 <20260514160356.1642075-4-aurelien@aurel32.net>
 <f52a821b-157a-467d-84ee-4d1d4a96f673@freeshell.de>
 <agbP0-OsfQRFJcr0@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <agbP0-OsfQRFJcr0@aurel32.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_223735_580515_BCBE58BF 
X-CRM114-Status: GOOD (  16.25  )
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

Hi Aurelien,

On 09:48 Fri 15 May     , Aurelien Jarno wrote:
> On 2026-05-14 23:49, E Shattow wrote:
> > On 5/14/26 08:56, Aurelien Jarno wrote:
> > > The Milk-V Jupiter board has a connector for an eMMC module. Add an
> > > entry for it in the device tree and alias it mmc0. As it is not
> > > populated by default, do no mark it as non-removable.
> > > 
> > 
> > The meaning of "non-removable" here is whether it is expected to be
> > added and removed during use, requiring to be probed again; not whether
> > it is a user configurable module or soldered down part.
> 
> Not connecting the eMMC module and larking it as non-removable causes this info
> message to appears in the logs:
> 
> mmc0: SDHCI controller on d4281000.mmc [d4281000.mmc] using ADMA
> mmc0: Failed to initialize a non-removable card
> 

I'm with E Shattow here, and would prefer to add "non-removable" property,
Unlike SD card, the eMMC has no CD pin, some logic may be handled slightly
differently.

For that failure message, I have no idea how to deal with it but might
just ignore it.. Guess it's the price that have to pay if enabling the
eMMC in DT but has no module soldered or plugged in?

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
