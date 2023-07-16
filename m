Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39EA9EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 16:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IcONCd0KgI86F5NxV0Hd1qLwqDcpzHjwuLzdOZ66O0g=; b=jhx1bgjRB6vrHg
	AhnIEwe48eUBiRKA6uc11PQibn7cP4TccbKklgFC019hVB8uqyrpLFbnmHjVMlQJ06DIGxk3VlBhL
	7Gp5LDaixmW2RSH2gnH1lsFlbjbcKYJosIr9FojrpjKpb8GIG6oI1Bl/P8wEWyyjX4vBoKcRWAxzH
	cHqbEb5ZWDP7Y2UoI+/AHfTZpYNG19vRqJXojDQ/GPBJnRFlQTiB27ltEBxWL59OPCwaoSjRZNrYd
	rB+DgIT/vWrm6mS9x4KWKqZdJTHfh2rP5JsFu5o9LaF1fjlqdMLiBiqj+MEA4fnHNmCq2pX7mk/th
	rF6rWiXxYRMVJDYipmuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4zu-00D7qI-1j;
	Sun, 16 Jul 2023 16:53:26 +0000
Received: from out-53.mta0.migadu.com ([91.218.175.53])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL4zq-00D7kx-2G
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jul 2023 16:53:25 +0000
Date: Mon, 17 Jul 2023 02:50:44 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
	t=1689526395;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tgi47nB1YHuMk/mfqwFLoSzUQApiiYJAouGt5+iloAs=;
	b=WnZ/73xFQ2KCJ2gdjOaHsIPEaibQl/fT9WyoisdiTJJDRianzEpge4xgk4hVAvCy4SlZKk
	jFlzmWDUIwn6KKON6QoiWuGYfQdbTRXq1MkhkQuhK0hWnuS0nz4YaTkfVhJTWuPvKPDQPY
	71J1zIdCPfif5Obbf9zxLcCOG8C9BzfcsaZyReXaMuOJWr9we+c7kxf0Q56/hwUXRezAP7
	xWcDC8BIM9dvxnN/OxEG9mQCFgh4p6EWpwQJirfy3b4xGNTUdY5B7Ex9VmS4h1yUuOMikN
	4mO/M3fSSX6hF2hQjd2Rcmaadsc6AMLL7zyx6v8lHVj/T4O4jh5Vh147UbfcAQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: John Watts <contact@jookia.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-can@vger.kernel.org, linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 2/4] riscv: dts: allwinner: d1: Add CAN controller nodes
Message-ID: <ZLQf5AYOCT3EQXyC@titan>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-3-contact@jookia.org>
 <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <dd5d7fed-cda1-8ab2-d502-7466def675ac@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_095323_459380_7DBA0FBC 
X-CRM114-Status: GOOD (  20.48  )
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

Hello,

Thanks for spending your time replying to this.

On Sun, Jul 16, 2023 at 06:35:17PM +0200, Krzysztof Kozlowski wrote:
> On 15/07/2023 13:25, Jookia wrote:
> > From: John Watts <contact@jookia.org>
> > 
> > The Allwinner D1, T113 provide two CAN controllers that are variants
> > of the R40 controller.
> > 
> > I have tested support for these controllers on two boards:
> > 
> 
> Please use scripts/get_maintainers.pl to get a list of necessary people
> and lists to CC (and consider --no-git-fallback argument). It might
> happen, that command when run on an older kernel, gives you outdated
> entries. Therefore please be sure you base your patches on recent Linux
> kernel.

I ran this script and selected some of the emails and CCed them, at least I
believe that's what I did. Maybe I lost them when copying them to vim to make
the command line arguments.

> > +
> > +			/omit-if-no-ref/
> > +			can0_pins: can0_pins {
> 
> Wrong node naming. Underscores are not allowed.
> 
> It does not look like you tested the DTS against bindings. Please run
> `make dtbs_check` (see
> Documentation/devicetree/bindings/writing-schema.rst or
> https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
> for instructions).

Hmm. I spent a few hours struggling and testing with make dtbs_check and
dt_binding_check. It doesn't seem to pick up on this specific issue, or at
least not in this case.

But yes I do see this, thanks for the catch. Will fix in v2.

I'm basing this patch series on 6.5-rc1, does that make a difference?

> Best regards,
> Krzysztof

Thanks,
John.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
