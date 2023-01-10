Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCCBAC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 07:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2w/+Z49J8ixgoQ1ILyEJDhfYuY0Um/jv4iHhIuzA8fo=; b=kNX72swQGanmP2
	fALodA435GEcC4su0VPxj84e5HDZXTi3mX+Oc7KEQ02hoiLiE2OSfcrj98DW67dU37j+W6uG3omWc
	7m0M+yBP0dKOjK1Cb7mLJ0l7qeonMZEGSxsorFWARdpI9oxWVj4Li6uJlH5HUJn7+mDgwVy3q5eYe
	5JZsGWE7Au/kgEt/2msJaIG+FI371Til0TVDMO0ycAI18BlbQZsngWNAVN857vxBRHj8jfut3Q7CA
	PBtQJUqcI/BPWYZ7m4h3xH0WdrRgkOx7kadhDNlmXk8eUxNPitk42iE2pZXDSoCPAi33aO+uGXAMv
	pVn9L7l1BFUmwFSLgrgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9Go-005dmA-Qu; Tue, 10 Jan 2023 07:42:06 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pF9Gk-005dih-Rv
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 07:42:05 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DF60024E15C;
	Tue, 10 Jan 2023 15:41:26 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 10 Jan
 2023 15:41:26 +0800
Received: from EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4]) by
 EXMBX168.cuchost.com ([fe80::3c2d:dee5:4938:3fc4%16]) with mapi id
 15.00.1497.044; Tue, 10 Jan 2023 15:41:26 +0800
From: JiaJie Ho <jiajie.ho@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>,
	"linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Subject: RE: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for VisionFive
 2
Thread-Topic: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for
 VisionFive 2
Thread-Index: AQHZJEs2/69byV6q60qz9odnDfnRWq6V2l8AgAD5KdD//+qOgIAAhumw
Date: Tue, 10 Jan 2023 07:41:26 +0000
Message-ID: <572dca7419a64ac99f1f2103ef5fbbf8@EXMBX168.cuchost.com>
References: <20230109165249.110279-1-jiajie.ho@starfivetech.com>
 <20230109165249.110279-4-jiajie.ho@starfivetech.com> <Y7xWtFZO/Y7GaYRQ@spud>
 <31f6c05b2836450d86560c3efda4abf2@EXMBX168.cuchost.com>
 <50178BB5-4698-4A52-AD89-7235C3802411@kernel.org>
In-Reply-To: <50178BB5-4698-4A52-AD89-7235C3802411@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.190.108.220]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230109_234203_275772_A38BD3E1 
X-CRM114-Status: GOOD (  17.86  )
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



> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: 10 January, 2023 3:37 PM
> To: JiaJie Ho <jiajie.ho@starfivetech.com>
> Cc: Olivia Mackall <olivia@selenic.com>; Herbert Xu
> <herbert@gondor.apana.org.au>; Rob Herring <robh+dt@kernel.org>;
> Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>; Emil Renner
> Berthing <kernel@esmil.dk>; Conor Dooley <conor.dooley@microchip.com>;
> linux-crypto@vger.kernel.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-riscv@lists.infradead.org
> Subject: RE: [PATCH v3 3/3] riscv: dts: starfive: Add TRNG node for VisionFive
> 2
> 
> >> Which clock source is this? I see syscrg and aoncrg in the v3
> >> devicetree:
> >> https://lore.kernel.org/linux-riscv/20221220011247.35560-7-
> >> hal.feng@starfivetech.com/
> >>
> >> Have a missed a patchset which adds support for this particular clock
> >> controller? At the very least, I don't think one has reached the
> >> linux-riscv mailing list.
> >> The clock driver patchset only has aoncrg & syscrg:
> >> https://lore.kernel.org/linux-riscv/20221220005054.34518-1-
> >> hal.feng@starfivetech.com/
> >>
> >
> >Hi Conor,
> >
> >Thanks for reviewing the patches.
> >Yes, the patch for stg domain hasn't been submitted yet.
> >In this case should I drop this patch from the series until the related patches
> reach the mailing list?
> 
> Since it doesn't apply anyway, no harm keeping it IMO.
> Having the dts can make it easier, although not in this case, to look at the
> binding and driver.
> Just mention it in the cover letter if/when you send another version.
> 

Sure, I'll do this.

Thanks,
Jia Jie
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
