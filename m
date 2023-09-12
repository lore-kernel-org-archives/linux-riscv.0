Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B140CA0ECA
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Sep 2023 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+tiv8cmiEugch3QidsnT36XASZID2zOjybqnl6ySyo=; b=vkyPO54eH1WOG/
	z87e9DCIJpzPkCXZc4rO+Tia3g0zu10SdRfrk63X6+GiIjYtSqYnj7+zdUceQVUXfS5fflO87ctwa
	/wNrLCGgJSMiaBl4+M5X19J6dEexEitywdqtZbTDGr/MLF2D2+cFrsbYhbqoiosJRjLU0UyOAiSiI
	QM8Wr0rriH311RjcYSQebAMInRysSr4131IEBzwN7NRc7Nhp9r4MNzNikc9+4eQGADLyOodsqc2fL
	+2jRaGvhoo8MEjwn+WMg+2dchx6KYVy3MldQnQwqQYuZzIRhQQkmDoQvGvhqMuNN/HwtV7GdKCINw
	DxH42RkUvS4+DscEFX3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxTA-002Lpw-0J;
	Tue, 12 Sep 2023 07:05:56 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfxT6-002LoP-2x
	for linux-riscv@lists.infradead.org;
	Tue, 12 Sep 2023 07:05:54 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-3ff7d73a6feso55671375e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Sep 2023 00:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694502349; x=1695107149; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=abf20X51QpaxCmfFqohWdZjGU9OAwdJ8woGP6ojQAng=;
        b=N8olY3R8yYcPQONNl/mN4MELr4VsF0jO+5LWhJv8WoL5srW4o9nbvCX40PDM49ecMu
         UFZvhNaIMoaM1JNuX2r8FyOcOfKL1JyiTJIlS0B3RtGr+PYqeE7nRBn9uG3ip1Cwjtiu
         De4DhUVjKPFeudxsLIaN5zQy5TTCNl1PnXa/sbxz97MIIiLHDqf8sZQ63pyM6B8Xaosp
         8Qgn2hhxUfwnoYpXWIrbVZtVPKLRuZM7kw+tMQZOpWzGOaHNCT8u5PcmgNFUpZKPhbRP
         JZYB2mCMT1fcK+N2i7feLijlVHfb/P+jXeFIbIHs5CKZHuPd11GrDwlECIswUFqp2eg8
         GKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694502349; x=1695107149;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=abf20X51QpaxCmfFqohWdZjGU9OAwdJ8woGP6ojQAng=;
        b=P7k835ZPjZ2Jmzvib+c612/KE5OdxtTcblg0WsfVr6zKRAzSsktHjLOo8uEfaaNwwG
         hA2SYoIxjHJFf0y1wzFFhh19kuNZVwFSHRSZw73aH29r0X9u4rxi6LuO/gvJ2WkSA9Cq
         38y+zfGlETPxhZw86pd+1isfsmsUslouNSxPmgFIbvUGsylP2oVkLONp8yKvlEkxpVFD
         L3OrS0zx9ixAfxHC2MBvdFEwTv68kMkv35+Ztsh0TezhPJix5kYipEYw/kL3gvFcpkh8
         uQ9OPiqupJJH/ZTOoTJ1nt03AwGWZOBFQkNn0Spc1H6IqxZGyHW+KAAB88D3QhLa6zLy
         aqSA==
X-Gm-Message-State: AOJu0YwPAs7vLG9zFcDu/SkppSVfsqgOjtnA3KqRhZWQUfalDmaDDkYH
	aSpYqtkWoo27KXDlGfg8IQW9rA==
X-Google-Smtp-Source: AGHT+IHsWhukm75MZJtf0oYf0IcV35LSdNy1YT4k1P9PQf5XKhHvKQh5+lOWfVKm+wu6gPF1yE6Ing==
X-Received: by 2002:a05:600c:1ca7:b0:403:855:d0d2 with SMTP id k39-20020a05600c1ca700b004030855d0d2mr6220135wms.41.1694502349187;
        Tue, 12 Sep 2023 00:05:49 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id p23-20020a05600c205700b003fe1fe56202sm11926563wmg.33.2023.09.12.00.05.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Sep 2023 00:05:48 -0700 (PDT)
Message-ID: <ee81ff75-c6db-9a1a-2bca-f509ab4499d8@linaro.org>
Date: Tue, 12 Sep 2023 09:05:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 3/3] riscv: dts: Add th1520 reset device tree
Content-Language: en-US
To: k.son@samsung.com, p.zabel@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, jszhang@kernel.org,
 guoren@kernel.org, wefu@redhat.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, inki.dae@samsung.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230912024914.3769440-1-k.son@samsung.com>
 <CGME20230912024917epcas1p2076a3a0674ae94e8c8641cc9eb617eac@epcas1p2.samsung.com>
 <20230912024914.3769440-4-k.son@samsung.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230912024914.3769440-4-k.son@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_000552_951361_FBDC1061 
X-CRM114-Status: GOOD (  15.44  )
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

On 12/09/2023 04:49, k.son@samsung.com wrote:
> From: Kwanghoon Son <k.son@samsung.com>
> 
> Add reset device tree for th1520 SoC
> 
> Signed-off-by: Kwanghoon Son <k.son@samsung.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index ce708183b6f6..7e592449b5e4 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/reset/th1520-reset.h>
>  
>  / {
>  	compatible = "thead,th1520";
> @@ -418,5 +419,12 @@ portf: gpio-controller@0 {
>  				interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
>  			};
>  		};
> +
> +		rst: reset-controller@ffef014000 {
> +			compatible = "thead,th1520-reset", "syscon";
> +			reg = <0xff 0xef014000 0x0 0x1000>;
> +			#reset-cells = <1>;
> +			status = "okay";

Drop, it's by default. Look at the other nodes - they do not have it, so
neither this node should.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
