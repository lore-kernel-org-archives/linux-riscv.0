Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10566D62613
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 12:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B4M0SxDbp5y79CJy9sQ51E9ZRWTwZgq/AUmC0uOolhM=; b=xv0GJJGdjYUYAb
	fZIckLS7msGjZUidOW2ZB8aydm3Xr00WG0BJwONHY10B+OQVWt/yx4hWRq9x1lhK8Nw3/7pYrQ8sg
	t84+7bNoyJok4dCId4I9pDVInoI3UmMRSlnRVk03jBXYASPobr+hpD41KrCOU2NaM5IKfL50ekj7O
	EhyCxG2uIOfFmboPxoJIxqUD9kj97wChNf6OizCRVDMoG0jJsPQ5HadwiBoxFVrWxYMnWdR/hy1iQ
	tDAfuvn5OppTIahr1ySPby2JEMqJGkiLt/ZurfydKn/NWwWGsXwenprK3aI7y3oXdazVRdgj1xfCf
	fKHJbyx2teelccWFnMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitYA-00000007219-2Bee;
	Thu, 22 Jan 2026 12:12:34 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vitY7-0000000720k-2MHJ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 12:12:33 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CB565341E8A;
	Thu, 22 Jan 2026 12:12:28 +0000 (UTC)
Date: Thu, 22 Jan 2026 20:12:23 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Mark Brown <broonie@kernel.org>
Cc: Guodong Xu <guodong@riscstar.com>, Liam Girdwood <lgirdwood@gmail.com>,
	Alex Elder <elder@riscstar.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, devicetree@vger.kernel.org
Subject: Re: [PATCH 0/4] regulator: spacemit-p1: Fix voltage ranges and
 support board power tree
Message-ID: <20260122121223-GYC63789@gentoo.org>
References: <20260122-spacemit-p1-v1-0-309be27fbff9@riscstar.com>
 <20260122101122-GYA63789@gentoo.org>
 <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <77bc5a5f-666d-4beb-ab78-99a242d72a39@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_041231_643051_01020D29 
X-CRM114-Status: GOOD (  13.64  )
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

Hi Mark,

On 11:27 Thu 22 Jan     , Mark Brown wrote:
> On Thu, Jan 22, 2026 at 06:11:22PM +0800, Yixun Lan wrote:
> > On 17:43 Thu 22 Jan     , Guodong Xu wrote:
> 
> > > Patch 1, n_voltages is corrected to match hardware register widths, as the
> > > previous values prevented regulators from reaching higher operational
> > > voltages (e.g., 3.3V on LDOs).
> 
> > This patch bring system-wide change that not only affect Bananapi F3..
> 
> > Please also provide fix for other boards, I think you may not be able
> > to test all boards, but make sure the patches are available, so people
> > who interested can test, P.S I can help on milkv jupiter board
> 
> Patch 1 looks like it should be OK as is?
then with patch 3, and for other boards (milkv jupiter), should have similar
DT fix as patch 4..

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
