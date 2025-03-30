Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05ADFC28B20
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Mar 2025 12:26:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JxeuDzOmDm9k2hRxpKVa0I/roUZ/564HcXqw45nFGj8=; b=GjKQcXDtjwVfjS
	cNOHTJWrvXAUyEVG5UdtTa1VzeIMpWMHH94JsFgZIB6iIXBY5HgYonl0r9/q9cwj5UPDvTPetXGS9
	B6IwqJ1ZbjfDXjYazFzooDktGdIfCFSbnMeh90wCBdmFlBNkKmlDtno0iKfzwBJqYlvTzcaATKy1b
	GmX+ZCbamZRGMBLgwQenpNFOCP1tvUo6hmbTchycXI2ZPYvlkfnibAwHkJdfaiR75RiI3/IRmW840
	Nxqt6ykLU6pAqkMlFGSmrkh3HHwyrQqqPotDu4Hxk+0/XmA7Nbcdi0ciAfrc2LkmB698D1/7SW7Oi
	ZEsPuG6Xio7jPn2olVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrk8-0000000GCPr-3VPS;
	Sun, 30 Mar 2025 12:26:24 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyrcB-0000000GBdh-0qur
	for linux-riscv@lists.infradead.org;
	Sun, 30 Mar 2025 12:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1743337086;
	bh=UqhtKa70a5/2askHmDGMX26oUmyn54ientlmKEHX2lk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Ezlj5uz3KLCvLbixTDOfWM9JMvtSf6orMo8URoeZQs3kdZh4iirzBLX+p/eyrYfja
	 ++VOhAphiak2/zxRHBW/Gc97Xy9SPbqtRUV5C+DRojnIIrH5Sud+ZSTAwxS69XVtcK
	 RIAIedtBk6vzb9t1cyvyE3n3m0L/1kXqBjVx2+yw=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 428AE659C8;
	Sun, 30 Mar 2025 08:18:04 -0400 (EDT)
Message-ID: <42dc2fc95fc9d56abd68ec620b29602eef9aa742.camel@xry111.site>
Subject: Re: Ping: [PATCH 0/3] Drop explicit --hash-style= setting for new
From: Xi Ruoyao <xry111@xry111.site>
To: Guo Ren <guoren@kernel.org>
Cc: Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Fangrui Song <i@maskray.me>, Tiezhu
 Yang <yangtiezhu@loongson.cn>, 	linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, 	linux-riscv@lists.infradead.org,
 linux-arch@vger.kernel.org, 	linux-kernel@vger.kernel.org
Date: Sun, 30 Mar 2025 20:18:02 +0800
In-Reply-To: <CAJF2gTRXyMX+9C_aEDbxAsxWDD2rbnDWO775YDZ3EmrQ=QinfQ@mail.gmail.com>
References: <20250224112042.60282-1-xry111@xry111.site>
	 <91797ac4bbe27d7d60b89053050e429bcd630db3.camel@xry111.site>
	 <CAJF2gTRXyMX+9C_aEDbxAsxWDD2rbnDWO775YDZ3EmrQ=QinfQ@mail.gmail.com>
User-Agent: Evolution 3.56.0 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_051811_279482_C970F5C4 
X-CRM114-Status: GOOD (  14.91  )
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

