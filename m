Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461BCC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=upnWgkAEA7HIuuviBzMJXv9jQCl5nNOg4f2UJj1uHU4=; b=C/3y5n6iSS+Y5K
	PqMkKnEMRLu1mUIr+11v3DJyKamMrFLFjlZ+uNFFvdxDUEHFRB5FPbkRtrGBAnOzZCAisd2ye0KPV
	VdZ0mbdKqYlEskF2H5ubo9yRpJQcsjrp8nygPAr8JulDgt7zcpDxLJRcnMmOBhJp5zRiZcLmZapeb
	ptHURVhq9IoyXqSCPe2MIcLSWvZG1oW7+d62/Im8MmicJV2/sKDYOg6GHT8PBzIWRthyuJV96fKkf
	sdPjMB9L5tzxc4uYikilxNeuURY4FqfSPr2rYilIjnFqAVGyKED5UJs1JTXExwJ5ZjSioUag3Ii/i
	ib/jFBZfjtGlUbVCAuKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXoG-009m0i-Ae; Fri, 26 Nov 2021 09:46:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXoD-009lzt-Sa
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:46:23 +0000
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3FD7840A2C
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637919976;
 bh=PD2apBschJDaO+kzSdE0OsITDKBWNi5rIvaDGRk0lAg=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=DjtfGSPmI9fCdF16aD0CsEF9Xqct1AsMcW+M7dUIrYLKOaGDbwNV7P2HBRj2dUKDo
 sl7KfzCjNaiwKkFqX36K9K1yJDGi6GMOxsHsj20zFtW6OUz9k0CvPzLOoqGoi0lVDN
 U1Uz5XVXRBtJWOatBRj1F3XNPhnpJn/djSbrJFzM5RVi96DrYXnGYwJ21gE2lk4lrT
 mqYRBGy8AziC2Oi34VAs57w7bOKM1OPXi38YusrsDTtLRB431WVwIcuGsbSBcvm4gJ
 Lf1Ds/625G3kv/cDwh1X0/ffgg4/GqkGlsVIr9XXP0ULkC1OuJ3v7LnT3nRQT0pdNQ
 te2bZt6W5aQhg==
Received: by mail-lj1-f200.google.com with SMTP id
 p1-20020a2e7401000000b00218d0d11e91so2977543ljc.15
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:46:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PD2apBschJDaO+kzSdE0OsITDKBWNi5rIvaDGRk0lAg=;
 b=64Ou3Ji6NQok4r/4LwAjXKUhZWPqfmpdtadZn1AbhmeJOstbVrNIFRMr5AIiPNUzZz
 hSxy7++Z6FNEgJfC6FBGJ4BP/FAO8Sp+9TLLBKm+qkVH/C/O1lPJVt+6o4kuRBr1Qwdw
 No15a0TM7UAbVxmxxqMRgzeS1vgMjjOPxzSY5bxtUS0ofWCSeHoJEnjGIvD7J6+CzUYM
 w0iQyumlXz7DCbfP3T3B9slPIfU0sJyA2Do0ujppDt5P+Ov9/Vc12VSx1y19+KW2o+st
 G3ryMiNUvIABh84Ta16jK3OixK+tuj5ff/lkXY4WuGz9+0s2G2sdRZ9eb6CIWgVw7pD0
 KG4w==
X-Gm-Message-State: AOAM531hU5lkeU9UjHlSIhUx9ZelzM8orC73avfPFqp9b/TDr49ZYemj
 jEATnZX4oAHnlJejEuLT+Wu+YX+m5lh5q1FwIX2BIrN5oUtL0KkcCxw2DXVg41ZduwKw+ekBBjK
 CpYTEM0UVcZhotIYtfHiJiFOekDuEVXBxpZ4Tz1dQvpc4eA==
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr29454779ljo.466.1637919975726; 
 Fri, 26 Nov 2021 01:46:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzm5eX5c7jP2V75wFfuBpaqVzfprayBlyEwb5h3GH5D0e2xCpsSAd56ykLJnm4w7JR6n3LUog==
X-Received: by 2002:a05:651c:112e:: with SMTP id
 e14mr29454765ljo.466.1637919975528; 
 Fri, 26 Nov 2021 01:46:15 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 a29sm458536lfi.302.2021.11.26.01.46.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:46:15 -0800 (PST)
Message-ID: <8022b8fa-e636-144d-4e9e-7a0d23e354a5@canonical.com>
Date: Fri, 26 Nov 2021 10:46:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 9/9] riscv: dts: sifive: fu540-c000: Drop bogus soc node
 compatible values
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-10-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-10-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014622_175563_D5C8994D 
X-CRM114-Status: GOOD (  14.65  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> "make dtbs_check":
> 
>     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: soc: $nodename:0: '/' was expected
>     	From schema: Documentation/devicetree/bindings/riscv/sifive.yaml
>     arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dt.yaml: soc: compatible: 'oneOf' conditional failed, one must be fixed:
>     	'sifive,fu540-c000' is not one of ['sifive,hifive-unleashed-a00']
>     	'sifive,fu540-c000' is not one of ['sifive,hifive-unmatched-a00']
>     	'sifive,fu540-c000' was expected
>     	'sifive,fu740-c000' was expected
>     	'sifive,fu540' was expected
>     	'sifive,fu740' was expected
>     	From schema: Documentation/devicetree/bindings/riscv/sifive.yaml
> 
> This happens because the "soc" subnode declares compatibility with
> "sifive,fu540-c000" and "sifive,fu540", while these are only intended
> for the root node.
> 
> Fix this by removing the bogus compatible values from the "soc" node.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
