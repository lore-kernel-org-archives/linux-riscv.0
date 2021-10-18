Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18C53C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 14:04:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6AC560FC3
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 14:04:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6AC560FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rMl9AWqLT0f4k4yd4+/NK7ZWiIRuXEcanKmW0wZX2HM=; b=aM8yAoRNXCyNbGgsWFc0BN+3tL
	NfSocJKeO1YhgBmnmOwqreK5rRjVOdLkF+mUtI0I9ECD3zzm49NB4ypVkOiufYi0iyytPDfAlT+Nq
	8rQ0T7qeIqpf6vqTVYDRzxC+FRTGK4V526M9auBmeDqbrHbbrSxToAbfT6j+R9csEs/lA1wflLjpy
	xlDy0HRHZI6ct8lbD7Z52ApM08YwY0yPAEAfzeQu0zf6DMQLm1/71NROys9QEp+/+/otKCIK0MYsO
	ILfhoJrRaezEw5FQARm8zkBVljdAW9fu3y/qvETtgWtv/pV7QQNPiy0wPf8W7HNthF8Ck6nz9XXLM
	qZ6CQCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcTFh-00Fyr4-3X; Mon, 18 Oct 2021 14:04:33 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcTCA-00Fxfa-Os
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 14:00:56 +0000
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id DA0003FFE2
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 14:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634565645;
 bh=hOmDJ63rwjyLjUsGk3cIxatC7VRnjyU/42JZ0Lta5uc=;
 h=Subject:To:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=kuzTUjBlNnQEpsc8mLzlNLtLydRQaaCFf93v/UAl41xYCSEtLxKZorEugDGCRMUva
 502KsqyWkHk+W52oGYuYAYW4rIJHk2LtelTzR/7Wf47bFWZKMST9yV4Dj9fK3/zJmd
 m54E+m0I/faC6vm4l48R3p+GVQmQUpMGhQwORRW575BJG/qumWuPkFJGPL6R3vFbI8
 jfe8maKegoyhO1EMllPxOKHrkVun1TAaTdJ+X2RN/9vY18kWZvq8/IMEj+XAGDyF+J
 8I9i0YUNz+/fk1+/BqVgcH9+dpqh+2yi4J4ZOvXPb5/84LDejm3q5Srvwy6PNaRlMb
 98UJjLBElby0A==
Received: by mail-lj1-f199.google.com with SMTP id
 s5-20020a2e98c5000000b002112895b3f6so1564298ljj.21
 for <linux-riscv@lists.infradead.org>; Mon, 18 Oct 2021 07:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hOmDJ63rwjyLjUsGk3cIxatC7VRnjyU/42JZ0Lta5uc=;
 b=h5NRnHuPuf4YoCzjleIV9P6MGSdzN8Mgn6gEH8XOIrvWZ8+r4jkqtzW98upEV2yxNf
 IxksQ/1J7GdK7RIJITLmzDlQfAG0pp/Tvp4VGx0lylI6IxxO4PegFSfC2XVJpdsViHED
 JIr6kOmItn/aAGXIEA85V6vREjEXup8oCkmzGFGjlL+NnHpHsvSa0N3TrWzcz/9v708I
 rWkkc6zFcq4UxWD5jdQGTct3rg7SPdDiTDLi1vQWHOxG0n80tpb5PmzbQ+Y46H7H7Dv3
 zT5/UEOEcCKEAlrIZMR0LibQHMVlzXRRBqc6XDiWbMijjGWlA+jb00iW5hfQn3UvQcf1
 ze6w==
X-Gm-Message-State: AOAM533IxWfMgQvyLeeaEv+vv9+xQ/p18Sp+BOMyUvbacxRH//j1kBo9
 dLpyglNVHqXRop9By/Kx5FhxIaODyzoOvaR3mcFmOl8p9jIUC7GO2bu9GJqc5d4EmeuL0xsTpPy
 /3GdvkR9CZ2KykoCzokqXcs7kjL6gYVVXhDPqtdE7jJVsoQ==
X-Received: by 2002:a05:651c:1589:: with SMTP id
 h9mr34118293ljq.151.1634565645378; 
 Mon, 18 Oct 2021 07:00:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGdsMC2+F7dPtQ5pAWFxgiy/MsdPyqcyjp+s7nAs9s60aNFddvh5hV8IScSftVcxS6IHnyDg==
X-Received: by 2002:a05:651c:1589:: with SMTP id
 h9mr34118264ljq.151.1634565645191; 
 Mon, 18 Oct 2021 07:00:45 -0700 (PDT)
Received: from [192.168.3.161] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id h6sm232919ljh.67.2021.10.18.07.00.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Oct 2021 07:00:44 -0700 (PDT)
Subject: Re: [RESEND PATCH v2 1/5] riscv: dts: sifive: use only generic JEDEC
 SPI NOR flash compatible
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <2b5cacd3-811e-fc4a-2257-19d968331825@canonical.com>
Date: Mon, 18 Oct 2021 16:00:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210920130248.145058-1-krzysztof.kozlowski@canonical.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_070055_138437_8FC035E9 
X-CRM114-Status: GOOD (  16.40  )
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

On 20/09/2021 15:02, Krzysztof Kozlowski wrote:
> The compatible "issi,is25wp256" is undocumented and instead only a
> generic jedec,spi-nor should be used (if appropriate).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes since v1:
> 1. New patch
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 2 +-
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 

Hi Paul and Palmer,

This set is waiting for quite a long. Do you pick DTS patches for Risc-v
or shall I send it to Arnd/Olof directly? I can do it, but it would be
great to have a confirmation of such merging path.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
