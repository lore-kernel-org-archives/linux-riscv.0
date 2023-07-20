Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5B9EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 06:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5brkmq1qcXbWxfS2MM8ZT16Basp2+GM4RAqkPYyq9k=; b=xr8W8vaeuwXhho
	WDI6p7YUEODvoowBFTf77ds2bT2Plvm/CUdln7zi2pUl/RY58KrT6mSgtv5hR2MfzLUdNPyBCBpfA
	MeRWiDLz/Jp4TJFvpWtnK8YjaoEcyS3/A0dA+7fiuHnwCnlGOi1IyT+jzrYl97JEN4dEYZKRpJmKX
	VJUrRsCOBSwPUhVMnNytnzc8+UZtGYgWQJxrDfIdsrLQxH/RjuivggyA/HYwDrdkRL8hmHw1X5N2w
	6K8Yro5RW0pmBZHFdXLz8EfZjVyLOOQlZ4rp1PY+fZI7maEhLpsotmyy92ck2NZy3gKfI45erAKBG
	K6cMy5xtMnv/pF0bcN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNJL-009xyc-2C;
	Thu, 20 Jul 2023 06:38:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMNJI-009xxR-1s
	for linux-riscv@lists.infradead.org;
	Thu, 20 Jul 2023 06:38:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 154B3611B1;
	Thu, 20 Jul 2023 06:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC7C8C433C8;
	Thu, 20 Jul 2023 06:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689835127;
	bh=JUczBgKxXZiHONsdlYXF6A80Z7d/kbeRft7c934WaD0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NxJd/81KtsyKg/wa11OhHkXzaEsTFhth/WuAbQtTnr1brzjJrc2zJvQc5yIVsiMqg
	 2CVsemVq8+V/2Jz5LhBbWDQ224CQUTfzR5CYugjGB8F7xt5l7aIIemG/sb8LAZ+QbG
	 ZOgbfouoypCS5fmjNHoeZfAO9nEcOwO81Ewmpljl7tIGcs1yQdX040NRsbLe0QWxhR
	 12wXpInVUbtI9WEgf62AXOHuQaaQAspWnsEAVGkOCDsefAWEY9uFdo4r9imscLPIdQ
	 gDsR2Yi/wiegRPEog/A/1V1TD+pzJAxpsZQslxBMYpwRnpQZomV/+UfbTiOSSuRC6c
	 686yLmeSNbQDg==
Message-ID: <c26d029e-dabc-9ad2-ed42-bb6ee276e3fb@kernel.org>
Date: Thu, 20 Jul 2023 08:38:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 05/11] RISC-V: drivers/iommu/riscv: Add sysfs interface
Content-Language: en-US
To: Tomasz Jeznach <tjeznach@rivosinc.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
References: <cover.1689792825.git.tjeznach@rivosinc.com>
 <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <610abe685f90870be52bc7c2ca45ab5235bd8eb4.1689792825.git.tjeznach@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_233848_703579_38479D8D 
