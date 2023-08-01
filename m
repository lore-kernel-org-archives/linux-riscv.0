Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF07AC0015E
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Aug 2023 18:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+Z/v1lcDw6RCfWkDXaaYbejsFJpqf1gsGYnWSh9Zpg=; b=nAcKvRvq2HcU+k
	6lInrNpEAIZPGdWWszMocofDsauKCLPL9xJewO0GZtffFxrFtZ7BbqSfc/5MzqntD4E52ycojCzSw
	4kS4/74TwR84BCks2KSaLhZ30nGDLh/2UHPaOTWN5YjmKMwjpK1jcAM4NOoApMyHHL3TI3iorHqWc
	MwT8yjGWLve+Skm7KIRdc3aVxH4ihuZvT25CbWJJsC+VZsU958oXx77iF/pp7aEQSY2tcDHidI24m
	fEZK81jbkJ9QAfypugVQqZUVA4GOEHa3i34qTBZl9QUMBPQypK5IeM1X8cY9oEFy3ggncll6cXVbb
	Jp4tG13/7me/NXY9aD8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQuXC-0034zn-2i;
	Tue, 01 Aug 2023 18:55:54 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qQuXA-0034zE-0r;
	Tue, 01 Aug 2023 18:55:52 +0000
Message-ID: <6286077f-bd7e-8a78-deca-3442bd987ad4@infradead.org>
Date: Tue, 1 Aug 2023 11:55:50 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 v1 1/7] MAINTAINERS: Update starfive maintainers
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Cc: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sumit Semwal <sumit.semwal@linaro.org>, christian.koenig@amd.com,
 Bjorn Andersson <andersson@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Shawn Guo <shawnguo@kernel.org>, Jagan Teki <jagan@edgeble.ai>,
 Chris Morgan <macromorgan@hotmail.com>, Jack Zhu
 <jack.zhu@starfivetech.com>, Shengyang Chen
 <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-2-keith.zhao@starfivetech.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230801101030.2040-2-keith.zhao@starfivetech.com>
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



On 8/1/23 03:10, Keith Zhao wrote:
> update starfive maintainers
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  MAINTAINERS | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3be1bdfe8..daadd1707 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -6760,6 +6760,13 @@ S:	Supported
>  T:	git git://anongit.freedesktop.org/drm/drm-misc
>  F:	drivers/gpu/drm/udl/
>  

This new entry should be in alphabetical order (hint: it's not).

> +DRM DRIVERS FOR STARFIVE
> +M:	Keith Zhao <keith.zhao@starfivetech.com>
> +L:	dri-devel@lists.freedesktop.org
> +S:	Maintained
> +T:	git git://anongit.freedesktop.org/drm/drm-misc
> +F:	Documentation/devicetree/bindings/display/starfive/
> +
>  DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
>  M:	Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
>  M:	Melissa Wen <melissa.srw@gmail.com>

-- 
~Randy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
