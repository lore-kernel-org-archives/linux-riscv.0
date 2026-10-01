Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 670D0CA5FD4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Oct 2026 21:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HuFmr3IPEhYcPtpgXHdKAgeECKJ++a0GZG09BgxJon8=; b=jCwP32JdflhFoR
	2rKRo5m0eL9YP2OhlyD+WkZef4K55EIOhnkq1POzXg6v7XmQ2zuLcAj07B1jSQz5kA40VClBdQVMt
	npGpX/FNFGJtqrgvJ0CvUYNuZbl4+p9A60AlOn2WzWTNmDxg7gQkda9bftK/nJuN/oWwvr8kaaRKG
	na7xFPUAHTY9VNg+7gQoFqTvJSBJqjAEEX9le59fOksE+Rlyfx9iLemxXfYAFtKycC3TYsGFe8EAC
	/Y4FxFW0QEpFWw4LTmyjQcUKUxJ4VROI+7LY0TbQyBdS5EZ4EAGvGiMi1GCC6f1sDXwloxaMj7oAu
	6D2T/yetG/Zh88YL0Njg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO4r-0000000AEtO-26pj;
	Thu, 01 Oct 2026 21:12:29 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO4k-0000000AEsD-2coW;
	Thu, 01 Oct 2026 21:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=yV3OoqhhTOyvLfdzMAWwmTNQmt2i01UTi3FCUoHNWiw=; b=N3eGFqkw2bH2ZVrnw5+je4uWhZ
	J+5Vt4ELsqK0nd7/5K0Dd3phpnJ11mcwHS9Ckj3NnVfMsk3pJIqKyXmFaO6aqqA1wUOjjbfAe5arF
	TXtggCg1hUKUMga2W9gTs9o/sg+Zks2X3RF48SVs0T94Jmo+mUUucCvXppgBF7+LGEeIqIZshggBe
	Uj12hMsorknpIKgwpTe1E0upzf6OQpQnfPN4W6l1K6OQ73Y+dEepsFpKQcPnSMS5u6W9c74ZrdYyK
	xX8PEkyeFYpBoW7g/MrJJK8Xb3/ePcA+lpljARA7IhJfalxxtq5SGY3d0Y5fDh4Aq7VYWlkLzvhKy
	s/2qqAIQ==;
