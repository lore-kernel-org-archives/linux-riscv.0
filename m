Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F57FC2D0CD
	for <linux-riscv@archiver.kernel.org>; Thu, 15 May 2025 09:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVKX3RPH2RDprCEUj4Jgo0X5f1gLjRFN9exqUoMpvGE=; b=47jjsdt0wJFgNC
	0U7WR+MaplyZMG7JvV0bMX+uKVCMpxxrRLVuLogv2MNkdbMvmT/LOFKg+RmpgERo0NhC/USnhKOr6
	7sQ/g4wYCoSKVEtthtaA71yMtZX9Sh6dLiEbCvYbl5+Q5Ase0mojIk8rzPqtKNVpF6XtnBFcMHd9T
	sqeEpOm8cWgli7T5S7/ki/c2Eu1I4zXFuYP+/FyncCve46Zt2zqJvF5rTM0fovqXggKjetb7DYQGA
	bRKpURll4A6AI6aDdMIlqlgFS/ur92hU0d79UBhynJHipACFSX0WEyAAAQG6LMjlum82cKrzlZarJ
	tAmopPHLEkRoGHyk2oSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUhD-000000007IG-2J8h;
	Thu, 15 May 2025 09:16:07 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUdH-000000006kU-1p3X
	for linux-riscv@lists.infradead.org;
	Thu, 15 May 2025 09:12:04 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so5315985e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 May 2025 02:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747300322; x=1747905122; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=L1Z7nEHdg8LMp3SMpSwx6RiCpiSMFecCVJAJPAurStrPOyS+s9yL9liGB2N1Nivy87
         xcY44H+vYakjS5ErDHnk1kcfKCL6T1tevc1Gy2vF2fOrQIUrdstKD8w9mDCCkoHJEFEB
         mURUTDOnIY6Amh/Mvu6fnmflQHWyKAW6E2ilopAFtku360R2+7BZYyAr4drwGG+wtZGD
         fy+uvR2KeBGjgiotRJdBjHaqazREmwUEF54pQdGYYthf5hCA+8EUUygY18ErnJCW2nOg
         JBkTiUbsZQ6cLX6snXMek1FYcXa9MCSX+Ut9ejV1dC7e/uwmLqySNdZTjbEqW7k0ghVY
         Ruvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747300322; x=1747905122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAE9bz2isgxzUGbrKGqqEdeq1PEN+8OwnZGGftLgteU=;
        b=rORbEVSwUU0UZrPTtnEq7vuoI5H6VVuFD784hRNM/Ol/QOa7B6kK07/fPGotw1jCh/
         AhMdktoyIhxXZKNc4mTmOpRHvx35XMX/8lnWCTepF3YQ5pLvXx/1n4Z+uIWjA8vGm1PE
         C4hWk2ZV31IG14Cd+gE/c5s3hizwjHrz9bGiA+gOY1f/6rq01vVRVUW0MfHj4lavrmZ/
         /Bc+zmjPhMaxVheAxZp29KGPtej6N6ad3++3E+2cwdkVg2IZmVD80t56fvqJecbI4g+u
         bK5W0Jch2afZU3dkhgufHHBEFvEiEO7MdB66Xk8uHWWTOcXTeUwZuI4nlK83kdu1qt4i
         jQ6Q==
X-Forwarded-Encrypted: i=1; AJvYcCWe1pq7NmoyLDMcXNsejY4QAOiO3JYs5hxCL7VcCXXY3NRePOwDJSSjh/d7JrGKM4QxznxurR+SDipffQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywij7RQu02zAona1+2EAHYaFR9WfjbiO7i+CoTDW4n2sJnGP7wJ
	RYNz2R2pqjsPejsBrcQIwlJ97QRZMt6Gpk+rOJLfsWQucWmqZy+6PKbzPTT6bOI=
X-Gm-Gg: ASbGnct4yhKIRoK9FUOrf4xnP+V5NAbYs6xdX5c1jSZi2Y+V9/QduPxKIMD5JhMgtVU
	gC6r1W8/lJ6YPpinIMXcJyr74Yy8Y0tT/7+ZIUBl+3hjI0Ow/lmV1znoyZ5Eo+cidGRxn+1qnmT
	X1N9v8qZ5O4tAd6R4vwRmxKzAslqjjA0/uJEx5IV8J88Y3Y+y1z9jX/v34qLASX1QZgSzmWJvBw
	A6wsxCXyzF2o8gHC1cGtYM9jhN5HflOMeFpioztTETZqWCptvDTRGp+OoNikKNA/Y0QB3BjJx6y
	cVSyDB1DCZUKAdbb3DGTg57ycg02dxFyUbu8VYWzjkSRa/IXWHQNnEPNHbhYVbox7mswP/VPmfB
	vnkOBy6ywlSco
