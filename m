Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C50C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L3sn15qR/vF5r1CNc+E3oOsODi9os4SxKzHHJxwiyLQ=; b=eolPXyJ7EDS001
	kyMP9K3sA+fjqCCGojrfiPW7eRBd+7//MVBn8zOKk4edhuIQyMXVeq//XnH0A6M11tyhI1t0W+HgR
	M2O7YhMjk4eKkHxv04uNwaMoi1+SvHsMdZcnYIokETDTbhmc/OHQlIit8tfy1RtevN/yHK919rsLl
	P3HKZDAAl2uKnuQ5RTp58F/W/D1JUj9uQKQMrJ8e03NpKHITborSWGjs4d98oPs51hSfZhOyddRh/
	wMAliyiDYKxO8cB6mYfwCUWpJ0LnuMUPpwWXY30ooM2ziCleR1o76O/ZzzZSE4h2YUpL88xx4ZrZ8
	OF57mv5jKZgKxzzrpgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9J9-0000000DHLK-2dMZ;
	Wed, 30 Apr 2025 15:25:11 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA9J6-0000000DHJN-1RQW
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 15:25:09 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-acae7e7587dso1089469666b.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Apr 2025 08:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746026706; x=1746631506; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sj0MRflIvEedys6JQ53UQlPgHXKKoxulPTXkRt9mne4=;
        b=jg+xwo5pBtmWjcgSYtqu/INH1B3vRAM5UqNs+H5Q8/jwbBRpXhWM+o/4Ig1/KrocEW
         psNwUj16kHXdhezwZJY2IolMwnZgnQpRR1h+jNIY1gSvVDf51QfBe6xaNBJSpNiteqzO
         IEHsN+//OfzDNv7m/6/hnIa6+XpHvIuX+CjfBfN1spMvFUhAHTtE2rVD0GdkvEw8D4YV
         Q37FQuv0FeWQC1QvwmsRA2kui/D/nBpL8u5rXMTU+0lSADFGmXaUe0ssf0RohINrVEZY
         HU0iObcsJr2spXb05Ai0j7yoLBAqrwBDAH0fAFxc0Zz86G2rDXyvvf934HPcBSESiRjL
         ueAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746026706; x=1746631506;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sj0MRflIvEedys6JQ53UQlPgHXKKoxulPTXkRt9mne4=;
        b=HCJ4pQGSLWowPcZYV0/g1JFdh8NyCfmYLBaNrQyXCc9yzjZxH/RiR2JJC6yB8ij/S9
         ncO7u47+rXqSLWJY+MtpX8Jv92bHLXZ/8mxo0+o8NgVK0MQq7WkyFIGTlQzTCRo4jYn6
         WeRBpDDx62mEtPPkngrqkYHBpJExV8jsT7v0Trg/0WmBZOWEFhoHgDMfHP3kyD0KhOpD
         9dypulStrQUM544QwcX4md5rdwEftAsLU6jPsOiiggR304CHXEEewNlfnJ3LSJGTUSLM
         J/wl1Bx9vV9PYe7ju6x8eA1TQb+ykVQtuhYdeRH/PKvWANS8gxLSJbYFM7oKx7gSdYTA
         0iGg==
X-Forwarded-Encrypted: i=1; AJvYcCXf0UKETR5kp5/C5yJmyto73MJV2wDkAi8w6+jVhuGfmQNgELPvXYaHH2TuliJbcefWiMMx0PlyDgf+3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYcjZcLLUY390aeLIM2xa/B4YIDT5FuumYF4Hg3xvVfb/Lj6pU
	dArDngO2bK284tQJxdiRMmxsKktna7GHAqe2F9cin59UzCCtaaIyc1flv0Fivtg=
