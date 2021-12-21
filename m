Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABDE5C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 14:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SyNwBEW42m/L0adUlOaUFaZp5Q51aJ+y+E8mAI7Z+nA=; b=khmXrU2Exmlnsb
	l+PWLl/msh0GSHU5wL/iWdFmL8/QzakSDkY54TPXSPTjZDRL/6EPVuph139x0GEpq4P468ZDhGeB3
	pdnGkgKFG4f9h8GkXKK2zr4SkOLAlDBj0YsalbZ2pggr5xK3hF4FcRk232WPzTK/sYBtmm7RcsU+e
	QUuTUSF2joTJgd7tLUp/kcq95f32+JLW/rqo0jm4A7sIJgvJz1A6RZS9cOCj5KLOfHfPMcewUgDXA
	O+sbww6kSYApjguwnQ6YveHlPhGI4vLHcHeusczwWJPA5xUmNhwZRjNraTvyuRenV7djVat0Lpq5O
	Vk3OOlRE+NdoApPGYiRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzgZB-007DpD-QE; Tue, 21 Dec 2021 14:56:37 +0000
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzgZ9-007DoB-7t
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 14:56:36 +0000
Received: by mail-qv1-f49.google.com with SMTP id ke6so12674178qvb.1
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 06:56:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=IfHUO6xtXv9Ts0W33bZQlQeeBuIG/rdx+gMNJR+vL2M=;
 b=5jThvyAMR6SZyy230FJsNo8Zey6eE7khIF9c2sg/aY7dDKZPhQOl+d3UM2+ff3ixWD
 b2c8cGFOWHcClR+tUpCAGxcaghUP9GFZ0nx45+SxPWvufn70DxzGLJeB5ic+qFZzWkCS
 7QeIEJXK1Y751nsW0bSPjPGfWhO+dj16aB//Q1ezKCtA4/7akzlaXcD/0RslvoAkY0TP
 QTQOjvRyQBQYkcTn18dsVASNwopJEsuWSn5Tu6/yeTDXRAZW079OJ/kF0dCuh/Kmywnv
 GI1DD8ZdYlQf8Kr6xnDwk81IRGpuNAeikprp1b7PWbDHqm93bXFmxRAwPc5Oyvgw/92+
 k+bQ==
X-Gm-Message-State: AOAM5317Dkk7eB6Ods2vn3suftFUnFMhkPjdkv+EMFM0vY90wGXc7ZvK
 xBLu1OFB1M/4l4Rvs88H8Q==
X-Google-Smtp-Source: ABdhPJzKvh6+eMR4c3h3MgNOzyuXugSjD5a43VT7csyUNrV/SxCwE64LUsGRc2BySZ7d5T5kol/K+Q==
X-Received: by 2002:a0c:d841:: with SMTP id i1mr2815831qvj.126.1640098594266; 
 Tue, 21 Dec 2021 06:56:34 -0800 (PST)
Received: from robh.at.kernel.org ([24.55.105.145])
 by smtp.gmail.com with ESMTPSA id k1sm13044520qkh.53.2021.12.21.06.56.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 06:56:33 -0800 (PST)
Received: (nullmailer pid 1403641 invoked by uid 1000);
 Tue, 21 Dec 2021 14:56:32 -0000
Date: Tue, 21 Dec 2021 10:56:32 -0400
From: Rob Herring <robh@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/2] dt-bindings: timer: sifive, clint: Group interrupt
 tuples
Message-ID: <YcHrIM9e+tSmpk8B@robh.at.kernel.org>
References: <cover.1639744468.git.geert@linux-m68k.org>
 <b2409de8943b56dfda2c972f4fe566a381be07a7.1639744468.git.geert@linux-m68k.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b2409de8943b56dfda2c972f4fe566a381be07a7.1639744468.git.geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_065635_310777_63AACC93 
X-CRM114-Status: GOOD (  15.41  )
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

On Fri, Dec 17, 2021 at 01:38:04PM +0100, Geert Uytterhoeven wrote:
> To improve human readability and enable automatic validation, the tuples
> in "interrupts-extended" properties should be grouped using angle
> brackets.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
> v3:
>   - Add Reviewed-by,

Did you? ;)

Reviewed-by: Rob Herring <robh@kernel.org>

> 
> v2:
>   - Split in two patches.
> ---
>  Documentation/devicetree/bindings/timer/sifive,clint.yaml | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> index b75fd6f982b1ecb3..3b25ec37d81159cb 100644
> --- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> +++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
> @@ -57,10 +57,10 @@ examples:
>    - |
>      timer@2000000 {
>        compatible = "sifive,fu540-c000-clint", "sifive,clint0";
> -      interrupts-extended = <&cpu1intc 3 &cpu1intc 7
> -                             &cpu2intc 3 &cpu2intc 7
> -                             &cpu3intc 3 &cpu3intc 7
> -                             &cpu4intc 3 &cpu4intc 7>;
> +      interrupts-extended = <&cpu1intc 3>, <&cpu1intc 7>,
> +                            <&cpu2intc 3>, <&cpu2intc 7>,
> +                            <&cpu3intc 3>, <&cpu3intc 7>,
> +                            <&cpu4intc 3>, <&cpu4intc 7>;
>         reg = <0x2000000 0x10000>;
>      };
>  ...
> -- 
> 2.25.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
