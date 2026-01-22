Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D86D46952
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 12:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Date:Cc:Mime-Version:
	Subject:From:References:Message-Id:To:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iQSYhpJXWwA9FfD8BF/96IYZYJtagnbO2Kyz6u5yEbQ=; b=uWZWXs0/e1U+f9
	oeO9CNACbaLr0eP2XdQxlKIl0/IvU3Rnx/YJnuUp0rJnb+X8l9F6dfetnbETbXPFwy5OEjFaawv4r
	yuJfIwRu7sIUwZQigBhg6g0UcpTgjB2wT/oPLI1G4Kad6CJmk+1cje35x6NhUoM+YncI+0sNDV4Hj
	afcOHQ4ZMCepuMrufXJGgO7MLRR073zkeWlDG6I+Zjso1Dyt/fZBWY96fOLQlTtWDLFkNgQaLxo3T
	Q7WdyTEBqjKUdsa/501j1MDutuMFETKXjZUGVIm3UKktvsm1cUQuZLJPxPDCUEjEyMFgPFj4SpzAX
	aRpl9uHhMZZkS3C5lrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viu9B-000000075CB-38Ka;
	Thu, 22 Jan 2026 12:50:49 +0000
Received: from sg-1-39.ptr.blmpb.com ([118.26.132.39])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viu98-000000075BJ-1cLc
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 12:50:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=picoheart-com.20200927.dkim.feishu.cn; t=1769086238;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=XCB5+7JroB4zxoAicjLIi6G6FypkufPpVImZn1JnTBk=;
 b=nfD4qXXIQxs7mMk02wXZM5UG2s/3rcJd8rOrQbNm3UTEcbpIErvdf+QFHheMR1OetoZx5l
 qofXEtxZrpnRCAtt1Ki5u39Hpirz7bi6nTGp4FK9weG45soZOG58VEejVqlfmS1ntS2oNw
 hX6BHlVx/2QPSr5W5yPFVRJpUsf7fQA1zEs1E/kIDbvqehCBjnqWhq0ZEh+W2YPKTn7hTi
 HilFu6IW68wgGJLHSo+T/xlSYqlB7j5SxvPz/4wiYHdFi+1wrTgwpgwY12A5PFzienRDmQ
 n3F1a+t+ZbQaxivcErfba6RH4D2jdmausgJiHMmoNYGcnnz2pqqFJQh5GJGQUw==
To: "Rafael J. Wysocki" <rafael@kernel.org>
Message-Id: <7512bdfc-96ff-480a-a4e2-3b544f86d59d@picoheart.com>
References: <20260122073446.45628-1-yang.yicong@picoheart.com> <20260122073446.45628-2-yang.yicong@picoheart.com> <CAJZ5v0iwfk4hnj7Lf5hq3uo4p+_CT35ZwJUnenLOzOoGqQcsgw@mail.gmail.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: Re: [PATCH 1/2] ACPI: scan: Use async schedule function for acpi_scan_clear_dep_fn
Content-Language: en-US
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+269721d1c+5cb9d2+lists.infradead.org+yang.yicong@picoheart.com>
Cc: <yang.yicong@picoheart.com>, <lenb@kernel.org>, <tglx@kernel.org>, 
	<gregkh@linuxfoundation.org>, <dakr@kernel.org>, 
	<akpm@linux-foundation.org>, <apatel@ventanamicro.com>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, 
	<geshijian@picoheart.com>, <weidong.wd@picoheart.com>, 
	<linux-acpi@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	<linux-riscv@lists.infradead.org>
Date: Thu, 22 Jan 2026 20:50:33 +0800
User-Agent: Mozilla Thunderbird
Received: from [172.16.153.176] ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Thu, 22 Jan 2026 20:50:35 +0800
In-Reply-To: <CAJZ5v0iwfk4hnj7Lf5hq3uo4p+_CT35ZwJUnenLOzOoGqQcsgw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_045046_998507_92F1B6AD 
X-CRM114-Status: GOOD (  20.48  )
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

