Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EEE1E6F095
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 15:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YyXWSBqTzvL/FnAbLkS7Eose4kC1/ZAATdRsso6Cbmw=; b=e88nD02JqAzD88
	6QV2bWdgo9yMTycbLn3jErz/XI3F9ltYKxP+H5hhu4VHOpSC3/HGlMwLln8e0XNu95h+cdAQ2M74x
	C1pywGgZifWLs6v4KUU/+04jxhgn87Kku/h7MDHP5J+1OtU5PbgXgeyZq+P+Nw6+RSkPg2GlCzMSh
	0wvxd3N3PPUVHbrMJcdMR87mLEISmpV/KEgSap4xq8Vy99zoWSPfc6ihxPgM2pkDsJ25IVyrQXE0Z
	iVedIGGZ4/sGlT0A9+gl1dUSuLNP9/35WAffvE7UXdEpXhoBj8R2ebkiJJiLixXe4+TYmAPmoXEl1
	GaNjeCKZjcvEVyqlW1+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Mr-0000000FhkA-1w96;
	Tue, 23 Dec 2025 15:32:09 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY4Mo-0000000Fhiq-0kYk
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 15:32:07 +0000
Received: from [192.168.0.114] (unknown [114.241.82.59])
	by APP-03 (Coremail) with SMTP id rQCowABnhdzstUppR2S4AQ--.711S2;
	Tue, 23 Dec 2025 23:31:57 +0800 (CST)
Message-ID: <5ea0ff13-04b3-4b2a-80e2-4f87146d00d5@iscas.ac.cn>
Date: Tue, 23 Dec 2025 23:31:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon: bypass no_64bit_msi with new msi64 parameter
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Arnd Bergmann <arnd@arndb.de>, Han Gao <gaohan@iscas.ac.cn>,
 Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
 sophgo@lists.linux.dev
References: <20251220163338.3852399-1-gaohan@iscas.ac.cn>
 <e86b823f-5e83-4105-8e4d-1db141d088a4@app.fastmail.com>
 <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <2ab9f73d-ef7b-40b3-b2bb-650f83ac236f@amd.com>
X-CM-TRANSID: rQCowABnhdzstUppR2S4AQ--.711S2
X-Coremail-Antispam: 1UD129KBjvJXoW7CF1ftFyUZF18KFWDCw1UAwb_yoW8urWkpa
	y5CFWagrn7tr47K39rZa1xXF1fZw4IgayrXFn0kryfC3y5Ar17KFW7Ar4ak3W8Xr1vkr4I
	v34Ig34xuFn0yFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07betCcUUUUU=
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_073206_587192_BCA3F3F7 
X-CRM114-Status: GOOD (  14.15  )
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