Received: from willy by casper.infradead.org with local (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCO4e-0000000A0JS-34rA;
	Thu, 01 Oct 2026 21:12:16 +0000
Date: Thu, 1 Oct 2026 22:12:16 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Barry Song <baohua@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Hongru Zhang <zhanghongru06@gmail.com>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, surenb@google.com,
	david@kernel.org, liam@infradead.org, mhocko@suse.com,
	rppt@kernel.org, shakeel.butt@linux.dev, vbabka@kernel.org,
	zhaonanzhe@xiaomi.com, linux@armlinux.org.uk,
	catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org, chenhuacai@kernel.org,
	kernel@xen0n.name, loongarch@lists.linux.dev, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	linuxppc-dev@lists.ozlabs.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, agordeev@linux.ibm.com,
	gerald.schaefer@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com,
	linux-s390@vger.kernel.org, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
	Hongru Zhang <zhanghongru@xiaomi.com>
Subject: Re: [PATCH v6] mm: retry page faults once under the per-VMA lock
Message-ID: <ar7MsOb6IJLt4eLo@casper.infradead.org>
References: <20260911025613.1220845-1-zhanghongru@xiaomi.com>
 <arFYRAa-i7CIwmHL@gremlin>
 <arF-E3Nsw9ZliH0t@casper.infradead.org>
 <arI_w2wTfA00Mgy9@gremlin>
 <armexcXDiG8ryZd6@casper.infradead.org>
 <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4xuFi7K+crAcFQ998SxXS0xPM6QeA34JV+6+Sy005rXLg@mail.gmail.com>
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

T24gTW9uLCBTZXAgMjgsIDIwMjYgYXQgMTA6NDg6NDFBTSArMDgwMCwgQmFycnkgU29uZyB3cm90
ZToKPiBPbiBNb24sIFNlcCAyOCwgMjAyNiBhdCA2OjU14oCvQU0gTWF0dGhldyBXaWxjb3ggPHdp
bGx5QGluZnJhZGVhZC5vcmc+IHdyb3RlOgo+ID4gU28gd2hpbGUgZG9pbmcgbXkgc2xpZGVzLCBJ
IHJlYWxpc2VkIHRoYXQgd2hhdCB3ZSBuZWVkIHRvIGF2b2lkIGRvaW5nCj4gPiBpcyAoYSkgc2xl
ZXBpbmcgd2hpbGUgaG9sZGluZyB0aGUgbW1hcF9sb2NrIChiKSByZXR1cm5pbmcgUkVUUlkgd2hp
bGUKPiA+IGhvbGRpbmcgdGhlIFZNQSBsb2NrCj4gPgo+ID4gQW5kIHRoYXQgdHVybnMgb3V0IHRv
IGJlIGFzIHNpbXBsZSBhcyB0aGlzIHBhdGNoOgo+ID4KPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRl
L2xpbnV4L21tLmggYi9pbmNsdWRlL2xpbnV4L21tLmgKPiA+IGluZGV4IGRkMDljNDM4ZmEyMy4u
OTRlZDIzMzNmOGQ4IDEwMDY0NAo+ID4gLS0tIGEvaW5jbHVkZS9saW51eC9tbS5oCj4gPiArKysg
Yi9pbmNsdWRlL2xpbnV4L21tLmgKPiA+IEBAIC03MjMsNiArNzIzLDggQEAgZW51bSB7Cj4gPiAg
ICovCj4gPiAgc3RhdGljIGlubGluZSBib29sIGZhdWx0X2ZsYWdfYWxsb3dfcmV0cnlfZmlyc3Qo
ZW51bSBmYXVsdF9mbGFnIGZsYWdzKQo+ID4gIHsKPiA+ICsgICAgICAgaWYgKGZsYWdzICYgRkFV
TFRfRkxBR19WTUFfTE9DSykKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAg
ICAgICAgIHJldHVybiAoZmxhZ3MgJiBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZKSAmJgo+ID4gICAg
ICAgICAgICAgKCEoZmxhZ3MgJiBGQVVMVF9GTEFHX1RSSUVEKSk7Cj4gPiAgfQo+ID4KPiA+IE9L
LCB0aGlzIGlzIGEgaGFjay4gIFRoZSBmdW5jdGlvbiBpcyBzcGVjdGFjdWxhcmx5IGJhZGx5IG5h
bWVkLCBhbmQKPiA+IG5lZWRzIHRvIGJlIHJlbmFtZWQgYmVmb3JlIGEgcGF0Y2ggY2FuIGdvIHVw
c3RyZWFtLiAgQnV0IHRoaXMgc2hvdWxkCj4gPiBmaXggdGhlIGNvbnRlbnRpb24gb24gbW1hcF9s
b2NrLgo+IAo+IFRoYW5rcyBmb3IgeW91ciBzdWdnZXN0aW9uLgo+IFRoaXMgaXMgZXhhY3RseSB3
aGF0IHdlIGRpZCBpbiBBbmRyb2lkIENvbW1vbiBLZXJuZWwgYmVmb3JlIHdlIGhhZAo+IExvcmVu
em8ncyBwcm9wb3NhbCAoYnlwYXNzaW5nIGBmYXVsdF9mbGFnX2FsbG93X3JldHJ5X2ZpcnN0KClg
KToKPiAKPiBodHRwczovL2FuZHJvaWQuZ29vZ2xlc291cmNlLmNvbS9rZXJuZWwvY29tbW9uLysv
MWI5YjA0NWE1ODYyNDVjYzFjMjliMjc0N2M2NTg2MjM0YzdmNWJhZCU1RSUyMS8jRjIKCkxvb2tz
IGxpa2UgdGhhdCBvbmUgZGlkbid0IGNvdmVyIF9fZm9saW9fbG9ja19vcl9yZXRyeSgpLCBidXQg
dGhhdApkb2Vzbid0IGludmFsaWRhdGUgeW91ciBwb2ludC4KCj4gTm90ZSB0aGF0IExvcmVuem8n
cyBwcm9wb3NhbCBhdm9pZHMgbW1hcF9sb2NrIGNvbnRlbnRpb24gd2l0aG91dAo+IGludHJvZHVj
aW5nIGFueSBuZXcgVk1BIGxvY2sgY29udGVudGlvbi4gSXQgYWxzbyBkb2Vzbid0IHJlcXVpcmUg
YSBuZXcKPiBmbGFnIHRoYXQgd291bGQgYnJlYWsgS01JLiBTbyB0aGlzIGlzIGNsZWFybHkgdGhl
IHByZWZlcnJlZCBhcHByb2FjaC4KCkJ1dCBpdCBkb2VzIHJldHJ5IG11bHRpcGxlIHRpbWVzIGlu
IGNhc2VzIHdoZXJlIHdlIGtub3cgdGhlIGZhdWx0CndpbGwgYWx3YXlzIGZhaWwgKGVnIHRoZSBm
YXVsdCBpcyBvbiBhIGRldmljZS1wcml2YXRlIFZNQSkKCj4gPiBDb3VsZCBzb21lYm9keSB0cnkg
aXQ/ICBJJ3ZlIHZlcmlmaWVkIGl0IGJvb3RzIGFuZCBydW5zIHNvbWUgdXNlcnNwYWNlCj4gPiBm
aW5lLCBidXQgSSBkb24ndCBoYXZlIHRoZSB3b3JrbG9hZCB0byB0ZXN0IHRoZSBjb250ZW50aW9u
Lgo+IAo+IEJvdGggTmFuemhlIGFuZCBIb25ncnUgdGVzdGVkIGl0IGJlZm9yZSBhbmQgcmVwb3J0
ZWQgdGhlIGZvcmsgaXNzdWUuCgpTbyB3aGF0IEkgZGlkbid0IHJlYWxpc2UgaXMgdGhhdCBmb3Jr
KCkgd2FpdHMgZm9yIHBhZ2UgZmF1bHRzIHRvIGZpbmlzaC4KSSBkb24ndCB0aGluayB0aGF0J3Mg
bmVjZXNzYXJ5LCBzbyB3ZSBjYW4ganVzdCBzdG9wIGRvaW5nIHRoYXQgKHdoaXRlc3BhY2UKZGFt
YWdlZCk6CgpkaWZmIC0tZ2l0IGEvbW0vbW1hcC5jIGIvbW0vbW1hcC5jCmluZGV4IDRiZjI2YjBm
MWU2ZS4uZTc5NTU1MjQ3ZDNhIDEwMDY0NAotLS0gYS9tbS9tbWFwLmMKKysrIGIvbW0vbW1hcC5j
CkBAIC0xNzM5LDkgKzE3MzksNiBAQCBfX2xhdGVudF9lbnRyb3B5IGludCBkdXBfbW1hcChzdHJ1
Y3QgbW1fc3RydWN0ICptbSwgc3RydWN0IG1tX3N0cnVjdCAqb2xkbW0pCiAgICAgICAgZm9yX2Vh
Y2hfdm1hKHZtaSwgbXBudCkgewogICAgICAgICAgICAgICAgc3RydWN0IGZpbGUgKmZpbGU7Cgot
ICAgICAgICAgICAgICAgcmV0dmFsID0gdm1hX3N0YXJ0X3dyaXRlX2tpbGxhYmxlKG1wbnQpOwot
ICAgICAgICAgICAgICAgaWYgKHJldHZhbCA8IDApCi0gICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gbG9vcF9vdXQ7CiAgICAgICAgICAgICAgICBpZiAodm1hX3Rlc3QobXBudCwgVk1BX0RPTlRD
T1BZX0JJVCkpIHsKICAgICAgICAgICAgICAgICAgICAgICAgcmV0dmFsID0gdm1hX2l0ZXJfY2xl
YXJfZ2ZwKCZ2bWksIG1wbnQtPnZtX3N0YXJ0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgbXBudC0+dm1fZW5kLCBHRlBfS0VSTkVMKTsKCkkgdGhp
bmsgdGhpcyBpcyBzYWZlLiAgSSd2ZSBib290ZWQgYSBrZXJuZWwgd2l0aCB0aGlzIGNoYW5nZSwg
YW5kCmV2ZXJ5dGhpbmcgc2VlbXMgdG8gcnVuIGZpbmUuICBPZiBjb3Vyc2UgSSBkb24ndCBoYXZl
IGFueSBtdWx0aXRocmVhZGVkCmFwcGxpY2F0aW9ucyB3aGljaCBjYWxsIGZvcmsoKSBiZWNhdXNl
IHRoYXQncyBhIHN0dXBpZCB3YXkgdG8gd3JpdGUgYW4KYXBwbGljYXRpb24sIHNvIGl0J3Mgbm90
IHJlYWxseSB0ZXN0ZWQuCgpNeSBhcmd1bWVudCBmb3Igd2h5IGl0J3Mgc2FmZSBpcyB0aGF0IGEg
dGhyZWFkIHdoaWNoIHRha2VzIGEgcGFnZQpmYXVsdCBkdXJpbmcgZm9yaygpIG1pZ2h0IGhhdmUg
dGFrZW4gdGhlIHBhZ2UgZmF1bHQgZWl0aGVyIGJlZm9yZSBvcgphZnRlciBmb3JrKCkuICBUaGUg
ZmF1bHRzIHdpbGwgZGVmaW5pdGVseSBoYXBwZW4gaW4gdGhlIHBhcmVudCBwcm9jZXNzLgpUaGV5
IG1heSBvciBtYXkgbm90IGhhdmUgaGFwcGVuZWQgaW4gdGhlIGNoaWxkIHByb2Nlc3MsIHdoaWNo
IGNhbid0CnBvc3NpYmx5IGNhcmUgd2hldGhlciBvciBub3QgdGhleSd2ZSBoYXBwZW5lZC4KClRo
ZSBvbmx5IGRpZmZlcmVuY2UgSSBjYW4gdGhpbmsgb2YgYmVpbmcgb2JzZXJ2YWJsZSBpcyB0aGF0
IHRoZSBjaGlsZAptYXkgb2JzZXJ2ZSBzb21lIGxhdGVyIGZhdWx0cyB0byBoYXZlIG9jY3VycmVk
LCB3aGlsZSBzb21lIGVhcmxpZXIgZmF1bHRzCnRvIGhhdmUgbm90IG9jY3VycmVkLiAgSSBoYXZl
IGEgaGFyZCB0aW1lIGJlbGlldmluZyBhbnkgYXBwbGljYXRpb24gY2FuCnBvc3NpYmx5IGRlcGVu
ZCBvbiBpdC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
