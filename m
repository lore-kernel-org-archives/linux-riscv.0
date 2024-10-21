Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C0ED15DB2
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 16:49:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LCu0AhVDXNWPOgMVgQOE5sm0wKlfg82c9PDW0++PdUo=; b=zG7UgOu4464xLL
	Jin2deoJdg6TzywNtg9GlVJc74CZGdkpSrquqZqfhbtANACFyu3S0/JWnbDv5RbKZjA6Y15h/hn6H
	Qa+ZHwxdUFb10Lgjj7W2NHDhbk3VRXlGAEFZhhu8zQuzIYBso34VJ9Foq98OZ1mOdOD17oajl6BnJ
	Jzyvbc2JptxlBF/C+6o79/dkVXPbHqjl/98MyDIhTA7dxsSB825D2YD6oAv6GbnFcJ6T/K2Fe6p01
	/FALPmXRmfLw7qLOPR6GEde7FUTrsV2VUhkqxuGb9jL58mTux5umREWcIrTGEze2GuKMFiiQEeUxB
	cIkYJsn8ig57mmp1SXVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2vah-000000081lO-0K8h;
	Mon, 21 Oct 2024 16:49:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2vYD-000000081Cw-3XNd
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 16:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AE5D0A43566;
	Mon, 21 Oct 2024 16:46:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61F7FC4CEC3;
	Mon, 21 Oct 2024 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729529196;
	bh=A0FkUr4PZGC3BJ8Tf522Ac9/Uph3gtwc+TMsH4zYyVU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DD+rLbwstiSB8PKB5/d1WjmMXMFhcAAK58egPR6pUSAR3H3bqmc2t8dv68/I4/hsR
	 QAKEb4CcfzaE5hYedcmChP6/cdE9WGdnHoIRn1Bz/gUBP3XFE8W1ZegxGy5L7c7OSQ
	 uXEas5hD9Jx9hPkS1K+fj/mOIZUPIwO0RP60EBm+VU/xXxdF5LrnhlQ3ebjeCwrWvx
	 C6BlN7joE6wD3MvhkxOKQCvXYVK0yo5WJsYgwUqweHTBq9D/HCPmS+00tgmRSWyCWw
	 hCFxcHWljR2xjQQWcCD5rYOGhK1kZnewuH3s3nds5QegnmTrzopmuHAqyryC9rEDqp
	 vVYrjxlbJ3f6g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Celeste Liu <coelacanthushex@gmail.com>, Celeste Liu via B4 Relay
 <devnull+CoelacanthusHex.gmail.com@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?=
 <bjorn@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 "Dmitry V. Levin" <ldv@strace.io>, Andrea Bolognani <abologna@redhat.com>,
 Felix Yan <felixonmars@archlinux.org>, Ruizhe Pan <c141028@gmail.com>,
 Shiqi Zhang <shiqi@isrc.iscas.ac.cn>, Guo Ren <guoren@kernel.org>, Yao Zi
 <ziyao@disroot.org>, Han Gao <gaohan@iscas.ac.cn>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] riscv/entry: get correct syscall number from
 syscall_get_nr()
In-Reply-To: <b72e3d2b-d540-47bf-adec-0ab6eda135d8@gmail.com>
References: <20241017-fix-riscv-syscall-nr-v1-1-4edb4ca07f07@gmail.com>
 <87a5exy2rx.fsf@all.your.base.are.belong.to.us>
 <b72e3d2b-d540-47bf-adec-0ab6eda135d8@gmail.com>
Date: Mon, 21 Oct 2024 09:46:35 -0700
Message-ID: <8734kpqu8k.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_094638_036171_8DC214D3 
X-CRM114-Status: GOOD (  22.13  )
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

