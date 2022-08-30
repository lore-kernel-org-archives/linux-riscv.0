Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40980ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 16:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vCtLet7RinFwEMBwiIaqz+N2o1nVzNODjVTwAPV+ySA=; b=H2ASNj9XG+2fDbJj6A6OTLEkqq
	f1ExLl/eZ4zO04aDzfNQHMbHWn5LPdw7nTb1yS6d3Bk0HeTgboC7kQ62kuAaSqM81bI6ojbUpiO49
	WUJn1glUUOtv1Fq20bptkm/5hktAyUHexGiYo05WTOOP4soe7HLsbR2CcIU/hn2f4mLmV20ohkIir
	0ntvsKh1U1E9bZTRCscwJECPucIYM7ATOhXqxd50kUS2MFuRuymrxA1lF9n90xAcRI3FkGDB6buKz
	ZiYl0bws/jkWV5zwHAvMj1hwrGCwgyJuFnI6Yxd7r9+ZRpIAvTpMIJvmoxiOAg7JYpvLjaKDHzb2N
	bm5Aw2zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4R9-000cnE-9U; Tue, 30 Aug 2022 16:50:03 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT4R4-000cke-0B
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 16:50:01 +0000
Received: from [167.98.27.226] (helo=[10.35.5.6])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1oT4Qh-0069aK-2x; Tue, 30 Aug 2022 17:49:35 +0100
Message-ID: <c2f86a2a-a30e-5fac-de6c-6a28edc5bcee@codethink.co.uk>
Date: Tue, 30 Aug 2022 17:49:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [RESEND PATCH] dt-bindings: sifive-ccache: fix cache level for l3
 cache
To: Conor.Dooley@microchip.com, ben.dooks@sifive.com, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, greentime.hu@sifive.com,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 devicetree@vger.kernel.org
References: <20220829062202.3287-1-zong.li@sifive.com>
 <20220830125133.1698781-1-ben.dooks@sifive.com>
 <b810d354-18f3-9ae0-6310-57d9e36f4f9b@microchip.com>
 <6b6837c1-5a2c-567b-ba64-72a1dca38807@sifive.com>
 <8422fb34-fc05-eddd-0eaa-3e713896d05d@microchip.com>
Content-Language: en-GB
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <8422fb34-fc05-eddd-0eaa-3e713896d05d@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_094958_081393_8F1065FB 
X-CRM114-Status: GOOD (  28.23  )
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

