Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C6A4FD5307
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Feb 2026 07:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LP1qgwNu1HXROwTyDuS/4FHx9SOz0IZitWJoN8UcE/Q=; b=ZfuoC97B2BOoo9
	VNMX9QSzXg5jcUxV/heJxQlJ96qAtnysnovJkNY/sRzJ7QcO+CCS74PDZj5UYbZJso2VO7F0xdHuJ
	EKsDK7gLJwUmDwh34oM2VZ69w7bcIxedNXMvnK1BIW0RnplyfIjwuLhR52ji6j3T6cs4inLXReEY1
	fk4wF3+sTipDk8qiryZX5FzE4HJTDyuOWd64v53EnQxix64867+HKk0qU6kPEPAcR+qYxBAYJ7CFW
	ivopWXiuXzrh9rR5KswOb2hYm29AHViDbbnMjqrIo1sKK5AvWntiiFCALqpEiC+93x9/mIXZ+8vFX
	ONk+FRaVBIl+ve3qw7vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsSo-00000007uDA-42sJ;
	Fri, 27 Feb 2026 07:40:42 +0000
Received: from s3.sipsolutions.net ([2a01:4f8:242:246e::2] helo=sipsolutions.net)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvsSm-00000007uCN-04HB;
	Fri, 27 Feb 2026 07:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=V6J0SL9RsbUQWhN8iu+ey8pLnEs4VtLYMczUYtzIoAc=;
	t=1772178039; x=1773387639; b=ocma0MZIuXziW7lVh/1E1Go3lVZm87iiHWwbamFyj9KsjK2
	ihnkU0Xkjll+4MCeX6dkwdr7neACMPj1Vu7HQhfI24NqjBGFJGCzf9CFfNz3L8UAEXWpLvDXw5h3q
	HkPk3AUrl0JcsVIcbtBpTP/6Aife6hS0USV6ITM/HpUwgdNr1k1sK6OYhTATIkVgc/km7CpMGDazi
	Y5J5wlYaL5p5OH+nFQyysOTLMBaHIvV2pf/+YSBpXqi5lIjTHh2ojJmlrMpeye5W3u3pMaYzPd03e
	AXrU831528yWeev6QzQuJ/b+s9hs0kgENclbwfzC8lrpYO5gzKOCnblALSiivpYw==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vvsRx-00000003Eus-2oGQ;
	Fri, 27 Feb 2026 08:39:49 +0100
Message-ID: <4f69d30f952bc374e69f44786f662886c30058e9.camel@sipsolutions.net>
Subject: Re: [PATCH 03/25] um/xor: don't override XOR_SELECT_TEMPLATE
From: Johannes Berg <johannes@sipsolutions.net>
To: Richard Weinberger <richard@nod.at>, hch <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Magnus
 Lindholm <linmag7@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, will <will@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin	 <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens	 <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, davem <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>,  anton ivanov <anton.ivanov@cambridgegreys.com>,
 Thomas Gleixner <tglx@kernel.org>, mingo <mingo@redhat.com>,  bp
 <bp@alien8.de>, dave hansen <dave.hansen@linux.intel.com>, x86
 <x86@kernel.org>, hpa	 <hpa@zytor.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, dan j williams	 <dan.j.williams@intel.com>,
 Chris Mason <clm@fb.com>, David Sterba	 <dsterba@suse.com>, Arnd Bergmann
 <arnd@arndb.de>, Song Liu <song@kernel.org>,  Yu Kuai <yukuai@fnnas.com>,
 Li Nan <linan122@huawei.com>, linux-alpha <linux-alpha@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  loongarch
 <loongarch@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv	 <linux-riscv@lists.infradead.org>, linux-s390
 <linux-s390@vger.kernel.org>,  sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>,
 linux-arch	 <linux-arch@vger.kernel.org>, linux-raid
 <linux-raid@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 27 Feb 2026 08:39:47 +0100
In-Reply-To: <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
References: <20260226151106.144735-1-hch@lst.de>
	 <20260226151106.144735-4-hch@lst.de>
	 <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_234040_079165_9AC218B7 
X-CRM114-Status: GOOD (  14.21  )
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

