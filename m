Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128FC369A3
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 13:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IVMqDRnYvTnYrj+8tPsUl9v1qq4wxrMN7DAuCm/tO1Y=; b=ofyuhXsQgAbttf
	e17J8hbafyyvZsNBRR1fEqesoKNgQCUH6UDJBxroPi5wxbCtpIocWVoO6o2AuqM5DMzYruOGIiyKS
	8DZv4UVs69EYsBwED0vFXPBv6oZ4S00dU1nBF4ndwuz0Zi0dVfZq/LKwDYnxU7vV4t0QxpAhMw02o
	IoZPp68p3OEv+oAvaQ69iypApfg2bne9km+2y2hcOXpJeTJ8L9rNcGWGaPxShV8mNuTPTC0wjVGgw
	FJhFNy4oBEakik2AY91y6Y77wa0k3Y+SY1TVzdtpC1seltu71LmoPDxzyKGdE7V8YB+RvhtThMzHH
	bXrruf4PDXUrg5A2uBHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mzS-00000000cmX-3Y9m;
	Mon, 07 Apr 2025 13:58:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1mho-00000000ZTM-2ys0
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 13:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5B79E6113B;
	Mon,  7 Apr 2025 13:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 020E2C4CEDD;
	Mon,  7 Apr 2025 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033203;
	bh=3Jsy3U8ncbmDNsptsfF9HvnjrFQt4I1GMdj0SZq/fzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jpOE4XsiNPaNz5DJf0PaXDEDnphzgxL8k9uTxP0AKGzcklQGu3k6nKw5At/sHjQPU
	 Nc/RE53PVfGHBx/bo2Vf4BGXZvw+ak/a/23PdGHvw8KarWw1loqMVgGPuJ/3I+NA2y
	 U0+c9prQ+RnOJHvMy+aQ3KbglvYEdmWoUKnUhv4Km64VuFE6Yqic5sKz/VsUuVd4mA
	 wG3nu0TNHb0lsdT2nIE6A3/IjeRBQ+glkfCN0M5VVzsB5NxiHl4G4+58kO0Edtwc7v
	 1ujEUlavDc5/6ueEdJVqnhmgOUGenEcZhNtYTzlLuIhEPs7AVuC5Bd0DaSUF9Kxoyi
	 YFPKeLz3gxmTA==
Date: Mon, 7 Apr 2025 08:40:01 -0500
From: Rob Herring <robh@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: reset: sophgo: Add SG2044 bindings.
Message-ID: <20250407134001.GA2088093-robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-5-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-5-inochiama@gmail.com>
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

On Mon, Apr 07, 2025 at 09:06:09AM +0800, Inochi Amaoto wrote:
> The SG2044 shares the same reset controller as SG2042, so it
> is just enough to use the compatible string of SG2042 as a
> basis.

You can drop 'binding.' from the subject.

> 
> Add compatible string for the reset controller of SG2044.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
