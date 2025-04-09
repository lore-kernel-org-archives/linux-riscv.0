Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48918C36002
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 11:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qoGx20U8hgX92l2Ik7+tTTGoIW2G8/xCiOk8CnR204=; b=tiZbtTkHRbS9z/
	uwym4Tggx3zr4AxERtFH5KOwv7Qy4eu9RqMy+BTgUvukO/ZmJz408/XMLNWihO65P4Rys0DNd/2RN
	LVBdEqlZbJgx0Zgacs9wIKj45Cy4W8COlzVwvtl98U/g4TPjwkZirrO3+TgYbwIrzRdIb//FZi7yS
	0c4uZE8ZF2Z2BVgMGZHCIsthXUVFCXiIZdvRRcrxegS8QZozwH99iByOmATjoc3fuJ1Uq8/O1HuxS
	SGV2l2XkWAN7K52ZKP8EMdfhSeSSzYuxGNob70iJBpcBDtlgQlRXUgokxoJ5D+4i5Tt8ktsLe11j9
	gqOzvy9nCGec8Y5abF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2TMY-00000006xOp-36ca;
	Wed, 09 Apr 2025 11:12:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SO4-00000006nY6-2eAK;
	Wed, 09 Apr 2025 10:10:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=qda02ckRmF+6SnZ2BgMQh0F/UVFFdGl2Pqu7Ga7HXN4=; b=XO2fF4UyxfGAe8o/TIBZ3oaw6u
	2eBzh1Mt+TQO1bAvsSFfvN1v5Mph28Jr7F8EBsomGozEofCpqjiW6weNBRGKXLbnltWIppRZASW69
	ZQ43ndpTyx1TKpVHQJo5vQSLLac+ahKoqU4CjbCcGH8zoTp6/y7eGHRcsCw7lPsu80nzRKcqV59tE
	fFbdgPxLPrpmE8LiH6EjMb8Wb12JYqqqF0oQtnvNB4FvPYC8jA8rF+ucgk5lfD80/bJNIJaY+jBCu
	xHx1ZjIEeUBRhYAx2Q5C5FuJ3JACEZ3qoRaIXjYuuyerPLw260a8U+bgkqDckR9aW6b7acjoD/FM1
	a0WWLn9w==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2SO1-00000008ZwE-1P4h;
	Wed, 09 Apr 2025 10:10:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D860F45426;
	Wed,  9 Apr 2025 10:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5DCAC4CEE3;
	Wed,  9 Apr 2025 10:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744193423;
	bh=4ztBQyoanieoKs9OTTceiNvpf/RWS8ZPBb//xn5jov8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dFID15ZNeiCoJdac35gYsEbpDFHxZtnxup0htMt2eLG0vVVoCHGx4dD6IFoAxiBeT
	 WH1x43zrXfi6Cheassia6Yf+XpyC4rBnFn8uGIuvnCIAfRWHf9vXkaE0AI/wTfESn4
	 sppKrvIvtK4+fheWn/u8h/4VFo+DAWIroO/N9ZdWbDcwIL5xcjDU1BC7Adoz8TJARK
	 73xHEYSQ1gT3CitgU5oGMq18AAAbt8w8s9YLsWXOfV5qK4yAGSl1YXKHEojErm3JEi
	 S+5xrp2yJXa+C0XGk9U4oocnF8Cwm7zcQLxkiQaS9VVM5YOu9ECWiELzPJXf/ysEFG
	 +8Hn7ehGqv+vg==
Message-ID: <21698603-2780-4f23-8a77-7be98fdd3ab3@kernel.org>
Date: Wed, 9 Apr 2025 12:10:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
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
 <a71f45fc-d266-447d-8fb0-1ff0897f5bff@whut.edu.cn>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <a71f45fc-d266-447d-8fb0-1ff0897f5bff@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_111025_819488_430C7CDB 
X-CRM114-Status: UNSURE (   8.58  )
X-CRM114-Notice: Please train this message.
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

T24gMDkvMDQvMjAyNSAxMTo0MywgWmUgSHVhbmcgd3JvdGU6Cj4+PiArCXByaXYtPnBoeSA9IGRl
dm1fcGh5X2NyZWF0ZShkZXYsIE5VTEwsICZzcGFjZW1pdF9jb21icGh5X29wcyk7Cj4+PiArCWlm
IChJU19FUlIocHJpdi0+cGh5KSkKPj4+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgUFRS
X0VSUihwcml2LT5waHkpLAo+Pj4gKwkJCQkgICAgICJmYWlsZWQgdG8gY3JlYXRlIGNvbWJwaHlc
biIpOwo+Pj4gKwo+Pj4gKwlkZXZfc2V0X2RydmRhdGEoZGV2LCBwcml2KTsKPj4+ICsJcGh5X3Nl
dF9kcnZkYXRhKHByaXYtPnBoeSwgcHJpdik7Cj4+IEJvdGggbWFrZSBubyBzZW5zZS4gTG9vayB3
aGF0IHRoaXMgZnVuY3Rpb24gZG9lcy4KPiAKPiBJdCBkb2VzIHNlZW0gcmVkdW5kYW50IGF0IGZp
cnN0IGdsYW5jZSwgYnV0IHBkZXYtPmRldiBpcyB0aGUgcGFyZW50IG9mIAo+IHBoeS0+ZGV2Lgo+
IHBkZXYtPmRldi0+ZHJpdmVyX2RhdGEgd2lsbCBiZSB1c2VkIGluIHNwYWNlbWl0X2NvbWJwaHlf
eGxhdGUoKQo+IHBoeS0+ZGV2LT5kcml2ZXJfZGF0YcKgIHdpbGwgYmUgdXNlZCBpbiBwaHlfb3Bz
IGZ1bmN0aW9ucwo+IAo+IEkndmUgY2hlY2tlZCBzb21lIG90aGVyIGRyaXZlcnMgdGhhdCBkaWQg
dGhlIHNhbWU6Cj4gIMKgwqDCoCAtIHBoeS16eW5xbXAuYyBhdCBsaW5lcyA5OTAgYW5kIDEwMjYK
PiAgwqDCoMKgIC0gcGh5LXJvY2tjaGlwLXNhbXN1bmctaGRwdHguYyBhdCBsaW5lcyAxOTg5IGFu
ZCAyMDAwCgpJbmRlZWQsIHJpZ2h0LiBJdCdzIGZpbmUuCgpCZXN0IHJlZ2FyZHMsCktyenlzenRv
ZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
