Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B5FCA9EBE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 10:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8dX1ZxTL2lGHX0UkMZEoUUaumDGiHwitW9kyRZSt1L0=; b=zBmRnPmr5ePo+C
	YlSQZQGF8LyG+dRtdnmPIAs29g529ASVDPA/dV1Ah69cGyNee1ujaSE8FYqU6wmowlZTFf133Iqd3
	2rGEALASkrcd7kUMNhSqViLkI1CUAp722iHgrTpxRxlHIeFZCfs/N5/iYRDkjSgoeoFJCBIyT9Wqz
	sbnIzIMo5S8tqTfcEWYRbvR2TYGF67eSFlY2gi9sr9UKL/sOjN7bb92YKe208B3d4H6aF2TI5haGF
	iDHTJF683qlVYJ+dd4nrtpUzh+fRE8HEIKjjNsBq6t6c0N+tOvIdAQ3iue+kuSIBq9/KCruHvlcIo
	oaApxWghSdhAor7EHP3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyU-00000007osr-3AYZ;
	Sat, 10 Oct 2026 10:06:42 +0000
Received: from [117.135.210.9] (helo=m16.mail.126.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFTyQ-00000007os1-0t7Y;
	Sat, 10 Oct 2026 10:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:MIME-Version:From:Subject:To:
	Content-Type; bh=A4y04JzxldO260/+1JjQhaM7OPWp1qTRLmXAqMl3EHU=;
	b=d48qZgmD7kERcBnmME6e5d/+8X02i3aRnMPZ51by6aY+s0Mvxn6UmORGNrc14P
	GAs5qG3Cxdpp6rmfM/ardD0xQCs5jKmZ0tHvp4pcDtdiSY6HGwsdQxO5Q6OoPBVc
	qqu8kyMskMLqVaioNR3Z/WkUbk96NKBcA0a25t7oXN4SY=
Message-ID: <e550befe-8399-4349-8b67-6a01367db165@126.com>
Date: Sat, 10 Oct 2026 18:04:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Song Chen <chensong_2000@126.com>
Subject: Re: [RFC PATCH v2 0/3] btrfs: add error injection support for
 checksum verification
To: dsterba@suse.cz
Cc: arnd@arndb.de, kees@kernel.org, clm@fb.com, dsterba@suse.com,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, gor@linux.ibm.com,
 borntraeger@linux.ibm.com, agordeev@linux.ibm.com, svens@linux.ibm.com,
 tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
 dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
 jpoimboe@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260724021229.47302-1-chensong_2000@126.com>
 <20260907161330.GX9053@suse.cz>
Content-Language: en-US
In-Reply-To: <20260907161330.GX9053@suse.cz>
X-CM-TRANSID: PikvCgDnz_jADcpqUfIkBQ--.28557S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw47Cw4xCFWkWw15Kr1kAFb_yoW8trW5pr
	W8C3s3WrWrJrWxArsaya4Fv34Fkrs5W34UJFnrG34Ik3s3Za4kta1kK348u3W7ur48Gw17
	Z3WDKr4kWr1UAFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jDvtAUUUUU=
X-CM-SenderInfo: xfkh02prqjsjqqqqqiyswou0bp/xtbBsgLAQGrKDcJ3nQAA31
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_030639_386329_B16DF63A 
X-CRM114-Status: GOOD (  17.89  )
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

SGkgRGF2aWQsCgpJZiBubyBtYWludGFpbmVyIGVsc2Ugc2VlcyBpdCBhbmQgY29tbWVudHMsIGkn
bSBnb2luZyB0byBzZW5kIGEgbmV3IApwYXRjaCwgb25seSBrZWVwIGJ0cmZzIHBhcnQgYW5kIHdp
dGhkcmF3IHJlc3QsIGFuZCB0YWtlIGNhcmUgb2Ygc2FzaGlrbyAKY29tbWVudHMgYXMgd2VsbC4K
ClBsZWFzZSBzdGlsbCBmaW5kIGl0LCBtYW55IHRoYW5rcy4KCkJlc3QgcmVnYXJkcywKClNvbmcK
CgoK5ZyoIDIwMjYvOS84IDAwOjEzLCBEYXZpZCBTdGVyYmEg5YaZ6YGTOgo+IE9uIEZyaSwgSnVs
IDI0LCAyMDI2IGF0IDEwOjEyOjI2QU0gKzA4MDAsIFNvbmcgQ2hlbiB3cm90ZToKPj4gVGhpcyBw
YXRjaHNldCBhZGRzIGZhdWx0IGluamVjdGlvbiBzdXBwb3J0IGZvciBidHJmc19kYXRhX2NzdW1f
b2ssCj4+IGVuYWJsaW5nIGNvbnRyb2xsZWQgc2ltdWxhdGlvbiBvZiBjaGVja3N1bSBtaXNtYXRj
aGVzIHRvIHRlc3QgYnRyZnMKPj4gc2lsZW50IGRhdGEgY29ycnVwdGlvbiBkZXRlY3Rpb24gYW5k
IHJlcG9ydGluZyBwYXRocy4KPj4KPj4gVGhlIGZpcnN0IHBhdGNoIGV4dGVuZHMgdGhlIGVycm9y
IGluamVjdGlvbiBmcmFtZXdvcmsgd2l0aCBhIG5ldyB0eXBlLAo+PiBFSV9FVFlQRV9GQUxTRSwg
d2hpY2ggYWxsb3dzIGJvb2wtcmV0dXJuaW5nIGZ1bmN0aW9ucyB0byBiZSBvdmVycmlkZGVuCj4+
IHdpdGggYSBmYWxzZSByZXR1cm4gdmFsdWUgZGlyZWN0bHkuCj4+Cj4+IFRoZSBzZWNvbmQgcGF0
Y2ggbWFya3MgYnRyZnNfZGF0YV9jc3VtX29rIHdpdGggQUxMT1dfRVJST1JfSU5KRUNUSU9OCj4+
IHVzaW5nIHRoaXMgbmV3IHR5cGUuCj4+Cj4+IFRoZSB0aGlyZCBwYXRjaCBhZGRzIGEgcGFyZW50
IGZpZWxkIHRvIGZlaV9hdHRyIHRvIGFsbG93IGZhdWx0IGluamVjdGlvbgo+PiBvbiBhIGZ1bmN0
aW9uIG9ubHkgd2hlbiBjYWxsZWQgZnJvbSBhIHNwZWNpZmljIHBhcmVudCBmdW5jdGlvbi4KPj4K
Pj4gU29uZyBDaGVuICgzKToKPj4gICAgZXJyb3ItaW5qZWN0aW9uOiBJbnRyb2R1Y2UgRUlfRVRZ
UEVfRkFMU0UgZm9yIGZhaWxfZnVuY3Rpb24KPj4gICAgYnRyZnM6IEFsbG93IGVycm9yIGluamVj
dGlvbiBvbiBidHJmc19kYXRhX2NzdW1fb2sKPj4gICAgZXJyb3ItaW5qZWN0aW9uOiBJbnRyb2R1
Y2UgcGFyZW50IGluIGZlaV9hdHRyCj4gCj4gSSdtIGdvaW5nIHRocm91Z2ggbXkgbWFpbGJveCBh
bmQgZm91bmQgdGhpcy4gTm8gb2JqZWN0aW9ucyB0byBhZGQgdGhlCj4gaW5qZWN0aW9uIHBvaW50
IHRvIGJ0cmZzLCBidXQgdGhlIHJlc3QgaXMgZ2VuZXJpYyBmYXVsdCBpbmplY3Rpb24gY29kZQo+
IHNvIEkgY2FuJ3QgdGFrZSBpdCB2aWEgYnRyZnMgdHJlZSB3aXRob3V0IGFja3MuCj4gCj4gVGhl
cmUgYXJlIHNvbWUgc2FzaGlrbyBjb21tZW50cyAoYXMgcmVwbGllcyBpbiB0aGUgdGhyZWFkIFsx
XSkgYW5kIHRoZXJlCj4gaGF2ZSBiZWVuIHNvbWUgY2hhbmdlcyB0byBidHJmcyBjb2RlIHRvbyBz
byB0aGUgcGF0Y2hzZXQgbmVlZHMgYQo+IHJlZnJlc2guCj4gCj4gSSBzZWUgbWFpbnRhaW5lcnMg
aW4gQ0MsIGlmIHNvbWVib2R5IGNvdWxkIHBsZWFzZSBsZXQgdXMga25vdyBob3cgdG8KPiBwcm9j
ZWVkLgo+IAo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA3MjQwMjEyMjku
NDczMDItMS1jaGVuc29uZ18yMDAwQDEyNi5jb20vCj4gCj4+ICAgYXJjaC9hcm0vbGliL2Vycm9y
LWluamVjdC5jICAgICAgICAgICB8ICA2ICsrCj4+ICAgYXJjaC9hcm02NC9saWIvZXJyb3ItaW5q
ZWN0LmMgICAgICAgICB8ICA2ICsrCj4+ICAgYXJjaC9jc2t5L2xpYi9lcnJvci1pbmplY3QuYyAg
ICAgICAgICB8ICA2ICsrCj4+ICAgYXJjaC9sb29uZ2FyY2gvbGliL2Vycm9yLWluamVjdC5jICAg
ICB8ICA2ICsrCj4+ICAgYXJjaC9wb3dlcnBjL2xpYi9lcnJvci1pbmplY3QuYyAgICAgICB8ICA2
ICsrCj4+ICAgYXJjaC9yaXNjdi9saWIvZXJyb3ItaW5qZWN0LmMgICAgICAgICB8ICA2ICsrCj4+
ICAgYXJjaC9zMzkwL2xpYi9lcnJvci1pbmplY3QuYyAgICAgICAgICB8ICA2ICsrCj4+ICAgYXJj
aC94ODYvbGliL2Vycm9yLWluamVjdC5jICAgICAgICAgICB8ICA2ICsrCj4+ICAgZnMvYnRyZnMv
aW5vZGUuYyAgICAgICAgICAgICAgICAgICAgICB8ICAxICsKPj4gICBpbmNsdWRlL2FzbS1nZW5l
cmljL2Vycm9yLWluamVjdGlvbi5oIHwgIDYgKysKPj4gICBrZXJuZWwvZmFpbF9mdW5jdGlvbi5j
ICAgICAgICAgICAgICAgIHwgOTggKysrKysrKysrKysrKysrKysrKysrKysrKystCj4+ICAgMTEg
ZmlsZXMgY2hhbmdlZCwgMTUyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
