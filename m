Return-Path: <SRS0=9QI1=LA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8979C47096
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 07:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4939261244
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Jun 2021 07:41:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4939261244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7drnu4hJrjiUCcCmMKBQ2vicP8AFmWP6j/wpejpqwqQ=; b=E0wkiTvGjJ+pQaX/5t/W7Rw+Lh
	pqBvso+kJhetg/8AgT1ZOM2plRM/ecggfNrOOraOZS+ypLW7ODhz4T/CvGR1dMX8dSDXWQHolAbKt
	vQvi+6/an70Pe8+uhySZI0cltaPXG7LVlr8VPXgm1JsG+k2EIv1WVv83k7w9VVMCDQ8YNek2GiUyj
	B1N0ZWNCTIY5uboskodNkbdGGWYW/tZV54PMwknY11IM3TzAPw4m/jPGaCq/ZGMgZJFbdmT3g2O74
	CcrsH5gMSCJtB4Vm+VqlknlMHfHjOmVF5FXtyAoOKw8pwIUFAhxxzZC/4BHYo341YroP3Tv+l2bEP
	GhUx5+DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpnOy-00HYmg-GG; Sun, 06 Jun 2021 07:40:56 +0000
Received: from relay4-d.mail.gandi.net ([217.70.183.196])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpnOv-00HYm1-MK
 for linux-riscv@lists.infradead.org; Sun, 06 Jun 2021 07:40:55 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 89713E0002;
 Sun,  6 Jun 2021 07:40:44 +0000 (UTC)
Subject: Re: [PATCH -fixes] riscv: Fix BUILTIN_DTB for sifive and microchip soc
To: Arnd Bergmann <arnd@arndb.de>
Cc: Rob Herring <robh+dt@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, DTML <devicetree@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210604120639.1447869-1-alex@ghiti.fr>
 <CAK8P3a1TiSNoqUEjTaqPyqnU8d0-p-yZkrsvmXt5fo4Rkfue_w@mail.gmail.com>
 <1287f6f3-2f07-3269-9048-8f7d08eecc09@ghiti.fr>
 <CAK8P3a1_N6dAdjWR10FtgaVz828o7W5Mp55DO3Ex+3en-ikOUw@mail.gmail.com>
From: Alex Ghiti <alex@ghiti.fr>
Message-ID: <5d3a00d1-9e45-398a-39cf-1e6e9924eb18@ghiti.fr>
Date: Sun, 6 Jun 2021 09:40:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <CAK8P3a1_N6dAdjWR10FtgaVz828o7W5Mp55DO3Ex+3en-ikOUw@mail.gmail.com>
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_004053_885150_922AAEB8 
X-CRM114-Status: GOOD (  20.08  )
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

TGUgNS8wNi8yMDIxIMOgIDEzOjAwLCBBcm5kIEJlcmdtYW5uIGEgw6ljcml0wqA6Cj4gT24gU2F0
LCBKdW4gNSwgMjAyMSBhdCA4OjM3IEFNIEFsZXggR2hpdGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3Rl
Ogo+PiBMZSA0LzA2LzIwMjEgw6AgMTU6MDgsIEFybmQgQmVyZ21hbm4gYSDDqWNyaXQgOgo+Pj4g
T24gRnJpLCBKdW4gNCwgMjAyMSBhdCAyOjA2IFBNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBnaGl0
aS5mcj4gd3JvdGU6Cj4+Pj4KPj4+PiBGaXggQlVJTFRJTl9EVEIgY29uZmlnIHdoaWNoIHJlc3Vs
dGVkIGluIGEgZHRiIHRoYXQgd2FzIGFjdHVhbGx5IG5vdCBidWlsdAo+Pj4+IGludG8gdGhlIExp
bnV4IGltYWdlOiBpbiB0aGUgc2FtZSBtYW5uZXIgYXMgQ2FuYWFuIHNvYyBkb2VzLCBjcmVhdGUg
YW4gb2JqZWN0Cj4+Pj4gZmlsZSBmcm9tIHRoZSBkdGIgZmlsZSB0aGF0IHdpbGwgZ2V0IGxpbmtl
ZCBpbnRvIHRoZSBMaW51eCBpbWFnZS4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRy
ZSBHaGl0aSA8YWxleEBnaGl0aS5mcj4KPj4+Cj4+PiBBbG9uZyB0aGUgc2FtZSBsaW5lcyBhcyB0
aGUgY29tbWVudCB0aGF0IEppc2hlbmcgWmhhbmcgbWFkZSBvbiB0aGUgZml4ZWQKPj4+IGFkZHJl
c3MsIGJ1aWxkaW5nIGEgZHRiIGludG8gdGhlIGtlcm5lbCBpdHNlbGYgZnVuZGFtZW50YWxseSBi
cmVha3MgZ2VuZXJpYwo+Pj4ga2VybmVsIGltYWdlcy4KPj4+Cj4+PiBJIGNhbiB1bmRlcnN0YW5k
IHVzaW5nIGl0IG9uIEsyMTAsIHdoaWNoIGlzIGV4dHJlbWVseSBsaW1pdGVkIGFuZCB3b3VsZG4n
dAo+Pj4gcnVuIGEgZ2VuZXJpYyBrZXJuZWwgYW55d2F5LCBidXQgZm9yIG5vcm1hbCBwbGF0Zm9y
bXMgbGlrZSBtaWNyb2NoaXAgYW5kCj4+PiBzaWZpdmUsIGl0IHdvdWxkIGJlIGJldHRlciB0byBk
aXNhbGxvdyBDT05GSUdfQlVJTFRJTl9EVEIgaW4gS2NvbmZpZwo+Pj4gYW5kIHJlcXVpcmUgYSBu
b24tYnJva2VuIGJvb3QgbG9hZGVyLgo+Pgo+PiBJIGtpbmQgb2YgZGlzYWdyZWUgYmVjYXVzZSBp
ZiBJIHdhbnQgdG8gYnVpbGQgYSBjdXN0b20ga2VybmVsIGZvciB0aG9zZQo+PiBwbGF0Zm9ybXMg
d2l0aCBhIGJ1aWx0aW4gZHRiIGZvciBzb21lIHJlYXNvbnMgKGRlYnVnLCBkZXZlbG9wbWVudC4u
RXRjKSwKPj4gSSB0aGluayBJIHNob3VsZCBiZSBhYmxlIHRvIGRvIHNvLgo+IAo+IEhvdyBpcyB0
aGUgYnVpbHRpbiBkdGIgYmV0dGVyIHRoYW4gYXBwZW5kZWQgZHRiLCBvciBwYXNzaW5nIHRoZSBk
dGIgdG8gdGhlCj4gYm9vdCBsb2FkZXIgaW4gdGhhdCBjYXNlPwoKQWggbmV2ZXIgc2FpZCBpdCB3
YXMgYmV0dGVyLCBqdXN0IGl0IHdhcyBhdmFpbGFibGUgc28gdGhlcmUgaXMgbm8gcmVhc29uIAp3
ZSBjb3VsZCBub3QgYWxsb3cgaXQgOikKCj4gCj4gICAgICAgICAgIEFybmQKPiAKPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cj4gCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
