Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2F55C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 14:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJ2669KkI7FQMC2QJ/lEZqa8wT/mnD0W09igZRhkfxg=; b=rEfPiEtdh8PLdg
	bK5Fy3BgLCUNGET1NXyF+3DvJpp6ARqzYt+AQUNqBWohy+46HhjV5TVpS9ogJ4T0OfSwgvAZX6Phh
	A0Lnn2JEK6udedO7AIUi+RXGqse9l0QtkIuCaIyyhh2q1l+QhnKuUAotAmPwlp9giyeh4qWzNkmRR
	x9Bfdanjx9RF/SzDm5DckiJfXgyAs6tqXBpZPZrrbcD/LfocOovczAGttX4sK57YFasMnPas7x8XQ
	qfMIL4vSSwiBt9EJYgtnSmXl4PVO8H73v0SquYRQ82+UQ84f/i/fSdlr+7ehQV05KdRokFwzQYSL2
	QsWCOT8fBZsP5m/SnV3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FTa-0000000E6zq-3Mcv;
	Fri, 11 Apr 2025 14:35:26 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3FI4-0000000E4nl-46Iy
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 14:23:34 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-72b82c8230aso605081a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744381411; x=1744986211; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+E7p0o5spFsIl4UEBEn7tp0i54T+KYSkEhlNQklbq8A=;
        b=TNxtT6xgQ9l5MCbbuFaFXvL+ZuAYYs9IeIt+0F+tnX0pEYm1JhyJ3uPPlnvMkW5pQ9
         HfDpwDxCegG/7R99jIRgVh3NhIssnLrwCBFVfIRVBw4895KjITFa8/Hq03FU1+bB4x3O
         AFJtQjrOTlrfusWYEDYELM5bTwz/4OEKBztMBtzdyyPn1YZSXWecZ6Kvh8ej6z+LdVB2
         UK/m0VI2NenySBEo0pmCpBaP/NaLj5ZAfJ4Wsy68FG/b0nwzgnZuD7b0pBOvoUqnFnjS
         yq1F4Kep0Bskv3LiJ+LfXxkAbvkEr1OUJsFtcJn5LZ3/OsVRMGF/mMgVTwuzariRYUP+
         AgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744381411; x=1744986211;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+E7p0o5spFsIl4UEBEn7tp0i54T+KYSkEhlNQklbq8A=;
        b=FxbpUrUMVwLbDvc5j49G9pe4MW6c8F4WUSbmyIOsFUHszm2OadDI6cJdFBRv4Yw2Eo
         400wrZ5hQFpaKSKZaE1dOyPJFTUaizS4QadGMXa9rEVlvR0Pez6cQ1uwGJhZhZwLqu0h
         GB601+BSovuzfzrw1IXfr7XI3/Qw4dDq/fQLUC1YQKS/0l+R8a3JbfSuG/oyv7ILbI9I
         gXe2z92PvaYf5qST0i8M255z8deJLXooHpQvyGaApDzdNj5DU05/DAcVSm8BW73+onmD
         rHboJkC5SSCOs5qv4YGf9WcEzUzb4R6vgcfFRq1PDjr6fOAUirhhGsxeKTtjr58OQ11V
         kqnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLGRIVAooINPsq7EEkzsXcHV/e47zd3hjgsJmYs9mGDP69LQ6ExQ5tlVnNwQrzrVP0Nt1k/szX7Sg0gw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwIP26uPLBS6R8+Qf97r9QHz10zKt6hnGHGzxwfmt+3kdVC7CP
	k8AlUErpZ/ggdO8Z/nVUWsSU/vj63I6OFNGeN45xXkavDwNeZoBid9B3E6tRYVs=
X-Gm-Gg: ASbGncv8cSsP0+JZppKuzyg3bARj5EzqHG7ygKLJmw8eILxIx3iLuS5S6FQDESDn97E
	+PeGruuB66aSc/9kMY4mgTGB7WXW/biaYI0XjQ2otDhw5F2xjO8/Cp7Tb5lWXsyY6i3b/NYpzbI
	FS23mpHd7cb6y+lTp80zBB9APaUefmQM/gliKrwFxmCz0rQd03l5TqTkI7jaRRhyXzkFbEbjO+f
	6zdxmmcazi2iGeqVwti/NjGl5n3u1nyp9GDOT5FQzq120fspIEV3eruE041HpuWbIBz0L/Gpqst
	0ySlN27xSIqIGRlZ4443Rq8K8DYCHJDi4zH6CvldO13m705/7KiUu/2uo56QbGAP/Gpj1XxKf2g
	BRcg1
