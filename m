Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68990C369A3
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 15:12:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IOXDl1u3cyc/OatD1uze3kjb+u3Srj7jW/NI44syknU=; b=4TPyoFHMu6b05H
	sGhre3czGcw3QS58TudNjOHR9Hf4n1mpj99Iw229ZMYUeGbX9YI3bQq93hltH61GIhzh5ld9iaAdo
	BDuM9McRVsI3qunMsnrpwtVF7mYkljIyY1VZalmE/RrUf3je5Q9pyeu1XBMXqCYxcscxVMrx4WYtq
	Nuw2zCWu1YQ9ETR6xDz7sXrH06kJGPyl/i4YLzmZ5UMdvxpT0Y1F6uNUalWFT8YZQuCXbGBoNN7tM
	3tdL+6VOy8upuhe0UG0A5Dhd/1Z7/rF/R695XV1d2rlDWS5U0cC49626zvEH4l6tWruvhG4yX1qBk
	smC0hfUYc8Yxegsq4XBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1o9V-00000000tqs-1wMW;
	Mon, 07 Apr 2025 15:12:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n3d-00000000e8K-2zK3
	for linux-riscv@bombadil.infradead.org;
	Mon, 07 Apr 2025 14:02:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lby7W6R16jLmiSs9O5bQuZZMhw24L/r7TXzrvfvmENo=; b=rI8DwwzcFrEfBUx7T1WVadpRdg
	KjxrejzpEtM8moRdTPfyWwMy8cx5dBBqZ1XnZeTthE9ulFPeLd56rLJgLuIqA9zw28/cAJSt8osfE
	OrY8Cdvxm00j0xH16+Oo2y4kslQJ4S5zZkYKWYWt6pw4DFRLublq3RgirjmKPjggu2xf+gM81u8u7
	0IYxkQ4IOHPwKG1tuOcyG5AfjAuWehkdUMNqTrASDbEo3hmyGrWYH1H7X9HhAgDqW9SlSRgROeEAW
	YpAVHIhSpe4hhHiNyb4UJHThqdLxjFd2yzw7IdaLSKPR4V5lKbWQkBjwiV6gGDQ9ZRKEtkrpjvf8v
	4SanxrBA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1n3a-00000007y2U-3SJT
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 14:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CA3C14350E;
	Mon,  7 Apr 2025 14:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108F3C4CEDD;
	Mon,  7 Apr 2025 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744034553;
	bh=W3SHYCW2Ors5dixyvIPe8YB5LgdUl989Vud2NXgXX8o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Oh6ZWDP9gO1f5r6MxG/QQ4EWDh52V6RzQQ4W7G/Wc2DM7wj67nRy0OXFJbv5EybBe
	 3E8lu4uRJh1oVrYXIzz8yV2GKMlDPbPy54XIRlSDZE4covfbvrht5pFYl27TMhAKgs
	 KfQtzOwxVM+MCBPE6AjTY3U3+OKA7H20Mc9YLqJUADIOHD6Ais16TqBgY4N/Bt0An5
	 W1NnfOgXPvjITsah7honbXqtG+6fz5TDUHnkJy5E0kcn1cpJ8TJCgHQWAqD3PdXEfk
	 Jp8I1XN7InWFptl0b/MMeQ7KFCkdDDNhSgjMqxOGL9Z1cV5qU8QmVj68Cx69PAOViN
	 o5zvSOgAi1mKw==
Date: Mon, 7 Apr 2025 09:02:32 -0500
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
Subject: Re: [PATCH 7/9] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <20250407140232.GA2165777-robh@kernel.org>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-8-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250407010616.749833-8-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_150235_092637_4FF9A474 
X-CRM114-Status: GOOD (  14.26  )
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

On Mon, Apr 07, 2025 at 09:06:12AM +0800, Inochi Amaoto wrote:
> Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> used specifically for the SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/i2c/snps,designware-i2c.yaml          | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> index bc5d0fb5abfe..677b39865af0 100644
> --- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> +++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
> @@ -38,6 +38,10 @@ properties:
>            - const: snps,designware-i2c
>        - description: Baikal-T1 SoC System I2C controller
>          const: baikal,bt1-sys-i2c
> +      - description: Sophgo SoCs I2C controller
> +        items:
> +          - const: sophgo,sg2044-i2c
> +          - const: snps,designware-i2c

This is not a great pattern we've started. T-HEAD, Ocelot, and this 
should all be combined into 1 enum. The description here is not that 
useful.

>        - description: T-HEAD TH1520 SoCs I2C controller
>          items:
>            - const: thead,th1520-i2c
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
