Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9620C001E0
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 11:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bz0eJN4BvJQmPR4xNPlzesu1QUFDGLrQ7YsTX+Map/k=; b=BD9mzzjGaZ8eBr
	qeJf8cyk7wAa9gnhfeEG+MSogh4849dzWPYy9ds4AOS+zSW5zeLqYzzejd17iHQa8kHT/SZk3FsO3
	gLkYYtbLDt0R9ylNR8RzZSxXEv/zPft1VnsaolT50Teg94oH0e/BKdIq86VIvpbuwiJq9uI/6dYm1
	qjZUp3XxlZIvkrDRogTBdqoStaEF/YSFkIiEIx02gGBeP0MQ3jDB7gbMkmXzG5mCunkn+VZ3yzeeb
	r1wv0P/jvJAHJ0CjwQSR0l3Gs44y4svsF4fE4pNS1VQbPN8GzrMwlm0Oup0uKWE3zHPCHnFY5hRrc
	FitNyRfI6JAXp4FedbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3qR-007RJ4-33;
	Thu, 10 Aug 2023 11:28:47 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU3qN-007RH6-2z
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 11:28:46 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DC0393F534
	for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 11:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1691666919;
	bh=TRU6tUd9wDUUaUwwFM5Bjzb7u7hecXj9L7oTyXsIeCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gahCg0U//OpH467uyTYbpPwW+xT21/XeXApKwcAzDb7l2nYk57GAjXMih8fumWoxn
	 244tXaiBhWbf5HGCLd3W4vV+52aay/QqHxqzCPTBttUUwn7uJKtTAE2VT9TNE6UJgD
	 lqTnciBtpup+jVt8f19VnqsOOSkhJLIXzLhjsntD2rOljzOsW3i+H5u2r5NW898w7S
	 T4zK8NAyDxBmM5Vfi2BPKXl5gZ97Vo0ERot+srGE+LrR8gnvkdcTOFBD9EcMdJMC40
	 95lB1Ug7pZ8+p2nxloem8y7Z1K5WPE3VihO6BiXNsOcTXBOZaE3bERDQLXjqUC1gAI
	 DQH6uFElw5P1Q==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-40fdb989957so10943851cf.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Aug 2023 04:28:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691666919; x=1692271719;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TRU6tUd9wDUUaUwwFM5Bjzb7u7hecXj9L7oTyXsIeCA=;
        b=FaqPIuKL53cYWvTIfedzqRE5ua3dJ2J8CJppBc9zKUeSTusZChIPlzBH4WGBa5LbQX
         rhxTtGAMRpNE8bi3xMEYKdU/GLQCHMY6Fc0ji6D5tBKbvL/3cFVp2VNS37MxdomZ/f2I
         yJcJN6WwEhzYZOEyJMW9ZnXTMnVN9qsa8nqNUkquH57fOUIudchtkuJMBUzXIg1SUjlE
         IQBJbTbTvbjAWmK6e5soaChk5I539lYxkGRO3Mxh1LHUDi5QmBPxy3JyhUPvnquKzgPd
         56jc/lafBMS1zCAJaLj+CwUUqMes+rkJ7M3vY9csPGUUCDfXTe9xE3upsBEAzkS0+bEU
         hZVA==
X-Gm-Message-State: AOJu0YwzeZ9sMm7k1GJtqLDXz+EbgycOEAtsNGD9mF9dQv77QyZrDapd
	Q4HR2A4d5XIq2gjfqJDql7zgmY6j8wAoQ0ZHHoUtF4bImYZwoxT3Z0w+YFNHd7DIHG/IFGNS2ME
	uMdDlEVAB48YyaFsk/U+xfumwQ1YdmRtlnVCK8D/D7eHYmfT9tcJC/I5HQbc9sA==
X-Received: by 2002:a05:622a:2c1:b0:40f:c669:a130 with SMTP id a1-20020a05622a02c100b0040fc669a130mr2947888qtx.36.1691666919043;
        Thu, 10 Aug 2023 04:28:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnvFC2HPaIsW8TudoAo6get1aLdMx0txncY0jSPizTM4n+QIRlX7JcQnvFJl+u+M8NbZE3G+EzISNoXnySSB8=
X-Received: by 2002:a05:622a:2c1:b0:40f:c669:a130 with SMTP id
 a1-20020a05622a02c100b0040fc669a130mr2947865qtx.36.1691666918799; Thu, 10 Aug
 2023 04:28:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230810074646.19076-1-samin.guo@starfivetech.com> <20230810074646.19076-2-samin.guo@starfivetech.com>
