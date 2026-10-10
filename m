Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2872CCA6004
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 03:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KswpLTXGmkAC0KP6updA6tr9HYJ2pKuVtmDFR1EAnjI=; b=byFiSETdd3FuCO
	7ZSMzQEXqGMCkok9UQ89xk7hoBC0SWK5TH6kaeagsDXyjSnuz246uf6EwczLqeSDrXZJfiXfrVl1t
	ethCdch9OBNBbEmK22h3Ce0pVmzlChDU/CQ4wQz38YiBAmF1mit5KUlaWkyZbyJFgIlSk3ruym0la
	mrbspFHGCvzX6pc0HsjpgqqYwJNMjAuKPb+KXHvPMgHUS3Q3j3KS8QRLr1sJIH5XAlDd1Rl4CNMf0
	bD8I0udoDD3j+84I7tplnlYn625uEbDT8Q52JWFEMei5w2j3pbUsik6UgCF+uznCc06XMNPPUu0X1
	A5K9XQdq5MUzCuSn8TkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNzw-00000007TmZ-1SGU;
	Sat, 10 Oct 2026 03:43:48 +0000
Received: from out-228.mta0.migadu.com ([2001:41d0:1004:224b::e4] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFNzt-00000007Tll-2QVc
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 03:43:47 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=e2Gg2A0pOiUOVFvGVHWV6wr7kkqR+muGcjituStXuzA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791603823; v=1; x=1792208623;
 b=knhHF/JDy9lkKxtZQnxgn3u7UyjAyvUOTckxSbLlK7a1iULv3C7sntUsb9k9jijBoEqjPsVM
 glo48k56/pu9rwM90gWWg3q6OH00dLjyEQldwtk9MV10cDWKYN/Fz1G82iksnDzUo8iWdJ3p3Nw
 lAciycb8CyOb7GiowS9UrO94=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 14bbb4f2a2970250;
	Sat, 10 Oct 2026 03:43:43 +0000
X-Mizu-Trace-ID: 14bbb4f2a2970250
X-Migadu-Flow: FLOW_OUT
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.12\))
Subject: Re: [PATCH 4/4] arm64/mm: fix destructor for unconstructed hotplug
 page tables
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <d47bdf83-1db4-4601-a516-7e23488ea9cf@kernel.org>
Date: Sat, 10 Oct 2026 11:43:23 +0800
Cc: Muchun Song <songmuchun@bytedance.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 stable@vger.kernel.org,
 osalvador@suse.de,
 dave.hansen@linux.intel.com,
 luto@kernel.org,
 peterz@infradead.org,
 tglx@kernel.org,
 mingo@redhat.com,
 bp@alien8.de,
 x86@kernel.org,
 hpa@zytor.com,
 catalin.marinas@arm.com,
 will@kernel.org,
 mark.rutland@arm.com,
 linux-arm-kernel@lists.infradead.org,
 pjw@kernel.org,
 palmer@dabbelt.com,
 aou@eecs.berkeley.edu,
 alex@ghiti.fr,
 linux-riscv@lists.infradead.org,
 agordeev@linux.ibm.com,
 kevin.brodsky@arm.com,
 bjorn@rivosinc.com,
 apopple@nvidia.com,
 linux-kernel@vger.kernel.org
Message-Id: <DDFF90A3-86D7-42D6-844A-5D29A44BAB4D@linux.dev>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
 <20261008073021.2512665-5-songmuchun@bytedance.com>
 <d47bdf83-1db4-4601-a516-7e23488ea9cf@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_204346_123920_7A9679B3 
X-CRM114-Status: GOOD (  18.60  )
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

