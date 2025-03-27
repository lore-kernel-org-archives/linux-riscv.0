Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4B6AC3600B
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Mar 2025 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Jj3ofiKfus/O1vCWoXnsw9tqG3uH16ySmMta0FOQIc=; b=G9uU23v4ayvc+2
	MLQicbUIog/TGvOwxllciGCroQnxz7/vw1g1gWQR8MZjIKkRP1H53umOjyce0lrN9lOzDI2oqCyfv
	lxC7lEgTN3bRQ64QZpOYHlHfXbs+Pkcd+0vKsM+shWNXniiWBVRh29ut8d8/EvqtG8wlblB8W6Qn8
	i8hSPHJ1OICeKLar47YJw7+wFXfwpu1PZGlWcUvyD+k6s02OJDHPb+OFKVesPN0Y3AN5ccq0uy44Y
	Q+sT/x0Zl2trWWdhYYfAQZQAKgMkIL5J6prCQxb7YgZCnd1nLt6E+0JW1QFXo0ZSRbXZji22an6mt
	PH+ULvkbKxE7o9LttoGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiQH-0000000AQjO-33D0;
	Thu, 27 Mar 2025 08:17:09 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txiMz-0000000AQBP-1yUd
	for linux-riscv@lists.infradead.org;
	Thu, 27 Mar 2025 08:13:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3913d129c1aso445146f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Mar 2025 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1743063223; x=1743668023; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jz00sfAr3h8cNxbqkgl+Nkm67OZ8eaKlmd2X1ZA3QeM=;
        b=X82Wr3kvsLyaL1aMfbXQ0JjsCiw4jQj07aWKza0jrHqegROzYjYgipCR99wk86c3gN
         Na1LeHbkl472F6M4ogqZm3xlH0bRTTnl6m8A+QhyoGBJHxK2XIkzkc28Cv6mKvHrmrcY
         mFlm+XPoqpRQ0MmWdSVxfLzHHXlLYpKyWSF1GpRvXxZuKQtGZHB+41rDEa24JCIH9bkr
         4cRqSft2QO4ZqZARVH6mPDa/g0Sft8WpoHEeGEy076g4cDMfQKHKMy78+fOoD2Q3wEcS
         zfRbuD6fcL/lgmhDIGQQqyu2Rf8KtvM0x5oJtOz4dINJkryMepfveMync/v7cZwXaDyc
         gbVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743063223; x=1743668023;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jz00sfAr3h8cNxbqkgl+Nkm67OZ8eaKlmd2X1ZA3QeM=;
        b=NeKrNtuGaAIJ2vo9QIHGnD8Bb1s5Y+ZHCBXwx4LtDf1c5FRb5YiEhZ2JEnUZJRV0RQ
         H8pIj5L2FQRbclc9ExKeWqejWfe8A0HGqo4zqcHlhHPNQkWJqegInotiTKToAElH6tyh
         Z8/KfNlSfKA9iE7cMJGLOXgIg19qHlmCpzKjZ4Myhp+7AeS1E+f2goPL6os11H4LBGTS
         M1SOiWIwL4XhrIb2b43aECnfwGdyBT8CZ550+F91A96fPBE1HnFB/K8/ajcuTu/mGrOj
         k0Am4J1mhbxRmex7Z7SwtnwTZYGCWp/iM6lIbC5wH6uSotl1k0oA9XsJhFCJCCpwLQsz
         Lz/g==
X-Forwarded-Encrypted: i=1; AJvYcCXzPT/bB9dlULuDvpVztb2xqBtqHoRN5BreCzJVDGipwZAxqp4EKgJZ5LAZzoxsqSuvRUcfXvY3nwJ4Zw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeWeT7WcpanODA5apqaiVrdFcRQpzTwTPuCMIUHHhRfgNflk4a
	f11LheOpfgNkTGRnOLVe8FrTfU5nPmwQyOGU49Q1rdT1jRkP1Y83GUFbXXvKclA=
X-Gm-Gg: ASbGncviLA5qFmQUPsWxcNFU8afmBqrQ69GYudNarMgQ6MUcpTBfnW+4xyGXyC8m/i8
	nwW9zO0D3eQvIdlnA1yNkTdfEVsXJlhsqlJZqNaqxIpy3kszb5DEZ1BiFdj8qRkqDeeQnyuRevf
	9geHJZQiFoMxRTYucK+Sl1y6EqvGYpkL5BWBrdJ0QDP1QEY6AlpnHa/XJ5JqS7iOCzKNj+mqPNH
	4a0HStAFxuCmykmX97UccyjNCnOTU99czNmIfl99Du0oyN1+3jMkLQUy6lBrt11YNfjW8ebk6RZ
	WcQX1PWYSDyr5lpNSx6uNrUiucctjT3j4VhupWMweeIfvkVA0s1p7w==
