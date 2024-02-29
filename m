Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D61C54E41
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Feb 2024 15:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rFkVU179Th6pAtzhSFaAZeSaH7jklVH18bQtWIZJWo=; b=o/iBjbPNV0diyB
	xwGQQXwI9S1+Ol/QIwAL/NCGuGVNK2CrW7un9wwor/W/+t0bPgZOFFM7lSPQsmxPyROgzbEdrjTc9
	ize+TD7svEeGCCT2AzXRo2HNatB0hzHiz2vzX04Szdt7YvXqz1peFwGXxW6zZrv+VMLJksKrvYVm7
	d9oM6wukOjB6INLckfOe8BWivcCYbdo2Z76K6KBBzhK27/eEmHTx7tiP/x1t9UtR/RsGfx4UziOlA
	vSP0CxfkaHQw+pUUWYkm+KEvaly4k9RAQNAQWriezyoGR67Dd1+QaHTODLdXJQilvFdBpFZDiDUuU
	OViaqz+mCqqF/ZOJgm/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfiV4-0000000E5WJ-3b3c;
	Thu, 29 Feb 2024 15:39:10 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfiV0-0000000E5Va-2dZD
	for linux-riscv@lists.infradead.org;
	Thu, 29 Feb 2024 15:39:08 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 4F7B720008;
	Thu, 29 Feb 2024 15:38:59 +0000 (UTC)
Message-ID: <97fec9bc-3b19-4b4e-8627-81c6f9298c4c@ghiti.fr>
Date: Thu, 29 Feb 2024 16:38:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -fixes] riscv: Sparse-Memory/vmemmap out-of-bounds fix
Content-Language: en-US
To: Dimitris Vlachos <dvlachos@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 palmer@dabbelt.com, alexghiti@rivosinc.com, paul.walmsley@sifive.com
Cc: clameter@sgi.com, akpm@linux-foundation.org, rppt@kernel.org,
 arnd@arndb.de, mick@ics.forth.gr, csd4492@csd.uoc.gr, maraz@ics.forth.gr
References: <20240229143833.107724-1-dvlachos@ics.forth.gr>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20240229143833.107724-1-dvlachos@ics.forth.gr>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_073906_822255_30179EA8 
X-CRM114-Status: GOOD (  15.56  )
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

SGkgRGltaXRyaSwKCk9uIDI5LzAyLzIwMjQgMTU6MzgsIERpbWl0cmlzIFZsYWNob3Mgd3JvdGU6
Cj4gT2Zmc2V0IHZtZW1tYXAgc28gdGhhdCB0aGUgZmlyc3QgcGFnZSBvZiB2bWVtbWFwIHdpbGwg
YmUgbWFwcGVkCj4gdG8gdGhlIGZpcnN0IHBhZ2Ugb2YgcGh5c2ljYWwgbWVtb3J5IGluIG9yZGVy
IHRvIGVuc3VyZSB0aGF0Cj4gdm1lbW1hcOKAmXMgYm91bmRzIHdpbGwgYmUgcmVzcGVjdGVkIGR1
cmluZwo+IHBmbl90b19wYWdlKCkvcGFnZV90b19wZm4oKSBvcGVyYXRpb25zLgo+IFRoZSBjb252
ZXJzaW9uIG1hY3JvcyB3aWxsIHByb2R1Y2UgY29ycmVjdCBTVjM5LzQ4LzU3IGFkZHJlc3Nlcwo+
IGZvciBldmVyeSBwb3NzaWJsZS92YWxpZCBEUkFNX0JBU0UgaW5zaWRlIHRoZSBwaHlzaWNhbCBt
ZW1vcnkgbGltaXRzLgo+Cj4gVGhpcyBpcyB0aGUgbGluayB0byB0aGUgcmVsZXZhbnQgY29udmVy
c2F0aW9uIGFuZCBidWcgcmVwb3J0Lgo+IExpbmsgOmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LXJpc2N2LzIwMjQwMjAyMTM1MDMwLjQyMjY1LTEtY3NkNDQ5MkBjc2QudW9jLmdyCj4KPiBD
by1kZXZlbG9wZWQtYnk6IEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4K
CgpZb3UgY2FuIHN3aXRjaCB0aGF0IHRvIGEgU3VnZ2VzdGVkLWJ5LCBJIGRpZCBub3Qgd3JpdGUg
dGhlIGNvZGUgbm9yIHRlc3QgCmFueXRoaW5nIDopCgoKPiBTaWduZWQtb2ZmLWJ5OiBEaW1pdHJp
cyBWbGFjaG9zIDxkdmxhY2hvc0BpY3MuZm9ydGguZ3I+Cj4gUmVwb3J0ZWQtYnk6IERpbWl0cmlz
IFZsYWNob3MgPGR2bGFjaG9zQGljcy5mb3J0aC5ncj4KCgpJIHRoaW5rIGNoZWNrcGF0Y2ggd2ls
bCBjb21wbGFpbiB0aGF0IGEgTGluayBvciBDbG9zZXMgdGFnIHNob3VsZCBmb2xsb3cgCmEgUmVw
b3J0ZWQtYnk6IEkgd291bGQgbW92ZSB0aGUgTGluayB0YWcgaW4geW91ciBjb21taXQgbWVzc2Fn
ZSBoZXJlLgoKQW5kIHdlIG1pc3MgYSBGaXhlcyB0YWcgdG9vLCBJIHdvdWxkIGdvIGZvcjoKCkZp
eGVzOiBkOTVmMWE1NDJjM2QgKCJSSVNDLVY6IEltcGxlbWVudCBzcGFyc2VtZW0iKQoKCj4gLS0t
Cj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaCB8IDIgKy0KPiAgIDEgZmlsZSBj
aGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9w
Z3RhYmxlLmgKPiBpbmRleCAwYzk0MjYwYjUuLjg3NWM5YTA3OSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L2luY2x1ZGUvYXNtL3BndGFibGUuaAo+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4gQEAgLTg0LDcgKzg0LDcgQEAKPiAgICAqIERlZmluZSB2bWVtbWFwIGZv
ciBwZm5fdG9fcGFnZSAmIHBhZ2VfdG9fcGZuIGNhbGxzLiBOZWVkZWQgaWYga2VybmVsCj4gICAg
KiBpcyBjb25maWd1cmVkIHdpdGggQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGVuYWJsZWQuCj4g
ICAgKi8KPiAtI2RlZmluZSB2bWVtbWFwCQkoKHN0cnVjdCBwYWdlICopVk1FTU1BUF9TVEFSVCkK
PiArI2RlZmluZSB2bWVtbWFwCQkoKHN0cnVjdCBwYWdlICopVk1FTU1BUF9TVEFSVCAtIChwaHlz
X3JhbV9iYXNlID4+IFBBR0VfU0hJRlQpKQo+ICAgCj4gICAjZGVmaW5lIFBDSV9JT19TSVpFICAg
ICAgU1pfMTZNCj4gICAjZGVmaW5lIFBDSV9JT19FTkQgICAgICAgVk1FTU1BUF9TVEFSVAoKWW91
IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3Np
bmMuY29tPgoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
