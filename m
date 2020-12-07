Return-Path: <SRS0=7obj=FL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1349AC4361B
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 03:13:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEA1B22CA0
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Dec 2020 03:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEA1B22CA0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YS+Y2isSahCvLHSZFq3QXDrEA3bQ8oBV8D24TnPZ/UM=; b=uIYWzPsxjf0MOgfYtwaGX3UYT
	ySV2bI0xNKOdBn5+B4J0hQk5vzmTTjjLRDA71WXl/w5xALTiseJ8LWq03jJ0DHAHD8qumxALyGROT
	jCK2Nr5S4GQ8dJegV5EjozPNsQIEUlVd7CkyLEW0UVbysEYZHFtmvxnVLWod8TRNGgDBURDnJrgh3
	nr9LcSEdtRbvc25Wi+nYmSbhz4bNtwODprPXPZtCOJ+2BZHcJ2+puXfH+zNVsRgOXkHhYt1ffoyyq
	ysdkJRZg84rtZgKOssROZml0etpiz1w25/20433vf3R6q4Vr9AwAUtZvt3Fpm9dYAmH3BkRIla27V
	XtmVDvBfg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1km6xm-0004M9-Dt; Mon, 07 Dec 2020 03:13:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1km6xi-0004LN-Lb
 for linux-riscv@lists.infradead.org; Mon, 07 Dec 2020 03:13:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607310792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Tyqx0n2wiRk01BnAx7gZU3drnJqHx5Dd1+WachDCKXM=;
 b=BBG5o+0mkDitzpOkBu9ugRmjl0/6G76n8Vmz/a/ujZWiJfCqbBRM7OTuzZOjkmxSDdXhyT
 pkVTWMlpO/aaWLPLaMQuToKerskA3hBVzhDhsleGWK6s6xzXf7q6Ql7R9Lscjvc40BMD5F
 DxTroacZxHJfdG/giJ33Cc+/AHDbL54=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-RAZE5x0oNVqj6l6BR1IHaQ-1; Sun, 06 Dec 2020 22:13:05 -0500
X-MC-Unique: RAZE5x0oNVqj6l6BR1IHaQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 316AB858183;
 Mon,  7 Dec 2020 03:13:03 +0000 (UTC)
Received: from [10.72.13.171] (ovpn-13-171.pek2.redhat.com [10.72.13.171])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B38E91002382;
 Mon,  7 Dec 2020 03:12:51 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] drivers: gpio: add virtio-gpio guest driver
To: "Michael S. Tsirkin" <mst@redhat.com>,
 "Enrico Weigelt, metux IT consult" <lkml@metux.net>
References: <20201203191135.21576-1-info@metux.net>
 <20201203191135.21576-2-info@metux.net>
 <8209ce55-a4aa-f256-b9b9-f7eb3cac877b@redhat.com>
 <96aca1e6-2d5a-deb1-2444-88f938c7a9de@metux.net>
 <20201205142218-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <842519cc-94ca-3c11-ddd6-543e5a89c998@redhat.com>