T24gVGh1LCAyMDI2LTAyLTI2IGF0IDIyOjQ1ICswMTAwLCBSaWNoYXJkIFdlaW5iZXJnZXIgd3Jv
dGU6Cj4gLS0tLS0gVXJzcHLDvG5nbGljaGUgTWFpbCAtLS0tLQo+ID4gVm9uOiAiaGNoIiA8aGNo
QGxzdC5kZT4KPiA+IFhPUl9TRUxFQ1RfVEVNUExBVEUgaXMgb25seSBldmVyIGNhbGxlZCB3aXRo
IGEgTlVMTCBhcmd1bWVudCwgc28gYWxsIHRoZQo+ID4gaWZkZWYnZXJ5IGRvZXNuJ3QgZG8gYW55
dGhpbmcuICBXaXRoIG91ciB3aXRob3V0IHRoaXMsIHRoZSB0aW1lIHRyYXZlbAo+ID4gbW9kZSBz
aG91bGQgd29yayBmaW5lIG9uIENQVXMgdGhhdCBzdXBwb3J0IEFWWDIsIGFzIHRoZSBBVlgyCj4g
PiBpbXBsZW1lbnRhdGlvbiBpcyBmb3JjZWQgaW4gdGhpcyBjYXNlLCBhbmQgd29uJ3Qgd29yayBv
dGhlcndpc2UuCj4gCj4gSUlSQyBKb2hhbm5lcyBhZGRlZCBYT1JfU0VMRUNUX1RFTVBMQVRFKCkg
aGVyZSB0byBza2lwCj4gdGhlIHRlbXBsYXRlIHNlbGVjdGlvbiBsb2dpYyBiZWNhdXNlIGl0IGRp
ZG4ndCB3b3JrIHdpdGggdGltZSB0cmF2ZWwgbW9kZS4KPiAKPiBKb2hhbm5lcywgY2FuIHlvdSBw
bGVhc2UgdGVzdCB3aGV0aGVyIHRoaXMgY2hhbmdlIGRvZXMgbm90IGJyZWFrCj4gdGltZSB0cmF2
ZWwgbW9kZT8KCkl0IGRvZXMgd29yaywgZXZlbiBpZiBpdCByZXBvcnRzIG5vbnNlbnNlIChhcyB5
b3UnZCBleHBlY3QpOgoKeG9yOiBtZWFzdXJpbmcgc29mdHdhcmUgY2hlY2tzdW0gc3BlZWQKICAg
cHJlZmV0Y2g2NC1zc2UgIDogMTI4MTYwMDAgTUIvc2VjCiAgIHNzZSAgICAgICAgICAgICA6IDEy
ODE2MDAwIE1CL3NlYwp4b3I6IHVzaW5nIGZ1bmN0aW9uOiBwcmVmZXRjaDY0LXNzZSAoMTI4MTYw
MDAgTUIvc2VjKQoKSSB0aGluayBpdCB3b3JrcyBub3cgYmVjYXVzZSB0aGUgbG9vcCBpcyB1c2lu
ZyBrdGltZSBhbmQgaXMgYm91bmRlZCBieQpSRVBTLCBzaW5jZSBjb21taXQgYzA1NWUzZWFlMGYx
ICgiY3J5cHRvOiB4b3IgLSB1c2Uga3RpbWUgZm9yIHRlbXBsYXRlCmJlbmNobWFya2luZyIpLgoK
VGhlIFJBSUQgc3BlZWQgc2VsZWN0IHN0aWxsIGhhbmdzLCBidXQgd2UndmUgZ290dGVuIHRoYXQg
cmVtb3ZlZCB2aWEKS2NvbmZpZywgc28gdGhhdCdzIGFscmVhZHkgaGFuZGxlZC4gUGVyaGFwcyBy
YWlkNl9jaG9vc2VfZ2VuKCkgc2hvdWxkCnVzZSBhIHNpbWlsYXIgYWxnb3JpdGhtPyBCdXQgZm9y
IFVNTCBpdCBkb2Vzbid0IHJlYWxseSBtYXR0ZXIgc2luY2UKQ09ORklHX1JBSUQ2X1BRX0JFTkNI
TUFSSyBleGlzdHMuCgoKQXMgZmFyIGFzIEFWWDIgaXMgY29uY2VybmVkLCB5ZWFoLCBJIGd1ZXNz
IHRoYXQgd2FzIGEgYnVnLCBidXQgZXZpZGVudGx5Cm5vYm9keSAod2hvIGNvbmZpZ3VyZWQgdGlt
ZS10cmF2ZWwpIGV2ZXIgY2FyZWQgLSB3aGF0IF9kaWRfIG1hdHRlcgp0aG91Z2ggaW4gcHJhY3Rp
Y2UgaXMgdGhhdCB0aGUgYm9vdCBub3QgZ2V0IHN0dWNrIGVudGlyZWx5Li4uIFR3bwpjb21wbGV0
ZWx5IHNlcGFyYXRlIGlzc3Vlcy4KCmpvaGFubmVzCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