X-Google-Smtp-Source: AGHT+IHaGU7k1A9qg1y23ZMz5cgJ0D4Cu+DVQXIKfTtvPKv7hvhNHKkbv6hFjGYgP2YHKA+NqagcPQ==
X-Received: by 2002:a5d:64a9:0:b0:39a:c6d1:c343 with SMTP id ffacd0b85a97d-39acc44f0aemr5163077f8f.10.1743063223009;
        Thu, 27 Mar 2025 01:13:43 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.103])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e65besm19397452f8f.65.2025.03.27.01.13.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Mar 2025 01:13:42 -0700 (PDT)
Message-ID: <d47e7da3-4b84-4688-a1f1-8019383a3e48@tuxon.dev>
Date: Thu, 27 Mar 2025 10:13:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 10/13] net: macb: Add "mobileye,eyeq5-gem"
 compatible
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250321-macb-v1-0-537b7e37971d@bootlin.com>
 <20250321-macb-v1-10-537b7e37971d@bootlin.com>
 <ea5de004-a26c-43a1-9408-0089fa18b44d@tuxon.dev>
 <D8PITUNTWTXA.366TNSXDUL48G@bootlin.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <D8PITUNTWTXA.366TNSXDUL48G@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_011345_666268_799F98DF 
X-CRM114-Status: GOOD (  23.57  )
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