T24gMzAvMDgvMjAyMiAxNDo0OSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4g
T24gMzAvMDgvMjAyMiAxMzo1OCwgQmVuIERvb2tzIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJTDog
RG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRo
ZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gT24gMzAvMDgvMjAyMiAxMzo1NiwgQ29ub3IuRG9vbGV5
QG1pY3JvY2hpcC5jb20gd3JvdGU6Cj4+PiBPbiAzMC8wOC8yMDIyIDEzOjUxLCBCZW4gRG9va3Mg
d3JvdGU6Cj4+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0
dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4+Pj4KPj4+PiBX
aXRoIG5ld2VyIGNvcmVzIHN1Y2ggYXMgdGhlIHA1NTAsIHRoZSBTaUZpdmUgY29tcG9zYWJsZSBj
YWNoZSBjYW4gYmUKPj4+PiBhIGxldmVsIDMgY2FjaGUuIFVwZGF0ZSB0aGUgY2FjaGUgbGV2ZWwg
dG8gYmUgb25lIG9mIDIgb3IgMy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEJlbiBEb29rcyA8
YmVuLmRvb2tzQHNpZml2ZS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgwqAgRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NpZml2ZS1jY2FjaGUueWFtbCB8IDIgKy0KPj4+PiAg
wqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Pgo+
Pj4+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
c2lmaXZlLWNjYWNoZS55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jp
c2N2L3NpZml2ZS1jY2FjaGUueWFtbAo+Pj4+IGluZGV4IDFhNjRhNTM4NGUzNi4uNjE5MGRlYjY1
NDU1IDEwMDY0NAo+Pj4+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9y
aXNjdi9zaWZpdmUtY2NhY2hlLnlhbWwKPj4+PiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcmlzY3Yvc2lmaXZlLWNjYWNoZS55YW1sCj4+Pj4gQEAgLTQ1LDcgKzQ1LDcg
QEAgcHJvcGVydGllczoKPj4+PiAgwqDCoMKgwqDCoMKgIGNvbnN0OiA2NAo+Pj4+Cj4+Pj4gIMKg
wqDCoMKgIGNhY2hlLWxldmVsOgo+Pj4+IC3CoMKgwqAgY29uc3Q6IDIKPj4+PiArwqDCoMKgIGVu
dW06IFsyLCAzXQo+Pj4KPj4+IERvIHdlIHdhbnQgdG8gZW5mb3JjZSB0aGUgY2FjaGUgbGV2ZWwg
bGlrZSB3ZSBjdXJyZW50bHkgZG8gZm9yCj4+PiBpbnRlcnJ1cHRzIGFuZCBjYWNoZS1zZXRzPwo+
Pgo+PiBOb3Qgc3VyZSBvbiB0aGF0LCBmb3IgdGhlIFA1NTAgY29yZXMgdGhlIGNjYWNoZSBpcyBn
b2luZyB0byBiZSBsZXZlbDMKPj4gYW5kIG15IGNvbGxlYWd1ZSBoYXMgc2FpZCBpdCBkb2VzIGNv
bmZ1c2Ugc29tZSB0b29saW5nIGlmIHRoZSBsZXZlbCBpcwo+PiBub3Qgc2V0IGNvcnJlY3RseS4K
PiAKPiBXaGF0IEkgbWVhbnQgd2FzOgo+IEN1cnJlbnRseSB3ZSBlbmZvcmNlIHRoZSBjb3JyZWN0
IGNhY2hlLXNldHMgJiBpbnRlcnJ1cHRzIGJhc2VkIG9uIHRoZQo+IGNvbXBhdGlibGUgc3RyaW5n
LiBBZGRpbmcgZW51bTogWzIsIDNdIHJlbGF4ZXMgdGhlIGVuZm9yY2VtZW50IG9mIHRoZQo+IGNh
Y2hlLWxldmVsIGZvciBleGlzdGluZyBjb21wYXRpYmxlcyBhbmQgZG9lcyBub3QgcHJldmVudCBz
b21lb25lIGZyb20KPiBzZXR0aW5nIGFuIGluY29ycmVjdCBjYWNoZSBsZXZlbCBmb3IgcDU1MCBj
b3Jlcy4KPiAKPiBJIHRoaW5rIHRoYXQgb24gdG9wIG9mIGFkZGluZyB0aGUgZW51bSwgd2Ugc2hv
dWxkIGFkZCBzb21lIGVuZm9yY2VtZW50Cj4gc28gdGhhdCB0aGUgY2FjaGUgaXMgbm90IGluY29y
cmVjdGx5IGNvbmZpZ3VyZWQgZm9yIGJvdGggZXhpc3RpbmcgbDIKPiBjYWNoZXMgYW5kIGZvciB0
aGUgbmV3IGwzIHZlcnNpb25zLgoKT2ssIHdlIGNhbiBhZGQgc29tZSBlbmZvcmNlbWVudCBvbmNl
IHdlIGFkZCB0aGUgbmV3IGJpbmRpbmdzLCBidXQgSSdtCm5vdCByZWFkeSBmb3IgdGhhdCB0b2Rh
eSBhbmQgSSdkIHJhdGhlciBnZXQgdGhlIGN1cnJlbnQgcXVldWUgc29ydGVkCm91dCBmaXJzdCBi
ZWZvcmUgd2UgY29tZSBpbiB3aXRoIG5ld2VyIHNpbGljb24gd2hpY2ggaGFzbid0IGhpdCB0aGUK
bWFya2V0IHVldC4KCj4gQFpvbmcsIGNvdWxkIHlvdSBwbGVhc2UgaW5jb3Jwb3JhdGUgQmVuJ3Mg
cGF0Y2hlcyBpbnRvIHlvdXIgVjI/IGl0Cj4gd291bGQgbWFrZSBpdCBhIGxvdCBlYXNpZXIgdG8g
cmV2aWV3IHdoYXQncyBnb2luZyBvbiBoZXJlLiBJdCBtYXkKPiBhbHNvIG1ha2Ugc2Vuc2UgdG8g
YWRkIHRoZSBjb21wYXRpYmxlIGZvciB0aGUgcDU1MCBjYWNoZSB3aGlsZSB3ZSBhcmUKPiBhdCBp
dC4uLgo+IAo+IEZZSSwgdGhlcmUgaXMgYWxzbyB0aGlzIHBhdGNoIGhlcmUgb3V0c3RhbmRpbmcg
YWdhaW5zdCB0aGUgbDI6Cj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAy
MjA4MjUxODA0MTcuMTI1OTM2MC0yLW1haWxAY29uY2h1b2QuaWUvCj4gCj4gSSBpbnRlbmQgdGFr
aW5nIHRoaXMgaW50byA2LjAtcmM1IG9yIHNvIGFzIGEgZml4LCBzbyBpZiB5b3UgY291bGQKPiBy
ZWJhc2UgdGhlIHNlcmllcyBvbiB0aGF0IHNvIGl0IGlzIG5vdCBsb3N0IGluIHRoZSBkdC1iaW5k
aW5nIHJlbmFtZQo+IHRoYXQgd291bGQgYmUgZ3JlYXQuCgpEbyB3ZSBuZWVkIHNvbWVvbmUgdG8g
dGFrZSBjaGFyZ2Ugb2YgdGhpcyBzZXJpZXM/CgotLSAKQmVuIERvb2tzCQkJCWh0dHA6Ly93d3cu
Y29kZXRoaW5rLmNvLnVrLwpTZW5pb3IgRW5naW5lZXIJCQkJQ29kZXRoaW5rIC0gUHJvdmlkaW5n
IEdlbml1cwoKaHR0cHM6Ly93d3cuY29kZXRoaW5rLmNvLnVrL3ByaXZhY3kuaHRtbAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
