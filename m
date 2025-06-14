Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A061C7114A
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jun 2025 21:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WCD46KFB/Z2P3fPAXUPTMqV5/ZPsb/876GCrtFeGvUY=; b=eeJQUk827eQ1HX
	oh7T4BqsgSpYT7yd/2TxAkMndLiUlGgLfjhVKCpBRCF2GnaTc1LnN/ckDi4scMfZiYm19DsjEQato
	7+xoLbHYyPSEJCfr8meIq/meuuJ9n7ifCAOKs//8gmrKdGmksoIntYYgWNZKaPc816mQF0rg9cSyZ
	d1edX+quZAm1tbxNEVfrCYXJaVR7njETZOQN9t8ExvHQoNYNlOR7CAHN/w6QlQLNY64LAVj+P+NCE
	TVePUKcr7hHW2z0YQ90FaF+xOhr0tb3CIDRSCvsDdrNlz06ymEAZ7Lty8sJ+5zIqACxy0cMylZDm6
	fQEXAmgFN5TA76h43tMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQY0R-00000001qLU-2vmv;
	Sat, 14 Jun 2025 21:01:39 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQY0P-00000001qL8-1PCE
	for linux-riscv@lists.infradead.org;
	Sat, 14 Jun 2025 21:01:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so38824925e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Jun 2025 14:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749934895; x=1750539695; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fxIEE+c6pUB0N6FNYktz5IvAb1U4IAe4R41rT8THtZE=;
        b=bcNBQ9zbSSPe3pwFF9stfbrjI1XMFGrZzhAUHgErsqrgjxce5M9ZHKd3dkt3JJMWVg
         9VdVylDieeJcssNoyom9m5+uRkUXmjt1hmiWTbmcBLyKXiSuDoi0Bw0dyvdoYyDDCaHE
         z7zIY6PnMTLTNzZjM+G4I9EBzOUkHUiAo4mXJ/0k64TJF0EZoGom904XHbXX+xDlZYcv
         5HFipjI0ncuFV9r2ONSwSuOFf5clxbyni7DwsCl96kCrOmtmgYDBiprk62oAcKMypDER
         eHdlFk7fVNjwYMFHkruBXVVex4nDf6RUJGqEuiyBk5KsKLXLmrrIBE7WmqcvndzrRl8v
         35FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749934895; x=1750539695;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fxIEE+c6pUB0N6FNYktz5IvAb1U4IAe4R41rT8THtZE=;
        b=spm+Ga/Nmj6S+aml6EhYMER9JDekZIVBB/phCtIlYVR49xdD27oz0vbMXtQE9bswRf
         O8Bx/tvh95eNG61ShYUTh+lQvYzBHbAUEMoXxTJDvNiuDE2r5wtmIj0X+L4TnA0tyIl9
         RNunznqExiqxmQG829gSH3ypvraeF/Bsr+YYoO53syA/HUsIRPUL1M91qcHjUti2kSct
         uVZeFGEZlh9aPQSrTjpERiSkcPNeX+2/8oo9LR3AVYRc5sSeF77C9pptLAlgRgaNWHs/
         LwfdK48n+RX/9Aof6OhIfQMtVNHpbwzWvKA+crOunne/iBGYxFQxDn9Pe0ZFIQl2MNiz
         T4+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWptmmTm/VN5AgzmuCO7pEJhex+1w2Xtny+aDjyuQVHflKf2p16kAsSD2nzOWI01xSQf792nrdCfp5iYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxKtz9G7g0k1fCwg15HtjMLPInNh1uq9O9KqXHIdvRMHD4F2yYM
	tbZW4ZmSx4CsoNsv5HbmLZax9kCxOYpE+LQ8Kyi8FUoCXkoJeSrhEIjP
X-Gm-Gg: ASbGncugqumepl2ZRPp+UQNM2KuSXxtnNojbNF3NgXq3Jd73xDYE16iIAZxeqdsfBL4
	yJ1U6792DxByHSX3Gs2h6PqcO07JLtvHUEaVYXjVb+P5XRRyTPOJhfNsLSQSWdRdG/dkSgVwLZW
	FCAh/Bau2onZfOjjJSAUPS5g1krDLec4LALTiu0s22p03gt/VtxJ9iU4hTZT1oBLI9SFIEKLsRG
	BkTz7uwtZJ+tXyrETHvSZMulunrz67m85kZ9y/n8kpok0AkQFuNNX8JChKZccsU+bM3R2Jppjqf
	OH9fHEz8EMyPgJDGHkmmrl4YgBleByrqccuy4GkN4H42Loq/LQWH2xl/BTe/34HGdM+ruiB9Iz/
	dLSTm9g==
X-Google-Smtp-Source: AGHT+IFczogrn/L57qlQe9UCB84Ov9Y9pOTc5rwLMmgD+dlRC+Fn7LKHG3fxgIt+gTTBlBv82V4M7w==
X-Received: by 2002:a05:600c:8b48:b0:442:e9eb:cba2 with SMTP id 5b1f17b1804b1-4533c9c107dmr43924655e9.0.1749934894673;
        Sat, 14 Jun 2025 14:01:34 -0700 (PDT)
Received: from giga-mm-7.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e224956sm92863175e9.4.2025.06.14.14.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 14:01:34 -0700 (PDT)
Message-ID: <7a4ceb2e0b75848c9400dc5a56007e6c46306cdc.camel@gmail.com>
Subject: Re: [PATCH net-next RFC 0/3] riscv: dts: sophgo: Add ethernet
 support for cv18xx
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>,  "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Chen
 Wang	 <unicorn_wang@outlook.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,  Richard Cochran
 <richardcochran@gmail.com>, Yixun Lan <dlan@gentoo.org>, Thomas Bonnefille	
 <thomas.bonnefille@bootlin.com>, Ze Huang <huangze@whut.edu.cn>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 sophgo@lists.linux.dev, 	linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Longbin Li	 <looong.bin@gmail.com>
