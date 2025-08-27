Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88BA5CA0FED
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Aug 2025 15:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uGaNAV/09k6IQeWQsAeeC2OLRFAunWROO7w4B939hfc=; b=KWPNLgWjIzDaHT
	CDhTj8SdtXVXEyrLZLo47xwmngD6Yj0MQavDARcXSL7R7nCEi+lWJQd3kUwnHnyvfNEdn7LaOojj1
	YcSS/Xzu3lswlzycC49kPQInrzss4MQl6sD4O9qCwDJfrBZvcBMftbtTP7bWsWmmajCPqNpAxm2Hv
	NIDzCrkHHLXa6sBuDSQ2snmkfedrbDVRkBti777sfiLFHslZ2ptTRAMuHC+r6LywAvrHKbTUCIXcn
	7ThhrPWcQrhP80dmjucq+9vQseQOnZfl7OhB/wtSO4rjMBB45Jfi7uzQv1EHd6BWPPy8z/DVApIoK
	oDt00p4x8RvwmPXFW6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urITf-0000000G3yg-2Snt;
	Wed, 27 Aug 2025 15:54:23 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urG27-0000000FYE0-1SoH
	for linux-riscv@lists.infradead.org;
	Wed, 27 Aug 2025 13:17:49 +0000
Received: from [192.168.0.102] (unknown [114.241.87.235])
	by APP-05 (Coremail) with SMTP id zQCowAC3SFljBa9oUlCJDw--.28806S2;
	Wed, 27 Aug 2025 21:17:24 +0800 (CST)
Message-ID: <9b83e78a-0456-4b43-9380-0e2b83933246@iscas.ac.cn>
Date: Wed, 27 Aug 2025 21:17:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/5] net: spacemit: Add K1 Ethernet MAC
To: Philipp Zabel <p.zabel@pengutronix.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Vivian Wang <uwu@dram.page>, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Junhui Liu <junhui.liu@pigmoral.tech>, Simon Horman <horms@kernel.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250826-net-k1-emac-v7-0-5bc158d086ae@iscas.ac.cn>
 <20250826-net-k1-emac-v7-2-5bc158d086ae@iscas.ac.cn>
 <eb127fd167cfbd885099a7c4c962eb1135a5a8a0.camel@pengutronix.de>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <eb127fd167cfbd885099a7c4c962eb1135a5a8a0.camel@pengutronix.de>
X-CM-TRANSID: zQCowAC3SFljBa9oUlCJDw--.28806S2
X-Coremail-Antispam: 1UD129KBjvJXoWxXrWUZF43Jw1kKr4rArWrZrb_yoWrJFy8pa
	ykJF9IkF4xAr17Kws3Xr4UAF93Xw4IyFyUCrySyw4rXwnFyr1fGry8KrWYkw1vyrZ8CryY
	va1UZa4I9Fs8u3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvqb7Iv0xC_Kw4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4
	A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY
	1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8Jw
	C20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAF
	wI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjx
	v20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2
	jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0x
	ZFpf9x07bIBTOUUUUU=
X-Originating-IP: [114.241.87.235]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_061747_748937_3CE95C09 
X-CRM114-Status: GOOD (  17.99  )
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

