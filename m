Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38350E7718A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Dec 2024 00:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP3Vy4aWLOfQwAO0O0q3VTHctDmd475oJWAqJirXRO4=; b=aIOYGRJoRhBR2z
	q3wQd3OE0LqEG6kdvGf3mksm1a7S0l2XfER/OS+0UeL8PNfg4PguIsaIrsz0IQg5sQJNUauY48e8Z
	4uOG2lj0WMZdTssEH2e0JOz1V2y8QjBDdEpnuHRaXybNrAd20tlCb2dmPdNsEXxYAu2zn5P/wRfNh
	dRUFO5w9Yyuc4ZEUXUgp+TgYClU0Ev6y9jJfyOTqV54rmD2cua+OX5tANhd6h1voTENeXbzxbIIWq
	AzKrC4gX23mjHd8ISWNRx8593LY5Ba6bQ+tLraZSqSqQXte7Ifjtg2sMQ2ZK8NFVYVfSLdv8FiPFw
	m8j2lv6Svnb4vUcWF4lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO4X6-00000000Qti-1woY;
	Thu, 19 Dec 2024 00:36:52 +0000
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tO4X2-00000000QtD-3xmH
	for linux-riscv@lists.infradead.org;
	Thu, 19 Dec 2024 00:36:50 +0000
Received: by mail-il1-x12d.google.com with SMTP id e9e14a558f8ab-3bcb4c0a341so2330635ab.2
        for <linux-riscv@lists.infradead.org>; Wed, 18 Dec 2024 16:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1734568607; x=1735173407; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Cb8i+/RcecBf8L1BHUB812gTo+/Q1lLoDgdoPwfFPzM=;
        b=C7RHOHc4ni1NdvaTk50lO0Eiu40C6Fyjz8Hu1oNXg8dyvVWnFNf2J6yGK+b4cf7zOL
         alen36c5kq6j00YjdH3QUelrWX9bK+P+AbdgFV2H9StgQkelK9rggTYIhfS3vOW7cG6r
         GlW3A2eXA5OU6kC5tTctGfwTvhawC8deW7yOIsTTUYSluPMwKi3lUtpIC8rShTmH96k3
         u/v9pb+s4tisCWn7uehdECtyeP2am2yfILFcIW3Sp7Ny1jcQ+m90wDgdBEE0TkdtErbu
         RY9+z5K5MMMr6YbK50MQKZDgwfDxf7yYuJfuhLOVjNayNeNNLyGcg/fF//Yvz9PYhwCO
         NLLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734568607; x=1735173407;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Cb8i+/RcecBf8L1BHUB812gTo+/Q1lLoDgdoPwfFPzM=;
        b=ILWv7KIdiLZzpVsDK20sGAGGRZ7ICIL3FLAble9Vk7xNd6WRVzDQiym74Q06NedU6b
         NacntVvkJp/sAMYMy4HZvHAW5xxw8XENiaonszos9X4DvzIJtP+fDoTYMdSUta5TTl8S
         UGLQBFhK96WrY1PsEU5S4Q9e68hFsV8kaMZmTi+zWs26zCyUYkuLHv0ah1IdFx/w03ib
         fm4l1NqifmQv+EdigX4a6wfvR9kv0oVAVYUPfuu7xUX3hOf25reqGYLZ99hFEjbapNXX
         m1Es09GAToo68VodJDOE6/ZKez9t6Qke11eKWk8yUEjZ8MemkWvY5I5VD3qP6RKRMZmE
         DOEg==
X-Forwarded-Encrypted: i=1; AJvYcCVOVY7/3PP5Yw2/q1j25ibZYxpLn6WRr6Fd6D/K+OKSqGk7FAj+JliaiGhQ7k7F+rK3CQ4AEYbq31p9PQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz3i4K0M5KcBNtUHm/EknBAFwWmNr4ixxEY7o/Eo+R4KmqWlZU
	AytbrkZa3rhWXTyaH92v7OmI6Sav5AZ9cj1nQKPajRDW2LWu62Dw3OIcaTFV9Zk=
X-Gm-Gg: ASbGnctdgKiMUEfwPrm1z94psl1TTtYWjGByiZUdWTATLtUlEhQ3WEvrMH3FLB7CaWO
	VUJ/8wWueM+Rdyiz5DVKdAs74o/u3zQvPJeUgUrekM7dr2bp8jgc/dUH0F18UQsq96jHANvzOuk
	UW5I3kdRzhNt/jjmb3Ra+vukIagT26ip2mAtX43WokZcyxJSnXrxYeYCsGRa8inRq8vWKulHM0r
	2R6eSk/NukMJmZzL0PEDgFcAZhz1ka74Fv4EnYgZLrKb3sWsYmEr6mIjGyri8hlqvaY0cIt83xS
	Dw++Nw==
X-Google-Smtp-Source: AGHT+IGjJyKsYjWbWITE1klbpwS9jGoMikkrLPCOKb2Dw/oFK7RIUcGdG08meGSlH2+zD9XaD1HuDQ==
X-Received: by 2002:a05:6e02:218e:b0:3a6:b783:3c06 with SMTP id e9e14a558f8ab-3bdc437ae8fmr49474725ab.19.1734568607604;
        Wed, 18 Dec 2024 16:36:47 -0800 (PST)