SGksIFRoZW8sCgpPbiAyNS4wMy4yMDI1IDE5OjI1LCBUaMOpbyBMZWJydW4gd3JvdGU6Cj4+PiAr
CX0KPj4+ICsKPj4+ICsJcmVnbWFwX3JlYWQocmVnbWFwLCBncCwgJnJlZyk7Cj4+PiArCXJlZyAm
PSB+RVlFUTVfT0xCX0dQX1JHTUlJX0RSVjsKPj4+ICsJaWYgKHBoeV9pbnRlcmZhY2VfbW9kZV9p
c19yZ21paShicC0+cGh5X2ludGVyZmFjZSkpCj4+PiArCQlyZWcgfD0gRklFTERfUFJFUChFWUVR
NV9PTEJfR1BfUkdNSUlfRFJWLCAweDkpOwo+Pj4gKwlyZWcgfD0gRVlFUTVfT0xCX0dQX1RYX1NX
UlNUX0RJUyB8IEVZRVE1X09MQl9HUF9UWF9NX0NMS0U7Cj4+PiArCXJlZyB8PSBFWUVRNV9PTEJf
R1BfU1lTX1NXUlNUX0RJUyB8IEVZRVE1X09MQl9HUF9TWVNfTV9DTEtFOwo+Pj4gKwlyZWdtYXBf
d3JpdGUocmVnbWFwLCBncCwgcmVnKTsKPj4gVG8gbWUgaXQgbG9va3MgbGlrZSB0aGlzIGNvZGUg
Y291bGQgYmUgYWJzdHJhY3RlZCBhcyBhIHBoeSBkcml2ZXIuIEUuZy4sCj4+IGNoZWNrIHRoZSBp
bml0X3Jlc2V0X29wdGlvbmFsKCkgYW5kIGl0cyB1c2FnZSBvbiAiY2Rucyx6eW5xbXAtZ2VtIiAo
cGh5Cj4+IGRyaXZlciBoZXJlOiBkcml2ZXJzL3BoeS94aWxpbngvcGh5LXp5bnFtcC5jKS4KPiBJ
IHRob3VnaHQgYWJvdXQgdGhhdCBxdWVzdGlvbi4gT3B0aW9ucyB0byBpbXBsZW1lbnQgdGhhdCBz
ZXF1ZW5jZSBhcmU6Cj4gCj4gIC0gKDEpIEltcGxlbWVudCBhIHNlcGFyYXRlIFBIWSBkcml2ZXIs
IHdoYXQgeW91IGFyZSBwcm9wb3NpbmcuIEkganVzdAo+ICAgIG1hZGUgYSBwcm90b3R5cGUgYnJh
bmNoIHRvIHNlZSB3aGF0IGl0J2QgbG9vayBsaWtlLiBOb3RoaW5nIHRvbwo+ICAgIHN1cnByaXNp
bmc7IG1vc3RseSB0aGUgYWJvdmUgc2VxdWVuY2UgaXMgY29weS1wYXN0ZWQgaW5zaWRlCj4gICAg
cGh5X2luaXR8cG93ZXJfb24oKS4gSSBzZWUgdHdvIGlzc3VlczoKPiAKPiAgICAgLSBGaXJzdCwg
YSBwcmFjdGljYWwgb25lLiBUaGlzIGFkZHMgYSBsb3Qgb2YgYm9pbGVycGxhdGUgZm9yIG5vCj4g
ICAgICAgb2J2aW91cyBiZW5lZml0IGNvbXBhcmVkIHRvIGEgcmF3IHJlZ2lzdGVycyByZWFkL3dy
aXRlIHNlcXVlbmNlCj4gICAgICAgaW5zaWRlIG1hY2JfY29uZmlnLT5pbml0KCkuCgpUaGUgbWFj
YiBpcyB1c2VkIGJ5IHZhcmlvdXMgcGxhdGZvcm1zLiBJZiB0aGUgc2V0dGluZ3MgcHJvcG9zZWQg
aW4gdGhpcwpwYXRjaCAocGxhdGZvcm0gc3BlY2lmaWMgQUZBSUNUKSBjb3VsZCBiZSBhYnN0cmFj
dGVkIGFuZCB1c2VkIHdpdGggZ2VuZXJpYwpBUElzIEkgdGhpbmsgd291bGQgYmUgYmV0dGVyIHRo
aXMgd2F5LgoKPiAKPiAgICAgICBUaGUgbWFpbiByZWFzb24gZm9yIHRoYXQgYm9pbGVycGxhdGUg
aXMgdG8gYWxsb3cgcmV1c2Ugb2YgYSBQSFkKPiAgICAgICBhY3Jvc3MgTUFDczsKCkFuZC9vciBh
dm9pZCBoYXZpbmcgcGxhdGZvcm0gc3BlY2lmaWMgY29kZSBpbiB0aGUgbWFjYiBkcml2ZXIuCgo+
IGhlcmUgd2UgYWxyZWFkeSBrbm93IHRoYXQgY2Fubm90IGJlIHVzZWZ1bCBiZWNhdXNlCj4gICAg
ICAgdGhlIEV5ZVE1IGhhcyB0d28gR0VNcyBhbmQgbm90aGluZyBlbHNlLiBUaG9zZSByZWdpc3Rl
cnMgYXJlCj4gICAgICAgRXllUTUtc3BlY2lmaWMuCj4gCj4gICAgIC0gU2Vjb25kLCBhIHNlbWFu
dGljIG9uZS4gVGhlIHJlZ2lzdGVycyB3ZSBhcmUgdG91Y2hpbmcgYXJlICpub3QqCj4gICAgICAg
dGhlIFBIWSdzIHJlZ2lzdGVycy4gVGhleSBhcmUgY29uZmlndXJpbmcgdGhlIFBIWSdzIGludGVn
cmF0aW9uOgo+ICAgICAgIGl0cyBpbnB1dCBQTEwsIHJlc2V0cywgZXRjLgo+IAo+ICAtICgyKSBT
ZWNvbmQsIHRha2luZyBpbnRvIGFjY291bnQgdGhhdCB3aGF0IHdlIGFyZSBjb25maWd1cmluZyBp
c24ndAo+ICAgIHRoZSBQSFkgaXRzZWxmIGJ1dCBpdHMgcmVzb3VyY2VzLCB3ZSBjb3VsZCB0cnkg
bW9kZWxpbmcgZWFjaAo+ICAgIGluZGl2aWR1YWwgcmVnaXN0ZXIrZmllbGQgYXMgYSByZXNldCAv
IGNsb2NrIC8gcGluIGNvbnRyb2wgKHRoZXJlIGlzCj4gICAgc29tZSBkcml2ZSBzdHJlbmd0aCBp
biBoZXJlLCAqSSB0aGluayopLiBJc3N1ZTogdGhpcyB3b3VsZCBnZXQKPiAgICBtZXNzeSwgZmFz
dC4KPiAgICAgLSBBIHNpbmdsZSByZWdpc3RlciB3b3VsZCBleHBvc2UgbWFueSByZXNvdXJjZXMu
Cj4gICAgIC0gVGhlIHNlcXVlbmNlIGluIG1hY2JfY29uZmlnLT5pbml0KCkgd291bGQgbmVlZCB0
byBiZSB0aGUgZXhhY3QKPiAgICAgICBzYW1lIG9yZGVyLiBJRSB3ZSBjYW4ndCBhYnN0cmFjdCBt
dWNoLgo+IAo+ICAgIFNvbWV0aGluZyBsaWtlIHRoaXMgcHNldWRvY29kZSAod2hpY2ggaXMgYSBi
YWQgaWRlYSwgd2UnZCBhbGwgYWdyZWUKPiAgICBoZXJlKToKPiAKPiAgICAgICByZXNldF9kZWFz
c2VydChicC0+ZXE1X3NnbWlpX3Jlc2V0KTsKPiAgICAgICByZXNldF9kZWFzc2VydChicC0+ZXE1
X3NnbWlpX3Jlc2V0X3B3cik7Cj4gICAgICAgcmVzZXRfZGVhc3NlcnQoYnAtPmVxNV9waHlfcmVz
ZXRfdHgpOwo+ICAgICAgIHJlc2V0X2RlYXNzZXJ0KGJwLT5lcTVfcGh5X3Jlc2V0X3N5cyk7Cj4g
Cj4gICAgICAgaWYgKGJwLT5waHlfaW50ZXJmYWNlID09IFBIWV9JTlRFUkZBQ0VfTU9ERV9TR01J
SSkgewo+ICAgICAgICAgIHBpbmN0cmxfc2VsZWN0X3N0YXRlKGJwLT5lcTVfcGh5X2lucHV0X3Bp
bmN0cmwsIGJwLT5lcTVfcGluc19zZ21paSk7Cj4gCj4gICAgICAgICAgcmVzZXRfZGVhc3NlcnQo
YnAtPmVxNV9zZ21paV9yZXNldCk7Cj4gICAgICAgICAgY2xrX3ByZXBhcmVfZW5hYmxlKGJwLT5l
cTVfc2dtaWlfcGh5X2lucHV0X3BsbCk7Cj4gCj4gICAgICAgICAgcmVzZXRfZGVhc3NlcnQoYnAt
PmVxNV9zZ21paV9yZXNldF9wd3IpOwo+ICAgICAgIH0gZWxzZSB7Cj4gICAgICAgICAgcGluY3Ry
bF9zZWxlY3Rfc3RhdGUoYnAtPmVxNV9waW5jdHJsLCBicC0+ZXE1X3BpbnNfcmdtaWkpOwo+ICAg
ICAgIH0KPiAKPiAgICAgICByZXNldF9kZWFzc2VydChicC0+ZXE1X3BoeV9yZXNldF90eCk7Cj4g
ICAgICAgcmVzZXRfZGVhc3NlcnQoYnAtPmVxNV9waHlfcmVzZXRfc3lzKTsKPiAgICAgICBjbGtf
cHJlcGFyZV9lbmFibGUoYnAtPmVxNV9waHlfbWNsa190eCk7Cj4gICAgICAgY2xrX3ByZXBhcmVf
ZW5hYmxlKGJwLT5lcTVfcGh5X21jbGtfc3lzKTsKClRoaXMgbG9va3MgY29tcGxpY2F0ZWQgdG8g
bWUuCgo+IAo+ICAtICgzKSBLZWVwIHRoZSBzZXF1ZW5jZSBpbiBtYWNiX2NvbmZpZy0+aW5pdCgp
LiBQbGFpbiBhbmQgc2ltcGxlLgo+ICAgICAtIElzc3VlOiBpdCBpcyBzb21ld2hhdCB1bnJlbGF0
ZWQgcGxhdGZvcm0tc3BlY2lmaWMgY29kZSB0aGF0J3MKPiAgICAgICBwcmVzZW50IGluc2lkZSBt
YWNiX21haW4uYy4KCkZvciBtYWludGFpbmFiaWxpdHkgSSB3b3VsZCBwcmVmZXIgdG8gYXZvaWQg
dGhpcy4KCj4gCj4gVGhlIHR3byBzZXJpb3VzIG9wdGlvbnMgYXJlICgxKSBhbmQgKDMpLgo+ICgx
KSBpcyB3aGF0IHlvdSBwcm9wb3NlZCBhbmQgKDMpIGlzIHdoYXQncyBpbiB0aGUgc2VyaWVzLgoK
SSBwcmVmZXIgKDEpIGlmIGl0IGNhbiBiZSBkb25lLgoKVGhhbmsgeW91LApDbGF1ZGl1CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
