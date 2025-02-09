Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA62C02199
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Feb 2025 13:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IDcjWgCfJHYOn4sz2MyM7En8sMTTC9FZdP+/OYZKBi0=; b=o8I0u2PSi5wZQK
	ALjsGeCFW9+qlVdocjWjrWrNo1EymWHed9BCyhvbPOp3vEppsr8UY5+8SF1JeW/UGKMvsSyEGwvGC
	tmzNXNHiWYsi+Qwo8Tx9C2wGHk0qcxYDr0z3tji67R8cHLYayXoLT2IMNo7nRgVPIq1zAFM52xnKB
	gnT5Jof38VLKYVbVva9U0Zk/Qex2pAWIaNEwc+1KXG6Qzfw0Qn8q1KTLSRDVrVX6kg9xDhoKi3oDX
	JMtePaWXnXfvdncdoXTpn1pVCyaokbg7yXB6ldFXTcwNxYnDJ7MLUn1NbCRU9Z5YXp59U3d/TJndV
	V1WcFy1k7iqa10wDHQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1th7eP-0000000ExS0-3BTa;
	Sun, 09 Feb 2025 13:47:09 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1th7eN-0000000ExRG-3Z3x
	for linux-riscv@lists.infradead.org;
	Sun, 09 Feb 2025 13:47:09 +0000
Received: from localhost (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BC6BA3430A3;
	Sun, 09 Feb 2025 13:47:03 +0000 (UTC)
Date: Sun, 9 Feb 2025 13:46:52 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Jisheng Zhang <jszhang@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH 2/4] reset: simple: add support for Sophgo CV1800B
Message-ID: <20250209134652-GYA11750@gentoo>
References: <20250209122936.2338821-1-inochiama@gmail.com>
 <20250209122936.2338821-3-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250209122936.2338821-3-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250209_054707_929420_D51D45BC 
X-CRM114-Status: GOOD (  14.25  )
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

Hi

On 20:29 Sun 09 Feb     , Inochi Amaoto wrote:
> Reuse reset-simple driver for the Sophgo CV1800B reset generator.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  drivers/reset/reset-simple.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
> index 276067839830..79e94ecfe4f5 100644
> --- a/drivers/reset/reset-simple.c
> +++ b/drivers/reset/reset-simple.c
> @@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
>  	{ .compatible = "snps,dw-high-reset" },
>  	{ .compatible = "snps,dw-low-reset",
>  		.data = &reset_simple_active_low },
> +	{ .compatible = "sophgo,cv1800b-reset",
> +		.data = &reset_simple_active_low },
I think this isn't really a problem, but..

quite a lot SoCs use the "simple active low" IP,
can we introduce a generic compatible? so can set as fallback..
intead of growing this compatible data each time for new SoC

>  	{ .compatible = "sophgo,sg2042-reset",
>  		.data = &reset_simple_active_low },
>  	{ /* sentinel */ },
> -- 
> 2.48.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
