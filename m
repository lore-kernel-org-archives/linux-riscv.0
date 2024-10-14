Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 886BFD1625B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Oct 2024 12:52:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6NopsO9tVsPpmjs7Oln9FjvbaFnPy6ju+dLAEQTdMzE=; b=RDjCtMiag9cT4g
	2iVyM1aEy5+w96jyfwuLch9TrqTPNxHPZosDc1rvv788IJmOAb7Z3pfhMt7HIpVDBugP9XSd5AvXn
	PNka3yLWi8+D94DnmfqobZ09qmtfw2bwQZOJNFpy0YptO+0M7gNmjFFGJY5eHuRZ4xTrOzbDofE9U
	mBpPbqaEXQS5RGskzpO8xND0oMQ4mlYr2VdTOZ7vIS8geXwcu6QOWBG0fCX5nVjO0DVLSZGRj1cu8
	B+JI5LVYbOlIItvsW6xMet2o8Zh+pkEASrEmqIg+J8iB5487ZVgQFgpB1vn44HAI2tqPBwrfqYyIh
	UcO7WRDvVF1YRUaHvPzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0KZ9-000000059NA-1Qi6;
	Mon, 14 Oct 2024 12:52:51 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0J0Z-00000004rrb-1MLU
	for linux-riscv@lists.infradead.org;
	Mon, 14 Oct 2024 11:13:05 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A82F01C0003;
	Mon, 14 Oct 2024 11:12:53 +0000 (UTC)
Message-ID: <8138c729-8a30-454d-8422-234cead415ab@ghiti.fr>
Date: Mon, 14 Oct 2024 13:12:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] riscv: vdso: Prevent gcc from inserting calls to
 memset()
Content-Language: en-US
To: Palmer Dabbelt <palmer@dabbelt.com>, alexghiti@rivosinc.com
Cc: vladimir.isaev@syntacore.com, roman.artemev@syntacore.com,
 guoren@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <mhng-b17acfa9-03e8-4ef7-a24f-a133b2dbf31a@palmer-ri-x1c9>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <mhng-b17acfa9-03e8-4ef7-a24f-a133b2dbf31a@palmer-ri-x1c9>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241014_041303_523842_899E28DD 
