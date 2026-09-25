Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A307C9830D
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Sep 2026 08:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eUyOoOcAibj/OwMTz9pc+X2E7wBJjhH5qod3Skf1RDo=; b=mFswHTa4UMlnh0
	QDUuB5/QZ3sWMgnxWzI2Gn9ejuSjZVY51aKeG3tTyFxAlgSRG/uc0DSylBWsGedDST7pbHfqSnPpm
	+1cYIVDcHaMqaiHKKQs7XQ8zNOvRNVrfXCXlwoHf/UbXRccEDfXShqMuUR/j1t7147WIQkqR7Lalk
	laRtMI4I3Co1YkrDtG/ypdKuxAhwlCNgMgFtjy3nd4RL0mNpXx7rNuAhSPp6pE8NteD+DdCVjfqeo
	Snxy45NJV8eRNacbeaKDz4p+yL0G1yJHSZaAEkko7W5nkylw0A1ldOxDlrifPZCPX8qhmF9WhFXWU
	CuUT1ilEFnIengoL+GBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0xU-0000000CtBB-3vmx;
	Fri, 25 Sep 2026 08:07:04 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA0xR-0000000Ct9s-2TSO;
	Fri, 25 Sep 2026 08:07:03 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 87B6A176B;
	Fri, 25 Sep 2026 01:06:56 -0700 (PDT)
Received: from J2N7QTR9R3.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0A38C3F86C;
	Fri, 25 Sep 2026 01:06:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790323620; bh=bqDlux4ZKljQzEX29W5C7azTEBape0jUhDg+vIkPwoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DEvDGER69TkBehaUf1yXHc3/91mWH80U9Sq8HoDSqxSYDa1beSIk9FM1cgkMAerwg
	 12kXgZdinDC2N/cJSR8OMQEWeSUxgZ7fwzymJTvxenh5IUpGfzfQb+59SwynX6yJir
	 Gn0WTY/9P0VH0qqHnfWw6FImcfLEqU66XxmwvNtw=
Date: Fri, 25 Sep 2026 09:06:46 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
	ritesh.list@gmail.com, sshegde@linux.ibm.com, pjw@kernel.org,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	jszhang@kernel.org, japo@linux.ibm.com, peterz@infradead.org,
	jpoimboe@kernel.org, seanjc@google.com, pmladek@suse.com,
	thuth@redhat.com, ynorov@nvidia.com, joelagnelf@nvidia.com,
	david@davidgow.net, fujita.tomonori@gmail.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arYrlmVgPYMgsohb@J2N7QTR9R3.cambridge.arm.com>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <arUYLsJJewE--wqo@J2N7QTR9R3>
 <arYR4GrzNnFko7XO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arYR4GrzNnFko7XO@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_010701_792655_F9ACC69B 
X-CRM114-Status: GOOD (  24.72  )
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

