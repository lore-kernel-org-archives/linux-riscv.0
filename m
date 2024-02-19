Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B76AC48260
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 08:26:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/PLsIyEc4iiLaoN0xN4cFTpDBNOFLm6ve8JuszrFhQU=; b=jmfKsATJ9h5Nn3
	O48OgxQWu+BkjLdyVycWZT6uBOGeo77I//MYLLoNb7lc7UZa4uW2d8SRHXbvCrfhq963mhXryQrGu
	QWosWI0YCP9X82ZPsTIacntPr8EdkK/2e4bJnf3FywZu6S4LVCQ1PYr7Fm2u4DrtfmvMjDvOYSQxr
	GSGnJuTRXdn2RwXvAhvFKDpMrm3L0QOzXEd0z+WyhfBQR7z3bwX30+jaTLXHEAi3x6GsZAiwzvqIc
	uLq+ft8rnNeWdbpoRvKUihvG1s6LFmvLq2Qv1d9myotTvrwoyZfJvRDiTOxhRPfFxWaeCexTCDkIL
	jsQS1telgQROoyXnfemA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyyL-00000009Z6A-3V6V;
	Mon, 19 Feb 2024 08:25:57 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyyJ-00000009Z4u-3Gqr
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 08:25:56 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-41266ef4bc3so3408755e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 00:25:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331154; x=1708935954; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THU6glyGzZOjGWrBiKmvVasWAwiX7vB5lqswuej4FLE=;
        b=eO0DV/jyk1d3yQmHf6LD7h/F/VhkophHqDDUsj/VsmO8pAn9OEA0zcPG0+1w7dPkvY
         Vob1oou5rK5BIWHEcxbH8YOfG4DQ8+eBdz30fEMXSwNia9Ld3oBrWcrgYAAaFplwMwi8
         Y8byJUUvvg4np5qKhYpafGGaGzAfmUYVP3uDf+V6Ay4DbKln3h3J4UHpOzu4hPxwAH3K
         O47H4cyM2GBC1Y/umXICM2RPiNT7FfZW4ioLlzQb97OifHIcYPH0vroXHtUcdYX8GLx6
         V2HVvP7ccaspv6mPoIHLLCxVlBiewkeUvjqyaJPf+uPT3bDpZw11O8qClN/GqOHhjLN7
         iguw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331154; x=1708935954;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THU6glyGzZOjGWrBiKmvVasWAwiX7vB5lqswuej4FLE=;
        b=FqVxv+D4TKat3/dgEumOFrv8PRl+Glj2aAYhl0Dkem98RPtpOxI1lE68O62tJ3eX6r
         sOlV1SMAGxz85ZxRmPCiRRpEV/05G41eZBp15KiYZGWK0od3xYpcoyf4EejLFfC8vBJB
         sbi8pFQv5cNO6JkUAR0VhIy3Tnw1o+FYYsR8Y6hYmLzsERfXQMBYPT1/oslI3cyYVhNa
         KLtpZ0yJ9gygz6x9LvCBde/xZPziTYNczgg3ezvqGI2SWTs9MjO0JTHqrxUeCKOj/azO
         bsN0PtRIu/araJMYI9u9Q6RxyllA7rUWieow7o8nC7B5s6AxGungjgoS2YEGVwdqR9yA
         08fA==
X-Forwarded-Encrypted: i=1; AJvYcCUCTT293shW6GkuTGMUljH4zqMf9dWFEdyGkhiitCANRl0HHbgYxWxSbyzetl11A4qi30ydyhqDYAQreVYgO/iTFl5Mdq7a/XiqoiWGBWyr
X-Gm-Message-State: AOJu0Yyk/fs6jijkh0541v5fX9dDGGeQePZqMLRWwm0GUUhpXhS704vA
	2YnDA03A+joZ8TNKf2RqIkx+EvA89pobXCBSCdQca3JAN5aMnXQd7zczOJifJFo=
X-Google-Smtp-Source: AGHT+IF9L/CaymxUFdiz527jMYT6eakK5vqvOw31jhwzGW9Ykq8Lf7BMYyEPxr5CsmTss8mE4dWNgQ==
X-Received: by 2002:a05:600c:4f83:b0:411:fbfa:959f with SMTP id n3-20020a05600c4f8300b00411fbfa959fmr8412572wmq.27.1708331154076;
        Mon, 19 Feb 2024 00:25:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b00411d1ce4f9dsm10468796wmi.34.2024.02.19.00.25.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:25:53 -0800 (PST)
Message-ID: <a71a36fe-d70f-46a4-85fd-edd07c7a5bcb@tuxon.dev>
Date: Mon, 19 Feb 2024 10:25:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 08/17] clk: renesas: r9a07g043: Add initial support for
 power domains
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdV=qpVCokRW1vGDS3_ZF3RE0nVcNi9URXMNS6bUtxqTZA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_002555_840740_57C084ED 
X-CRM114-Status: GOOD (  18.23  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpPbiAxNi4wMi4yMDI0IDE2OjA5LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgQ2xh
dWRpdSwKPiAKPiBPbiBUaHUsIEZlYiA4LCAyMDI0IGF0IDE6NDTigK9QTSBDbGF1ZGl1IDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4+Cj4+IEluc3RhbnRpYXRlIGFsd2F5cy1v
biBwb3dlciBkb21haW4gZm9yIFI5QTA3RzA0MyBTb0MuIEF0IHRoZSBtb21lbnQsIGFsbAo+PiB0
aGUgSVBzIGFyZSBwYXJ0IG9mIHRoaXMgZG9tYWluLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBDbGF1
ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4gCj4gVGhhbmtz
IGZvciB5b3VyIHBhdGNoIQo+IAo+IEFzIG5vdCBhbGwgSVBzIGFyZSBwYXJ0IG9mIHRoZSBhbHdh
eXMtb24gZG9tYWluLCBJJ2QgcmF0aGVyIGRlZmVyIHRoaXMKPiB1bnRpbCBhbGwgZG9tYWlucyBh
cmUgaGFuZGxlZCBpbiB0aGUgZHJpdmVyLgoKb2sKCj4gCj4gR3J7b2V0amUsZWV0aW5nfXMsCj4g
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKPiAKPiAtLQo+IEdlZXJ0IFV5dHRl
cmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGlu
dXgtbTY4ay5vcmcKPiAKPiBJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2Fs
IHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0Cj4gd2hlbiBJJ20gdGFsa2luZyB0
byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0
aGF0Lgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJp
c2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9s
aXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
