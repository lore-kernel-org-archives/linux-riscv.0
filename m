Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 697B6C32772
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Aug 2022 17:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zluLC03oq/YiVIlrZWXBQcU+p2ci3hsP35M5AStXkXE=; b=gixLO1dGDY536v
	pZo6q3BNcpYM+W8hV63a4WEjxbnqy4FX8QFCJo+Dvah0xTtr9h546sgRpEBk4GDbDKPkAiJZHYbwo
	Jh5rr870UaQOa++9mUSFMohiuqXfOmDg4rS662pQZSWOFl+lEngw6Sw0Jynmbv9Ii6knz+MHIcKFp
	4tYiVMKHxdVRiZyKz5wftKj5+mv2RQ8Tu8r0qXLuc4tZzzy2cOdSXHWRNcg+3Q7O4eylWBHOv4h2d
	aDYaEfRYzMzmpVBmEhqOuniIWpjulePpJSHcrXYKR4hyeE8ZPRSAcs3x6aO9ERLxgyEBpEl5hzvZv
	AQihlq57HTcEWvhS/C4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0S7-005Kod-9C; Tue, 16 Aug 2022 17:34:07 +0000
Received: from mail-il1-f174.google.com ([209.85.166.174])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oO0S4-005Kmf-87
	for linux-riscv@lists.infradead.org; Tue, 16 Aug 2022 17:34:06 +0000
Received: by mail-il1-f174.google.com with SMTP id w8so2441877ilj.5
        for <linux-riscv@lists.infradead.org>; Tue, 16 Aug 2022 10:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=ocfp5I9qK0ctx9cDxA5y/IUHuXfnD9Ka2G82jMVWFSc=;
        b=IcM10KA9ApYhSpoSJkThjrhcLNT0HjH/cn2JFlYVceKA18Xi/BRjaSkIBm5uaWqHHZ
         imHwr8NK+lfWcXqnWDWBVDFlwDqz7cRFdZy+OQJYoGMRLT3/plAonnNMFephJfFYQOjP
         fZed4lnkfQaKMcYYbvBv6gj2SDovurAgpe9aqcYgJxzS528cd/MQHTwBSGow0UBf6b/A
         vJatPKh7czqwBrZnuIw9oqAYxMSyuLr631qtYEyWz7ptVDOlC+fKNj7s7t1cvCJMBHGb
         POYvyFZkOkmhB983DXleLVTaUi6MiXbZv5v2QH5cTPmGk4I6TmMDRG4w7EjV7KZB07Ym
         XOig==
X-Gm-Message-State: ACgBeo2K+y1QwRJFCQjbziPdd+NCtNz0X1QK+xrFlQ9nhjumMRLokRHA
	jKBo86Dub/XqXDlZspfCyA==
X-Google-Smtp-Source: AA6agR4j3pIZz7KH8vmLyJaoyp/zdHchsnP+VUwuYzNv9GLi6f5Yj8ZmNmusErup5y9k+atidjnVGQ==
X-Received: by 2002:a05:6e02:20e9:b0:2e5:e584:d616 with SMTP id q9-20020a056e0220e900b002e5e584d616mr3358602ilv.236.1660671242323;
        Tue, 16 Aug 2022 10:34:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id b16-20020a05663801b000b0034602e741f0sm2976099jaq.67.2022.08.16.10.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 10:34:01 -0700 (PDT)
Received: (nullmailer pid 2424370 invoked by uid 1000);
	Tue, 16 Aug 2022 17:34:00 -0000
Date: Tue, 16 Aug 2022 11:34:00 -0600
From: Rob Herring <robh@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Chen-Yu Tsai <wens@csie.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 02/12] dt-bindings: riscv: Add T-HEAD C906 and C910
 compatibles
Message-ID: <20220816173400.GA2424313-robh@kernel.org>
References: <20220815050815.22340-1-samuel@sholland.org>
 <20220815050815.22340-3-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220815050815.22340-3-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220816_103404_325996_0A0CAD80 
X-CRM114-Status: UNSURE (   9.82  )
X-CRM114-Notice: Please train this message.
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

On Mon, 15 Aug 2022 00:08:05 -0500, Samuel Holland wrote:
> The C906 and C910 are RISC-V CPU cores from T-HEAD Semiconductor.
> Notably, the C906 core is used in the Allwinner D1 SoC.
> 
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
>  Documentation/devicetree/bindings/riscv/cpus.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
