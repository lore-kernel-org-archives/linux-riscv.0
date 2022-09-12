Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2D9ECAAD3
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 01:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vc2yQIB4hKauuyoA9q4QwnT03qnMT8s2fxVo9EP08bg=; b=uELpF7bl0Wqmvd
	VNyCzkxVQTcG+A+5xCK9xWmkT+s/hzMf7EcSW2pOgjgUQIWM5Ts+7pqa3aQdoblvp3Sh4Wj7iZyNu
	gSYT5iOVfTDugJoCEhK4HO+dtjSSSCQjq/XSCw0omGjal9o8fcX4klsqyshytSv+KLSC1V0azsGnn
	8F8PRed7Prp0emLjgDzJM0kiAhDTBVTVYCFbH09TtE9P7HAJSylpu9nRIwQLW3JRtzbayizIeO1zd
	JW7gNhK0YKovmjCjbAPcMZTNafL9KEK4B/GcjWqSSilCpnPFrCRpQ98n40JB5wOHUqGuwx3jHGT7y
	T5VhO/9g4Mi0C+lzFriw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXYPP-005xl0-LB; Mon, 12 Sep 2022 01:38:47 +0000
Received: from sender4-op-o18.zoho.com ([136.143.188.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXYPJ-005xi2-Q1
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 01:38:44 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1662946715; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nmoULEJNVVyhcxfPz0c930xHqEoELXOWTgTMys221E+FNMQa501Y9cpnRq+f+5Gr+7wgE2wmRMpcDCnLCKbMmXo5N1826h0A61qjiC92cRA9HEWdiN2ZKd9pOQUeAbK5tUgDmfI0H8w3HPkHZHCKZs5VBT21Ih8cCEf8qjfCm1o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1662946715; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=gITTsAelrgqAVvbvWxgmltU1PS5HhOC1zITbPK6fu0g=; 
	b=JSUDmJ8wL402368k3QCl7Lh5Q8iPxwJa+Tp7MJYCuhLe2qLXYvLXo3b4ORgnhbqxFYQrXaow0ppaxbAXwnwex+2IZGPqPuHltNelqtoqvVcxSAkIWOHI7XBkNuktBeM4iaSy98m+4pcEBMcieQicWqds/if57HOpV7RzcRl5060=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1662946715;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=gITTsAelrgqAVvbvWxgmltU1PS5HhOC1zITbPK6fu0g=;
	b=Yke6a9TpB426+bzCB66za6yzYg0z/1k5luMmdoH2GxZkItv5RSdjc7qi5CDTIPHu
	3ELKnGqi/Ai9c3nL8LE5x0Q++vVtrTOd0gTW6YWZpzehkUIPx0Ih+z/G5sEFiD+YnTM
	ASkcB9jOo8JOu6IPZjai/gXwAu7Em+yNYccHeiQQ=
Received: from edelgard.icenowy.me (112.94.103.212 [112.94.103.212]) by mx.zohomail.com
	with SMTPS id 1662946713737839.7941793140751; Sun, 11 Sep 2022 18:38:33 -0700 (PDT)
Message-ID: <b1a3f887fd037fd18c45ac020c6142cedba58ca7.camel@icenowy.me>
Subject: Re: [PATCH] PCI: fu740: do not use clock name when requesting clock
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor.Dooley@microchip.com, paul.walmsley@sifive.com, 
 greentime.hu@sifive.com, lpieralisi@kernel.org, robh@kernel.org,
 kw@linux.com,  bhelgaas@google.com
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Mon, 12 Sep 2022 09:38:28 +0800
In-Reply-To: <8d7b8514-efe0-d3e3-8458-f4f003f10154@microchip.com>
References: <20220907054020.745672-1-uwu@icenowy.me>
	 <8d7b8514-efe0-d3e3-8458-f4f003f10154@microchip.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.40.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_183842_378039_CA12278F 
X-CRM114-Status: GOOD (  22.06  )
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

5ZyoIDIwMjItMDktMDjmmJ/mnJ/lm5vnmoQgMTg6MTQgKzAwMDDvvIxDb25vci5Eb29sZXlAbWlj
cm9jaGlwLmNvbeWGmemBk++8mgo+IE9uIDA3LzA5LzIwMjIgMDY6NDAsIEljZW5vd3kgWmhlbmcg
d3JvdGU6Cj4gPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdQo+ID4ga25vdyB0aGUgY29udGVudCBpcyBzYWZlCj4gPiAKPiA+
IFRoZSBEVCBiaW5kaW5nIG9mIEZVNzQwIFBDSWUgZG9lcyBub3QgZW5mb3JjZSBhIGNsb2NrLW5h
bWVzIHByb3BlcnR5LAo+ID4gYW5kIHRoZXJlIGV4aXN0IHNvbWUgZGV2aWNlIHRyZWUgdGhhdCBo
YXMgYSBjbG9jayBuYW1lIHRoYXQgZG9lcyBub3QKPiA+IHN0aWNrIHRvIHRoZSBvbmUgdXNlZCBi
eSBMaW51eCBEVCAoZS5nLiB0aGUgb25lIHNoaXBwZWQgd2l0aCBjdXJyZW50Cj4gPiBVLUJvb3Qg
bWFpbmxpbmUpLgo+IAo+IEkgcmVjZW50bHkgYWRkZWQgdGhlIG1pc3NpbmcgZW5mb3JjZW1lbnQ6
Cj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvbHBpZXJh
bGlzaS9wY2kuZ2l0L2NvbW1pdC8/aD1wY2kvZHQmaWQ9YjQwOGZhZDYxZDM0Yzc2NWMzZTAxODk1
Mjg2MzMyYWYyZDUwNDAyYQoKVW5mb3J0dW5hdGVseSBiaW5kaW5nIHcvbyBjbG9jay1uYW1lcyBl
bmZvcmNlbWVudCBoYXMgYWxyZWFkeSBlbnRlcmVkIGEKc3RhYmxlIHJlbGVhc2UgKDUuMTkpLCBh
bmQgdGhlIHJlYWwgY2xvY2sgbmFtZSAicGNpZV9hdXgiIGlzIG5ldmVyCmVuZm9yY2VkIGJlZm9y
ZSAodGhlcmUncyBhIERUIGluIFUtQm9vdCB0aGF0IHVzZXMgInBjaWVhdXgiIGluc3RlYWQpLApz
aG91bGQgdGhpcyBiZSBjb25zaWRlcmVkIGFzIGJyZWFrYWdlIHRvIHN0YWJsZSBEVCBiaW5kaW5n
PwoKQW55d2F5LCBJIGhhZCBzZW50IG91dCBhIHBhdGNoIHRoYXQgc3luY2hvcml6ZXMgYWxsIEZV
NzQwLXJlbGF0ZWQgRFQKZmlsZXMgdG8gVS1Cb290LCBzZWUgWzFdLgoKWzFdCmh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2FsbC8yMDIyMDgyNTA4MTExOS4xNjk0MDA3LTItdXd1QGljZW5vd3kubWUv
Cgo+IAo+IFNpbmNlIHRoZXJlJ3Mgb25seSBvbmUgY2xvY2sgdGhvdWdoLCBJJ2QgaW1hZ2luZSBp
dCBtYWtlcyBsaXR0bGUgdG8gbm8KPiByZWFsIGRpZmZlcmVuY2UgaWYgdGhlIGNoZWNrIGhlcmUg
aXMgcmVsYXhlZC4KPiAKPiBSZXZpZXdlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlA
bWljcm9jaGlwLmNvbT4KPiAKPiA+IAo+ID4gRHJvcCB0aGUgbmFtZSBpbiB0aGUgY2xvY2sgcmVx
dWVzdCwgaW5zdGVhZCBqdXN0IHBhc3MgTlVMTCAoYmVjYXVzZQo+ID4gdGhpcyBkZXZpY2Ugc2hv
dWxkIGhhdmUgb25seSBhIHNpbmdsZSBjbG9jaykuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IElj
ZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gLS0tCj4gPiDCoGRyaXZlcnMvcGNpL2Nv
bnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAuYyB8IDIgKy0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L3BjaS9jb250cm9sbGVyL2R3Yy9wY2llLWZ1NzQwLmMKPiA+IGIvZHJpdmVycy9wY2kvY29udHJv
bGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiBpbmRleCAwYzkwNTgzYzA3OGIuLmVkYjIxOGEzN2E0
ZiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvcGNpL2NvbnRyb2xsZXIvZHdjL3BjaWUtZnU3NDAu
Ywo+ID4gKysrIGIvZHJpdmVycy9wY2kvY29udHJvbGxlci9kd2MvcGNpZS1mdTc0MC5jCj4gPiBA
QCAtMzE1LDcgKzMxNSw3IEBAIHN0YXRpYyBpbnQgZnU3NDBfcGNpZV9wcm9iZShzdHJ1Y3QKPiA+
IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oCByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoYWZwLT5wd3JlbiksCj4gPiAidW5h
YmxlIHRvIGdldCBwd3Jlbi1ncGlvc1xuIik7Cj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKgIC8qIEZl
dGNoIGNsb2NrcyAqLwo+ID4gLcKgwqDCoMKgwqDCoCBhZnAtPnBjaWVfYXV4ID0gZGV2bV9jbGtf
Z2V0KGRldiwgInBjaWVfYXV4Iik7Cj4gPiArwqDCoMKgwqDCoMKgIGFmcC0+cGNpZV9hdXggPSBk
ZXZtX2Nsa19nZXQoZGV2LCBOVUxMKTsKPiA+IMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoYWZw
LT5wY2llX2F1eCkpCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIGRl
dl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGFmcC0+cGNpZV9hdXgpLAo+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAicGNpZV9hdXggY2xvY2sgc291cmNlCj4gPiBtaXNzaW5nIG9y
IGludmFsaWRcbiIpOwo+ID4gLS0KPiA+IDIuMzcuMQo+ID4gCj4gCgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
