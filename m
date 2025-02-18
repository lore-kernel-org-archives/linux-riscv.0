Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0107C021AD
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 17:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQ+3Ato7+F48FNNPIpNxGoUvfPL2m5Tszlf0kouuSoY=; b=pc7EwB7DvTq4U+
	ffk+fNpBX+O2crUd6IaSzuX7uOmyLK6z3PMIM9sppa8Sq9tG5JY97QqWYw+3b2OzbskdGK1HPEkZM
	eEQohbftS2fA7CZW3VqrpEMnmKpdTFG5wgVrsw87On4kbxEpdA7CV6HmEBq8Uafr7qpnmv0DvSF/1
	d+uwHcEYk8ziSQeAM+PkpSYXFM+EyO2pHdUukZtQj7huhZiXxtMshM/ZLOnkjnfDIarXVpOMIHeQv
	rXGW5FSdj43fQZiZ5GudizpBciOldtIskCmL2q3BzcclA4F211N+1IEjo47UPoXZMqJisXjF8wXEy
	0K1TeQL39aZ6JjA29rqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRP2-00000009BWn-2o2M;
	Tue, 18 Feb 2025 17:29:00 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRKA-000000099sF-43Xy;
	Tue, 18 Feb 2025 17:24:00 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4398c8c8b2cso22024635e9.2;
        Tue, 18 Feb 2025 09:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739899437; x=1740504237; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=;
        b=RkdmtE7i5ZTi+nvAEl9yLtcacXRrShR6xA0RSjXy+MJJOWjctXaGvMX+gNTNWVec1o
         KwWpjXeVhn1BocLHwVts/Z0pd0GEDFstoiCrOgHypTrucN+n6Ul0T+gTDIoBL/wQ+gLW
         8NZ5JFayVuvMXc80mWKZgmfc0ovtfxrGJsr/xgC7jTBmryrtpuNKFw6BXTiTzJbYMNHs
         nx8BrRYyYpd9lB30uHG0e/9IwwoEnBdI2zXyxDFPssajSxgXevd4E1s3USupxborR5nA
         Zb6NA9S6BrEH0y2b+DgsL/FkjU2AwjrBuEwiZo9i7kXe5jsfcK3o8uxEONr572GtlcAi
         CmUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739899437; x=1740504237;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9Kw7qFxKXcr45whwRwvA4Mj2NB/oA7RxSCK/IlKNzo=;
        b=nQZ07D2Qcdg/FNl0qmwwo72fY4+7dvLWNViN+gtaksjTrO1h1cYZ/jUdXEtawK+dPI
         WoDnbcEhC05y7gAN5my/5LeLZyl/nbU7N6lTXz+7KJ+NDXLX/++Fyjx+Hu+n3+uAJs0Z
         tLotBaNeP0p/Ah3EpPjnjE4ssQPLOIDFmMlZOAq1083z4f4Aay5WJPJd0FcI7SDuPV9R
         aIojyl6ykV16lVhWbktane+I5AdhJ40js5WxxwQYpKiKqrL2VAqtj48o8C0zMbLeYmEp
         Lq5I/fBTNzhM5KogmzNDQeVqS2GJ4kPZjoT/r1ClRXQM3Y2iMm/1TfAYPOhL94YKhm+b
         iXMw==
X-Forwarded-Encrypted: i=1; AJvYcCUqlALI7KdPCVsuZRJDvrL5Rt1lnQqkMY/Z3pUdJzGe5+wb9+bR7EkZgE0Siig3FdvM9/V7zyxbRpGfd3TkI6DF@lists.infradead.org, AJvYcCXLvhnhNJNmJg5gqaSdygJOXFB6dDAxyDNC2Lts15ykbMlTRmUSU32N6VVav7Vm2AlerGprxRU64pClk/g=@lists.infradead.org
X-Gm-Message-State: AOJu0YxnqRbhFmpv1SfKD9fYut67RaHEtekphovDTiysHJL8WsvFwJDz
	+4m87cJ1yuhkIIdprUYCofwiow/Zedz4lUtEqu8KIFBq/JTuR5c5
