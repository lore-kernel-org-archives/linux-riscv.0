Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D87B1CAC5B5
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 11:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7MD8tlfTsa/BDsSI3OJIi/1xMEqrNPoz9sXeUu2ZRpg=; b=3IM6fj+2u7yRX3
	jRICfkbStnaUNrJaH84km6b4lDCk0Q6IXiExrMQMm0NKxo9yzYZt/Ve1SiDVZ0y66V8h8/8CjbLfH
	3i23TI1eEB6Yf9gnxSNRocMSg4u48Tp/DIWI+UeGDmjStEU6fVLpeg3pPcTcfiKgGa4Aa6N9mLJs6
	9tZU+p4uKUMAiRMMVDA5JaUIVQkdV8a9x998zjT3fJygsyMudGUi/zzRxViXlUCqnM6TYakLaZgCY
	oE6cm6eTnysY+j8wmTetnA8yPUcyb9NOSSt8kcFQDl0E9yTMntUookXFJ5D+uoVgv7a54AtfKL/iZ
	WxmN/Rphgancs5bEjFyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pLP-0000000F99c-2Uch;
	Sun, 28 Sep 2025 11:13:31 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2pLM-0000000F98L-1xqg
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 11:13:29 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 21148340D30;
	Sun, 28 Sep 2025 11:13:26 +0000 (UTC)
Date: Sun, 28 Sep 2025 19:13:21 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Jesse T <mr.bossman075@gmail.com>
Cc: Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v2] i2c: spacemit: configure ILCR for accurate SCL
 frequency
Message-ID: <20250928111321-GYB1346428@gentoo.org>
References: <20250718-k1-i2c-ilcr-v2-1-b4c68f13dcb1@linux.spacemit.com>
 <CAJFTR8RGT0JFcsSODEgyWgJYKj6QhWa7=5Tm9_6U4Pkv56X=-g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJFTR8RGT0JFcsSODEgyWgJYKj6QhWa7=5Tm9_6U4Pkv56X=-g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250928_041328_538179_81E18B56 
X-CRM114-Status: GOOD (  17.28  )
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

