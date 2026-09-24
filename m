Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFD4EC98314
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 12:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=57Q4/UxgOUygAlYgw5w/28tT7PtuEyHspUD/46F4Kb8=; b=BxISvR5yQyr0ym
	zifnKEPAWuEvrqPmg7XxKvOKbOwB7xM+vE5Z6hXYv2TYOwalWG0czo8AHO+b1lCjeZUghdG7H/Lpr
	F4rvurdXqZgMQMgfCFbRVGNknojROGfQ/Uo9545Mz2ZvHoWlgmoGpGSkmlo5ML85h76tURW8sxOju
	1JGWMHuzrDiFWnZD4PmrLyc22b1uULQSPBfX5YcIa8dklqTVTuOnzTYfYUB2ngJ2lC+r8Dy79X19n
	KOcO820jrNtmanid4BRbFatGYiDKXHNKO+OFOX18GRjcVnduVE83oaLbrGDYGVw5XjBsBeZK+ehAu
	ElV9pF/AlVAUsYKHcahA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ir5-0000000B0eR-0WfO;
	Thu, 24 Sep 2026 12:47:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ir1-0000000B0dV-2hjC;
	Thu, 24 Sep 2026 12:47:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54612152B;
	Thu, 24 Sep 2026 05:47:04 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3F7A03F86C;
	Thu, 24 Sep 2026 05:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790254027; bh=aLsBzLjrp1DcDn6DWeVaafFM2AupnjMYo0e+qs0lkyk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qS3yws8ARWxyQ1+ftpRPaMpKdtTTqu44bLMcI+dQ5YtFKmjLG0C1X4YEq9s7GpDps
	 QgQoCK7B8qUrIu+1Q7wIkRxMaXhUEFpkXZltly9wUzAAbIRJPgRBC8r5ZJRrcXrM5P
	 giKPrhw3skc7Z/BVVwLCIIOEY3xT3cPCUtPBhDbQ=
Date: Thu, 24 Sep 2026 13:46:59 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, catalin.marinas@arm.com,
	will@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, ritesh.list@gmail.com,
	sshegde@linux.ibm.com, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, hca@linux.ibm.com,
	gor@linux.ibm.com, agordeev@linux.ibm.com,
	borntraeger@linux.ibm.com, svens@linux.ibm.com, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	x86@kernel.org, hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org,
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, daniel.almeida@collabora.com, tamird@kernel.org,
	acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org,
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com,
	jszhang@kernel.org, japo@linux.ibm.com, jpoimboe@kernel.org,
	seanjc@google.com, pmladek@suse.com, thuth@redhat.com,
	ynorov@nvidia.com, joelagnelf@nvidia.com, david@davidgow.net,
	fujita.tomonori@gmail.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [RFC] rust: kernel: Add KUnit tests for ARCH_WARN_ASM bug table
 emission
Message-ID: <arUbw_TIA0Uj7oXT@J2N7QTR9R3>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
 <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_054711_764238_A171BBF0 
X-CRM114-Status: GOOD (  34.61  )
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

