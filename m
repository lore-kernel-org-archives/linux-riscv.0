Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C940BC9830E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 11:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDKxf0tQXF/1xMMevVKAM0zndM85+A2SF6fz5anlyFU=; b=4RXNlG6xJylsN1
	G8rOG391S/nPLaeeJIM0wAFCiG2MuQs0mTsa+sb8GrZAtDgCJ96FRPaK5sTeFE2t3RiJoXJu9JHkL
	QngiK1GRTJi7lHT2hCG4Z8fao2K9GJ95A2c53PFsQTJ3L/OFYZ5ckI1RE7OIlaklCgv8Fp+4Yt34E
	LRDJzqutFEVuZrP9HT+YAsgl0HfKV0cTHOMYtrwhtXLXu5VzikE4hoCKbt2PsM/zQ2XR2SzI2Ixcw
	cX8EZazzdp0By2oppWMuoh+ql3Cb9NH98U8KaqB2Ar9kWNGup63DU3JQ7PpXDpBBHbgdkNSeZfcHm
	yZF9fK0xtMo9HuNfw1sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hQs-0000000Apux-0hON;
	Thu, 24 Sep 2026 11:16:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9hQp-0000000ApuQ-1Wkq;
	Thu, 24 Sep 2026 11:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=gHiDQ7HWXcZShppku6mAcXzNHEI2Xpwr5xmcNWbMy1M=; b=TiyK92WBOnCu1fWO0Z4cSNHVSd
	Mj8PXqr4/HhutFB2ojMrKICILUnBnS4eqhR0AMmOxXGmjL4S91AliFtOmH9Eer5YntsyAB/x4AKze
	fjT7npvpCLhoKOtTRRGEFqlv/VLi37lyt5oAaJKmfc6RforL6bCcKz1OK121z4RkpdlZBm6gvCrtF
	1lB1nmH9hGCAcDm6f6x5INXv/tuJtYFmT/ZvCVh6C8e0JhN+Zyey3XlE+f3D3oLXxOEPOZToiUXDi
	KJ2TkcrnEgtVqHSSODBhH8NPCRreQWhadpv53WL0YAzTlI0/Iatayi0tl9oOR4O5GphjKwUAad29M
	izhpZmgQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9hQm-0000000FtJV-1tlA;
	Thu, 24 Sep 2026 11:16:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id F3EDA300756; Thu, 24 Sep 2026 13:15:57 +0200 (CEST)
Date: Thu, 24 Sep 2026 13:15:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, ritesh.list@gmail.com, sshegde@linux.ibm.com,
	pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
	agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
	svens@linux.ibm.com, tglx@kernel.org, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org,
	daniel.almeida@collabora.com, tamird@kernel.org,
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
Message-ID: <20260924111557.GP1837346@noisy.programming.kicks-ass.net>
References: <20260922054959.955093-2-mkchauras@gmail.com>
 <20260922064735.GS4121339@noisy.programming.kicks-ass.net>
 <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <arNxAn7I7NCVWmD1@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
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

