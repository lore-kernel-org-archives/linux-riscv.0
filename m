Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EF43D1489E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 06:06:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z9TXic3EuHwyorgZdTQUJi+1IrRcDZ3Hi1BAvwe5MGg=; b=YyxtaD86MgbaQT
	Gd3N/o+ynzuXOfe+PEDBnRCGRBJFcwlnhtCybdmneyVUxP09Pgirp6heBncDSl01KKFNIZUgmBxK4
	OkwaFdN7UTbLZduJTyNq5ifHFQ7QyKeUAbSOy+hgMgHiaCAMLrvkAOiLho41uK05WCqMPRfYa1N6E
	cRh8YkwqFyEi9Uy6k7xt5qJnju/kEgI90ip9S2JIUPKMuIShNlKJKv5o3ToWd4g7lrXRllWjj17+y
	L+d0OTT0epMDYflgFoJmaHoSGBSREOW8X65J2we3O8rXtJhQZgOW7vPmh+MrntY/SZDelv06YM+TS
	GpZI+i1hRfHtBklSKGSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjAK-0000000FyUK-0cGF;
	Thu, 08 Jan 2026 06:06:36 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdjAH-0000000FyPN-1ayS
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 06:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1767852370;
	bh=j0RQPNNJah66+rfz5mRIL/zR77AlQ7tUXDwKwV5J7t8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version;
	b=vKxWQBP0nZhb82Z1SoTqY3j0ocfBnhZndtL2O+hfjv75fAwIaqcdBQ9Y5GC8pxw3w
	 LHkWTP/vh09WDOLbYVq+VuaeVumFbi9Sln5GRf03IHnfJrNfa953oVg3WvK3eB0vjq
	 mW9n6/oSjsIztl3nnQSNFlpuFYb4sGHV+jYdEOas=
X-QQ-mid: zesmtpgz4t1767852369tcd8001f2
X-QQ-Originating-IP: beWczbJwO/mTqfpOHrU+Qy/PUKSpkmuOz7CV2yJE0rM=
Received: from = ( [120.239.196.107])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 08 Jan 2026 14:06:07 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9103380488815538489
EX-QQ-RecipientCnt: 16
Date: Thu, 8 Jan 2026 14:06:07 +0800
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Yixun Lan <dlan@gentoo.org>, Krzysztof Kozlowski <krzk@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Linus Walleij <linusw@kernel.org>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 2/2] pinctrl: spacemit: support I/O power domain
 configuration
