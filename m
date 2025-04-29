Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2215FC369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 14:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5Nbx2A3ILv5+Le2ImJ5lD4B/zVoQdvdGUn61Lnejj0=; b=BIq2L6Er+xOd4D
	288yEWYeqpbv9sS5qsVTD/7wVGzYEKFkUj6X17PtUYeS/xz75wRT3ikobSay2g0jFu1iKCsZUFH+B
	Jwvy0sHMKKNEljuS2jydss8W2MbvVxIw+jMaPYUle4p3GzJ4P/u0Pksp5nY44TtsCvld64Bnf9Zbi
	L0n1U3/UiGtWsK6Gzzf4T0rwU947kuwAiZHLIfUFGiXIpBBiBL78iMa+Wv2FlNzBZnIXwKnp/zp5I
	C+AJEw1NTtj3CtAas8Fe6hasz9WrilzDWGNi5Uf05FTQ47Y4RHD9KekQVMXk5WUz3QbbZLoTOeDP8
	W+pSPorjLglRtApsl/qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9m1w-00000009yHH-3qVj;
	Tue, 29 Apr 2025 14:33:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9lkh-00000009vlc-3F3l
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Apr 2025 14:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=sefm2WoyZe/W51I5xuIvXahlRi1l9mhK+/uaxe8nLaM=; b=P7xywlSh5uxK7Ia3A2E0cii0Dp
	yD2s60PBAOpv1zk9fSY74JttwUCFipEm4nU161Feg7ZrYyM7k8os/tJKTZq0FIeJrw+LX+auIO+Ld
	IDpkzzzyrnn+NlZvuns3MiXOj5hM8NgPlNCAFxmAZgNl8JDC32DqhBTw0FcEzbuayuBGpufgsY1Fh
	cPZmKd2qmX5oPZu2dc0HQPvVCRttisJuW/JgX4irhIQfn49XapO6klSXW00TmhJy4oSdnzwIwdF36
	qBRU1+l1ajF4ZonlwN9CfEmt3nGMiOM21gq1xqTeL5j13siU+A/ohJxd5Q/8UR9n+GvQjCnjeiqt+
	wtv+glgA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9lkd-0000000DNaa-2BhZ
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 14:16:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 679B843A94;
	Tue, 29 Apr 2025 14:15:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E58CC4CEE3;
	Tue, 29 Apr 2025 14:15:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745936156;
	bh=Eguz7VoDXnoR8Ggv8PmbdGUYJ1KeoxNUaPMyEWLjYfA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q6lK2eW3Gpx25noiTu2sbDpKMnDbNpi2r7i35mS/8S0ekhxQPA4Z3cVbbtX2Yqtjg
	 6lju0kR7Wfks3j+ZMmLfPaMo8PDEt6PzEFgkdLSmcLnax1wLBmR1wPjJG+6LX29nWU
	 A+a/MS1is4JrQB642aUaQz7YDgKTCN9e1PAdGmT+bMx9pm1yS4RvbIJO1elMiuV11D
	 rFVTVpZyMDYs5nQa+va7mpEdePdDSxeOhz1HY3F00DPAEqHLnYoUlKM8UJZJrfPVp7
	 0vlAfOgJqv4L9mok283m/XuB7t8VwTY9reyj5QLeIpVywuttr2bfWkDVNPynbcRUWz
	 KKXmGnKkOrOWg==
Date: Tue, 29 Apr 2025 16:15:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>, 
	Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 00/10] riscv: sophgo: Introduce SG2044 SRD3-10 board
 support
Message-ID: <egkwz23tyr3psl3eaqhzdhmvxlufem5vqdlwvl4y6henyeazuz@ch3oflv4ekw7>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <MA0P287MB22626253965E96829B7371A1FE872@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
 <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2feyvebloqdcxxzmywe6azmwnz7zqulh2lixhw53ciw2ldisch@n2q3duucrp2r>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_151559_761636_4A5C5C35 
X-CRM114-Status: GOOD (  11.72  )
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

Hi,

On Sat, Apr 26, 2025 at 07:23:58PM +0800, Inochi Amaoto wrote:
> On Sat, Apr 26, 2025 at 03:36:41PM +0800, Chen Wang wrote:
> > Hi, Inochi,
> > 
> > Will you apply this patchset on sophgo/for-next? I see there are changes
> > just about dts/bindings.
> > 
> > Chen
> > 
> 
> I can only take 2, 3, 4, 9, 10 for now. The left I think they
> should be take by the subsystem maintainers.

Please, go ahead. I just merged patch 1 and 8 in i2c/i2c-host.

Thanks,
Andi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