X-Google-Smtp-Source: AGHT+IFPIaNYuj9Tjx4dRLkT1R8N8HYwjaMapquLcZYIrOm6BqeSxjwlZBr9Pe67U0+m0146ayQe0A==
X-Received: by 2002:a05:6871:a4c1:b0:29e:5de2:cffb with SMTP id 586e51a60fabf-2d0d5d8262bmr1560654fac.17.1744381411628;
        Fri, 11 Apr 2025 07:23:31 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d0968ea1c6sm1133431fac.5.2025.04.11.07.23.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 07:23:31 -0700 (PDT)
Message-ID: <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com>
Date: Fri, 11 Apr 2025 09:23:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support for
 BPI-F3
To: Yixun Lan <dlan@gentoo.org>, Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com,
 inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org,
 tglx@linutronix.de, hal.feng@starfivetech.com, unicorn_wang@outlook.com,
 duje.mihanovic@skole.hr, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
 <20250411140510-GYA22364@gentoo>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250411140510-GYA22364@gentoo>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_072333_292858_6A5F4302 
X-CRM114-Status: GOOD (  19.27  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/11/25 9:05 AM, Yixun Lan wrote:
> 
> On 21:14 Fri 11 Apr     , Guodong Xu wrote:
>> Add a PWM-based backlight node for the Banana Pi BPI-F3 board,
>> using PWM14. The backlight is defined as a 'pwm-backlight' device with
>> brightness levels and a default brightness setting. PWM14 is assigned
>> a period length of 2000 nanoseconds.
>>
>> This configuration was used to verify PWM driver changes, with PWM14
>> tested and its waveform confirmed as correct.
>>
>> The node status is set to "disabled", and should be enabled when the
>> display driver is ready.
>>
> .. see comments below
>> Signed-off-by: Guodong Xu <guodong@riscstar.com>
>> ---
>>   .../boot/dts/spacemit/k1-bananapi-f3.dts      | 32 +++++++++++++++++++
>>   1 file changed, 32 insertions(+)
>>
>> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> index 816ef1bc358e..d04b57ddeb46 100644
>> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
>> @@ -28,6 +28,32 @@ led1 {
>>   			default-state = "on";
>>   		};
>>   	};
>> +
>> +	pwm_bl: lcd_backlight {
>> +		compatible = "pwm-backlight";
>> +
>> +		pwms = <&pwm14 2000>;
>> +		brightness-levels = <
>> +			0   40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
>> +			40  40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
>> +			40  40  40  40  40  40  40  40  40  41  42  43  44  45  46  47
>> +			48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
>> +			64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
>> +			80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
>> +			96  97  98  99  100 101 102 103 104 105 106 107 108 109 110 111
>> +			112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
>> +			128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
>> +			144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
>> +			160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
>> +			176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
>> +			192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
>> +			208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
>> +			224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
>> +			240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
>> +		>;
>> +		default-brightness-level = <100>;
>> +		status = "disabled";
> I'm confused, has DT in board file with disabled status doesn't make sense?
> it doesn't really useful for placeholder, even worse that functionality may not
> verified, so I'd suggest sending along with display driver while at it..

I think I suggested he include this.  Guodong tested PWM using
a backlight on a display connected to a Banana Pi PBI-F3 board.
The above numbers come directly from the downstream code, which
uses this PWM consistently as a display back light.

But you're right, the exact set of numbers to use is dependent
on the display used, so it's better to add them when the display
gets integrated.

The pwm14 node could update still be added here, but that too
might as well wait until there's something to use it.  So I
think this patch can just be dropped.

					-Alex

> 
>> +	};
>>   };
>>   
>>   &uart0 {
>> @@ -35,3 +61,9 @@ &uart0 {
>>   	pinctrl-0 = <&uart0_2_cfg>;
>>   	status = "okay";
>>   };
>> +
>> +&pwm14 {
>> +	pinctrl-names = "default";
>> +	pinctrl-0 = <&pwm14_1_cfg>;
> ..
>> +	status = "disabled";
> ditto
> 
>> +};
>> -- 
>> 2.43.0
>>
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