X-CRM114-Status: GOOD (  17.33  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgUGFsbWVyLAoKT24gMTcvMDkvMjAyNCAxNzo0MSwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4g
T24gVGh1LCAwNCBKdWwgMjAyNCAyMzowOTowMSBQRFQgKC0wNzAwKSwgYWxleGdoaXRpQHJpdm9z
aW5jLmNvbSB3cm90ZToKPj4gZ2NjIGlzIHNtYXJ0IGVub3VnaCB0byBpbnNlcnQgYSBjYWxsIHRv
IG1lbXNldCgpIGluCj4+IHJpc2N2X3Zkc29fZ2V0X2NwdXMoKSwgd2hpY2ggZ2VuZXJhdGVzIGEg
ZHluYW1pYyByZWxvY2F0aW9uLgo+Pgo+PiBTbyBwcmV2ZW50IGdjYyBmcm9tIGRvaW5nIHRoYXQg
YnkgdXNpbmcgdGhlCj4+IC1mbm8tdHJlZS1sb29wLWRpc3RyaWJ1dGUtcGF0dGVybnMgb3B0aW9u
Lgo+Cj4gVGhpcyBvcHRpb24gZG9lc24ndCBleGlzdCBvbiBMTFZNIChhdCBsZWFzdCBvbiB3aGF0
ZXZlciB2ZXJzaW9uIEknbSAKPiB1c2luZyksIGFuZCBJJ20gbm90IGdldHRpbmcgYW55IG1lbXNl
dCgpcyBnZW5lcmF0ZWQgbG9jYWxseSBzbyBJJ20gbm90IAo+IHN1cmUgd2hhdCB0byBsb29rIGZv
ciBvdmVyIHRoZXJlLgo+CgpXaGVuIGNvbXBpbGluZyBhIHJ2MzJfZGVmY29uZmlnIChzdGlsbCBv
biA2LjEyKSwgSSBnZXQ6Cgp+L2xpbnV4JCByaXNjdjY0LXVua25vd24tZWxmLXJlYWRlbGYgLXIg
CmJ1aWxkX2RlZmNvbmZpZ19ydjMyL2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5zbwoKUmVs
b2NhdGlvbiBzZWN0aW9uICcucmVsYS5keW4nIGF0IG9mZnNldCAweDVhMCBjb250YWlucyAxIGVu
dHJ5OgogwqBPZmZzZXTCoMKgwqDCoCBJbmZvwqDCoMKgIFR5cGXCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIFN5bS5WYWx1ZcKgIFN5bS4gTmFtZSArIEFkZGVuZAowMDAwMDMxNMKgIDAwMDAwMjA1IFJf
UklTQ1ZfSlVNUF9TTE9UIDAwMDAwMDAwwqDCoCBtZW1zZXQgKyAwCgoKPiBGcm9tIHBva2luZyBh
cm91bmQgR0NDIGl0IGxvb2tzIGxpa2Ugd2UgbWlnaHQgd2FudCAtZm5vLXRyZWUtY2NwIHRvbz8g
Cj4gVGhhdCBzZWVtcyB0byBiZSBhYmxlIHRvIGNvbnZlcnQgYXNzaWdubWVudHMgaW50byBidWls
dGlucyBhcyB3ZWxsLi4uCgoKSSBnYXZlIGEgdHJ5IGF0IC1mbm8tdHJlZS1jY3AsIGJ1dCBpdCBk
aWQgbm90IHJlbW92ZSB0aGlzIHJlbG9jYXRpb24uCgpJIG5vdyBzZWUgdGhpcyByZWxvY2F0aW9u
IGluIGxsdm0gdG9vLCBzbyBpdCB3b3VsZCBiZSBuaWNlIHRvIGZpbmQgYSAKY29tbW9uIG9wdGlv
biBvciBhbm90aGVyIHdheSB0byBkbyBpdCwgYW55IGlkZWEgaXMgd2VsY29tZSEKClRoYW5rcywK
CkFsZXgKCgo+Cj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJp
dm9zaW5jLmNvbT4KPj4gLS0tCj4+IMKgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSB8
IDEgKwo+PiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Pgo+PiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9NYWtlZmlsZSAKPj4gYi9hcmNoL3Jpc2N2L2tlcm5l
bC92ZHNvL01ha2VmaWxlCj4+IGluZGV4IGY3ZWY4YWQ5YjU1MC4uYzdlNDBiZjM2MzcxIDEwMDY0
NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxlCj4+ICsrKyBiL2FyY2gv
cmlzY3Yva2VybmVsL3Zkc28vTWFrZWZpbGUKPj4gQEAgLTE4LDYgKzE4LDcgQEAgb2JqLXZkc28g
PSAkKHBhdHN1YnN0ICUsICUubywgJCh2ZHNvLXN5bXMpKSBub3RlLm8KPj4KPj4gwqBjY2ZsYWdz
LXkgOj0gLWZuby1zdGFjay1wcm90ZWN0b3IKPj4gwqBjY2ZsYWdzLXkgKz0gLURESVNBQkxFX0JS
QU5DSF9QUk9GSUxJTkcKPj4gK2NjZmxhZ3MteSArPSAtZm5vLXRyZWUtbG9vcC1kaXN0cmlidXRl
LXBhdHRlcm5zCj4+Cj4+IMKgaWZuZXEgKCQoYy1nZXR0aW1lb2ZkYXkteSksKQo+PiDCoMKgIENG
TEFHU192Z2V0dGltZW9mZGF5Lm8gKz0gLWZQSUMgLWluY2x1ZGUgJChjLWdldHRpbWVvZmRheS15
KQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBs
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
