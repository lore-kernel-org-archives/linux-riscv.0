Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3B8EED600
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=85yNzr5F9tXdV94oC+GOBqHDZyWH7LU1G2lMiN8WNAw=; b=tSNk/TxM2hJtgH
	LfrL4/lL9QBJ5txhEpwBtYZzMNt8C2xgOT5CMp1YzGpXoejVNYoJHRbGOWYbhH8HSZ+Slz1eF0Ytb
	KKRh80u07CjZp4XwbCi2TyuzUDhyz8/otVIAvzNSjtKZJMj+7PyTnql9WWGJ2WRNu/TOQ/0VeA1yK
	f8MmiNhecz0up0Iz+eJTudJsPx25USyCN7QKct/Tft5JS5KCJ20tAFCV2F5AT+NlBJjcuynnrTt8Q
	Gy71H7yo6G1QPcktafxXgIxJBzD03p0fP/AY+mEXVw/vKt45NfOiDZQjHp9bZTeIbpXyoXOZLFexO
	6JaE1o+1wTxlitthNRYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAON-00AwP6-1N;
	Fri, 15 Sep 2023 15:05:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAOK-00AwOc-1k
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:05:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id CA9DECE2B28;
	Fri, 15 Sep 2023 15:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A668EC433CA;
	Fri, 15 Sep 2023 15:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694790352;
	bh=HTR0jnRq7Qok2GBZIdglCxy34OjHIAkdXarc7/JXfQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GKmJvd6jL5PxazkTqlOPvFB6fgldVOUnGXxbFUr04cSxCmFPH5GpvF++pTgucnCpP
	 jl6LYtMflhK/860BedJQYoaBhwn66cSl+4JI0A87Lcv15+OpRf395MJ6dt3Hza0iEe
	 I2qekF3WCEAsu4sDY1eyoDRoQaLq0nrA1+37c121d/qiaw72tD5lO839W/hgilSWI1
	 3kvGBDYAqvBndv1iH+ummMArHJ0ScNqrpiRLJcMUINwQNZrUS9iMC1zhTjbn8RqAa5
	 JYFVkc5wPpn1H1fo+OCOhKPlO2k0bSUR97YEek0AgPw7cJl8Z2VPjlyU8Q2jo/cng0
	 A7wkuJcZtkJBA==
Received: (nullmailer pid 3732603 invoked by uid 1000);
	Fri, 15 Sep 2023 15:05:49 -0000
Date: Fri, 15 Sep 2023 10:05:49 -0500
From: Rob Herring <robh@kernel.org>
To: Wang Chen <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH 06/12] dt-bindings: timer: Add Sophgo sg2042 clint
Message-ID: <20230915150549.GA3731700-robh@kernel.org>
References: <20230915072415.118100-1-wangchen20@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915072415.118100-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_080556_923292_29412A88 
X-CRM114-Status: GOOD (  18.41  )
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

On Fri, Sep 15, 2023 at 03:24:15PM +0800, Wang Chen wrote:
> From: Inochi Amaoto <inochiama@outlook.com>
> 
> The timer and ipi(mswi) of sg2042 are on different addresses. With the
> same compatible string, this will cause a mismatch when is processed by
> SBI.
> 
> Add two new compatible string formatted like `C9xx-clint-xxx` to identify
> the timer and ipi device separately, and do not allow c900-clint as the
> fallback to avoid conflict.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>

Missing your S-o-b as any patch you send should have yours (last).

> ---
>  .../bindings/timer/sifive,clint.yaml          | 26 +++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index a0185e15a42f..2a86b80c3f1e 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -39,6 +39,14 @@ properties:
>                - allwinner,sun20i-d1-clint
>                - thead,th1520-clint
>            - const: thead,c900-clint
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-clint-mtimer
> +          - const: thead,c900-clint-mtimer
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-clint-mswi
> +          - const: thead,c900-clint-mswi
>        - items:
>            - const: sifive,clint0
>            - const: riscv,clint0
> @@ -74,4 +82,22 @@ examples:
>                              <&cpu4intc 3>, <&cpu4intc 7>;
>         reg = <0x2000000 0x10000>;
>      };
> +  - |
> +    clint-mtimer@ac010000 {
> +      compatible = "sophgo,sg2042-clint-mtimer", "thead,c900-clint-mtimer";
> +      interrupts-extended = <&cpu1intc 7>,
> +                            <&cpu2intc 7>,
> +                            <&cpu3intc 7>,
> +                            <&cpu4intc 7>;
> +      reg = <0xac010000 0x00007ff8>;
> +    };
> +  - |
> +    clint-mswi@94000000 {
> +      compatible = "sophgo,sg2042-clint-mswi", "thead,c900-clint-mswi";
> +      interrupts-extended = <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>,
> +                            <&cpu4intc 3>;
> +      reg = <0x94000000 0x00004000>;
> +    };
>  ...
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
