Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006D4C369AE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 14:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JbwXC2jM6SC1mYwo1EFvQnr4gRs1vhInZM5fXiRIbvU=; b=TmTY4YUKtWc/PU
	tBF+MFYwWYlduI3lNoir2ZpIH0WBcxMB7g4hGjqP/qx/qU99rL9dQrlm0u/C3ynoOSrOBAo8zAqlf
	o3SIz3miRpjKIMshBmmDJWcyx8xQ7FD0KUd7Ns7+B6W8WMkyCMx8d0US2YMsEUjULqbQoZnh91dmp
	Uwn6FrGgmU/j3q4nF+yb80fZJrWCfjzvpYwtAmTLvFUkPmrlFVQDPn+yKeUqAJJfVaTLgUIMLp5HJ
	Xv/j49wm3Icr0z+E6DsG7M7AYv6AhVvPADJjmY1K5UIgmBdlJoMFSQ0loQSWowAf9xxBRPS8tc/F2
	jz6xCzaWIaBSPDTRexjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FH4-0000000E4Yd-3vHt;
	Fri, 11 Apr 2025 14:22:30 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3F0P-0000000E1Xj-2bar
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 14:05:18 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 901F03433FD;
	Fri, 11 Apr 2025 14:05:15 +0000 (UTC)
Date: Fri, 11 Apr 2025 14:05:10 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de,
	drew@pdp7.com, inochiama@gmail.com, geert+renesas@glider.be,
	heylenay@4d2.org, tglx@linutronix.de, hal.feng@starfivetech.com,
	unicorn_wang@outlook.com, duje.mihanovic@skole.hr,
	elder@riscstar.com, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
Message-ID: <20250411140510-GYA22364@gentoo>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250411131423.3802611-8-guodong@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_070517_678979_89716596 
X-CRM114-Status: GOOD (  17.04  )
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


On 21:14 Fri 11 Apr     , Guodong Xu wrote:
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
.. see comments below
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
> +		default-brightness-level = <100>;
> +		status = "disabled";
I'm confused, has DT in board file with disabled status doesn't make sense?
it doesn't really useful for placeholder, even worse that functionality may not
verified, so I'd suggest sending along with display driver while at it..

> +	};
>  };
>  
>  &uart0 {
> @@ -35,3 +61,9 @@ &uart0 {
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	status = "okay";
>  };
> +
> +&pwm14 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm14_1_cfg>;
..
> +	status = "disabled";
ditto

> +};
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