T24gMS8yMi8yNiA3OjE5IFBNLCBSYWZhZWwgSi4gV3lzb2NraSB3cm90ZToKPiBPbiBUaHUsIEph
biAyMiwgMjAyNiBhdCA4OjM14oCvQU0gWWljb25nIFlhbmcgPHlhbmcueWljb25nQHBpY29oZWFy
dC5jb20+IHdyb3RlOgo+Pgo+PiBUaGUgZGV2aWNlIG9iamVjdCByZXNjYW4gaW4gYWNwaV9zY2Fu
X2NsZWFyX2RlcF9mbiBpcyBzY2hlZHVsZWQKPj4gaW4gdGhlIHN5c3RlbSB3b3JrcXVldWUgd2hp
Y2ggaXMgbm90IGd1YXJhbnRlZWQgdG8gYmUgZmluaXNoZWQKPj4gYmVmb3JlIGVudGVyaW5nIHVz
ZXJzcGFjZS4gVGhpcyB3aWxsIGNhdXNlIHRoZSBwcm9ibGVtIHRoYXQKPj4gc29tZSBrZXkgZGV2
aWNlcyBhcmUgbWlzc2VkIHdoZW4gdGhlIGluaXQgdGFzayB0cnkgdG8gZmluZCB0aGVtLAo+PiBl
LmcuIGNvbnNvbGUgZGV2aWNlcyBhbmQgcm9vdCBkZXZpY2VzIChQQ0llIG52bWUsIGV0YykuCj4+
IFRoaXMgaXNzdWVzIGlzIG1vcmUgcG9zc2JpbGUgdG8gaGFwcGVuIG9uIFJJU0NWIHNpbmNlIHRo
ZXNlCj4+IGRldmljZXMgdXNpbmcgR1NJIGludGVycnVwdCBtYXkgZGVwZW5kIG9uIEFQTElDIGFu
ZCB3aWxsIGJlCj4+IHNjYW5uZWQgaW4gYWNwaV9zY2FuX2NsZWFyX2RlcF9xdWV1ZSgpIGFmdGVy
IEFQTElDIGluaXRpYWxpemVkLgo+Pgo+PiBGaXggdGhpcyBieSBzY2hlZHVsaW5nIHRoZSBhY3Bp
X3NjYW5fY2xlYXJfZGVwX3F1ZXVlKCkgdXNpbmcgYXN5bmMKPj4gc2NoZWR1bGUgZnVuY3Rpb24g
cmF0aGVyIHRoYW4gdGhlIHN5c3RlbSB3b3JrcXVldWUuIFRoZSBkZWZlcnJlZAo+PiB3b3JrcyB3
aWxsIGJlIHN5bmNocm9uaXplZCBieSBhc3luY19zeW5jaHJvbml6ZV9mdWxsKCkgYmVmb3JlCj4+
IGVudGVyaW5nIGluaXQgdGFzay4KPj4KPj4gVXBkYXRlIHRoZSBjb21tZW50IGFzIHdlbGwuCj4+
Cj4+IFNpZ25lZC1vZmYtYnk6IFlpY29uZyBZYW5nIDx5YW5nLnlpY29uZ0BwaWNvaGVhcnQuY29t
Pgo+PiAtLS0KPj4gIGRyaXZlcnMvYWNwaS9zY2FuLmMgfCAzNSArKysrKysrKysrKysrKysrLS0t
LS0tLS0tLS0tLS0tLS0tLQo+PiAgMSBmaWxlIGNoYW5nZWQsIDE2IGluc2VydGlvbnMoKyksIDE5
IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9hY3BpL3NjYW4uYyBiL2Ry
aXZlcnMvYWNwaS9zY2FuLmMKPj4gaW5kZXggNDE2ZDg3ZjliZDEwLi5iZjBkOGJhOWJhMTkgMTAw
NjQ0Cj4+IC0tLSBhL2RyaXZlcnMvYWNwaS9zY2FuLmMKPj4gKysrIGIvZHJpdmVycy9hY3BpL3Nj
YW4uYwo+PiBAQCAtNSw2ICs1LDcgQEAKPj4KPj4gICNkZWZpbmUgcHJfZm10KGZtdCkgIkFDUEk6
ICIgZm10Cj4+Cj4+ICsjaW5jbHVkZSA8bGludXgvYXN5bmMuaD4KPj4gICNpbmNsdWRlIDxsaW51
eC9tb2R1bGUuaD4KPj4gICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4+ICAjaW5jbHVkZSA8bGlu
dXgvc2xhYi5oPgo+PiBAQCAtMjM2NSwzOSArMjM2NiwzNSBAQCBzdHJ1Y3QgYWNwaV9zY2FuX2Ns
ZWFyX2RlcF93b3JrIHsKPj4gICAgICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXY7Cj4+ICB9
Owo+Pgo+PiAtc3RhdGljIHZvaWQgYWNwaV9zY2FuX2NsZWFyX2RlcF9mbihzdHJ1Y3Qgd29ya19z
dHJ1Y3QgKndvcmspCj4+ICtzdGF0aWMgdm9pZCBhY3BpX3NjYW5fY2xlYXJfZGVwX2ZuKHZvaWQg
KmRldiwgYXN5bmNfY29va2llX3QgY29va2llKQo+PiAgewo+PiAtICAgICAgIHN0cnVjdCBhY3Bp
X3NjYW5fY2xlYXJfZGVwX3dvcmsgKmNkdzsKPj4gLQo+PiAtICAgICAgIGNkdyA9IGNvbnRhaW5l
cl9vZih3b3JrLCBzdHJ1Y3QgYWNwaV9zY2FuX2NsZWFyX2RlcF93b3JrLCB3b3JrKTsKPj4gKyAg
ICAgICBzdHJ1Y3QgYWNwaV9kZXZpY2UgKmFkZXYgPSB0b19hY3BpX2RldmljZShkZXYpOwo+Pgo+
PiAgICAgICAgIGFjcGlfc2Nhbl9sb2NrX2FjcXVpcmUoKTsKPj4gLSAgICAgICBhY3BpX2J1c19h
dHRhY2goY2R3LT5hZGV2LCAodm9pZCAqKXRydWUpOwo+PiArICAgICAgIGFjcGlfYnVzX2F0dGFj
aChhZGV2LCAodm9pZCAqKXRydWUpOwo+PiAgICAgICAgIGFjcGlfc2Nhbl9sb2NrX3JlbGVhc2Uo
KTsKPj4KPj4gLSAgICAgICBhY3BpX2Rldl9wdXQoY2R3LT5hZGV2KTsKPj4gLSAgICAgICBrZnJl
ZShjZHcpOwo+PiArICAgICAgIGFjcGlfZGV2X3B1dChhZGV2KTsKPj4gIH0KPj4KPj4gIHN0YXRp
YyBib29sIGFjcGlfc2Nhbl9jbGVhcl9kZXBfcXVldWUoc3RydWN0IGFjcGlfZGV2aWNlICphZGV2
KQo+PiAgewo+PiAtICAgICAgIHN0cnVjdCBhY3BpX3NjYW5fY2xlYXJfZGVwX3dvcmsgKmNkdzsK
Pj4gLQo+PiAgICAgICAgIGlmIChhZGV2LT5kZXBfdW5tZXQpCj4+ICAgICAgICAgICAgICAgICBy
ZXR1cm4gZmFsc2U7Cj4+Cj4+IC0gICAgICAgY2R3ID0ga21hbGxvYyhzaXplb2YoKmNkdyksIEdG
UF9LRVJORUwpOwo+PiAtICAgICAgIGlmICghY2R3KQo+PiAtICAgICAgICAgICAgICAgcmV0dXJu
IGZhbHNlOwo+PiAtCj4+IC0gICAgICAgY2R3LT5hZGV2ID0gYWRldjsKPj4gLSAgICAgICBJTklU
X1dPUksoJmNkdy0+d29yaywgYWNwaV9zY2FuX2NsZWFyX2RlcF9mbik7Cj4+ICAgICAgICAgLyoK
Pj4gLSAgICAgICAgKiBTaW5jZSB0aGUgd29yayBmdW5jdGlvbiBtYXkgYmxvY2sgb24gdGhlIGxv
Y2sgdW50aWwgdGhlIGVudGlyZQo+PiAtICAgICAgICAqIGluaXRpYWwgZW51bWVyYXRpb24gb2Yg
ZGV2aWNlcyBpcyBjb21wbGV0ZSwgcHV0IGl0IGludG8gdGhlIHVuYm91bmQKPj4gLSAgICAgICAg
KiB3b3JrcXVldWUuCj4+ICsgICAgICAgICogQXN5bmMgc2NoZWR1bGUgdGhlIGRlZmVycmVkIGFj
cGlfc2Nhbl9jbGVhcl9kZXBfZm4oKSBzaW5jZToKPj4gKyAgICAgICAgKiAtIGFjcGlfYnVzX2F0
dGFjaCgpIG5lZWRzIHRvIGhvbGQgYWNwaV9zY2FuX2xvY2sgd2hpY2ggY2Fubm90Cj4+ICsgICAg
ICAgICogICBiZSBhY3F1aXJlZCB1bmRlciBhY3BpX2RlcF9saXN0X2xvY2sgKGhlbGQgaGVyZSkK
Pj4gKyAgICAgICAgKiAtIHRoZSBkZWZlcnJlZCB3b3JrIGF0IGJvb3Qgc3RhZ2UgaXMgZW5zdXJl
ZCB0byBiZSBmaW5pc2hlZAo+PiArICAgICAgICAqICAgYmVmb3JlIGVudGVyaW5nIGluaXQgdGFz
ayBieSB0aGUgYXN5bmNfc3luY2hyb25pemVfZnVsbCgpCj4+ICsgICAgICAgICogICBiYXJyaWVy
Cj4+ICsgICAgICAgICoKPj4gKyAgICAgICAgKiBVc2UgX25vY2FsbCB2YXJpYW50IHNpbmNlIGl0
J2xsIHJldHVybiBvbiBmYWlsdXJlIGluc3RlYWQgb2YKPj4gKyAgICAgICAgKiBydW4gdGhlIGZ1
bmN0aW9uIHN5bmNocm9ub3VzbHkuCj4+ICAgICAgICAgICovCj4+IC0gICAgICAgcXVldWVfd29y
ayhzeXN0ZW1fZGZsX3dxLCAmY2R3LT53b3JrKTsKPj4gKyAgICAgICBpZiAoIWFzeW5jX3NjaGVk
dWxlX2Rldl9ub2NhbGwoYWNwaV9zY2FuX2NsZWFyX2RlcF9mbiwgJmFkZXYtPmRldikpCj4gCj4g
SWYgdGhlIHByb2JsZW0gaXMgdGhhdCBzeXN0ZW1fZGZsX3dxIGlzIHRvbyBzbG93LCB3aHkgZG9u
J3QgeW91IGp1c3QKPiB0cnkgYSBkZWRpY2F0ZWQgd29ya3F1ZXVlIGZvciB0aGlzPwo+IAo+IFRo
ZXJlJ3Mgbm8gbmVlZCB0byBtb2RpZnkgYWxsIG9mIHRoaXMgY29kZS4KPiAKClRoZSBwcm9ibGVt
IGlzIHRoYXQgdGhlc2Ugd29ya3MgYXJlIG5vdCBmaW5pc2hlZCBiZWZvcmUgZW50ZXJpbmcgdXNl
cnNwYWNlLApzbyBzb21lIGtleSBkZXZpY2VzIGxpa2UgY29uc29sZSBvciBQQ0llIG52bWUgKGZv
ciByb290IGRldmljZSkgaXMgbm90IHJlYWR5CmluIHRpbWUgdXNlcnNwYWNlIGluaXQgcnVubmlu
Zy4KCklmIHdlIHVzZSBhIGRlZGljYXRlZCB3b3JrcXVldWUgd2Ugc3RpbGwgbmVlZCB0byBkbyB0
aGUgc3luY2hyb25pemF0aW9uCnNvbWV3aGVyZSBiZWZvcmUgZW50ZXJpbmcgdGhlIHVzZXJzcGFj
ZSB0byBzb2x2ZSB0aGUgcHJvYmxlbS4gQnV0IHRoYXQncyBqdXN0CndoYXQgYXN5bmNfc2NoZWR1
bGUqIGRvZXM6IHF1ZXVlIHRoZSBmdW5jdGlvbiBpbiBhc3luY193cSAoYWxzbyBhbiB1bmJvdW5k
IG9uZSkKYW5kIHdhaXQgZmluaXNoIGJlZm9yZSBleGVjdXRlIGluaXQgcHJvY2VzcyBieSBhc3lu
Y19zeW5jaHJvbml6ZV9mdWxsKCkuIERvZXMKaXQgbWFrZSBzZW5zZT8KClRoYW5rcy4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
