Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09511C47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 11:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sROWLUYtr0gTWy0WAzMUYegiOkWOsaOxLsQold1ySDI=; b=a85amkQReI3kyo
	lut+LRUeg8nYPdbwZ6+nK8GAfUdNS4/iV9bRnKlvPBt3ooPCmNdtOMiAt3Qqs4+n3v/zAczVwc3jY
	Pcsmf9M+CwVNqr25E5DMn5NfFArTIqMwT7kKTu+5nejmarvhsjdgz2CRzmZ0djwp3DGHBV6sVeOLX
	EnuN2CyCZ3PixS+5GqYMVWLCrRsXZ84W4jCee/gU+1QoxU1wPGyk6YoxzPu1Guczu8eGJFq/ivX/l
	6U/85dWilAuxw2rVwFn/0Zy9DfTLlx7XMno74fC7TBRlfA+JyN+gERVljwl7dxUhHQXk5llBQOHh1
	iuZpWR0lO1QpJ6/EgRGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFCx-00GIov-20;
	Tue, 23 Jan 2024 11:44:47 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSFCt-00GInR-2j;
	Tue, 23 Jan 2024 11:44:45 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60D9A1FB;
	Tue, 23 Jan 2024 03:45:26 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47CA23F762;
	Tue, 23 Jan 2024 03:44:37 -0800 (PST)
Message-ID: <7f39e2db-0fa1-4391-956f-d2586fa234bd@arm.com>
Date: Tue, 23 Jan 2024 11:44:35 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 01/11] arm/pgtable: define PFN_PTE_SHIFT on arm and
 arm64
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
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-2-david@redhat.com>
 <fdaeb9a5-d890-499a-92c8-d171df43ad01@arm.com>
 <46080ac1-7789-499b-b7f3-0231d7bd6de7@redhat.com>
 <02d42161-a867-424d-bef8-efd67d592cbc@redhat.com>
 <75e99c49-734a-47f4-b7a5-7e346bd2487b@arm.com>
 <08607590-3115-46e6-8f1f-bcc60c33cc20@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <08607590-3115-46e6-8f1f-bcc60c33cc20@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_034443_983466_33FF9F9A 
X-CRM114-Status: GOOD (  15.93  )
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

