Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 596D1C5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 11:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=39KWmJBOpx0fhiE0J12bh0IeSJWMEveCAiA6gAp8KQM=; b=X6IMrTUb5+vLij
	Nqjewm45tRPcRSJscmJGyW/ArofvwWX6SLelo1/YwV55JrMUmO87xeIsOMoh8rrtGBpB7SEXtqNpH
	95lz+2Z25rP1n01+xbbc8Gu7GeE65r9PkN8IHLfRQsfmr3TO15As9nPoSf+XkmH5KCTnoH9PzkE15
	wFuKCfFzcXS2X6BxUsYBrRyhUWU89JuIi+nXziK2JjGTwkCKpkuMdDLcrvJDLqza+/Z8R/ruBaIO/
	AiE6YkVpjwQQSF1Ai53U7TdJE0bpMgcZcMAYVMDKQZ61mfVNUD0Zd85A4JJ/cLshyJTDiGzkxfbYN
	pFxNnGs9kRKPPBsGG3OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweop-00000009hss-15BR;
	Wed, 19 Aug 2026 11:50:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweon-00000009hsh-2fi7
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 11:50:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A204E60A58;
	Wed, 19 Aug 2026 11:50:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744891F000E9;
	Wed, 19 Aug 2026 11:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787140252;
	bh=PzZQi/+zyv5tISCSrhzpaU2w5pSh1zq3AvPapYtU2N4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=LNVICCgHe+pAUQZvzTWDm972iLfklbfwbVcaoSdCB8MxiUZjCBG/6a4PRM1NczvzE
	 vuq1+vZTyHmI/D/1ZxhbKkj6NYhS0QcLq/rxGhscQpHzRTnmcP8s2fSfZwyZG7rVuN
	 IVuiabGroKi3jjXib5l7Zqej8ydmEfMBPYs69FrJiFNA80q/ia+BsZoCvmTa0vaYyi
	 24fTaD7hPfhY0KohdeIT2kkaYH+wxtWU3q/jn5opEGDVOAn6CpBqaHY19x8r65gFjx
	 Wy9xtLM9ASCA5Y9U9x7dnUng6dWG08KvDHiZwiGTMl22dK720ddr6lSCBPsHyxBig1
	 CeqbwaNmUZxtw==
Message-ID: <4c5b2ab5-83f8-4ee7-bb02-3046ed01fd84@kernel.org>
Date: Wed, 19 Aug 2026 13:50:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/bug: Add ARCH_WARN_ASM and refactor
 _EMIT_BUG_ENTRY for Rust support
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com,
 tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev,
 thuth@redhat.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 rust-for-linux@vger.kernel.org
Cc: FUJITA Tomonori <tomo@flapping.org>
References: <20260819084825.969116-1-mkchauras@gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260819084825.969116-1-mkchauras@gmail.com>
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

