Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33400C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 20 May 2022 07:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=utGBj7d6yJ5XQ+HIXWU/CWChva3XNP/E7JAxd9KDzTg=; b=N5c/wDIiz9hPIa
	xyKNB4BosezCDFqqSkxulO9zTXk/E6FwFHPPsAjUHbHTe56g5OK7pp2l6lOK2CeISMB296ceafdBT
	pblmvZaR9h6k6eBfe/Dvg5mFC/gqJCAeqmlKLRxMLg/TcjUsS+9dsFkj/DIUxsqnkNmM+W0yvkLEl
	w4LaWMQArv4oFvjj1tEyfoDUnQmO/XWDuC5kL4dShujqvXWp5qYwpL21a69wuJ1jF7lABs+b7QYZW
	5l2L/sgo5ki0JomTVCJzehLPPNiDWFXYjrDTunnRjuCeQVnQIKigUrHgx7WS44uScV8Ds85UcQ+EQ
	9wmgpPZ1QrS4kI7Yg1lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrxTt-00B9jc-P1; Fri, 20 May 2022 07:55:29 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrxTr-00B9jC-H0
 for linux-riscv@lists.infradead.org; Fri, 20 May 2022 07:55:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 38DF9B8294A
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 07:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE928C36AE9
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 07:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653033324;
 bh=5PjNxWrAkE2aE9x3dsIS9yQLnElttOOmKVN4caatM7s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qbyzrSprqnbq46tDefPpYzM+NTVrUW5rIvgTJbph3SfpSXhg9Aj6ycFMp+2vpEWCr
 tb3GemDub8Jx164H0J118szakPOJHgnNMYzvZbuCqh9OqGvKtufjt4TsxBOUHqC+z9
 YZTXZ/5noMEGYCSgprz9YPg/mrBwZZWFpyn6JYL9PwEm28bIUwNJqSM8GH18tfwWb3
 EpPtccTi3TGdjcJ8+iPJ6sNhlN7K6amHyX2h0iX+5c3rA965fhrlrBqCp7Djr/+JBA
 GpuQvVouHZuJVIhklN7VTqvq3Hp9BhFgMeUfb3mvHKVAegfWsXpFm3H9mPqe6rqIGy
 oJGEYDgHAGzvg==
Received: by mail-vs1-f46.google.com with SMTP id a127so7643665vsa.3
 for <linux-riscv@lists.infradead.org>; Fri, 20 May 2022 00:55:24 -0700 (PDT)
X-Gm-Message-State: AOAM533mq5dhxAHRyvSjJru18p6TcOVbNSOcoP7fzEZinhN9E475HWl6
 jzKpja38P21arvXxbwneV/cUISh6dHGLObX2ECg=
X-Google-Smtp-Source: ABdhPJzoQJmEcg1f5gdVVGcKBbnvI29hx3yOXCHhpEX2KNC80TO+z8VUoQ3xCchExuHGPIQmGQV0Zg0tadzLdBEIJW0=
X-Received: by 2002:a05:6102:390b:b0:32d:5fc3:bd2c with SMTP id
 e11-20020a056102390b00b0032d5fc3bd2cmr3709471vsu.51.1653033323855; Fri, 20
 May 2022 00:55:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220518170254.3178923-1-heiko@sntech.de>
 <20220518170254.3178923-5-heiko@sntech.de>
In-Reply-To: <20220518170254.3178923-5-heiko@sntech.de>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 20 May 2022 15:55:12 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ0Ory_eXBfHAE7g+hdwPcC-h_41g_m=_v=e-HraOXPBQ@mail.gmail.com>
Message-ID: <CAJF2gTQ0Ory_eXBfHAE7g+hdwPcC-h_41g_m=_v=e-HraOXPBQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] riscv: fix dependency for t-head errata
To: Heiko Stuebner <heiko@sntech.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Wei Fu <wefu@redhat.com>, 
 Nick Kossifidis <mick@ics.forth.gr>, Samuel Holland <samuel@sholland.org>, 
 Christoph Muellner <cmuellner@linux.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>, 
 Christoph Hellwig <hch@lst.de>, kernel test robot <yujie.liu@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_005527_742612_4588C26B 
X-CRM114-Status: GOOD (  18.07  )
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

Reviewed-by: Guo Ren <guoren@kernel.org>

On Thu, May 19, 2022 at 1:03 AM Heiko Stuebner <heiko@sntech.de> wrote:
>
> alternatives only work correctly on non-xip-kernels and while the
> selected alternative-symbol has the correct dependency the symbol
> selecting it also needs that dependency.
>
> So add the missing dependency to the T-Head errata Kconfig symbol.
>
> Reported-by: kernel test robot <yujie.liu@intel.com>
> Signed-off-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/Kconfig.erratas | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
> index ebfcd5cc6eaf..457ac72c9b36 100644
> --- a/arch/riscv/Kconfig.erratas
> +++ b/arch/riscv/Kconfig.erratas
> @@ -35,6 +35,7 @@ config ERRATA_SIFIVE_CIP_1200
>
>  config ERRATA_THEAD
>         bool "T-HEAD errata"
> +       depends on !XIP_KERNEL
>         select RISCV_ALTERNATIVE
>         help
>           All T-HEAD errata Kconfig depend on this Kconfig. Disabling
> --
> 2.35.1
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
