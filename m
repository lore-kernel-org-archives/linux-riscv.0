Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57F6CD342C
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 00:42:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H2eBL9fQ2zUccEX3NPNjRJ9cXsb/5dhAFYsTtKbPb4I=; b=hLq2TkapOV8bHV
	/6CCY9Yj3eZpInhUGn35KdE1PliLBt7S7Qvi0WAo1yFAh2VMtXpdeYsoE0n9+OxaGg9RBqTbev4Gi
	y8L3w3bz6tTzON3MbYts9b5nhtIZGQnUQ115mONQnD4tfBnC+KZhVslqjxRDKps7M4tqdQFh+Gjni
	oM+cHvIcRDFyvkUNyOkcG0XfgC5kAOmVjEG4v8me5HD77TOWTzt1kLjpEEhlu9LuYF5OIH56kIV8Z
	pVG77uMSe35lLgMsWhWx39aHK4XBT+l7zw1sUwl2pL4ursEOceSPkJgEhUxziTtNwUI68rbS6pn+u
	n5jLeLuD0NZnYf5uZi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKmoF-00000002MwT-0WB5;
	Thu, 07 May 2026 00:41:47 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKmoE-00000002Mw5-2VZP
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 00:41:46 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso82796a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 May 2026 17:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778114505; x=1778719305; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hZ5LFFAZbhjlqv4fN6kLXFN2tALXchu13wJuFe3wZrI=;
        b=mpzKPD1YuRmyhhAkZ0xbmYhGt5exiwwe9ier9FEuzy2OnNNSfBaqBW03Qn6BBJjZq/
         VBXmR3SvWrqLFw/Z+hKYgatJTymZkMogYKCDq+yzbU3AmaerGJaoVv4s8tSa84XaDirZ
         Fdwomm+JKDF/6YPPbmCFEY8p34moNT+YcgXaAdeueXh/7erCXTQnEVRjAKuJwVdFaIci
         m3gDMx59J9XYJ/WeapKHl/sbgpvNhbQ+rabWfdQXBx/e1dQtCcc5J5bQOzfz1AFGVWvz
         f4IudAYXMan5NIOkVv+zb6FQoA7wAltnK0Js6Q0ySb2lx0veO3lJRkFERQ+ytc/Rwogj
         AoiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778114505; x=1778719305;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZ5LFFAZbhjlqv4fN6kLXFN2tALXchu13wJuFe3wZrI=;
        b=m6mLET8PyeM9CD1vl55QrNuXn/BIKlUPSKDjv/9tSMrUUtV/qcBs3BAbQmJZL5gIK/
         fS7Im+DOnL1Qj3dfCe72ZWeVCNsnNJZyvgq8n50IeThw5CcLnsPX8b3ry3Upx5AmixXd
         VdfRieYqwnOv3G5O0KOSwlwGZxbAZjk+ZoT2fWT1pb0ACvgp5tAlgg0EwikyHoINWYsq
         nAB1jPCxSQwbSVOfAZK5apSXldDwU++vkkSsv9JfNSO2+J3vgBOdYMekhEIg6gVgdIm2
         JZ/LKVcfINtVDge93sC/kq3bSnRUVD0B4YD8IuO0C+IQyHKSnDPulnLSKWqkJ90xhTGF
         MSPA==
X-Forwarded-Encrypted: i=1; AFNElJ/y4k1AKMMRjRU00P+NwG+SUstdFKiyqSInrsMWI3nmF5+B7yqglG9qH1+W1pORFuGg2KOf7MAhBYnRDw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyLMrp7F1Asd2FQp+LO/jZBQtKtrjuoID+HJppxmUbqSIe7sCv/
	GhkwupeBpcz6FIf6tnpn5Otk00cVobfmSJyj1ZKFSsVI/M0RUAq2LzyB
X-Gm-Gg: AeBDiet70jDuiLkzWqiXdLbHp1Uc795JQNiuTOnH77TISuNQl/2cL+QHib9goWqlNeL
	wuYwNDm4z3Ma10C8gYKqiSE8v4DqcOhSGOZd+xxiUkdXjxpuE6mhoqdp1x2xYWLyQ4J+kz8zkRa
	Y1QgK9l/78E5sX1FLj2XhUKRqLOs+eIM5LPImyneCZCvFEjeRskSjtrLEnuxEwi7OtWuzR5Ndyk
	3rs71IjaFD73RjP8vdCz0A6tuhi7bbcxZh9I3a+Ofe3Yg91/09U0xKtfUXLH8ztkStIUeV0sAOv
	gYJLjpqa0xJr4wJpF+TsG5PzDHe3hBfkCHuSrOI5E0zwiZNlKADkXkdzYUSKqvzCBHIpQKtHCmS
	vKCIa+/FF0tk83apb52iG5fGqqAiGmAi6LhF8/6j0o3zOGO5UZPDj5KGFnBepqAUGF5QCf/oo1T
	+90im71y2ZPS7twrHSM421fJUV1hwmof86qA==
