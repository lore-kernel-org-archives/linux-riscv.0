Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EE37CD4847
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 16:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XjN62pDzS8dfAV5FVuXrOUCLuVigrsQFOiKbuqTZSc0=; b=DD0JpUvToOzPGWBmHzPbjR4mZ2
	2ZKEPX9QvtWzP70Ju6qN4vgu6mmaYnDxTJcfDBNgFX8ktx7NvnEJijBGwJ1a6DNMvkLJSNOkbgc+0
	SaoDUEQde5irOyB6xAhLVeh/WtbOBJUxnFUrPgqY+LdsqU2A3XCuIw4IqmSEf/WLGCcnuFU53FbLD
	XjedYRnSSSyH51XFmI3r9yptx3Xd2YN51+FGiYX9zQu+P3MSwqtjR/3aipbfc+RunF1ZUGEVn6XHZ
	G5M/KxRxV4l8tv1csz86Gh/ENBsOPHy8iqzabndvKkHG6Ty5Tw6RRq9Ytm16jW8dodLqeqUGOGvc8
	bhZDjydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjj8c-009QCt-1l;
	Fri, 22 Sep 2023 16:36:18 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjj8X-009QAw-2a
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 16:36:17 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5F5AE421CD
	for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 16:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1695400569;
	bh=RKbV4MhZk6b87JTksm1ZK/ObuKYUjj6Uoe+MaWe9BjM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=axOpRfO6PfpGE2I6/iuXN+52W8z6r6OeH/Putaats6zPZaj53Dvhp17aXUAxdRWu5
	 ARyhyDJlAy011T75vqdIstcXohjwNuE9NJ9/BpiHYEW6ha3abGBvVcGCHJrWuavJEa
	 jVYe0AFjuoVvx7rU67/b4DN27aK83U1cNEBEeDRWRyuYHn+7gH2sRxc2z1I80LH+w4
	 viJhXqHe8vZHK1y2X6YfIaMHNjgvb5z4BKvbwJEUxts/BsRziTfGT+cOzHhaN6vJ6f
	 woJCMZ/C4mmJlSBFEpZYV+aM8kPzQg2knJFvvu+u4XUy5/WwCXGt8G6f369VYTh8dD
	 ri+78Vh6Q3YJQ==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41425c708ebso24863621cf.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Sep 2023 09:36:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695400568; x=1696005368;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RKbV4MhZk6b87JTksm1ZK/ObuKYUjj6Uoe+MaWe9BjM=;
        b=oSsUt1HZwJbOky6HONaC4MmN09/ph71Lj4QnaB/RDvMyrmiZTV0QfYu368YBVLjxah
         EZ+rc5pWvKocmtZ9scwxQXQF86s37O+2bu8AaCD3ojuF5DLLU1obgHc/ZRelF5zbVrTd
         jVA9c/OBXremus3e2VPLcFwfN8nZNP5HSB5TOBet+F48SqT8mpvhzksLFPkEpFweSprf
         bGOYZEM15BvPBAP+1ltV4k6TVI44hYnKQqnt83mPk7yV19hx6i717GPeEdYFJSIXYJxI
         wvdiLTtY1ldFwOVbg04q0kxZHt8C4J5xqA/6/nFrPe7nBG0eZcWMeXFmP+6rQ4VtLdDg
         +0Xg==
X-Gm-Message-State: AOJu0Yx0qpEOX2F3N2i4olGXI1ZhagxBW72DeoTUU0lsRjtVkKR9KRUB
	xRemngJ4BR3WhrQOu6j9CQiM3aENbbiQNSynDVoMg0716V5lADw8z5cOe/whUsOxuRJXRByCSaZ
	qEUPnXjlWNlqq9m2hS9p/S2iNEw5OCzMst7rEMNxgQkGGRzlZvJ87237bpL1Zs0ocJiexFw==
X-Received: by 2002:a05:622a:1a9b:b0:400:9c4e:2abe with SMTP id s27-20020a05622a1a9b00b004009c4e2abemr9153629qtc.13.1695400568108;
        Fri, 22 Sep 2023 09:36:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtMOJCOBegPGfmaYPe4P541XIPb9WGKoNNQRopHdNvUyr6IlUhMeHDT069xvrKjurwJHkDV/lgU//1vjPUCGw=
X-Received: by 2002:a05:622a:1a9b:b0:400:9c4e:2abe with SMTP id
 s27-20020a05622a1a9b00b004009c4e2abemr9153614qtc.13.1695400567857; Fri, 22
 Sep 2023 09:36:07 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Sep 2023 11:36:07 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20230922062834.39212-4-william.qiu@starfivetech.com>
References: <20230922062834.39212-1-william.qiu@starfivetech.com> <20230922062834.39212-4-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 22 Sep 2023 11:36:07 -0500
Message-ID: <CAJM55Z-huG6KSLywzA0Zih=MtzqvL0w+CxrqN7CKUrzor_A65g@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] riscv: dts: starfive: add assigned-clock* to limit frquency
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-mmc@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Jaehoon Chung <jh80.chung@samsung.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230922_093614_230000_0139B23D 
X-CRM114-Status: GOOD (  11.56  )
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

William Qiu wrote:
> In JH7110 SoC, we need to go by-pass mode, so we need add the
> assigned-clock* properties to limit clock frquency.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>

Thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d79f94432b27..d1f2ec308bca 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -205,6 +205,8 @@ &i2c6 {
>
>  &mmc0 {
>  	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO0_SDCARD>;
> +	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
>  	cap-mmc-highspeed;
>  	mmc-ddr-1_8v;
> @@ -221,6 +223,8 @@ &mmc0 {
>
>  &mmc1 {
>  	max-frequency = <100000000>;
> +	assigned-clocks = <&syscrg JH7110_SYSCLK_SDIO1_SDCARD>;
> +	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
>  	no-sdio;
>  	no-mmc;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
