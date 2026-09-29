Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA869CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 13:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kS/fsRqQleW6YcCwX3Htq5p6L2NN1KDfcBbTUrdQUwo=; b=1Awtgw9q5J+G0m
	LtNxI7UGpQ9abvKByL3Fj7E/IVYj7G9Z3WIXDJEss0bRMe9vVkkU0k6XoxaNjfii7AodbXCF/Vt+o
	dwPCj4uRfmNy0dg61r70OkeuDastkD1RRRK7D46KwPz1aV49lMQ5TrnMmPf+0hjSgPej2Sn4mfzPN
	RHdrTMgrOP5/xqBtU/4t/kQzKLtM/ZhwEa+Vm96IQ/4HC/uBTATCvnDD7DrXslw53xNTLtK2ra0dm
	nOQ+z8NgUAU2ptMaMZYH4JRAg8gml6MUBs6fN9KYw60V1COQCerZZPrBprp0eXi88x4vLZAXpVXDy
	obyhWoEW28a+ow/MXM9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXd9-00000003dnj-43md;
	Tue, 29 Sep 2026 13:12:23 +0000
Received: from mail-oo2-x0e.google.com ([2607:f8b0:4864:31::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBXd7-00000003dml-0AeS
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 13:12:22 +0000
Received: by mail-oo2-x0e.google.com with SMTP id 46e09a7af769-81be26ba237so1350191a34.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 06:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1790687540; x=1791292340; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FSKiUJRQhiLhPi0pr/mU+MmO5Nu+j31ELjJx/f3jfj4=;
        b=AzbOjRa3jV23LbzhJo9ZFhzrQ8r9SpnXgkfbc77nlwUs6Dri7BVnCCg3kgsZJLSgqD
         cdrRXTLN/FdP2YWy9YE6P9Laz8uXyuh3+1k/EEI7ThLnkTS64zfcapUBaucLbtH1dz59
         BKDDQZi2Uq9LqVCcdFJ4JPbVeLkrW36krAGCxAz1lMo3ZBiu9ksGknPUpKtv7rTnoJI/
         fP+ouOcPbb+y5Qa/FENW96ji/7/iST9qBomXasZhQOdU1VShfr3gzvRpdpWZe0OjbHzf
         dFkdRkIBWeJot5VM8syRH9ZmHdFNW7zuykCQ3zDUUyshGsiEWWuXdKf2sk3LukeCL0wm
         7nxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687540; x=1791292340;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FSKiUJRQhiLhPi0pr/mU+MmO5Nu+j31ELjJx/f3jfj4=;
        b=Hdsj4eQhxDqqRr9jp1ymmC/+5OhbmbUYhzgflcaTqwDfPrql+HkoQpU2MrKT6jmOcT
         INhL2111d4V7ucx+yPxGGTLuwbLV1HFLYT8WlyNrIaKepndHbu4+8qmqwyNrXM2NKZ/L
         7B6raSnZ2DFW25QUV7YoqAC4FWQ/CiKA7hcvq5uXSx1PaZMfZmbQGo1K022tg7SJQDE5
         1SGlSLUhYp4ZKslYb9WWcDI6eptFB1ytNfpbvdjM2tSG4fNJ20zP416vHJb5dpeHyu6O
         mBCTG99t8XkumJvDpAtqQUd4rK4m3wOoT0PClzTG1pJAaFpvfBs3Y732XlcYkHnXGVhg
         yjgQ==
X-Forwarded-Encrypted: i=1; AKwUvBxJ6MU5eQNdUgj2BOl6KPVjHs/q096qxv751JAKWF+qfCBquQLSheTNf8zyt9y05U54hxl0eqguMMiiuQ==@lists.infradead.org
X-Gm-Message-State: AFuF++l5pelDc1XqKexBkSZvtoCMTlSw8MG9yXD/LgRoEegX9xtzk0aD
	cAhSNczwBugqccMIcY8o1cB9CNjMtlNFjCFVI+gm1BxIfsQwloLqqEW7zo7HYOYzEKw=
X-Gm-Gg: AYBFou2fJDoiHUp/6XDua5N3SssSQi+4zAovPVQy3sLpEfuXq1B2dVcmlpda2bZEvvb
	+rGH4tgFhPhzUoHjHnoD1SRdQcoBHE+/C1LXNt/L2SKIUb9QVehdWUWG6o+9EK1N+j01MoM8fUu
	ydKBhTK6nC4zjikPCiXCO6F4nWsDvVcPeJS/WYsSlDN32tkopplFLWaAP9TxfR1xz6dNFagjiRQ
	egnkDJeY3HnqTQhvt0Hc3hP68S3Y62tATuJihOS1+yTYb3AeoOMZgcsePj8FcHo35s+BiG2mdo4
	0irTwGIRlPXlmzsAIP3zYgCYGJKYmdRz2qJmvvib9J5ZRb8FWiYMZlRDo7PzEwJHTEadn3Z4euL
	8Rj1qt1J75X4ihOQ94AcYrmUwwxt8oc+iK0pN/T8Bgg9cQ7/Mc0RzTL3F2Brd/H21k7nWrQRfDe
	8ZhrPi1C1xNX8foE9pIh1rH760gSLqmf9SIzwzIMAslqlmwv0QIvce4g6K5q8lTr0pi7vb8Dw=
X-Received: by 2002:a05:6820:1524:b0:6c1:598a:d80a with SMTP id 006d021491bc7-6d440eea6aamr17324629eaf.62.1790687539902;
        Tue, 29 Sep 2026 06:12:19 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.13.74])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6d8822199cbsm8598079eaf.5.2026.09.29.06.12.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Sep 2026 06:12:19 -0700 (PDT)