In-Reply-To: <20230810074646.19076-2-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 10 Aug 2023 13:28:23 +0200
Message-ID: <CAJM55Z_AKXa-cKy8kS4-8XPcqgFb4ts2ywhcWwL7Nf3wMBCWJA@mail.gmail.com>
Subject: Re: [-next v1 1/1] riscv: dts: starfive: jh7110: Fix GMAC configuration
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_042844_381498_D3DFE7D1 
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

On Thu, 10 Aug 2023 at 09:46, Samin Guo <samin.guo@starfivetech.com> wrote:
>
> Fixed configuration to improve the speed of TCP RX.
>
> Before:
>   # iperf3 -s
>   -----------------------------------------------------------
>   Server listening on 5201 (test #1)
>   -----------------------------------------------------------
>   Accepted connection from 192.168.1.4, port 47604
>   [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47612
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-1.00   sec  36.3 MBytes   305 Mbits/sec
>   [  5]   1.00-2.00   sec  35.6 MBytes   299 Mbits/sec
>   [  5]   2.00-3.00   sec  36.5 MBytes   306 Mbits/sec
>   [  5]   3.00-4.00   sec  36.5 MBytes   306 Mbits/sec
>   [  5]   4.00-5.00   sec  35.7 MBytes   300 Mbits/sec
>   [  5]   5.00-6.00   sec  35.4 MBytes   297 Mbits/sec
>   [  5]   6.00-7.00   sec  37.1 MBytes   311 Mbits/sec
>   [  5]   7.00-8.00   sec  35.6 MBytes   298 Mbits/sec
>   [  5]   8.00-9.00   sec  36.4 MBytes   305 Mbits/sec
>   [  5]   9.00-10.00  sec  36.3 MBytes   304 Mbits/sec
>   - - - - - - - - - - - - - - - - - - - - - - - - -
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-10.00  sec   361 MBytes   303 Mbits/sec        receiver
>
> After:
>   # iperf3 -s
>   -----------------------------------------------------------
>   Server listening on 5201 (test #1)
>   -----------------------------------------------------------
>   Accepted connection from 192.168.1.4, port 47710
>   [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47720
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-1.00   sec   111 MBytes   932 Mbits/sec
>   [  5]   1.00-2.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   2.00-3.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   3.00-4.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   4.00-5.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   5.00-6.00   sec   111 MBytes   935 Mbits/sec
>   [  5]   6.00-7.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   7.00-8.00   sec   111 MBytes   935 Mbits/sec
>   [  5]   8.00-9.00   sec   111 MBytes   934 Mbits/sec
>   [  5]   9.00-10.00  sec   111 MBytes   934 Mbits/sec
>   [  5]  10.00-10.00  sec   167 KBytes   933 Mbits/sec
>   - - - - - - - - - - - - - - - - - - - - - - - - -
>   [ ID] Interval           Transfer     Bitrate
>   [  5]   0.00-10.00  sec  1.09 GBytes   934 Mbits/sec        receiver
>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index a608433200e8..76884cf373bf 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -318,8 +318,8 @@
>
>         stmmac_axi_setup: stmmac-axi-config {
>                 snps,lpi_en;
> -               snps,wr_osr_lmt = <4>;
> -               snps,rd_osr_lmt = <4>;
> +               snps,wr_osr_lmt = <0xf>;
> +               snps,rd_osr_lmt = <0xf>;

nit: this is a limit, so presumably counting things and not an address
or bitmask, so I'd prefer decimal numbers here, eg <15>.

It works fine either way, so
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

>                 snps,blen = <256 128 64 32 0 0 0>;
>         };
>
> @@ -839,7 +839,7 @@
>                         rx-fifo-depth = <2048>;
>                         tx-fifo-depth = <2048>;
>                         snps,multicast-filter-bins = <64>;
> -                       snps,perfect-filter-entries = <8>;
> +                       snps,perfect-filter-entries = <256>;
>                         snps,fixed-burst;
>                         snps,no-pbl-x8;
>                         snps,force_thresh_dma_mode;
> @@ -870,7 +870,7 @@
>                         rx-fifo-depth = <2048>;
>                         tx-fifo-depth = <2048>;
>                         snps,multicast-filter-bins = <64>;
> -                       snps,perfect-filter-entries = <8>;
> +                       snps,perfect-filter-entries = <256>;
>                         snps,fixed-burst;
>                         snps,no-pbl-x8;
>                         snps,force_thresh_dma_mode;
> --
> 2.17.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
