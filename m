Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC1BDE77187
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2024 10:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XeRnxytJGwXVRVRiHRiF0PYeYFLWUf4XOz5K5X/xeBs=; b=3dCc89xRkbxM6V
	uQIRnzpTNGbCufHr4DkFKWR5i3zUNdGdx/YAU8Pjs6Rff04JnNDXwKKTOWVQ4reHi2V13TvSm1s4t
	rYjQla8NETIrVrr3dJ7uP/XV/mJLzWI3X1v265lDtHf189l1lh2iHglt9B95ZAD3UuTEDGFngvXsY
	Ealb9cLEG7QkBqcNhG0XGTQq9ioJfL1LmdINvINzlnGSrSTnKebcMj9yf4m3swjxd1mMzoM5y74rI
	whM69JqZi7784TAWQPoRwlEYVbUvjZPCXMn7NH4+v2Dp22hNS9Bgp9kRQZDzYsnoazRXFvGnO4YM/
	Mch63i3Mx3QN7gPrqnZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNrd2-0000000GKBu-3aCP;
	Wed, 18 Dec 2024 10:50:08 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNraJ-0000000GJjY-0444
	for linux-riscv@lists.infradead.org;
	Wed, 18 Dec 2024 10:47:20 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id ADB3C122FE21;
	Wed, 18 Dec 2024 02:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1734518833; bh=oXfPnGRFbEkjozDA407hzOTccmVamTWj4CrAxuE5vOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=yXCprO+zF+z/QopJaV5ZmRrypeu/J2JBFbkHX0d4s9qR5bUe+HqGS27MBidilY+y0
	 ujz59XgbjC7WiX9XhySIhnQ3nbQzlFGMln6AbsbadGuIZur1SWr5p0Krmed0+hySXD
	 86cQjiLHB1vR78Mag1T7PYQSm8gHpwQG1GL43TLT7wo2yjYfAytVTrn6hmDvaMeCnh
	 O7Qj+L0vp1UYxZPOpuztHhWe9gtTpYEniTUzbSg+jfz2E4jBWlpwFmWnIvLxYHKTJQ
	 52yqgQp3OtSRAla595KKvVyjn97XTKUenAffRaqPbCLnT8CeSbA0DQEKENtSMclQpD
	 9VmPtTHBEGTJQ==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XXDRVW_v-VyQ; Wed, 18 Dec 2024 02:47:11 -0800 (PST)
Received: from ketchup (unknown [183.217.82.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 0F10F122FE1A;
	Wed, 18 Dec 2024 02:47:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1734518831; bh=oXfPnGRFbEkjozDA407hzOTccmVamTWj4CrAxuE5vOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3sb6tH8CA4AY8pOYptyxflBrvbIt3zADorq8En3ckxb5UlhLO7Hmg0hXveio0EWE
	 Vhgy/5g6XPQ8qyxpb3o2Gt1AqXQisDelMx1ZMpzSP/y1NBPhHf5b+WeaqMqXaTcS+Y
	 7FGgits8FJLJjBgbLxfqQarAxMiOyamz7PZes8oFOF4MnRXEM4llTqJbvdXHwzGVRR
	 1yQTEazvXYpuVAbvk7CIatKJQBtaPBNaiVJ+YzDTYf4E3ideZqKLu4amHFi4AjF+ug
	 2PicQIpfV3uUr0V6qMEJgeP1nXNx9hsNxfnNy3E0+F2SOkiaaZ9Q/Id221vM0TGXZQ
	 z1P9iU/1JYY5Q==
Date: Wed, 18 Dec 2024 10:46:59 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v3 0/3] Add clock controller support for Spacemit K1
Message-ID: <Z2KoI9IXOKTcwJ-b@ketchup>
References: <20241126143125.9980-2-heylenay@4d2.org>
 <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJM55Z88=jq4brJeDuXF37yAHqQKCCs7L8gVOdHQhjVT7r-eZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_024719_349377_7CFCFFB9 
X-CRM114-Status: GOOD (  13.86  )
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

On Wed, Dec 04, 2024 at 03:54:25AM -0800, Emil Renner Berthing wrote:
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

I'll send the dt changes together in v4, as suggested by Yixun.

Thanks,
Haylen

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
