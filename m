Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE51ED277D9
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 11:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i2AcsqAIpbW43QivhBDmbtRW5tcNactVYtrJf1Gp/v8=; b=N+8cYcwINJk1dn
	CiwlflPvtXDuIcqqsaHp7AcUNrmli9ow7xJTWSWnzDICjrRx3OHlWj7snGZmkFzrGumf53milxZS+
	wnGyxz3Psfg+8/B9e8HStW7EvNA9Ih8hwtx7Ub4r5G1iizOxry6HaZH8Wsn7rvHeMCYpI+B/HQ1qr
	T/Jqcgw9IJWwXkaL25JxO9jSnrachaRuYwRMQTIc4YqAZYPlIDKi/9niEt+qX4TSjvJFrub5AdwQ7
	Rr8VpcfbdGamrCK79Shf9b7B+lynCPzH02wag9vD3KuhCLtqLbzePz2Upn9QiImj1eaaKDPX97Cpo
	gNT8tczP/h2MNhe9WwCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veWmP-00000003Pei-2INR;
	Sat, 10 Jan 2026 11:05:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veWmM-00000003PeI-3awr
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 11:05:12 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id C6D76340C98;
	Sat, 10 Jan 2026 11:05:06 +0000 (UTC)
Date: Sat, 10 Jan 2026 19:05:02 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: Inochi Amaoto <inochiama@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	Yangyu Chen <cyy@cyyself.name>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor@kernel.org>,
	Heinrich Schuchardt <xypron.glpk@gmx.de>,
	Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Andrew Jones <ajones@ventanamicro.com>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, linux-serial@vger.kernel.org
Subject: Re: [PATCH v4 10/11] riscv: dts: spacemit: add initial device tree
 of SpacemiT K3 SoC
Message-ID: <20260110110502-GYB12783@gentoo.org>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
 <20260110-k3-basic-dt-v4-10-d492f3a30ffa@riscstar.com>
 <aWIi9LFdqSF3c-FP@inochi.infowork>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWIi9LFdqSF3c-FP@inochi.infowork>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260110_030510_941666_09286850 
X-CRM114-Status: GOOD (  20.58  )
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

Hi Guodong,

On 18:00 Sat 10 Jan     , Inochi Amaoto wrote:
> On Sat, Jan 10, 2026 at 01:18:22PM +0800, Guodong Xu wrote:
> > SpacemiT K3 is equipped with 8 X100 cores, which are RVA23 compliant.
> > Add nodes of uarts, timer and interrupt-controllers.
> > 
> > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > ---
> > v4: Fix missing blank space after commas in compatible string.
> >     Add m-mode imsic and aplic node.
> >     Reorder properties in simsic, saplic, mimsic, and maplic nodes
> >      to match DTS coding style.
> > v3: Remove "supm" from the riscv,isa-extensions list.
> > v2: Remove aliases from k3.dtsi, they should be in board DTS.
> >     Updated riscv,isa-extensions with new extensions from the extensions.yaml.
> > ---
> >  arch/riscv/boot/dts/spacemit/k3.dtsi | 590 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 590 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > new file mode 100644
> > index 000000000000..a815f85cf5a6
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> > @@ -0,0 +1,590 @@
...
> > +			d-cache-sets = <256>;
> > +			next-level-cache = <&l2_cache0>;
> 
> > +			mmu-type = "riscv,sv39";
> 
> I think this should be riscv,sv48? IIRC K3 supports it.
> 
I would second the idea here, if the underlying hardware support sv48,
there is no reason we should limit it in DTS, DT should reflect the actual
hardware.. if user still prefer to use sv39 for simplicity, a "no4lvl"
command line argument can be passed.. see 
 arch/riscv/mm/init.c +860 -> set_satp_mode()

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
