Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12FC8C369A2
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Apr 2025 16:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60kVdFW8mXWYy4oWT24Dgmlegmgs+9vrtiMThVPUPt0=; b=IV+p8YbeYHMkQA
	0G24EFzXQwoQ4teJCRhhbbVbQINyyo3jf26OXqdO8KiDW2mtspynmGoglNqQECd/JwJ0IV85H1YWt
	Bi8iOtRGHkxDBgN3fKdwWFo+3Dc2yRbbw+lPfCysg2mjCFZVButuT4Aqx1Rjq3n4hX8b8l0y7usEV
	AZjcWrUV+7mXwHtwPEHkIVU/xvbFh1cEiE6M0VV29cuA6zWO2m+5sgSDvG5KtQLnGI/hjPVtg7SuA
	jYcu1v+I2/NzruVylmn2mQkB3jEReFRXjUZegGZ3KU5KGqmnSUEkYL7dNvu70Id/3MX8WhFg0agT1
	hRSBn6O2gZ0+q4/UmVtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4MEv-00000002ia5-1BXp;
	Mon, 14 Apr 2025 16:00:53 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4MEt-00000002iZf-2GLE
	for linux-riscv@lists.infradead.org;
	Mon, 14 Apr 2025 16:00:52 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3cf82bd380bso37082825ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 14 Apr 2025 09:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744646450; x=1745251250; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QYswdOj8OkkGd0hypTI/qCj7jZdQJWmSZe4gJo9OFqU=;
        b=OR8NceE9/8UCSiWMl5JlK9rHaNdCYD+BsWSsdAV6GgHPtle8YO+wB6FQZljmnERMBm
         hpE3HnvFnMMLKYyhbQGwaxpFDWxlAnenSl6UBVZfpWhZT+QVc34rhuxX4AZZtogSbN8m
         CGLAhl3S0Y7ussbMhJe8BF8iyVfXQi543vWgaU/qGGrzv6erRyYOGNe4k+eAzQIo8K91
         sVodlRJxM9nG3BJqvgZq1tiamI6QEmjjFcDybp3rHy3RAg5dUQ3kC/V9pm0FdFliC2C2
         fUWcSoSTL8jRkUR04ZKHs7R8Kg5DpiAqXiKrJ+aRYDk1eJ7LiGhgv0tE6R4YNOj64Sme
         mlUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646450; x=1745251250;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QYswdOj8OkkGd0hypTI/qCj7jZdQJWmSZe4gJo9OFqU=;
        b=fQWwEmgGs/x0+y4vv6jU6mhSHayF/Ox+XCal2sqhNRN3h4Jj1cKr3oGs/wGZnuJsgh
         hsCMom8qNMJlRMw1/h8Nr64h1cP/qX4G3wIi7ap9Zq16J48u48LiZM9CHpABNcAPtnYj
         CaF6LWB44I8mhsDqj8oGHwPtisJjUO/0jrAcdexmBEZHVFbw3jbo9OyW6w7i5iiJfzZh
         V55SnOJJTvAX24mh1z+McB9tMa4mrWLjCdEYMV44/fF5D2r60gf43PGMPFwbPg+lAvkW
         foG3IIiERHPCM9JVhNOR/yOODRsommMGIgR7q/rDrqHIdjOAl6QobwgAowFobwmh9CPO
         merw==
X-Forwarded-Encrypted: i=1; AJvYcCWJQh0Fzs4KUochY3LrSxnH516CMF2gfAgJOXJnFH2zru3XDpWcUJM9FmCe0Z6W2rL7i8OX8XFg8IU2Og==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz4lptIt3oRdugTiIyV9tcujC6EWRzP4MgK9VKoKrSkA5dbDpj
	ysOFsYdoG+WsPF2n/73w3AiP1wJkKpt0JhfPW4ZCfgkXIYeksC6fAFcaLJMlQPM=
