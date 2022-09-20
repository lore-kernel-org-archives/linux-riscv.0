Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F9DC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 19:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3rMNJn6Wb2LO8cbQe/TG7zq62qbR08ePcNOCwurfK2Q=; b=2gmbS8yv6d30Ei
	KJsNrReTJ7y9Bkgckk+9VmwmDb8YCOJ3OESHgiyk+VO2kk7B5FQ4d6dEDaZ7DdEKgUGNmXbq5iwUe
	/Yp1mSWcN4+7hc6NkzCeS80iYgx0hIk+q5esO9q5+wk0oSIrkerqY/FrQuPu9GaGY3AWeYtybu7id
	76SGcDr9fFmxb+ao84JdErSAbZ+PLNtk5h7nXWnyVZqEafhiRmSNKgZU/04bjY7HQx4Yk3S+DLZn9
	s/NSEqTjnq6ka4A/IiHZ+P67cfKEbsqEXyrBMewODnnxponjrNej2c5a6ZGgmraiIxwNcF5OxwaAO
	CXYQBILesSzYwL2uYeTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaj4N-0064c3-T5; Tue, 20 Sep 2022 19:38:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaj4K-0064aX-Fw
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 19:38:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C2F06B82CB1;
	Tue, 20 Sep 2022 19:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D102CC433D6;
	Tue, 20 Sep 2022 19:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663702684;
	bh=/9VjVxNPbgZ64WNFIuwFPPUYvGwnqRTbDbRVQI10Yw8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OZrmOUuSS8sNPVz7/Y+8G/MvWPOwGM/X56t3qbH18Ka9HpWaCzGZNQCAm2lndXvWJ
	 ZG6rSowN5Qjqfi6U4h+FUqUcf4ka43xjmMsBs9+rMasvE2SOkwwrzr66hDfgnDeecl
	 GX16T++1ajOHK2vQcD/P4BGq0pQ8JL7Pbfa/PjhiR2zo8ddBz7v/dVKwGJh3vbYOG9
	 tnD9G3rQO5psWX82xDq2qagKzWzSCll1B+hs5vDUUgQYIjIAVdQk+cQtFqKWgEKEpc
	 dFxIgUhHoHOvpf5ciHQc48NRArq7KVGml2ivTlYiSpFtZlKT8vsQP/IWk/1PyAIZGm
	 xOKVF9legaZ9Q==
Date: Tue, 20 Sep 2022 20:37:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Prabhakar <prabhakar.csengg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Atish Patra <atishp@rivosinc.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v4 00/10] Add support for Renesas RZ/Five SoC
Message-ID: <YyoWlSQPWVnkaU+T@spud>
References: <20220920184904.90495-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <YyoSgGlkIB8GMog8@spud>
 <CAMuHMdXfkX-AOusfOn-6fmaJavWWoD1mW8QNqUCUdkHuz=3FsA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMuHMdXfkX-AOusfOn-6fmaJavWWoD1mW8QNqUCUdkHuz=3FsA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_123808_854849_35BD4700 
X-CRM114-Status: GOOD (  27.64  )
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

On Tue, Sep 20, 2022 at 09:24:05PM +0200, Geert Uytterhoeven wrote:
> Hi Conor,
> 
> On Tue, Sep 20, 2022 at 9:20 PM Conor Dooley <conor@kernel.org> wrote:
> > On Tue, Sep 20, 2022 at 07:48:54PM +0100, Prabhakar wrote:
> > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > The RZ/Five microprocessor includes a RISC-V CPU Core (AX45MP Single)
> > > 1.0 GHz, 16-bit DDR3L/DDR4 interface. And it also has many interfaces such
> > > as Gbit-Ether, CAN, and USB 2.0, making it ideal for applications such as
> > > entry-class social infrastructure gateway control and industrial gateway
> > > control.
> > >
> > > This patch series adds initial SoC DTSi support for Renesas RZ/Five
> > > (R9A07G043) SoC and updates the bindings for the same. Below is the list
> > > of IP blocks added in the initial SoC DTSI which can be used to boot via
> > > initramfs on RZ/Five SMARC EVK:
> > > - AX45MP CPU
> > > - CPG
> > > - PINCTRL
> > > - PLIC
> > > - SCIF0
> > > - SYSC
> >
> > Ran into one complaint from dtbs_check:
> > arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: usb-phy@11c50200: '#phy-cells' is a required property
> >         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/phy/phy-provider.yaml
> > arch/riscv/boot/dts/renesas/r9a07g043f01-smarc.dtb: usb-phy@11c70200: '#phy-cells' is a required property
> >         From schema: /home/conor/.local/lib/python3.10/site-packages/dtschema/schemas/phy/phy-provider.yaml
> >
> > Other than that which should be a trivial fix the whole lot looks good
> > to me...
> 
> That's due to the placeholders...

Right, but #phy-cells will be added into the usb-phys once you (plural)
figure out how to integrate with the existing CMO stuff?

> Currently it is not yet a requirement that "make dtbs_check" is warning-free.

I was really hoping that it could be a requirement for 6.1 onwards. I've
managed to clear all of the other ones from arch/riscv.

> I'm wondering how we have to handle new SoCs with existing boards in
> the future. Probably just more properties in the placeholders...

New SoCs to existing boards is less of a problem then new CPUs to
existing SoCs from what I can see...
I know we just discussed it earlier today, but is it possible to make
these particular placeholders more complete so that dtbs_check shuts up
about them?

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
