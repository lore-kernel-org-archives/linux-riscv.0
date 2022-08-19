Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39EAC32771
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 12:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gk04q46AQLgHgrbPVP9vfgqp4OECRd7WbySR19XRAXU=; b=eeDvjivS20+lRW
	dcg6iV/M3R/DqkPJyBmx73XV83sY8ysPrfXLJTuPfChbR6rOtclT08piI7Q3VeDiwtr9K0Uqui7Nl
	LFWuyhV1gF6gM82ek/KVtXAIX/CrhTCuyTrjD0opgE2O25hYX664GeOASBQWZQJLJqTE8zD2IEL+d
	bK2ZTj8zujqx/9+6PeEBGJCxfN7xD9oh7kEyHF6p19BvJGFuTVjzTeqapS9Z4GtWzW/MY4CBvDm2+
	MzWJrVClrK82QIYMImv+hYNAzafyPVJmrMKd2Jki6QXjUjJVDu91GyAHvPuBImAMwzbysPfn2u9SN
	8h41ZferICcgX7ok9Xnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Q6-008Exd-Rl; Fri, 19 Aug 2022 12:48:14 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1Pm-008EPw-4c
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 12:47:55 +0000
Received: by mail-lf1-x133.google.com with SMTP id t5so729774lfk.3
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 05:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=D4OnEbAEzRBeQeg3hRcaY4ZzP+Li/Cr5jkVWg1DWFSg=;
        b=lUxIIhlKYF+UhNDXmDvDFbRA4kClWNgyDPOsVtb3kuftUEwO4MeFUaeifgbEcC1aIH
         cZgXGrQwVMEGV7gfIY6+mClPE+MLwiZaDBHo4UBrArheiUhVyfatxJ2VXI3qS2AfhXN4
         hPOg+Y+YdNTJFT5w+/dF9BudPumS4EXob0iX3+kyzC/3bzXe0xhpgcOmcYkGlgzHYPXq
         9svJNwzD2yH+MO/nF5qjstIbCGs24QwzKQ6COhxkdLbjBhMwBKscGpbB+fAlvOp78XB5
         RbQedp8cHp++FOI8dfG0/CVSlEu9GOXcooRZy0iPh50g0A23X1Pui73nf8OtHyv//8c+
         LhlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=D4OnEbAEzRBeQeg3hRcaY4ZzP+Li/Cr5jkVWg1DWFSg=;
        b=XOOL8PGUsjsSgZ3I4eOZ80nKesCi8VrlUp+A9HOEW7OgV+A74SZG5rgbfjMw/ZqKl5
         E9iCoBSt8o5XNxvOpGtxL0UzTMvYtrK73q3+tU/9Ti2MK7K/j+cNusn+rtLccfXb0B4U
         gn4R8yTOfxV5pKxclfsS2dyL1y1M3yrvZv1WXmb8G8RWze9nsQfk2RjbkCwUIRXPdInB
         MTprgozI9h2sfsUZMTfU8NIOM1DwjBOEL2pSu8xgO5TGzkZO9xI3ITaRCdEmvQDGP3pW
         ZhS4gsQFPm/3onx+LS2yY5FZrX+pEcMSsuCWCFIJK7kHebEjiUjNih/mO+t2/YErRtLC
         45Fg==
X-Gm-Message-State: ACgBeo3qASQCjdn54iFnsoOw/zak1Kd3SpCiz93M3nDL0GvwqPkpnhj8
	DAWRXYu6OSj0NkiUJyU1Can2Iw==
X-Google-Smtp-Source: AA6agR7Zs8KA0ne3v89QRnCqm9aIw3aFDvAsKmTiXOuNK0AqKhLhnAX2WGbHijJgwKLH2Poxeoq5IQ==
X-Received: by 2002:ac2:5f77:0:b0:48b:3886:5d55 with SMTP id c23-20020ac25f77000000b0048b38865d55mr2259653lfc.668.1660913270258;
        Fri, 19 Aug 2022 05:47:50 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5? (d1xw6v77xrs23np8r6z-4.rev.dnainternet.fi. [2001:14bb:ac:e5a8:ef73:73ed:75b3:8ed5])
        by smtp.gmail.com with ESMTPSA id v28-20020ac258fc000000b0048b37d29256sm631729lfo.63.2022.08.19.05.47.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 05:47:49 -0700 (PDT)
Message-ID: <3df8d4bd-3d38-cecd-6589-ccc1be01b886@linaro.org>
Date: Fri, 19 Aug 2022 15:47:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 6/6] riscv: dts: microchip: add the mpfs' fabric clock
 control
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20220819122259.183600-1-conor.dooley@microchip.com>
 <20220819122259.183600-7-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220819122259.183600-7-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054754_246984_C5D8666A 
X-CRM114-Status: GOOD (  14.21  )
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

On 19/08/2022 15:23, Conor Dooley wrote:
> The "fabric clocks" in current PolarFire SoC device trees are not
> really fixed clocks. Their frequency is set by the bitstream, so having
> them located in -fabric.dtsi is not a problem - they're just as "fixed"
> as the IP blocks etc used in the FPGA fabric.
> However, their configuration can be read at runtime (and to an extent
> they can be controlled, although the intended usage is static
> configurations set by the bitstream) through the system controller bus.
> 

Thank you for your patch. There is something to discuss/improve.

> +&pcie {
> +	clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
> +	clock-names = "fic0", "fic1", "fic3";
> +};
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index 499c2e63ad35..dd15b6d1a3c9 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -236,6 +236,38 @@ clkcfg: clkcfg@20002000 {
>  			#clock-cells = <1>;
>  		};
>  
> +		ccc_se: cccseclk@38010000 {

Although you call it "Clock Conditioning Circuitry", but the role of
this device is a clock-controller, isn't it? If so, node names should be
generic, so "clock-controller".

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
