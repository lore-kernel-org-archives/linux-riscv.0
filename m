Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627C0C0015E
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 10:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fIEu4Md6Fl44OAoUzF9DCOBiJvZaauT1YC97YmbVT+g=; b=lcGwnpS9Lyiozx
	B5WT39MHIPBL96zmtsKve4Smg5B9SDzxC9kUopX0wEx1wzEi3oyetVa450LC9yskUFLecFrk0MKO5
	YnPBkK96vIhAo/NJAdegRs+8Ims+QeithTxhLpoAb8TW8trk1H+jQ8ObzV5qmReA6RB1Z6OmzS1As
	qp7qrd3CYdQIyLDDAYBIacbvJFji/6xgn1+N8ab+u1I7/JIDsQuczfTL+4ALrsoik0Vktsa1OAxW0
	Pp938BcxCw9aLW5iMzPPcwyWIxOdHQAtFpChZY7L8+3c6qw/5ypE9wQbiGmBAG53Qi2VyBJgyDwbs
	GA7/+mdbAP+gdLVTU0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVN5-007KHE-0j;
	Thu, 03 Aug 2023 10:15:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUQI-0079Jm-14
	for linux-riscv@bombadil.infradead.org;
	Thu, 03 Aug 2023 09:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/P3JSbQ5B0NSJAuHeE2g8Wm0ulaaLaGIgFBuN0gi4fA=; b=OV3D/0ruZLsl54i8rrMpa63lo0
	wbydw/jgV6x9B6WgOvHsGiOIeMo9YqavH6De2PgKT8ZQ/H9ZPpAW1lbihNEsrvNk4fFpiGfi/gg9c
	u20yBMcnxAiLZVseOzXMBix/XaiCt7amGQpYLJoMRnVYsvnZltu94VxaILT8xSS6kA/BXwfWhbfGX
	pwnd+p2MvbcBrAmeNGwsWnYzcZHijBsl9kVCoR0ojNY+sHelfaUFVxv9QOuH2MywS5CBpEcsUIU9P
	rJP9TZu7aocBJ/XXeJuCngX9yHJd3W3DNnQpzs7qZvPHEJD2NEwDQaovmdFjymaIBaf0m6mozpsp7
	z6SEu+JA==;
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qRUQC-002j60-Jo
	for linux-riscv@lists.infradead.org; Thu, 03 Aug 2023 09:15:07 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 3739EJV0017070;
	Thu, 3 Aug 2023 17:14:19 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 3 Aug 2023
 17:14:16 +0800
Date: Thu, 3 Aug 2023 17:14:15 +0800
From: dylan <dylan@andestech.com>
To: Guo Ren <guoren@kernel.org>
CC: Alexandre Ghiti <alexghiti@rivosinc.com>,
        Paul Walmsley
	<paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou
	<aou@eecs.berkeley.edu>,
        =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
	<bjorn@rivosinc.com>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes] riscv: Implement flush_cache_vmap()
Message-ID: <ZMtv5+ut5z3pjlFJ@atctrx.andestech.com>
References: <20230725132246.817726-1-alexghiti@rivosinc.com>
 <CAJF2gTRm59RAJvSf=L2uqbb3rHnANVheO+yLqrJGuVBh1w8Oug@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTRm59RAJvSf=L2uqbb3rHnANVheO+yLqrJGuVBh1w8Oug@mail.gmail.com>
User-Agent: Mutt/2.1.4 (2021-12-11)
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 3739EJV0017070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_101505_185645_A08E2DA5 
X-CRM114-Status: GOOD (  22.70  )
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

