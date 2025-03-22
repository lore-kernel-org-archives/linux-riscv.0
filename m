Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 148D9C35FFC
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Mar 2025 16:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PYWst3r+KpW7jJ9TavIKlCFh7OoD3OV0o2ToFewH8HU=; b=ks68i6MSarA3cS
	K0OsHYyKnF77DVmw3g1DNm1mFS7LSXRRi8rmK9bkNVgHYos2F2cY/g/2T25PxebnVOF9CLCClOamL
	z4ZC0tiq7BQnfvDe4Vt4QsCMfN7Yygo2O9lZKJAu4a5bVZyd1mFGH0ZrhIfuT2k7onE4hdAnQZWKO
	szILPyDPPE98C7OTtW0Er1ct+oPTiKRSA1Sf5gTCYvtQSu2AgKCetdgGNlCJD3Lghm1wLGGIx6BEp
	0hBkXshoQiPCqGhp+ChAfnKemqxQPUYDTGwjQDqPN2+qzQWhfn9GRmpINaf45ksuTFHccbUSVSCvc
	9Y7yD5aoIt9n+/TyjPPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tw24c-000000006km-2Mkt;
	Sat, 22 Mar 2025 16:51:50 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tw24a-000000006kO-0iuu
	for linux-riscv@lists.infradead.org;
	Sat, 22 Mar 2025 16:51:49 +0000
Received: from localhost (unknown [116.232.48.233])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C4C90343231;
	Sat, 22 Mar 2025 16:51:45 +0000 (UTC)
Date: Sat, 22 Mar 2025 16:51:40 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	p.zabel@pengutronix.de, mturquette@baylibre.com, sboyd@kernel.org,
	heylenay@4d2.org, guodong@riscstar.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, spacemit@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RESEND 1/7] dt-bindings: soc: spacemit: define
 spacemit,k1-ccu resets
Message-ID: <20250322165140-GYF11633@gentoo>
References: <20250321151831.623575-1-elder@riscstar.com>
 <20250321151831.623575-2-elder@riscstar.com>
 <20250321222546-GYA11633@gentoo>
 <1d79fb7e-4501-4c62-8379-f00515dec3e4@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1d79fb7e-4501-4c62-8379-f00515dec3e4@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250322_095148_247425_FFD60B06 
X-CRM114-Status: GOOD (  18.18  )
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

Hi Alex:

On 09:27 Sat 22 Mar     , Alex Elder wrote:
> On 3/21/25 5:25 PM, Yixun Lan wrote:
> > hi Alex:
> > 
> > On 10:18 Fri 21 Mar     , Alex Elder wrote:
> >> There are additional SpacemiT syscon CCUs whose registers control both
> >> clocks and resets:  RCPU, RCPU2, and APBC2. Unlike those defined
> >> previously, these will initially support only resets.  They do not
> >> incorporate power domain functionality.
> >>
> >> Define the index values for resets associated with all SpacemiT K1
> >> syscon nodes, including those with clocks already defined, as well as
> >> the new ones (without clocks).
> >>
> >> Signed-off-by: Alex Elder <elder@riscstar.com>
> >> ---
> >>   .../soc/spacemit/spacemit,k1-syscon.yaml      |  13 +-
> >>   include/dt-bindings/clock/spacemit,k1-ccu.h   | 134 ++++++++++++++++++
> >>   2 files changed, 143 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >> index 07a6728e6f864..333c28e075b6c 100644
> >> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> >> @@ -19,6 +19,9 @@ properties:
> >>         - spacemit,k1-syscon-apbc
> >>         - spacemit,k1-syscon-apmu
> >>         - spacemit,k1-syscon-mpmu
> >> +      - spacemit,k1-syscon-rcpu
> >> +      - spacemit,k1-syscon-rcpu2
> >> +      - spacemit,k1-syscon-apbc2
> >>   
> >>     reg:
> >>       maxItems: 1
> 
> . . .
> 
> 32
> >> @@ -180,6 +184,60 @@
> >>   #define CLK_TSEN_BUS		98
> >>   #define CLK_IPC_AP2AUD_BUS	99
> >>   
> >> +/*	APBC resets	*/
> >> +
> > I'd also suggest to drop above blank line, keep style consistent
> > with others in this file, some same below that I won't comment
> 
> OK, I'll fix the weird extra line and will drop these blank
> lines as you suggest in v2.  I'll post another version after
> Sunday.  I recognize the merge window means I can't expect
> reviews during that time, but this code is waiting for the
> clock code to get accepted anyway.
> 
no need to hurry, we will postpone clock to next merge window,
let's give more time for people to review, thanks

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