T24gV2VkLCBTZXAgMjMsIDIwMjYgYXQgMTE6NTg6MTNBTSArMDUzMCwgTXVrZXNoIEt1bWFyIENo
YXVyYXNpeWEgd3JvdGU6Cj4gT24gVHVlLCBTZXAgMjIsIDIwMjYgYXQgMDg6NDc6MzVBTSArMDIw
MCwgUGV0ZXIgWmlqbHN0cmEgd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyMiwgMjAyNiBhdCAxMToy
MDowMEFNICswNTMwLCBNdWtlc2ggS3VtYXIgQ2hhdXJhc2l5YSAoSUJNKSB3cm90ZToKPiA+ID4g
VmVyaWZ5IHRoYXQgdGhlIF9fYnVnX3RhYmxlIGVudHJ5IGVtaXR0ZWQgYnkgQVJDSF9XQVJOX0FT
TSBoYXMgYSBjb3JyZWN0Cj4gPiA+IGJ1Z19hZGRyIGRpc3BsYWNlbWVudCDigJQgaS5lLiB0aGUg
YXJjaCdzIHRyYXAgbGFiZWwgcmVmZXJlbmNlIHJlc29sdmVzIHRvCj4gPiA+IHRoZSB0cmFwIGlu
c3RydWN0aW9uIOKAlCBieSBjYWxsaW5nIGZpbmRfYnVnKCkgd2l0aCB0aGUgZXhhY3QgdmlydHVh
bCBhZGRyZXNzCj4gPiA+IG9mIHRoZSB0cmFwLCBtaXJyb3Jpbmcgd2hhdCB0aGUgcmVhbCB0cmFw
IGhhbmRsZXIgZG9lcy4KPiA+ID4gCj4gPiA+IFRvIHN1cHBvcnQgYWxsIGFyY2hpdGVjdHVyZXMs
IGVhY2ggYXJjaCB0aGF0IGltcGxlbWVudHMgQVJDSF9XQVJOX0FTTSBub3cKPiA+ID4gZGVmaW5l
cyBBUkNIX1dBUk5fQVNNX1RSQVBfTEFCRUwsIGEgc3RyaW5nIGNvbnN0YW50IG5hbWluZyB0aGUg
bG9jYWwgbGFiZWwKPiA+ID4gYXQgd2hpY2ggdGhlIHRyYXAgaW5zdHJ1Y3Rpb24gaXMgcGxhY2Vk
Ogo+ID4gPiAKPiA+ID4gICB4ODYgICAgICAgIjEiICAgICAodWQyIGF0IGxhYmVsIDE6KQo+ID4g
PiAgIHBvd2VycGMgICAiMSIgICAgICh0d2kgYXQgbGFiZWwgMTopCj4gPiA+ICAgcmlzY3YgICAg
ICIxIiAgICAgKGVicmVhayBhdCBsYWJlbCAxOikKPiA+ID4gICBhcm02NCAgICAgIjE0NDcxIiAo
YnJrIHBsYWNlZCBhdCAxNDQ3MTogYnkgX19CVUdfRU5UUllfRU5EKQo+ID4gPiAgIHMzOTAgICAg
ICAiMCIgICAgIChtYyBhdCBsYWJlbCAwOikKPiA+ID4gCj4gPiA+IFRoZSBsYWJlbCBpcyB1c2Vk
IGNvbnNpc3RlbnRseTogaW4gQVJDSF9XQVJOX0FTTSBpdHNlbGYsIGluIHRoZQo+ID4gPiBidWdf
YWRkciBiYWNrLXJlZmVyZW5jZSBpbnNpZGUgX19CVUdfRU5UUlkgLyBfRU1JVF9CVUdfRU5UUlks
IAo+ID4gCj4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5o
IGIvYXJjaC94ODYvaW5jbHVkZS9hc20vYnVnLmgKPiA+ID4gaW5kZXggMjNhYjA1NDM4MjY5Li42
Y2NhODg4MDY2MGUgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5o
Cj4gPiA+ICsrKyBiL2FyY2gveDg2L2luY2x1ZGUvYXNtL2J1Zy5oCj4gPiA+IEBAIC02Miw4ICs2
Miw5IEBAIGV4dGVybiB2b2lkIF9fV0FSTl90cmFwKHN0cnVjdCBidWdfZW50cnkgKmJ1ZywgLi4u
KTsKPiA+ID4gICNkZWZpbmUgSEFWRV9BUkNIX0JVR19GT1JNQVRfQVJHUwo+ID4gPiAgI2VuZGlm
Cj4gPiA+ICAKPiA+ID4gKyNkZWZpbmUgQVJDSF9XQVJOX0FTTV9UUkFQX0xBQkVMICIxIgo+ID4g
PiAgI2RlZmluZSBfX0JVR19FTlRSWShmb3JtYXQsIGZpbGUsIGxpbmUsIGZsYWdzKQkJCQlcCj4g
PiA+IC0JIlx0LmxvbmcgMWIgLSAuIgkiXHQjIGJ1Z19lbnRyeTo6YnVnX2FkZHJcbiIJCVwKPiA+
ID4gKwkiXHQubG9uZyAiIEFSQ0hfV0FSTl9BU01fVFJBUF9MQUJFTCAiYiAtIC4iICJcdCMgYnVn
X2VudHJ5OjpidWdfYWRkclxuIiBcCj4gPiA+ICAJX19CVUdfRU5UUllfRk9STUFUKGZvcm1hdCkJ
CQkJCVwKPiA+ID4gIAlfX0JVR19FTlRSWV9WRVJCT1NFKGZpbGUsIGxpbmUpCQkJCQlcCj4gPiA+
ICAJIlx0LndvcmQgIiBmbGFncwkiXHQjIGJ1Z19lbnRyeTo6ZmxhZ3NcbiIKPiA+ID4gQEAgLTEw
MSw3ICsxMDIsNyBAQCBkbyB7CQkJCQkJCQkJXAo+ID4gPiAgCSI5OTpcbiIJCQkJCQkJCVwKPiA+
ID4gIAkiXHQuc3RyaW5nIFwiXCJcbiIJCQkJCQlcCj4gPiA+ICAJIi5wb3BzZWN0aW9uXG4iCQkJ
CQkJCVwKPiA+ID4gLQkiMTpcdCAiIEFTTV9VRDIgIlxuIgkJCQkJCVwKPiA+ID4gKwlBUkNIX1dB
Uk5fQVNNX1RSQVBfTEFCRUwgIjpcdCAiIEFTTV9VRDIgIlxuIgkJCVwKPiA+ID4gIAlfQlVHX0ZM
QUdTX0FTTSgiOTliIiwgZmlsZSwgbGluZSwgZmxhZ3MsIHNpemUsICIiKQo+ID4gPiAgCj4gPiA+
ICAjZWxzZQo+ID4gCj4gPiBOb3QgcmVhbGx5IGEgZmFuIG9mIHRoYXQuIEFuZCBJIGNhbid0IHJl
YWxseSB0ZWxsIHdoYXQgeW91J3JlIGRvaW5nIHdpdGgKPiA+IGl0IGVpdGhlci4gVGhlIGt1bml0
IGlzIGluIFJ1c3QgYW5kIHRodXMgdW5yZWFkYWJsZSA6LSgKPiA+IAo+ID4gSSB3b3VsZCByYXRo
ZXIgeW91IGZpeCB1cCBpc192YWxpZF9idWdhZGRyKCksIHNvbWUgYXJjaGl0ZWN0dXJlcyBzZWVt
IHRvCj4gPiBoYXZlIGFuIGFsd2F5cyB0cnVlIHN0dWIgYmVjYXVzZSBvZiB0aGUgY2FsbGNoYWlu
cyBhbHdheXMgYmVpbmcgZnJvbSB0aGUKPiA+IGJyZWFrIGluc3RydWN0aW9uLgo+IAo+IEhleSBQ
ZXRlciwKPiAKPiB0aGFua3MgZm9yIHRoZSBzdWdnZXN0aW9uLiBJIHdpbGwgZml4IHVwIHRoZSBp
c192YWxpZF9idWdhZGRyIGZvcgo+IHBvd2VycGMuIEkgYW0gbm90IHZlcnkgZ29vZCB3aXRoIG90
aGVyIGFyY2hzIGFzbSBidXQgaSBjYW4gZG8gaXQgZm9yCj4gcHBjMzIgYW5kIHBwYzY0LgoKVW50
ZXN0ZWQgdGhpbmdpZXMgZm9yIGFybTY0IGFuZCBzMzkweC4KCmRpZmYgLS1naXQgYS9hcmNoL2Fy
bTY0L2tlcm5lbC90cmFwcy5jIGIvYXJjaC9hcm02NC9rZXJuZWwvdHJhcHMuYwppbmRleCA5MTQy
ODIwMTYwNjkuLjNkOGE5NjllYWI1ZiAxMDA2NDQKLS0tIGEvYXJjaC9hcm02NC9rZXJuZWwvdHJh
cHMuYworKysgYi9hcmNoL2FybTY0L2tlcm5lbC90cmFwcy5jCkBAIC05ODcsMTQgKzk4NywxMyBA
QCB2b2lkIGRvX3NlcnJvcihzdHJ1Y3QgcHRfcmVncyAqcmVncywgdW5zaWduZWQgbG9uZyBlc3Ip
CiAjaWZkZWYgQ09ORklHX0dFTkVSSUNfQlVHCiBpbnQgaXNfdmFsaWRfYnVnYWRkcih1bnNpZ25l
ZCBsb25nIGFkZHIpCiB7Ci0JLyoKLQkgKiBidWdfYnJrX2hhbmRsZXIoKSBvbmx5IGNhbGxlZCBm
b3IgQlJLICNCVUdfQlJLX0lNTS4KLQkgKiBTbyB0aGUgYW5zd2VyIGlzIHRyaXZpYWwgLS0gYW55
IHNwdXJpb3VzIGluc3RhbmNlcyB3aXRoIG5vCi0JICogYnVnIHRhYmxlIGVudHJ5IHdpbGwgYmUg
cmVqZWN0ZWQgYnkgcmVwb3J0X2J1ZygpIGFuZCBwYXNzZWQKLQkgKiBiYWNrIHRvIHRoZSBkZWJ1
Zy1tb25pdG9ycyBjb2RlIGFuZCBoYW5kbGVkIGFzIGEgZmF0YWwKLQkgKiB1bmV4cGVjdGVkIGRl
YnVnIGV4Y2VwdGlvbi4KLQkgKi8KLQlyZXR1cm4gMTsKKwl1MzIgaW5zbjsKKworCWlmIChhYXJj
aDY0X2luc25fcmVhZCgodTMyICopYWRkciwgJmluc24pKQorCQlyZXR1cm4gMDsKKworCS8qIE1h
dGNoIEFTTV9CVUdfRkxBR1MoKSAvIEJVRygpIGluc3RydWN0aW9ucy4gKi8KKwlyZXR1cm4gaW5z
biA9PSAoMHhkNDIwMDAwMCB8IChCVUdfQlJLX0lNTSA8PCA1KSk7CiB9CiAjZW5kaWYKIApkaWZm
IC0tZ2l0IGEvYXJjaC9zMzkwL2tlcm5lbC90cmFwcy5jIGIvYXJjaC9zMzkwL2tlcm5lbC90cmFw
cy5jCmluZGV4IGI2YmE0NDY1ZjU5ZC4uOGJiYjA4MmZkNWUzIDEwMDY0NAotLS0gYS9hcmNoL3Mz
OTAva2VybmVsL3RyYXBzLmMKKysrIGIvYXJjaC9zMzkwL2tlcm5lbC90cmFwcy5jCkBAIC0yNiw2
ICsyNiw3IEBACiAjaW5jbHVkZSA8bGludXgvZW50cnktY29tbW9uLmg+CiAjaW5jbHVkZSA8bGlu
dXgva21zYW4uaD4KICNpbmNsdWRlIDxsaW51eC9idWcuaD4KKyNpbmNsdWRlIDxsaW51eC91YWNj
ZXNzLmg+CiAjaW5jbHVkZSA8YXNtL2VudHJ5LXBlcmNwdS5oPgogI2luY2x1ZGUgPGFzbS9hc20t
ZXh0YWJsZS5oPgogI2luY2x1ZGUgPGFzbS9pcnFmbGFncy5oPgpAQCAtNTUsNyArNTYsMTIgQEAg
c3RhdGljIGlubGluZSB2b2lkIF9fdXNlciAqZ2V0X3RyYXBfaXAoc3RydWN0IHB0X3JlZ3MgKnJl
Z3MpCiAjaWZkZWYgQ09ORklHX0dFTkVSSUNfQlVHCiBpbnQgaXNfdmFsaWRfYnVnYWRkcih1bnNp
Z25lZCBsb25nIGFkZHIpCiB7Ci0JcmV0dXJuIDE7CisJdTE2IGluc247CisKKwlpZiAoZ2V0X2tl
cm5lbF9ub2ZhdWx0KGluc24sICh1MTYgKilhZGRyKSkKKwkJcmV0dXJuIDA7CisKKwlyZXR1cm4g
aW5zbiA9PSAweDAwMDEgfHwgaW5zbiA9PSAweDAwMGU7CiB9CiAjZW5kaWYKIAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
