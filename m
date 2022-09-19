Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 486DEECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 06:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVDGhCPkPdpDk6VN7bcrO86WOV/pVDc2cdUqQZdZKrY=; b=J3qjeokpuCfHxC
	FEdGFHSHIFAg4bPEpjSRISevrR5X+80wq2HAcKoJmClD1BOsYuFJZqxIKhBIjOa3fWUB0Mjc+THBQ
	0zoU1Is27aO2V6RnSL8D4EgRDz/pG1JhlcK9V2NhPGtUi1x/AyWMB8oV4uJsKNNpWISPjQDjl49oM
	gXRbZAuTSYrPRn96sT09jqA7sPmW7hKwXawjnernEEczDTB9typ0rG8Qv+LeMC4caaMdJ+Nn47S3X
	6JJZMVGScXOlz89z7rdIj0c+Ig+htr0XZndj83Fq1m0kHyQFTOIz3X2+Kq5BLW2OJ98NHYGuvPG+a
	ppAtsqP+qVGHWED/Qj0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa9u8-008TUX-5K; Mon, 19 Sep 2022 06:05:16 +0000
Received: from forward500o.mail.yandex.net ([2a02:6b8:0:1a2d::610])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oa9u2-008TMT-Cn
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 06:05:14 +0000
Received: from myt6-870ea81e6a0f.qloud-c.yandex.net (myt6-870ea81e6a0f.qloud-c.yandex.net [IPv6:2a02:6b8:c12:2229:0:640:870e:a81e])
	by forward500o.mail.yandex.net (Yandex) with ESMTP id 8DDF794112C;
	Mon, 19 Sep 2022 09:04:59 +0300 (MSK)
Received: by myt6-870ea81e6a0f.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id ibsLEoVWKX-4whmEgi2;
	Mon, 19 Sep 2022 09:04:58 +0300
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client certificate not present)
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=syntacore.com; s=mail; t=1663567498;
	bh=ucqXuR/2KBbmfi8fpC1uXHOwRuSzxV/2yUtlgYAwFfM=;
	h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
	b=dcnTehAnpxenH2ijLy+YEAxKtjCxxLsvpJTCgMCN83riqeqvMqaSRs/sLYe1Gugmb
	 nUq5+hJaBU4XtBTSEkEg3psAS3BrAf77Qm2xqSO9jbRr+l+P8Hltiv67gkTiHy/km+
	 REo1F1w/qvgT/spnPMotSBdN54dnDlkHBlGTih4U=
Authentication-Results: myt6-870ea81e6a0f.qloud-c.yandex.net; dkim=pass header.i=@syntacore.com
Message-ID: <699b8e78-94e9-1581-8285-4c6bcc9fc425@syntacore.com>
Date: Mon, 19 Sep 2022 09:04:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4] riscv: Fix permissions for all mm's during mm init
To: Palmer Dabbelt <palmer@rivosinc.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 ajones@ventanamicro.com, conor.dooley@microchip.com
References: <mhng-16e91ca9-0ee8-4103-845e-56e9b394cae0@palmer-ri-x1c9>
Content-Language: ru-RU, en-US
From: Vladimir Isaev <vladimir.isaev@syntacore.com>
In-Reply-To: <mhng-16e91ca9-0ee8-4103-845e-56e9b394cae0@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_230510_694293_9E65E422 
X-CRM114-Status: GOOD (  14.81  )
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

MTguMDkuMjAyMiAxMzowNSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gT24gU2F0LCAxNyBTZXAg
MjAyMiAxMTo1ODo0OCBQRFQgKC0wNzAwKSwgTGludXMgVG9ydmFsZHMgd3JvdGU6Cj4+IFNvcnJ5
IGZvciBodG1sIGNydWQsIEknbSBhZmsgcmlnaHQgbm93Lgo+Pgo+PiBCdXQgbm8sIHRoaXMgZG9l
cyBub3QgaGVscCBhdCBhbGwuCj4+Cj4+IE5vdyB5b3UncmUgZG9pbmcgYSBibG9ja2luZyBzZW1h
cGhvcmUgb3BlcmF0aW9uIHVuZGVyIGEgc3Bpbm5pbmcgcndsb2NrCj4+IGluc3RlYWQuCj4+Cj4+
IFdoaWNoIGFsc28gaXMgY29tcGxldGVseSBpbnZhbGlkLgo+Pgo+PiBZb3VyIGNhbid0IGRvIGJs
b2NraW5nIGxvY2tzIGluIGF0b21pYyBjb250ZXh0LCBhbmQgaXQgZG9lc24ndCBtYXR0ZXIKPj4g
d2hldGhlciB0aGUgYXRvbWljIGNvbnRleHQgaXMgYSByY3UgcmVhZCBzZWN0aW9uIG9yIGEgc3Bp
biBsb2NrLgo+IAo+IE9LLCBzb3JyeSBmb3Igc2NyZXdpbmcgdXAgYSBzZWNvbmQgdGltZS7CoCBJ
J2xsIGdvIHRyeSBhbmQgbWFrZSBzdXJlIHdlIGdldCB0aGlzIHJpZ2h0IGJlZm9yZSBzZW5kaW5n
IGFueXRoaW5nIHVwLsKgIFZsYWRpbWlyOiBJJ2xsIGp1c3QgdGFrZSB0aGlzIG9uZSBvdmVyIGFu
ZCBzZW5kIGEgdjUsIEknbGwgZmluZCBzb21lIHRpbWUgdGhpcyB3ZWVrIHRvIG1ha2Ugc3VyZSBJ
IGNhbiBnZXQgaXQgcmlnaHQgdGhpcyB0aW1lLgo+IAo+IFNvcnJ5IGZvciB0aGUgbWVzcyEKSGkg
UGFsbWVyLAoKSSB0aGluayB3ZSBjYW4gYXZvaWQgdXNpbmcgZnVsbCBfX3NldF9tZW1vcnlfbW0g
Zm9yIHByb2Nlc3NlcyBoZXJlLCBiZWNhdXNlIGFsbCBub24tcGdkIGxlYWZzIHdlcmUKZml4ZWQg
YnkgX19zZXRfbWVtb3J5X21tKCZpbml0X21tKS4KClNvIGFsbCB3ZSBuZWVkIGhlcmUgaXMgdG8g
Zml4IG1tLnBnZCBpbiBjYXNlIGlmIHRoaXMgcGdkIGlzIGEgbGVhZiwgYmVjYXVzZSB3ZSBjb3B5
IG9ubHkgcGdkIGZvciB1c2Vyc3BhY2UuCgpUaGFuayB5b3UsClZsYWRpbWlyIElzYWV2Cj4gCj4+
IFN0b3AgbWFraW5nIHJhbmRvbSBsb2NraW5nIGNoYW5nZXMgbGlrZSB0aGlzLiBBbmQgZW5hYmxl
IGxvY2tkZXAgYW5kIHRoZQo+PiBsb2NrIHZlcmlmaWNhdGlvbiB0aGF0IHdvdWxkIGhhdmUgdG9s
ZCB5b3UgYWxsIHRoaXMgaW1tZWRpYXRlbHkuCj4+Cj4+IMKgwqDCoMKgwqDCoCBMaW51cwo+Pgo+
Pgo+PiBPbiBTYXQsIFNlcCAxNywgMjAyMiwgMTE6NDggVmxhZGltaXIgSXNhZXYgPHZsYWRpbWly
LmlzYWV2QHN5bnRhY29yZS5jb20+Cj4+IHdyb3RlOgo+Pgo+Pj4gKTsKPj4+ICsKPj4+ICvCoMKg
wqDCoMKgwqAgcmVhZF9sb2NrKCZ0YXNrbGlzdF9sb2NrKTsKPj4+ICvCoMKgwqDCoMKgwqAgZm9y
X2VhY2hfcHJvY2Vzcyh0KSB7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAo
dC0+ZmxhZ3MgJiBQRl9LVEhSRUFEKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnRpbnVlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgZm9yX2VhY2hfdGhyZWFkKHQsIHMpIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocy0+bW0pIHsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgX19zZXRfbWVtb3J5X21t
KHMtPm1tLCBzdGFydCwgZW5kLAo+Pj4gc2V0X21hc2ssCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgY2xlYXJfbWFzayk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgfQo+Pj4gK8KgwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgwqDCoMKgIHJlYWRfdW5sb2NrKCZ0
YXNrbGlzdF9sb2NrKTsKPj4+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
