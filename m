Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C816C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Mar 2022 17:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EFz6fC25LXXsEJKk2JQTMfnSc8+mqqOxhd4lABalEuI=; b=wptteNks/ZNqdP
	WaPL5NSXwhAGCs2TAdWZIHTv6uclSRSezMA26ymXfvd79JkOIe4cn0RKKV+hBxDuIIgy0eWiILlnA
	iH6IOjEXgz7c/MahTX+IO0XKTvJeZb01tskIbsKb4g5vtwg7zRX228fiPw9Z60GRxSqS6pR82T5u8
	3kX27bpl0gy+2U/GcWyT7BMhbqTnWGoKXonTnRkBxksADLVYwtjLksbaGIi2EFVLFvVet+OSDjMdd
	HCLh1XyPvG+Ew6m25raA/nZ6Dqj3MaVw8W1mQmddwePR7mmDvSAOSKNkKzsXYwj+itX72BohdyUFn
	725ekEzp4Hea+iSTA/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nVGFJ-002TY7-5o; Fri, 18 Mar 2022 17:18:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nVGF6-002TVL-Ru; Fri, 18 Mar 2022 17:18:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 54A7D619B6;
 Fri, 18 Mar 2022 17:18:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80BEDC340E8;
 Fri, 18 Mar 2022 17:18:20 +0000 (UTC)
Date: Fri, 18 Mar 2022 17:18:16 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 Pasha Tatashin <pasha.tatashin@soleen.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH -next 3/4] arm64: mm: add support for page table check
Message-ID: <YjS+2FVpq8D4Gx0S@arm.com>
References: <20220317141203.3646253-1-tongtiangen@huawei.com>
 <20220317141203.3646253-4-tongtiangen@huawei.com>
 <YjOFNEvj7EfBasCI@arm.com>
 <cb91532b-c0cd-034c-2f93-4f76fabf5fc1@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cb91532b-c0cd-034c-2f93-4f76fabf5fc1@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220318_101824_970560_BBA23A76 
X-CRM114-Status: GOOD (  19.15  )
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

T24gRnJpLCBNYXIgMTgsIDIwMjIgYXQgMTE6NTg6MjJBTSArMDgwMCwgVG9uZyBUaWFuZ2VuIHdy
b3RlOgo+IOWcqCAyMDIyLzMvMTggMzowMCwgQ2F0YWxpbiBNYXJpbmFzIOWGmemBkzoKPiA+IE9u
IFRodSwgTWFyIDE3LCAyMDIyIGF0IDAyOjEyOjAyUE0gKzAwMDAsIFRvbmcgVGlhbmdlbiB3cm90
ZToKPiA+ID4gQEAgLTYyOCw2ICs2NDcsMjUgQEAgc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25n
IHBtZF9wYWdlX3ZhZGRyKHBtZF90IHBtZCkKPiA+ID4gICAjZGVmaW5lIHB1ZF9sZWFmKHB1ZCkJ
CXB1ZF9zZWN0KHB1ZCkKPiA+ID4gICAjZGVmaW5lIHB1ZF92YWxpZChwdWQpCQlwdGVfdmFsaWQo
cHVkX3B0ZShwdWQpKQo+ID4gPiArI2lmZGVmIENPTkZJR19QQUdFX1RBQkxFX0NIRUNLCj4gPiA+
ICtzdGF0aWMgaW5saW5lIGJvb2wgcHRlX3VzZXJfYWNjZXNzaWJsZV9wYWdlKHB0ZV90IHB0ZSkK
PiA+ID4gK3sKPiA+ID4gKwlyZXR1cm4gKHB0ZV92YWwocHRlKSAmIFBURV9WQUxJRCkgJiYgKHB0
ZV92YWwocHRlKSAmIFBURV9VU0VSKTsKPiA+ID4gK30KWy4uLl0KPiA+IERvIHdlIGNhcmUgYWJv
dXQgUFJPVF9OT05FIG1hcHBpbmdzIGhlcmU/IFRoZXkgaGF2ZSB0aGUgdmFsaWQgYml0Cj4gPiBj
bGVhcmVkIGJ1dCBwdGVfcHJlc2VudCgpIGlzIHRydWUuCj4gPiAKPiAKPiBQVEMgd2lsbCBub3Qg
Y2hlY2sgdGhpcyBzcGVjaWFsIHR5cGUoUFJPVF9OT05FKSBvZiBwYWdlLgoKUFJPVF9OT05FIGlz
IGp1c3QgYSBwZXJtaXNzaW9uIGJ1dCBzaW5jZSB3ZSBkb24ndCBoYXZlIGluZGVwZW5kZW50IHJl
YWQKYW5kIHdyaXRlIGJpdHMgaW4gdGhlIHB0ZSwgd2UgaW1wbGVtZW50IGl0IGFzIGFuIGludmFs
aWQgcHRlIChiaXQgMApjbGVhcmVkKS4gVGhlIG90aGVyIGNvbnRlbnQgb2YgdGhlIHB0ZSBpcyBm
aW5lLCBzbyBwdGVfcGZuKCkgc2hvdWxkCnN0aWxsIHdvcmsuIFBUQyBjb3VsZCBhcyB3ZWxsIGNo
ZWNrIHRoaXMsIEkgZG9uJ3QgdGhpbmsgaXQgaHVydHMuCgo+ID4gPiArc3RhdGljIGlubGluZSBi
b29sIHBtZF91c2VyX2FjY2Vzc2libGVfcGFnZShwbWRfdCBwbWQpCj4gPiA+ICt7Cj4gPiA+ICsJ
cmV0dXJuIHBtZF9sZWFmKHBtZCkgJiYgKHBtZF92YWwocG1kKSAmIFBURV9WQUxJRCkgJiYKPiA+
ID4gKwkJKHBtZF92YWwocG1kKSAmIFBURV9VU0VSKTsKPiA+ID4gK30KPiA+IAo+ID4gcG1kX2xl
YWYoKSBpbXBsaWVzIHZhbGlkLCBzbyB5b3UgY2FuIHNraXAgaXQgaWYgdGhhdCdzIHRoZSBhaW0u
Cj4gCj4gUFRDIG9ubHkgY2hlY2tzIHdoZXRoZXIgdGhlIG1lbW9yeSBibG9jayBjb3JyZXNwb25k
aW5nIHRvIHRoZSBwbWRfbGVhZiB0eXBlCj4gY2FuIGFjY2VzcywgZm9yICFwbWRfbGVhZiwgUFRD
IGNoZWNrcyBhdCB0aGUgcHRlIGxldmVsLiBTbyBpIHRoaW5rIHRoaXMgaXMKPiBuZWNlc3Nhcnku
CgpNeSBwb2ludCBpcyB0aGF0IHRoZSAocG1kX3ZhbChwbWQpICYgUFRFX1ZBTElEKSBjaGVjayBp
cyBzdXBlcmZsdW91cwpzaW5jZSB0aGF0J3MgY292ZXJlZCBieSBwbWRfbGVhZigpIGFscmVhZHku
CgotLSAKQ2F0YWxpbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