X-Gm-Gg: ASbGncsNGsLA5WA/dI9YnxPSajQ+kEPSetxmaYmrmT5/P3CmCCLa56wAlAsitLh7vYA
	gKKpKtNePJR0mTnlX8IZLGsV54ylvPnIh+jebn1ZiVbPLitezhHXbAS9LTFrrb1cgsNXHGSHgMc
	tTxtcfbJKl5xXe7jpaSg+a0J1OhDiRnuFDESEu2WJN3K9P2y2G20IgTeQ0xnZPVmoIJKS13RGOp
	Ek9dIVWW2ks/ZQBnPPuKgoPSr9LnmMmVrcWLyW3z40qXm5PfAFhZEgyZT0rzp4Z6KuUIjF0whPf
	PlGmAfVewnkG9AJH3bN783DXwwXcW5kXn+9NXHVDp7DpnkkeD3fujASk0g==
X-Google-Smtp-Source: AGHT+IHe3l3IdKEf2EIxEwSF8Xnhn98r0RQtuVLorIVoWb4ht7Iy5IoHWekoLkjH68FO20YrBiRk1g==
X-Received: by 2002:a05:6e02:b2a:b0:3d2:b72d:a502 with SMTP id e9e14a558f8ab-3d7ec27330bmr141379655ab.22.1744646447034;
        Mon, 14 Apr 2025 09:00:47 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d7dba8536asm27766165ab.28.2025.04.14.09.00.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 09:00:46 -0700 (PDT)
Message-ID: <0dc3bb03-3708-4134-96bf-d5f95187e8bb@sifive.com>
Date: Mon, 14 Apr 2025 11:00:44 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/10] riscv: dts: eswin: add HiFive Premier P550 board
 device tree
To: Ariel D'Alessandro <ariel.dalessandro@collabora.com>,
 Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Min Lin <linmin@eswincomputing.com>,
 Pritesh Patel <pritesh.patel@einfochips.com>, Yangyu Chen
 <cyy@cyyself.name>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Yu Chien Peter Lin <peterlin@andestech.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Kanak Shilledar <kanakshilledar@gmail.com>,
 Darshan Prajapati <darshan.prajapati@einfochips.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, Aradhya Bhatia <a-bhatia1@ti.com>, rafal@milecki.pl,
 Anup Patel <anup@brainfault.org>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
 <20250410152519.1358964-11-pinkesh.vaghela@einfochips.com>
 <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <956d76b0-4f82-4f95-8f70-70896d488bd3@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_090051_591928_D557DF44 
X-CRM114-Status: GOOD (  19.07  )
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

