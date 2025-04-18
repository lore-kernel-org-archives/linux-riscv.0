Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E9F6C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Apr 2025 16:19:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QSTH7731Od1MY93DtmrHfOdxxePMOCYCsDE9JDH1hIQ=; b=waLGJQ0lrJNYYr
	phCzGvnAC3HODrCDHSrl00SYfGvQUuY+5coQhP+jrKo8L4HsR/02kUipGBNac+QG61fU8PCeUa6B1
	6Qtyd6GRTJKLrvPZ77ZL9M93S8+CZUMzCT2YUcEivG01H8he/swSu50Vz1e4sziyccun1fSPdiMQD
	229OpqqcUG8coszuULQUiOd9AuOs92kAre5f4QaVz9WBqP/Oib+mKCtSKmYeQQ0V+pqti/Dptmmux
	acHTw4azeXFyX2rE/Zi7PHYQyBUauxjSZYBjq4iL/yxbA0Ncwdyv6OS37IvvsDLGYKdJSA93R6kc8
	e3mHJAdQdsdtDSdm4pUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5oQo-0000000GtZ6-1Nwz;
	Fri, 18 Apr 2025 16:19:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5oQn-0000000GtYM-10aN
	for linux-riscv@bombadil.infradead.org;
	Fri, 18 Apr 2025 16:19:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ePfKgP0uKVNFgoT+zVQWJDPRxOOn/U+ue7Il0AVta4I=; b=Imfol0iUOx9nVIYaSVO7pu96rz
	1L+/DMeLR+7uZcgj3IafV24pSVoDl7UxI+aoHS+xReaapgEAmkmC+WWJ72aqUWmeP4P2bOXG9Fihp
	uOC2IY4GLE5cA4QUHBQmnakbB2YqsMmMFN6BCthPUMlWzqZRls5TZ/u4yjU/XllwZcxNkhMKndSSR
	N/SrxHh2p3HeElLJifUof/uUHkblKut13YqssNBHsSx+ytwK68JgIGG1h9mnCTEnv6cm1OlOYHiaU
	1BBEFOJNoPWSyyZc9fhKM+6jm1fPboTlqsuSpibhoOAjDkmrsZHJY5D9EKqi49O6lUbADMb9PXTKm
	xNazf/Zg==;
Received: from mail-il1-x12f.google.com ([2607:f8b0:4864:20::12f])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u5oQj-0000000AXq7-3NVC
	for linux-riscv@lists.infradead.org;
	Fri, 18 Apr 2025 16:19:08 +0000
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-3d812103686so6356005ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 18 Apr 2025 09:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1744993141; x=1745597941; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ePfKgP0uKVNFgoT+zVQWJDPRxOOn/U+ue7Il0AVta4I=;
        b=PUfDi8fkSR6eXnV7ftyI5ISlMo/2kSnq50N1Xsj+qxF9DO+PoKzGXheCEb3YJzY2du
         RTM19O/ANPOjKPfXftWZuUabZqPEWJz9aW/xhdy5E+W4Ck/+3TRdEkMspTCicxxTBFwW
         ugy6NCYzfCBMQzKF/YZ2eWkBd/t68By+4aXAjXVeMv9Gk8EYm58EcXzqcedse9wiJtvt
         84Tq2ma0MZrdBGbo/FVQLk+BpIKvkFaA61dllVUPGxMTKMpllSUDt7mGbXFxqYdxfjzT
         exZM2iJEFv1MgysSt+KAK+oQPb07LGiYs6WK500TAdF7T7dM+HYcuwGm6eWxutvVnmGG
         yKcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744993141; x=1745597941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ePfKgP0uKVNFgoT+zVQWJDPRxOOn/U+ue7Il0AVta4I=;
        b=QUngC26U652Tb24Qq06T4BXJqzK1NhasXMxw30qOq4t9SOHmgLb7YOpcp1YdqBH8SK
         V+c8xCytJ8vox4SGa+HX6tFM9Kv7WXQ/dSI9igvJ3NNRL+a4c83bRp5HUZSZ4KxdY/ku
         yonoe/6gE/7SAC7AbKYTLLgqpbfMf64V1BB+ZBCiTimc025vvBUfDWCDBsnRYqCLnaRH
         NqvBYDKO/EiMWTIe3P5jWqvt9n8Hyf1ZwpVBbgyFyE3Thk01GL5+nUFmWsxOQtb9brF+
         AW6apwU6PXSozfebT3YF8A2V/zou5TgI2HmNAIPDPQI7/jPWyu0+YaiMv25RennBOsnN
         BTXw==
