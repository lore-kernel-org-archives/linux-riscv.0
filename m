Return-Path: <SRS0=cI7w=RZ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B02C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 20:27:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 08C3B21841
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Mar 2019 20:27:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KJIqOp6T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 08C3B21841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dlw3Z5yBDHe/aMycxzZjF2SDXvzvYvlbbenVhfgSKks=; b=KJIqOp6Tp9c0Sy
	cnoO782YJSiMIyKU5rG2cat3KctwggH/q+3NrP1Z1jHy4fjUGqXBXA5U4iCdiY5AkKyTkcEICVjWn
	3IHw4z1J+KeZy+9x4YB3rG3YXlgokfvWpNgPsrHg0aNAifm9MKHh4wYPwSD9OvC2bFVBQAq+OLFiB
	gPUp17JrhQfBQpMhh3h7L7JBB6dEDL5at12tfsQmxnO/3hEdQpJP+thw2qVq8ZKlB2jJ82zCLXPjW
	aQ67Q58ucG3syw1I5E7TYC6OHoEhj6aashfBlis+aEgAri00bBD9PteYPMMXiJFGGqG0HFt2UFR+q
	aNnmOXE+IarsizIDQhqg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7QlV-0006Hr-Gv; Fri, 22 Mar 2019 20:27:45 +0000
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7QlL-00069d-Vp; Fri, 22 Mar 2019 20:27:37 +0000
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5DE1130821F9;
 Fri, 22 Mar 2019 20:27:33 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-47.bos.redhat.com [10.18.17.47])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D58115C6B3;
 Fri, 22 Mar 2019 20:27:26 +0000 (UTC)
Subject: Re: [PATCH v5 1/3] locking/rwsem: Remove arch specific rwsem files
To: Davidlohr Bueso <dave@stgolabs.net>,
 Linus Torvalds <torvalds@linux-foundation.org>
References: <20190322143008.21313-1-longman@redhat.com>
 <20190322143008.21313-2-longman@redhat.com>
 <CAHk-=wikkO-1f1=FEOEzkSnaDg3yJLP=4Vd59UCuLBztFd0KOw@mail.gmail.com>
 <20190322193010.azb7rmmmaclhal35@linux-r8p5>
From: Waiman Long <longman@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=longman@redhat.com; prefer-encrypt=mutual; keydata=
 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
 weim8xU=