SGnCoFBoaWxpcHAsCgpUaGFua3MgZm9yIHlvdXIgcmV2aWV3LgoKT24gOC8yNi8yNSAxNjo1NCwg
UGhpbGlwcCBaYWJlbCB3cm90ZToKPiBPbiBEaSwgMjAyNS0wOC0yNiBhdCAxNDoyMyArMDgwMCwg
Vml2aWFuIFdhbmcgd3JvdGU6Cj4+IFRoZSBFdGhlcm5ldCBNQUNzIGZvdW5kIG9uIFNwYWNlbWlU
IEsxIGFwcGVhcnMgdG8gYmUgYSBjdXN0b20gZGVzaWduCj4+IHRoYXQgb25seSBzdXBlcmZpY2lh
bGx5IHJlc2VtYmxlcyBzb21lIG90aGVyIGVtYmVkZGVkIE1BQ3MuIFNwYWNlbWlUCj4+IHJlZmVy
cyB0byB0aGVtIGFzICJFTUFDIiwgc28gbGV0J3MganVzdCBjYWxsIHRoZSBkcml2ZXIgImsxX2Vt
YWMiLgo+Pgo+PiBTdXBwb3J0cyBSR01JSSBhbmQgUk1JSSBpbnRlcmZhY2VzLiBJbmNsdWRlcyBz
dXBwb3J0IGZvciBNQUMgaGFyZHdhcmUKPj4gc3RhdGlzdGljcyBjb3VudGVycy4gUFRQIHN1cHBv
cnQgaXMgbm90IGltcGxlbWVudGVkLgo+Pgo+PiBUZXN0ZWQtYnk6IEp1bmh1aSBMaXUgPGp1bmh1
aS5saXVAcGlnbW9yYWwudGVjaD4KPj4gU2lnbmVkLW9mZi1ieTogVml2aWFuIFdhbmcgPHdhbmdy
dWlrYW5nQGlzY2FzLmFjLmNuPgo+PiBSZXZpZXdlZC1ieTogTWF4aW1lIENoZXZhbGxpZXIgPG1h
eGltZS5jaGV2YWxsaWVyQGJvb3RsaW4uY29tPgo+PiBSZXZpZXdlZC1ieTogVmFkaW0gRmVkb3Jl
bmtvIDx2YWRpbS5mZWRvcmVua29AbGludXguZGV2Pgo+PiAtLS0KPj4gIGRyaXZlcnMvbmV0L2V0
aGVybmV0L0tjb25maWcgICAgICAgICAgICB8ICAgIDEgKwo+PiAgZHJpdmVycy9uZXQvZXRoZXJu
ZXQvTWFrZWZpbGUgICAgICAgICAgIHwgICAgMSArCj4+ICBkcml2ZXJzL25ldC9ldGhlcm5ldC9z
cGFjZW1pdC9LY29uZmlnICAgfCAgIDI5ICsKPj4gIGRyaXZlcnMvbmV0L2V0aGVybmV0L3NwYWNl
bWl0L01ha2VmaWxlICB8ICAgIDYgKwo+PiAgZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQv
azFfZW1hYy5jIHwgMjE5MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICBkcml2
ZXJzL25ldC9ldGhlcm5ldC9zcGFjZW1pdC9rMV9lbWFjLmggfCAgNDI2ICsrKysrKwo+PiAgNiBm
aWxlcyBjaGFuZ2VkLCAyNjU2IGluc2VydGlvbnMoKykKPj4KPiBbLi4uXQo+PiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvc3BhY2VtaXQvazFfZW1hYy5jIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvc3BhY2VtaXQvazFfZW1hYy5jCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4+IGlu
ZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLjllNTU4ZDU4OTNj
ZmJiZGEwYmFhN2FkMjFhNzIwOWRhZGRhOTQ4N2UKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9k
cml2ZXJzL25ldC9ldGhlcm5ldC9zcGFjZW1pdC9rMV9lbWFjLmMKPj4gQEAgLTAsMCArMSwyMTkz
IEBACj4gWy4uLl0KPj4gK3N0YXRpYyBpbnQgZW1hY19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlICpwZGV2KQo+PiArewo+PiArCXN0cnVjdCBkZXZpY2UgKmRldiA9ICZwZGV2LT5kZXY7Cj4+
ICsJc3RydWN0IHJlc2V0X2NvbnRyb2wgKnJlc2V0Owo+PiArCXN0cnVjdCBuZXRfZGV2aWNlICpu
ZGV2Owo+PiArCXN0cnVjdCBlbWFjX3ByaXYgKnByaXY7Cj4+ICsJaW50IHJldDsKPj4gKwo+PiAr
CW5kZXYgPSBkZXZtX2FsbG9jX2V0aGVyZGV2KGRldiwgc2l6ZW9mKHN0cnVjdCBlbWFjX3ByaXYp
KTsKPj4gKwlpZiAoIW5kZXYpCj4+ICsJCXJldHVybiAtRU5PTUVNOwo+PiArCj4+ICsJbmRldi0+
aHdfZmVhdHVyZXMgPSBORVRJRl9GX1NHOwo+PiArCW5kZXYtPmZlYXR1cmVzIHw9IG5kZXYtPmh3
X2ZlYXR1cmVzOwo+PiArCj4+ICsJbmRldi0+bWF4X210dSA9IEVNQUNfUlhfQlVGXzRLIC0gKEVU
SF9ITEVOICsgRVRIX0ZDU19MRU4pOwo+PiArCj4+ICsJcHJpdiA9IG5ldGRldl9wcml2KG5kZXYp
Owo+PiArCXByaXYtPm5kZXYgPSBuZGV2Owo+PiArCXByaXYtPnBkZXYgPSBwZGV2Owo+PiArCXBs
YXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIHByaXYpOwo+PiArCj4+ICsJcmV0ID0gZW1hY19jb25m
aWdfZHQocGRldiwgcHJpdik7Cj4+ICsJaWYgKHJldCA8IDApIHsKPj4gKwkJZGV2X2Vycl9wcm9i
ZShkZXYsIHJldCwgIkNvbmZpZ3VyYXRpb24gZmFpbGVkXG4iKTsKPj4gKwkJZ290byBlcnI7Cj4g
SSdkIGp1c3QKPiAJCXJldHVybiBkZXZfZXJyX3Byb2JlKC4uLik7Cj4gaGVyZS4KPgo+PiArCX0K
Pj4gKwo+PiArCW5kZXYtPndhdGNoZG9nX3RpbWVvID0gNSAqIEhaOwo+PiArCW5kZXYtPmJhc2Vf
YWRkciA9ICh1bnNpZ25lZCBsb25nKXByaXYtPmlvYmFzZTsKPj4gKwluZGV2LT5pcnEgPSBwcml2
LT5pcnE7Cj4+ICsKPj4gKwluZGV2LT5ldGh0b29sX29wcyA9ICZlbWFjX2V0aHRvb2xfb3BzOwo+
PiArCW5kZXYtPm5ldGRldl9vcHMgPSAmZW1hY19uZXRkZXZfb3BzOwo+PiArCj4+ICsJZGV2bV9w
bV9ydW50aW1lX2VuYWJsZSgmcGRldi0+ZGV2KTsKPj4gKwo+PiArCXByaXYtPmJ1c19jbGsgPSBk
ZXZtX2Nsa19nZXRfZW5hYmxlZCgmcGRldi0+ZGV2LCBOVUxMKTsKPj4gKwlpZiAoSVNfRVJSKHBy
aXYtPmJ1c19jbGspKSB7Cj4+ICsJCXJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHBy
aXYtPmJ1c19jbGspLAo+PiArCQkJCSAgICAiRmFpbGVkIHRvIGdldCBjbG9ja1xuIik7Cj4+ICsJ
CWdvdG8gZXJyOwo+IFNhbWUgaGVyZS4KPgo+PiArCX0KPj4gKwo+PiArCXJlc2V0ID0gZGV2bV9y
ZXNldF9jb250cm9sX2dldF9vcHRpb25hbF9leGNsdXNpdmVfZGVhc3NlcnRlZCgmcGRldi0+ZGV2
LAo+PiArCQkJCQkJCQkgICAgIE5VTEwpOwo+PiArCWlmIChJU19FUlIocmVzZXQpKSB7Cj4+ICsJ
CXJldCA9IGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKHJlc2V0KSwKPj4gKwkJCQkgICAgIkZh
aWxlZCB0byBnZXQgcmVzZXRcbiIpOwo+PiArCQlnb3RvIGVycjsKPiBBbmQgaGVyZS4KPgo+PiAr
CX0KPj4gKwo+PiArCWVtYWNfc3dfaW5pdChwcml2KTsKPj4gKwo+PiArCWlmIChvZl9waHlfaXNf
Zml4ZWRfbGluayhkZXYtPm9mX25vZGUpKSB7Cj4+ICsJCXJldCA9IG9mX3BoeV9yZWdpc3Rlcl9m
aXhlZF9saW5rKGRldi0+b2Zfbm9kZSk7Cj4+ICsJCWlmIChyZXQpIHsKPj4gKwkJCWRldl9lcnJf
cHJvYmUoZGV2LCByZXQsCj4+ICsJCQkJICAgICAgIkZhaWxlZCB0byByZWdpc3RlciBmaXhlZC1s
aW5rIik7Cj4+ICsJCQlnb3RvIGVycl90aW1lcl9kZWxldGU7Cj4gSWYgeW91IGNhbiBtb3ZlIHRo
aXMgc2VjdGlvbiBiZWZvcmUgZW1hY19zd19pbml0KCksIHRoaXMgY291bGQgYWxzbwo+IGp1c3Qg
cmV0dXJuLgpJJ2xsIHRha2UgYSBsb29rIG9uIHRoZXNlIGFuZCBjbGVhbiB1cCBpbiBuZXh0IHZl
cnNpb24sIHRoYW5rcy4KPj4gKwkJfQo+IFRoZW4gaGVyZSBhIGZ1bmN0aW9uIGNhbGxpbmcgb2Zf
cGh5X2RlcmVnaXN0ZXJfZml4ZWRfbGluaygpIGNvdWxkIGJlCj4gcmVnaXN0ZXJlZCB3aXRoIGRl
dm1fYWRkX2FjdGlvbl9vcl9yZXNldCgpLCB0byBhdm9pZCBkdXBsaWNhdGVkIGNsZWFudXAKPiBp
biB0aGUgZXJyb3IgcGF0aCBhbmQgaW4gZW1hY19yZW1vdmUoKS4KCkknbGwgZGVhbCB3aXRoIHRo
aXMuIFRoaXMgc2hvdWxkIGJlIGZpbmUsIGFzIGl0J3MgcHJvYmUtdGltZSBvbmx5LgoKVGhhbmtz
LApWaXZpYW4gImRyYW1mb3JldmVyIiBXYW5nCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
