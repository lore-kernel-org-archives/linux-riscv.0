Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635B3E7D0B0
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 21:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1Nk8Uo7UL9zsNyh/pCRDD5KuvNzvMsB7q8MXXcZGhU=; b=aPz3+aqz9TKA72
	Bd0AZH4rk7PSpthgxDjpE58i+JKCD8OLZhcMd2mPg0rHg+OOH7u3D36WdWFfpNE4cF5dIsHNwubDj
	fP2HnaoUeXTaJy/SUZ1Bdb8qeOYBwuFCyEYvUjomj/aZkeBmbUn1ER5XkZnkFvmu8EAzoke1QH82a
	2eB/Pf1NuLTIV4JR83AA5r2yoaVcNBYgW7u+iKz+KD5YYyRVRxH3i+DcqHADaG8PGXZH0RQxLVeff
	/CwyugmK7YZevtmpxyix2B4VoLeHZnP/0sSZioEJptqlgT55653uCXImbcrd90xCpM6akuA1cXE9T
	mjXIqsnNEuTkAQEcEUvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRZy-007Ebw-2h;
	Thu, 21 Sep 2023 21:51:22 +0000
Received: from out-212.mta0.migadu.com ([91.218.175.212])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRZw-007EZe-05
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 21:51:21 +0000
Date: Fri, 22 Sep 2023 07:35:19 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1695333070;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QqdCzsBT+posAOrgjqZp1RU0wbImVm1bMLt0YyYT58w=;
	b=jvHndayovKeUtX9KhNDnrwvpHYFAY3TGK25k0jym2yigvLtNswLLxKT6Iy0gnikZPeX0Ea
	9E+iGa5XeByTvqs/zPZqR1u20L7keWeogvvrl433gR3hgExeYnV91T9Q1Wb9KDJ4Ic91lH
	DRkHzMDCMUsHvHVQlZao+wq6tDL5sqbHKJOX/eVy2cbLpLzp/p7RhaKUdDs63DArSV80Nc
	/0UlofEZsEnKUE79VvJQDZOheJCmXNIeKvtMomamt0kJgN1KUChQ1Cxln1n7tKHWhQb3o5
	kUdDzQD+B+oIiLbouzSjs/cLjOvw7xVyOynXPFGXyMx4hAB2VRXRIh8v5sZTtg==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <ZQy3F_VtOL3XWcl0@titan>
References: <20230824114038.891493-1-privatesub2@gmail.com>
 <ZPfn-0OAL7-3DCmt@titan>
 <20230921212736.nw6ctlimtrxfksbu@pengutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230921212736.nw6ctlimtrxfksbu@pengutronix.de>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_145120_225456_6B0FB099 
X-CRM114-Status: GOOD (  20.64  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Sep 21, 2023 at 11:27:36PM +0200, Uwe Kleine-K=F6nig wrote:
> Hi John,
> =

> On Wed, Sep 06, 2023 at 12:46:19PM +1000, John Watts wrote:
> > On Thu, Aug 24, 2023 at 02:40:24PM +0300, Aleksandr Shubin wrote:
> > > This series adds support for PWM controller on new
> > > Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> > > provides basic functionality for control PWM channels.
> > =

> > I have tested this patch and earlier versions successfully on a Mango P=
i MQ
> > Dual and verified it outputs a PWM signal.
> =

> If you want that documented, the usual thing to do is to include a
> Tested-by: tag in your reply.

That's a good idea! I'll take a closer look under a scope and against the d=
ata
sheet and give another tested-by then when I can. I'm not sure how close th=
at
gets to a reviewed-by but I don't have the experience in driver development=
 to
know if something is off in the design.

> =

> Best regards
> Uwe

John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