Date: Sat, 14 Jun 2025 23:01:43 +0200
In-Reply-To: <20250611080709.1182183-1-inochiama@gmail.com>
References: <20250611080709.1182183-1-inochiama@gmail.com>
User-Agent: Evolution 3.56.1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250614_140137_379123_02CFB03C 
X-CRM114-Status: GOOD (  12.32  )
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

VGhhbmtzIGZvciB0aGUgc2VyaWVzIElub2NoaSEKCk9uIFdlZCwgMjAyNS0wNi0xMSBhdCAxNjow
NyArMDgwMCwgSW5vY2hpIEFtYW90byB3cm90ZToKPiBBZGQgZGV2aWNlIGJpbmRpbmcgYW5kIGR0
cyBmb3IgQ1YxOFhYIHNlcmllcyBTb0MsIHRoaXMgZHRzIGNoYW5nZSBzZXJpZXMKPiByZXF1aXJl
IGJvdGggdGhlIG1kaW8gcGF0Y2ggWzFdIGFuZCB0aGUgcmVzZXQgcGF0Y2ggWzJdLgo+IAo+IFsx
XSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2MTEwODAyMjguMTE2NjA5MC0xLWlu
b2NoaWFtYUBnbWFpbC5jb20KPiBbMl0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUw
NjExMDc1MzIxLjExNjA5NzMtMS1pbm9jaGlhbWFAZ21haWwuY29tCj4gCj4gSW5vY2hpIEFtYW90
byAoMyk6Cj4gwqAgZHQtYmluZGluZ3M6IG5ldDogQWRkIHN1cHBvcnQgZm9yIFNvcGhnbyBDVjE4
MDAgZHdtYWMKPiDCoCByaXNjdjogZHRzOiBzb3BoZ286IEFkZCBldGhlcm5ldCBkZXZpY2UgZm9y
IGN2MTh4eAo+IMKgIHJpc2N2OiBkdHM6IHNvcGhnbzogQWRkIG1kaW8gbXVsdGlwbGV4ZXIgZGV2
aWNlIGZvciBjdjE4eHgKClRha2luZyBpbnRvIGFjY291bnQsIHdoYXRldmVyIE1JSSB2YXJpYXRp
b24gaXMgaW1wbGVtZW50ZWQgaW4gdGhlIFNvQwppcyBhbHdheXMgaW50ZXJuYWwgKGFuZCBvbmx5
IE1ESU8gcGFydCBpcyBtdWx0aXBsZXhlZCksIGNhbiB3ZSBhZGQKCXBoeS1tb2RlID0gImludGVy
bmFsIjsKYW5kCglwaHktaGFuZGxlID0gPCZpbnRlcm5hbF9lcGh5PjsKcmlnaHQgaW50byBjdjE4
MHguZHRzaT8KCkJvYXJkcyBjYW4gdGhlbiBlbmFibGUgdGhlIGNvcnJlc3BvbmRpbmcgbm9kZXMg
aWYgdGhleSB3aXJlIFJKNDUgY29ubmVjdG9yLApidXQgSSBzZWUgbm8gd2F5IGhvdyB0aGV5IGNv
dWxkIHZhcnkgdGhlIE1JSSBjb25uZWN0aW9uLgoKPiAKPiDCoC4uLi9iaW5kaW5ncy9uZXQvc29w
aGdvLGN2MTgwMGItZHdtYWMueWFtbMKgwqDCoCB8IDExMyArKysrKysrKysrKysrKysrKysKPiDC
oGFyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpwqDCoMKgwqDCoMKgwqAgfMKg
IDcwICsrKysrKysrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDE4MyBpbnNlcnRpb25zKCspCj4g
wqBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25l
dC9zb3BoZ28sY3YxODAwYi1kd21hYy55YW1sCj4gCj4gCj4gYmFzZS1jb21taXQ6IDE5MjcyYjM3
YWE0ZjgzY2E1MmJkZjljMTZkNWQ4MWJkZDEzNTQ0OTQKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6
IGQ1MTYyMTQ0MTgwNDU4YjExNTg3ZWJkNGFkMjRlNWUzZjYyYjBjYWYKPiBwcmVyZXF1aXNpdGUt
cGF0Y2gtaWQ6IDllMTk5MmQyZWMzYzgxZmJjYzQ2M2ZmNzM5NzE2OGZjMmFjYmJmMWIKPiBwcmVy
ZXF1aXNpdGUtcGF0Y2gtaWQ6IGFiM2NhOGM5Y2RhODg4ZjQyOTk0NWZiMDI4MzE0NTEyMjk3NWI3
MzQKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IGJkOTRmOGJkM2Q0Y2U0ZjNiMTUzY2JiMzZhMzg5
NmM1ZGMxNDNjMTcKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDFiNzMxOTY1NjYwNTg3MTg0NzFk
ZWY2MmJjMjE1ZDJmMzE5NTEzYzMKPiBwcmVyZXF1aXNpdGUtcGF0Y2gtaWQ6IDU0MTU3MzAzMjAz
ODI2Y2NmOTFlOTg1NDU4YzRhZTdiY2RkOWIyYmEKPiAtLQo+IDIuNDkuMAoKLS0gCkFsZXhhbmRl
ciBTdmVyZGxpbi4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