Cgo+IE9uIE9jdCAxMCwgMjAyNiwgYXQgMDQ6NDMsIERhdmlkIEhpbGRlbmJyYW5kIChBcm0pIDxk
YXZpZEBrZXJuZWwub3JnPiB3cm90ZToKPiAKPiBPbiAxMC84LzI2IDA5OjMwLCBNdWNodW4gU29u
ZyB3cm90ZToKPj4gQ29tbWl0IGM1OTRiODM0NTdjYyAoImFybTY0OiBtbTogY2FsbCBwYWdldGFi
bGUgZHRvciB3aGVuIGZyZWVpbmcKPj4gaG90LXJlbW92ZWQgcGFnZSB0YWJsZXMiKSBtYWRlIGZy
ZWVfaG90cGx1Z19wZ3RhYmxlX3BhZ2UoKQo+PiB1bmNvbmRpdGlvbmFsbHkgcnVuIHRoZSBwYWdl
LXRhYmxlIGRlc3RydWN0b3IuIFRoaXMgbWF0Y2hlcyBwYWdlIHRhYmxlcwo+PiBhbGxvY2F0ZWQg
YnkgdGhlIGFybTY0IG1hcHBpbmcgY29kZSwgd2hpY2ggcnVucyB0aGUgY29ycmVzcG9uZGluZwo+
PiBjb25zdHJ1Y3RvcnMuCj4+IAo+PiBIb3dldmVyLCBhcm02NCBhbHNvIHVzZXMgdGhlIGdlbmVy
aWMgc3BhcnNlLXZtZW1tYXAgcG9wdWxhdGlvbiBjb2RlLgo+PiBSdW50aW1lIGludGVybWVkaWF0
ZSBwYWdlIHRhYmxlcyBhbGxvY2F0ZWQgYnkgdGhhdCBjb2RlIGRvIG5vdCBydW4gYQo+PiBwYWdl
LXRhYmxlIGNvbnN0cnVjdG9yLgo+IAo+IFdoeSBkbyB3ZSBoYXZlIHRoYXQgaW5jb25zaXN0ZW5j
eT8gSXQgc2VlbXMgdG8gY2F1c2UgcGFpbiA6KQoKSGEsIHllYWgsIGl0J3MgYSBiaXQgcGFpbmZ1
bCA6KQoKSSB0aGluayBpdCdzIGJlY2F1c2UgdGhlIGFyY2ggZm9sa3MgZGlkbid0IHJlYWxpemUg
dGhhdCB2bWVtbWFwIHBvcHVsYXRpb24KZG9lcyBub3QgcnVuIGEgcGFnZS10YWJsZSBjb25zdHJ1
Y3Rvci4KCkJ1dCB0aGUgaW5jb25zaXN0ZW5jeSBpcyB0ZW1wb3Jhcnkg4oCUIEkgZGVsaWJlcmF0
ZWx5IGtlcHQgaXQgc28gdGhlIGJ1ZyBmaXhlcwphcmUgZWFzaWVyIHRvIGJhY2twb3J0LiBBZnRl
ciB0aG9zZSBmaXhlcyBsYW5kLCBJJ2xsIGZvbGxvdyB1cCB3aXRoIHRoZQp1bmlmaWVkIHNlcmll
cywgd2hpY2ggd2lsbCBtYWtlIHZtZW1tYXAgcG9wdWxhdGlvbiBydW4gYSBwYWdlLXRhYmxlCmNv
bnN0cnVjdG9yLgoKPiAKPj4gRnJlZWluZyBvbmUgZHVyaW5nIG1lbW9yeSBob3QtcmVtb3ZlIHRo
ZXJlZm9yZQo+PiBydW5zIGEgZGVzdHJ1Y3RvciB3aXRob3V0IGEgbWF0Y2hpbmcgY29uc3RydWN0
b3IgYW5kIGNvcnJ1cHRzCj4+IE5SX1BBR0VUQUJMRSBhY2NvdW50aW5nLgo+PiAKPj4gVXNlIFBh
Z2VUYWJsZSgpIHRvIHJ1biB0aGUgZGVzdHJ1Y3RvciBvbmx5IGZvciBwYWdlLXRhYmxlIHBhZ2Vz
IHdob3NlCj4+IGNvbnN0cnVjdG9yIGluaXRpYWxpemVkIHRoZW0uIFRoaXMga2VlcHMgdGhlIGFy
bTY0LWNyZWF0ZWQgcGFnZS10YWJsZQo+PiBsaWZlY3ljbGUgYmFsYW5jZWQgd2hpbGUgc2FmZWx5
IGZyZWVpbmcgY29uc3RydWN0b3ItZnJlZSB2bWVtbWFwIHRhYmxlcy4KPj4gCj4+IEZpeGVzOiBj
NTk0YjgzNDU3Y2MgKCJhcm02NDogbW06IGNhbGwgcGFnZXRhYmxlIGR0b3Igd2hlbiBmcmVlaW5n
IGhvdC1yZW1vdmVkIHBhZ2UgdGFibGVzIikKPj4gQ2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcK
Pj4gQXNzaXN0ZWQtYnk6IExMTQo+PiBTaWduZWQtb2ZmLWJ5OiBNdWNodW4gU29uZyA8c29uZ211
Y2h1bkBieXRlZGFuY2UuY29tPgo+PiAtLS0KPj4gYXJjaC9hcm02NC9tbS9tbXUuYyB8IDMgKyst
Cj4+IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4gCj4+
IGRpZmYgLS1naXQgYS9hcmNoL2FybTY0L21tL21tdS5jIGIvYXJjaC9hcm02NC9tbS9tbXUuYwo+
PiBpbmRleCA3MzQzYWM5Mjk0ZjguLjY4OGIzMzA5NTY1MSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9h
cm02NC9tbS9tbXUuYwo+PiArKysgYi9hcmNoL2FybTY0L21tL21tdS5jCj4+IEBAIC0xNDk1LDcg
KzE0OTUsOCBAQCBzdGF0aWMgdm9pZCBmcmVlX2hvdHBsdWdfcGFnZV9yYW5nZShzdHJ1Y3QgcGFn
ZSAqcGFnZSwgc2l6ZV90IHNpemUsCj4+IAo+PiBzdGF0aWMgdm9pZCBmcmVlX2hvdHBsdWdfcGd0
YWJsZV9wYWdlKHN0cnVjdCBwYWdlICpwYWdlKQo+PiB7Cj4+IC0gCXBhZ2V0YWJsZV9kdG9yKHBh
Z2VfcHRkZXNjKHBhZ2UpKTsKPj4gKyAJaWYgKFBhZ2VUYWJsZShwYWdlKSkKPj4gKyAJCXBhZ2V0
YWJsZV9kdG9yKHBhZ2VfcHRkZXNjKHBhZ2UpKTsKPj4gCWZyZWVfaG90cGx1Z19wYWdlX3Jhbmdl
KHBhZ2UsIFBBR0VfU0laRSwgTlVMTCk7Cj4gCj4gVGhhdCByZXN1bHRzIGluIGEgX19mcmVlX3Bh
Z2VzKCkgZm9yICBvbmVzIGFsbG9jYXRlZCBieSBzcGFyc2Utdm1lbW1hcAo+IHBvcHVsYXRpb24g
Y29kZS4gQXJlIHdlIHN1cmUgdGhhdCdzIHRoZSByaWdodCB0aGluZyB0byBkbz8KCkdvb2QgcG9p
bnQuIGZyZWVfaG90cGx1Z19wZ3RhYmxlX3BhZ2UoKSBpcyB1c2VkIHRvIGZyZWUgaW50ZXJtZWRp
YXRlCnBhZ2UtdGFibGUgcGFnZXMsIHNvIHBhZ2V0YWJsZV9mcmVlKCkgaXMgdGhlIG1vcmUgYXBw
cm9wcmlhdGUgaW50ZXJmYWNlCmhlcmUuCgo+IAo+IFRoaXMgaXMgYWxsIHNvIGluY29uc2lzdGVu
dCBhbmQgY29uZnVzaW5nIDooCgpZZWFoLCBzbyBJJ20gd29ya2luZyBvbiByZW1vdmluZyB0aGVz
ZSBpbmNvbnNpc3RlbmNpZXMuCgpUaGFua3MsCk11Y2h1bgoKPiAKPiAtLSAKPiBDaGVlcnMsCj4g
Cj4gRGF2aWQKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
