Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C05DC28B2B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Aug 2022 04:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5op8Kz7py/MJZOk36SawhJdedjxV488ZRNgHF+txtkg=; b=RKfAXy8/W7I8Pb
	kCrHl6g4xVIItNIO8yvjwIiTQAs17oDtwAIt/sFVA+64DnI+1UZIWotbhAWykIYIfefx9Y/DUOdat
	+WbQh+gkibXxU1nSDnWvUo2dRuUiVDWKYqzdtabOD6QxfEtPC4v2BIYGwvsRxJmircCAw0h+OzeLF
	/zVjBPNP+TwYprgDl3Dk30k1BKkWnI7C0zLhRqWigDkAhMcF4wa0IDHg7dHJtKOELjMy/qcDFjkIM
	wFE1DU7p/h1bS7fY7hxvTk8dJTl3hnPk+VEwJkmMECbeolke/31ElZ9JGuVXf5WCHlT+BZMZ7AL9+
	fkw29QP226KmbxHhg9eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOXIt-00EfTO-E1; Thu, 18 Aug 2022 04:38:47 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOXIp-00Ef3G-ID
	for linux-riscv@lists.infradead.org; Thu, 18 Aug 2022 04:38:46 +0000
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R781e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046050;MF=xianting.tian@linux.alibaba.com;NM=1;PH=DS;RN=13;SR=0;TI=SMTPD_---0VMZPVz8_1660797509;
Received: from 192.168.1.120(mailfrom:xianting.tian@linux.alibaba.com fp:SMTPD_---0VMZPVz8_1660797509)
          by smtp.aliyun-inc.com;
          Thu, 18 Aug 2022 12:38:31 +0800
Message-ID: <5b7b3f1c-637c-37bf-9a32-244eb62d543d@linux.alibaba.com>
Date: Thu, 18 Aug 2022 12:38:29 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH V2 1/2] riscv: kexec: Disable all interrupts in kexec
 crash path
To: guoren@kernel.org, palmer@dabbelt.com, heiko@sntech.de,
 conor.dooley@microchip.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, liaochang1@huawei.com, mick@ics.forth.gr,
 jszhang@kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Will Deacon <will.deacon@arm.com>,
 AKASHI Takahiro <takahiro.akashi@linaro.org>
References: <20220817161258.748836-1-guoren@kernel.org>
 <20220817161258.748836-2-guoren@kernel.org>
From: Xianting Tian <xianting.tian@linux.alibaba.com>
In-Reply-To: <20220817161258.748836-2-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_213843_841912_13BDBE23 
X-CRM114-Status: GOOD (  18.32  )
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

