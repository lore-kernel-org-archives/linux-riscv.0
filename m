Return-Path: <SRS0=z0LS=QD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E9B0C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 11:04:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 508CA63222
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Nov 2021 11:04:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 508CA63222
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Df3pJjWj1CKqQj4NqX4IzP46iI1blGm7RJ2g5lUpIok=; b=i0SAE+xWxfFBRY
	U1vrLVe/ixEh8MzEw+bdQ+ZF6Rw0QdqiXxRNatyUUZlXTTvYnjwVOEfYDkWp8/c4mxIZJzA3U98Qz
	NkqhNarJZOpCEo9teEeLSjSOiqaInChqYRgSFoieBjKwT7UuF2SntLAWWi4H4eoQXmy3BpaDW5Uk7
	p6ullvkVVRo4shbux4RXvKgrwleaACRiVUns8XnRmQcpk7RqaRY7NRAAZKeYZ3OZinIhxFrcRWSBd
	XdrByNieOqPTBzMwXUCeJubrGjEwN1gm8ByyyDXMMhJepnHnlTYyCUGWGq0/yT9rpekGxExIgcyej
	9yMrOL/QzMm/XuwGoDJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmwGN-001K2g-8W; Tue, 16 Nov 2021 11:04:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmwGK-001K1r-PW
 for linux-riscv@lists.infradead.org; Tue, 16 Nov 2021 11:04:30 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5E9423F1A2
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 11:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637060667;
 bh=bd/U/oRwjQmdvpZocDSS6S8UbyaPfaAFv6cbOhCrjwk=;
 h=Message-ID:Date:MIME-Version:Subject:To:References:From:
 In-Reply-To:Content-Type;
 b=lhJzfvve+52ddVzNah2DKS4ZqG775igkvfgKtHZaqEVBnWDyfxabXJl3l45b6wSeY
 rbl/RHnACejr1Nb31WjRuXQ6TSCcMnaitN3/yCdCg+ThiMc5c6k6nqNW3R0EBbwEnj
 quhR3xGrcvNdP4So2vYs8s+39+o3Fp07graFpM/EYlz4Cr6brfgxzl8FlARnsCJe1R
 1Gxo51YNm+WPRucnuMVTjAbnDJ3gjj4Y/eRceyuqVkiDF/NRdioQfcON3T8ybYUo2H
 1N4I3mfiy3pYQzwebnMLZMsf47nTd9+T1Ig1qalnwvZtsZP1ZmN9rvOG+Syghnc5zR
 TjnhKV466/w9A==
Received: by mail-lf1-f72.google.com with SMTP id
 c15-20020a05651200cf00b0040524451deeso3606348lfp.20
 for <linux-riscv@lists.infradead.org>; Tue, 16 Nov 2021 03:04:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bd/U/oRwjQmdvpZocDSS6S8UbyaPfaAFv6cbOhCrjwk=;
 b=kEGYcHOJWwMk029fNXD/Gh76yZf2HvaBQRe4CxEcQoQHigqYnyup57lHiR5v9bJbpO
 Sg6g/vGKrD3yt3is8uQ6eybdss/DA2Iohr2hE+dwKYsIBVSDuB5NP2Y7curTexqZNYW8
 MYGBwGeHK8IKyCfmXE1SPUV1ujJkb+aZcsT2Wjxs4//VPqYSDFbjgP40KSlFFdl7GjAr
 vrue0VepoXBlkmsS2iZlAcHvSfhgzxlpzmk2bpuwEW2HdkR8n8Rp+ArsMM+E/IAf5PQH
 5/gvnZ0F4TzJaX7EcNgW+0NfriEvyI1XPcYv1eSfXxpHMgv0UB/6/Alc5576/+TyM6E0
 R2PA==
X-Gm-Message-State: AOAM531zUZP8zEPtMsLv86IHhQtNn+eHAxcgkzEzBWC+V1B3dI7kYOQD
 OSqCfXiymicA1xTfRhDx9U2brCE2SlaCsXx+WH+2VMkuBAUdwVGN3XTl1FEVytjZimkMSMY7ca7
 EZwDYzOpo9/xt1/ZFxN5V6Nrp6irI2Ux60qu7TI1zZT2W6g==
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr6002320ljj.506.1637060666735; 
 Tue, 16 Nov 2021 03:04:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw3ZYxUSFJRJ5iP/OKHvrIDa1zcy8UEUVBHT/gsOdQTDQkeqm/SrTdZ4qxtY7sZdQaUPhlyxA==
X-Received: by 2002:a2e:9c58:: with SMTP id t24mr6002284ljj.506.1637060666538; 
 Tue, 16 Nov 2021 03:04:26 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 b22sm1915106lfv.20.2021.11.16.03.04.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 03:04:26 -0800 (PST)
Message-ID: <842021c3-b199-8917-6354-93b396c2541a@canonical.com>
Date: Tue, 16 Nov 2021 12:04:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] riscv: dts: sifive unmatched: Link the tmp451 with its
 power supply.
Content-Language: en-US
To: Vincent Pelletier <plr.vincent@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Qiu Wenbo <qiuwenbo@kylinos.com.cn>, Yash Shah <yash.shah@sifive.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 David Abdurachmanov <david.abdurachmanov@sifive.com>
References: <f6512cc50dc31a086e00ed59c63ea60d8c148fc4.1637023980.git.plr.vincent@gmail.com>
 <d04daf5956ad61496188c7aee3d2eb958e34d7d2.1637023980.git.plr.vincent@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <d04daf5956ad61496188c7aee3d2eb958e34d7d2.1637023980.git.plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_030429_007901_BF6F564B 
X-CRM114-Status: GOOD (  13.73  )
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

On 16/11/2021 01:53, Vincent Pelletier wrote:
> Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>

This needs commit description, explaining what are you doing and why.

> ---
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index bd6e90288c8a..73c1e4adf650 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -59,6 +59,7 @@ tps544b20@1e {
>  	temperature-sensor@4c {
>  		compatible = "ti,tmp451";
>  		reg = <0x4c>;
> +		vcc-supply = <&vdd_bpro>;
>  		interrupt-parent = <&gpio>;
>  		interrupts = <6 IRQ_TYPE_LEVEL_LOW>;
>  	};
> 


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
