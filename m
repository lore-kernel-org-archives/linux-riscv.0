Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83461EE57CE
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Dec 2025 02:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxKQmwbRSUr6mr2MFFY1S306VeNOrq5rP6xCItysnTk=; b=vwCBjHz3MlR4iQ
	7PCWC2wb5y49FneuscREmfGg75+Abgb5BauOl4ASWaJ++zqzp97gfQxWpGMLmLOuQ0qiH0DIf9VSy
	RSt1NK1302aTA2yl69jKvaC0JjoI9z/h2EN7/g0UJePw3xxZM1I7lvuyT13DeagS775FboeoM7qpt
	bzaz/DvBzqB7ZHXkdwzi86DsqGzJ2ODONR9eiB3SlgUH5HMopUE1mkFQSSlc9KRv5VOhxk0O8vq6n
	suUlm79mHtB/9Vv5kGvArkT+stdw8ZgYMFymhGAkLP6IImjkrG7WrIF6CiTJ19X2VNTdyaI2fqHAF
	v8HCXLTejVqowHW6dGlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valh8-00000005Z10-3WYH;
	Wed, 31 Dec 2025 02:12:14 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1valh6-00000005Z0U-3TJy
	for linux-riscv@lists.infradead.org;
	Wed, 31 Dec 2025 02:12:14 +0000
Received: from localhost (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 94570340D40;
	Wed, 31 Dec 2025 02:12:09 +0000 (UTC)
Date: Wed, 31 Dec 2025 10:12:05 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Yao Zi <me@ziyao.cc>
Cc: Alex Elder <elder@riscstar.com>, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guodong Xu <guodong@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2 2/3] clk: spacemit: extract common ccu functions
Message-ID: <20251231021205-GYB2019108@gentoo.org>
References: <20251226-06-k1-clk-common-v2-0-28b59418b4df@gentoo.org>
 <20251226-06-k1-clk-common-v2-2-28b59418b4df@gentoo.org>
 <3ea5b28b-a0ed-49fb-a8a8-6f575a24820d@riscstar.com>
 <aVNOYuC0-lcymn-P@pie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aVNOYuC0-lcymn-P@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251230_181212_890114_C5A1EC53 
X-CRM114-Status: GOOD (  19.94  )
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

Hi Alex, Yao,

On 04:00 Tue 30 Dec     , Yao Zi wrote:
> On Mon, Dec 29, 2025 at 06:50:14PM -0600, Alex Elder wrote:
> > On 12/26/25 12:55 AM, Yixun Lan wrote:
> > > Refactor the probe function of SpacemiT's clock, and extract a common ccu
> > > file, so new clock driver added in the future can share the same code,
> > > which would lower the burden of maintenance. Since this commit changes the
> > > module name where the auxiliary device registered, the auxiliary device id
> > > need to be adjusted. Idea of the patch is come from review of K3 clock
> > > driver, please refer this disucssion [1].
> > 
> > I understand the point here, and it's just like the first patch:
> > you're extracting generic code out of the K1-specific file so a
> > new K3-specific source file can use it too.  This is really good.
> > 
> > However the end result should incorporate *only* generic code
> > in the generic file, and have the SoC-specific source files
> > contain everything else.
> > 
> > But as you have it now, the (new) generic probe function
> > contains special handling for "spacemit,k1-pll", and that's
> > not generic.
> > 
> > So I suggest you still implement k1_ccu_probe() (and k3_ccu_probe())
> > separately, allowing each of them to do platform-specific things
> > before (and/or after) calling the generic probe function.
> 
> I've raised similar concerns in the series for K3 clock tree[1].
> 
> Regards,
> Yao Zi
> 
> [1]: https://lore.kernel.org/all/aU50DIe9qMneb0GT@pie/
> 

Ok, since both of you raise this, I will do it in next version
thanks

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