CgpMZSAxOS8wOC8yMDI2IMOgIDEwOjQ4LCBNdWtlc2ggS3VtYXIgQ2hhdXJhc2l5YSAoSUJNKSBh
IMOpY3JpdMKgOgo+IFRoZSBSdXN0IGtlcm5lbCBpbmZyYXN0cnVjdHVyZSBnZW5lcmF0ZXMgaW5s
aW5lIGFzbSBmb3IgV0FSTigpIHZpYQo+IEFSQ0hfV0FSTl9BU00oZmlsZSwgbGluZSwgZmxhZ3Ms
IHNpemUpLCBleHBhbmRpbmcgaXQgdGhyb3VnaCBhIEMKPiBwcmVwcm9jZXNzb3IgcGFzcyAoZ2Vu
ZXJhdGVkX2FyY2hfd2Fybl9hc20ucnMuUykgdG8gcHJvZHVjZSBhbgo+IGFyY2gtc3BlY2lmaWMg
YXNtIHRlbXBsYXRlIHN0cmluZyBmb3IgdXNlIGluIFJ1c3QncyBjb3JlOjphcmNoIG1hY3Jvcy4K
PiAKPiBwb3dlcnBjIGN1cnJlbnRseSBsYWNrcyBBUkNIX1dBUk5fQVNNIGFuZCBBUkNIX1dBUk5f
UkVBQ0hBQkxFLCBjYXVzaW5nCj4gUnVzdCBidWlsZHMgdG8gZmFpbCBvbiBwb3dlcnBjLgo+IAo+
IFJlZmFjdG9yIF9FTUlUX0JVR19FTlRSWSB0byBhY2NlcHQgZXhwbGljaXQgKGZpbGUsIGxpbmUs
IGZsYWdzKSBzdHJpbmcKPiBhcmd1bWVudHMgcmF0aGVyIHRoYW4gcmVseWluZyBvbiBwb3NpdGlv
bmFsIGFzbSBvcGVyYW5kIHJlZmVyZW5jZXMKPiAoJTAsICUxLCAlMiwgJTMpLiBUaGlzIGFsbG93
cyB0aGUgbWFjcm8gdG8gYmUgY29tcG9zZWQgYXMgYSBwbGFpbgo+IHN0cmluZyBjb25jYXRlbmF0
aW9uLCB3aGljaCBpcyByZXF1aXJlZCBmb3IgQVJDSF9XQVJOX0FTTSB3aGVyZSBubyBhc20KPiBv
cGVyYW5kIGNvbnRleHQgZXhpc3RzLgo+IAo+IE1vdmUgdGhlIC5vcmcgYW5kIC5wcmV2aW91cyBk
aXJlY3RpdmVzIG91dCBvZiBfRU1JVF9CVUdfRU5UUlkgYW5kIGludG8KPiB0aGUgQlVHX0VOVFJZ
KCkgY2FsbCBzaXRlIHRvIHByZXNlcnZlIGV4aXN0aW5nIGJlaGF2aW91ciB3aGlsZSBlbmFibGlu
Zwo+IEFSQ0hfV0FSTl9BU00gdG8gc3VwcGx5IGl0cyBvd24gc2l6ZSBvcGVyYW5kIGluZGVwZW5k
ZW50bHkuCj4gCj4gQWRkIEFSQ0hfV0FSTl9SRUFDSEFCTEUgYXMgYW4gZW1wdHkgZGVmaW5lLCBt
YXRjaGluZyB0aGUgYXJtNjQKPiBjb252ZW50aW9uLCBpbmRpY2F0aW5nIHRoYXQgbm8gYWRkaXRp
b25hbCByZWFjaGFiaWxpdHkgYW5ub3RhdGlvbiBpcwo+IG5lZWRlZCBhZnRlciBhIFdBUk4gb24g
cG93ZXJwYy4KPiAKPiBUaGlzIGJyaW5ncyBwb3dlcnBjIGludG8gbGluZSB3aXRoIHg4NiwgYXJt
NjQsIHMzOTAsIGFuZCByaXNjdiwgYWxsIG9mCj4gd2hpY2ggYWxyZWFkeSBkZWZpbmUgQVJDSF9X
QVJOX0FTTSBhbmQgQVJDSF9XQVJOX1JFQUNIQUJMRS4KPiAKPiBTdWdnZXN0ZWQtYnk6IEZVSklU
QSBUb21vbm9yaSA8dG9tb0BmbGFwcGluZy5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogTXVrZXNoIEt1
bWFyIENoYXVyYXNpeWEgKElCTSkgPG1rY2hhdXJhc0BnbWFpbC5jb20+Cj4gLS0tCj4gICBhcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYnVnLmggfCAyOCArKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTIgZGVsZXRpb25zKC0p
Cj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9idWcuaCBiL2FyY2gv
cG93ZXJwYy9pbmNsdWRlL2FzbS9idWcuaAo+IGluZGV4IDBkYjQ4OTc3YzcwYy4uOGFiYTM5ZTBj
ZjI2IDEwMDY0NAo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9idWcuaAo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9idWcuaAo+IEBAIC0zMiwzNCArMzIsMzggQEAKPiAg
ICNlbmRpZiAvKiB2ZXJib3NlICovCj4gICAKPiAgICNlbHNlIC8qICFfX0FTU0VNQkxFUl9fICov
CgpTb3JyeSwgSSBzdGlsbCBkb24ndCB1bmRlcnN0YW5kLiBUaGUgb25seSBwbGFjZSB0aGUgbmV3
IG1hY3JvIGlzIHVzZWQgaXMgCmEgLlMgZmlsZSAobmFtZWx5IHJ1c3Qva2VybmVsL2dlbmVyYXRl
ZF9hcmNoX3dhcm5fYXNtLnJzLlMpLCBhbmQgdGhlIApjaGFuZ2UgdGhpcyBwYXRjaCBpbXBsZW1l
bnRzIGlzIGluc2lkZSBhICNpZiAhX19BU1NFTUJMRVJfXy4KCldoYXQgYW0gSSBtaXNzaW5nID8K
CkNocmlzdG9waGUKCgo+IC0vKiBfRU1JVF9CVUdfRU5UUlkgZXhwZWN0cyBhcmdzICUwLCUxLCUy
LCUzIHRvIGJlIEZJTEUsIExJTkUsIGZsYWdzIGFuZAo+IC0gICBzaXplb2Yoc3RydWN0IGJ1Z19l
bnRyeSksIHJlc3BlY3RpdmVseSAqLwo+ICAgI2lmZGVmIENPTkZJR19ERUJVR19CVUdWRVJCT1NF
Cj4gLSNkZWZpbmUgX0VNSVRfQlVHX0VOVFJZCQkJCVwKPiArI2RlZmluZSBfRU1JVF9CVUdfRU5U
UlkoZmlsZSwgbGluZSwgZmxhZ3MpCVwKPiAgIAkiLnNlY3Rpb24gX19idWdfdGFibGUsXCJhd1wi
XG4iCQlcCj4gICAJIjI6CS40Ynl0ZSAxYiAtIC5cbiIJCVwKPiAtCSIJLjRieXRlICUwIC0gLlxu
IgkJXAo+IC0JIgkuc2hvcnQgJTEsICUyXG4iCQlcCj4gLQkiLm9yZyAyYislM1xuIgkJCQlcCj4g
LQkiLnByZXZpb3VzXG4iCj4gKwkiCS40Ynl0ZSAiIGZpbGUgIiAtIC5cbiIJCVwKPiArCSIJLnNo
b3J0ICIgbGluZSAiLCAiIGZsYWdzICJcbiIKPiAgICNlbHNlCj4gLSNkZWZpbmUgX0VNSVRfQlVH
X0VOVFJZCQkJCVwKPiArI2RlZmluZSBfRU1JVF9CVUdfRU5UUlkoZmlsZSwgbGluZSwgZmxhZ3Mp
CVwKPiAgIAkiLnNlY3Rpb24gX19idWdfdGFibGUsXCJhd1wiXG4iCQlcCj4gICAJIjI6CS40Ynl0
ZSAxYiAtIC5cbiIJCVwKPiAtCSIJLnNob3J0ICUyXG4iCQkJXAo+IC0JIi5vcmcgMmIrJTNcbiIJ
CQkJXAo+IC0JIi5wcmV2aW91c1xuIgo+ICsJIgkuc2hvcnQgIiBmbGFncyAiXG4iCj4gICAjZW5k
aWYKPiAgIAo+ICAgI2RlZmluZSBCVUdfRU5UUlkoY29uZF9zdHIsIGluc24sIGZsYWdzLCAuLi4p
CQlcCj4gICAJX19hc21fXyBfX3ZvbGF0aWxlX18oCQkJCVwKPiAgIAkJIjE6CSIgaW5zbiAiXG4i
CQkJXAo+IC0JCV9FTUlUX0JVR19FTlRSWQkJCQlcCj4gKwkJX0VNSVRfQlVHX0VOVFJZKCIlMCIs
ICIlMSIsICIlMiIpCVwKPiArCQkiLm9yZyAyYislM1xuIgkJCQlcCj4gKwkJIi5wcmV2aW91c1xu
IgkJCQlcCj4gICAJCTogOiAiaSIgKFdBUk5fQ09ORElUSU9OX1NUUihjb25kX3N0cikgX19GSUxF
X18pLCAiaSIgKF9fTElORV9fKSwJXAo+ICAgCQkgICJpIiAoZmxhZ3MpLAkJCQlcCj4gICAJCSAg
ImkiIChzaXplb2Yoc3RydWN0IGJ1Z19lbnRyeSkpLAlcCj4gICAJCSAgIyNfX1ZBX0FSR1NfXykK
PiAgIAo+ICsjZGVmaW5lIEFSQ0hfV0FSTl9BU00oZmlsZSwgbGluZSwgZmxhZ3MsIHNpemUpCQlc
Cj4gKwkJIjE6CXR3aSAzMSwgMCwgMFxuIgkJCVwKPiArCQlfRU1JVF9CVUdfRU5UUlkoZmlsZSwg
bGluZSwgZmxhZ3MpCVwKPiArCQkiLm9yZyAyYisiIHNpemUgIlxuIgkJCVwKPiArCQkiLnByZXZp
b3VzXG4iCj4gKwo+ICsjZGVmaW5lIEFSQ0hfV0FSTl9SRUFDSEFCTEUKPiArCj4gICAvKgo+ICAg
ICogQlVHX09OKCkgYW5kIFdBUk5fT04oKSBkbyB0aGVpciBiZXN0IHRvIGNvb3BlcmF0ZSB3aXRo
IGNvbXBpbGUtdGltZQo+ICAgICogb3B0aW1pc2F0aW9ucy4gSG93ZXZlciBkZXBlbmRpbmcgb24g
dGhlIGNvbXBsZXhpdHkgb2YgdGhlIGNvbmRpdGlvbgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
