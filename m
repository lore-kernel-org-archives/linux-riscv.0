Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D3FCA0EDB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Aug 2025 22:04:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PGjL+NGOYi5aValkbzDhqBENzzwQmXniCm2HlFlC7h8=; b=RJKBwbZtiw3pUf
	Pv11j8s3y6LVvQApBYoqDL8qPEtDBSUB75ylvyCVie9tAKAuGkWSHuhYbyKToScDC5SMvEHLFes4z
	qknk6O6EwexbEkzDHMvEx9Cs5HHx+vQGE/eiAVKdSGq4Bs9RSEeckm8WcEkrnjR2lGzUXIR61B4h2
	w5EDZEb5Wz9sG3kO5yeg2ZCjBsF6jdHqZblZgLfn0f2fJIPZeCAysaztuIfsLxpP9lkgm+qysfGt9
	ZmcZ0RZOgPEy9WjgLImDzN5JbI+bkFT7YYjhp5eNEi8wkzmYeSInAF2WC7eXn6g2joU4+IjIzmzgK
	YlQKYRBfW1ZYLlMSEnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulacv-00000009D4U-2VOK;
	Mon, 11 Aug 2025 22:04:21 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXeD-00000008qS4-2mOV
	for linux-riscv@lists.infradead.org;
	Mon, 11 Aug 2025 18:53:31 +0000
Message-ID: <d4bead1c-697a-46d8-ba9c-64292fccb19f@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754938405;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0R2bnIhPyR3QQbpGsQ2ZiExRLQ4FHglk5+SDpIvYRfw=;
	b=u136D40HAZRm2Ns4PIkj7lNjk9GpEzIDA0c6PL4vfZunBpXOL+T8bK9eSHezE+/ErbtzoA
	LFQBQRUjQbRcJ1FXpHpS4eMH3GHZTlm1PKk0cvRkbUEl1ubAtZ3EEn0ylwCcFNanSmEGhi
	3Gh+X8fqy4yk5tSREu0rhyEpC/kmjMI=
Date: Mon, 11 Aug 2025 14:53:19 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 12/18] net: macb: match skb_reserve(skb,
 NET_IP_ALIGN) with HW alignment
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-12-ff8207d0bb77@bootlin.com>
 <1a4fe95a-f029-43b2-aed1-594365254b6a@linux.dev>
 <DBWASGS8U4LN.1GMHL8A61VWU8@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <DBWASGS8U4LN.1GMHL8A61VWU8@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_115329_916740_E6B3DE6E 
X-CRM114-Status: GOOD (  14.55  )
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