Message-ID: <2D1901252926D8F1+aV9JT8p0rON5RNc_@kernel.org>
References: <20251223-kx-pinctrl-aib-io-pwr-domain-v1-0-5f1090a487c7@linux.spacemit.com>
 <20251223-kx-pinctrl-aib-io-pwr-domain-v1-2-5f1090a487c7@linux.spacemit.com>
 <20251227-pastel-certain-orca-4b53cf@quoll>
 <20260108042753-GYA2796@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260108042753-GYA2796@gentoo.org>
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NgbPj60qx8q1bjuxTEeAERR7k3tRz1wd46JBJAsBulCSVPZedRL7WOHm
	5eoPazxdnZNaDn9d6aoeWb3LfE/K2ZuhPzMYAFRVRl3BdABLvx5wO50Dz20jg7YBXz68ENn
	iRGVl5Ob7xU5nDWLzia9TupN8PNnQeC7wc5Dvx97qmyOe3YtlIIcGza/te//ehmswJHGx4x
	J+rrlO6bB1QOnzC94iEnbLBzqs3UuC1nMDpyIS+5+m8y9xCqS/bxme3HoQu4IU4nsDy697f
	Lbsa4aZkotxjZNcdBpUFr2eqKs6BQOztGEGyyBtiRWHBs5xQY5Nj8J4Rc0BFZnk81GGYnwJ
	PdSITqEuv4cqqdfwgZK4a39KsvHSlIh72+psTdAsGBYQl/ovch/l1wwyMMYMgkTIcsyFyDg
	GS+AO+A8/nxzSdR1q0aBuJ9hBYUVzejkBgtXSE4Mw4luDbzgZjdEROb0JQlihBCnBPESspR
	kN7e2Yk3h/5DhRx9PN7dbJx862ntTUnByq7RcQsJ0B8m2K02uOdGlnUekYfchy7UwyW55d/
	ukVmJ6PkuVStVfuUBjktRVUJ5xh7LBjl/VX/ECrdE/smLRc/DUDqr4JeWn29/8bc9O0JLVN
	mlV42jnr8cPMA0pJdQ3oUEZtvzXRV1gHh59+LLhuo3QFGImnL84/YWxfv3O97SEATDaHuRC
	w0P7X77zwzj8BZaT6dVjuFHrMZlKMcEBXp61Y0+b4iWYUpt0Fl88v96jzsbILVfURAAzKuB
	7lgnxfTTciKtg3CEcXzoE1jprAscV4m6mlSM55HQnM/eqO0oWrwdFsbPT3pNiMi/xrx9XY0
	Xuz1dOD0/FgymaAevIDfin2esZVQh+72LWNJgIkpKDK/eQ3IbLwpWeKer2fmgL9B5MwzPjC
	C56lGIRndAco5ugdvS5j76pZCANmpDGPRCK7iUGqIIagxLLnVb4DEVm2qzDDU5AhhaPvQMq
	G8ODgKBrgQHqY4EsPdj3aFaHQWiGG6PCdeedmVXLH84hFGWjGQK2ceELfrLfE2eZ7HBB6ec
	kSzh/DgBJRMrb0Gfx2/U5wE85CTlNMcLXKLd2Kg50yaTFt1IJujNzsw3G2xTSJcyddgOP3F
	tXH1drmq5i/jcOpSoCnk4+m9zDwALF7V6DQsn50fA4cMXvbPdDp8+3JFWoV5npRL4wAuOpz
	hqeHO955dnG8hePPW/4jrS20OA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_220633_849844_9724D9F2 
X-CRM114-Status: GOOD (  17.39  )
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

On Thu, Jan 08, 2026 at 12:27:53PM +0800, Yixun Lan wrote:
> Hi Troy, Krzysztof, 
> 
> On 14:00 Sat 27 Dec     , Krzysztof Kozlowski wrote:
> > On Tue, Dec 23, 2025 at 05:11:12PM +0800, Troy Mitchell wrote:
> > > IO domain power control registers are used to configure the operating
> > > voltage of dual-voltage GPIO banks. By default, these registers are
> > > configured for 3.3V operation. As a result, even when a GPIO bank is
> > > externally supplied with 1.8V, the internal logic continues to
> > > operate in the 3.3V domain, which may lead to functional failures.
> > > 
> ..
> > > +	pctrl->io_pd_reg = devm_platform_ioremap_resource(pdev, 1);
> > > +	if (IS_ERR(pctrl->io_pd_reg))
> > > +		return PTR_ERR(pctrl->io_pd_reg);
> > > +
> > > +	pctrl->regmap_apbc =
> > > +		syscon_regmap_lookup_by_phandle_args(np, "spacemit,apbc", 1,
> > > +						     &pctrl->regmap_apbc_offset);
> > > +
> > > +	if (IS_ERR(pctrl->regmap_apbc))
> > > +		return dev_err_probe(dev, PTR_ERR(pctrl->regmap_apbc),
> > > +				     "failed to get syscon\n");
> > 
> > Actual ABI break.
> > 
> Indeed, there will be a ABI break.
> 
> so, how about not abort in probe() if no "spacemit,apbc" phandle found?
> and then do it in a compatible way as old behevior
will in the next version.
> 
> We may still need to drop this property from "required" section in DT
Yes. Thanks!

                          - Troy
> 
> > Best regards,
> > Krzysztof
> > 
> > 
> 
> -- 
> Yixun Lan (dlan)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