SGkgQXJpZWwsCgpPbiAyMDI1LTA0LTE0IDc6NTUgQU0sIEFyaWVsIEQnQWxlc3NhbmRybyB3cm90
ZToKPiBIaSBQaW5rZXNoLAo+IAo+IE9uIDQvMTAvMjUgMTI6MjUgUE0sIFBpbmtlc2ggVmFnaGVs
YSB3cm90ZToKPj4gRnJvbTogTWluIExpbiA8bGlubWluQGVzd2luY29tcHV0aW5nLmNvbT4KPj4K
Pj4gQWRkIGluaXRpYWwgYm9hcmQgZGF0YSBmb3IgSGlGaXZlIFByZW1pZXIgUDU1MCBEZXZlbG9w
bWVudCBib2FyZAo+Pgo+PiBDdXJyZW50bHkgdGhlIGRhdGEgcG9wdWxhdGVkIGluIHRoaXMgRFQg
ZmlsZSBkZXNjcmliZXMgdGhlIGJvYXJkCj4+IERSQU0gY29uZmlndXJhdGlvbiwgVUFSVCBhbmQg
R1BJTy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogTWluIExpbiA8bGlubWluQGVzd2luY29tcHV0aW5n
LmNvbT4KPj4gQ28tZGV2ZWxvcGVkLWJ5OiBQaW5rZXNoIFZhZ2hlbGEgPHBpbmtlc2gudmFnaGVs
YUBlaW5mb2NoaXBzLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogUGlua2VzaCBWYWdoZWxhIDxwaW5r
ZXNoLnZhZ2hlbGFAZWluZm9jaGlwcy5jb20+Cj4+IFJldmlld2VkLWJ5OiBTYW11ZWwgSG9sbGFu
ZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPj4gVGVzdGVkLWJ5OiBTYW11ZWwgSG9sbGFu
ZCA8c2FtdWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPj4gLS0tCj4+IMKgIGFyY2gvcmlzY3YvYm9v
dC9kdHMvTWFrZWZpbGXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCAxICsK
Pj4gwqAgYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgfMKgIDIgKysKPj4gwqAgLi4uL2R0cy9lc3dpbi9laWM3NzAwLWhpZml2ZS1wcmVtaWVy
LXA1NTAuZHRzIHwgMjkgKysrKysrKysrKysrKysrKysrKwo+PiDCoCAzIGZpbGVzIGNoYW5nZWQs
IDMyIGluc2VydGlvbnMoKykKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3YvYm9v
dC9kdHMvZXN3aW4vTWFrZWZpbGUKPj4gwqAgY3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvcmlzY3Yv
Ym9vdC9kdHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cwo+Pgo+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvTWFrZWZpbGUKPj4gaW5kZXggNjRhODk4ZGE5YWVlLi4yOWE5N2E2NjNlYTIgMTAwNjQ0Cj4+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvTWFrZWZpbGUKPj4gKysrIGIvYXJjaC9yaXNjdi9i
b290L2R0cy9NYWtlZmlsZQo+PiBAQCAtMSw2ICsxLDcgQEAKPj4gwqAgIyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMAo+PiDCoCBzdWJkaXIteSArPSBhbGx3aW5uZXIKPj4gwqAgc3Vi
ZGlyLXkgKz0gY2FuYWFuCj4+ICtzdWJkaXIteSArPSBlc3dpbgo+PiDCoCBzdWJkaXIteSArPSBt
aWNyb2NoaXAKPj4gwqAgc3ViZGlyLXkgKz0gcmVuZXNhcwo+PiDCoCBzdWJkaXIteSArPSBzaWZp
dmUKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vTWFrZWZpbGUgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL2Vzd2luLwo+PiBNYWtlZmlsZQo+PiBuZXcgZmlsZSBtb2RlIDEw
MDY0NAo+PiBpbmRleCAwMDAwMDAwMDAwMDAuLjIyNDEwMWFlNDcxZQo+PiAtLS0gL2Rldi9udWxs
Cj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvZXN3aW4vTWFrZWZpbGUKPj4gQEAgLTAsMCAr
MSwyIEBACj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4+ICtkdGItJChD
T05GSUdfQVJDSF9FU1dJTikgKz0gZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0Ygo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9lc3dpbi9laWM3NzAwLWhpZml2ZS1wcmVt
aWVyLXA1NTAuZHRzIGIvYXJjaC8KPj4gcmlzY3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1oaWZp
dmUtcHJlbWllci1wNTUwLmR0cwo+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+PiBpbmRleCAwMDAw
MDAwMDAwMDAuLjEzMWVkMWZjNmIyZQo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvZXN3aW4vZWljNzcwMC1oaWZpdmUtcHJlbWllci1wNTUwLmR0cwo+PiBAQCAt
MCwwICsxLDI5IEBACj4+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1Ig
TUlUKQo+PiArLyoKPj4gKyAqIENvcHlyaWdodCAoYykgMjAyNCwgQmVpamluZyBFU1dJTiBDb21w
dXRpbmcgVGVjaG5vbG9neSBDby4sIEx0ZC4KPj4gKyAqLwo+PiArCj4+ICsvZHRzLXYxLzsKPj4g
Kwo+PiArI2luY2x1ZGUgImVpYzc3MDAuZHRzaSIKPj4gKwo+PiArLyB7Cj4+ICvCoMKgwqAgY29t
cGF0aWJsZSA9ICJzaWZpdmUsaGlmaXZlLXByZW1pZXItcDU1MCIsICJlc3dpbixlaWM3NzAwIjsK
Pj4gK8KgwqDCoCBtb2RlbCA9ICJTaUZpdmUgSGlGaXZlIFByZW1pZXIgUDU1MCI7Cj4+ICsKPj4g
K8KgwqDCoCBhbGlhc2VzIHsKPj4gK8KgwqDCoMKgwqDCoMKgIHNlcmlhbDAgPSAmdWFydDA7Cj4+
ICvCoMKgwqAgfTsKPj4gKwo+PiArwqDCoMKgIGNob3NlbiB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBz
dGRvdXQtcGF0aCA9ICJzZXJpYWwwOjExNTIwMG44IjsKPj4gK8KgwqDCoCB9Owo+PiArfTsKPj4g
Kwo+PiArJnVhcnQwIHsKPj4gK8KgwqDCoCBzdGF0dXMgPSAib2theSI7Cj4+ICt9Owo+PiArCj4+
ICsmdWFydDIgewo+PiArwqDCoMKgIHN0YXR1cyA9ICJva2F5IjsKPj4gK307Cj4gCj4gQWx0aG91
Z2ggY29tbWl0IGxvZyBzYXlzIHRoYXQgdGhpcyBpbmNsdWRlcyBEUkFNIGNvbmZpZ3VyYXRpb24s
IGxvb2tzIGxpa2UgaXQncwo+IG1pc3Npbmc/IEluIG9yZGVyIHRvIHRlc3QgdGhpcyBwYXRjaHNl
dCwgaGFkIHRvIGFkZCB0aGlzIGZvbGxvd2luZyBtZW1vcnkKPiBkZWZpbml0aW9uIChwaWNrZWQg
ZnJvbSB2ZW5kb3Iga2VybmVsIHJlcG9zaXRvcnkpOgo+IAo+IMKgwqDCoCBMNTA6IG1lbW9yeUA4
MDAwMDAwMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInNpZml2ZSxh
eGk0LW1lbS1wb3J0IiwgInNpZml2ZSxheGk0LXBvcnQiLAo+ICJzaWZpdmUsbWVtLXBvcnQiOwo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZGV2aWNlX3R5cGUgPSAibWVtb3J5IjsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJlZyA9IDwweDAgMHg4MDAwMDAwMCAweDdmIDB4ODAwMDAwMDA+Owo+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2lmaXZlLHBvcnQtd2lkdGgtYnl0ZXMgPSA8MzI+Owo+
IMKgwqDCoCB9OwoKVGhhdCBpcyBhIG1pc3N0YXRlbWVudCBpbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
IFRoZSBtZW1vcnkgbm9kZSBpcyBub3QgaW5jbHVkZWQgaW4KdGhlIHN0YXRpYyBkZXZpY2V0cmVl
IGJlY2F1c2UgdGhlIGFtb3VudCBvZiBSQU0gaW5zdGFsbGVkIG9uIHRoZSBib2FyZCBpcwp2YXJp
YWJsZS4gSXQgaXMgdGhlIHJlc3BvbnNpYmlsaXR5IG9mIGZpcm13YXJlIHRvIHByb3ZpZGUgdGhl
IG1lbW9yeSBtYXAsIGVpdGhlcgp0aHJvdWdoIEVGSSBvciBieSBwYXRjaGluZyB0aGUgbWVtb3J5
IG5vZGUgaW50byB0aGUgRFQgYXQgcnVudGltZS4gSSBiZWxpZXZlIHRoZQpjdXJyZW50IEJTUCBV
LUJvb3QgZG9lcyB0aGUgZm9ybWVyIGJ1dCBub3QgdGhlIGxhdHRlci4KClJlZ2FyZHMsClNhbXVl
bAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