X-Google-Smtp-Source: AGHT+IEiWqZK+wIF0dIQPPNEPiVIMFChIw3pA6T9sTYgeSc0xYst5cv/piO7TsYycRsa/pH81nx0gg==
X-Received: by 2002:a05:600c:b91:b0:43c:f597:d589 with SMTP id 5b1f17b1804b1-442f2177567mr56412345e9.27.1747300321871;
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Received: from [192.168.2.1] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a1f57de100sm21837759f8f.2.2025.05.15.02.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 02:12:01 -0700 (PDT)
Message-ID: <726e96bd-d4c9-450b-9161-241f05d3d82f@linaro.org>
Date: Thu, 15 May 2025 11:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/9] dt-bindings: timer: Add Sophgo SG2044 ACLINT timer
To: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>, Andi Shyti <andi.shyti@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, ghost
 <2990955050@qq.com>, Jarkko Nikula <jarkko.nikula@linux.intel.com>,
 Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>,
 linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-i2c@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mmc@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
 <20250407010616.749833-2-inochiama@gmail.com>
 <aCSmNRTVXQ51xj0m@mai.linaro.org>
 <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <MA0P287MB2262A447A98778BF4BC3DB2BFE90A@MA0P287MB2262.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_021203_488315_1E9DF630 
X-CRM114-Status: GOOD (  11.72  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gNS8xNS8yNSAwMjowMywgQ2hlbiBXYW5nIHdyb3RlOgo+IEhpLCBEYW5pZWwsCj4gCj4gSnVz
dCBhIGtpbmRseSByZW1pbmRlci4gVGhlcmUgaXMgYSB2MiBvZiB0aGlzIHBhdGNoZXNldCBbMV0s
IGFuZCBJIHNlZSAKPiBbMS85XSBvZiB2MiBoYXMgYmVlbiBwaWNrZWQgYnkgQW5kaSBbMl0uCj4g
Cj4gUGxlYXNlIGRvdWJsZSBjaGVjayBpZiBhbnl0aGluZyB3cm9uZyBvciBjb25mbGljdGVkLgoK
VGhhbmtzIGZvciB0aGUgaGVhZHMgdXAKCkkgdGhpbmsgaXQgaXMgb2ssIEkgaGF2ZSB0aGUgcmln
aHQgdmVyc2lvbiBpbiBteSB0cmVlLgoKSWYgeW91IHdhbnQgdG8gZG91YmxlIGNoZWNrLCBpdCBp
cyBoZXJlOgoKaHR0cHM6Ly9naXQubGluYXJvLm9yZy9wbHVnaW5zL2dpdGlsZXMvcGVvcGxlL2Rh
bmllbC5sZXpjYW5vL2xpbnV4LysvcmVmcy9oZWFkcy90aW1lcnMvZHJpdmVycy9uZXh0CgoKPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI1MDQxMzIyMzUwNy40
NjQ4MC0xLSAKPiBpbm9jaGlhbWFAZ21haWwuY29tLyBbMV0KPiAKPiBMaW5rOiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8gCj4gZWdrd3oyM3R5cjNwc2wzZWFxaHpkaG12eGx1
ZmVtNXZxZGx3dmw0eTZoZW55ZWF6dXpAY2gzb2ZsdjRla3c3LyBbMl0KPiAKPiAKPiBPbiAyMDI1
LzUvMTQgMjI6MTgsIERhbmllbCBMZXpjYW5vIHdyb3RlOgo+PiBPbiBNb24sIEFwciAwNywgMjAy
NSBhdCAwOTowNjowNkFNICswODAwLCBJbm9jaGkgQW1hb3RvIHdyb3RlOgo+Pj4gTGlrZSBTRzIw
NDIsIFNHMjA0NCBpbXBsZW1lbnRzIGFuIGVuaGFuY2VkIEFDTElOVCwgc28gYWRkIG5lY2Vzc2Fy
eQo+Pj4gY29tcGF0aWJsZSBzdHJpbmcgZm9yIFNHMjA0NCBTb0MuCj4+Pgo+Pj4gU2lnbmVkLW9m
Zi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPj4+IC0tLQo+PiBBcHBs
aWVkLCB0aGFua3MKCgotLSAKPGh0dHA6Ly93d3cubGluYXJvLm9yZy8+IExpbmFyby5vcmcg4pSC
IE9wZW4gc291cmNlIHNvZnR3YXJlIGZvciBBUk0gU29DcwoKRm9sbG93IExpbmFybzogIDxodHRw
Oi8vd3d3LmZhY2Vib29rLmNvbS9wYWdlcy9MaW5hcm8+IEZhY2Vib29rIHwKPGh0dHA6Ly90d2l0
dGVyLmNvbS8jIS9saW5hcm9vcmc+IFR3aXR0ZXIgfAo8aHR0cDovL3d3dy5saW5hcm8ub3JnL2xp
bmFyby1ibG9nLz4gQmxvZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
