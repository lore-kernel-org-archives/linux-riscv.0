Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B217FD46C16
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 03:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fvrCzkzKYBP5TsI5/1IHK6BFZ3+x3zm4Eq04Y4dfCs4=; b=1UJ9YeVAvQx2Iz
	Z0wLQIkfKjKP4UpQpBLItoKjKxhW85n1bpqCD1Eth/l7wHTVVtgYVceWJk4QEeL91faPsSM6VL7YM
	y8snPT/ZcqZ69y7BntoKJfTHt+Y2y/YXtOhojH29Le5dTSB50+gmMUP9ETieXm6WL1AQrC7wd/FAv
	McI6fGcUfcy1iz5CJdmUO1hErdH5P30IDAPC2Mst/mya/vqecEI8zklFhUlBrSbs2stfdJaGuTySW
	af1pjep89JnEWr8ooqDLYhY0am1HKqZwjFpYSDsdzYiUUjqSHwSlmNQ28oCp/Zg+LKa4JIWbXDNr8
	Tq3s4AOOSZUERC5KV3yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIeL-0000000HBZi-1GVy;
	Thu, 29 Jan 2026 03:24:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIeJ-0000000HBZP-3gY9
	for linux-riscv@bombadil.infradead.org;
	Thu, 29 Jan 2026 03:24:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Sender:Reply-To:Content-ID:Content-Description;
	bh=FlpBJ3KsRtrl9qZalE86QiWS9CLSHBJfdJXtnQNL1/E=; b=jHx0cmXO1L/my2qV/bUVGre0k9
	83dd53cwH1sF9fdPpcNLImlTDZ0fMv2eEKn/J+EAcsRk0jreH2xB3poL100EudyTjPHb1swz2MoOy
	O1Hy8mXcWqN28x2W+485R0tIqOiRzf+XmkQidOgc/GQToEhFWBp+XnnNgaMdPqab3SaZQ9UT1G6Ak
	wIYnbrqEl1F77FPG1407Jrog6iMZyDYZS5IPtQuPuY908Jd7u/xIuHpUW9Ppqeh4c0Ym0h6p/eeMm
	86IOCU2hAzhA7mSPmEMDGyzZuHKEimsp3kivobApI3nsZvH4P2/76z6LBuJ07ea/3+q2bQhaZPhX2
	ZWPvw6cA==;
Received: from out-172.mta1.migadu.com ([2001:41d0:203:375::ac])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlIeF-00000009kW1-2Mgi
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 03:24:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769657083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FlpBJ3KsRtrl9qZalE86QiWS9CLSHBJfdJXtnQNL1/E=;
	b=xrnhdxRjcG4kB4MkJDyhfeORdlppD3+zJ5DOkDLnPPMhNmq4pItIrLdIWdlbQ5bOfFPtzI
	2XvhH+gI5l2dPkM9vCOS7iB0kedN4fDHy/+JYv7wyEQO+5C2234LkvgZe1Txj7AK8u0BU4
	kmo7++P9v4E+IufxVhR5D2jNrY1NhV8=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCHv5 09/17] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
Date: Thu, 29 Jan 2026 11:23:58 +0800
Cc: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>,
 Frank van der Linden <fvdl@google.com>,
 Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Baoquan He <bhe@redhat.com>,
 Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>,
 kernel-team@meta.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org
Message-Id: <1A08D224-E1AC-4FE5-B1D0-1BAE2D5FF31E@linux.dev>
References: <20260128135500.22121-1-kas@kernel.org>
 <20260128135500.22121-10-kas@kernel.org>
 <B4674CF0-7534-462B-A761-D9124234BFE4@linux.dev>
 <3DA11168-5E37-4CE9-9934-CD1CAF3085D6@nvidia.com>
To: Zi Yan <ziy@nvidia.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_032447_870708_C5711056 
X-CRM114-Status: GOOD (  13.34  )
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

