Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E51C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 16:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LDe82DtgGqv/435Bw2b4d0aUUW2N8vyOVLjma9fB9Xk=; b=VgEpv1A2iIoZxD
	qzT75yAsmxZ8+UHaD8q/8DKWZvcDG3ySAZ4ggFuo8DKdFsuIreYBp4HoOP8/Fiv9uHNpJOsc7twpT
	BpjcWF36gJ55U21mD/J1kV/MFl3XVUCqtTgq+YAg2xy91v5B2OPRnYxsV6DzoZJic5NUBEF7ODv0w
	hnmilGWN3ytrR39u76K+t3J4A1JQMBziMZt0pucJNmls770JHTcxxEea/6uWroSIVf2g/NaQVYF1U
	NaRBR4/TyMfr/FLYMwYCDp5rGsUzW7cciUF0uF+OOHkamP1KRNU4iKcpnv384unA/YH4YGtQkdMg0
	EalqEdp/QUGNO+JP0zCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrEF-0000000HR39-2Uul;
	Tue, 30 Jan 2024 16:44:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUrEC-0000000HR1W-35T1
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 16:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1BA8A60EBF;
	Tue, 30 Jan 2024 16:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796B9C433F1;
	Tue, 30 Jan 2024 16:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706633091;
	bh=ApN6vGDoCBSa8a5eHek4leab/krN/aRtltgY7pXOlaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eSSqBRKc7l50P3IqENRN3i8FnYccrqXf4wIpszO0ApgIw+XxPLTjNtyCyrpLoCx7V
	 llUAy5lxvX/BvGhDzIXLv8rtRagPqQx9XQTeLnaJASOuCZKe4aeVdfjiOdizFQ6Qj+
	 Ejb3Ujpgf/w18Xut6wj8w+tcUW9MjJJcTCW6JV7N99RMaFYqrIuLdhB9XPsd03GyS6
	 cGksaQ1iXg7Qmh2F79ORkwb7+QWpOq1Jv7iQiywybha6QWmzpGgHVF7aWrEAqkaWAB
	 mD2I2SQnW0mFKKgnZKazTZ7FTv+s5yH/rkiSrhoDwmJUwCpr21c1S9oAYlhmTd4HAl
	 8FQiIVtgQ433A==
Date: Tue, 30 Jan 2024 10:44:49 -0600
From: Rob Herring <robh@kernel.org>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-can@vger.kernel.org,
	Emil Renner Berthing <kernel@esmil.dk>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v1 1/4] dt-bindings: vendor-prefixes: Add cast vendor
 prefix
Message-ID: <20240130164449.GA1828286-robh@kernel.org>
References: <20240129031239.17037-1-william.qiu@starfivetech.com>
 <20240129031239.17037-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240129031239.17037-2-william.qiu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_084452_836770_B600687C 
X-CRM114-Status: GOOD (  11.50  )
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

On Mon, Jan 29, 2024 at 11:12:36AM +0800, William Qiu wrote:
> Add prefix for Computer-Aided Software Technologies, Inc.

The diff tells me this. The commit message should say who Computer-Aided 
Software Technologies, Inc. is. What do they make? Website? etc.

> 
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> index 1a0dc04f1db4..b9c6ce99d24d 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -242,6 +242,8 @@ patternProperties:
>      description: Capella Microsystems, Inc
>    "^cascoda,.*":
>      description: Cascoda, Ltd.
> +  "^cast,.*":
> +    description: Computer-Aided Software Technologies, Inc.
>    "^catalyst,.*":
>      description: Catalyst Semiconductor, Inc.
>    "^cavium,.*":
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
