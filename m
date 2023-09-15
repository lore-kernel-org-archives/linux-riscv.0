Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C174BEED602
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MzoSDmGOC7LzB5VEtoNG99eVGDU2BnbZALbqSCtxcgQ=; b=yjJehxSrUd/Njp
	Bw0ugQMcCMZB5yNhGj1f7/Utkl51xCGyBLac1fIfBWc11Iq4Z3CggBtB5gkQub5a9MoVMSPgz3m8f
	MhouaeK6A05hYj31GC7rwHTqTlpoFGMzX8MKqgg6hMyIzQaFGbAdWQz5d0ZKhVuFO0ohreK04Pxrs
	YNoyeiqs8ucaFpvbnsXOTSXJM1w1NQwwvQTnlx0pc+z43ee4D/TB+I/nJLl9dmRjb+6fWLn5/Fl8Y
	0agNGOfdw2y1nljes6a5i1EGna1q1lWsLS7X55tZZL9Of/C5fURexDohpDnVBT7n4Kji2VhzMMeoH
	LfKcP1XuNTNQYQhCwi/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAN7-00AwIg-2l;
	Fri, 15 Sep 2023 15:04:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAN5-00AwI6-0r
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:04:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 72395B82AE7;
	Fri, 15 Sep 2023 15:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B063CC433C7;
	Fri, 15 Sep 2023 15:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694790276;
	bh=tVYfV/FQ4TuHJ0bVqoaP+aOcfUDlOtABzOf5hv1Hfg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EweW9D8o+n+9qE2ej+Iyg7KegRJ6h600oZdgnpuS3nogKT+8Ut0LB0udvbKp6URtf
	 VgVYssOyUxBbRyhE71kNoUVm6UCDS/603L0nJ9DEy2bIlm+V3nG9OmsujAHEBvlRhC
	 Ea+BlYnS9B33UbSfpwh4/Msl3vJldpvv2Di+FlIGh4Ry7ts6CzrVTuaoy4B8wYt0vd
	 ug0tcUtN9OHnPNf3gThuKKmRkQtGyqSc7gi71J0rxrh0ibcjtv/+SteUsAzh7JT2k6
	 /u8hetHcSXSHqusB854BDIpUb+uuMsm/oh17XBRGdGbijdHV8T4MCv2PBn7qDFVeOo
	 rcA/SQTj3ug+w==
Received: (nullmailer pid 3731047 invoked by uid 1000);
	Fri, 15 Sep 2023 15:04:33 -0000
Date: Fri, 15 Sep 2023 10:04:33 -0500
From: Rob Herring <robh@kernel.org>
To: Wang Chen <unicornxw@gmail.com>
Cc: linux-riscv@lists.infradead.org, conor@kernel.org, aou@eecs.berkeley.edu, krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, jszhang@kernel.org, guoren@kernel.org, chao.wei@sophgo.com, xiaoguang.xing@sophgo.com, Wang Chen <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH 05/12] dt-bindings: interrupt-controller: Add SOPHGO's
 SG2042 PLIC
Message-ID: <20230915150433.GA3730052-robh@kernel.org>
References: <20230915072358.118045-1-wangchen20@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230915072358.118045-1-wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_080439_450106_BBC70037 
X-CRM114-Status: GOOD (  13.25  )
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

On Fri, Sep 15, 2023 at 03:23:58PM +0800, Wang Chen wrote:
> Add compatible string for SOPHGO SG2042 plic.
> 
> Signed-off-by: Wang Chen <wangchen20@iscas.ac.cn>
> Signed-off-by: Xiaoguang Xing <xiaoguang.xing@sophgo.com>

Same problem with authorship and S-o-b order here.

> ---
>  .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index dc1f28e55266..3abb1f68ea62 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -66,6 +66,7 @@ properties:
>            - enum:
>                - allwinner,sun20i-d1-plic
>                - thead,th1520-plic
> +              - sophgo,sg2042-plic
>            - const: thead,c900-plic
>        - items:
>            - const: sifive,plic-1.0.0
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