Message-ID: <e27dd631-73a8-444a-8747-84d51ca3a57c@sifive.com>
Date: Tue, 29 Sep 2026 08:12:17 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 7/7] riscv: dts: eswin: add watchdog support
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Andi Shyti <andi.shyti@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Min Lin <linmin@eswincomputing.com>
References: <20260814070007.1662455-1-pinkesh.vaghela@einfochips.com>
 <20260814070007.1662455-8-pinkesh.vaghela@einfochips.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20260814070007.1662455-8-pinkesh.vaghela@einfochips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_061221_118211_96F230AC 
X-CRM114-Status: GOOD (  13.49  )
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

Hi Pinkesh,

On 2026-08-14 2:00 AM, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
> 
> Add watchdog node for ESWIN EIC7700 SoC and enable them for HiFive
> Premier P550 board
> 
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts | 16 ++++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 40 +++++++++++++++++++
>  2 files changed, 56 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index 5dddcf13fd25..103c3dab184f 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -207,3 +207,19 @@ &uart2 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart2_pins>;
>  };
> +
> +&wdt0 {
> +	status = "okay";
> +};
> +
> +&wdt1 {
> +	status = "okay";
> +};
> +
> +&wdt2 {
> +	status = "okay";
> +};
> +
> +&wdt3 {
> +	status = "okay";
> +};

The watchdog timers have no dependency outside the SoC, so they can be enabled
by default (omit the status property). There is no need to separately enable
them for each board.

Regards,
Samuel

> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> index c13432d14504..f873e9eeb929 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -265,6 +265,46 @@ syscon: syscon@50440000 {
>  			};
>  		};
>  
> +		wdt0: watchdog@50800000 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x50800000 0x0 0x4000>;
> +			interrupts = <87>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT0_PCLK>;
> +			clock-names = "tclk";
> +			resets = <&reset EIC7700_RESET_WDT0>;
> +			status = "disabled";
> +		};
> +
> +		wdt1: watchdog@50804000 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x50804000 0x0 0x4000>;
> +			interrupts = <88>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT1_PCLK>;
> +			clock-names = "tclk";
> +			resets = <&reset EIC7700_RESET_WDT1>;
> +			status = "disabled";
> +		};
> +
> +		wdt2: watchdog@50808000 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x50808000 0x0 0x4000>;
> +			interrupts = <89>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT2_PCLK>;
> +			clock-names = "tclk";
> +			resets = <&reset EIC7700_RESET_WDT2>;
> +			status = "disabled";
> +		};
> +
> +		wdt3: watchdog@5080c000 {
> +			compatible = "snps,dw-wdt";
> +			reg = <0x0 0x5080c000 0x0 0x4000>;
> +			interrupts = <90>;
> +			clocks = <&clk EIC7700_CLK_GATE_LSP_WDT3_PCLK>;
> +			clock-names = "tclk";
> +			resets = <&reset EIC7700_RESET_WDT3>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@50900000 {
>  			compatible = "snps,dw-apb-uart";
>  			reg = <0x0 0x50900000 0x0 0x10000>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