SGkgQ2hyaXN0aWFuLAoKSSBoYXZlIGEgcXVlc3Rpb24gYWJvdXQgdGhpcyA0MC1iaXQgcmVzdHJp
Y3Rpb24uCgpPbiAxMi8yMy8yNSAyMjo1NSwgQ2hyaXN0aWFuIEvDtm5pZyB3cm90ZToKPiBPbiAx
Mi8yMi8yNSAyMjozMiwgQXJuZCBCZXJnbWFubiB3cm90ZToKPj4gT24gU2F0LCBEZWMgMjAsIDIw
MjUsIGF0IDE3OjMzLCBIYW4gR2FvIHdyb3RlOgo+PiBbLi4uXQo+Pj4gZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2lycV9rbXMuYyAKPj4+IGIvZHJpdmVycy9ncHUv
ZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5jCj4+PiBpbmRleCA5OTYxMjUxYjQ0YmEuLjYyZWI1
YTY5NjhmZiAxMDA2NDQKPj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2ly
cV9rbXMuYwo+Pj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25faXJxX2ttcy5j
Cj4+PiBAQCAtMjUwLDcgKzI1MCw3IEBAIHN0YXRpYyBib29sIHJhZGVvbl9tc2lfb2soc3RydWN0
IHJhZGVvbl9kZXZpY2UgCj4+PiAqcmRldikKPj4+ICAJICogb2YgYWRkcmVzcyBmb3IgIjY0LWJp
dCIgTVNJcyB3aGljaCBicmVha3Mgb24gc29tZSBwbGF0Zm9ybXMsIAo+Pj4gbm90YWJseQo+Pj4g
IAkgKiBJQk0gUE9XRVIgc2VydmVycywgc28gd2UgbGltaXQgdGhlbQo+Pj4gIAkgKi8KPj4+IC0J
aWYgKHJkZXYtPmZhbWlseSA8IENISVBfQk9OQUlSRSkgewo+Pj4gKwlpZiAocmRldi0+ZmFtaWx5
IDwgQ0hJUF9CT05BSVJFICYmICFyYWRlb25fbXNpNjQpIHsKPj4+ICAJCWRldl9pbmZvKHJkZXYt
PmRldiwgInJhZGVvbjogTVNJIGxpbWl0ZWQgdG8gMzItYml0XG4iKTsKPj4+ICAJCXJkZXYtPnBk
ZXYtPm5vXzY0Yml0X21zaSA9IDE7Cj4+IEFjY29yZGluZyB0byB0aGUgY29tbWVudCBhYm92ZSBp
dCwgdGhlIGRldmljZSBjYW4gYXBwYXJlbnRseQo+PiBkbyA0MC1iaXQgYWRkcmVzc2luZyBidXQg
bm90IHVzZSB0aGUgZW50aXJlIDY0LWJpdCBzcGFjZS4KPj4KPj4gSSBhc3N1bWUgdGhlIFNHMjA0
MiBjaGlwIGhhcyB0aGUgaXJxY2hpcCBzb21ld2hlcmUgYWJvdmUgdGhlCj4+IDMyLWJpdCBsaW5l
IGJ1dCBiZWxvdyB0aGUgNDAtYml0IGxpbmUsIHNvIGl0IGVuZHMgdXAgd29ya2luZy4KPj4KPj4g
SSB3b25kZXIgaWYgdGhlIG1zaV92ZXJpZnlfZW50cmllcygpIGZ1bmN0aW9uIHNob3VsZCBjaGVj
awo+PiBhZ2FpbnN0IGRldi0+Y29oZXJlbnRfZG1hX21hc2sgaW5zdGVhZCBvZiBjaGVja2luZyB0
aGUKPj4gdXBwZXIgMzIgYml0cyBmb3IgYmVpbmcgbm9uemVybywgdGhhdCBwcm9iYWJseSBnaXZl
cyB5b3UKPj4gdGhlIGRlc2lyZWQgYmVoYXZpb3IuCj4gQWdhaW4gY29tcGxldGVseSBhZ3JlZSwg
dGhhdCBzb3VuZHMgbGlrZSBhIHBsYW4gdG8gbWUuCj4KPiBJSVJDIHRoZSBtb2RpZmllZCBjb2Rl
IGhlcmUgaXMgYmFzaWNhbGx5IGp1c3QgYSB3b3JrYXJvdW5kIGJlY2F1c2UgdGhlIE1TSSBjb250
cm9sIGR3b3JkIG9uIG9sZGVyIHJhZGVvbiBIVyB3YXMgbm90IHNldHVwIGNvcnJlY3RseS4KCkRv
ZXMgdGhpcyBtZWFuIHRoYXQgb24gQm9uYWlyZSBhbmQgb253YXJkcywgTVNJIGNhbiByZWFjaCBm
dWxsIDY0LWJpdApzcGFjZSwgd2hpbGUgRE1BIHN0aWxsIG9ubHkgZG9lcyA0MC1iaXQ/Cihkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9kZXZpY2UuYyBzZXRzIERNQSBtYXNrIHRvIGF0IG1v
c3QgNDAgYml0cy4pCgpJZiBzbywgY2hlY2tpbmcgY29oZXJlbnRfZG1hX21hc2sgd291bGQgYmUg
d3JvbmcgZm9yIHRob3NlIGRldmljZXMuCgpEbyB5b3UgdGhpbmsgbWF5YmUgaXQgd291bGQgYmUg
c2FmZXIgdG8gaW50cm9kdWNlIGEgbXNpX2FkZHJfbWFzayBmb3IKb2NjYXNpb25zIGxpa2UgdGhl
c2U/IFdlIGNhbiBoYXZlIG1zaV9hZGRyX21hc2sgPSBETUFfQklUX01BU0soNDApIGZvcgpwcmUt
Qm9uYWlyZSwgYW5kIHRoZW4gdGhlIHBwYyBQQ0kgc3R1ZmYgY2FuIGNoZWNrIHRoZSBtYXNrIGFu
ZCBzZWUgaWYKaXQncyB1c2FibGUuIFByb2JhYmx5IHNvbWV0aGluZyBzaW1pbGFyIGZvciBoZGEu
CgpWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
