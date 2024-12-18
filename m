Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0377EE77183
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 07:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H6uXQyX/CK8uUgRAMaQVR+paGLfA5oiKUCtroChwY+o=; b=NwX+VS+QObHSk9
	4lhJSpVuLdOrGN7Sii6xo8YOqBk4sxFXv5jBg2OZsZs4hEfLPwsxAl4IrhhREJeRtyhp/DGylP79e
	UpKJ8pdtob/GoOJ9ekwhXPhH/OPh2Jo+jTc51fl1OVHobUUcp5W3RH1CIf/54Qgakm6Hgg6iofEqc
	npbKdVJWPcQ9Y1wOu9v+OWQKpXxTmTMBRBUeHGBxmseLSWiC32V49pUgvZB4SQZtydMAGQz0Kco9R
	Oc8rhsq0+/+bnDoLw/0Z545lKzwhqvCTTG3ocIqNM/kl9LE/opPyt8aYy1Hj5NpYjvCLt5O1nVHVZ
	G5KYhm3uBVLGIFfI0TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNoWt-0000000FpDz-0BIi;
	Wed, 18 Dec 2024 07:31:35 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNoWq-0000000FpDV-2DRq
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 07:31:33 +0000
Date: Wed, 18 Dec 2024 15:31:26 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Haylen Chu <heylenay@4d2.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 0/3] Add clock controller support for Spacemit K1
Message-ID: <20241218073126-GYB3467167@gentoo>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_233132_586840_FA3B8D8D 
X-CRM114-Status: GOOD (  12.30  )
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

On 03:54 Wed 04 Dec     , Emil Renner Berthing wrote:
> Haylen Chu wrote:
> > The clock tree of Spacemit K1 is managed by several independent
> > controllers in different SoC parts. In this series, all clock hardwares
> > in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
> > driver, CPU cores and UARTs could be brought up (see below). More clocks
> > will be implemented later soon.
> >
> > No device tree changes are included since Spacemit K1 UART needs two
> > clocks to operate, but for now the driver gets only one. I would like to
> > defer the changes until this is resolved.
> 
> Hi,
> 
> Do you have a git tree with these dt changes though? It's impossible to test
> this patchset without them.
> 
> /Emil

I'd suggest to include the dts part patch when sending next version..

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