X-Received: by 2002:a05:6a20:431e:b0:3a8:284c:fa3b with SMTP id adf61e73a8af0-3aa5ac98bc1mr5493704637.48.1778114501965;
        Wed, 06 May 2026 17:41:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8253582a60sm370848a12.1.2026.05.06.17.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 17:41:41 -0700 (PDT)
Date: Thu, 7 May 2026 08:41:23 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Lukas Wunner <lukas@wunner.de>, 
	Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Han Gao <gaohan@iscas.ac.cn>, 
	Bjorn Helgaas <bhelgaas@google.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Kees Cook <kees@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, linux-pci@vger.kernel.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, Yao Zi <me@ziyao.cc>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on
 Sophgo SG2042
Message-ID: <afveQQI-CsQ2L1-N@inochi.infowork>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
 <20260331175658.1015829-3-gaohan@iscas.ac.cn>
 <q6wmn67lzk5c2pgmgkoezcvy3xj3yqecg675gx7xyrw3amjwpi@5pjla6j3krbv>
 <0f42afefd9322779af5463b696c55b08d2296ea8.camel@iscas.ac.cn>
 <afZUxYhkCQ0wG0Uu@wunner.de>
 <68d4a49bf1df785ae906fbc2dd16e64b667ca5f0.camel@iscas.ac.cn>
 <afcMtlBJYeuxSqZr@wunner.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <afcMtlBJYeuxSqZr@wunner.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_174146_646627_DDFF3BEC 
X-CRM114-Status: GOOD (  25.46  )
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

On Sun, May 03, 2026 at 10:52:06AM +0200, Lukas Wunner wrote:
> On Sun, May 03, 2026 at 03:10:58PM +0800, Icenowy Zheng wrote:
> > It's used in multiple products, but only one of them (EVBv1, which is
> > just an early EVB available for a few people including me) lacks an
> > onboard switch, because SG2042 is short on on-chip peripherals. All
> > other devices (including two mainlined ones, EVBv2 and Milk-V Pioneer,
> > and unmainlined dual socket rack servers; Milk-V Pioneer should be the
> > most popular device because it was on shelf) have an onboard switch to
> > mitigate the lack of on-chip peripherals in SG2042.
> 
> Who knows, maybe someone will design a product which doesn't attach
> a PCIe switch to the SoC, maybe the lack of peripherals isn't a
> problem for them.
> 
> It seems reasonable to accommodate such non-switch use cases as well,
> so I think you definitely do not want to quirk all products using that
> SoC but only those that need it, regardless whether it's the majority.
> 

I think it is possible to quirk all the SG2042 products, because the
typical usage already shows MSI shortage (And this is why SG2044 has
512 MSIs). Although it may left some MSIs in the test case, MSI shortage
is a common issue in a real scenario. And the Sophgo already maintains
a whitelist to limit the MSI usage of most devices in their vendor
kernel. So I think it is fine to quirk all the products that use SG2042.

Regards,
Inochi

> > > My point is, you want to constrain this to a specific product, not to
> > > the SoC.  Can you maybe solve this by not specifying interrupts in
> > > the devicetree for the PCIe switch?
> > 
> > The PCIe switches are not described in the device tree at all, because
> > they're all just discoverable; can we describe them in the DT and
> > redirect their interrupts to void?
> 
> Yes, somebody did a writeup how to represent switches and endpoints
> in the devicetree:
> 
> https://farlepet.github.io/linux/2024/02/20/using-linux-device-tree-with-pcie-devices.html
> 
> And then I would try providing an empty "interrupts" property for
> those switch ports for which you want to avoid port services being
> instantiated.
> 
> That way you could selectively *enable* port services for specific
> ports where it's useful.  Let's say you need DPC on a specific port
> to contain errors of an attached NVMe drive.  Just assign a single
> MSI for that port and assign no MSIs for all the others.  Much more
> flexible than globally disabling port services.
> 
> Thanks,
> 
> Lukas

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