T24gTW9uLCAyMDI1LTAzLTEwIGF0IDEwOjEzICswODAwLCBHdW8gUmVuIHdyb3RlOgo+IE9uIFdl
ZCwgTWFyIDUsIDIwMjUgYXQgOToyN+KAr1BNIFhpIFJ1b3lhbyA8eHJ5MTExQHhyeTExMS5zaXRl
PiB3cm90ZToKPiA+IAo+ID4gUGluZy4KPiA+IAo+ID4gT24gTW9uLCAyMDI1LTAyLTI0IGF0IDE5
OjIwICswODAwLCBYaSBSdW95YW8gd3JvdGU6Cj4gPiA+IEZvciByaXNjdiwgY3NreSwgYW5kIExv
b25nQXJjaCwgR05VIGhhc2ggaGFkIGFscmVhZHkgYmVjb21lIHRoZSBkZS0KPiA+ID4gZmFjdG8K
PiA+ID4gc3RhbmRhcmQgd2hlbiB0aGV5IGJvcm5lZCwgc28gdGhlcmUncyBubyBHbGliYy9NdXNs
IHJlbGVhc2VzIGZvciB0aGVtCj4gPiA+IHdpdGhvdXQgR05VIGhhc2ggc3VwcG9ydCwgYW5kIHRo
ZSB0cmFkaXRpb25hbCBTeXNWIGhhc2ggaXMganVzdAo+ID4gPiB3YXN0aW5nCj4gPiA+IHNwYWNl
IGZvciB0aGVtLgo+ID4gPiAKPiA+ID4gUmVtb3ZlIHRob3NlIHNldHRpbmdzIGFuZCBmb2xsb3cg
dGhlIGRpc3RybyB0b29sY2hhaW4gZGVmYXVsdCwgd2hpY2gKPiA+ID4gaXMKPiA+ID4gbGlrZWx5
IC0taGFzaC1zdHlsZT1nbnUuwqAgSW4gdGhlIHBhc3QgaXQgY291bGQgYnJlYWsgdkRTTyBzZWxm
IHRlc3RzLAo+ID4gPiBidXQgbm93IHRoZSBpc3N1ZSBoYXMgYmVlbiBhZGRyZXNzZWQgYnkgY29t
bWl0Cj4gPiA+IGUwNzQ2YmRlNmY4MiAoInNlbGZ0ZXN0cy92RFNPOiBzdXBwb3J0IERUX0dOVV9I
QVNIIikuCj4gPiA+IAo+ID4gPiBYaSBSdW95YW8gKDMpOgo+ID4gPiDCoCByaXNjdjogdkRTTzog
UmVtb3ZlIC0taGFzaC1zdHlsZT1ib3RoCj4gVGhlIHBhdGNoJ3MgY29tbWVudCBpcyBpbmNvcnJl
Y3Q7IHdoZW4gSSByZW1vdmVkIC0taGFzaC1zdHlsZT1ib3RoLAo+IHRoZSBvdXRwdXQgc3RpbGwg
Y29udGFpbmVkIHRoZSBIQVNILCBhbmQgbm8gc3BhY2Ugd2FzIHNhdmVkLgoKVGhlIGlkZWEgaXMg
Zm9sbG93aW5nIHRoZSBkaXN0cm8gdG9vbGNoYWluIGRlZmF1bHQgKHdoaWNoIGNhbiBiZQpjb25m
aWd1cmVkIGJ1aWxkaW5nIGJpbnV0aWxzKS4KCklmIHRoZSBkaXN0cm8gdG9vbGNoYWluIGRlZmF1
bHQgaXMgZ251LCB3ZSdsbCB1c2UgZ251LgoKSWYgdGhlIGRpc3RybyB0b29sY2hhaW4gZGVmYXVs
dCBpcyBib3RoLCB0aGUgZGlzdHJvIGlzIGFscmVhZHkgd2FzdGluZwpzcGFjZSBldmVyeXdoZXJl
IGZvciAoYSkgc29tZSBiaXphcnJlIGFwcGxpY2F0aW9ucyBkZXBlbmRpbmcgb24gRFRfSEFTSApm
b3Igc29tZSBiaXp6YXJlIHJlYXNvbjsgb3IgKGIpIGFuIG92ZXJzaWdodC4KCkluIHRoZSBjYXNl
IG9mIChhKSB0aGUgYml6YXJyZSBhcHBsaWNhdGlvbiBtYXkgbmVlZHMgRFRfSEFTSCBpbiB2RFNP
IGFzCndlbGwsIGFuZCBpbiB0aGUgY2FzZSBvZiAoYikgaXQgc2hvdWxkIGJlIGZpeGVkIGZvciB0
aGUgZW50aXJlIGRpc3RybywKbm90IG9ubHkgdkRTTywgZm9yIGV4YW1wbGUgd2hhdCB3ZSBhcmUg
ZG9pbmcgZm9yIEFPU0M6Cmh0dHBzOi8vZ2l0aHViLmNvbS9BT1NDLURldi9hb3NjLW9zLWFiYnMv
cHVsbC85NTMxCgotLSAKWGkgUnVveWFvIDx4cnkxMTFAeHJ5MTExLnNpdGU+ClNjaG9vbCBvZiBB
ZXJvc3BhY2UgU2NpZW5jZSBhbmQgVGVjaG5vbG9neSwgWGlkaWFuIFVuaXZlcnNpdHkKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
