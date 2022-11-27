Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BDC3C43217
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 17:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iFead5J4+chUs5d6blky5IwIjXmRYRzjd0bNLwt1u3Y=; b=RJAzlbiu7d+irf
	Yuhpa6et57xcHm00xDJKdaw8/0U5Ox5F+L4Io7c+NT8GpFCpspTt0Qf9cRmbjeJYGjqcU8IdZxtzj
	q8DtpU2tuhn2g7Px4tmUTVDW9fUSj4ocyrYKeawbr3th46/60DPoMjU9JMjUC5D41LbUrJusZPZgT
	n0lUXz9jr0qGjrVayp1h89oHVE21v6oDwyqku8rCmKg3DQfiXw4eeYEQXSIqZUt1tdYNRnifSqoF5
	hv1olbzj+POiAXYfKaB43GwicymENc5NRfCIpqLUOMMFjZK7LdF2OB+B+sr7EzLgHFypMNPtQ0wGQ
	PlVX4mkkYr0W7jKcMGXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLNL-00CcDh-Er; Sun, 27 Nov 2022 17:23:31 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozLNH-00Cc9f-FD
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 17:23:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 611AEB80B23;
	Sun, 27 Nov 2022 17:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A2C8C433D6;
	Sun, 27 Nov 2022 17:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669569803;
	bh=QIMLfSDoL2lbgD+2NPt656LV7PYTHEk9OFRVgEJkQ6I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h6WvF6BELW59nr2a2BhTjwjrpyngeFskVIePIM+nQYgIZm8teu3eAQPa3goYTeRv9
	 NWeEvdYKq/y1OV6eFVH9E5hGk0hLLwaPPGiTtPEbOVr8/XDXi7C2tjrrTvwdVBBK/Z
	 igZv7PlC3qLhJAMV0xPH8YBsvBKx0OwPxRk8zwd8G1PE5LWM83kj0ZRV9RuPoowJAq
	 YGeD6GoiojCyU4NiKz8bIvdssGXe8lZal6j2m2JUWXkwNKYPFurBUL3fJvabLX9wPW
	 TTKXr3Yat9dp3KQh3Xvya8HxbJj/7lRduvDG2MVQH+1Kayj8KHfis7PcV04ekgubG7
	 fPP5D+3V3bDjw==
Date: Sun, 27 Nov 2022 17:23:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Subject: Re: [PATCH v2 4/9] dt-bindings: vendor-prefixes: add bouffalolab
Message-ID: <Y4OdBr3/uTPVbxMk@spud>
References: <20221127132448.4034-1-jszhang@kernel.org>
 <20221127132448.4034-5-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221127132448.4034-5-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_092327_670013_4DE676B0 
X-CRM114-Status: GOOD (  13.93  )
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

On Sun, Nov 27, 2022 at 09:24:43PM +0800, Jisheng Zhang wrote:
> In the following commits, we will support bl808 SoC which is from
> Bouffalo Lab Technology (Nanjing) Co., Ltd.
> 
> Add bouffalolab vendor prefix binding.
> 

Perhaps add
Link: https://en.bouffalolab.com/
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 6e323a380294..81618f1dc01b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -194,6 +194,8 @@ patternProperties:
>      description: BOE Technology Group Co., Ltd.
>    "^bosch,.*":
>      description: Bosch Sensortec GmbH
> +  "^bouffalolab,.*":
> +    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
>    "^boundary,.*":
>      description: Boundary Devices Inc.
>    "^broadmobi,.*":
> -- 
> 2.38.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
