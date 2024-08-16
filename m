Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EECE2C3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 06:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5hxsebcbFcNhnlRLfYvNjBZfl8lZvQUYVocXsOOiw8=; b=LBaLuVgVCdh1Ax
	tsKAFtzWJ1ulVsmZzmdtnbO9yGCzPjTRFJJtcufVcp8QnXcXjfWbTJYGa+qj7jyFRmCp2b82FY+8d
	pFK8GHEDFL6Rsi/+GVHYu2257RDjsjYVXQNdMaO1ZLKPJMlFwDlWqb6IpDB3FZOS0F14uUuEc3kr5
	Pyq/1E4HBI+yrsK/016uZCQdhvpAAz+eo6Mg9FJERQegeKcqDsZwPZTrFGgq5wa8Umyv9xztwEQDb
	cDx2nMDZY8oWmnVxtn94nw6ZmnUhRId9YWW91ULOPOl9INvOLyARQNHL2HrLhmBMjHPi381uEnetI
	wilZPjeR/OtkxLHor9Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seqDQ-0000000Bv1h-114L;
	Fri, 16 Aug 2024 06:13:36 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seqDM-0000000Bv1A-3Gg7
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 06:13:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1723788809; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EhKosFnfNWWM8xgQzE3NmnFOUNmJHw7TnXxuJFPaFm2my/E4YgthNXpjXBisMr7gKSivMgUXwX/1mo4dobiqSb3ZTbjAs4yITbaF2aSOK86+tyL8kcARGDtrkshtG2HkODC2Fe1r97UlmRv7oMoSwBVkFSF8m9gaKrXtqRUSf04=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1723788809; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Gfl8VFVe9SudC5dNo0Vko5rZXrIMnvULISri7qS66o8=; 
	b=aqZpQ0e3cm5TpA/aUbE2tRIM2+oqT5SlKq5BnN7SPtG2PEccZXpS1Arg3iCgGchVYCS+OUZAQgzmJh9sE8Pt8TXeSr4iftOhQKaXOakg0cniMfpmtK0MaYG/hBs03kda1bUOy6td8+lCp98ZJ3sW+apj5EZGii3347WGP7k88hg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1723788809;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=Gfl8VFVe9SudC5dNo0Vko5rZXrIMnvULISri7qS66o8=;
	b=aI6pOSuCWBtu/LBWu2OT1dlgznfBhDnqSkEUanWs1xX1BaPhQyowmB79D2SdbOJE
	vyRzP8HSpBStRLrp/4DFfxf67BvoWvjKRM89v1237gMou8J8rZb1R4UkbErbX8SqS/F
	NmV5U4gm9buqAKLBbRQ/ViDirUzgxdArmLtKSiUcaQ/J6zGYxT43EGy0gaIITSeERc8
	6GyGdHpj6cew40U3yG1LD+cIkTTKE4pqM/cSVfXoCyDWiCuPMMX8i5I6+DkAjvMq1Ah
	S3+XAEFgtsCtQrO4VHapBfVD2zz+tmcUng/WLfFhNz6/ipJuoaxm7JTzrSzjXnLCs8I
	+SQM2JEN2w==
Received: by mx.zohomail.com with SMTPS id 1723788808212420.4473854459512;
	Thu, 15 Aug 2024 23:13:28 -0700 (PDT)
Message-ID: <74d255be524594806b6f9a2cd8bb6d2ab4915340.camel@icenowy.me>
Subject: Re: [PATCH v1 0/9] Fix Allwinner D1 boot regression
From: Icenowy Zheng <uwu@icenowy.me>
To: Palmer Dabbelt <palmer@dabbelt.com>, samuel.holland@sifive.com
Cc: Renner Berthing <emil.renner.berthing@canonical.com>, 
	apatel@ventanamicro.com, tglx@linutronix.de, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	aou@eecs.berkeley.edu, daniel.lezcano@linaro.org
Date: Fri, 16 Aug 2024 14:13:22 +0800
In-Reply-To: <mhng-91e79885-7652-42a4-aad0-f4713e7ac70d@palmer-ri-x1c9>
References: <mhng-91e79885-7652-42a4-aad0-f4713e7ac70d@palmer-ri-x1c9>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_231332_998139_47C63493 
X-CRM114-Status: GOOD (  44.45  )
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