Date: Mon, 7 Dec 2020 11:12:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201205142218-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201206_221318_759920_F8BBB099 
X-CRM114-Status: GOOD (  27.90  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: stefanha@redhat.com, linux-doc@vger.kernel.org, linus.walleij@linaro.org,
 corbet@lwn.net, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, bgolaszewski@baylibre.com,
 linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, msuchanek@suse.de,
 "Enrico Weigelt, metux IT consult" <info@metux.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDIwMjAvMTIvNiDkuIrljYgzOjMyLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
U2F0LCBEZWMgMDUsIDIwMjAgYXQgMDg6NTk6NTVBTSArMDEwMCwgRW5yaWNvIFdlaWdlbHQsIG1l
dHV4IElUIGNvbnN1bHQgd3JvdGU6Cj4+IE9uIDA0LjEyLjIwIDA0OjM1LCBKYXNvbiBXYW5nIHdy
b3RlOgo+Pgo+Pj4+IC0tLSBhL2RyaXZlcnMvZ3Bpby9LY29uZmlnCj4+Pj4gKysrIGIvZHJpdmVy
cy9ncGlvL0tjb25maWcKPj4+PiBAQCAtMTYxNSw2ICsxNjE1LDE1IEBAIGNvbmZpZyBHUElPX01P
Q0tVUAo+Pj4+IMOCwqDDgsKgw4LCoMOCwqDDgsKgw4LCoMOCwqAgdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvZ3Bpby9ncGlvLW1vY2t1cC5zaC4gUmVmZXJlbmNlIHRoZQo+Pj4+IHVzYWdlIGluCj4+
Pj4gw4LCoMOCwqDDgsKgw4LCoMOCwqDDgsKgw4LCoCBpdC4KPj4+PiDDgsKgICtjb25maWcgR1BJ
T19WSVJUSU8KPj4+PiArw4LCoMOCwqDDgsKgIHRyaXN0YXRlICJWaXJ0SU8gR1BJTyBzdXBwb3J0
Igo+Pj4+ICvDgsKgw4LCoMOCwqAgZGVwZW5kcyBvbiBWSVJUSU8KPj4+Cj4+PiBMZXQncyB1c2Ug
c2VsZWN0LCBzaW5jZSB0aGVyZSdzIG5vIHByb21wdCBmb3IgVklSVElPIGFuZCBpdCBkb2Vzbid0
IGhhdmUKPj4+IGFueSBkZXBlbmRlbmNpZXMuCj4+IHdob29wcywgaXQncyBub3QgdGhhdCBzaW1w
bGU6Cj4+Cj4+IG1ha2U6IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvbmVrcmFkL3NyYy9hcHUy
LWRldi9wa2cva2VybmVsLmFwdTIuZ2l0Jwo+PiBtYWtlWzFdOiBFbnRlcmluZyBkaXJlY3RvcnkK
Pj4gJy9ob21lL25la3JhZC9zcmMvZGsvRGlzdHJvS2l0L3BsYXRmb3JtLXg4Nl82NC9idWlsZC10
YXJnZXQvbGludXgtNS44LjktYnVpbGQnCj4+ICAgIEdFTiAgICAgTWFrZWZpbGUKPj4gZHJpdmVy
cy9ncHUvZHJtL0tjb25maWc6NzQ6ZXJyb3I6IHJlY3Vyc2l2ZSBkZXBlbmRlbmN5IGRldGVjdGVk
IQo+PiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZzo3NDoJc3ltYm9sIERSTV9LTVNfSEVMUEVSIGlz
IHNlbGVjdGVkIGJ5Cj4+IERSTV9WSVJUSU9fR1BVCj4+IGRyaXZlcnMvZ3B1L2RybS92aXJ0aW8v
S2NvbmZpZzoyOglzeW1ib2wgRFJNX1ZJUlRJT19HUFUgZGVwZW5kcyBvbiBWSVJUSU8KPj4gZHJp
dmVycy92aXJ0aW8vS2NvbmZpZzoyOglzeW1ib2wgVklSVElPIGlzIHNlbGVjdGVkIGJ5IEdQSU9f
VklSVElPCj4+IGRyaXZlcnMvZ3Bpby9LY29uZmlnOjE2MTg6CXN5bWJvbCBHUElPX1ZJUlRJTyBk
ZXBlbmRzIG9uIEdQSU9MSUIKPj4gZHJpdmVycy9ncGlvL0tjb25maWc6MTQ6CXN5bWJvbCBHUElP
TElCIGlzIHNlbGVjdGVkIGJ5IEkyQ19NVVhfTFRDNDMwNgo+PiBkcml2ZXJzL2kyYy9tdXhlcy9L
Y29uZmlnOjQ3OglzeW1ib2wgSTJDX01VWF9MVEM0MzA2IGRlcGVuZHMgb24gSTJDCj4+IGRyaXZl
cnMvaTJjL0tjb25maWc6ODoJc3ltYm9sIEkyQyBpcyBzZWxlY3RlZCBieSBGQl9EREMKPj4gZHJp
dmVycy92aWRlby9mYmRldi9LY29uZmlnOjYzOglzeW1ib2wgRkJfRERDIGRlcGVuZHMgb24gRkIK
Pj4gZHJpdmVycy92aWRlby9mYmRldi9LY29uZmlnOjEyOglzeW1ib2wgRkIgaXMgc2VsZWN0ZWQg
YnkgRFJNX0tNU19GQl9IRUxQRVIKPj4gZHJpdmVycy9ncHUvZHJtL0tjb25maWc6ODA6CXN5bWJv
bCBEUk1fS01TX0ZCX0hFTFBFUiBkZXBlbmRzIG9uCj4+IERSTV9LTVNfSEVMUEVSCj4+Cj4+IFNl
ZW1zIHRoYXQgd2UgY2FuIG9ubHkgZGVwZW5kIG9uIG9yIHNlbGVjdCBzb21lIHN5bWJvbCAtIHdl
IHJ1biBpbnRvCj4+IGh1Z2UgdHJvdWJsZSBpZiB0aGF0cyBtaXhlZC4gSnVzdCBjaGFuZ2VkIERS
TV9WSVJUSU9fR1BVIHRvIGp1c3Qgc2VsZWN0Cj4+IFZJUklPIGluc3RlYWQgb2YgZGVwZW5kaW5n
IG9uIGl0LCBhbmQgbm93IGl0IHdvcmtzLgo+Pgo+PiBJJ3ZlIHBvc3RlZCBhbm90aGVyIHBhdGNo
IGZvciBmaXhpbmcgZHJpdmVycy9ncHUvZHJtL3ZpcnRpby9LY29uZmlnCj4+IHRvIHVzZSAnc2Vs
ZWN0JyBpbnN0ZWFkIG9mICdkZXBlbmRzIG9uJy4KPiBJdCBzZWVtcyBhIGJpdCBvZiBhIG1lc3Ms
IGF0IHRoaXMgcG9pbnQgSSdtIG5vdCBlbnRpcmVseSBzdXJlIHdoZW4KPiBzaG91bGQgZHJpdmVy
cyBzZWxlY3QgVklSVElPIGFuZCB3aGVuIGRlcGVuZCBvbiBpdC4KPgo+IFRoZSB0ZXh0IG5lYXIg
aXQgc2F5czoKPgo+ICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQo+IGNv
bmZpZyBWSVJUSU8KPiAgICAgICAgICB0cmlzdGF0ZQo+ICAgICAgICAgIGhlbHAKPiAgICAgICAg
ICAgIFRoaXMgb3B0aW9uIGlzIHNlbGVjdGVkIGJ5IGFueSBkcml2ZXIgd2hpY2ggaW1wbGVtZW50
cyB0aGUgdmlydGlvCj4gICAgICAgICAgICBidXMsIHN1Y2ggYXMgQ09ORklHX1ZJUlRJT19QQ0ks
IENPTkZJR19WSVJUSU9fTU1JTywgQ09ORklHX1JQTVNHCj4gICAgICAgICAgICBvciBDT05GSUdf
UzM5MF9HVUVTVC4KPgo+IFdoaWNoIHNlZW1zIGNsZWFyIGVub3VnaCBhbmQgd291bGQgaW5kaWNh
dGUgZHJpdmVycyBmb3IgZGV2aWNlcyAqYmVoaW5kKgo+IHRoZSBidXMgc2hvdWxkIG5vdCBzZWxl
Y3QgVklSVElPIGFuZCB0aHVzIHByZXN1bWFibHkgc2hvdWxkICJkZXBlbmQgb24iIGl0Lgo+IFRo
aXMgaXMgdmlvbGF0ZWQgaW4gdmlydGlvIGNvbnNvbGUgYW5kIHZpcnRpbyBmcyBkcml2ZXJzLgo+
Cj4gRm9yIGNvbnNvbGUgaXQgc2F5czoKPgo+IGNvbW1pdCA5ZjMwZWIyOWM1MTQ1ODllMTZmMjk5
OWVhMDcwNTk4NTgzZDFmNmVjCj4gQXV0aG9yOiBNaWNoYWwgU3VjaGFuZWsgPG1zdWNoYW5la0Bz
dXNlLmRlPgo+IERhdGU6ICAgTW9uIEF1ZyAzMSAxODo1ODo1MCAyMDIwICswMjAwCj4KPiAgICAg
IGNoYXI6IHZpcnRpbzogU2VsZWN0IFZJUlRJTyBmcm9tIFZJUlRJT19DT05TT0xFLgo+ICAgICAg
Cj4gICAgICBNYWtlIGl0IHBvc3NpYmxlIHRvIGhhdmUgdmlydGlvIGNvbnNvbGUgYnVpbHQtaW4g
d2hlbgo+ICAgICAgb3RoZXIgdmlydGlvIGRyaXZlcnMgYXJlIG1vZHVsYXIuCj4gICAgICAKPiAg
ICAgIFNpZ25lZC1vZmYtYnk6IE1pY2hhbCBTdWNoYW5layA8bXN1Y2hhbmVrQHN1c2UuZGU+Cj4g
ICAgICBSZXZpZXdlZC1ieTogQW1pdCBTaGFoIDxhbWl0QGtlcm5lbC5vcmc+Cj4gICAgICBMaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjAwODMxMTY1ODUwLjI2MTYzLTEtbXN1Y2hh
bmVrQHN1c2UuZGUKPiAgICAgIFNpZ25lZC1vZmYtYnk6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3Jl
Z2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+Cj4KPiB3aGljaCBzZWVtcyBraW5kIG9mIGJvZ3VzIC0g
d2h5IGRvIHdlIGNhcmUgYWJvdXQgYWxsb3dpbmcgYSBidWlsdGluCj4gdmlydGlvIGNvbnNvbGUg
ZHJpdmVyIGlmIHRoZSBwY2kgdmlydGlvIGJ1cyBkcml2ZXIgaXMgYSBtb2R1bGU/Cj4gVGhlcmUg
d29uJ3QgYmUgYW55IGRldmljZXMgb24gdGhlIGJ1cyB0byBhdHRhY2ggdG8gLi4uCgoKRm9yIHRl
c3RpbmcgbGlrZSBzd2l0Y2hpbmcgYnVzIGZyb20gcGNpIHRvIE1NSU8/CgoKPiBBbmQgZm9yIHZp
cnRpbyBmcyBpdCB3YXMgbGlrZSB0aGlzIGZyb20gdGhlIGJlZ2lubmluZy4KPgo+IEkgYW0gaW5j
bGluZWQgdG8gZml4IGNvbnNvbGUgYW5kIHZpcnRpbyBmcyB0byBkZXBlbmQgb24gVklSVElPOgo+
IHNlbGVjdCBpcyBoYXJkZXIgdG8gdXNlIGNvcnJlY3RseSAuLi4KPgo+IEphc29uPwoKCkkgdGhp
bmsgaXQgd29ya3MsIGJ1dCB3ZSBuZWVkIGEgcHJvbXB0IGZvciBWSVJUSU8gb3RoZXJ3aXNlIHRo
ZXJlJ3Mgbm8gCndheSB0byBlbmFibGUgaXQuCgpUaGFua3MKCgo+Cj4KPj4gLS0gCj4+IC0tLQo+
PiBIaW53ZWlzOiB1bnZlcnNjaGzDg8K8c3NlbHRlIEUtTWFpbHMga8ODwrZubmVuIGxlaWNodCBh
YmdlaMODwrZydCB1bmQgbWFuaXB1bGllcnQKPj4gd2VyZGVuICEgRsODwrxyIGVpbmUgdmVydHJh
dWxpY2hlIEtvbW11bmlrYXRpb24gc2VuZGVuIFNpZSBiaXR0ZSBpaHJlbgo+PiBHUEcvUEdQLVNj
aGzDg8K8c3NlbCB6dS4KPj4gLS0tCj4+IEVucmljbyBXZWlnZWx0LCBtZXR1eCBJVCBjb25zdWx0
Cj4+IEZyZWUgc29mdHdhcmUgYW5kIExpbnV4IGVtYmVkZGVkIGVuZ2luZWVyaW5nCj4+IGluZm9A
bWV0dXgubmV0IC0tICs0OS0xNTEtMjc1NjUyODcKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