T24gOC83LzI1IDExOjI0LCBUaMOpbyBMZWJydW4gd3JvdGU6Cj4gT24gVHVlIEp1bCAxLCAyMDI1
IGF0IDY6NDAgUE0gQ0VTVCwgU2VhbiBBbmRlcnNvbiB3cm90ZToKPj4gT24gNi8yNy8yNSAwNTow
OCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+Pj4gSWYgSFcgaXMgUlNDIGNhcGFibGUsIGl0IGNhbm5v
dCBhZGQgZHVtbXkgYnl0ZXMgYXQgdGhlIHN0YXJ0IG9mIElQCj4+Cj4+IFJlY2VpdmUtc2lkZSBj
b2FsZXNjaW5nPyBDYW4geW91IGFkZCBhIGJyaWVmIGRlc2NyaXB0aW9uIG9mIHRoaXMKPj4gZmVh
dHVyZSB0byB5b3VyIGNvbW1pdCBtZXNzYWdlPwo+IAo+IFllcyB0aGF0IGlzIFJlY2VpdmUgU2lk
ZSBDb2FsZXNjaW5nLiBDbGVhcmx5IGl0IG5lZWRzIHRvIGJlIG1lbnRpb25lZAo+IG91dCBsb3Vk
LCBhbmQgYnJpZWZseSBkZXNjcmliZWQuCj4gCj4+PiBwYWNrZXRzLiBBbGlnbm1lbnQgKGllIG51
bWJlciBvZiBkdW1teSBieXRlcykgaXMgY29uZmlndXJlZCB1c2luZyB0aGUKPj4+IFJCT0YgZmll
bGQgaW5zaWRlIHRoZSBOQ0ZHUiByZWdpc3Rlci4KPj4+IAo+Pj4gT24gdGhlIHNvZnR3YXJlIHNp
ZGUsIHRoZSBza2JfcmVzZXJ2ZShza2IsIE5FVF9JUF9BTElHTikgY2FsbCBtdXN0IG9ubHkKPj4+
IGJlIGRvbmUgaWYgdGhvc2UgZHVtbXkgYnl0ZXMgYXJlIGFkZGVkIGJ5IHRoZSBoYXJkd2FyZTsg
bm90aWNlIHRoZQo+Pj4gc2tiX3Jlc2VydmUoKSBpcyBkb25lIEFGVEVSIHdyaXRpbmcgdGhlIGFk
ZHJlc3MgdG8gdGhlIGRldmljZS4KPj4+IAo+Pj4gV2UgY2Fubm90IGRvIHRoZSBza2JfcmVzZXJ2
ZSgpIGNhbGwgQkVGT1JFIHdyaXRpbmcgdGhlIGFkZHJlc3MgYmVjYXVzZQo+Pj4gdGhlIGFkZHJl
c3MgZmllbGQgaWdub3JlcyB0aGUgbG93IDIvMyBiaXRzLiBDb25jbHVzaW9uOiBpbiBzb21lIGNh
c2VzLAo+Pj4gd2UgcmlzayBub3QgYmVpbmcgYWJsZSB0byByZXNwZWN0IHRoZSBORVRfSVBfQUxJ
R04gdmFsdWUgKHdoaWNoIGlzCj4+PiBwaWNrZWQgYmFzZWQgb24gdW5hbGlnbmVkIENQVSBhY2Nl
c3MgcGVyZm9ybWFuY2UpLgo+Pj4gCj4+PiBGaXhlczogNGRmOTUxMzFlYTgwICgibmV0L21hY2I6
IGNoYW5nZSBSWCBwYXRoIGZvciBHRU0iKQo+Pgo+PiBEbyBhbnkgZXhpc3RpbmcgTUFDQnMgc3Vw
cG9ydCBSU0M/IElzIHRoaXMgYSBmaXg/IAo+IAo+IEkgaGF2ZSBubyBpZGVhLiBJZiBhbnkgTUFD
QiBzdXBwb3J0cyBSU0MsIGl0IG11c3QgYmUgdGhvc2UgcnVubmluZyB3aXRoCj4gTkVUX0lQX0FM
SUdOPTAsIHNvIGFybTY0L3Bvd2VycGMveDg2Lgo+IAo+IElzIGl0IGEgZml4PyBXZSBjYW4gZ3Vl
c3MgdGhhdCBhbGwgYm9hcmRzIGZhbGwgaW4gZWl0aGVyIGNhdGVnb3J5Ogo+ICAtIERvbid0IHN1
cHBvcnQgUlNDICg9PiBSQk9GIHdvcmtzIGZpbmUpLgo+ICAtIFN1cHBvcnQgUlNDICg9PiBSQk9G
IG5vdCB3b3JraW5nKSBBTkQgTkVUX0lQX0FMSUdOPTAuCj4gCj4gQm90aCBvZiB0aG9zZSBhcmUg
bm90IGltcGFjdGVkLCBzbyB3ZSB0ZWNobmljYWxseSBkb24ndCBmaXggYW55dGhpbmcgZm9yCj4g
Y3VycmVudCB1c2Vycy4KCk9LLCB0aGVuIHBsZWFzZSBkcm9wIHRoZSBmaXhlcyB0YWcgdGhlbi4K
Ci0tU2VhbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