SXQgaXMgb2sgZm9yIG1lCgpSZXZpZXdlZC1ieTogWGlhbnRpbmcgVGlhbiA8eGlhbnRpbmcudGlh
bkBsaW51eC5hbGliYWJhLmNvbT4KCuWcqCAyMDIyLzgvMTgg5LiK5Y2IMTI6MTIsIGd1b3JlbkBr
ZXJuZWwub3JnIOWGmemBkzoKPiBGcm9tOiBHdW8gUmVuIDxndW9yZW5AbGludXguYWxpYmFiYS5j
b20+Cj4KPiBJZiBhIGNyYXNoIGhhcHBlbnMgb24gY3B1MyBhbmQgYWxsIGludGVycnVwdHMgYXJl
IGJpbmRpbmcgb24gY3B1MCwgdGhlCj4gYmFkIGlycSByb3V0aW5nIHdpbGwgY2F1c2UgYSBjcmFz
aCBrZXJuZWwgd2hpY2ggY2FuJ3QgcmVjZWl2ZSBhbnkgaXJxLgo+IEJlY2F1c2UgY3Jhc2gga2Vy
bmVsIHdvbid0IGNsZWFuIHVwIGFsbCBoYXJ0cycgUExJQyBlbmFibGUgYml0cyBpbgo+IGVuYWJs
ZSByZWdpc3RlcnMuIFRoaXMgcGF0Y2ggaXMgc2ltaWxhciB0byA5MTQxYTAwM2E0OTEgKCJBUk06
IDczMTYvMToKPiBrZXhlYzogRU9JIGFjdGl2ZSBhbmQgbWFzayBhbGwgaW50ZXJydXB0cyBpbiBr
ZXhlYyBjcmFzaCBwYXRoIikgYW5kCj4gNzhmZDU4NGNkZWMwICgiYXJtNjQ6IGtkdW1wOiBpbXBs
ZW1lbnQgbWFjaGluZV9jcmFzaF9zaHV0ZG93bigpIiksIGFuZAo+IFBvd2VyUEMgYWxzbyBoYXMg
dGhlIHNhbWUgbWVjaGFuaXNtLgo+Cj4gRml4ZXM6IGZiYThhODY3NGY2OCAoIlJJU0MtVjogQWRk
IGtleGVjIHN1cHBvcnQiKQo+IFNpZ25lZC1vZmYtYnk6IEd1byBSZW4gPGd1b3JlbkBsaW51eC5h
bGliYWJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4K
PiBDYzogV2lsbCBEZWFjb24gPHdpbGwuZGVhY29uQGFybS5jb20+Cj4gQ2M6IEFLQVNISSBUYWth
aGlybyA8dGFrYWhpcm8uYWthc2hpQGxpbmFyby5vcmc+Cj4gQ2M6IE5pY2sgS29zc2lmaWRpcyA8
bWlja0BpY3MuZm9ydGguZ3I+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tl
eGVjLmMgfCAzNSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hh
bmdlZCwgMzUgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVs
L21hY2hpbmVfa2V4ZWMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+IGlu
ZGV4IGVlNzllNjgzOWI4Ni4uZGI0MWM2NzZlNWEyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL21hY2hpbmVfa2V4ZWMuYwo+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL21hY2hpbmVf
a2V4ZWMuYwo+IEBAIC0xNSw2ICsxNSw4IEBACj4gICAjaW5jbHVkZSA8bGludXgvY29tcGlsZXIu
aD4JLyogRm9yIHVucmVhY2hhYmxlKCkgKi8KPiAgICNpbmNsdWRlIDxsaW51eC9jcHUuaD4JCS8q
IEZvciBjcHVfZG93bigpICovCj4gICAjaW5jbHVkZSA8bGludXgvcmVib290Lmg+Cj4gKyNpbmNs
dWRlIDxsaW51eC9pbnRlcnJ1cHQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L2lycS5oPgo+ICAgCj4g
ICAvKgo+ICAgICoga2V4ZWNfaW1hZ2VfaW5mbyAtIFByaW50IHJlY2VpdmVkIGltYWdlIGRldGFp
bHMKPiBAQCAtMTU0LDYgKzE1NiwzNyBAQCB2b2lkIGNyYXNoX3NtcF9zZW5kX3N0b3Aodm9pZCkK
PiAgIAljcHVzX3N0b3BwZWQgPSAxOwo+ICAgfQo+ICAgCj4gK3N0YXRpYyB2b2lkIG1hY2hpbmVf
a2V4ZWNfbWFza19pbnRlcnJ1cHRzKHZvaWQpCj4gK3sKPiArCXVuc2lnbmVkIGludCBpOwo+ICsJ
c3RydWN0IGlycV9kZXNjICpkZXNjOwo+ICsKPiArCWZvcl9lYWNoX2lycV9kZXNjKGksIGRlc2Mp
IHsKPiArCQlzdHJ1Y3QgaXJxX2NoaXAgKmNoaXA7Cj4gKwkJaW50IHJldDsKPiArCj4gKwkJY2hp
cCA9IGlycV9kZXNjX2dldF9jaGlwKGRlc2MpOwo+ICsJCWlmICghY2hpcCkKPiArCQkJY29udGlu
dWU7Cj4gKwo+ICsJCS8qCj4gKwkJICogRmlyc3QgdHJ5IHRvIHJlbW92ZSB0aGUgYWN0aXZlIHN0
YXRlLiBJZiB0aGlzCj4gKwkJICogZmFpbHMsIHRyeSB0byBFT0kgdGhlIGludGVycnVwdC4KPiAr
CQkgKi8KPiArCQlyZXQgPSBpcnFfc2V0X2lycWNoaXBfc3RhdGUoaSwgSVJRQ0hJUF9TVEFURV9B
Q1RJVkUsIGZhbHNlKTsKPiArCj4gKwkJaWYgKHJldCAmJiBpcnFkX2lycV9pbnByb2dyZXNzKCZk
ZXNjLT5pcnFfZGF0YSkgJiYKPiArCQkgICAgY2hpcC0+aXJxX2VvaSkKPiArCQkJY2hpcC0+aXJx
X2VvaSgmZGVzYy0+aXJxX2RhdGEpOwo+ICsKPiArCQlpZiAoY2hpcC0+aXJxX21hc2spCj4gKwkJ
CWNoaXAtPmlycV9tYXNrKCZkZXNjLT5pcnFfZGF0YSk7Cj4gKwo+ICsJCWlmIChjaGlwLT5pcnFf
ZGlzYWJsZSAmJiAhaXJxZF9pcnFfZGlzYWJsZWQoJmRlc2MtPmlycV9kYXRhKSkKPiArCQkJY2hp
cC0+aXJxX2Rpc2FibGUoJmRlc2MtPmlycV9kYXRhKTsKPiArCX0KPiArfQo+ICsKPiAgIC8qCj4g
ICAgKiBtYWNoaW5lX2NyYXNoX3NodXRkb3duIC0gUHJlcGFyZSB0byBrZXhlYyBhZnRlciBhIGtl
cm5lbCBjcmFzaAo+ICAgICoKPiBAQCAtMTY5LDYgKzIwMiw4IEBAIG1hY2hpbmVfY3Jhc2hfc2h1
dGRvd24oc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gICAJY3Jhc2hfc21wX3NlbmRfc3RvcCgpOwo+
ICAgCj4gICAJY3Jhc2hfc2F2ZV9jcHUocmVncywgc21wX3Byb2Nlc3Nvcl9pZCgpKTsKPiArCW1h
Y2hpbmVfa2V4ZWNfbWFza19pbnRlcnJ1cHRzKCk7Cj4gKwo+ICAgCXByX2luZm8oIlN0YXJ0aW5n
IGNyYXNoZHVtcCBrZXJuZWwuLi5cbiIpOwo+ICAgfQo+ICAgCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
