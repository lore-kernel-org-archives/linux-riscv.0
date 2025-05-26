Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05EAAC54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 22:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zzPEbtmbfhmJGoHrOCPenu+5gAuPTipZM+7ngRl0uN0=; b=N9MLaeQW5xVQl9
	ZT1J8LSB1ciAXoo6u91vJJ57LmxpxEY261DbUv4j6s016yeT3Gzm5Xr8YYFh+IwZEtjD9fiCetbe+
	iZ73+TCYzhRSySGpgh8U00UBiOm6mS2m6HmpcjiuuH4W+4aZxXnjYEgt5vHZRtSZQOrFkROBjK7O3
	FS0VzbvcFFtb+AwS7Pwc/CImxk8T8gSnc1yfDpBV9K6lUz/Av13niFpcRNBxkXZGhhzRbqkEeuoON
	/GzQULcxZ8evjI2ExPLbatxr7EEMy2R3Fhpd+ZsqnwJslgV3j9sC+OqfC2AAms8LN/VIs8yiYwQZf
	gcaZC6o98Fu9EH8Cqb8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJgcu-00000009ba1-2nFm;
	Mon, 26 May 2025 22:49:00 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJgcr-00000009bZf-0OtM
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 22:48:59 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c5e39d1db2so146085585a.3
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 15:48:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748299735; x=1748904535; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DxU+IS3NoOt3HdLFHXPgdhqzIwbodDbspZNewqvS2bY=;
        b=E/fDPUkfLb8HE5DJxvYfLqav+/i3iktuRHsRnSVCZdNjnIpa1AkM/zOmw2rjMMO+Ge
         kvUTvgXKcvYOoohUwU3RQ1aRNPUumh/I0Nekhu5rCuCzcEC53HwcZl83zW2EuRL4MA2k
         nyTKfUJJHeoxCEqRrjkK4wPthYv3/flK8o+rVVIvCOnqskJkoIy6ZdbQ+4Er2n81cyn3
         r1Pa8uNIjmIEQN4i2aAjM1tyVa/GqID8GCZVe/z0gdJLN7Jr3k8mlMAJN4O4OIaxxgfr
         R1S1enO2R9YwWhTXsguyHC3AUcY5b0h9ZN79bHx09qNAUz7cZifIM37lLqM8T18J7i6H
         +Grg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748299735; x=1748904535;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DxU+IS3NoOt3HdLFHXPgdhqzIwbodDbspZNewqvS2bY=;
        b=DmIL1/htAvokmXFXHq4A23R4g9QZ2L8dYikuu+nx8+jg4XdWf8R0TORCcNn4afFQ55
         X2ohrmetCj4btZSMx0mWHMsJVaHbxnvrzGjTSrz2TkQAWdelN06K3vmPTiciqx3E1oR8
         jUQl8WZxAIQrsomPFGl31W8ZxbxRulmaxQyijZ1KzFpbnOwVgqwBj5ROQg+9NFGdpW+2
         H+euPu+J4Yeufg7WdvFRV9xDas6tPdUa45m4TUB+nPae1CpPThiND9DEEO00iqYZhKnW
         IPx+rxPgHOkqdMoCmiRwo5JLCtaJEjp7rHiyMd2MFaGj3YfQI4mpQEFReRjfyeZ2KKzW
         wfww==
X-Forwarded-Encrypted: i=1; AJvYcCWFhKg6BjNn41SCHLaCwtawFwkIRYjW2L/Es2tQcTap22Rz4CuEmGtsWRGtEN4vY39j9aZpPIl6K6cwiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz8vzsGdSOeqwNfX2SeEj5H9F6WvOZaYA+zzqF2VVVlw2xag32A
	PWmFT6zIVvN2RKM85rN6USrUxLO9MwBRRT+kYR+YCBr4dHqaSOAFzQ7i
X-Gm-Gg: ASbGncsKDX63x+GjBsJNom2Uib0sjtfvyLVbmW792WPEFk+mh3YIEIKz7oRS4L5gU4Z
	lw41FOrlrawP70bCoKq8tlx4B0XIay9aeZ2vyNDFrdzsZMDPayO5W9X2xkj5xox1AW4uXgil0Qy
	nKvKbsVWvu/J82rgrL6pXemZClVweVFUHAP+y1+IshpuwTtwqdt5UE36GT4f0Gb02vVxJJgdphg
	AwpSLmE/JaU7Y0VjSqMtwV/r+2XWmaCV2o2a5RsgO0UeNOgPYxp7KtXGUtn1pcyJsuB1ewkT7KA
	Cd9b1dNN8rWzbUQhWademk7370s=
X-Google-Smtp-Source: AGHT+IGb426KXAna7tUbXhwL2CIur79DWxmDcI/E5an7rbk9SRJUL7gdvaP3a93TzMAL6SvIIh8Q5w==
X-Received: by 2002:ad4:4ea2:0:b0:6f5:41b8:47ed with SMTP id 6a1803df08f44-6fa9ce38689mr191223316d6.0.1748299735279;
        Mon, 26 May 2025 15:48:55 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6faa050c0b8sm36106276d6.74.2025.05.26.15.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 15:48:54 -0700 (PDT)
Date: Tue, 27 May 2025 06:48:08 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, sophgo@lists.linux.dev
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: sophgo: cv18xx: Add RTCSYS device node
Message-ID: <ykswyhohgty646c5s7pow46dn5gjvgvpq7vq46kbh2gf2f5hub@xabjhqv7pzfn>
References: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250513203128.620731-1-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_154857_136047_B53A7E4D 
X-CRM114-Status: GOOD (  18.42  )
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

On Tue, May 13, 2025 at 10:31:25PM +0200, Alexander Sverdlin wrote:
> Add the RTCSYS MFD node: in Cvitek CV18xx and its successors RTC Subsystem
> is quite advanced and provides SoC power management functions as well.
> 
> The SoC family also contains DW8051 block (Intel 8051 compatible CPU core)
> and an associated SRAM. The corresponding control registers are mapped into
> RTCSYS address space as well.
> 
> Link: https://github.com/sophgo/sophgo-doc/tree/main/SG200X/TRM
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

I am happy to see the rtc driver is merged. So I will queue this
patch for the next rc1. If you need a rebase, please let me know.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>

> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index ed06c3609fb2..280c45bd3b3d 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -307,5 +307,17 @@ dmac: dma-controller@4330000 {
>  			snps,data-width = <2>;
>  			status = "disabled";
>  		};
> +
> +		rtc@5025000 {
> +			compatible = "sophgo,cv1800b-rtc", "syscon";
> +			reg = <0x5025000 0x2000>;
> +			interrupts = <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
> +				     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "alarm", "longpress", "vbat";
> +			clocks = <&clk CLK_RTC_25M>,
> +				 <&clk CLK_SRC_RTC_SYS_0>;
> +			clock-names = "rtc", "mcu";
> +		};
>  	};
>  };
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
