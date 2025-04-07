Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A9FC36010
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 13:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A5r7RqFBiLP1RLdSMXg1OL3EwjxTgUzCnpNAAy+0ces=; b=jmVLl/m3YALFeb
	dCLxmdeLhGk8MPsBY18hlEKhVrwkK0bCdGf81icR2SmwBdmeI4UyKYlgOhP0QLcCX74EMQiGeqraM
	YLxW7RpuDfNN7RE1KLSibpbKmPWDmz2JJuOKytVkRHWjj6B02+nbC3eZMVoDVV2ISZ2ipmm5iJ9hy
	GFNe5PLeVESy0Dr4XX79yGeeDeAO4oTu8EixbcQqxaf/VawyrHEa+YCWzBsTQqcuTRhJPxcalJVEe
	FAb5p0n99gq2cKHxtAVhCxER0CPwkIf74OYxYbYiXapBoVFxU71F29e0OIW+U9g7EZVTxARGhQYnS
	BsWgKNboGO2lc61I+j5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mzS-00000000clt-0uqJ;
	Mon, 07 Apr 2025 13:58:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mge-00000000ZA3-1pgg
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 13:38:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 55ACC4433D;
	Mon,  7 Apr 2025 13:38:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B97C4CEDD;
	Mon,  7 Apr 2025 13:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033131;
	bh=1F9LhW1V7Jl/4nlfW9DvA2Y0ImG8BNm2UMrmjZazqxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GptQj2sp4ROzyVqijGrfeOg8cOCWBaPBVUGe9+mxx2erXzuel+E91GW/HRRUbZjCV
	 Kt6XqC97RL4qZC+c92EhVmznm3NSy52VP6j+tPWqd50hicTNd1SdiLuOHDFYxiLGkv
	 qMnHCKVPpQlLOQqoGNk4y5/GTy+eikre5XgqhbSgg+ws2XvvgUYyB53MoGOIAZsFd+
	 wokRUCgYcW/I0Fh8e9o6QWqyxNsAYrgNGx1fj+qEb8fddmvvMPc21s+Ji0KncGzUuL
	 jUpswAuMcUhpTuHXfg+kGYU9lYPDGnCTKn1CtqbOGL25YghmTwJzZUdcyB0dHdIEzG
	 7UwKNusNriBsw==
Date: Mon, 7 Apr 2025 08:38:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: linux-mmc@vger.kernel.org, Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, ghost <2990955050@qq.com>,
	Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 3/9] dt-bindings: interrupt-controller: Add Sophgo SG2044
 PLIC
Message-ID: <174403312992.2087419.10477124729045212954.robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-4-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-4-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_063852_492029_AB9ACB83 
X-CRM114-Status: UNSURE (   9.35  )
X-CRM114-Notice: Please train this message.
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


On Mon, 07 Apr 2025 09:06:08 +0800, Inochi Amaoto wrote:
> The SG2044 implement a standard T-HEAD C900 PLIC, which is
> already supported by the kernel.
> 
> Add compatible string for Sophgo SG2044 plic.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
