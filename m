Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A773C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdTLQP0GceTYitc/reimpZy75MnELB6ijTyjzZy175M=; b=fNQJ0bDzT7MvUN
	YJS9dw6OXu8WqD4YuHiE7TzkJovZoQrucllUaaRizMlmptLDvqEk1vo+VsVemSS5bLeJeTxkdI/eQ
	1aBZhUporhZEmiLL83jup+0lS+WWC2euyXO1uwrk44hVXbmguVq2NV5KrmzfqBFyDp8Gd8UHnDkH3
	0p9vY1SvwuSRxMULeOKD6AWsf4f8yLCnrSFQWArlJYbDqqzl5NY8MdEZClBCNCQ3PsDN2iW9nZSa6
	JF4VTZJ4RnHp6hdnd65RpFF6n0xYcHUbVgobuBrG5ixmIDvZRs2Tq2hZEnJUcMlsfBLLzkchIRwZQ
	pWQ8NybqYOiPYuEfKFmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVB6W-00000003jt2-04vM;
	Wed, 31 Jan 2024 13:58:16 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVB6T-00000003jrs-1KWD;
	Wed, 31 Jan 2024 13:58:14 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B8591DA7;
	Wed, 31 Jan 2024 05:58:54 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 724A83F738;
	Wed, 31 Jan 2024 05:58:06 -0800 (PST)
Message-ID: <a0cdeb7c-dec8-4971-8b54-e6f65ea48ade@arm.com>
Date: Wed, 31 Jan 2024 13:58:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/15] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Matthew Wilcox <willy@infradead.org>, Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Dinh Nguyen <dinguyen@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, "David S. Miller"
 <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org
References: <20240129124649.189745-1-david@redhat.com>
 <a335a9d2-9b8f-4eb8-ba22-23a223b59b06@arm.com>
 <a1a0e9b3-dae2-418f-bd63-50e65f471728@redhat.com>
 <57eb82c7-4816-42a2-b5ab-cc221e289b21@arm.com>
 <e6eaba5b-f290-4d1f-990b-a47d89f56ee4@redhat.com>
 <714d0930-2202-48b6-9728-d248f820325e@arm.com>
 <dcaa20c4-bd1f-4f15-bb0a-3a790808937d@arm.com>
 <30718fc8-15cf-41e4-922c-5cdbf00a0840@redhat.com>
 <de975655-8f8f-40dc-b281-75c40dd1e2c1@arm.com>
 <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <c63870b0-690a-4051-b4f5-296cf3b73be2@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_055813_471327_CF2AD5FF 
X-CRM114-Status: GOOD (  35.14  )
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

