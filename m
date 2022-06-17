Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE19BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 21:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+UzEsshVz8w3FGllifYp0Ap60cpM37KWK3ZEb7X7Ec=; b=DPuGVfDZ+ouVEO
	GkvfI/ReATyxOZBkpiM9+S0EcPkumR6AA8wvLb5bDHeH5cer1nATUofGyfgjqbYoQFHKDWLh1oj9G
	9XPrvbyBzjdXGO0CZOaiBeQrSC+EbbcMs8kI2k3SajHdjavO+7U/Bva4vLT24+9SROq+80S9byLeW
	iIEcMzO3Wh1mzk4SRUBXUSe5Lh8hQyGUvgr9QIRQVjZbIS2OIFX3cPmUX4VhIQt3yx5IbNEOm2fPn
	wVxGFyoVDCv3C+wISHCBXvbbouVg0VxkR2UQdGQVK2yncaXuX8T81Du6Ri3w2VQxmjOstvLny+17j
	jb0pMaaw9LefJFUFeZDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2J8W-0097RU-5K; Fri, 17 Jun 2022 21:04:12 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2IiS-008ygR-Nw
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 20:37:17 +0000
Received: by mail-il1-f169.google.com with SMTP id l14so3719289ilq.1
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jun 2022 13:37:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lIp97u+lxIFSYVVpClAb3I0MjJEMZHlf6DTQj2ciqMQ=;
        b=caUxGi8Z03flbyoLcGy8WnVWIVCrPnsQ4FbjVQ2vfgyqG+1R6crxJUzAajqmpU6VSt
         ooVDGTeTWPa06f4LgrsZ4He75x7ee8ZTne6r2Iqt5EWUqoyskezRn03Utefh3SEtDwrB
         X5cEWW2wSigaWBfxDvNBo91o5mxmjQd05igTVTjK7mdX8RRGh4YZJVeF2+EjG5pdcZyn
         9KrCT7elwFGow9BS1wTCChh0eLFoWUoyuQMo2Pr6LDJAzYVA2qaHnfEvnJUZEC2AUTO5
         yw1dJbuHcX+aUnGQTdtLM/tRmoqIX3vJf/E3RNDkXdsLWfUp5epBr+j9JCRhf4ZZiqfO
         j3VQ==
X-Gm-Message-State: AJIora8k3w5Rajzadi1NwBR3edRK95xc7iujTd3e2d8JxtW13k9VzGAG
	U4EAu7fA5pcOC1Y58KH02g==
X-Google-Smtp-Source: AGRyM1sx3PAL1Quk/UBT8qbGkhruHp0QZRIVk9eb+fOx7gKisQNd9qR7XfPmFzHc6UxEQMX9edQw/g==
X-Received: by 2002:a05:6e02:184a:b0:2d3:9f38:138a with SMTP id b10-20020a056e02184a00b002d39f38138amr6187322ilv.124.1655498232872;
        Fri, 17 Jun 2022 13:37:12 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id q20-20020a02a314000000b0032e9bf3b973sm2654013jai.5.2022.06.17.13.37.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 13:37:12 -0700 (PDT)
Received: (nullmailer pid 2400596 invoked by uid 1000);
	Fri, 17 Jun 2022 20:37:09 -0000
Date: Fri, 17 Jun 2022 14:37:09 -0600
From: Rob Herring <robh@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: wefu@redhat.com, robh+dt@kernel.org, atishp@atishpatra.org, krzk+dt@kernel.org, hch@lst.de, devicetree@vger.kernel.org, palmer@dabbelt.com, cmuellner@linux.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org, samuel@sholland.org, philipp.tomsich@vrull.eu, mick@ics.forth.gr, drew@beagleboard.org, guoren@kernel.org, linux-kernel@vger.kernel.org, anup@brainfault.org
Subject: Re: [PATCH 1/3] dt-bindings: riscv: document cbom-block-size
Message-ID: <20220617203709.GA2400541-robh@kernel.org>
References: <20220610004308.1903626-1-heiko@sntech.de>
 <20220610004308.1903626-2-heiko@sntech.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220610004308.1903626-2-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_133716_835208_0A0DA9E5 
X-CRM114-Status: GOOD (  10.33  )
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

On Fri, 10 Jun 2022 02:43:06 +0200, Heiko Stuebner wrote:
> The Zicbom operates on a block-size defined for the cpu-core,
> which does not necessarily match other cache-sizes used.
> 
> So add the necessary property for the system to know the core's
> block-size.
> 
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> ---
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