X-Gm-Gg: ASbGncv5RinamgmGGcvpFix7x4/vwVHWwDLeVlwrtq3Cm5yJiki9zoH9EAfhXWTGBlL
	BdO/bpPDJYp4vbfnYGdsnIm8Sko2mlgTgcX7H2d+6pkiLnvyIkzscqxWfFg2e7bsYFpGqYx7guu
	M5/1vSprJIMmzD6ci1Jx/xk4nScQ9xE9Ko2f0LZYn4y9sLCyv7uAejJwPC4yy5vNMTJkMjRPe8y
	SfiWGTGMrd0uQtE8DMvR5sGbbPxyJC1En/R1oH/7fPG6UbX4fQNtud9o3RUtPqvoPumvwcupfI6
	Da+JnNlvuIZadgxUcLKYjr4CsGkqJP9d6qwnn+gJXoRmNQw91B4vehjjqv554XOE91M=
X-Google-Smtp-Source: AGHT+IGdwqkgJU4MRYllMptDMTLx9Cq7fV8Bn0/VLRCRyd2ghtgYLKpjvlKzjZW3cSM9dRF5TKWB+w==
X-Received: by 2002:a05:600c:4450:b0:439:916a:b3db with SMTP id 5b1f17b1804b1-439916ab5bdmr58879435e9.6.1739899437098;
        Tue, 18 Feb 2025 09:23:57 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439922141a5sm32958965e9.2.2025.02.18.09.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:23:56 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 Alex Studer <alex@studer.dev>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Alex Studer <alex@studer.dev>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Add CPU thermal sensor and zone
Date: Tue, 18 Feb 2025 18:23:52 +0100
Message-ID: <4628970.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <20250218020629.1476126-1-alex@studer.dev>
References: <20250218020629.1476126-1-alex@studer.dev>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_092359_012838_DD0FBC20 
X-CRM114-Status: GOOD (  15.86  )
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