X-CRM114-Status: GOOD (  16.96  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Nick Kossifidis <mick@ics.forth.gr>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTkvMDcvMjAyMyAyMTozMywgVG9tYXN6IEplem5hY2ggd3JvdGU6Cj4gRW5hYmxlIHN5c2Zz
IGRlYnVnIC8gdmlzaWJpbGl0eSBpbnRlcmZhY2UgcHJvdmlkaW5nIHJlc3RyaWN0ZWQKPiBhY2Nl
c3MgdG8gaGFyZHdhcmUgcmVnaXN0ZXJzLgoKUGxlYXNlIHVzZSBzdWJqZWN0IHByZWZpeGVzIG1h
dGNoaW5nIHRoZSBzdWJzeXN0ZW0uIFlvdSBjYW4gZ2V0IHRoZW0gZm9yCmV4YW1wbGUgd2l0aCBg
Z2l0IGxvZyAtLW9uZWxpbmUgLS0gRElSRUNUT1JZX09SX0ZJTEVgIG9uIHRoZSBkaXJlY3RvcnkK
eW91ciBwYXRjaCBpcyB0b3VjaGluZy4KCj4gCj4gU2lnbmVkLW9mZi1ieTogVG9tYXN6IEplem5h
Y2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9pb21tdS9yaXNjdi9N
YWtlZmlsZSAgICAgIHwgICAyICstCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtc3lzZnMu
YyB8IDE4MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPiAgZHJpdmVycy9pb21tdS9y
aXNjdi9pb21tdS5jICAgICAgIHwgICA3ICsrCj4gIGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUu
aCAgICAgICB8ICAgMiArCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTkzIGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaW9tbXUvcmlzY3YvaW9t
bXUtc3lzZnMuYwo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxl
IGIvZHJpdmVycy9pb21tdS9yaXNjdi9NYWtlZmlsZQo+IGluZGV4IDM4NzMwYzExZTRhOC4uOTUy
M2ViMDUzY2ZjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaW9tbXUvcmlzY3YvTWFrZWZpbGUKPiAr
KysgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L01ha2VmaWxlCj4gQEAgLTEgKzEgQEAKPiAtb2JqLSQo
Q09ORklHX1JJU0NWX0lPTU1VKSArPSBpb21tdS5vIGlvbW11LXBjaS5vIGlvbW11LXBsYXRmb3Jt
Lm8KPiBcIE5vIG5ld2xpbmUgYXQgZW5kIG9mIGZpbGUKPiArb2JqLSQoQ09ORklHX1JJU0NWX0lP
TU1VKSArPSBpb21tdS5vIGlvbW11LXBjaS5vIGlvbW11LXBsYXRmb3JtLm8gaW9tbXUtc3lzZnMu
bwo+IFwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQoKWW91IGhhdmUgdGhpcyBlcnJvciBpbiBt
dWx0aXBsZSBwbGFjZXMuCgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11
LXN5c2ZzLmMgYi9kcml2ZXJzL2lvbW11L3Jpc2N2L2lvbW11LXN5c2ZzLmMKPiBuZXcgZmlsZSBt
b2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAwMC4uZjAzOGVhODQ0NWM1Cj4gLS0tIC9kZXYv
bnVsbAo+ICsrKyBiL2RyaXZlcnMvaW9tbXUvcmlzY3YvaW9tbXUtc3lzZnMuYwo+IEBAIC0wLDAg
KzEsMTgzIEBACj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wLW9ubHkKPiAr
LyoKPiArICogSU9NTVUgQVBJIGZvciBSSVNDLVYgYXJjaGl0ZWN0ZWQgWmlvbW11IGltcGxlbWVu
dGF0aW9ucy4KPiArICoKPiArICogQ29weXJpZ2h0IMKpIDIwMjItMjAyMyBSaXZvcyBJbmMuCj4g
KyAqCj4gKyAqIEF1dGhvcjogVG9tYXN6IEplem5hY2ggPHRqZXpuYWNoQHJpdm9zaW5jLmNvbT4K
PiArICovCj4gKwo+ICsjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4gKyNpbmNsdWRlIDxsaW51
eC9rZXJuZWwuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2NvbXBpbGVyLmg+Cj4gKyNpbmNsdWRlIDxs
aW51eC9pb21tdS5oPgo+ICsjaW5jbHVkZSA8bGludXgvcGxhdGZvcm1fZGV2aWNlLmg+Cj4gKyNp
bmNsdWRlIDxhc20vcGFnZS5oPgo+ICsKPiArI2luY2x1ZGUgImlvbW11LmgiCj4gKwo+ICsjZGVm
aW5lIHN5c2ZzX2Rldl90b19pb21tdShkZXYpIFwKPiArCWNvbnRhaW5lcl9vZihkZXZfZ2V0X2Ry
dmRhdGEoZGV2KSwgc3RydWN0IHJpc2N2X2lvbW11X2RldmljZSwgaW9tbXUpCj4gKwo+ICtzdGF0
aWMgc3NpemVfdCBhZGRyZXNzX3Nob3coc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCQkgICAgc3Ry
dWN0IGRldmljZV9hdHRyaWJ1dGUgKmF0dHIsIGNoYXIgKmJ1ZikKCgpXaGVyZSBpcyB0aGUgc3lz
ZnMgQUJJIGRvY3VtZW50ZWQ/CgoKQmVzdCByZWdhcmRzLApLcnp5c3p0b2YKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
