Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2ADC88CB6
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 03:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=arkJcpqOZUx34whWSWr2CSOKDp84uCoNrG2yfQ1zMBI=; b=ID+R/WR2gVOmxQ
	lrCTbZ26qcnwL7s3yAFf0mngBVP3OnPrq3Jrcl8GHuvlznGO2MZibbIaJpGRYqZmMqa9c2jBYwNaL
	vY1MYIUgnmqWquQ7AdcLGX0WJTDjMsTyCw93jlHccULSh6NZtLRohY+MqF1zITzxtuuILGowiRfz1
	+qMv8bLyXMot73ooW0tMII0rMiNb/IHKRC9skCHpU4SpE7M6K7iHyB4tjjBYQ854e+5o0XnYNeQRu
	SFZ1WfhlIx1H1DZ2zymcTRf85Hz2yewu2WxSyYg9GEN0UqD99wR80lryII4XTM5xfIyG/vyvIqa6E
	BdEIwKGDQSQPBngLITPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8uIY-006jqd-1q;
	Tue, 13 Jun 2023 03:02:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8uIV-006jpQ-1W
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 03:02:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 16D48619C0;
	Tue, 13 Jun 2023 03:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F47C433EF;
	Tue, 13 Jun 2023 03:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686625338;
	bh=QE/bJwOrqp//Jql9+14/MwBTyhw4er96hvgONGtQRQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fmFutB7UJyIqIvyYtzg1AhRZiCqep9yi7UDUTZD+BRwy69iezaNkdsmMzjfXkNDkF
	 uq1944kIbErb3We3MTv2UfHDOJhnAakKbShcn8gxn9Ek6+a93OlDiNM3W8XbAOc5Mb
	 eACE/U6o9yjpFlxF02c7JlDOccZjNV8T9K/sg6ZWGR1paTU3AgwWRErDIhSBSkP7Z7
	 nBO64y9c/jjjL/RVX3c3kY1uym4Lh4PP4MACduOmXaZEEJqCEPU5xfBbC60Gj7xT0c
	 p5iL/yfQtr88Y2hO5W/gGWwB5jAKyTgwz9L6CUZmw6Tg78mKJQ7Aqnu89AETEYoJTZ
	 IHUWlMs3YxGIA==
Date: Mon, 12 Jun 2023 20:02:16 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	conor.dooley@microchip.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
	christoph.muellner@vrull.eu,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v5 0/4] Implement GCM ghash using Zbc and Zbkb extensions
Message-ID: <20230613030216.GC883@sol.localdomain>
References: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230612210442.1805962-1-heiko.stuebner@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_200219_545988_30519D53 
X-CRM114-Status: GOOD (  13.69  )
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

Hi Heiko,

On Mon, Jun 12, 2023 at 11:04:38PM +0200, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> 
> This was originally part of my vector crypto series, but was part
> of a separate openssl merge request implementing GCM ghash as using
> non-vector extensions.
> 
> As that pull-request
>     https://github.com/openssl/openssl/pull/20078
> got merged recently into openssl, we could also check if this could
> go into the kernel as well and provide a base for further accelerated
> cryptographic support.

I'm still a bit skeptical of the usefulness of a standalone "ghash"
implementation, when in practice it will only be used as part of "gcm(aes)".
Directly implementing "gcm(aes)" (instead of relying on crypto/gcm.c to compose
"ghash" and "ctr(aes)") also allows some performance optimizations.

I asked about this on v4
(https://lore.kernel.org/linux-crypto/ZCSG71bRuTzVutdm@gmail.com/),
but I didn't receive a response.

Any thoughts on this?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
