Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F40BC369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 09:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B2Kbn9FSfX3f+6sHsXkVJ5SWELCFLZShC3ZLooPtxL8=; b=atRhTTpx6blJZO
	k4EcAhjekLXD4nYsno+IyzUmbraNQ15hiPHPAm+tiKxa2oZgbEU2znnoJdddfN0jkyPluHdHNnZLZ
	mmT91sICv37nYDirOdC68DO1FFmPeNiR4u634fKP3gReU/kR00LkH4ABE3JeEK+TH2ldaOKY4+gY1
	cj5u5i6hLluOKM+RuSOHOsTdUOL4MYWgY1QHXOCUzGLlGhK5sIZKT82VrVm8ORIx3gzAcMxjpNx+e
	G741+xynrfEqCxda0hm877Cb0KZOcE41xo3l+VrEEQNSZ5Sb3RCtR2O0PbUqL4kq/2yvpUTZzUdbb
	Om9Z8XOHQPdkjTI4CaTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Rya-00000006jkx-2B55;
	Wed, 09 Apr 2025 09:44:10 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2RyJ-00000006jiE-4BWr;
	Wed, 09 Apr 2025 09:44:00 +0000
Received: from [198.18.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [27.18.106.237])
	by smtp.qiye.163.com (Hmail) with ESMTP id 113920671;
	Wed, 9 Apr 2025 17:43:41 +0800 (GMT+08:00)
Message-ID: <a71f45fc-d266-447d-8fb0-1ff0897f5bff@whut.edu.cn>
Date: Wed, 9 Apr 2025 17:43:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn>
 <20250407-b4-k1-usb3-v3-2-v1-5-bf0bcc41c9ba@whut.edu.cn>
 <74770bec-eeda-4823-b494-bea177fe26b0@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <74770bec-eeda-4823-b494-bea177fe26b0@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx4ZVh8YSBlCHUhKHR1NQlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VKS01VSUhMWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxPVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a9619ef181403a1kunm113920671
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRQ6HCo5TjJCDjwXERcME0kh
	NVFPCShVSlVKTE9PSkJKQ0lDTUpPVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VKS01VSUhMWVdZCAFZQUhOS0o3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_024357_881133_B477AFD6 
X-CRM114-Status: GOOD (  15.05  )
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

