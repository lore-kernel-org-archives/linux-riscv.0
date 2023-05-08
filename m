Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A599C7EE22
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 17:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tsNzB9qQRnDhz7jqg+vmQgU9XstGXjkBCsXcdENDGVk=; b=RdTrVVGALOiikQ
	AFzXStq9ZfrcmLmKePIw1+RT1yG0pM8IRY+UlQIko4IxZhkUNqFhUbYVzxM4mQkiZJ/qTBBaWbjwY
	JUhVFpcliHYXGqM/ckvNAJzEQHVB7Y+il62iBRqHD5MN5Wy4AIFPxmO8KpfXqbnu8+VPrkvwcFM1q
	sH9+PmHNara7rFpFhIfKNVad9bsMVj+FP+0aclVO+QjKD8LT+ObN5PHw7tob0GkUvlllghyalPNKK
	LvYCQzyh+zcFIKpStWQkHRxPVVplLh/fwI9myBAo+a83kq17FJtrERD30uQyQKcwY+TK2xYxQTycf
	V1Eq9AxlMb41L/Bb3xjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4Md-00121P-0a;
	Mon, 08 May 2023 17:09:31 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw4Ma-0011zO-0S
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 17:09:29 +0000
Received: from ip4d1634d3.dynamic.kabel-deutschland.de ([77.22.52.211] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pw4MT-0006Oq-Gq; Mon, 08 May 2023 19:09:21 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jisheng Zhang <jszhang@kernel.org>, Conor Dooley <conor@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH 3/5] riscv: dts: add initial T-HEAD light SoC device tree
Date: Mon, 08 May 2023 19:09:20 +0200
Message-ID: <2344188.NG923GbCHz@diego>
In-Reply-To: <20230508-unmoved-unvocal-9a6c5fc0c629@spud>
References:  <20230507182304.2934-1-jszhang@kernel.org> <ZFkiotPacIMUghDP@xhacker>
 <20230508-unmoved-unvocal-9a6c5fc0c629@spud>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_100928_175582_72C11DE8 
X-CRM114-Status: GOOD (  24.76  )
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

Am Montag, 8. Mai 2023, 18:44:04 CEST schrieb Conor Dooley:
> On Tue, May 09, 2023 at 12:26:10AM +0800, Jisheng Zhang wrote:
> > On Sun, May 07, 2023 at 10:35:12PM +0100, Conor Dooley wrote:
> > > On Mon, May 08, 2023 at 02:23:02AM +0800, Jisheng Zhang wrote:
> > > 
> > > > +		c910_0: cpu@0 {
> > > > +			compatible = "thead,c910", "riscv";
> > > > +			device_type = "cpu";
> > > > +			riscv,isa = "rv64imafdc";
> > > 
> > > Does this support more than "rv64imafdc"?
> > > I assume there's some _xtheadfoo extensions that it does support,
> > > although I am not sure how we are proceeding with those - Heiko might
> > > have a more nuanced take.
> > > 
> > > > +		reset: reset-sample {
> > > > +			compatible = "thead,reset-sample";
> > > 
> > > What is a "reset-sample"?
> > 
> > This node is only for opensbi. The compatible string is already in
> > opensbi. Do we also need to add dt-binding for it in linux?
> 
> If it's to be included in the kernel's dts, then yes, you do need a
> dt-binding. If you remove it, then you don't :)
> 
> That said, "thead,reset-sample" is a strangely named compatible, so if
> you do keep it it may end up needing a rename!

and you'll need to justify that this describes actual hardware
(dt-maintainers iterate all the time that dt is a hardware description, not
a configuration scheme).

The question also would be if this is part of upstream opensbi at all.


In general though, openSBI does something similar with their perf-counter
description. Describing the mapping and eventids usable in which counter
via a structure passed from u-boot to openSBI.

The difference here is, that openSBI then removes the relevant nodes from
the dt, so that the kernel never sees them [0] .

As you reset-sample seems to fall into a similar category, I guess
it would be better suited in an a foo-u-boot.dtsi ?


[0] https://github.com/riscv-software-src/opensbi/blob/master/lib/utils/fdt/fdt_pmu.c#L42



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