X-Forwarded-Encrypted: i=1; AJvYcCVp75jQI81bRorvYBDsJQi9sj4fjkSiA8wqdhyVSzPQr3wLNuUr2gk4WqNvic1xLnPqqfUir2emvLxelw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcQgKYsCa3qnsFrdo7wCp+3BqwG09QSgsUWdm0oHAGXn10poe8
	smICkX2ENBnCrg3h5Q7edsTqsV/iV+SX4QfsbfQilA64aUmSpvRg/Vpw2AOjifI=
X-Gm-Gg: ASbGncusycQ91u7curKDkazaJGuE9d4e3ObQ5yrN5AuomdA/btl7PWsqZ6EvIBT67nw
	RlNYR4LQr13mcqw4dF5kpPxhppOSwOhcsbYf0PQR6PvA2/t3Hv9FibytajtpyjNIXeV9VWFpfF4
	yIUf1DYcomRbpfD8FublanM6pRr6B07N4eh8xQvF4MP98Hf9m02XDaGtWGFFee0bgY7DbXrmFCL
	cs6lgFVlDjRiOPmkpjqnkrTQKnHi1rtgF1onncJRO0YPdOiZ3jCaQr6o+BX1fTB1UUgfWZYS3OT
	cUKyYWToU+SENyP+bdw6DbfhoZJFDoTWo08tOjBHuaLWGOhibspXpkLECQ==
X-Google-Smtp-Source: AGHT+IEvYD8CyOarFeAdARgzHXcquFCOFcE3q2vpY4E/2mOeo90KFv9nv8xpCX6+Lrf2zXFCiqzeag==
X-Received: by 2002:a05:6e02:178b:b0:3d4:6ed4:e0a with SMTP id e9e14a558f8ab-3d8b69608b7mr23960585ab.4.1744993141239;
        Fri, 18 Apr 2025 09:19:01 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.166])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d821d43a1bsm5092915ab.32.2025.04.18.09.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 09:19:00 -0700 (PDT)
Message-ID: <b864fc90-1297-4e1d-8487-61049e23e405@sifive.com>
Date: Fri, 18 Apr 2025 11:18:59 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH fixes] riscv: uprobes: Add missing fence.i after building
 the XOL buffer
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>
Cc: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org
References: <20250417074952.1315641-1-bjorn@kernel.org>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20250417074952.1315641-1-bjorn@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_171905_970283_0A42B6A6 
X-CRM114-Status: GOOD (  18.20  )
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

