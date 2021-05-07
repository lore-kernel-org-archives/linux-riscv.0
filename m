Return-Path: <SRS0=6bm6=KC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B493CC433B4
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 01:15:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24FE2610F7
	for <linux-riscv@archiver.kernel.org>; Fri,  7 May 2021 01:15:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 24FE2610F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LdWYShqMakU+zhNPuJychNQT7KPdiPauRAMtQVpfXvU=; b=rG4C5W/XrnEBP1krcb8NPDAMY
	CCJgR/nc/lpGkqACnPyR7YyGuXEhF7f4YxECPJbsycNI73Pv9mlsQ8tKUKFkmQJmx3+kpKF9uP83j
	0TjNSrw4gCpk8FrWgMqFLv8w72EVi4Nuy9qHeOakGzh5TbD2YsQna3El3OJKXrw5rBrcdGzjtskKC
	FmX7szm/lx3mM12KRxVGY+iiqbsNjck4gSG1wiI9E4Xruam99zgs44rGZjPyT46jEn+0m/ykRMfUz
	9LEcCUump6k/uq2HA+4dnaRwlNXB3kFHyKabn0qUt0gZ7oXMXjAUyB/BndqgPNZrP/TGl7/Ys8Cio
	EA+V49KNA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lep4z-005jRb-2S; Fri, 07 May 2021 01:14:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lep4w-005jRE-HD; Fri, 07 May 2021 01:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=oEfCN0pfoA/qDroFhgTH+ere0rMR3Q9MSvHYsosWDl8=; b=wOqjF7YRUZ83rNs86OAqBVsOhd
 hDD7WhNiDI2Vsc8F4metKS80OaAUMHGGl9sQkfHkrbOTTc+/ihEOlSlxZYBkyrN9G79tsTuzGyHDl
 J9zLs+k8nxvUEy+havBXoGgGVllbPZP1W6BPgohiYMXp/7jR4qpHjND9DVh5vdppnrrgXrElOYmJj
 rPRJbPdGkyskHUOoJ+3s5xBJumD+29TYPmbW6cHYe9lasFFOWjb7yEvobXfgTkqYG/K6RDXEAoOp4
 qJDRUomwu6ZuVu8I6xI+aWyhyApL97UtEpNQONCCnYMwkaPhRKlEwPxXoPCNH/ZEcICJ6fawjyB6I
 RQOPw/yA==;
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lep4u-006VBy-2M; Fri, 07 May 2021 01:14:53 +0000
Received: by mail-ot1-f48.google.com with SMTP id
 r26-20020a056830121ab02902a5ff1c9b81so6598423otp.11; 
 Thu, 06 May 2021 18:14:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=oEfCN0pfoA/qDroFhgTH+ere0rMR3Q9MSvHYsosWDl8=;
 b=HcSyx4efPdGEQ0Wst9kC/vXaGTwr1S6vX3c2Bdb2CT2CyhphP8+jjIiw88GRvhlim2
 rw3QGEshUue6LI6UrOsu8s6NxQojAt/uRfZKg11GbM0hjCoC6q6ksEYnO9FmwTzmtbZT
 /zKe+0l6WXO2sH/hkORNTOq3X/lwi99lswTAFmxnIA030ldrYsu2nSiReOQFJnssofEY
 FSzQhGHD605WpwBLeqFGPy8XcK5OXYUJpJXJ2fzgkALay3Ebz2lmiTFZktRxUEs2p0zq
 pDwqxIgkm9cVCp6sFun0KYqQPp/2zLX9zGJ9qB/DDgpz2L4gzisygjodjyp1ezeVtvsp
 dBIA==
X-Gm-Message-State: AOAM530oxNYlE81Bo9c6Lc832AxyBUsDVyl8kN4bLQ6XIHGoFEPjQD2U
 1IsOYt7SfVCiZHiABpR6sCHp6TBFmw==
X-Google-Smtp-Source: ABdhPJwH6pLpfJTNIPyBF2g8fBrl9A07O+m3Rx4UXrIsglOnYIjflryN7rQAEjYLNNSULq8cGge4wQ==
X-Received: by 2002:a9d:7997:: with SMTP id h23mr6097466otm.366.1620350091104; 
 Thu, 06 May 2021 18:14:51 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f13sm948681ote.46.2021.05.06.18.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 May 2021 18:14:50 -0700 (PDT)
Received: (nullmailer pid 1127217 invoked by uid 1000);
 Fri, 07 May 2021 01:14:49 -0000
Date: Thu, 6 May 2021 20:14:49 -0500
From: Rob Herring <robh@kernel.org>
To: Zhen Lei <thunder.leizhen@huawei.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-serial <linux-serial@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-stm32 <linux-stm32@st-md-mailman.stormreply.com>,
 Rob Herring <robh+dt@kernel.org>, Al Cooper <alcooperx@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 devicetree <devicetree@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 1/2] dt-bindings: serial: Change to reference the
 kernel-defined serial.yaml
Message-ID: <20210507011449.GA1126886@robh.at.kernel.org>
References: <20210506132049.1513-1-thunder.leizhen@huawei.com>
 <20210506132049.1513-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506132049.1513-2-thunder.leizhen@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_181452_130511_7F713DB1 
X-CRM114-Status: GOOD (  11.85  )
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

On Thu, 06 May 2021 21:20:48 +0800, Zhen Lei wrote:
> The /schemas/serial.yaml from dt-schema only has the property $nodename,
> whereas the kernel-defined /schemas/serial/serial.yaml contains more
> useful properties, support for more complex application scenarios.
> 
> For example:
> 1) The property "current-speed" in fsl-lx2160a.dtsi
> 2) The subnode "bluetooth" in hi3660-hikey960.dts
> 
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  Documentation/devicetree/bindings/serial/8250.yaml            | 2 +-
>  .../devicetree/bindings/serial/brcm,bcm7271-uart.yaml         | 2 +-
>  Documentation/devicetree/bindings/serial/ingenic,uart.yaml    | 2 +-
>  Documentation/devicetree/bindings/serial/pl011.yaml           | 4 ++--
>  Documentation/devicetree/bindings/serial/qca,ar9330-uart.yaml | 4 ++--
>  Documentation/devicetree/bindings/serial/renesas,em-uart.yaml | 2 +-
>  Documentation/devicetree/bindings/serial/samsung_uart.yaml    | 2 +-
>  Documentation/devicetree/bindings/serial/sifive-serial.yaml   | 4 ++--
>  .../devicetree/bindings/serial/snps-dw-apb-uart.yaml          | 2 +-
>  Documentation/devicetree/bindings/serial/st,stm32-uart.yaml   | 3 +--
>  10 files changed, 13 insertions(+), 14 deletions(-)
> 

Thanks for doing this!

Reviewed-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