T24gMjMvMDEvMjAyNCAxMTozMywgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjMuMDEu
MjQgMTI6MTcsIFJ5YW4gUm9iZXJ0cyB3cm90ZToKPj4gT24gMjMvMDEvMjAyNCAxMTowMiwgRGF2
aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+PiBPbiAyMy4wMS4yNCAxMTo0OCwgRGF2aWQgSGlsZGVu
YnJhbmQgd3JvdGU6Cj4+Pj4gT24gMjMuMDEuMjQgMTE6MzQsIFJ5YW4gUm9iZXJ0cyB3cm90ZToK
Pj4+Pj4gT24gMjIvMDEvMjAyNCAxOTo0MSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4+Pj4+
PiBXZSB3YW50IHRvIG1ha2UgdXNlIG9mIHB0ZV9uZXh0X3BmbigpIG91dHNpZGUgb2Ygc2V0X3B0
ZXMoKS4gTGV0J3MKPj4+Pj4+IHNpbXBsaXkgZGVmaW5lIFBGTl9QVEVfU0hJRlQsIHJlcXVpcmVk
IGJ5IHB0ZV9uZXh0X3BmbigpLgo+Pj4+Pj4KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IERhdmlkIEhp
bGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPgo+Pj4+Pj4gLS0tCj4+Pj4+PiDCoMKgwqAgYXJj
aC9hcm0vaW5jbHVkZS9hc20vcGd0YWJsZS5owqDCoCB8IDIgKysKPj4+Pj4+IMKgwqDCoCBhcmNo
L2FybTY0L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIgKysKPj4+Pj4+IMKgwqDCoCAyIGZpbGVz
IGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmggYi9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxl
LmgKPj4+Pj4+IGluZGV4IGQ2NTdiODRiNmJmNzAuLmJlOTFlMzc2ZGY3OWUgMTAwNjQ0Cj4+Pj4+
PiAtLS0gYS9hcmNoL2FybS9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+Pj4+ICsrKyBiL2FyY2gv
YXJtL2luY2x1ZGUvYXNtL3BndGFibGUuaAo+Pj4+Pj4gQEAgLTIwOSw2ICsyMDksOCBAQCBzdGF0
aWMgaW5saW5lIHZvaWQgX19zeW5jX2ljYWNoZV9kY2FjaGUocHRlX3QgcHRldmFsKQo+Pj4+Pj4g
wqDCoMKgIGV4dGVybiB2b2lkIF9fc3luY19pY2FjaGVfZGNhY2hlKHB0ZV90IHB0ZXZhbCk7Cj4+
Pj4+PiDCoMKgwqAgI2VuZGlmCj4+Pj4+PiDCoMKgwqAgKyNkZWZpbmUgUEZOX1BURV9TSElGVMKg
wqDCoMKgwqDCoMKgIFBBR0VfU0hJRlQKPj4+Pj4+ICsKPj4+Pj4+IMKgwqDCoCB2b2lkIHNldF9w
dGVzKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4+Pj4+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHB0ZV90ICpwdGVwLCBwdGVfdCBwdGV2YWws
IHVuc2lnbmVkIGludCBucik7Cj4+Pj4+PiDCoMKgwqAgI2RlZmluZSBzZXRfcHRlcyBzZXRfcHRl
cwo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+
Pj4+PiBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4+Pj4+PiBpbmRleCA3OWNl
NzBmYmI3NTFjLi5kNGIzYmQ5NmUzMzA0IDEwMDY0NAo+Pj4+Pj4gLS0tIGEvYXJjaC9hcm02NC9p
bmNsdWRlL2FzbS9wZ3RhYmxlLmgKPj4+Pj4+ICsrKyBiL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20v
cGd0YWJsZS5oCj4+Pj4+PiBAQCAtMzQxLDYgKzM0MSw4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBf
X3N5bmNfY2FjaGVfYW5kX3RhZ3MocHRlX3QgcHRlLAo+Pj4+Pj4gdW5zaWduZWQgaW50IG5yX3Bh
Z2VzKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBtdGVfc3luY190YWdzKHB0ZSwgbnJf
cGFnZXMpOwo+Pj4+Pj4gwqDCoMKgIH0KPj4+Pj4+IMKgwqDCoCArI2RlZmluZSBQRk5fUFRFX1NI
SUZUwqDCoMKgwqDCoMKgwqAgUEFHRV9TSElGVAo+Pj4+Pgo+Pj4+PiBJIHRoaW5rIHRoaXMgaXMg
YnVnZ3kuIEFuZCBzbyBpcyB0aGUgYXJtNjQgaW1wbGVtZW50YXRpb24gb2Ygc2V0X3B0ZXMoKS4g
SXQKPj4+Pj4gd29ya3MgZmluZSBmb3IgNDgtYml0IG91dHB1dCBhZGRyZXNzLCBidXQgZm9yIDUy
LWJpdCBPQXMsIHRoZSBoaWdoIGJpdHMgYXJlCj4+Pj4+IG5vdAo+Pj4+PiBrZXB0IGNvbnRpZ291
c2x5LCBzbyBpZiB5b3UgaGFwcGVuIHRvIGJlIHNldHRpbmcgYSBtYXBwaW5nIGZvciB3aGljaCB0
aGUKPj4+Pj4gcGh5c2ljYWwgbWVtb3J5IGJsb2NrIHN0cmFkZGxlcyBiaXQgNDgsIHRoaXMgd29u
J3Qgd29yay4KPj4+Pgo+Pj4+IFJpZ2h0LCBhcyBzb29uIGFzIHRoZSBQVEUgYml0cyBhcmUgbm90
IGNvbnRpZ3VvdXMsIHRoaXMgc3RvcHMgd29ya2luZywKPj4+PiBqdXN0IGxpa2Ugc2V0X3B0ZXMo
KSB3b3VsZCwgd2hpY2ggSSB1c2VkIGFzIG9yaWVudGF0aW9uLgo+Pj4+Cj4+Pj4+Cj4+Pj4+IFRv
ZGF5LCBvbmx5IHRoZSA2NEsgYmFzZSBwYWdlIGNvbmZpZyBjYW4gc3VwcG9ydCA1MiBiaXRzLCBh
bmQgZm9yIHRoaXMsCj4+Pj4+IE9BWzUxOjQ4XSBhcmUgc3RvcmVkIGluIFBURVsxNToxMl0uIEJ1
dCA1MiBiaXRzIGZvciA0SyBhbmQgMTZLIGJhc2UgcGFnZXMgaXMKPj4+Pj4gY29taW5nIChob3Bl
ZnVsbHkgdjYuOSkgYW5kIGluIHRoaXMgY2FzZSBPQVs1MTo1MF0gYXJlIHN0b3JlZCBpbiBQVEVb
OTo4XS4KPj4+Pj4gRm9ydHVuYXRlbHkgd2UgYWxyZWFkeSBoYXZlIGhlbHBlcnMgaW4gYXJtNjQg
dG8gYWJzdHJhY3QgdGhpcy4KPj4+Pj4KPj4+Pj4gU28gSSB0aGluayBhcm02NCB3aWxsIHdhbnQg
dG8gZGVmaW5lIGl0cyBvd24gcHRlX25leHRfcGZuKCk6Cj4+Pj4+Cj4+Pj4+ICNkZWZpbmUgcHRl
X25leHRfcGZuIHB0ZV9uZXh0X3Bmbgo+Pj4+PiBzdGF0aWMgaW5saW5lIHB0ZV90IHB0ZV9uZXh0
X3BmbihwdGVfdCBwdGUpCj4+Pj4+IHsKPj4+Pj4gwqDCoMKgwqDCoHJldHVybiBwZm5fcHRlKHB0
ZV9wZm4ocHRlKSArIDEsIHB0ZV9wZ3Byb3QocHRlKSk7Cj4+Pj4+IH0KPj4+Pj4KPj4+Cj4+PiBE
aWdnaW5nIGludG8gdGhlIGRldGFpbHMsIG9uIGFybTY0IHdlIGhhdmU6Cj4+Pgo+Pj4gI2RlZmlu
ZSBwdGVfcGZuKHB0ZSnCoMKgwqDCoMKgwqDCoMKgwqDCoCAoX19wdGVfdG9fcGh5cyhwdGUpID4+
IFBBR0VfU0hJRlQpCj4+Pgo+Pj4gYW5kCj4+Pgo+Pj4gI2RlZmluZSBfX3B0ZV90b19waHlzKHB0
ZSnCoMKgwqDCoCAocHRlX3ZhbChwdGUpICYgUFRFX0FERFJfTUFTSykKPj4+Cj4+PiBCdXQgdGhh
dCBpbXBsaWVzLCB0aGF0IHVwc3RyZWFtIHRoZSBQRk4gaXMgYWx3YXlzIGNvbnRpZ3VvdXMsIG5v
Pwo+Pj4KPj4KPj4KPj4gQnV0IF9fcHRlX3RvX3BoeXMoKSBhbmQgX19waHlzX3RvX3B0ZV92YWwo
KSBkZXBlbmQgb24gYSBLY29uZmlnLiBJZiBQQSBiaXRzIGlzCj4+IDUyLCB0aGUgYml0cyBhcmUg
bm90IGFsbCBjb250aWd1b3VzOgo+Pgo+PiAjaWZkZWYgQ09ORklHX0FSTTY0X1BBX0JJVFNfNTIK
Pj4gc3RhdGljIGlubGluZSBwaHlzX2FkZHJfdCBfX3B0ZV90b19waHlzKHB0ZV90IHB0ZSkKPj4g
ewo+PiDCoMKgwqDCoHJldHVybiAocHRlX3ZhbChwdGUpICYgUFRFX0FERFJfTE9XKSB8Cj4+IMKg
wqDCoMKgwqDCoMKgICgocHRlX3ZhbChwdGUpICYgUFRFX0FERFJfSElHSCkgPDwgUFRFX0FERFJf
SElHSF9TSElGVCk7Cj4+IH0KPj4gc3RhdGljIGlubGluZSBwdGV2YWxfdCBfX3BoeXNfdG9fcHRl
X3ZhbChwaHlzX2FkZHJfdCBwaHlzKQo+PiB7Cj4+IMKgwqDCoMKgcmV0dXJuIChwaHlzIHwgKHBo
eXMgPj4gUFRFX0FERFJfSElHSF9TSElGVCkpICYgUFRFX0FERFJfTUFTSzsKPj4gfQo+PiAjZWxz
ZQo+PiAjZGVmaW5lIF9fcHRlX3RvX3BoeXMocHRlKcKgwqDCoCAocHRlX3ZhbChwdGUpICYgUFRF
X0FERFJfTUFTSykKPj4gI2RlZmluZSBfX3BoeXNfdG9fcHRlX3ZhbChwaHlzKcKgwqDCoCAocGh5
cykKPj4gI2VuZGlmCj4+Cj4gCj4gQWgsIGhvdyBjb3VsZCBJJ3ZlIG1pc3NlZCB0aGF0LiBBZ3Jl
ZWQsIHNldF9wdGVzKCkgYW5kIHRoaXMgcGF0Y2ggYXJlIGJyb2tlbi4KPiAKPiBEbyB5b3Ugd2Fu
dCB0byBzZW5kIGEgcGF0Y2ggdG8gaW1wbGVtZW50IHB0ZV9uZXh0X3BmbigpIG9uIGFybTY0LCBh
bmQgdGhlbiB1c2UKPiBwdGVfbmV4dF9wZm4oKSBpbiBzZXRfcHRlcygpPyBUaGVuIEkgY2FuIGRy
b3AgdGhpcyBwYXRjaCBoZXJlIGNvbXBsZXRlbHkgZnJvbQo+IHRoaXMgc2VyaWVzLgoKWWVzIGdv
b2QgaWRlYS4gSSBwcm9iYWJseSB3b24ndCBnZXQgYXJvdW5kIHRvIGl0IHVudGlsIHRvbW9ycm93
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
