Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A05C369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 23:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=myH7jQmeo67ap3OEHLeDX41T4UybBUt++98n+3W4hpY=; b=nM1PQnrzhZ7YWE
	HUS8oYP6Vr0AGpCqrlQEHaA3ixhlhnJqsUaZNX0n9VqQTaTW9kzYMaR2bLj47RB0SNwe6cgZEY9On
	k7eCLzsbR+j9iYeD2lTkDSEBTh+6OhP8HfUSVdzh/ZW3MpXpcJie3JTcdEMPPpVa0YnwcQnL5Z0y8
	jj0zKGz+Fe0GwvZ1ZH4mhVkynZquNDk7NWJfQfewEptVqcdiOnJo5Yn1e7AIjz1b4mBaPhwXLtoie
	/5x9AwIRKOf93oFf2CaUalnQWcHOjcEHln+KKKfWOp5RZd40jcpreW0cN+YB2Hj3QpGy/b5b+LuhH
	TtE6Vljf3ZDamPa3GI6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Nnm-0000000F4XW-40ZV;
	Fri, 11 Apr 2025 23:28:50 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Nnk-0000000F4X8-1ZUD
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 23:28:49 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-476ae781d21so24401081cf.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Apr 2025 16:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744414127; x=1745018927; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvhHzpdybge7k/1xu+C8wVpLlcBQbPdkbGL/bYzd4aw=;
        b=hhobNKC+StVqjjfDZ4W31RxWiUScrRBdiMoJtQzrE4qSTwHtPDYGiILdYW7zbPrKCb
         o0bFOd6R/wZ++K0W/UJZswJdS4ULqCHwWuffTbBLk5I6Uzgwz69FjhJpVFoM/3w30wOF
         BZDCs/Xi0RFEKHh5YswCRiiyCvYXQV2U9IdkgPH2EWiYCfoNZBYpJtVEj2etmjB7+dPp
         lNOsYY2K4tK1HP//mUbKA08zOJ3LDJdezmJ20LoVzkV6fCmsIjuFtoyIrvFXYS1BprRr
         +SdcStpacdhkjyKGeRPevs/FD10csrgOXZkqpfGPKb1b1oQ9tyT/GAE4R1FgGQrHVoQK
         3zUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744414127; x=1745018927;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UvhHzpdybge7k/1xu+C8wVpLlcBQbPdkbGL/bYzd4aw=;
        b=PtakJAw4gZkjEG6daJ34AZHLhva92zEzEVr9SVlL0jLesiDEkxfzpqGTkzyE1eGbbl
         Kw/twhFW7PuC3/uUrmmbNcBjC9DeFps2P1fM+hrelZKy0w05IeMKROOXnIjQz5hU1Lw9
         83KTjNj1kNNNnzaASjnt1p1qrW3Pbap4rz9h9HYNv0WQyfqEVJSTe7CUysqc8Kh/rjw9
         pa9cdYCg5kuBx7E45JwTJVlzeRF3mEF16n7s6IE8EiD1bwQtkvQfL8YacfFSh2L8SoRS
         XsFUP0r+YG+7UsuZJL3YrS1RvC1nH7p9dLbN7XJWlKMmlsiklmqHM14uy1mNZmwIAMJ1
         ZWbQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGh/xKrxekFbqlc1OShPSs5xFxqk4Driuxm33nTIzgTVC9xNsl+WTtDACfU1nDfn/ck8SoY9iP2E7NGA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/quf61rEwf9r6HbstbEayjPMqvM0o64hDs7dPH+/lsCKcDx0m
	5NHEmyUmXKXsJUbiU1OTLE9dSlvbGXQrAA6BWsifdUSB6KoFd1k0
X-Gm-Gg: ASbGncsgEYO/AYb40lEXHstKOInvBbpZum/SER3/8RlackRAF7pJmJ8K3wA8hi9cE+n
	X6GdBPUBQ5oFGpKqKyyBS9bOrGEdksrZ1zztnOKn2S5j7ZK2pFPQNA+Ps7WeMxboESD2wQbDscF
	42jOicrQmF5yLwmdS1oi/QEbgovCFXoWermjYCe+JZbujjbDr4+S+KptL7nWZVqXcaP9U+cAOzR
	DnYVaIOf4jUD5u/N1Sv4CmUhp1YzbrgLAdbmBg7OefKhp3P9fMMsAHBDgAGoV0gDC+gydMPCCsd
	iEgK8ogwvQExIu55UAAq86cBf/E=
X-Google-Smtp-Source: AGHT+IEULaHSVU7/79T4sGgtSLDudJBk/aXEwPTYZC6UzLhe6HrogH+KkmZ3Al7QHscxwG8JxOb5sg==
X-Received: by 2002:ac8:5fd6:0:b0:476:980c:10a8 with SMTP id d75a77b69052e-4797752ddf6mr68207601cf.21.1744414126840;
        Fri, 11 Apr 2025 16:28:46 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4796ed9bcdcsm33442711cf.49.2025.04.11.16.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 16:28:46 -0700 (PDT)