X-Gm-Gg: ASbGncvZh0FEUzu202gMBFQAWTqDwrGsCwVN2869Jif1wzhALcePVZ2kCH2NBNmJNM7
	iZ9/zFal6u7n3g5M3r8W+1TLBsvoZfoVxfWpF3DtNea0sGwJSf1G0Lxg0q7s8/MxrWa7/JS1r6V
	sCMRiZ1eN7vP6o+heGGgcPg+MHFmwopOawKexaEKVoGPqzoHLRqv65FfNBKzh2YoP+qZ8gdhddn
	WLWpafgdoJLjeVNYWK5nRV0h544kDtPyMcxZet91y5/aWLgs1PRFIULRr8ig2biQMkJR6Gz4GZH
	Pnezz78PmVwU0AnyeVyZsB+2tzhUAI8kjjvnVQcuLPF2p4yRtxr3FnFDKOhK
X-Google-Smtp-Source: AGHT+IFzQBgBRSQ6GOeinovlut4MyV3fq4DbhhNOJPV0muIn4pxuSp88mG1LvZ+7QvhqG/Fa7ZM10w==
X-Received: by 2002:a17:907:3f21:b0:ac6:f6ea:cc21 with SMTP id a640c23a62f3a-acedc764e4cmr435843166b.55.1746026706150;
        Wed, 30 Apr 2025 08:25:06 -0700 (PDT)
Received: from giga-mm-3.home ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed704f7sm943027266b.146.2025.04.30.08.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 08:25:05 -0700 (PDT)
Message-ID: <a6164eadc96bea72cc21ddc4794401907fb11d97.camel@gmail.com>
Subject: Re: [PATCH 3/4] riscv: dts: sophgo: rename header file cv18xx.dtsi
 to cv180x.dtsi
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 30 Apr 2025 17:25:07 +0200
In-Reply-To: <20250430012654.235830-4-inochiama@gmail.com>
References: <20250430012654.235830-1-inochiama@gmail.com>
	 <20250430012654.235830-4-inochiama@gmail.com>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_082508_378489_B168D320 
X-CRM114-Status: GOOD (  10.54  )
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

SGkgSW5vY2hpIQoKT24gV2VkLCAyMDI1LTA0LTMwIGF0IDA5OjI2ICswODAwLCBJbm9jaGkgQW1h
b3RvIHdyb3RlOgo+IEFzIHRoZSBjdjE4eHguZHRzaSBzZXJ2ZXMgYXMgYSBjb21tb24gcGVyaXBo
ZXJhbCBoZWFkZXIgZm9yIGFsbAo+IHJpc2N2IGN2MTgweC9jdjE4MXgvc2cyMDB4IFNvQ3MsIGl0
IG5vdCBjb3ZlciB0aGUgZW50aXJlIGN2MTh4eAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRvZXMKPiBz
ZXJpZXMgYXMgdGhlcmUgaXMgY3YxODJ4IGFuZCBjdjE4M3guIFNvIHJlbmFtZSB0aGUgaGVhZGVy
IGZpbGUKPiB0byBtYWtlIGl0IHByZWNpc2UuCj4gCj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFt
YW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KClJldmlld2VkLWJ5OiBBbGV4YW5kZXIgU3ZlcmRs
aW4gPGFsZXhhbmRlci5zdmVyZGxpbkBnbWFpbC5jb20+Cgo+IC0tLQo+IMKgYXJjaC9yaXNjdi9i
b290L2R0cy9zb3BoZ28vY3YxODAwYi5kdHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfCAyICstCj4gwqBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby97Y3YxOHh4LmR0c2kgPT4g
Y3YxODB4LmR0c2l9IHwgMAo+IMKgYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODEyaC5k
dHNpwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAyICstCj4gwqBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL3NvcGhnby9zZzIwMDIuZHRzacKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfCAyICstCj4gwqA0IGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPiDCoHJlbmFtZSBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NvcGhnby97Y3YxOHh4LmR0
c2kgPT4gY3YxODB4LmR0c2l9ICgxMDAlKQoKLS0gCkFsZXhhbmRlciBTdmVyZGxpbi4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
