Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A96DC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Nov 2021 09:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sn+6uky1Gbm9/5NrvXCLN3m0fsfg8hJVgvQieRoyxCY=; b=qInG7K6qmazgkv
	T881PVcP+qAxR5biwagzIcF3/pwQGO9A7qFHZFlccn+CXo9Hngx3uPTUsmfN8SbyENYzfZAO1CvV5
	snQ5fgkNPQrZ0/dKzr5ND5+YKnb7olhj+sBc+yzfZlYL5driAi109TsOFdXArsuRjpiKP1tmoMlLM
	Rt6AQz1n2ou3PfQDzC1zogKD00XxA8sxhXqC3u0Aquif31jH+hvrwVLdHyA01UqVGzmKoFfX476n6
	itD7vp3PcBbDLL7ws7pogTDOhzKAs3OBUe4/EnvJ1ozpB2dVS5oajSJ7tkCpNKL7+/dreRObdkU8f
	i9fU50jDEgCp/Bs4+rvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqXqA-009mdW-NG; Fri, 26 Nov 2021 09:48:22 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqXq5-009maY-H8
 for linux-riscv@lists.infradead.org; Fri, 26 Nov 2021 09:48:21 +0000
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 9750040009
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 09:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1637920095;
 bh=HRNUL8Y0Iq5Vt2e9JL9LxZBZvKj6u9INfG9sLHI3bog=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=BJBZzbiw784nA/OpKfH8JpfuMC4L0rL68UKnPihZr9C1fvw6fxfVXWQHqGwbGx1IP
 ebrPcIqQ86vPKr3tZQfVK+LUwCAttTSIpll5HyyMwGm6oBI8DsAvnprYSgwqW4OnVc
 uuNnk28hnRQfMZ5QBLLxw/3zbMrUe1SHHYuvv1sFvtOpN1GUjJ63Nv+olHRI1WVPDn
 SJptIOU6pTtEkX08kWoJtrWpDHpKj6k1387KmAEaBizxIbDfpv9+tEhH2SSCdUZWhh
 QDqriUNTpbfFIoKXx6o1RfEqeWCJnMq2rhLudx4/scajhIruZtlmXf70QubkAFSpMQ
 f70WkamMAYqyQ==
Received: by mail-lf1-f69.google.com with SMTP id
 b23-20020a0565120b9700b00403a044bfcdso3965783lfv.13
 for <linux-riscv@lists.infradead.org>; Fri, 26 Nov 2021 01:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HRNUL8Y0Iq5Vt2e9JL9LxZBZvKj6u9INfG9sLHI3bog=;
 b=EdYaPkx12NA3Gmtk+xPCHly/yUxxpUJKgeB+cgWTZcUlmG246iQsA2XiyIEBIJaVw/
 5UTN5ESEaSFoWkgdp8GOKcrCsDGrxfc2uTKpPrk4d+ZeO6BE0rqxe5Cdf7gvBzh0enPf
 OrOT1lf/0EswurDojUc4ReEfGam24lxjwyOwr61egqwwIbDQmVFd5JNyNukTzQ7XxqCs
 xhVqzE5iQwCH3oQj3iKY+OWoI2qNM3TeOd/i3VskSHo5dK8DjGlSGC4kZyKWgjQ4Vyde
 Vb9vPbgq5IakYM/rQRFWUNNsWkEiu861zSc8oxF7G0YlTVnWhsnhu22BnmGHq5Ik6Ay8
 SO4Q==
X-Gm-Message-State: AOAM533+Cat8OjZ5nGueuTkORGXqcUwFfJEnLpo8Kyge4Gf2Gybp6zhK
 uTbsVjwnJoFdNiE64CoNbCmu0Gzk0ruOlQVFXCeMJ/eWMnAREcRXcq2Np7yZx8/zGma9PsCzL+F
 7TW6WeAPjrgql7634eNySzKGneA0zNXSBCNiiMaSTspOZ0A==
X-Received: by 2002:a05:6512:2809:: with SMTP id
 cf9mr28141136lfb.429.1637920094952; 
 Fri, 26 Nov 2021 01:48:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzek9h6XgJ5SJzyAAWkH+dhGuc29TAt2GBIxwRD8EDlfyCOSEoOkXlLvt/VNfVcVyE0zgW8cA==
X-Received: by 2002:a05:6512:2809:: with SMTP id
 cf9mr28141117lfb.429.1637920094756; 
 Fri, 26 Nov 2021 01:48:14 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
 by smtp.gmail.com with ESMTPSA id
 i10sm465200lfv.22.2021.11.26.01.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Nov 2021 01:48:14 -0800 (PST)
Message-ID: <3b8442c7-fafb-421b-cd5b-4b57d1b545c3@canonical.com>
Date: Fri, 26 Nov 2021 10:48:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 6/9] riscv: dts: microchip: mpfs: Fix reference clock node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Lewis Hanly <lewis.hanly@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20211125153131.163533-1-geert@linux-m68k.org>
 <20211125153131.163533-7-geert@linux-m68k.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211125153131.163533-7-geert@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_014817_788149_C0F168B5 
X-CRM114-Status: GOOD (  12.33  )
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

On 25/11/2021 16:31, Geert Uytterhoeven wrote:
> "make dtbs_check" reports:
> 
>     arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dt.yaml: soc: refclk: {'compatible': ['fixed-clock'], '#clock-cells': [[0]], 'clock-frequency': [[600000000]], 'clock-output-names': ['msspllclk'], 'phandle': [[7]]} should not be valid under {'type': 'object'}
> 	From schema: dtschema/schemas/simple-bus.yaml
> 
> Fix this by moving the node out of the "soc" subnode.
> While at it, rename it to "msspllclk", and drop the now superfluous
> "clock-output-names" property.
> 
> Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
> ---
>  arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
> 

It is also logical because refclk usually is not a property of the SoC.
It actually might be a property of board...


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