T24gRnJpLCBTZXAgMjUsIDIwMjYgYXQgMTE6NTE6MzNBTSArMDUzMCwgTXVrZXNoIEt1bWFyIENo
YXVyYXNpeWEgd3JvdGU6Cj4gT24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMDE6MzE6NDJQTSArMDEw
MCwgTWFyayBSdXRsYW5kIHdyb3RlOgo+ID4gT24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMTE6MjA6
MDBBTSArMDUzMCwgTXVrZXNoIEt1bWFyIENoYXVyYXNpeWEgKElCTSkgd3JvdGU6Cj4gPiA+IFZl
cmlmeSB0aGF0IHRoZSBfX2J1Z190YWJsZSBlbnRyeSBlbWl0dGVkIGJ5IEFSQ0hfV0FSTl9BU00g
aGFzIGEgY29ycmVjdAo+ID4gPiBidWdfYWRkciBkaXNwbGFjZW1lbnQg4oCUIGkuZS4gdGhlIGFy
Y2gncyB0cmFwIGxhYmVsIHJlZmVyZW5jZSByZXNvbHZlcyB0bwo+ID4gPiB0aGUgdHJhcCBpbnN0
cnVjdGlvbiDigJQgYnkgY2FsbGluZyBmaW5kX2J1ZygpIHdpdGggdGhlIGV4YWN0IHZpcnR1YWwg
YWRkcmVzcwo+ID4gPiBvZiB0aGUgdHJhcCwgbWlycm9yaW5nIHdoYXQgdGhlIHJlYWwgdHJhcCBo
YW5kbGVyIGRvZXMuCj4gPiA+IAo+ID4gPiBUbyBzdXBwb3J0IGFsbCBhcmNoaXRlY3R1cmVzLCBl
YWNoIGFyY2ggdGhhdCBpbXBsZW1lbnRzIEFSQ0hfV0FSTl9BU00gbm93Cj4gPiA+IGRlZmluZXMg
QVJDSF9XQVJOX0FTTV9UUkFQX0xBQkVMLCBhIHN0cmluZyBjb25zdGFudCBuYW1pbmcgdGhlIGxv
Y2FsIGxhYmVsCj4gPiA+IGF0IHdoaWNoIHRoZSB0cmFwIGluc3RydWN0aW9uIGlzIHBsYWNlZDoK
PiA+ID4gCj4gPiA+ICAgeDg2ICAgICAgICIxIiAgICAgKHVkMiBhdCBsYWJlbCAxOikKPiA+ID4g
ICBwb3dlcnBjICAgIjEiICAgICAodHdpIGF0IGxhYmVsIDE6KQo+ID4gPiAgIHJpc2N2ICAgICAi
MSIgICAgIChlYnJlYWsgYXQgbGFiZWwgMTopCj4gPiA+ICAgYXJtNjQgICAgICIxNDQ3MSIgKGJy
ayBwbGFjZWQgYXQgMTQ0NzE6IGJ5IF9fQlVHX0VOVFJZX0VORCkKPiA+ID4gICBzMzkwICAgICAg
IjAiICAgICAobWMgYXQgbGFiZWwgMDopCj4gPiAKPiA+IEknbSBub3QgYSBmYW4gb2YgZXhwb3Np
bmcgc3VjaCBhIGxvdy1sZXZlbCBpbXBsZW1lbnRhdGlvbiBkZXRhaWwgb3V0IG9mCj4gPiB0aGUg
YXJjaGl0ZWN0dXJlIGNvZGUsIGFuZCBJIGRvbid0IHRoaW5rIHdlIHNob3VsZCBleHBvc2UgdGhp
cy4KPiA+IAo+ID4gV2hhdCBleGFjdGx5IGFyZSB5b3UgdHJ5aW5nIHRvIHZlcmlmeSBoZXJlLCBh
bmQgd2h5PyBIYXMgdGhlcmUgYmVlbgo+ID4gc29tZSBfc3BlY2lmaWNfIGlzc3VlIG9uIHBvd2Vy
cGMgdGhhdCBjYXVzZWQgeW91IHRvIGxvb2sgYXQgdGhpcz8KPiA+IAo+ID4gTWFyay4KPiAKPiBI
ZXkgTWFyaywKPiAKPiBEdXJpbmcgaW1wbGVtZW50aW5nIEFSQ0hfV0FSTl9BU00gZm9yIHJ1c3Qg
SSBicm9rZSB0aGUgYnVnIGVudHJ5IGZvcgo+IHBvd2VycGMgc28gSSB3cm90ZSB0aGlzIHRvIHZl
cmlmeS4gCgpJSVVDIHlvdSBtZWFuIHlvdSBlbmNvZGVkIHRoZSBidWdfZW50cnk6OmJ1Z19hZGRy
IGZpZWxkIGluY29ycmVjdGx5PwoKRGlkIHRoYXQgcmVzdWx0IGluIHRoZSBlbnRyeSAqYWx3YXlz
KiBiZWluZyB3cm9uZywgb3IgKnNvbWV0aW1lcyogYmVpbmcKd3Jvbmc/CgpBRkFJQ1QgeW91IHNo
b3VsZCBiZSBhYmxlIHRvIHVzZSBleGlzdGluZyB0aGUgTEtEVE0gJ0JVRycgYW5kICdXQVJOSU5H
Jwp0ZXN0cyBmb3IgdGhhdCBzb3J0IG9mIHByb2JsZW0sIG5vIG5ldyBjb2RlIG5lZWRlZC4gVGhl
eSBkb24ndCBmaXQgaW50bwpLVW5pdCwgYnV0IHlvdSBzaG91bGQgb25seSBuZWVkIHRvIHJ1biB0
aGVtIHdoZW4gY2hhbmdpbmcgdGhlIHdheSB5b3UKY29uc3RydWN0IGEgYnVnX2VudHJ5LCBzbyB0
aGF0IGRvZXNuJ3Qgc2VlbSBsaWtlIHRoZSBlbmQgb2YgdGhlIHdvcmxkLgoKPiBJIHNlbnQgaXQg
b3V0IG1haW5seSBmb3IgcHBjIGJ1dCBmZXcgcGVvcGxlIHdhbnRlZCB0aGF0IGlmIGl0IG5lZWRl
ZAo+IGl0IHNob3VsZCBiZSBkb25lIGZvciBhbGwgYXJjaHMuICBTbyBzZXBhcmF0ZWQgdGhpcyB0
aGluZyBhbmQgc2VudCBpdAo+IG91dCBhcyBhbiBSRkMgdG8gY2hlY2sgd2hldGhlciBvdGhlciBh
cmNocyB3YW50IHRoaXMgb3Igbm90LgoKR2l2ZW4gdGhlIGluZm9ybWF0aW9uIHByb3ZpZGVkIHNv
IGZhciwgSSBkb24ndCB0aGluayB0aGlzIGlzIG5lY2Vzc2FyeS4KSSBkbyBub3Qgd2FudCB0aGlz
IGZvciBhcm02NC4KCk1hcmsuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