Received: from [100.64.0.1] ([165.188.116.15])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e68c2220cdsm16169173.148.2024.12.18.16.36.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 16:36:47 -0800 (PST)
Message-ID: <76505ca3-b5a7-4cb1-90ce-0c7951c0b3b6@sifive.com>
Date: Wed, 18 Dec 2024 18:36:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: riscv: add bfloat16 ISA extension
 description
To: Jessica Clarke <jrtc27@jrtc27.com>, Inochi Amaoto <inochiama@gmail.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Yixun Lan <dlan@gentoo.org>, Longbin Li <looong.bin@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>,
 Chen Wang <unicorn_wang@outlook.com>, Jonathan Corbet <corbet@lwn.net>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Evan Green <evan@rivosinc.com>,
 Charlie Jenkins <charlie@rivosinc.com>,
 Andrew Jones <ajones@ventanamicro.com>, Jesse Taube <jesse@rivosinc.com>,
 Andy Chiu <andybnac@gmail.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
 Yong-Xuan Wang <yongxuan.wang@sifive.com>
References: <20241206055829.1059293-1-inochiama@gmail.com>
 <20241206055829.1059293-2-inochiama@gmail.com>
 <5e878b5b-b49d-4757-8f7e-4b323a4998b3@sifive.com>
 <F52E8856-7602-4E4B-8932-2B13AAA30822@jrtc27.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <F52E8856-7602-4E4B-8932-2B13AAA30822@jrtc27.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_163648_999517_2245A63F 
X-CRM114-Status: GOOD (  10.31  )
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

T24gMjAyNC0xMi0xNiA0OjUxIFBNLCBKZXNzaWNhIENsYXJrZSB3cm90ZToKPiBPbiAxNiBEZWMg
MjAyNCwgYXQgMjI6MDAsIFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29t
PiB3cm90ZToKPj4KPj4gT24gMjAyNC0xMi0wNSAxMTo1OCBQTSwgSW5vY2hpIEFtYW90byB3cm90
ZToKPj4+IEFkZCBkZXNjcmlwdGlvbiBmb3IgdGhlIEJGbG9hdDE2IHByZWNpc2lvbiBGbG9hdGlu
Zy1Qb2ludCBJU0EgZXh0ZW5zaW9uLAo+Pj4gKFpmYmZtaW4sIFp2ZmJmbWluLCBadmZiZndtYSku
IHdoaWNoIHdhcyByYXRpZmllZCBpbiBjb21taXQgNGRjMjNkNjIKPj4+ICgiQWRkZWQgQ2hhcHRl
ciB0aXRsZSB0byBCRjE2Iikgb2YgdGhlIHJpc2N2LWlzYS1tYW51YWwuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQGdtYWlsLmNvbT4KPj4+IEFja2VkLWJ5
OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+Pj4gLS0tCj4+PiAu
Li4vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgfCA0NSArKysrKysr
KysrKysrKysrKysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0
ZW5zaW9ucy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4
dGVuc2lvbnMueWFtbAo+Pj4gaW5kZXggOWM3ZGQ3ZTc1ZTBjLi4wYTFmMWE3NmQxMjkgMTAwNjQ0
Cj4+PiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5z
aW9ucy55YW1sCj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mvcmlz
Y3YvZXh0ZW5zaW9ucy55YW1sCj4+PiBAQCAtMzI5LDYgKzMyOSwxMiBAQCBwcm9wZXJ0aWVzOgo+
Pj4gICAgICAgICAgICAgaW5zdHJ1Y3Rpb25zLCBhcyByYXRpZmllZCBpbiBjb21taXQgMDU2YjZm
ZiAoIlpmYSBpcyByYXRpZmllZCIpIG9mCj4+PiAgICAgICAgICAgICByaXNjdi1pc2EtbWFudWFs
Lgo+Pj4KPj4+ICsgICAgICAgIC0gY29uc3Q6IHpmYmZtaW4KPj4+ICsgICAgICAgICAgZGVzY3Jp
cHRpb246Cj4+PiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFpmYmZtaW4gZXh0ZW5zaW9uIHdo
aWNoIHByb3ZpZGVzIG1pbmltYWwgc3VwcG9ydCBmb3IKPj4+ICsgICAgICAgICAgICAxNi1iaXQg
aGFsZi1wcmVjaXNpb24gYnJhaW4gZmxvYXRpbmctcG9pbnQgaW5zdHJ1Y3Rpb25zLCBhcyByYXRp
ZmllZAo+Pgo+PiBJIHRoaW5rIHlvdSBtZWFuICJiaW5hcnkiIGhlcmUgYW5kIGluIHRoZSBlbnRy
aWVzIGJlbG93LCBub3QgImJyYWlu4oCdLgo+IAo+IE5vLCB0aGF04oCZcyBaZmhtaW4gLyBGUDE2
IC8gYmluYXJ5MTYsIG5vdCBaZmJmbWluIC8gQkYxNiAvIEJGbG9hdDE2PyBUaGUKPiBCIGlzIGZv
ciBCcmFpbiBhcyBpdCBjYW1lIG91dCBvZiBHb29nbGUgQnJhaW4uCj4gCj4gaHR0cHM6Ly9lbi53
aWtpcGVkaWEub3JnL3dpa2kvQmZsb2F0MTZfZmxvYXRpbmctcG9pbnRfZm9ybWF0CgpBaCwgeWVz
LCBJIHdhcyB0aGUgY29uZnVzZWQgb25lIGhlcmUuIFNvcnJ5IGZvciB0aGUgbm9pc2UuCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