T24gMzEvMDEvMjAyNCAxMzozOCwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4gTm9wZTog
bG9va3MgdGhlIHNhbWUuIEkndmUgdGFrZW4gbXkgdGVzdCBoYXJuZXNzIG91dCBvZiB0aGUgcGlj
dHVyZSBhbmQgZG9uZQo+Pj4+IGV2ZXJ5dGhpbmcgbWFudWFsbHkgZnJvbSB0aGUgZ3JvdW5kIHVw
LCB3aXRoIHRoZSBvbGQgdGVzdHMgYW5kIHRoZSBuZXcuCj4+Pj4gSGVhZGxpbmUKPj4+PiBpcyB0
aGF0IEkgc2VlIHNpbWlsYXIgbnVtYmVycyBmcm9tIGJvdGguCj4+Pgo+Pj4gSSB0b29rIG1lIGEg
d2hpbGUgdG8gZ2V0IHJlYWxseSByZXByb2R1Y2libGUgbnVtYmVycyBvbiBJbnRlbC4gTW9zdCBp
bXBvcnRhbnRseToKPj4+ICogU2V0IGEgZml4ZWQgQ1BVIGZyZXF1ZW5jeSwgZGlzYWJsaW5nIGFu
eSBib29zdCBhbmQgYXZvaWRpbmcgYW55Cj4+PiDCoMKgIHRoZXJtYWwgdGhyb3R0bGluZy4KPj4+
ICogUGluIHRoZSB0ZXN0IHRvIENQVXMgYW5kIHNldCBhIG5pY2UgbGV2ZWwuCj4+Cj4+IEknbSBh
bHJlYWR5IHBpbm5pbmcgdGhlIHRlc3QgdG8gY3B1IDAuIEJ1dCBmb3IgTTIsIGF0IGxlYXN0LCBJ
J20gcnVubmluZyBpbiBhIFZNCj4+IG9uIHRvcCBvZiBtYWNvcywgYW5kIEkgZG9uJ3QgaGF2ZSBh
IG1lY2hhbmlzbSB0byBwaW4gdGhlIFFFTVUgdGhyZWFkcyB0byB0aGUKPj4gcGh5c2ljYWwgQ1BV
cy4gQW55d2F5LCBJIGRvbid0IHRoaW5rIHRoZXNlIGFyZSBwcm9ibGVtcyBiZWNhdXNlIGZvciBh
IGdpdmVuCj4+IGtlcm5lbCBidWlsZCBJIGNhbiBhY2N1cmF0ZWx5IHJlcHJvIG51bWJlcnMuCj4g
Cj4gT2gsIHlvdSBkbyBoYXZlIGEgbGF5ZXIgb2YgdmlydHVhbGl6YXRpb24gaW4gdGhlcmUuIEkg
KnN1c3BlY3QqIHRoYXQgbWlnaHQKPiBhbXBsaWZ5IHNvbWUgb2RkIHRoaW5ncyByZWdhcmRpbmcg
Y29kZSBsYXlvdXQsIGNhY2hpbmcgZWZmZWN0cywgZXRjLgo+IAo+IEkgZ3Vlc3MgZXNwZWNpYWxs
eSB0aGUgZm9yaygpIGJlbmNobWFyayBpcyB0b28gc2Vuc2libGUgKGZhc3QpIGZvciB0aGluZ3Mg
bGlrZQo+IHRoYXQsIHNvIEkgd291bGQganVzdCBmb2N1cyBvbiBiYXJlIG1ldGFsIHJlc3VsdHMg
d2hlcmUgeW91IGNhbiBjb250cm9sIHRoZQo+IGVudmlyb25tZW50IGNvbXBsZXRlbHkuCgpZZWFo
LCBtYXliZS4gT0sgSSdsbCBwYXJrIE0yIGZvciBub3cuCgo+IAo+IE5vdGUgdGhhdCByZWdhcmRp
bmcgTlVNQSBlZmZlY3RzLCBJIG1lYW4gd2hlbiBzb21lIG1lbW9yeSBhY2Nlc3Mgd2l0aGluIHRo
ZSBzYW1lCj4gc29ja2V0IGlzIGZhc3Rlci9zbG93ZXIgZXZlbiB3aXRoIG9ubHkgYSBzaW5nbGUg
bm9kZS4gT24gQU1EIEVQWUMgdGhhdCdzCj4gcG9zc2libGUsIGRlcGVuZGluZyBvbiB3aGljaCBj
b3JlIHlvdSBhcmUgcnVubmluZyBhbmQgb24gd2hpY2ggbWVtb3J5IGNvbnRyb2xsZXIKPiB0aGUg
bWVtb3J5IHlvdSB3YW50IHRvIGFjY2VzcyBpcyBsb2NhdGVkLiBJZiBib3RoIGFyZSBpbiBkaWZm
ZXJlbnQgcXVhZHJhbnRzCj4gSUlVQywgdGhlIGFjY2VzcyBsYXRlbmN5IHdpbGwgYmUgZGlmZmVy
ZW50LgoKSSd2ZSBjb25maWd1cmVkIHRoZSBOVU1BIHRvIG9ubHkgYnJpbmcgdGhlIFJBTSBhbmQg
Q1BVcyBmb3IgYSBzaW5nbGUgc29ja2V0Cm9ubGluZSwgc28gSSBzaG91bGRuJ3QgYmUgc2VlaW5n
IGFueSBvZiB0aGVzZSBlZmZlY3RzLiBBbnl3YXksIEkndmUgYmVlbiB1c2luZwp0aGUgQWx0cmEg
YXMgYSBzZWNvbmRhcnkgYmVjYXVzZSBpdHMgc28gbXVjaCBzbG93ZXIgdGhhbiB0aGUgTTIuIExl
dCBtZSBtb3ZlCm92ZXIgdG8gaXQgYW5kIHNlZSBpZiBldmVyeXRoaW5nIGxvb2tzIG1vcmUgc3Ry
YWlnaHRmb3J3YXJkIHRoZXJlLgoKPiAKPj4+IEJ1dCB5ZXM6IEkgd2FzIG9ic2VydmluZyBzb21l
dGhpbmcgc2ltaWxhciBvbiBBTUQgRVBZQywgd2hlcmUgeW91IGdldAo+Pj4gY29uc2VjdXRpdmUg
cGFnZXMgZnJvbSB0aGUgYnVkZHksIGJ1dCBvbmNlIHlvdSBhbGxvY2F0ZSBmcm9tIHRoZSBQQ1Ag
aXQgbWlnaHQgbm8KPj4+IGxvbmdlciBiZSBjb25zZWN1dGl2ZS4KPj4+Cj4+Pj4gwqDCoCAtIHRl
c3QgaXMgNS0xMCUgc2xvd2VyIHdoZW4gb3V0cHV0IGlzIHByaW50ZWQgdG8gdGVybWluYWwgdnMg
d2hlbgo+Pj4+IHJlZGlyZWN0ZWQgdG8KPj4+PiDCoMKgwqDCoCBmaWxlLiBJJ3ZlIGFsd2F5cyBl
ZmZlY3RpdmVseSBiZWVuIHJlZGlyZWN0aW5nLiBOb3Qgc3VyZSBpZiB0aGlzIG92ZXJoZWFkCj4+
Pj4gwqDCoMKgwqAgY291bGQgc3RhcnQgdG8gZG9taW5hdGUgdGhlIHJlZ3Jlc3Npb24gYW5kIHRo
YXQncyB3aHkgeW91IGRvbid0IHNlZSBpdD8KPj4+Cj4+PiBUaGF0J3Mgd2VpcmQsIGJlY2F1c2Ug
d2UgZG9uJ3QgcHJpbnQgd2hpbGUgbWVhc3VyaW5nPyBBbnlob3csIDUvMTAlIHZhcmlhbmNlIG9u
Cj4+PiBzb21lIHN5c3RlbSBpcyBub3QgdGhlIGVuZCBvZiB0aGUgd29ybGQuCj4+Cj4+IEkgaW1h
Z2luZSBpdHMgY2FjaGUgZWZmZWN0cz8gTW9yZSB3b3JrIHRvIGRvIHRvIHByaW50IHRoZSBvdXRw
dXQgY291bGQgYmUKPj4gZXZpY3Rpbmcgc29tZSBjb2RlIHRoYXQncyBpbiB0aGUgYmVuY2htYXJr
IHBhdGg/Cj4gCj4gTWF5YmUuIERvIHlvdSBhbHNvIHNlZSB0aGVzZSBvZGRpdGllcyBvbiB0aGUg
YmFyZSBtZXRhbCBzeXN0ZW0/Cj4gCj4+Cj4+Pgo+Pj4+Cj4+Pj4gSSdtIGluY2xpbmVkIHRvIHJ1
biB0aGlzIHRlc3QgZm9yIHRoZSBsYXN0IE4ga2VybmVsIHJlbGVhc2VzIGFuZCBpZiB0aGUgbnVt
YmVyCj4+Pj4gbW92ZXMgYXJvdW5kIHNpZ25pZmljYW50bHksIGNvbmNsdWRlIHRoYXQgdGhlc2Ug
dGVzdHMgZG9uJ3QgcmVhbGx5IG1hdHRlci4KPj4+PiBPdGhlcndpc2UgaXRzIGFuIGV4ZXJjaXNl
IGluIHJhbmRvbWx5IHJlZmFjdG9yaW5nIGNvZGUgdW50aWwgaXQgd29ya3Mgd2VsbCwgYnV0Cj4+
Pj4gdGhhdCdzIGp1c3Qgb3ZlcmZpdHRpbmcgdG8gdGhlIGNvbXBpbGVyIGFuZCBody4gV2hhdCBk
byB5b3UgdGhpbms/Cj4+Pgo+Pj4gUGVyc29uYWxseSwgSSB3b3VsZG4ndCBsb3NlIHNsZWVwIGlm
IHlvdSBzZWUgd2VpcmQsIHVuZXhwbGFpbmFibGUgYmVoYXZpb3Igb24KPj4+IHNvbWUgc3lzdGVt
IChub3QgZXZlbiBhcmNoaXRlY3R1cmUhKS4gVHJ5aW5nIHRvIG9wdGltaXplIGZvciB0aGF0IHdv
dWxkIGluZGVlZAo+Pj4gYmUgcmFuZG9tIHJlZmFjdG9yaW5ncy4KPj4+Cj4+PiBCdXQgSSB3b3Vs
ZCBub3QgYmUgc28gZmFzdCB0byBzYXkgdGhhdCAidGhlc2UgdGVzdHMgZG9uJ3QgcmVhbGx5IG1h
dHRlciIgYW5kCj4+PiB0aGVuIGdvIHdpbGQgYW5kIGRlZ3JhZGUgdGhlbSBhcyBtdWNoIGFzIHlv
dSB3YW50LiBUaGVyZSBhcmUgdXNlIGNhc2VzIHRoYXQgY2FyZQo+Pj4gYWJvdXQgZm9yayBwZXJm
b3JtYW5jZSBlc3BlY2lhbGx5IHdpdGggb3JkZXItMCBwYWdlcyAtLSBzdWNoIGFzIFJlZGlzLgo+
Pgo+PiBJbmRlZWQuIEJ1dCBhbHNvIHJlbWVtYmVyIHRoYXQgbXkgZm9yayBiYXNlbGluZSB0aW1l
IGlzIH4yLjVtcywgYW5kIEkgdGhpbmsgeW91Cj4+IHNhaWQgeW91cnMgd2FzIDE0bXMgOikKPiAK
PiBZZXMsIG5vIGlkZWEgd2h5IE0yIGlzIHRoYXQgZmFzdCAoQlRXLCB3aGljaCBwYWdlIHNpemU/
IDRrIG9yIDE2az8gKSA6KQoKVGhlIGd1ZXN0IGtlcm5lbCBpcyB1c2luZyA0SyBwYWdlcy4gSSdt
IG5vdCBxdWl0ZSBzdXJlIHdoYXQgaXMgaGFwcGVuaW5nIGF0CnN0YWdlMjsgUUVNVSBkb2Vzbid0
IGV4cG9zZSBhbnkgb3B0aW9ucyB0byBleHBsaWNpdGx5IHJlcXVlc3QgaHVnZSBwYWdlcyBmb3IK
bWFjb3MgQUZBSUNULgoKPiAKPj4KPj4gSSdsbCBjb250aW51ZSB0byBtZXNzIGFyb3VuZCB3aXRo
IGl0IHVudGlsIHRoZSBlbmQgb2YgdGhlIGRheS4gQnV0IEknbSBub3QKPj4gbWFraW5nIGFueSBo
ZWFkd2F5LCB0aGVuIEknbGwgY2hhbmdlIHRhY2s7IEknbGwganVzdCBtZWFzdXJlIHRoZSBwZXJm
b3JtYW5jZSBvZgo+PiBteSBjb250cHRlIGNoYW5nZXMgdXNpbmcgeW91ciBmb3JrL3phcCBzdHVm
ZiBhcyB0aGUgYmFzZWxpbmUgYW5kIHBvc3QgYmFzZWQgb24KPj4gdGhhdC4KPiAKPiBZb3Ugc2hv
dWxkIGxpa2VseSBub3QgZm9jdXMgb24gTTIgcmVzdWx0cy4gSnVzdCBwaWNrIGEgcmVwcmVzZW50
YXRpdmUgYmFyZSBtZXRhbAo+IG1hY2hpbmUgd2hlcmUgeW91IGdldCBjb25zaXN0ZW50LCBleHBs
YWluYWJsZSByZXN1bHRzLgo+IAo+IE5vdGhpbmcgaW4gdGhlIGNvZGUgaXMgZmluZS10dW5lZCBm
b3IgYSBwYXJ0aWN1bGFyIGFyY2hpdGVjdHVyZSBzbyBmYXIsIG9ubHkKPiBvcmRlci0wIGhhbmRs
aW5nIGlzIGtlcHQgc2VwYXJhdGUuCj4gCj4gQlRXOiBJIHNlZSB0aGUgZXhhY3Qgc2FtZSBzcGVl
ZHVwcyBmb3IgZG9udG5lZWQgdGhhdCBJIHNlZSBmb3IgbXVubWFwLiBGb3IKPiBleGFtcGxlLCBm
b3Igb3JkZXItOSwgaXQgZ29lcyBmcm9tIDAuMDIzNDEycyAtPiAwLjAwOTc4NSwgc28gLTU4JS4g
U28gSSdtCj4gY3VyaW91cyB3aHkgeW91IHNlZSBhIHNwZWVkdXAgZm9yIG11bm1hcCBidXQgbm90
IGZvciBkb250bmVlZC4KClVnaC4uLiBvaywgY29taW5nIHVwLgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