SGkgSmVzc2UsCgpPbiAyMzozNyBUaHUgMTcgSnVsICAgICAsIEplc3NlIFQgd3JvdGU6Cj4gT24g
VGh1LCBKdWwgMTcsIDIwMjUgYXQgOTowOOKAr1BNIFRyb3kgTWl0Y2hlbGwKPiA8dHJveS5taXRj
aGVsbEBsaW51eC5zcGFjZW1pdC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoZSBTcGFjZW1pVCBJMkMg
Y29udHJvbGxlcidzIFNDTCAoU2VyaWFsIENsb2NrIExpbmUpIGZyZXF1ZW5jeSBmb3IKPiA+IG1h
c3RlciBtb2RlIG9wZXJhdGlvbnMgaXMgZGV0ZXJtaW5lZCBieSB0aGUgSUxDUiAoSTJDIExvYWQg
Q291bnQgUmVnaXN0ZXIpLgo+ID4gUHJldmlvdXNseSwgdGhlIGRyaXZlciByZWxpZWQgb24gdGhl
IGhhcmR3YXJlJ3MgcmVzZXQgZGVmYXVsdAo+ID4gdmFsdWVzIGZvciB0aGlzIHJlZ2lzdGVyLgo+
ID4KPiA+IFRoZSBoYXJkd2FyZSdzIGRlZmF1bHQgSUxDUiB2YWx1ZXMgKFNMVj0weDE1NiwgRkxW
PTB4NWQpIHlpZWxkIFNDTAo+ID4gZnJlcXVlbmNpZXMgbG93ZXIgdGhhbiBpbnRlbmRlZC4gRm9y
IGV4YW1wbGUsIHdpdGggdGhlIGRlZmF1bHQKPiA+IDMxLjUgTUh6IGlucHV0IGNsb2NrLCB0aGVz
ZSBkZWZhdWx0IHNldHRpbmdzIHJlc3VsdCBpbiBhbiBTQ0wKPiA+IGZyZXF1ZW5jeSBvZiBhcHBy
b3hpbWF0ZWx5IDkzIGtIeiAoc3RhbmRhcmQgbW9kZSkgd2hlbiB0YXJnZXRpbmcgMTAwIGtIeiwK
PiA+IGFuZCBhcHByb3hpbWF0ZWx5IDMzOCBrSHogKGZhc3QgbW9kZSkgd2hlbiB0YXJnZXRpbmcg
NDAwIGtIei4KPiA+IFRoZXNlIGZyZXF1ZW5jaWVzIGFyZSBiZWxvdyB0aGUgMTAwIGtIei80MDAg
a0h6IG5vbWluYWwgc3BlZWRzLgo+ID4KPiA+IFRoaXMgcGF0Y2ggaW50ZWdyYXRlcyB0aGUgU0NM
IGZyZXF1ZW5jeSBtYW5hZ2VtZW50IGludG8KPiA+IHRoZSBDb21tb24gQ2xvY2sgRnJhbWV3b3Jr
IChDQ0YpLiBTcGVjaWZpY2FsbHksIHRoZSBJTENSIHJlZ2lzdGVyLAo+ID4gd2hpY2ggYWN0cyBh
cyBhIGZyZXF1ZW5jeSBkaXZpZGVyIGZvciB0aGUgU0NMIGNsb2NrLCBpcyBub3cgcmVnaXN0ZXJl
ZAo+ID4gYXMgYSBtYW5hZ2VkIGNsb2NrIChzY2xfY2xrKSB3aXRoaW4gdGhlIENDRi4KPiA+Cj4g
PiBUaGlzIHBhdGNoIGFsc28gY2xlYW5zIHVwIHVubmVjZXNzYXJ5IHdoaXRlc3BhY2UKPiA+IGlu
IHRoZSBpbmNsdWRlZCBoZWFkZXIgZmlsZXMuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogVHJveSBN
aXRjaGVsbCA8dHJveS5taXRjaGVsbEBsaW51eC5zcGFjZW1pdC5jb20+Cj4gPiAtLS0KCi4uW3Nu
aXBdCj4gPgo+ID4gK3N0YXRpYyBzdHJ1Y3QgY2xrICpzcGFjZW1pdF9pMmNfcmVnaXN0ZXJfc2Ns
X2NsayhzdHJ1Y3Qgc3BhY2VtaXRfaTJjX2RldiAqaTJjLAo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBjbGsgKnBhcmVudCkKPiA+ICt7
Cj4gPiArICAgICAgIHN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQ7Cj4gPiArICAgICAgIGNoYXIg
bmFtZVszMl07Cj4gPiArCj4gPiArICAgICAgIHNucHJpbnRmKG5hbWUsIHNpemVvZihuYW1lKSwg
IiVzX3NjbF9jbGsiLCBkZXZfbmFtZShpMmMtPmRldikpOwo+ID4gKwo+ID4gKyAgICAgICBpbml0
Lm5hbWUgPSBuYW1lOwo+ID4gKyAgICAgICBpbml0Lm9wcyA9ICZzcGFjZW1pdF9pMmNfY2xrX29w
czsKPiA+ICsgICAgICAgaW5pdC5wYXJlbnRfZGF0YSA9IChzdHJ1Y3QgY2xrX3BhcmVudF9kYXRh
W10pIHsKPiA+ICsgICAgICAgICAgICAgICB7IC5md19uYW1lID0gImZ1bmMiIH0sCj4gCj4gSXMg
ImZ1bmMiIGEgcGxhY2Vob2xkZXI/IENhbiB3ZSBuYW1lIGl0IGkyY19zY2xfY2xrPwo+IApubywg
aXQncyB0aGUgcGFyZW50IGNsayBvZiBzY2wgdGhhdCBuZWVkIHRvIHJlcXVlc3QsIHdoaWNoIGNv
cnJlc3BvbmQgdG8KdGhlIERUIG5vZGUgCgogICAgICBjbG9ja3MgPSA8JnN5c2Nvbl9hcGJjIENM
S19UV1NJOD4sCiAgICAgICAgICAgICAgICAuLgogICAgICBjbG9jay1uYW1lcyA9ICJmdW5jIiwg
Li4KCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
