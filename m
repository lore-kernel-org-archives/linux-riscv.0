Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D019E77170
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 20:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3xzfwThrVslWoqdZKNK7UkHiZeASPoJk0sZpNL9h7gc=; b=bZzhP+PF1rGsGv
	ePEUs6FWwzszI+gUS8vB2NRbPN5ToSYNyFHu6VAAnvMOGD6nFZAbeCkjQGQNbkgU/5JHUOoZdr3G5
	4gri6uUG0Lipz90FLHQDUx4Zq04C25KJKQIlNfC4ASYm/Ow/ClnXARZFcWK5DQTP1zjwqfR5wZnK2
	viLfEjJqY4dyrAxLGUx/upcC3vYp/P4J6btrNrj+3uauUQGY2SqBczoT9pi/4mUc1K1nmGbGp2TZG
	5S4MigOFBVHq/Y2atN1P5W564/pGzA3Nx9icH83CKbkPeLgEbR8Xdd4TSLq0u49UM6ekbEcwn2iJ7
	d7Vw3jEanYludtHf5h6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvs6-0000000Dn4d-0Ige;
	Wed, 04 Dec 2024 20:21:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIvs3-0000000Dn41-2bs7
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 20:21:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 941C85C6F92;
	Wed,  4 Dec 2024 20:20:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3121C4CED1;
	Wed,  4 Dec 2024 20:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733343674;
	bh=Fvm8TjgK6dJo9sv6O3H2+X+LOIwV0o7fADFI/iSpstQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=M2cEbKOwrwNXj/0EW5nPs7opxCoG9ZxUJ6pP+Ao0yOfCpW+0b/QRhU8GIo5XzO2/W
	 9giaByRFWJLRCKWF+ueHmf5tSkYX+aLu1kM497LHq/lAmlcprxdbRz5hpOO0tGip7o
	 96tH3N7Uk9Ysb3154VA1c0Sz7UAO6ShuCbkTz2qrRdU5IdGIsjWk0uV/X9m4N/QUDY
	 DlI2mpNybcduhZDH6L0P2JeKABEKKCjy1VKIaDs9fIzq/2Jb8T0cjjvf3UY00zfjHo
	 KaXAy0e0iK83A/Sj08R7/R/wbpxfrgce6lLjgfTH0BIwk+1sHHR13uWFBKMtJUZ3nj
	 EdkVwnlbvWKAg==
Message-ID: <1b05b11b2a8287c0ff4b6bdd079988c7.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
References: <20241203134137.2114847-1-m.wilczynski@samsung.com> <CGME20241203134155eucas1p1e90c71c4f8eb5da41d2cc8a500f54dc7@eucas1p1.samsung.com> <20241203134137.2114847-6-m.wilczynski@samsung.com> <f21ffd12-167b-4d10-9017-33041ec322b0@kernel.org> <07bfb02a-1df3-4a03-83bb-d7edc540739d@samsung.com>
Subject: Re: [RFC PATCH v1 05/14] dt-bindings: clock: thead,th1520: Add support for Video Output subsystem
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org
To: Krzysztof Kozlowski <krzk@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, airlied@gmail.com, aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, frank.binns@imgtec.com, guoren@kernel.org, jassisinghbrar@gmail.com, jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, maarten.lankhorst@linux.intel.com, matt.coster@imgtec.com, mripard@kernel.org, mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, simona@ffwll.ch, tzimmermann@suse.de, ulf.hansson@linaro.org, wefu@redhat.com
Date: Wed, 04 Dec 2024 12:21:11 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_122115_746618_F5BC4771 
X-CRM114-Status: GOOD (  16.61  )
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

Quoting Michal Wilczynski (2024-12-04 02:11:26)
> On 12/3/24 16:45, Krzysztof Kozlowski wrote:
> > On 03/12/2024 14:41, Michal Wilczynski wrote:
> 
> [1] - https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20Video%20Image%20Processing%20User%20Manual.pdf
> > 
> >> +      these registers reside in the same address space, access to
> >> +      them is coordinated through a shared syscon regmap provided by
> >> +      the specified syscon node.
> > 
> > Drop last sentence. syscon regmap is a Linux term, not hardware one.
> > 
> > Anyway, this needs to be constrained per variant.
> > 
> >> +
> >>    "#clock-cells":
> >>      const: 1
> >>      description:
> >> @@ -36,8 +51,6 @@ properties:
> >>  
> >>  required:
> >>    - compatible
> >> -  - reg
> > 
> > No, that's a clear NAK. You claim you have no address space but in the
> > same time you have address space via regmap.
> 
> I see your concern. The VOSYS subsystem's address space includes
> registers for various components, such as clock gates and reset
> controls, which are scattered throughout the address space as specified
> in the manual 4.4.1 [2]. Initially, I attempted to use a shared syscon
> regmap for access, but I realize this might not be the best approach.
> 
> To address this, I'll specify the 'reg' property in each node to define
> the address ranges explicitly fragmenting the address space for the VOSYS
> manually.
> 
> vosys_clk: clock-controller@ffef528050 {
>         compatible = "thead,th1520-clk-vo";
>         reg = <0xff 0xef528050 0x0 0x8>;
>         #clock-cells = <1>;
> };
> 
> pd: power-domain@ffef528000 {
>         compatible = "thead,th1520-pd";
>         reg = <0xff 0xef528000 0x0 0x8>;
>         #power-domain-cells = <1>;
> };

You should have one node:

    clock-controller@ffef528000 {
      compatible = "thead,th1520-vo";
      reg = <0xff 0xef528050 0x0 0x1a04>;
      #clock-cells = <1>;
      #power-domain-cells = <1>;
    };

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
