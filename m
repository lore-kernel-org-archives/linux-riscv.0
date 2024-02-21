Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9917C48BF6
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 06:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lrvjwFxfiYU4oxDwjzEpHy2fVwtPN0K/R7XelT0xoA=; b=5EG0bxZZVadEu7
	8dusOEgBIeUUHik8LI7xWNa38ctQKsvGTsRbe66VHtn7pzRcL7b9yzlZ9qjCDUYjen2n/PYbvdCa1
	DVdO/EbEkQehxnIUPQCk+3URue34I9Sog0yjmYOeNRTxtxK7UObnbtafiaIzOgin2GIatI8hCt+H3
	H0sHZdhEDzvQGiwgiRQGJ6qfZN8yWsYimuf3cabrp6Ob1QwbpHLuq+D/S1gHVbhLvbpXRywP8Owc5
	C56LTq16rkW42MzfmmdngGfvs3fvaCETYapeXWQSfQZD/YvhINOQClsLiyRX7z/D/xv1zsTqhMkIP
	V3Un8RsMV4n0EeVdVMyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfsl-0000000HIps-0voE;
	Wed, 21 Feb 2024 06:15:03 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcfsi-0000000HIp5-0xd0
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 06:15:01 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-564fe0273e4so200766a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 20 Feb 2024 22:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708496098; x=1709100898; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TK3Wur+Ze9Z4Yt7si29B1E6PfnCzOWp0cMuA39AeGfw=;
        b=jMoz5IRjnCS/iGAEeMfngI6zhFQCyC7F5O7Y0ZCBkrHd30UBgNCbxfljy71EMbA5lY
         QHyDxhJjBgHyVEJi+AkHTROyC0pbDYGwXSKelcErXS3Nf/GWCZHmHgbv132swIbI6a09
         BpCSG6Q7xkgtn696PQiCQV0laycB30bi6iJE/+EaREWnVbm61uVoYUIeMp+GKLE1wyiv
         E9PRdoK67sWW2Pmpdn/FLBZXRV/Oe3TIJZ8co3y5flNHY2Vz8lsFMbB72ymoaE21M/V6
         me4d7EaQcO1vH1CVKHPUUA5/bqvZliqfNUmF2/E8hyPGkGUguWlh4CEkgg96ygRdKvxT
         yRrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708496098; x=1709100898;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TK3Wur+Ze9Z4Yt7si29B1E6PfnCzOWp0cMuA39AeGfw=;
        b=XTr12bL1Xc779oCV/PvOLmYKecQ8cMQhXlWXEJK79vJlOCAtQ7l2qcxGmDyKt496qW
         aB8H1uVOYoLEbNG32HzMJe0yivoNWWvRfJbHZZ+BvZ8Nq5hJlws0YLpQ6bcNuk0SHiNu
         xeYCmSX1LYvYj4jTnCz8ANGQciHa0plGZajZRuf6Suf+WaJQoBkWdCWukIYCnf1E1QgS
         QuzF0o2//GZhw3Wlv41/VhbMeXKcnWP1lYLQW093Nlir2v1xG9CjnZ7rG+GtK3dE7ifq
         IQ9btgdub8VKTD9OewziAAe1mV5s/FEVyqc5dFzFkqhl3lzrDo2fNAy6fvlMhtEWtnuS
         XczA==
X-Forwarded-Encrypted: i=1; AJvYcCUU2e71Ky4iCQFT9Fic0wMkl8Zq2Q5yML6aq0EgQqJe/wi0BCAngVRG0BWBwZ/XztKqrjwHrzh0vRx0lgMqq9nqYL3m4haAa990dakM+RAh
X-Gm-Message-State: AOJu0YzkQJYYjRyI/aQ1K8P35KmWDWJMtUGmxLs2ux5Q/pyJtnTHwyUb
	c00TwhFOG0DWhPDE7CnEdcfVUCDCYaHxqsHobmdOC1PYxXmss+PmF1ZbaY67Y1Y=
X-Google-Smtp-Source: AGHT+IHJgCqkyCT0BdpiQsv+Wg7+W7Zmg9TNZj+V1thWG6ry+4L227ijh2oJSVuNrkH3E0x0tobFOw==
X-Received: by 2002:a05:6402:1502:b0:561:e4aa:ef2c with SMTP id f2-20020a056402150200b00561e4aaef2cmr12951195edw.32.1708496097796;
        Tue, 20 Feb 2024 22:14:57 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id h14-20020a056402094e00b005644221a3desm3389815edz.3.2024.02.20.22.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Feb 2024 22:14:57 -0800 (PST)
Message-ID: <046416da-58de-4fc4-ae01-d83f63c038f9@tuxon.dev>
Date: Wed, 21 Feb 2024 08:14:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] clk: renesas: rzg2l: Extend power domain support
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: geert+renesas@glider.be, mturquette@baylibre.com, sboyd@kernel.org,
 robh@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-8-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdU+WRJLLH4zUvAnsfNtgUxsNGe1bCKLu+98BC6K0d6Rgg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdU+WRJLLH4zUvAnsfNtgUxsNGe1bCKLu+98BC6K0d6Rgg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_221500_411822_509B0FC3 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

SGksIEdlZXJ0LAoKT24gMjAuMDIuMjAyNCAyMTozMiwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Ogo+IEhpIENsYXVkaXUsCj4gCj4gT24gVGh1LCBGZWIgOCwgMjAyNCBhdCAxOjQ04oCvUE0gQ2xh
dWRpdSA8Y2xhdWRpdS5iZXpuZWFAdHV4b24uZGV2PiB3cm90ZToKPj4gLS0tIGEvZHJpdmVycy9j
bGsvcmVuZXNhcy9yemcybC1jcGcuYwo+PiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJs
LWNwZy5jCj4gCj4+ICtzdGF0aWMgc3RydWN0IGdlbmVyaWNfcG1fZG9tYWluICoKPj4gK3J6ZzJs
X2NwZ19wbV9kb21haW5feGxhdGUoc3RydWN0IG9mX3BoYW5kbGVfYXJncyAqc3BlYywgdm9pZCAq
ZGF0YSkKPiAKPiBBcyBvZiBjb21taXQgNGQwODI0NjA4YTYzNmI2NCAoInBtZG9tYWluOiBjb3Jl
OiBjb25zdGlmeSBvZl9waGFuZGxlX2FyZ3MKPiBpbiB4bGF0ZSIpIGluIG5leHQtMjAyNDAyMTUg
YW5kIGxhdGVyIHRoZSBmaXJzdCBwYXJhbWV0ZXIgbmVlZHMgdG8KPiBiZSBjb25zdC4KCkluZGVl
ZCwgSSBub3RpY2VkIHRoYXQuIFRoYW5rIHlvdSBmb3IgcG9pbnRpbmcgaXQuCgoKPiAKPiBHcntv
ZXRqZSxlZXRpbmd9cywKPiAKPiAgICAgICAgICAgICAgICAgICAgICAgICBHZWVydAo+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