Cgo+IE9uIEphbiAyOSwgMjAyNiwgYXQgMTE6MTAsIFppIFlhbiA8eml5QG52aWRpYS5jb20+IHdy
b3RlOgo+IAo+IE9uIDI4IEphbiAyMDI2LCBhdCAyMjowMCwgTXVjaHVuIFNvbmcgd3JvdGU6Cj4g
Cj4+PiBPbiBKYW4gMjgsIDIwMjYsIGF0IDIxOjU0LCBLaXJ5bCBTaHV0c2VtYXUgPGthc0BrZXJu
ZWwub3JnPiB3cm90ZToKPj4+IAo+Pj4gSWYgcGFnZS0+Y29tcG91bmRfaW5mbyBlbmNvZGVzIGEg
bWFzaywgaXQgaXMgZXhwZWN0ZWQgdGhhdCB2bWVtbWFwIHRvIGJlCj4+PiBuYXR1cmFsbHkgYWxp
Z25lZCB0byB0aGUgbWF4aW11bSBmb2xpbyBzaXplLgo+Pj4gCj4+PiBUcmlnZ2VyIGEgQlVHKCkg
Zm9yIENPTkZJR19ERUJVR19WTT15IG9yIFdBUk4oKSBvdGhlcndpc2UuCj4+PiAKPj4+IFNpZ25l
ZC1vZmYtYnk6IEtpcnlsIFNodXRzZW1hdSA8a2FzQGtlcm5lbC5vcmc+Cj4+PiBBY2tlZC1ieTog
WmkgWWFuIDx6aXlAbnZpZGlhLmNvbT4KPj4+IC0tLQo+Pj4gbW0vc3BhcnNlLmMgfCAxMyArKysr
KysrKysrKysrCj4+PiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKQo+Pj4gCj4+PiBk
aWZmIC0tZ2l0IGEvbW0vc3BhcnNlLmMgYi9tbS9zcGFyc2UuYwo+Pj4gaW5kZXggYjViMmI2Zjcw
NDFiLi45YzBmNDAxNTc3OGMgMTAwNjQ0Cj4+PiAtLS0gYS9tbS9zcGFyc2UuYwo+Pj4gKysrIGIv
bW0vc3BhcnNlLmMKPj4+IEBAIC02MDAsNiArNjAwLDE5IEBAIHZvaWQgX19pbml0IHNwYXJzZV9p
bml0KHZvaWQpCj4+PiBCVUlMRF9CVUdfT04oIWlzX3Bvd2VyX29mXzIoc2l6ZW9mKHN0cnVjdCBt
ZW1fc2VjdGlvbikpKTsKPj4+IG1lbWJsb2Nrc19wcmVzZW50KCk7Cj4+PiAKPj4+ICsgIGlmIChj
b21wb3VuZF9pbmZvX2hhc19tYXNrKCkpIHsKPj4+ICsgIAl1bnNpZ25lZCBsb25nIGFsaWdubWVu
dDsKPj4+ICsgIAlib29sIGFsaWduZWQ7Cj4+PiArCj4+PiArICAJYWxpZ25tZW50ID0gTUFYX0ZP
TElPX05SX1BBR0VTICogc2l6ZW9mKHN0cnVjdCBwYWdlKTsKPj4+ICsgIAlhbGlnbmVkID0gSVNf
QUxJR05FRCgodW5zaWduZWQgbG9uZykgcGZuX3RvX3BhZ2UoMCksIGFsaWdubWVudCk7Cj4+PiAr
Cj4+PiArICAJaWYgKElTX0VOQUJMRUQoQ09ORklHX0RFQlVHX1ZNKSkKPj4+ICsgIAkJQlVHX09O
KCFhbGlnbmVkKTsKPj4+ICsgIAllbHNlCj4+PiArICAJCVdBUk5fT04oIWFsaWduZWQpOwo+PiAK
Pj4gU2luY2UgeW914oCZdmUgZml4ZWQgYWxsIHRoZSBwcm9ibGVtYXRpYyBhcmNoaXRlY3R1cmVz
LCBJIGRvbuKAmXQgYmVsaWV2ZQo+PiB3ZeKAmWxsIGV2ZXIgaGl0IHRoZSBXQVJOIG9yIEJVRyBo
ZXJlIGFueW1vcmUuCj4+IAo+PiBJIHRoaW5rIHdlIGNhbiBub3cgc2ltcGxpZnkgdGhlIGNvZGUg
ZnVydGhlciBhbmQganVzdCB1c2UgVk1fQlVHX09OOgo+PiBpZiBhbnkgYXJjaGl0ZWN0dXJlIGNo
YW5nZXMgaW4gdGhlIGZ1dHVyZSwgdGhlIG1pc2FsaWdubWVudCB3aWxsIGJlCj4+IGNhdWdodCBk
dXJpbmcgdGVzdGluZywgc28gd2Ugd29u4oCZdCBuZWVkIHRvIHdvcnJ5IGFib3V0IGl0IGF0IHJ1
bi10aW1lLgo+PiAKPiAKPiBWTV9XQVJOX09OIHNob3VsZCBiZSBzdWZmaWNpZW50LCBzaW5jZSBi
b3RzIHNob3VsZCByZXBvcnQgd2FybmluZ3MKPiBmcm9tIGFueSBwYXRjaC9jaGFuZ2UuCgpJ4oCZ
bSBub3Qgc3VyZSBhIFdBUk4gd2lsbCBnZXQgZGV2ZWxvcGVyc+KAmSBhdHRlbnRpb24sIHNpbmNl
IHRoZSBtZXNzYWdlCmlzIHVubGlrZWx5IHRvIGhhdmUgYW55IHZpc2libGUgY29uc2VxdWVuY2Vz
IGFuZCBvbmx5IGZpcmVzIG9uCmFsbG9jYXRpb25zIHdpdGggYSBzcGVjaWFsIG9yZGVyLgoKPiAK
Pj4+ICsgIH0KPj4+ICsKPj4+IHBudW1fYmVnaW4gPSBmaXJzdF9wcmVzZW50X3NlY3Rpb25fbnIo
KTsKPj4+IG5pZF9iZWdpbiA9IHNwYXJzZV9lYXJseV9uaWQoX19ucl90b19zZWN0aW9uKHBudW1f
YmVnaW4pKTsKPj4+IAo+Pj4gLS0gCj4+PiAyLjUxLjIKPj4+IAo+IAo+IAo+IEJlc3QgUmVnYXJk
cywKPiBZYW4sIFppCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