T24gVGh1LCBTZXAgMjQsIDIwMjYgYXQgMDE6MTU6NTdQTSArMDIwMCwgUGV0ZXIgWmlqbHN0cmEg
d3JvdGU6Cj4gT24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMTE6NTg6MTNBTSArMDUzMCwgTXVrZXNo
IEt1bWFyIENoYXVyYXNpeWEgd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyMiwgMjAyNiBhdCAwODo0
NzozNUFNICswMjAwLCBQZXRlciBaaWpsc3RyYSB3cm90ZToKPiA+ID4gT24gVHVlLCBTZXAgMjIs
IDIwMjYgYXQgMTE6MjA6MDBBTSArMDUzMCwgTXVrZXNoIEt1bWFyIENoYXVyYXNpeWEgKElCTSkg
d3JvdGU6Cj4gPiA+ID4gVmVyaWZ5IHRoYXQgdGhlIF9fYnVnX3RhYmxlIGVudHJ5IGVtaXR0ZWQg
YnkgQVJDSF9XQVJOX0FTTSBoYXMgYSBjb3JyZWN0Cj4gPiA+ID4gYnVnX2FkZHIgZGlzcGxhY2Vt
ZW50IOKAlCBpLmUuIHRoZSBhcmNoJ3MgdHJhcCBsYWJlbCByZWZlcmVuY2UgcmVzb2x2ZXMgdG8K
PiA+ID4gPiB0aGUgdHJhcCBpbnN0cnVjdGlvbiDigJQgYnkgY2FsbGluZyBmaW5kX2J1ZygpIHdp
dGggdGhlIGV4YWN0IHZpcnR1YWwgYWRkcmVzcwo+ID4gPiA+IG9mIHRoZSB0cmFwLCBtaXJyb3Jp
bmcgd2hhdCB0aGUgcmVhbCB0cmFwIGhhbmRsZXIgZG9lcy4KPiA+ID4gPiAKPiA+ID4gPiBUbyBz
dXBwb3J0IGFsbCBhcmNoaXRlY3R1cmVzLCBlYWNoIGFyY2ggdGhhdCBpbXBsZW1lbnRzIEFSQ0hf
V0FSTl9BU00gbm93Cj4gPiA+ID4gZGVmaW5lcyBBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwsIGEg
c3RyaW5nIGNvbnN0YW50IG5hbWluZyB0aGUgbG9jYWwgbGFiZWwKPiA+ID4gPiBhdCB3aGljaCB0
aGUgdHJhcCBpbnN0cnVjdGlvbiBpcyBwbGFjZWQ6Cj4gPiA+ID4gCj4gPiA+ID4gICB4ODYgICAg
ICAgIjEiICAgICAodWQyIGF0IGxhYmVsIDE6KQo+ID4gPiA+ICAgcG93ZXJwYyAgICIxIiAgICAg
KHR3aSBhdCBsYWJlbCAxOikKPiA+ID4gPiAgIHJpc2N2ICAgICAiMSIgICAgIChlYnJlYWsgYXQg
bGFiZWwgMTopCj4gPiA+ID4gICBhcm02NCAgICAgIjE0NDcxIiAoYnJrIHBsYWNlZCBhdCAxNDQ3
MTogYnkgX19CVUdfRU5UUllfRU5EKQo+ID4gPiA+ICAgczM5MCAgICAgICIwIiAgICAgKG1jIGF0
IGxhYmVsIDA6KQo+ID4gPiA+IAo+ID4gPiA+IFRoZSBsYWJlbCBpcyB1c2VkIGNvbnNpc3RlbnRs
eTogaW4gQVJDSF9XQVJOX0FTTSBpdHNlbGYsIGluIHRoZQo+ID4gPiA+IGJ1Z19hZGRyIGJhY2st
cmVmZXJlbmNlIGluc2lkZSBfX0JVR19FTlRSWSAvIF9FTUlUX0JVR19FTlRSWSwgCgo+ID4gPiBO
b3QgcmVhbGx5IGEgZmFuIG9mIHRoYXQuIEFuZCBJIGNhbid0IHJlYWxseSB0ZWxsIHdoYXQgeW91
J3JlIGRvaW5nIHdpdGgKPiA+ID4gaXQgZWl0aGVyLiBUaGUga3VuaXQgaXMgaW4gUnVzdCBhbmQg
dGh1cyB1bnJlYWRhYmxlIDotKAo+ID4gPiAKPiA+ID4gSSB3b3VsZCByYXRoZXIgeW91IGZpeCB1
cCBpc192YWxpZF9idWdhZGRyKCksIHNvbWUgYXJjaGl0ZWN0dXJlcyBzZWVtIHRvCj4gPiA+IGhh
dmUgYW4gYWx3YXlzIHRydWUgc3R1YiBiZWNhdXNlIG9mIHRoZSBjYWxsY2hhaW5zIGFsd2F5cyBi
ZWluZyBmcm9tIHRoZQo+ID4gPiBicmVhayBpbnN0cnVjdGlvbi4KPiA+IAo+ID4gSGV5IFBldGVy
LAo+ID4gCj4gPiB0aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiBJIHdpbGwgZml4IHVwIHRoZSBp
c192YWxpZF9idWdhZGRyIGZvcgo+ID4gcG93ZXJwYy4gSSBhbSBub3QgdmVyeSBnb29kIHdpdGgg
b3RoZXIgYXJjaHMgYXNtIGJ1dCBpIGNhbiBkbyBpdCBmb3IKPiA+IHBwYzMyIGFuZCBwcGM2NC4K
PiAKPiBVbnRlc3RlZCB0aGluZ2llcyBmb3IgYXJtNjQgYW5kIHMzOTB4Lgo+IAo+IGRpZmYgLS1n
aXQgYS9hcmNoL2FybTY0L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvdHJhcHMu
Ywo+IGluZGV4IDkxNDI4MjAxNjA2OS4uM2Q4YTk2OWVhYjVmIDEwMDY0NAo+IC0tLSBhL2FyY2gv
YXJtNjQva2VybmVsL3RyYXBzLmMKPiArKysgYi9hcmNoL2FybTY0L2tlcm5lbC90cmFwcy5jCj4g
QEAgLTk4NywxNCArOTg3LDEzIEBAIHZvaWQgZG9fc2Vycm9yKHN0cnVjdCBwdF9yZWdzICpyZWdz
LCB1bnNpZ25lZCBsb25nIGVzcikKPiAgI2lmZGVmIENPTkZJR19HRU5FUklDX0JVRwo+ICBpbnQg
aXNfdmFsaWRfYnVnYWRkcih1bnNpZ25lZCBsb25nIGFkZHIpCj4gIHsKPiAtCS8qCj4gLQkgKiBi
dWdfYnJrX2hhbmRsZXIoKSBvbmx5IGNhbGxlZCBmb3IgQlJLICNCVUdfQlJLX0lNTS4KPiAtCSAq
IFNvIHRoZSBhbnN3ZXIgaXMgdHJpdmlhbCAtLSBhbnkgc3B1cmlvdXMgaW5zdGFuY2VzIHdpdGgg
bm8KPiAtCSAqIGJ1ZyB0YWJsZSBlbnRyeSB3aWxsIGJlIHJlamVjdGVkIGJ5IHJlcG9ydF9idWco
KSBhbmQgcGFzc2VkCj4gLQkgKiBiYWNrIHRvIHRoZSBkZWJ1Zy1tb25pdG9ycyBjb2RlIGFuZCBo
YW5kbGVkIGFzIGEgZmF0YWwKPiAtCSAqIHVuZXhwZWN0ZWQgZGVidWcgZXhjZXB0aW9uLgo+IC0J
ICovCj4gLQlyZXR1cm4gMTsKPiArCXUzMiBpbnNuOwo+ICsKPiArCWlmIChhYXJjaDY0X2luc25f
cmVhZCgodTMyICopYWRkciwgJmluc24pKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCS8qIE1hdGNo
IEFTTV9CVUdfRkxBR1MoKSAvIEJVRygpIGluc3RydWN0aW9ucy4gKi8KPiArCXJldHVybiBpbnNu
ID09ICgweGQ0MjAwMDAwIHwgKEJVR19CUktfSU1NIDw8IDUpKTsKPiAgfQo+ICAjZW5kaWYKCldo
YXQgcHJvYmxlbSBpcyB0aGlzIHRyeWluZyB0byBzb2x2ZT8KCk11a2VzaCdzIG9yaWdpbmFsIHBh
dGNoIHNlZW1zIHRvIGJlIHRyeWluZyB0byBjaGVjayB3aGV0aGVyIHdlIGNvbXBpbGVkCnRoaW5n
cyBjb3JyZWN0bHkgKHN1Y2ggdGhhdCB0aGUgYnVnX3RhYmxlIGVudHJ5IHBvaW50cyBhdCB0aGUg
ZXhwZWN0ZWQKaW5zdHVyY3Rpb24pLCBhbmQgSSBkb24ndCB0aGluayB0aGF0IHdhcnJhbnRzIGEg
cnVudGltZSBjaGVjaywgYnV0IChhcwpwZXIgbXkgcmVwbHkgdG8gaGltKSBJIGRvbid0IHVuZGVy
c3RhbmQgd2h5IHRoYXQncyBhIHRoaW5nIHRvIGNoZWNrIGluCnRoZSBmaXJzdCBwbGFjZS4KCk9u
IGFybTY0IHdlIG9ubHkgY2FsbCBpc192YWxpZF9idWdhZGRyKCkgdW5kZXIgZG9fZWwxX2JyazY0
KCkgLT4KY2FsbF9lbDFfYnJlYWtfaG9vaygpIC0+IGJ1Z19icmtfaGFuZGxlcigpLiBXZSBvbmx5
IGNhbGwKYnVnX2Jya19oYW5kbGVyKCkgd2hlbiBIVyBoYXMgdGFrZW4gYSBCUksgZXhjZXB0aW9u
IHdpdGggdGhlIEJVR19CUktfSU1NCmltbWVkaWF0ZSwgYW5kIHRoYXQgY2FuIG9ubHkgYmUgdHJp
Z2dlcmVkIGJ5IGV4ZWN1dGluZyB0aGUgcmlnaHQKaW5zdHJ1Y3Rpb24gKEJSSyAjQlVHX0JSS19J
TU0pLCB3aGljaCB3ZSBPTkxZIHVzZSBmb3IgQlVHKCkuIGFuZCBXQVJOKCkuCgpTbyBJIGRvbid0
IHNlZSB3aHkgYW55IGNoYW5nZSBpcyBuZWNlc3NhcnkgaGVyZS4KCklmIHRoZSBIVyBoYXMgc29t
ZWhvdyB0YWtlbiBhIEJSSyBleGNlcHRpb24gZnJvbSBhbnkgb3RoZXIgaW5zdHJ1Y3Rpb24KKHdo
aWNoIHdvdWxkIHByZXN1bWFibHkgYmUgYSBIVyBidWcpLCB0aGVyZSB3b24ndCBiZSBhIGJ1Z190
YWJsZSBlbnRyeSwKYW5kIHNvIF9fcmVwb3J0X2J1ZygpIHdpbGwgZmFpbCB0byBmaW5kIGFuIGVu
dHJ5LCBhbmQgd2lsbCByZXR1cm4KQlVHX1RSQVBfVFlQRV9OT05FLCBzYW1lIGFzIGZvciB0aGUg
IWlzX3ZhbGlkX2J1Z2FkZHIoKSBjYXNlLgoKTWFyay4gIAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
