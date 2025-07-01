Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3372C8302F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 09:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o55gl7mFlkLsf/ETsMJRxxOdlPQyB6vcMk0VAMqxZPI=; b=JUolrgf5Lt0/Eq
	z5P0qyqgVhy9U2e589uYM6Du8QhOpQg7LgLwpSmc4m0RlVBJ3RAQyg/BweV0G9Q3O/bWZkouVZgmJ
	VNjLMK3aBDO2+d5l59Y2noPSlHaLeqQTAgZ8/RUZHSB1GXGfa1HNXk0OK9/KKhZY/b+OUvHC2Plbv
	eVIYxrObAlajzAVjyz9qY9hMQ3WaORuPw0bkooOKeJ8hMmOQOZTKm5ZPFnc9XC++GNIAHSpJRb9lv
	0JfeWRbVmYzGx2c5SBrTbe8JAHcgIGJqxPGozPA31HiVGRegHu47xAfSvk9qzwytJ+KDohHZ9hzGs
	zcFNA4FfzKP6PGQunnpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXPz-00000004cCs-0ZUC;
	Tue, 01 Jul 2025 09:36:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWWsj-00000004Xm6-31de
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 09:02:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 257A461136;
	Tue,  1 Jul 2025 09:02:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10A1DC4CEEB;
	Tue,  1 Jul 2025 09:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751360544;
	bh=fNNpa0ael/yyn/lAFZw/C3Tbk3Ifo/DKFoC6QqBiGOA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RLF2Nx3473mixxNLPhwRcO1lsCC2nPzi2nrGCFyeMdTw6QciX7oVRB7jfMfZiEGEA
	 32cq4UDr581F2qsrQGH1tCN3fxgWtQYHuHdumKPL4FfMg8P/KS2ISTiMgRph7WI1pO
	 z++LPmRrR/vqQy7T6bOb3SSZ6ksLKydLap5KW2Nk4Bw/Qu0cbaQQib+cyo4zXvkCUS
	 cOJ07bMKc0oJ1dRJjbYiPMA63zgEVCkkrAmBxhloiPGhm9oUWOg7Ji9w+OoxRuo0oz
	 QfdqJSZtu7CqMPlLcOQzOUWBB+WkEOjZOcZnvv9p4+3KegeULSuVDTDtC+aw6FOEFT
	 Q1UttI+47DktQ==
Message-ID: <d3d73135-15d8-487d-a55a-44f1f98db930@kernel.org>
Date: Tue, 1 Jul 2025 11:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
To: Guodong Xu <guodong@riscstar.com>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 =?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com>
 <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org>
 <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
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

T24gMDEvMDcvMjAyNSAxMDo0OCwgR3VvZG9uZyBYdSB3cm90ZToKPiBPbiBUdWUsIEp1bCAxLCAy
MDI1IGF0IDM6MzbigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdy
b3RlOgo+Pgo+PiBPbiAwMS8wNy8yMDI1IDA3OjM3LCBHdW9kb25nIFh1IHdyb3RlOgo+Pj4gRW5h
YmxlIHRoZSBQRE1BMCBvbiB0aGUgU3BhY2VtaVQgSzEtYmFzZWQgQmFuYW5hIFBpIEYzIGFuZCBN
aWxrdiBKdXBpdGVyCj4+PiBib2FyZHMgYnkgc2V0dGluZyBpdHMgc3RhdHVzIHRvICJva2F5Ii4K
Pj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4K
Pj4+IC0tLQo+Pj4gdjI6IGFkZGVkIHBkbWEwIGVuYWJsZW1lbnQgb24gTWlsa3YgSnVwaXRlcgo+
Pj4gLS0tCj4+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5k
dHMgICB8IDQgKysrKwo+Pj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtbWlsa3Yt
anVwaXRlci5kdHMgfCA0ICsrKysKPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygr
KQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJh
bmFuYXBpLWYzLmR0cyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGkt
ZjMuZHRzCj4+PiBpbmRleCBmZTIyYzc0N2M1MDEyZmU1NmQ0MmFjOGE3ZWZkYmJkYjY5NGYzMWI2
Li4zOTEzMzQ1MGUwN2YyY2I5Y2IyMjQ3ZGMwMjg0ODUxZjhjNTUwMzFiIDEwMDY0NAo+Pj4gLS0t
IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5hbmFwaS1mMy5kdHMKPj4+ICsr
KyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazEtYmFuYW5hcGktZjMuZHRzCj4+PiBA
QCAtNDUsMyArNDUsNyBAQCAmdWFydDAgewo+Pj4gICAgICAgcGluY3RybC0wID0gPCZ1YXJ0MF8y
X2NmZz47Cj4+PiAgICAgICBzdGF0dXMgPSAib2theSI7Cj4+PiAgfTsKPj4+ICsKPj4+ICsmcGRt
YTAgewo+Pgo+Pgo+PiBEb2VzIG5vdCBsb29rIGxpa2UgcGxhY2VkIGFjY29yZGluZyB0byBEVFMg
Y29kaW5nIHN0eWxlLiBXaGF0IHNvcnQgb2YKPj4gb3JkZXJpbmcgU3BhY2VtaXQgZm9sbG93cz8K
Pj4KPiAKPiBBZ3JlZWQuIFdlIHNob3VsZCBlc3RhYmxpc2ggYSBjb25zaXN0ZW50IG9yZGVyaW5n
IHJ1bGUgZm9yIFNwYWNlbWlUIGJvYXJkCgoKSXNuJ3QgdGhlcmUgYSBzdHlsZSBhbHJlYWR5PyBP
ciB3aGF0IGlzIHRoZSBzdHlsZSBmb3IgUmlzYy12IGFyY2g/CgpCZXN0IHJlZ2FyZHMsCktyenlz
enRvZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