5ZyoIDIwMjQtMDgtMTXmmJ/mnJ/lm5vnmoQgMTA6NTEgLTA3MDDvvIxQYWxtZXIgRGFiYmVsdOWG
memBk++8mgo+IE9uIFRodSwgMTUgQXVnIDIwMjQgMDg6NTk6MzcgUERUICgtMDcwMCksCj4gc2Ft
dWVsLmhvbGxhbmRAc2lmaXZlLmNvbcKgd3JvdGU6Cj4gPiBIaSBFbWlsLAo+ID4gCj4gPiBPbiAy
MDI0LTA4LTE1IDEwOjA3IEFNLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiA+ID4gU2Ft
dWVsIEhvbGxhbmQgd3JvdGU6Cj4gPiA+ID4gT24gMjAyNC0wOC0xNSA5OjE2IEFNLCBBbnVwIFBh
dGVsIHdyb3RlOgo+ID4gPiA+ID4gT24gVGh1LCBBdWcgMTUsIDIwMjQgYXQgNzo0MeKAr1BNIFRo
b21hcyBHbGVpeG5lcgo+ID4gPiA+ID4gPHRnbHhAbGludXRyb25peC5kZT4gd3JvdGU6Cj4gPiA+
ID4gPiA+IAo+ID4gPiA+ID4gPiBPbiBUaHUsIEF1ZyAxNSAyMDI0IGF0IDA4OjMyLCBTYW11ZWwg
SG9sbGFuZCB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiAyMDI0LTA4LTE1IDg6MTYgQU0sIFRob21h
cyBHbGVpeG5lciB3cm90ZToKPiA+ID4gPiA+ID4gPiA+IFllcy4gU28gdGhlIHJpc2N2IHRpbWVy
IGlzIG5vdCB3b3JraW5nIG9uIHRoaXMgdGhpbmcgb3IKPiA+ID4gPiA+ID4gPiA+IGl0IHN0b3Bz
Cj4gPiA+ID4gPiA+ID4gPiBzb21laG93Lgo+ID4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiA+IFRo
YXQncyBjb3JyZWN0LiBXaXRoIHRoZSAoZmlybXdhcmUpIGRldmljZXRyZWUgdGhhdCBFbWlsCj4g
PiA+ID4gPiA+ID4gaXMgdXNpbmcsIHRoZSBPcGVuU0JJCj4gPiA+ID4gPiA+ID4gZmlybXdhcmUg
ZG9lcyBub3QgaGF2ZSBhIHRpbWVyIGRldmljZSwgc28gaXQgZG9lcyBub3QKPiA+ID4gPiA+ID4g
PiBleHBvc2UgdGhlIChvcHRpb25hbFsxXSkKPiA+ID4gPiA+ID4gPiBTQkkgdGltZSBleHRlbnNp
b24sIGFuZCBzYmlfc2V0X3RpbWVyKCkgZG9lcyBub3RoaW5nLgo+ID4gPiA+ID4gPiAKPiA+ID4g
PiA+ID4gU2lnaC4gRG9lcyBSSVNDViByZWFsbHkgaGF2ZSB0byByZXBlYXQgYWxsIG1pc3Rha2Vz
IHdoaWNoCj4gPiA+ID4gPiA+IGhhdmUgYmVlbiBtYWRlCj4gPiA+ID4gPiA+IGJ5IHg4NiwgQVJN
IGFuZCBvdGhlcnMgYmVmb3JlPyBJdCdzIGtub3duIGZvciBkZWNhZGVzIHRoYXQKPiA+ID4gPiA+
ID4gdGhlIGtlcm5lbAo+ID4gPiA+ID4gPiByZWxpZXMgb24gYSB3b3JraW5nIHRpbWVyLi4uCj4g
Cj4gSXQncyBldmVuIHdvcnNlIHRoYW4gdGhhdDogUklTQy1WIGRvZXNuJ3QgZXZlbiBtYW5kYXRl
IGFueSB3b3JraW5nIAo+IF9pbnN0cnVjdGlvbnNfLCBtdWNoIGxlc3MgYW55dGhpbmcgaW4gdGhl
IHBsYXRmb3JtL2Zpcm13YXJlLgo+IAo+ID4gPiA+ID4gTXkgYXBvbG9naWVzIGZvciB0aGUgZGVs
YXkgaW4gZmluZGluZyBhIGZpeCBmb3IgdGhpcyBpc3N1ZS4KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
QWxtb3N0IGFsbCBSSVNDLVYgcGxhdGZvcm1zIChleGNlcHQgdGhpcyBvbmUpIGhhdmUgU0JJIFRp
bWVyCj4gPiA+ID4gPiBhbHdheXMKPiA+ID4gPiA+IGF2YWlsYWJsZSBhbmQgTGludXggdXNlcyBh
IGJldHRlciB0aW1lciBvciBTc3RjIGV4dGVuc2lvbgo+ID4gPiA+ID4gd2hlbmV2ZXIKPiA+ID4g
PiA+IGl0IGlzIGF2YWlsYWJsZS4KPiA+ID4gPiAKPiA+ID4gPiBTbyB0aGlzIGlzIHRoZSBpbW1l
ZGlhdGUgc29sdXRpb246IGFkZCB0aGUgQ0xJTlQgdG8gdGhlCj4gPiA+ID4gZmlybXdhcmUgZGV2
aWNldHJlZSBzbwo+ID4gPiA+IHRoYXQgdGhlIFNCSSB0aW1lIGV4dGVuc2lvbiB3b3JrcywgYW5k
IExpbnV4IHdpbGwgYm9vdCB3aXRob3V0Cj4gPiA+ID4gYW55IGNvZGUgY2hhbmdlcywKPiA+ID4g
PiBhbGJlaXQgd2l0aCBhIGhpZ2hlci1vdmVyaGVhZCBjbG9ja2V2ZW50IGRldmljZS4KPiA+ID4g
Cj4gPiA+IEJ1dCB0aGlzIHdpbGwgbWVhbiB0aGF0IHlvdSBjYW4ndCB1cGRhdGUgeW91ciBrZXJu
ZWwgdG8gdjYuOSBvcgo+ID4gPiBuZXdlciB3aXRob3V0Cj4gPiA+IHJlZmxhc2hpbmcgT3BlblNC
SSBhbmQgdS1ib290LiBUaGF0J3Mgc3RpbGwgYSByZWdyZXNzaW9uIHJpZ2h0Pwo+IAo+IFlhLCBJ
J2QgY2FsbCB0aGF0IGEgcmVncmVzc2lvbi7CoCBVcGRhdGluZyB0aGUgZmlybXdhcmUgb24gdGhl
c2UKPiB0aGluZ3MgCj4gaXNuJ3QgZ2VuZXJhbGx5IHNvbWV0aGluZyB3ZSBjYW4gcmVseSBvbiB1
c2VycyB0byBkbywgd2UndmUgd29ya2VkIAo+IGFyb3VuZCBvdGhlciBmaXJtd2FyZSBidWdzIHdo
ZXJlIHdlIGNhbiB0byBhdm9pZCBmb3JjZWQgdXBkYXRlcy4KPiAKPiA+IEkgc3VwcG9zZSB0aGF0
IGRlcGVuZHMgb24gaWYgeW91IHRoaW5rIHRoZSBTQkkgdGltZSBleHRlbnNpb24gaXMKPiA+IChv
ciBzaG91bGQgaGF2ZQo+ID4gYmVlbikgbWFuZGF0b3J5IGZvciBwbGF0Zm9ybXMgd2l0aG91dCBT
c3RjLiBJZiB0aGUgU0JJIHRpbWUKPiA+IGV4dGVuc2lvbiBpcwo+ID4gbWFuZGF0b3J5LCB0aGVu
IHRoaXMgaXMgYSBmaXJtd2FyZSBidWcsIGFuZCBub3QgcmVhbGx5IExpbnV4J3MKPiA+IHJlc3Bv
bnNpYmlsaXR5IHRvCj4gPiB3b3JrIGFyb3VuZC4KPiA+IAo+ID4gSWYgdGhlIFNCSSB0aW1lIGV4
dGVuc2lvbiBpcyBub3QgbWFuZGF0b3J5LCB0aGVuIExpbnV4IG5lZWRzIHRvIGJlCj4gPiBhYmxl
IHRvCj4gPiBoYW5kbGUgcGxhdGZvcm1zIHdoZXJlIHRoZSBTLW1vZGUgdmlzaWJsZSB0aW1lciBp
cyBhdHRhY2hlZCB0byBhbgo+ID4gZXh0ZXJuYWwKPiA+IGludGVycnVwdCBjb250cm9sbGVyIChQ
TElDIG9yIEFQTElDKSwgc28gdGhlIGlycWNoaXAgZHJpdmVyIG5lZWRzCj4gPiB0byBiZSBsb2Fk
ZWQKPiA+IGJlZm9yZSB0aW1lX2luaXQoKSAodGltZXJfcHJvYmUoKSkuIFNvIGluIHRoYXQgY2Fz
ZSwgdGhlIGJ1ZyBpcyBhCj4gPiBMaW51eAo+ID4gcmVncmVzc2lvbiwgYW5kIHdlIHdvdWxkIG5l
ZWQgdG8gcmV2ZXJ0IHRoZSBwbGF0Zm9ybSBkcml2ZXIKPiA+IGNvbnZlcnNpb24uCj4gCj4gSXQg
ZG9lc24ndCByZWFsbHkgbWF0dGVyIHdoYXQgdGhlIHNwZWNzIHNheSAoYWthIGludGVuZGVkIHRv
IHNheSBpbiAKPiBSSVNDLVYgbGFuZCk6IGlmIHRoZXJlJ3MgYSByZWdyZXNzaW9uIHRoZW4gd2Ug
aGF2ZSB0byBkZWFsIHdpdGggaXQuwqAgCj4gSXQncyBub3QgbGlrZSB3aGF0ZXZlcidzIHdyaXR0
ZW4gaW4gdGhlIHNwZWNzIGFjdHVhbGx5IG1hdHRlcnMsCj4gdmVuZG9ycyAKPiBjYW4ganVzdCBk
byB3aGF0ZXZlciB0aGV5IHdhbnQsIHNvIHdlcidlIGp1c3Qgc3R1Y2sgbWFraW5nIHRoZSBrbm93
biAKPiBpbXBsZW1lbnRhdGlvbnMgd29yay4KPiAKPiBTbyBJIHRoaW5rIGlmIHRoZSByZXZlcnQg
aXMgdGhlIGJlc3QgZml4IHRoZW4gd2Ugc2hvdWxkIHJldmVydCBpdC4KPiAKPiBUaGF0IHNhaWQ6
IElmIHRoZSBDTElOVCB3b3JrcywgY291bGQgd2UganVzdCBhZGQgYSBwcm9iaW5nIHF1aXJrIHRv
Cj4gbWFrZSAKCkNMSU5UIHdvcmtzLCBidXQgd2lsbCB3aWxsIG5ldmVyIHdvcmsgaW4gUyBtb2Rl
IGJ5IGl0cyBkZXNpZ24gLS0gdGhlCnJlZ2lzdGVyIHVzZWQgaXMgYWxsIE0tbW9kZS1vbmx5LgoK
U28gaXQgdGhpcyBraW5kIG9mIHByb2JpbmcgcXVpcmsgaXMgYmVpbmcgYWRkZWQsIHRoZSB0YXJn
ZXQgd2lsbCBiZQpPcGVuU0JJIGluc3RlYWQgb2YgTGludXgsIGFuZCB0aGUgcHJvYmxlbSBvZiB1
cGRhdGluZyBmaXJtd2FyZSBzdGlsbApleGlzdHMuCgo+IGl0IGFwcGVhciBvbiB0aGVzZSBzeXN0
ZW1zIGV2ZW4gd2hlbiBpdCdzIG5vdCBpbiB0aGUgRFQ/wqAgSSdtCj4gdGhpbmtpbmcgCj4gc29t
ZXRoaW5nIGxpa2UgYWRkaW5nIGEgY29tcGF0aWJseSBzdHJpbmcgdG8gdGhlIENMSU5UIGRyaXZl
ciBmb3IgdGhlCj4gU09DIChvciBjb3JlIG9yIHdoYXRldmVyLCBqdXN0IHNvbWV0aGluZyB0aGF0
J3MgYWxyZWFkeSB0aGVyZSkuwqAgV2UnZAo+IHByb2JhYmx5IG5lZWQgYSBiaXQgb2Ygc3BlY2lh
bC1jYXNlIHByb2JpbmcgY29kZSwgYnV0IHNob3VsZG4ndCBiZSBzbwo+IGJhZC7CoCBXZSd2ZSBn
b3Qgc29tZSBvdGhlciBjb21wYXRpYmlsaXR5LW9yaWVudGVkIERUIHF1aXJrcyBmbG9hdGluZyAK
PiBhcm91bmQuCj4gCj4gPiBSZWdhcmRzLAo+ID4gU2FtdWVsCj4gCj4gX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
