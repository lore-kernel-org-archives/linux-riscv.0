Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A687C636D6
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 22:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8bQOHqOYAwy/qZUfYwNeqVtvIPEzCpHhNbMkJzJhUo4=; b=X2wHadjIrHsy4a
	a60Imuk+DgtaH6g8/3Es39K+YLuIvv33HlieYGrP8ci1ywjPq0ruwXgr3qc/6TWFI6LZUcDQOAyX7
	WP3u7CgurL/djI/jKXHFYK0WlNMsv7h56PwAlS1bVZAks+NY7QKSiQTwqHF4rF/7ORFrQzla50qrm
	8zHxuXCMOSRpjCldHdv0rPw+GZg88OGdWJQ8XiC2tVQ501NeP3VRCVetxn18O+TegHQGDepCJAAwO
	tQ6TectBHemS1T2hLYmfzkJwdMiaaMxqibxoNxoQNrtt4H1u990Fd3sVjYFxo85ZYI/EBo1iy/Ezv
	vfuh62eZLAzsnWQnOpSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMd5n-005j1j-8b; Mon, 30 Jan 2023 22:57:39 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMd5k-005izp-Ge; Mon, 30 Jan 2023 22:57:37 +0000
Received: by mail-oi1-f176.google.com with SMTP id s66so11413033oib.7;
        Mon, 30 Jan 2023 14:57:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ7g14V8k5qybxxkHSK9zkEaFegVOgO75+5UvvmJX6c=;
        b=Os5Xw83IpT4Y1CBvfNmPSE2/kCofv/I1w8X/em7UFkKC1D+R01TzvBv3IdMV7GtQTd
         EryBqPHr6B/l46HmYBR/6k66rbPyEO531ZExED6xA93PDUn7WNTcp8tPQiyrMa3zg7oE
         zvbxmDEhw3t+BQolo1b3qgcUAcBAmot+MJgTkv6Gnv7n9pN61Cc1R0STF/pS1scLZ5HJ
         FsuPn75x6nm4ptfsgNFOWJ4f5es9+5i+uoobl9zqZpGj+zfPa87SWFrL8E0QBPqUmoKa
         wEdcmU9dMulK098ExUxQ6jez52o66dYqNhk7gPWPpu8U/1jUwBnyUoG1jKRj5AaN9NPR
         taGQ==
X-Gm-Message-State: AO0yUKVjbzItWWlPrZStPa0uPxvcb/ih4m9OJ87DaNLuOfJLvVto64Qq
	qluD/XNgHT3N9LsE7uQIlQ==
X-Google-Smtp-Source: AK7set9cVNwIOuCSm7CYJEAFeX6i6670zCuQXg6lhroLXrXh9V0bAqVwdAAJEh/LEW4Y+P+TRBLMxg==
X-Received: by 2002:a05:6808:31a:b0:377:eec1:b3a3 with SMTP id i26-20020a056808031a00b00377eec1b3a3mr4073538oie.0.1675119446057;
        Mon, 30 Jan 2023 14:57:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id w25-20020a9d6759000000b0068bd20cf07dsm1788385otm.48.2023.01.30.14.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:57:25 -0800 (PST)
Received: (nullmailer pid 3679858 invoked by uid 1000);
	Mon, 30 Jan 2023 22:57:24 -0000
Date: Mon, 30 Jan 2023 16:57:24 -0600
From: Rob Herring <robh@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: 'Albert Ou ' <aou@eecs.berkeley.edu>, 'Conor Dooley ' <conor.dooley@microchip.com>, devicetree@vger.kernel.org, 'Jisheng Zhang ' <jszhang@kernel.org>, 'Palmer Dabbelt ' <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, 'Paul Walmsley ' <paul.walmsley@sifive.com>, 'Atish Patra ' <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 'Heiko Stuebner ' <heiko@sntech.de>, 'Anup Patel ' <apatel@ventanamicro.com>, 'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Document cboz-block-size
Message-ID: <167511944449.3679792.10367514567878106718.robh@kernel.org>
References: <20230130120128.1349464-1-ajones@ventanamicro.com>
 <20230130120128.1349464-3-ajones@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230130120128.1349464-3-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_145736_569843_69DE7BFF 
X-CRM114-Status: GOOD (  10.69  )
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


On Mon, 30 Jan 2023 13:01:24 +0100, Andrew Jones wrote:
> The Zicboz operation (cbo.zero) operates on a block-size defined
> for the cpu-core. While we already have the riscv,cbom-block-size
> property, it only provides the block size for Zicbom operations.
> Even though it's likely Zicboz and Zicbom will use the same size,
> that's not specified. Create another property specifically for
> Zicboz.
> 
> Cc: Rob Herring <robh@kernel.org>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