T24gU3VuLCBKdWwgMzAsIDIwMjMgYXQgMDE6MDg6MTdBTSAtMDQwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBUdWUsIEp1bCAyNSwgMjAyMyBhdCA5OjIy4oCvQU0gQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGUgUklTQy1WIGtlcm5lbCBuZWVk
cyBhIHNmZW5jZS52bWEgYWZ0ZXIgYSBwYWdlIHRhYmxlIG1vZGlmaWNhdGlvbjogd2UKPiA+IHVz
ZWQgdG8gcmVseSBvbiB0aGUgdm1hbGxvYyBmYXVsdCBoYW5kbGluZyB0byBlbWl0IGFuIHNmZW5j
ZS52bWEsIGJ1dAo+ID4gY29tbWl0IDdkMzMzMmJlMDExZSAoInJpc2N2OiBtbTogUHJlLWFsbG9j
YXRlIFBHRCBlbnRyaWVzIGZvcgo+ID4gdm1hbGxvYy9tb2R1bGVzIGFyZWEiKSBnb3QgcmlkIG9m
IHRoaXMgcGF0aCBmb3IgNjQtYml0IGtlcm5lbHMsIHNvIG5vdyB3ZQo+ID4gbmVlZCB0byBleHBs
aWNpdGx5IGVtaXQgYSBzZmVuY2Uudm1hIGluIGZsdXNoX2NhY2hlX3ZtYXAoKS4KPiA+Cj4gPiBO
b3RlIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBpbXBsZW1lbnQgZmx1c2hfY2FjaGVfdnVubWFwKCkg
YXMgdGhlIGdlbmVyaWMKPiA+IGNvZGUgc2hvdWxkIGVtaXQgYSBmbHVzaCB0bGIgYWZ0ZXIgdW5t
YXBwaW5nIGEgdm1hbGxvYyByZWdpb24uCj4gPgo+ID4gRml4ZXM6IDdkMzMzMmJlMDExZSAoInJp
c2N2OiBtbTogUHJlLWFsbG9jYXRlIFBHRCBlbnRyaWVzIGZvciB2bWFsbG9jL21vZHVsZXMgYXJl
YSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUByaXZvc2lu
Yy5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCB8
IDQgKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmggYi9hcmNoL3Jpc2N2
L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaAo+ID4gaW5kZXggODA5MWI4YmY0ODgzLi5iOTNmZmRk
ZjhhNjEgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2NhY2hlZmx1c2gu
aAo+ID4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgKPiA+IEBAIC0z
Nyw2ICszNywxMCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgZmx1c2hfZGNhY2hlX3BhZ2Uoc3RydWN0
IHBhZ2UgKnBhZ2UpCj4gPiAgI2RlZmluZSBmbHVzaF9pY2FjaGVfdXNlcl9wYWdlKHZtYSwgcGcs
IGFkZHIsIGxlbikgXAo+ID4gICAgICAgICBmbHVzaF9pY2FjaGVfbW0odm1hLT52bV9tbSwgMCkK
PiA+Cj4gPiArI2lmZGVmIENPTkZJR182NEJJVAo+ID4gKyNkZWZpbmUgZmx1c2hfY2FjaGVfdm1h
cChzdGFydCwgZW5kKSAgIGZsdXNoX3RsYl9rZXJuZWxfcmFuZ2Uoc3RhcnQsIGVuZCkKPiBTb3Jy
eSwgSSBjb3VsZG4ndCBhZ3JlZSB3aXRoIHRoZSBhYm92ZSBpbiBhIFBJUFQgY2FjaGUgbWFjaGlu
ZS4gSXQncwo+IG5vdCB3b3J0aCBmb3IuCj4gCj4gSXQgd291bGQgcmVkdWNlIHRoZSBwZXJmb3Jt
YW5jZSBvZiB2bWFwX3BhZ2VzX3JhbmdlLAo+IGlvcmVtYXBfcGFnZV9yYW5nZSAuLi4gQVBJLCB3
aGljaCBtYXkgY2F1c2Ugc29tZSBkcml2ZXJzJyBwZXJmb3JtYW5jZQo+IGlzc3VlcyB3aGVuIHRo
ZXkgaW5zdGFsbC91bmluc3RhbGwgbWVtb3J5IGZyZXF1ZW50bHkuCj4gCgpIaSBBbGwsCgpJIHRo
aW5rIGZ1bmN0aW9uYWwgY29ycmVjdG5lc3Mgc2hvdWxkIGJlIG1vcmUgaW1wb3J0YW50IHRoYW4g
c3lzdGVtIHBlcmZvcm1hbmNlCmluIHRoaXMgY2FzZS4gVGhlICJwcmV2ZW50aXZlIiBTRkVOQ0Uu
Vk1BIGJlY2FtZSBuZWNlc3NhcnkgZHVlIHRvIHRoZSBSSVNDLVYKc3BlY2lmaWNhdGlvbiBhbGxv
d2luZyBpbnZhbGlkYXRpb24gZW50cmllcyB0byBiZSBjYWNoZWQgaW4gdGhlIFRMQi4KClRoZSBw
cm9ibGVtWzFdIHdlIGFyZSBjdXJyZW50bHkgZW5jb3VudGVyaW5nIGlzIGNhdXNlZCBieSBub3Qg
dXBkYXRpbmcgdGhlIFRMQgphZnRlciB0aGUgcGFnZSB0YWJsZSBpcyBjcmVhdGVkLCBhbmQgdGhl
IHNvbHV0aW9uIHRvIHRoaXMgcHJvYmxlbSBjYW4gb25seSBiZQpzb2x2ZWQgYnkgdXBkYXRpbmcg
dGhlIFRMQiBpbW1lZGlhdGVseSBhZnRlciB0aGUgcGFnZSB0YWJsZSBpcyBjcmVhdGVkLgoKVGhl
cmUgYXJlIGN1cnJlbnRseSB0d28gcG9zc2libGUgYXBwcm9hY2hlcyB0byBmbHVzaCBUTEI6CjEu
IEZsdXNoIFRMQiBpbiBmbHVzaF9jYWNoZV92bWFwKCkKMi4gRmx1c2ggVExCIGluIGFyY2hfc3lu
Y19rZXJuZWxfbWFwcGluZ3MoKQoKQnV0IEknbSBub3QgcXVpdGUgc3VyZSBpZiBpdCdzIGEgZ29v
ZCBpZGVhIHRvIG9wZXJhdGUgb24gdGhlIFRMQiBpbnNpZGUgZmx1c2hfY2FjaGVfdm1hcCgpLgpU
aGUgbmFtZSBvZiB0aGlzIGZ1bmN0aW9uIGluZGljYXRlcyB0aGF0IGl0IHNob3VsZCBiZSByZWxh
dGVkIHRvIGNhY2hlIG9wZXJhdGlvbnMsIG1heWJlCml0IHdvdWxkIGJlIG1vcmUgYXBwcm9wcmlh
dGUgdG8gZG8gVExCIGZsdXNoIGluIGFyY2hfc3luY19rZXJuZWxfbWFwcGluZ3MoKT8KClsxXTog
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvcGlwZXJtYWlsL2xpbnV4LXJpc2N2LzIwMjMtQXVn
dXN0LzAzNzUwMy5odG1sCgpCZXN0IHJlZ2FyZHMsCkR5bGFuCgo+ID4gKyNlbmRpZgo+ID4gKwo+
ID4gICNpZm5kZWYgQ09ORklHX1NNUAo+ID4KPiA+ICAjZGVmaW5lIGZsdXNoX2ljYWNoZV9hbGwo
KSBsb2NhbF9mbHVzaF9pY2FjaGVfYWxsKCkKPiA+IC0tCj4gPiAyLjM5LjIKPiA+Cj4gCj4gCj4g
LS0gCj4gQmVzdCBSZWdhcmRzCj4gIEd1byBSZW4KPiAKPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
