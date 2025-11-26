Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6975D111B3
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Nov 2025 22:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AJNxsc36pTUzSZLIUD6mA2laQoUuhxU4Yk2kLR5IKmk=; b=U0xKpNZm1CL34N
	JuJpKnZxtiOzwdOXTU2xK/MK4zx1yB496obl5Jlr/AFt21fxDDgiVH7asohB7BZiSnU1Mw3jcjCrh
	6/k+el0KOJtfD1dhM3fA74RbGbsZtLYkAGJ7WN1qQzoa9b8u/2T+mbeKCsG09AGjzdj4w9s+U8Wwv
	LoIMf0tXd+/yXikbK2MhoB+XPZmK1d2E7dpvwtba1lR59a82pkKcaIjmlhdgJu/DInnJavJ66vnjm
	hRrV+hzPmvBkh5ianz41M+XcBUtP7GERcWGhsQyAWlA93Vk8lYFAEZrqrUSeAxBtJV6D6NFAK1vkW
	4jxb+XjwhRbNj4uRm3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONvi-0000000FiG7-3Uzg;
	Wed, 26 Nov 2025 22:24:06 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vONvg-0000000FiFm-0fhh
	for linux-riscv@lists.infradead.org;
	Wed, 26 Nov 2025 22:24:05 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-b99bfb451e5so182500a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Nov 2025 14:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764195843; x=1764800643; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BZOu5aEyKENky2c9G/LxIdAHXqDSwAK1EmrizLVcA3A=;
        b=ntmstu7X06kfhgz7yVsFTYUrudKrRVZwVLLg+AMzrQdEaqyACfjf/dLLV/zAwQGWh5
         4S3vqUWvHwbBS4cdXoMtFk9w1wBzeIkJkA9naLSbdhcOqgX9gACt7IrJis4mDQth4h3j
         +alrEbd454d4G6zjQTELP7rd/x3RAOnz60oKKlK1VdAqGaHEBJ7gVy8CgArTBy4Vi3vF
         fJh9I26U2FhACh2ZMYKBiCmQK8IJUc2YQ1tdqH+lUL+EzVZo6Z0ywYMY/8PI9GIL5F2K
         htWZedpp3O9tVs7aaGThaMEpZWG2Ny8aEAtiB57VIQTghLMtZeKEOGQKJdews8K7U93u
         amXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764195843; x=1764800643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BZOu5aEyKENky2c9G/LxIdAHXqDSwAK1EmrizLVcA3A=;
        b=Xb2nYfMJsqxm6r+EQ1mBxf3s1ozXamRTfQv/Xm6gEZGpxMQVilDwXxFqEaHTpqiBnB
         6sP6I440M8HNvdAWFwg86TmkVi7syTq/CsINscXOJOkYEd8PUyGOh8BMZtMDlYhJrJnB
         N4SOpm6YMb0ocjJhAcrEFpVspqJ1vYRBYvnXJD3TKNceig9ov/Dzm4EEKF714Kq9SHlA
         jjxAwgPrtdZ/J9l1CnHQoEU4mBEbr1jyHlyL0dhmKhT27ZrWGO4ScEW3dHBe7O/B5Z0r
         v9qEjhTMdgtsM2S2U1B3O7UwCIZrl2wDpF1vU5ssOqmDtq4ndSR6s0UJqS8YyB7/sBQp
         RJjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUc8V62XLlMNR1iXaRc6nyRE0/u1YfbkfDpOwnd7PTfngyf2tuHmB1DNI1ZD5GIsaSf8T0zvlLUhf0pJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwzlxTqX9+iRbw/QD0rTNg9MS5taCDrDfajhWNBwTz4tPRuh8DI
	Y6BT5QRyO7y30/3yoj3i4UD2KgcuPj8WdlqLjlqet8h2oL+40PRArTK9