Q2VsZXN0ZSBMaXUgPGNvZWxhY2FudGh1c2hleEBnbWFpbC5jb20+IHdyaXRlczoKCj4+PiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdHJhcHMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Ry
YXBzLmMKPj4+IGluZGV4IDUxZWJmZDIzZTAwNzY0NDc1MTgwODFkMTM3MTAyYTlhMTFmZjJlNDUu
LjMxMjVmYWI4ZWU0YWY0NjhhY2U5ZjY5MmRkMzRlMTc5NzU1NWNjZTMgMTAwNjQ0Cj4+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC90cmFwcy5jCj4+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC90
cmFwcy5jCj4+PiBAQCAtMzE2LDE4ICszMTYsMjUgQEAgdm9pZCBkb190cmFwX2VjYWxsX3Uoc3Ry
dWN0IHB0X3JlZ3MgKnJlZ3MpCj4+PiAgewo+Pj4gIAlpZiAodXNlcl9tb2RlKHJlZ3MpKSB7Cj4+
PiAgCQlsb25nIHN5c2NhbGwgPSByZWdzLT5hNzsKPj4+ICsJCWxvbmcgcmVzOwo+Pj4gIAo+Pj4g
IAkJcmVncy0+ZXBjICs9IDQ7Cj4+PiAgCQlyZWdzLT5vcmlnX2EwID0gcmVncy0+YTA7Cj4+PiAt
CQlyZWdzLT5hMCA9IC1FTk9TWVM7Cj4+PiAgCj4+PiAgCQlyaXNjdl92X3ZzdGF0ZV9kaXNjYXJk
KHJlZ3MpOwo+Pj4gIAo+Pj4gLQkJc3lzY2FsbCA9IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21v
ZGUocmVncywgc3lzY2FsbCk7Cj4+PiArCQlyZXMgPSBzeXNjYWxsX2VudGVyX2Zyb21fdXNlcl9t
b2RlKHJlZ3MsIHN5c2NhbGwpOwo+Pj4gKwkJLyoKPj4+ICsJCSAqIENhbGwgc3lzY2FsbF9nZXRf
bnIoKSBhZ2FpbiBiZWNhdXNlIHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKQo+Pj4gKwkJ
ICogbWF5IGNoYW5nZSBhNyByZWdpc3Rlci4KPj4+ICsJCSAqLwo+Pj4gKwkJc3lzY2FsbCA9IHN5
c2NhbGxfZ2V0X25yKGN1cnJlbnQsIHJlZ3MpOwo+Pj4gIAo+Pj4gIAkJYWRkX3JhbmRvbV9rc3Rh
Y2tfb2Zmc2V0KCk7Cj4+PiAgCj4+PiAtCQlpZiAoc3lzY2FsbCA+PSAwICYmIHN5c2NhbGwgPCBO
Ul9zeXNjYWxscykKPj4+ICsJCWlmIChzeXNjYWxsIDwgMCB8fCBzeXNjYWxsID49IE5SX3N5c2Nh
bGxzKQo+Pj4gKwkJCXJlZ3MtPmEwID0gLUVOT1NZUzsKPj4+ICsJCWVsc2UgaWYgKHJlcyAhPSAt
MSkKPj4+ICAJCQlzeXNjYWxsX2hhbmRsZXIocmVncywgc3lzY2FsbCk7Cj4+IAo+PiBIZXJlIHdl
IGNhbiBwZXJmb3JtIHRoZSBzeXNjYWxsLCBldmVuIGlmIHJlcyBpcyAtMS4gRS5nLiwgaWYgdGhp
cyBwYXRoCj4+IFsyXSBpcyB0YWtlbiwgd2UgbWlnaHQgaGF2ZSBhIHZhbGlkIHN5c2NhbGwgbnVt
YmVyIGluIGE3LCBidXQgdGhlCj4+IHN5c2NhbGwgc2hvdWxkIG5vdCBiZSBwZXJmb3JtZWQuCj4K
PiBJIG1heSBtaXN1bmRlcnN0YW5kIHdoYXQgeW91IHNhaWQsIGJ1dCBJIGNhbid0IHNlZSB0aGUg
aXNzdWUgeW91IHBvaW50ZWQuCj4gQSBzeXNjYWxsIGlzIHBlcmZvcm1lZCBpZmYKPgo+IDEpIHN5
c2NhbGwgbnVtYmVyIGluIGE3IG11c3QgYmUgdmFsaWQsIHNvIGl0IGNhbiByZWFjaCAiZWxzZSBp
ZiIgYnJhbmNoLgo+IDIpIHJlcyAhPSAtMSwgc28gc3lzY2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9k
ZSgpIGRvZXNuJ3QgcmV0dXJuIC0xIHRvCj4gICAgaW5mb3JtIHRoZSBzeXNjYWxsIHNob3VsZCBi
ZSBza2lwcGVkLgoKQWgsIGluZGVlZC4gQXBvbG9naWVzLCB0aGF0J2xsIHdvcmshCgpSZWxhdGVk
LCBub3cgd29udCB0aGlzIHJlaW50cm9kdWNlIHRoZSBzZWNjb21wIGZpbHRlcmluZyBwcm9ibGVt
PyBTYXksCnJlcyBpcyAtMSAqYW5kKiBzeXNjYWxsIGludmFsaWQsIHRoZW4gYTAgdXBkYXRlZCBi
eSBzZWNjb21wIHdpbGwgYmUKb3ZlcndyaXR0ZW4gaGVyZT8KCj4+IEFsc28sIG9uZSByZWFzb24g
Zm9yIHRoZSBnZW5lcmljIGVudHJ5IGlzIHNvIHRoYXQgaXQgc2hvdWxkIGJlIGxlc3MKPj4gd29y
ay4gSGVyZSwgeW91IHB1bGwgKElNTykgZGV0YWlscyB0aGF0IGJlbG9uZyB0byB0aGUgY29tbW9u
IGVudHJ5Cj4+IGltcGxlbWVudGF0aW9uL0FQSSB1cCB0aGUgY29tbW9uIGVudHJ5IHVzZXIuIFdk
eXQgYWJvdXQgcHVzaGluZyBpdCBkb3duCj4+IHRvIGNvbW1vbiBlbnRyeT8gU29tZXRoaW5nIGxp
a2U6Cj4KPiBZZWFoLCB3ZSBjYW4uIEJ1dCBJIHB1bGwgaXQgb3V0IG9mIGNvbW1vbiBlbnRyeSB0
byBnZXQgbW9yZSBzaW1wbGUgQVBJIHNlbWFudGljOgo+Cj4gMS4gc3lzY2FsbF9lbnRlcl9mcm9t
X3VzZXJfbW9kZSgpIHdpbGwgZG8gdHdvIHRoaW5nczoKPiAgICAxKSB0aGUgcmV0dXJuIHZhbHVl
IGlzIG9ubHkgdG8gaW5mb3JtIHdoZXRoZXIgdGhlIHN5c2NhbGwgc2hvdWxkIGJlIHNraXBwZWQu
Cj4gICAgMikgcmVncyB3aWxsIGJlIG1vZGlmaWVkIGJ5IGZpbHRlcnMgKHNlY2NvbXAgb3IgcHRy
YWNlIGFuZCBzbyBvbikuCj4gMi4gZm9yIGNvbW1vbiBlbnRyeSB1c2VyLCB0aGVyZSBpcyB0d28g
aW5mb3JtYXRpb25zOiBzeXNjYWxsIG51bWJlciBhbmQKPiAgICB0aGUgcmV0dXJuIHZhbHVlIG9m
IHN5c2NhbGxfZW50ZXJfZnJvbV91c2VyX21vZGUoKSAoY2FsbGVkIGlzX3NraXBwZWQgYmVsb3cp
Lgo+ICAgIHNvIHRoZXJlIGlzIHRocmVlIHNpdHVhdGlvbnM6Cj4gICAgMSkgaWYgc3lzY2FsbCBu
dW1iZXIgaXMgaW52YWxpZCwgdGhlIHN5c2NhbGwgc2hvdWxkIG5vdCBiZSBwZXJmb3JtZWQsIGFu
ZAo+ICAgICAgIHdlIHNldCBhMCB0byAtRU5PU1lTIHRvIGluZm9ybSB1c2Vyc3BhY2UgdGhlIHN5
c2NhbGwgZG9lc24ndCBleGlzdC4KPiAgICAyKSBpZiBzeXNjYWxsIG51bWJlciBpcyB2YWxpZCwg
aXNfc2tpcHBlZCB3aWxsIGJlIHVzZWQ6Cj4gICAgICAgYSkgaWYgaXNfc2tpcHBlZCBpcyAtMSwg
d2hpY2ggbWVhbnMgdGhlcmUgYXJlIHNvbWUgZmlsdGVycyByZWplY3QgdGhpcyBzeXNjYWxsLAo+
ICAgICAgICAgIHNvIHRoZSBzeXNjYWxsIHNob3VsZCBub3QgcGVyZm9ybWVkLiAoT2YgY291cnNl
LCB3ZSBjYW4gdXNlIGJvb2wgaW5zdGVhZCB0bwo+ICAgICAgICAgIGdldCBiZXR0ZXIgc2VtYW50
aWMpCj4gICAgICAgYikgaWYgaXNfc2tpcHBlZCAhPSAtMSwgd2hpY2ggbWVhbnMgdGhlIGZpbHRl
cnMgYXBwcm92ZWQgdGhpcyBzeXNjYWxsLAo+ICAgICAgICAgIHNvIHdlIGludm9rZSBzeXNjYWxs
IGhhbmRsZXIgd2l0aCBtb2RpZmllZCByZWdzLgo+Cj4gSW4geW91ciBkZXNpZ24sIHRoZSBsb2dp
Y2FsIGNvbmRpdGlvbiBpcyBub3Qgb2J2aW91cy4gV2h5IHN5c2NhbGxfZW50ZXJfZnJvbV91c2Vy
X21vZGUoKQo+IGluZm9ybWVkIHRoZSBzeXNjYWxsIHdpbGwgYmUgc2tpcHBlZCBidXQgdGhlIHN5
c2NhbGwgaGFuZGxlciB3aWxsIGJlIGNhbGxlZAo+IHdoZW4gc3lzY2FsbCBudW1iZXIgaXMgaW52
YWxpZD8gVGhlIHVzZXJzIG5lZWQgdG8gdGhpbmsgdHdvIHRoaW5ncyB0byBnZXQgcmVzdWx0Ogo+
IGEpIC0xIG1lYW5zIHNraXAKPiBiKSAtMSA8IDAgaW4gc2lnbmVkIGludGVnZXIsIHNvIHRoZSBz
a2lwIGNvbmRpdGlvbiBpcyBhbHdheXMgYSBpbnZhbGlkIHN5c2NhbGwgbnVtYmVyLgo+Cj4gSW4g
bWF5IHdheSwgdGhlIHVzZXJzIG9ubHkgbmVlZCB0byB0aGluayBvbmUgdGhpbmc6IFRoZSBzeXNj
YWxsX2VudGVyX2Zyb21fdXNlcl9tb2RlKCkKPiBzYWlkIC0xIG1lYW5zIHRoZSBzeXNjYWxsIHNo
b3VsZCBub3QgYmUgcGVyZm9ybWVkLCBzbyB1c2UgaXQgYXMgYSBjb25kaXRpb24gb2YgcmVqZWN0
Cj4gZGlyZWN0bHkuIFRoZXkganVzdCBuZWVkIHRvIGNvbWJpbmUgdGhlIGluZm9ybWF0aW9ucyB0
aGF0IHRoZXkgZ2V0IGZyb20gQVBJIGFzIHRoZQo+IGNvbmRpdGlvbiBvZiBjb250cm9sIGZsb3cu
CgpJJ20gYWxsLWluIGZvciBzaW1wbGVyIEFQSSB1c2FnZSEgTWF5YmUgbWFzc2FnZSB0aGUKc3lz
Y2FsbF9lbnRlcl9mcm9tX3VzZXJfbW9kZSgpIChvciBhIG5ldyBvbmUpLCBzbyB0aGF0IGFkZGl0
aW9uYWwKc3lzY2FsbF9nZXRfbnIoKSBjYWxsIGlzIG5vdCBuZWVkZWQ/CgoKQmrDtnJuCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