SGkgQmrDtnJuLAoKT24gMjAyNS0wNC0xNyAyOjQ5IEFNLCBCasO2cm4gVMO2cGVsIHdyb3RlOgo+
IEZyb206IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQHJpdm9zaW5jLmNvbT4KPiAKPiBUaGUgWE9MIChl
eGVjdXRlIG91dC1vZi1saW5lKSBidWZmZXIgaXMgdXNlZCB0byBzaW5nbGUtc3RlcCB0aGUKPiBy
ZXBsYWNlZCBpbnN0cnVjdGlvbihzKSBmb3IgdXByb2Jlcy4gVGhlIFJJU0MtViBwb3J0IHdhcyBt
aXNzaW5nIGEKPiBwcm9wZXIgZmVuY2UuaSAoaSQgZmx1c2hpbmcpIGFmdGVyIGNvbnN0cnVjdGlu
ZyB0aGUgWE9MIGJ1ZmZlciwgd2hpY2gKPiBjYW4gcmVzdWx0IGluIGluY29ycmVjdCBleGVjdXRp
b24gb2Ygc3RhbGUvYnJva2VuIGluc3RydWN0aW9ucy4KPiAKPiBUaGlzIHdhcyBmb3VuZCBydW5u
aW5nIHRoZSBCUEYgc2VsZnRlc3RzICJ0ZXN0X3Byb2dzOgo+IHVwcm9iZV9hdXRvYXR0YWNoLCBh
dHRhY2hfcHJvYmUiIG9uIHRoZSBTcGFjZW1pdCBLMS9YNjAsIHdoZXJlIHRoZQo+IHVwcm9iZXMg
dGVzdHMgcmFuZG9tbHkgYmxldyB1cC4KPiAKPiBGaXhlczogNzQ3ODQwODFhYWM4ICgicmlzY3Y6
IEFkZCB1cHJvYmVzIHN1cHBvcnRlZCIpCj4gU2lnbmVkLW9mZi1ieTogQmrDtnJuIFTDtnBlbCA8
Ympvcm5Acml2b3NpbmMuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXBy
b2Jlcy5jIHwgOSArLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA4
IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMv
dXByb2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwo+IGluZGV4IDRi
M2RjOGJlYWY3Ny4uNGZhZWY5MmRkNzcxIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVs
L3Byb2Jlcy91cHJvYmVzLmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jl
cy5jCj4gQEAgLTE3NiwxMyArMTc2LDYgQEAgdm9pZCBhcmNoX3Vwcm9iZV9jb3B5X2l4b2woc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHVuc2lnbmVkIGxvbmcgdmFkZHIsCj4gIAkJKih1cHJvYmVfb3Bjb2Rl
X3QgKilkc3QgPSBfX0JVR19JTlNOXzMyOwo+ICAJfQo+ICAKPiArCWZsdXNoX2ljYWNoZV9yYW5n
ZSgodW5zaWduZWQgbG9uZylkc3QsICh1bnNpZ25lZCBsb25nKWRzdCArIGxlbik7CgpUaGlzIHdv
cmtzIGJlY2F1c2UgZmx1c2hfaWNhY2hlX3JhbmdlIGN1cnJlbnRseSBpZ25vcmVzIHRoZSByYW5n
ZSwgYnV0CnNlbWFudGljYWxseSBpcyBub3QgcXVpdGUgcmlnaHQsIGJlY2F1c2Ugb2YgdGhlIGxp
bmUganVzdCBhYm92ZSB0aGUgY29udGV4dCB0aGF0CmluY3JlbWVudHMgZHN0LiBJZiB0aGUgcmFu
Z2Ugd2FzIHJlc3BlY3RlZCwgdGhpcyB3b3VsZCBvbmx5IGZsdXNoIHRoZSBlYnJlYWssCm5vdCB0
aGUgcHJlY2VkaW5nIHNpbmdsZS1zdGVwcGVkIGluc3RydWN0aW9uLgoKUmVnYXJkcywKU2FtdWVs
Cgo+ICAJa3VubWFwX2F0b21pYyhrYWRkcik7Cj4gLQo+IC0JLyoKPiAtCSAqIFdlIHByb2JhYmx5
IG5lZWQgZmx1c2hfaWNhY2hlX3VzZXJfcGFnZSgpIGJ1dCBpdCBuZWVkcyB2bWEuCj4gLQkgKiBU
aGlzIHNob3VsZCB3b3JrIG9uIG1vc3Qgb2YgYXJjaGl0ZWN0dXJlcyBieSBkZWZhdWx0LiBJZgo+
IC0JICogYXJjaGl0ZWN0dXJlIG5lZWRzIHRvIGRvIHNvbWV0aGluZyBkaWZmZXJlbnQgaXQgY2Fu
IGRlZmluZQo+IC0JICogaXRzIG93biB2ZXJzaW9uIG9mIHRoZSBmdW5jdGlvbi4KPiAtCSAqLwo+
IC0JZmx1c2hfZGNhY2hlX3BhZ2UocGFnZSk7Cj4gIH0KPiAKPiBiYXNlLWNvbW1pdDogMWExZDU2
OWE3NWYzYWIyOTIzY2I2MmRhZjM1NmQxMDJlNGRmMmI4NgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