X-Gm-Gg: ASbGncuobNGs0RjQMMLyvb2MchBjhhM6UCzVg+0AjfkmGMWEp0NSYDZbR26P3Y5saUq
	y4UlC4MjGOlw3GeZg9iG5X37Ml1fAI1CQ82RUpn5e3jtYblJeyrsgNyReidwks/umH0qwdJ+qx2
	5kkD5s4OcqRTOkdmxlLzANJI5NfMoEc4sXwCe3UMBn2tbRTnZuiME3Mo5ii6Q9PReI7NwP2ggww
	hna9ByT1SdtC0sqgM8Ubya6HMr7EJILapf76cJT6jFf057ibubJjBe9l4sY1B4y3ycdbNM793ht
	9uddTUyXWuQeamAxSA8iH1rld3DvWlSZACZn29vWrZjWdbM5nP7jdrE97GYBynFeQmW7LFmoYnq
	fT+YXTG8fAbulHp9yIHUvYWFjUHf+Q5b2xDTuJQwJ/YB9i5jtUht0G/8F+eWexFys4mp+Iwz3o+
	HghtAN1Mq20g==
X-Google-Smtp-Source: AGHT+IGsvWka9Dm9jnaO3xye2c/MAvR38kBdVohFIuX1a8i2UEEMWVrspUwb2b/Cg5A4pKC1TEkD5w==
X-Received: by 2002:a05:7022:ec85:b0:11a:61df:252a with SMTP id a92af1059eb24-11cb3ecc587mr5507782c88.6.1764195842702;
        Wed, 26 Nov 2025 14:24:02 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e5674csm99352914c88.8.2025.11.26.14.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 14:24:02 -0800 (PST)
Date: Thu, 27 Nov 2025 06:23:22 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: "Anton D. Stavinskii" <stavinsky@gmail.com>, inochiama@gmail.com
Cc: alex@ghiti.fr, alexander.sverdlin@gmail.com, aou@eecs.berkeley.edu, 
	conor+dt@kernel.org, devicetree@vger.kernel.org, dlan@gentoo.org, huangze@whut.edu.cn, 
	krzk+dt@kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	looong.bin@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, 
	sophgo@lists.linux.dev, thomas.bonnefille@bootlin.com, unicorn_wang@outlook.com, 
	yu.yuan@sjtu.edu.cn
Subject: Re: [PATCH] riscv: dts: sophgo: cv180x: fix USB dwc2 FIFO sizes
Message-ID: <iwp4jewumabd2niwhsvml4p7kfouptirdk6wxv37ejuqyipmr2@p24wd3pv7iub>
References: <20250611082452.1218817-4-inochiama@gmail.com>
 <20251126172115.1894190-2-stavinsky@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251126172115.1894190-2-stavinsky@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_142404_209966_67619BC3 
X-CRM114-Status: GOOD (  18.53  )
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

On Wed, Nov 26, 2025 at 09:21:16PM +0400, Anton D. Stavinskii wrote:
> I've tested the current dwc2 FIFO configuration and found that USB
> device mode breaks in ECM mode when transmitting frames larger than
> 128 bytes. For example, large ICMP packets or iperf3 traffic cause
> the USB link to hang and eventually disconnect without any messages in
> dmesg.
> 
> After switching to more conservative FIFO sizes, ECM becomes stable
> and no longer drops the connection. iperf3 now shows ~130 Mbit/s RX
> and ~100 Mbit/s TX on SG2002 (MilkV Duo 256M).
> 
> Fix the FIFO sizes accordingly.
> 
> Signed-off-by: Anton D. Stavinskii <stavinsky@gmail.com>
> ---
>  arch/riscv/boot/dts/sophgo/cv180x.dtsi | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 1b2b1969a648..06b0ce5a2db7 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -438,8 +438,8 @@ usb: usb@4340000 {
>  			clocks = <&clk CLK_AXI4_USB>, <&clk CLK_APB_USB>;
>  			clock-names = "otg", "utmi";
>  			g-np-tx-fifo-size = <32>;
> -			g-rx-fifo-size = <536>;
> -			g-tx-fifo-size = <768 512 512 384 128 128>;
> +			g-rx-fifo-size = <1536>;
> +			g-tx-fifo-size = <128 128 64 64 64 64 32 32>;
>  			interrupts = <SOC_PERIPHERAL_IRQ(14) IRQ_TYPE_LEVEL_HIGH>;
>  			phys = <&usbphy>;
>  			phy-names = "usb2-phy";
> -- 
> 2.43.0
> 

Please add a fix tag next time, I will add it by myself this time,
otherwise LGTM.

Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
Fixes: e307248a3c2d ("riscv: dts: sophgo: Add USB support for cv18xx")

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
