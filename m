Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730D2C3601E
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 07:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dxZzcIkqoF65Nn98BubN0+WBwcp+42MBiqyOOGAORSk=; b=xZGkDu6cjEvGdL
	WYvnJ/7oWCqk6sTKaIZSwpV37Zr0cBaMhy6NFHI6ZIYF41KWmDs9f26dxUctUUrbyJE28lrTDsb/5
	z0MGJyZRTy5isB9sfCz4HJel7X4j/Mxo601uM5G/gGgJ4LSpg8Yrvn+2i5/sks5ibUsKpGEvrUPU2
	+oL6v3yY+bLy0N6fK+bpqXUrxiU0VJVHhxJe3oQIQoXe86q07H2YCEfLFTxmxE285Qga2M574WmNJ
	T43CR5uQOz810cLQptIl1UCcBtvV0eH8T/KbwjzStX9X7AKpRndn6Q+EGcEjK0gAdQ8JgJvSGNYXF
	dL1ZGrCFWU7TCD+OCNaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EJn-00000000wL9-1lSw;
	Mon, 14 Apr 2025 07:33:23 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4EJl-00000000wKV-0ak7
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 07:33:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 17D53A488F5;
	Mon, 14 Apr 2025 07:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADA5C4CEE2;
	Mon, 14 Apr 2025 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744616000;
	bh=kTal2JJIjvbhqqeb2aXNLhvO1P71bn/m7n+c3fSUmFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uVPlimpUDYBt4gJJhPFhhpA2n3VetxCb4i63xcd2AuKq+ciPthWfhwmv2mQodGvTe
	 pQf+LBQ/Ib/LsVsJ8oTXtIL6PZIbbn0FURfbYgNmXaI6RTpTzjGuW/kq9ZtnEg/acg
	 r/rHOLuiOewVFKRPdMzRbCcc1l19mqZCdm3YcSuf83U/zxI2cQDKirzWHh9cZkeXT6
	 kDOlN83CmMrdzm5WGiUlKlxXCaR6BzlOEtgmvgAmAq96NzXl6itExfdSV9tDaR/sIA
	 Z0f6BzFjPKqZR5jmas63v2PubPQvbbrR0N7GiCg4yisSwZQnucP71USp2YLhCEuakN
	 G9LZrP27Ev/ow==
Date: Mon, 14 Apr 2025 09:33:15 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org, linux-mmc@vger.kernel.org, 
	Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v2 08/10] dt-bindings: i2c: dw: Add Sophgo SG2044 SoC I2C
 controller
Message-ID: <20250414-muscular-steady-perch-cb44e3@shite>
References: <20250413223507.46480-1-inochiama@gmail.com>
 <20250413223507.46480-9-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250413223507.46480-9-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_003321_240985_D4B815B9 
X-CRM114-Status: UNSURE (   8.22  )
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

On Mon, Apr 14, 2025 at 06:35:02AM GMT, Inochi Amaoto wrote:
> Add compatible string for Sophgo SG2044 SoC I2C controller which can be
> used specifically for the SG2044 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
