Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CAAFCE7AA6
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Sep 2024 02:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uex6hjp3cBhxwdibOSRzugBENz6MzJ84N5yEs3f51wQ=; b=gmt5axYK7ApZX+
	hSCaIM8qYj3J3sdwSKHMBUuKXJCvRoDdFqS6GnjaaG/YBXwgK36YiJhk1lzyViw06o3xxkKlR7EUL
	A6wpSAyHNJ4rExBhNflRkuix9PMRYcw2Q6l+mXW4tX9qKdS3EbEyOSuYUoL2IqeKspOlSY37XFG5X
	Bsn3H/ds5/E6JCmNJ2M0w6CdFHVK233aKVkWvoo8geOBIFn9DBu+X2cQjX+DMxi6zRQk1UdM4O97u
	5qkgpzDRoe345eY6uZ3uuyVbQSMUE84fRnXcpmV1uMJx9arUB0xCVXouBBviA+x6h8m5GNQcltwMX
	Y4B1RLkwGWLWadhgkCpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smOxz-0000000AP3y-1iZB;
	Fri, 06 Sep 2024 02:44:55 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smOxw-0000000AP2p-18R5
	for linux-riscv@lists.infradead.org;
	Fri, 06 Sep 2024 02:44:53 +0000
Date: Fri, 6 Sep 2024 02:44:35 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	chunzhi.lin@sophgo.com
Subject: Re: [PATCH 1/2] dt-bindings: pwm: sophgo: add bindings for sg2042
Message-ID: <20240906024435-GYA153340@gentoo>
References: <cover.1725536870.git.unicorn_wang@outlook.com>
 <6e5fb37472b916cb9d9abfbe3bea702d8d0d9737.1725536870.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6e5fb37472b916cb9d9abfbe3bea702d8d0d9737.1725536870.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_194452_355358_9BDFFA2C 
X-CRM114-Status: GOOD (  14.73  )
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

On 20:10 Thu 05 Sep     , Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> Add binding document for sophgo,sg2042-pwm.
> 
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../bindings/pwm/sophgo,sg2042-pwm.yaml       | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> new file mode 100644
> index 000000000000..10212694dd41
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/sophgo,sg2042-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 PWM controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description: |
you can drop | here
> +  This controller contains 4 channels which can generate PWM waveforms.
> +
> +allOf:
> +  - $ref: pwm.yaml#
> +
> +properties:
> +  compatible:
> +    const: sophgo,sg2042-pwm
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: apb
> +
> +  "#pwm-cells":
..
> +    # See pwm.yaml in this directory for a description of the cells format.
I think you can drop this comment, since no useful information added
also it's already refered to standard pwm.yaml
> +    const: 2
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
also "#pwm-cells"?
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    pwm@7f006000 {
> +        compatible = "sophgo,sg2042-pwm";
> +        reg = <0x7f006000 0x1000>;
> +        #pwm-cells = <2>;
> +        clocks = <&clock 67>;
> +        clock-names = "apb";
> +    };
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