RG5lIHRvcmVrLCAxOC4gZmVicnVhciAyMDI1IG9iIDAzOjA2OjI5IFNyZWRuamVldnJvcHNraSBz
dGFuZGFyZG5pIMSNYXMgamUgQWxleCBTdHVkZXIgbmFwaXNhbChhKToKPiBUaGUgc3VuMjBpIFRI
UyAoYnVpbHQgaW4gQ1BVIHRoZXJtYWwgc2Vuc29yKSBpcyBzdXBwb3J0ZWQgaW4gY29kZSwgYnV0
Cj4gd2FzIG5ldmVyIGFkZGVkIHRvIHRoZSBkZXZpY2UgdHJlZS4gU28sIGFkZCBpdCB0byB0aGUg
ZGV2aWNlIHRyZWUsCj4gYWxvbmcgd2l0aCBhIHRoZXJtYWwgem9uZSBmb3IgdGhlIENQVS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFN0dWRlciA8YWxleEBzdHVkZXIuZGV2Pgo+IC0tLQo+ICBh
cmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kgfCAzMSArKysrKysr
KysrKysrKysrKysrCj4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRz
aSAgICB8IDE2ICsrKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCsp
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1k
MXMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+
IGluZGV4IDYzNjcxMTJlNi4uYmRkZTgyYWE4IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaQo+IEBAIC0zLDYgKzMsOCBAQAo+ICAKPiAgI2Rl
ZmluZSBTT0NfUEVSSVBIRVJBTF9JUlEobnIpCShuciArIDE2KQo+ICAKPiArI2luY2x1ZGUgPGR0
LWJpbmRpbmdzL3RoZXJtYWwvdGhlcm1hbC5oPgoKUHV0IGFib3ZlIGxpbmUgb24gdG9wIChiZWZv
cmUgU09DX1BFUklQSEVSQUxfSVJRKCkpLgoKPiArCj4gICNpbmNsdWRlICJzdW54aS1kMXMtdDEx
My5kdHNpIgo+ICAKPiAgLyB7Cj4gQEAgLTExNSw0ICsxMTcsMzMgQEAgcG11IHsKPiAgCQkJPDB4
MDAwMDAwMDAgMHgwMDAwMDAwZSAweGZmZmZmZmZmIDB4ZmZmZmZmZmYgMHgwMDAxMDAwMD4sCj4g
IAkJCTwweDAwMDAwMDAwIDB4MDAwMDAwMGYgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMjAw
MDA+Owo+ICAJfTsKPiArCj4gKwl0aGVybWFsLXpvbmVzIHsKPiArCQljcHUtdGhlcm1hbCB7Cj4g
KwkJCXBvbGxpbmctZGVsYXktcGFzc2l2ZSA9IDwwPjsKPiArCQkJcG9sbGluZy1kZWxheSA9IDww
PjsKPiArCQkJdGhlcm1hbC1zZW5zb3JzID0gPCZ0aHM+Owo+ICsKPiArCQkJY29vbGluZy1tYXBz
IHsKPiArCQkJCW1hcDAgewo+ICsJCQkJCXRyaXAgPSA8JmNwdV9hbGVydD47Cj4gKwkJCQkJY29v
bGluZy1kZXZpY2UgPSA8JmNwdTAgVEhFUk1BTF9OT19MSU1JVCBUSEVSTUFMX05PX0xJTUlUPjsK
PiArCQkJCX07Cj4gKwkJCX07Cj4gKwo+ICsJCQl0cmlwcyB7Cj4gKwkJCQljcHVfYWxlcnQ6IGNw
dS1hbGVydCB7Cj4gKwkJCQkJdGVtcGVyYXR1cmUgPSA8ODUwMDA+Owo+ICsJCQkJCWh5c3RlcmVz
aXMgPSA8MjAwMD47Cj4gKwkJCQkJdHlwZSA9ICJwYXNzaXZlIjsKPiArCQkJCX07Cj4gKwo+ICsJ
CQkJY3B1LWNyaXQgewo+ICsJCQkJCXRlbXBlcmF0dXJlID0gPDEwMDAwMD47Cj4gKwkJCQkJaHlz
dGVyZXNpcyA9IDwwPjsKPiArCQkJCQl0eXBlID0gImNyaXRpY2FsIjsKPiArCQkJCX07CgpXaGVy
ZSBkbyB0aG9zZSBsaW1pdHMgY29tZSBmcm9tPwoKPiArCQkJfTsKPiArCQl9Owo+ICsJfTsKPiAg
fTsKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFz
LXQxMTMuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEz
LmR0c2kKPiBpbmRleCBlNDE3NWFkYjAuLmZjZmNhZjA2YyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gKysrIGIvYXJjaC9y
aXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+IEBAIC00MjYsNiAr
NDI2LDEwIEBAIHNpZDogZWZ1c2VAMzAwNjAwMCB7Cj4gIAkJCXJlZyA9IDwweDMwMDYwMDAgMHgx
MDAwPjsKPiAgCQkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4gIAkJCSNzaXplLWNlbGxzID0gPDE+
Owo+ICsKPiArCQkJdGhzX2NhbGlicmF0aW9uOiB0aGVybWFsLXNlbnNvci1jYWxpYnJhdGlvbkAx
NCB7Cj4gKwkJCQlyZWcgPSA8MHgxNCAweDg+Owo+ICsJCQl9Owo+ICAJCX07Cj4gIAo+ICAJCWNy
eXB0bzogY3J5cHRvQDMwNDAwMDAgewo+IEBAIC05MzQsNSArOTM4LDE3IEBAIHJ0YzogcnRjQDcw
OTAwMDAgewo+ICAJCQljbG9jay1uYW1lcyA9ICJidXMiLCAiaG9zYyIsICJhaGIiOwo+ICAJCQkj
Y2xvY2stY2VsbHMgPSA8MT47Cj4gIAkJfTsKPiArCj4gKwkJdGhzOiB0aGVybWFsLXNlbnNvckAy
MDA5NDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3VuMjBpLWQxLXRocyI7Cj4g
KwkJCXJlZyA9IDwweDIwMDk0MDAgMHgxMDA+OwoKU2l6ZSBzaG91bGQgYmUgMHg0MDAuCgpCZXN0
IHJlZ2FyZHMsCkplcm5lagoKPiArCQkJaW50ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9JUlEo
NTgpIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+ICsJCQljbG9ja3MgPSA8JmNjdSBDTEtfQlVTX1RI
Uz47Cj4gKwkJCWNsb2NrLW5hbWVzID0gImJ1cyI7Cj4gKwkJCXJlc2V0cyA9IDwmY2N1IFJTVF9C
VVNfVEhTPjsKPiArCQkJbnZtZW0tY2VsbHMgPSA8JnRoc19jYWxpYnJhdGlvbj47Cj4gKwkJCW52
bWVtLWNlbGwtbmFtZXMgPSAiY2FsaWJyYXRpb24iOwo+ICsJCQkjdGhlcm1hbC1zZW5zb3ItY2Vs
bHMgPSA8MD47Cj4gKwkJfTsKPiAgCX07Cj4gIH07Cj4gCgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