Organization: Red Hat
Message-ID: <45315aa9-f006-c4ca-705f-71d6c2650508@redhat.com>
Date: Fri, 22 Mar 2019 16:27:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190322193010.azb7rmmmaclhal35@linux-r8p5>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Fri, 22 Mar 2019 20:27:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190322_132736_066574_51314A2D 
X-CRM114-Status: GOOD (  17.34  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Will Deacon <will.deacon@arm.com>,
 linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, linux-hexagon@vger.kernel.org,
 the arch/x86 maintainers <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 uclinux-h8-devel@lists.sourceforge.jp, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-um@lists.infradead.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, openrisc@lists.librecores.org,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 "linux-alpha@vger.kernel.org" <linux-arm-kernel@lists.infradead.org>,
 linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 nios2-dev@lists.rocketboards.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMDMvMjIvMjAxOSAwMzozMCBQTSwgRGF2aWRsb2hyIEJ1ZXNvIHdyb3RlOgo+IE9uIEZyaSwg
MjIgTWFyIDIwMTksIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+PiBTb21lIG9mIHRoZW0gX21pZ2h0
XyBiZSBwZXJmb3JtYW5jZS1jcml0aWNhbC4gVGhlcmUncyB0aGUgb25lIG9uCj4+IG1tYXBfc2Vt
IGluIHRoZSBmYXVsdCBoYW5kbGluZyBwYXRoLCBmb3IgZXhhbXBsZS4gQW5kIHllcywgSSdkIGV4
cGVjdAo+PiB0aGUgbm9ybWFsIGNhc2UgdG8gdmVyeSBtdWNoIGJlICJubyBvdGhlciByZWFkZXJz
IG9yIHdyaXRlcnMiIGZvciB0aGF0Cj4+IG9uZS4KPgo+IFllYWgsIHRoZSBtbWFwX3NlbSBjYXNl
IGluIHRoZSBmYXVsdCBwYXRoIGlzIHJlYWxseSBleHBlY3RpbmcgYW4gdW5sb2NrZWQKPiBzdGF0
ZS4gVG8gdGhlIHBvaW50IHRoYXQgZm91ciBhcmNocyBoYXZlIGFkZGVkIGJyYW5jaCBwcmVkaWN0
aW9ucywgaWU6Cj4KPiA5MjE4MWYxOTBiNiAoeDg2OiBvcHRpbWlzZSB4ODYncyBkb19wYWdlX2Zh
dWx0IChDIGVudHJ5IHBvaW50IGZvciB0aGUKPiBwYWdlIGZhdWx0IHBhdGgpKQo+IGIxNTAyMWQ5
OTRmIChwb3dlcnBjL21tOiBBZGQgYSBidW5jaCBvZiAodW4pbGlrZWx5IGFubm90YXRpb25zIHRv
Cj4gZG9fcGFnZV9mYXVsdCkKPgo+IEFuZCB1c2luZyBQUk9GSUxFX0FOTk9UQVRFRF9CUkFOQ0hF
UyBzaG93cyBwcmV0dHkgY2xlYXJseToKPiAod2l0aG91dCByZXNldHRpbmcgdGhlIGNvdW50ZXJz
KQo+Cj4gY29ycmVjdCBpbmNvcnJlY3TCoCAlwqDCoMKgwqDCoMKgwqAgRnVuY3Rpb27CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBGaWxlwqDCoMKgwqDCoMKgwqDCoMKgIExpbmUKPiAtLS0tLS0t
IC0tLS0tLS0tLcKgIC3CoMKgwqDCoMKgwqDCoCAtLS0tLS0tLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIC0tLS3CoMKgwqDCoMKgwqDCoMKgwqAgLS0tLQo+IMKgNDYwMzY4NcKgwqDCoMKgwqDC
oCAzNMKgwqAgMCBkb191c2VyX2FkZHJfZmF1bHTCoMKgwqDCoMKgwqDCoMKgIGZhdWx0LmPCoMKg
wqDCoMKgwqDCoMKgwqAgMTQxNgo+IChib290dXApCj4gMzgyMzI3NzQ1wqDCoMKgwqDCoCA0NDnC
oMKgIDAgZG9fdXNlcl9hZGRyX2ZhdWx0wqDCoMKgwqDCoMKgwqDCoCBmYXVsdC5jwqDCoMKgwqDC
oMKgwqDCoMKgCj4gMTQxNiAoa2VybmVsIGJ1aWxkKQo+IDM5OTQ0NjE1OcKgwqDCoMKgwqAgNDYx
wqDCoCAwIGRvX3VzZXJfYWRkcl9mYXVsdMKgwqDCoMKgwqDCoMKgwqAgZmF1bHQuY8KgwqDCoMKg
wqDCoMKgwqDCoAo+IDE0MTYgKHJlZGlzIGJlbmNobWFyaykKPgo+IEl0IHdvdWxkIHByb2JhYmx5
IHdvdWxkbid0IGhhcm0gZG9pbmcgdGhlIHVubGlrZWx5KCkgZm9yIGFsbCBhcmNocywgb3IKPiBh
bHRlcm5hdGl2ZWx5LCBhZGQgbGlrZWx5KCkgdG8gdGhlIGF0b21pY19sb25nX3RyeV9jbXB4Y2hn
X2FjcXVpcmUgaW4KPiBwYXRjaCAzIGFuZCBkbyBpdCBpbXBsaWNpdGx5IGJ1dCBtYXliZSB0aGF0
IHdvdWxkIGJlIGxlc3MgZmxleGlibGUoPykKPgo+IFRoYW5rcywKPiBEYXZpZGxvaHIKCkkgaGFk
IHVzZWQgdGhlIG15IGxvY2sgZXZlbnQgY291bnRpbmcgY29kZSB0byBjb3VudCB0aGUgbnVtYmVy
IG9mCmNvbnRlbmRlZCBhbmQgdW5jb250ZW5kZWQgdHJ5bG9ja3MuIEkgdGVzdGVkIGJvdGggYm9v
dHVwIGFuZCBrZXJuZWwKYnVpbGQuIEkgdGhpbmsgSSBzYXcgbGVzcyB0aGFuIDElIHdlcmUgY29u
dGVuZGVkLCB0aGUgcmVzdHMgd2VyZSBhbGwKdW5jb250ZW5kZWQuIFRoYXQgaXMgc2ltaWxhciB0
byB3aGF0IHlvdSBnb3QuIEkgdGhvdWdodCBJIGhhZCBzZW50IHRoZQpkYXRhIG91dCBwcmV2aW91
c2x5LCBidXQgSSBjb3VsZG4ndCBmaW5kIHRoZSBlbWFpbC4gVGhhdCB3YXMgdGhlIG1haW4KcmVh
c29uIHdoeSBJIHRvb2sgTGludXMnIHN1Z2dlc3Rpb24gdG8gb3B0aW1pemUgaXQgZm9yIHRoZSB1
bmNvbnRlbmRlZCBjYXNlLgoKVGhhbmtzLApMb25nbWFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
