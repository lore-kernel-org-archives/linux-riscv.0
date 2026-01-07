Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CBF1D0D145
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 17:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HVbAuwEhZfwXH4FUEPvJZDdBOQYOpkzqycwu5EHvf5c=; b=2EomAOTzph6WYZ
	67iwvLqEOg1Jzvga4TWmNS5CxP7AAcRZFyZhAmFpkZoMqSmgygUOJ3FBEbnEPa7JaEClqWnx1ZWrH
	vLLjCF5RpSGPyiLQz6UnDeXbm36HDtPep8076UbQarPo0O5l6VuV8NoctEmzLxLHQgfwXyLcm6jdT
	JI+NFYS79gOqTmkufM3Q35UkKY2qxIu4ZLta/RPusm8w2/IC5h9E77rpQsUKSRN78cDkXL4IWBdGf
	kYWG0sQLtT/+JRmaYJ0k5pZizFzSEx40cLYaWLgs/leILtLvOV/CLjJeAJcyVZgwcZShUflERDD2L
	4IXhd6ybzdlGGk8tJtbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXhD-0000000FOq7-3uKV;
	Wed, 07 Jan 2026 17:51:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdXhB-0000000FOop-2iml
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 17:51:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F163B43C66;
	Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 654FDC19422;
	Wed,  7 Jan 2026 17:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767808304;
	bh=EvfJl+USajo90pWhoSwMTyGP/X8mWv1NTXOWkDGByiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XQ5yYqQSS39EtrC+ZAupv9l6DhoWvRqn/Qc29x02khw7rJCqK43fbKw3irDKzd3Zx
	 efSkLDzw2YKn42etqwkrc4b/R/6XOPXf043Jq5JMuIEhjGGNEJjQDN75lzWS5nd84U
	 2vf8IeisBsyGk+25s8HL2Pyb+ldOJbmMsyUVj7XY17eFDRaVqc1xumlgYFq6iMxktf
	 t9uL69fC9mCULQ1Tt6dzoRaM3CZ6EOZmR5ZzpiSOmEyHg4UxDSXc58rBRKVY3jZCIU
	 4E9kbWe1DKDhdEuWLVEZaM15NdF4rJWCKpZ2+IC4Ka7onAkhMWe0r3vWWDU1ovJWaF
	 Sm4Lj7TnYfuKA==
Date: Wed, 7 Jan 2026 18:51:41 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Encrow Thorne <jyc0019@gmail.com>
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, dlan@gentoo.org, guodong@riscstar.com, krzk+dt@kernel.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	p.zabel@pengutronix.de, palmer@dabbelt.com, pjw@kernel.org, robh@kernel.org, 
	spacemit@lists.linux.dev, troy.mitchell@linux.spacemit.com, troymitchell988@gmail.com
Subject: Re: [PATCH 3/3] riscv: dts: spacemit: add reset property
Message-ID: <aV6c5-C9AOccl3vf@zenone.zhora.eu>
References: <20251230-i2c-reset-v3-0-7500eb93b06e@gmail.com>
 <20251230150653.42097-1-jyc0019@gmail.com>
 <20251230150653.42097-3-jyc0019@gmail.com>
 <aV5r8k4VKnXX_9Sw@zenone.zhora.eu>
 <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260107162343.GA49546@hailin-HP-Pavilion-Laptop-14-dv0xxx>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_095145_715616_0151D265 
X-CRM114-Status: GOOD (  14.02  )
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

Hi Encrow,

On Thu, Jan 08, 2026 at 12:23:43AM +0800, Encrow Thorne wrote:
> On Wed, Jan 07, 2026 at 03:22:42PM +0100, Andi Shyti wrote:
>   Hi Andi,
> > Hi Encrow,
> > 
> > On Tue, Dec 30, 2025 at 11:06:53PM +0800, Encrow Thorne wrote:
> > > Add resets property to K1 I2C node.
> > > ---
> > >  arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > 
> > how is this patch formatted?
> > 
>   Sorry, I forgot to add the version number when I resent it.

you also forgot the tag section :-)

No worries, I took patch 1 and 2 into i2c/i2c-host branch.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
