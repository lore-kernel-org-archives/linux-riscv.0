Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2665C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 11:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FWu+N+5PHb+TCyQmdhzTw5RKKM/X55S/EBcd8MrkV+w=; b=KrAXGS33XgRomp
	lahRvMj1DmjqcoVdQG6wctY5y9Owq+Gm/CkjeeepZFqgMsdsVUXSkqGzC/XQwB+dcMWvidJfz3qB5
	dFgUO6yzn9rzb3JQxRiX1GdtzlT4VAO1KD/zTGzQ5ZCKS0ihRxqqF9mjS91+ZjXexMI51TURVFPLw
	9ewwLkIlD051icLjP+fNG3dH6mgeBMkAFuRli40t/ZD96tXfgcZQywxMN+MBn2HAAGo/6Bc8k6uKW
	nCceHTliKOPRjkKFJ97h9rOjdVBH1nEvw2T9/lg52j/5hFHZtzviJpmqZ0Qxh2PIxf2+NM/MGhIlS
	QCLY7w7CelM5vxhppVDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzb0-003ftJ-2B; Fri, 18 Nov 2022 11:31:46 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovzax-003fsV-SH
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 11:31:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C5E26245F;
	Fri, 18 Nov 2022 11:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B769BC433C1;
	Fri, 18 Nov 2022 11:31:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668771102;
	bh=rbpo0ScAYpQED/teVdJYvfJZ7RXLiDQyTZjVVIexQgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bw40giz/fVxmMTSwfCPwj3e6OCDgcHPsfE3AB1/prTpcHY7B7eKMiDNFgWXklVbwY
	 ZI0oTzkvsjQ1l7gEk2myjo+ditK8V2pwqrGqeWQD5Kod5XggpD+7VK5VvlNRizCe/G
	 S8b64P8FNiy+U+bPaOGS/IPEuelGW0/BBwxLuJK5XiAjB8Pzgtiz4tbNpFnloEpAy3
	 83Km4u0SStNXtFT9N/QFcCNqNch45EdQE5LH26T1XjWxg+1HEd6dzOsGfF86kAyZ/b
	 nXrySLnxv6GFL4LOcmofgUcjQr3009tMYx0BGb5VUziS0MnUU/wk6lL0LfWFxYs7FK
	 l3ojYiEIY/I2Q==
Date: Fri, 18 Nov 2022 11:31:36 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/8] dt-bindings: riscv: Add StarFive JH7110 SoC and
 VisionFive2 board
Message-ID: <Y3dtGMwjqzebblDA@spud>
References: <20221118011714.70877-1-hal.feng@starfivetech.com>
 <20221118011714.70877-2-hal.feng@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221118011714.70877-2-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_033143_973680_AD49DF62 
X-CRM114-Status: GOOD (  17.93  )
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

On Fri, Nov 18, 2022 at 09:17:07AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
> 
> Add device tree bindings for the StarFive JH7110 RISC-V SoC [1]
> and the VisionFive2 board [2] equipped with it.
> 
> [1]: https://doc-en.rvspace.org/Doc_Center/jh7110.html
> [2]: https://doc-en.rvspace.org/Doc_Center/visionfive_2.html

Could you make these two into "Link:" tags please?
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
> index 5b36243fd674..64008c57e31f 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -22,6 +22,10 @@ properties:
>            - const: beagle,beaglev-starlight-jh7100-r0
>            - const: starfive,jh7100
>  
> +      - items:
> +          - const: starfive,visionfive-v2
> +          - const: starfive,jh7110
> +
>  additionalProperties: true
>  
>  ...
> -- 
> 2.38.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