T24gNC83LzI1IDk6MjggUE0sIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6Cj4gT24gMDcvMDQv
MjAyNSAxNDozOCwgWmUgSHVhbmcgd3JvdGU6Cj4+IEFkZCBzdXBwb3J0IGZvciBVU0IgMy4wIG1v
ZGUgb24gdGhlIEsxIFBDSWUvVVNCMyBjb21ibyBQSFkuIEN1cnJlbnRseSwKPj4gb25seSBVU0Ig
bW9kZSBpcyBzdXBwb3J0ZWQ7IFBDSWUgc3VwcG9ydCBpcyBub3QgaW5jbHVkZWQgaW4gdGhpcyBj
aGFuZ2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IFplIEh1YW5nIDxodWFuZ3plQHdodXQuZWR1LmNu
Pgo+PiAtLS0KPj4gICBkcml2ZXJzL3BoeS9zcGFjZW1pdC9LY29uZmlnICAgICAgICAgIHwgICA4
ICsrCj4+ICAgZHJpdmVycy9waHkvc3BhY2VtaXQvTWFrZWZpbGUgICAgICAgICB8ICAgMSArCj4+
ICAgZHJpdmVycy9waHkvc3BhY2VtaXQvcGh5LWsxLWNvbWJwaHkuYyB8IDIyOSArKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAyMzggaW5zZXJ0
aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9waHkvc3BhY2VtaXQvS2NvbmZpZyBi
L2RyaXZlcnMvcGh5L3NwYWNlbWl0L0tjb25maWcKPj4gaW5kZXggZjBjMmEzM2Y1M2NjODEwZTcx
YzYxNDBhZTk1N2FhNjhhMmI2ZmYwYy4uMTI3NDlhYmE3NTYzMjljZjY0ZmI5MTk5MDU1YmE0ODRm
ZTA1ZjNhYiAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy9waHkvc3BhY2VtaXQvS2NvbmZpZwo+PiAr
KysgYi9kcml2ZXJzL3BoeS9zcGFjZW1pdC9LY29uZmlnCj4+IEBAIC0xMCwzICsxMCwxMSBAQCBj
b25maWcgUEhZX1NQQUNFTUlUX0sxX1VTQjIKPj4gICAJaGVscAo+PiAgIAkgIEVuYWJsZSB0aGlz
IHRvIHN1cHBvcnQgSzEgVVNCIDIuMCBQSFkgZHJpdmVyLiBUaGlzIGRyaXZlciB0YWtlcyBjYXJl
IG9mCj4+ICAgCSAgZW5hYmxpbmcgYW5kIGNsb2NrIHNldHVwIGFuZCB3aWxsIGJlIHVzZWQgYnkg
SzEgdWRjL2VoY2kvb3RnIGRyaXZlci4KPj4gKwo+PiArY29uZmlnIFBIWV9TUEFDRU1JVF9LMV9D
T01CUEhZCj4+ICsJdHJpc3RhdGUgIlNwYWNlbWlUIEsxIFBDSWUvVVNCMyBjb21ibyBQSFkgc3Vw
cG9ydCIKPj4gKwlkZXBlbmRzIG9uIE9GCj4+ICsJc2VsZWN0IEdFTkVSSUNfUEhZCj4+ICsJZGVm
YXVsdCBBUkNIX1NQQUNFTUlUICYmIFVTQl9EV0MzX1NQQUNFTUlUCj4+ICsJaGVscAo+PiArCSAg
VVNCMy9QQ0llIENvbWJvIFBIWSBTdXBwb3J0IGZvciBTcGFjZW1pVCBLMSBTb0MKPiBNaXNzaW5n
IGRlcGVuZHMgb24gQVJDSF9TUEFDRU1JVCB8fCBDT01QSUxFX1RFU1QKCldpbGwgZml4LCB0aGFu
a3MhCgo+Cj4gLi4uCj4KPgo+PiArCXByaXYtPnBoeSA9IGRldm1fcGh5X2NyZWF0ZShkZXYsIE5V
TEwsICZzcGFjZW1pdF9jb21icGh5X29wcyk7Cj4+ICsJaWYgKElTX0VSUihwcml2LT5waHkpKQo+
PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIocHJpdi0+cGh5KSwKPj4gKwkJ
CQkgICAgICJmYWlsZWQgdG8gY3JlYXRlIGNvbWJwaHlcbiIpOwo+PiArCj4+ICsJZGV2X3NldF9k
cnZkYXRhKGRldiwgcHJpdik7Cj4+ICsJcGh5X3NldF9kcnZkYXRhKHByaXYtPnBoeSwgcHJpdik7
Cj4gQm90aCBtYWtlIG5vIHNlbnNlLiBMb29rIHdoYXQgdGhpcyBmdW5jdGlvbiBkb2VzLgoKSXQg
ZG9lcyBzZWVtIHJlZHVuZGFudCBhdCBmaXJzdCBnbGFuY2UsIGJ1dCBwZGV2LT5kZXYgaXMgdGhl
IHBhcmVudCBvZiAKcGh5LT5kZXYuCnBkZXYtPmRldi0+ZHJpdmVyX2RhdGEgd2lsbCBiZSB1c2Vk
IGluIHNwYWNlbWl0X2NvbWJwaHlfeGxhdGUoKQpwaHktPmRldi0+ZHJpdmVyX2RhdGHCoCB3aWxs
IGJlIHVzZWQgaW4gcGh5X29wcyBmdW5jdGlvbnMKCkkndmUgY2hlY2tlZCBzb21lIG90aGVyIGRy
aXZlcnMgdGhhdCBkaWQgdGhlIHNhbWU6CiDCoMKgwqAgLSBwaHktenlucW1wLmMgYXQgbGluZXMg
OTkwIGFuZCAxMDI2CiDCoMKgwqAgLSBwaHktcm9ja2NoaXAtc2Ftc3VuZy1oZHB0eC5jIGF0IGxp
bmVzIDE5ODkgYW5kIDIwMDAKCj4KPiBCZXN0IHJlZ2FyZHMsCj4gS3J6eXN6dG9mCj4KPgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