Date: Sat, 12 Apr 2025 07:28:07 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>, 
	Guodong Xu <guodong@riscstar.com>
Cc: ukleinek@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, p.zabel@pengutronix.de, drew@pdp7.com, 
	inochiama@gmail.com, geert+renesas@glider.be, heylenay@4d2.org, tglx@linutronix.de, 
	hal.feng@starfivetech.com, unicorn_wang@outlook.com, duje.mihanovic@skole.hr, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 7/9] riscv: dts: spacemit: Add PWM14 backlight support
 for BPI-F3
Message-ID: <j35vjluiykbu2gxg5zkoxm67muj5y66zn6tjwhdbnolkyeilh7@cubjbzouewiy>
References: <20250411131423.3802611-1-guodong@riscstar.com>
 <20250411131423.3802611-8-guodong@riscstar.com>
 <20250411140510-GYA22364@gentoo>
 <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d2c26d3e-787a-490e-9134-8ffe2f6b8333@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_162848_417197_99B56D4B 
X-CRM114-Status: GOOD (  30.84  )
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

On Fri, Apr 11, 2025 at 09:23:29AM -0500, Alex Elder wrote:
> On 4/11/25 9:05 AM, Yixun Lan wrote:
> > 
> > On 21:14 Fri 11 Apr     , Guodong Xu wrote:
> > > Add a PWM-based backlight node for the Banana Pi BPI-F3 board,
> > > using PWM14. The backlight is defined as a 'pwm-backlight' device with
> > > brightness levels and a default brightness setting. PWM14 is assigned
> > > a period length of 2000 nanoseconds.
> > > 
> > > This configuration was used to verify PWM driver changes, with PWM14
> > > tested and its waveform confirmed as correct.
> > > 
> > > The node status is set to "disabled", and should be enabled when the
> > > display driver is ready.
> > > 
> > .. see comments below
> > > Signed-off-by: Guodong Xu <guodong@riscstar.com>
> > > ---
> > >   .../boot/dts/spacemit/k1-bananapi-f3.dts      | 32 +++++++++++++++++++
> > >   1 file changed, 32 insertions(+)
> > > 
> > > diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > index 816ef1bc358e..d04b57ddeb46 100644
> > > --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> > > @@ -28,6 +28,32 @@ led1 {
> > >   			default-state = "on";
> > >   		};
> > >   	};
> > > +
> > > +	pwm_bl: lcd_backlight {
> > > +		compatible = "pwm-backlight";
> > > +
> > > +		pwms = <&pwm14 2000>;
> > > +		brightness-levels = <
> > > +			0   40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
> > > +			40  40  40  40  40  40  40  40  40  40  40  40  40  40  40  40
> > > +			40  40  40  40  40  40  40  40  40  41  42  43  44  45  46  47
> > > +			48  49  50  51  52  53  54  55  56  57  58  59  60  61  62  63
> > > +			64  65  66  67  68  69  70  71  72  73  74  75  76  77  78  79
> > > +			80  81  82  83  84  85  86  87  88  89  90  91  92  93  94  95
> > > +			96  97  98  99  100 101 102 103 104 105 106 107 108 109 110 111
> > > +			112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127
> > > +			128 129 130 131 132 133 134 135 136 137 138 139 140 141 142 143
> > > +			144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159
> > > +			160 161 162 163 164 165 166 167 168 169 170 171 172 173 174 175
> > > +			176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191
> > > +			192 193 194 195 196 197 198 199 200 201 202 203 204 205 206 207
> > > +			208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223
> > > +			224 225 226 227 228 229 230 231 232 233 234 235 236 237 238 239
> > > +			240 241 242 243 244 245 246 247 248 249 250 251 252 253 254 255
> > > +		>;
> > > +		default-brightness-level = <100>;
> > > +		status = "disabled";
> > I'm confused, has DT in board file with disabled status doesn't make sense?
> > it doesn't really useful for placeholder, even worse that functionality may not
> > verified, so I'd suggest sending along with display driver while at it..
> 
> I think I suggested he include this.  Guodong tested PWM using
> a backlight on a display connected to a Banana Pi PBI-F3 board.
> The above numbers come directly from the downstream code, which
> uses this PWM consistently as a display back light.
> 
> But you're right, the exact set of numbers to use is dependent
> on the display used, so it's better to add them when the display
> gets integrated.
> 
> The pwm14 node could update still be added here, but that too
> might as well wait until there's something to use it.  So I
> think this patch can just be dropped.
> 

If this patch will be applied as it is after applying the display
driver. I recommend to preserve this patch, but move out of this
series and resend it as RFC. If this is only for test purpose, it
is better to move this into the cover letter and address it is for
testing. 

In most case, patches with some unmeet dependency should follow
maintainer's request, or has specific purposes. It also needed to
be marked as RFC.

Regards,
Inochi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
