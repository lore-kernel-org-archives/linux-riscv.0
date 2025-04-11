Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08278C369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 22:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FhrLcAAnqK7DVUMcamp0VnJj4v2PRTou70MkTR5+nkE=; b=gIwvnUqpY8dRt5
	j6AdGoL4J7Cuvi+xTxQG+3onNsQm6xg1qwkhE0YJc/cRQ9y+cxfa/110hccvB+3uKC57D06rxbZZi
	m1YT5kla+gwAC4NmxchaZoF0XFnVA7LTcRHs+ts1R7ITkWHzsoCkhtcVp87sK6gkFk95UddI81CFk
	d8T5zjudLd9iUiyI/dlg9Z2RX7L7CQ/XfNRk0/Mps2RPGB025ALdkqVx9E8F05IQ1gS472BKpzfWh
	vGxKDuk4U2/muPhpK3p/V17AMgkhp2mR0eDUVfI+KP0+GSqy6usMJA9PKyJEnkQojDCjePDfFXXDR
	75G+a27ZNyuw64UCR80w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NHg-0000000F1pA-2oYa;
	Fri, 11 Apr 2025 22:55:40 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NHe-0000000F1om-00Ex
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 22:55:39 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-7c58974ed57so242314085a.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744412137; x=1745016937; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BsvfhzOprEtaLfmXELk368lBC6dzFrOtz5GX2QaLNAI=;
        b=e90fhVCqdWa1+IpF6SVeOgsakPC0tSIiipPe2v5AVEDQAoCIt7DMLUVxem7eYAArZq
         K+BY2BZH5B8n+jbqGCWe1QZSTQ5jXr/qZtKXlQ32ToPzUn2M27wfpgvRboFk812Wn7/9
         4utbErAThhPm6YvdYfY9tsdSDEi8cTYWbjWM/LlWGKzeb6ybn8JLilLwORAw1wggGFCS
         eZdoNUFWj33IeDQBFKSuNXbN1BhtZ8wX0B+Wb8xrtw7vStzhrFlKlv4uDRfm2JFAkoDC
         Red27ZDijFvI9xRbhttAsUVxxh0nuvhkOtZLKPZ9G3fLcIapDOr3egD4ZG4PwDz4NtZ7
         TTVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744412137; x=1745016937;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BsvfhzOprEtaLfmXELk368lBC6dzFrOtz5GX2QaLNAI=;
        b=FuRaMr3ufjb+QCYd0NYcTj1+ur6hDrog9JW/STz9A81Ff6NGSqL9SNrlEQWgEY0AHf
         VeTN0TnMYfaGZ9PERSYZyjd8WhkUo9hk9/eVCaav0kQpZ5avRYtG9Dne1wtD3uSmHaF1
         kMxCaMeIauonqXE3vShjf2OMb1PK5DMPD6ElSpr9mfJofhtVwrH25wTYK0UE1yQnKBlL
         84q80Iwp8SwSng9vAC+rOU3Pia4sqfCJXJOJh2+f9p+HVihzywX4F8H3gmod5jRZl3yw
         gQYmLDmPhy+YNMDsApJgGYQ2qbxk18teC7guB4/clOttmciA3VTld4kbAi5EZDXcVObJ
         S22Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6UOjjvUe6JyU4dIK36jD0W9I9oLA60BZbpThVvXhnGUmMy9huYk7wjmY95eO5fm9G4scBaag3wqi3yQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzgtVDggvwoG9LXAxDRM38kgJEsZbmNpngpofXGAPDfqycWCg7F
	RXa8zVEsz3zOPVCI1bzd3/GL8m4wpcfwXFaGYeIt85tKXDFHUixE
X-Gm-Gg: ASbGnctnWk1YUopJsLwVqKhFDTQauVudCM9wYJtCZXGXTANZrnq2kSVMQeutsYXPLzV
	IG/LI8pXKR+YGAxT0BTYFgUpFXalHD2OQQftV+FRorXPCF9ICprlt2KnKUFdPl7Tu6Ssq/uGOwS
	wb7MqP85ei6pqlqHDunwsWGpt1dQaSlAhTDS52POqeO67eeSTlZzlBjGrmX6VmMwnsxp+xZ5bCy
	QkVPsE+DtpPGBfa4lrEoza6+8HquC7ozk6qfsGNQ0GCZnwhj2LR2sf5dffNcAdFq9y83KI/JxfX
	NlvPxnUcDFyYuiql
X-Google-Smtp-Source: AGHT+IE1/vXomAHPxMpa48ltkrdDHc/3oW7KILrsJLrC6iJGPLluuSppvCXu45uAv9myLPwVn1XuLQ==
X-Received: by 2002:a05:620a:4148:b0:7c7:a1c4:86e2 with SMTP id af79cd13be357-7c7af0c0fbemr711017585a.11.1744412136857;
        Fri, 11 Apr 2025 15:55:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c7a8943bd5sm325345885a.14.2025.04.11.15.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 15:55:36 -0700 (PDT)
Date: Sat, 12 Apr 2025 06:54:57 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Guodong Xu <guodong@riscstar.com>, ukleinek@kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	dlan@gentoo.org, p.zabel@pengutronix.de, drew@pdp7.com, inochiama@gmail.com, 
	geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com, 
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr
Cc: elder@riscstar.com, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
Message-ID: <cwbbq6pubksgpbloqdxspn7sr7tanbjdnbdobctayblpkahukp@zxypidw7a6un>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411131423.3802611-8-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_155538_037842_98454957 
X-CRM114-Status: GOOD (  18.31  )
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

On Fri, Apr 11, 2025 at 09:14:21PM +0800, Guodong Xu wrote:
> Add a PWM-based backlight node for the Banana Pi BPI-F3 board,
> using PWM14. The backlight is defined as a 'pwm-backlight' device with
> brightness levels and a default brightness setting. PWM14 is assigned
> a period length of 2000 nanoseconds.
> 
> This configuration was used to verify PWM driver changes, with PWM14
> tested and its waveform confirmed as correct.
> 
> The node status is set to "disabled", and should be enabled when the
> display driver is ready.
> 
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
>  .../boot/dts/spacemit/k1-bananapi-f3.dts      | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 816ef1bc358e..d04b57ddeb46 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -28,6 +28,32 @@ led1 {
>  			default-state = "on";
>  		};
>  	};
> +
> +	pwm_bl: lcd_backlight {
> +		compatible = "pwm-backlight";
> +
> +		pwms = <&pwm14 2000>;

> +		brightness-levels = <
> +			0   40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
> +			40  40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
> +			40  40  40  40  40  40  40  40  40  41  42  43  44  45  46  47
> +			48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
> +			64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
> +			80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
> +			96  97  98  99  100 101 102 103 104 105 106 107 108 109 110 111
> +			112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
> +			128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
> +			144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
> +			160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
> +			176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
> +			192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
> +			208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
> +			224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
> +			240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
> +		>;

Can we simplify this level matrix? I see it is continous in most cases.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
