Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C45C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 12:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y58l5RwcLrldnL37E6PDicZ5Sqz/Iy3DPncZCITeZig=; b=GRLoHYsAe7dY9s
	kccN/62bdBcLsMT7KT41ACZ7sz74XqnFWbL8KNIrvL/qMLAU0Fyfu+jb/2hwKW9dfA2LrpvGr63XE
	6tWZdh2SgO8XDbY5xYvHets6zQqcoSJEah+p7scXjEllzlMU3mR4+z7mpUad4nNgXGZY5bfQjLH+W
	39hiceNuWtHQgmTOSqxqXbqsvcu+pX1ey27SVl9Z33mrOZXDbsbXvnq32ZyrMfL5JKZUCX7IwcJum
	qwbJtFYSyyg3n4/Inol6HmS/qNh4C+sRitnb8cm6uHHj6FThIM6zRPcfW8AO/cnvdDdZ3lQnte3bO
	WpRk3d2XHxaN6BhLMMQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetjv-00000001n3m-237G;
	Wed, 01 Jul 2026 12:08:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wetjt-00000001n0f-2Tss;
	Wed, 01 Jul 2026 12:08:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CFB160138;
	Wed,  1 Jul 2026 12:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2AA1F000E9;
	Wed,  1 Jul 2026 12:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782907704;
	bh=C0eRNTRNun4PKYWrdIhick5RVmD+08hh2iy99USv2dg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=Lk0z/ZQBNWuYtX5yOP2RB8ff5+3SHNmHArT5mGIRw4gKVvkZg6/TGWpPSDRn1vUoB
	 7h0Svchp8RQk9jeBIpu2cmGAS9pqWjEe0cXuGkXpbg3WI8WFwI3qamF0M9B47NrSdz
	 6lRu0WURG8w7jW9SaeLmjXJfjZRQ0eUtzUCAPDif+6m2TOTUES5AeQbvQvLoXcrEPD
	 RaZr333OdeOtghfigKxJow6PwKBVRJfWhkE3Yw19SmPSfdyjHW8185kmrdE4IFO/cc
	 8a/fJUJ/MUCdG9cBe5+Kr0uaV07WwcQQgzZILuVCnyN0yYTCvZJBiKEjyAyuvMWiOR
	 lgFC+aGDyBsdw==
From: Pratyush Yadav <pratyush@kernel.org>
To: Tao Liu <ltao@redhat.com>
Cc: Pratyush Yadav <pratyush@kernel.org>,  Baoquan He <bhe@redhat.com>,
  kexec@lists.infradead.org,  pjw@kernel.org,  palmer@dabbelt.com,
  aou@eecs.berkeley.edu,  alex@ghiti.fr,  Mimi Zohar <zohar@linux.ibm.com>,
  Roberto Sassu <roberto.sassu@huawei.com>,  Dmitry Kasatkin
 <dmitry.kasatkin@gmail.com>,  Eric Snowberg <eric.snowberg@oracle.com>,
  linux-integrity@vger.kernel.org,  linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix a NULL pointer reference in
 machine_kexec_prepare
In-Reply-To: <CAO7dBbXzs2pMrVuJ3qUVT2KYNh9RysOOWy_HPTmCY3gYUh9LDQ@mail.gmail.com>
 (Tao
	Liu's message of "Wed, 1 Jul 2026 15:29:44 +1200")
References: <20260529032739.13264-2-ltao@redhat.com>
	<CAO7dBbW+LEy8SBGAKcrxEDzK5Xctw-r7ztgnXuURa9g0xntbtQ@mail.gmail.com>
	<CAP_BRoQEM8Re1dT7JNQgO72o50GAnb2y7R1HWPd+E772GVYAJg@mail.gmail.com>
	<2vxzh5mlk3bd.fsf@kernel.org>
	<CAO7dBbXzs2pMrVuJ3qUVT2KYNh9RysOOWy_HPTmCY3gYUh9LDQ@mail.gmail.com>
Date: Wed, 01 Jul 2026 14:08:20 +0200
Message-ID: <2vxzy0fuhpzf.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
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

T24gV2VkLCBKdWwgMDEgMjAyNiwgVGFvIExpdSB3cm90ZToKCj4gSGkgUHJhdHl1c2gsCj4KPiBP
biBNb24sIEp1biAyOSwgMjAyNiBhdCAxMToxM+KAr1BNIFByYXR5dXNoIFlhZGF2IDxwcmF0eXVz
aEBrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4gK0NjIElNQSBtYWludGFpbmVycwo+Pgo+PiBPbiBG
cmksIEp1biAyNiAyMDI2LCBCYW9xdWFuIEhlIHdyb3RlOgo+Pgo+PiA+IEFkZCBrZXhlYyBNTCB0
byBDQy4KPj4gPgo+PiA+IE9uIEZyaSwgSnVuIDI2LCAyMDI2IGF0IDc6NDbigK9BTSBUYW8gTGl1
IDxsdGFvQHJlZGhhdC5jb20+IHdyb3RlOgo+PiA+Pgo+PiA+PiBLaW5kbHkgcGluZywgYW55IGNv
bW1lbnRzPwo+PiA+Pgo+PiA+PiBUaGFua3MsCj4+ID4+IFRhbyBMaXUKPj4gPj4KPj4gPj4gT24g
RnJpLCBNYXkgMjksIDIwMjYgYXQgMzozNeKAr1BNIFRhbyBMaXUgPGx0YW9AcmVkaGF0LmNvbT4g
d3JvdGU6Cj4+ID4+ID4KPj4gPj4gPiBBIE5VTEwgcG9pbnRlciByZWZlcmVuY2UgaXNzdWUgaXMg
bm90aWNlZCBpbiByaXNjdidzIG1hY2hpbmVfa2V4ZWNfcHJlcGFyZSwKPj4gPj4gPiB3aGVyZSBp
bWFnZS0+c2VnbWVudFtpXS5idWYgbWlnaHQgYmUgTlVMTCBhbmQgY29waWVkIHVuY2hlY2tlZC4K
Pj4gPj4gPgo+PiA+PiA+IFRoZSBOVUxMIGJ1ZiBjb21lcyBmcm9tIHNlY3VyaXR5L2ludGVncml0
eS9pbWEvaW1hX2tleGVjLmM6Cj4+ID4+ID4gaW1hX2FkZF9rZXhlY19idWZmZXIoKSwgd2hlcmUg
a2J1ZiBpcyBhZGRlZCBieSBrZXhlY19hZGRfYnVmZmVyKCksCj4+ID4+ID4gYnV0IGtidWYuYnVm
ZmVyIGlzIE5VTEwuCj4+ID4+ID4KPj4gPj4gPiBGaXggdGhpcyBieSBzaW1wbHkgYWRkaW5nIGEg
Y2hlY2sgYmVmb3JlIGNvcHkuCj4+ID4+ID4KPj4gPj4gPiBTaWduZWQtb2ZmLWJ5OiBUYW8gTGl1
IDxsdGFvQHJlZGhhdC5jb20+Cj4+ID4+ID4gLS0tCj4+ID4+ID4gIGFyY2gvcmlzY3Yva2VybmVs
L21hY2hpbmVfa2V4ZWMuYyB8IDMgKysrCj4+ID4+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKykKPj4gPj4gPgo+PiA+PiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9t
YWNoaW5lX2tleGVjLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPj4gPj4g
PiBpbmRleCAyMzA2Y2UzZTVmMjIuLmQ4MWQ1NzZmOWNiNSAxMDA2NDQKPj4gPj4gPiAtLS0gYS9h
cmNoL3Jpc2N2L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPj4gPj4gPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9tYWNoaW5lX2tleGVjLmMKPj4gPj4gPiBAQCAtNDEsNiArNDEsOSBAQCBtYWNoaW5l
X2tleGVjX3ByZXBhcmUoc3RydWN0IGtpbWFnZSAqaW1hZ2UpCj4+ID4+ID4gICAgICAgICAgICAg
ICAgIGlmIChpbWFnZS0+c2VnbWVudFtpXS5tZW1zeiA8PSBzaXplb2YoZmR0KSkKPj4gPj4gPiAg
ICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPj4gPj4gPgo+PiA+PiA+ICsgICAgICAg
ICAgICAgICBpZiAoaW1hZ2UtPnNlZ21lbnRbaV0uYnVmID09IE5VTEwpCj4+ID4+ID4gKyAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+ID4+ID4gKwo+PiA+Cj4+ID4gVGhpcyBpcyBh
IGdvb2QgZml4LCBtYXliZSB3ZSBjYW4gYWRkIGNvZGUgY29tbWVudHMgdG8gZXhwbGFpbiBpdCBh
cwo+PiA+IGJlbG93LCBqdXN0IGZvciByZWZlcmVuY2UuCj4+ID4KPj4gPiAgICAgICAgICAgICAg
ICAvKgo+PiA+ICAgICAgICAgICAgICAgICAqIFNvbWUgc2VnbWVudHMgKGUuZy4gSU1BKSByZXNl
cnZlIHNwYWNlIGJ1dCBoYXZlIG5vIGJ1ZmZlcgo+PiA+ICAgICAgICAgICAgICAgICAqIGxvYWRl
ZCB5ZXQuIFNraXAgdGhlbSBhcyB0aGV5IGNhbm5vdCBjb250YWluIGFuIEZEVC4KPj4gPiAgICAg
ICAgICAgICAgICAgKi8KPj4gPiBBbmQgaXMgdGhlcmUgYW55IG90aGVyIHBsYWNlIHdoZXJlIHRo
ZSBzaW1pbGFyIGlzc3VlIGV4aXN0cz8gZS5nIG9uIExvb25nQXJjaD8KPj4gPgo+PiA+IE90aGVy
IHRoYW4gYWJvdmUgY29uY2VybnMsIHRoaXMgcGF0Y2ggbG9va3MgZ29vZCB0byBtZToKPj4gPgo+
PiA+IEFja2VkLWJ5OiBCYW9xdWFuIEhlIDxiaGVAcmVkaGF0LmNvbT4KPj4KPj4gWWVhaCwgdGhl
IHBhdGNoIExHVE0gdG8gbWUgdG9vLgo+Pgo+PiBBY2tlZC1ieTogUHJhdHl1c2ggWWFkYXYgPHBy
YXR5dXNoQGtlcm5lbC5vcmc+Cj4+Cj4+IEFsdGhvdWdoIEkgdGhpbmsgSU1BIGNhbiBtYWtlIHRo
aXMgYSBiaXQgZWFzaWVyIHRvIHVuZGVyc3RhbmQuIEZpcnN0LCBpbgo+PiBpbWFfYWRkX2tleGVj
X2J1ZmZlcigpIGl0IHNob3VsZCBzZXQga2J1Zi5idWZmZXIgdG8gTlVMTCBhbmQga2J1Zi5idWZz
ego+PiB0byAwIGV4cGxpY2l0bHkgaW5zdGVhZCBvZiB1c2luZyBrZXhlY19idWZmZXIgYW5kIGtl
eGVjX2J1ZmZlcl9zaXplCj4+IHdoaWNoIGFyZSBpbml0aWFsaXplZCB0byBOVUxMIGFuZCAwLCBi
dXQgbmV2ZXIgdXBkYXRlZC4gVXNpbmcgdGhlCj4+IHZhcmlhYmxlcyBoZXJlIGFkZHMgYW4gZXh0
cmEgbGV2ZWwgb2YgaW5kaXJlY3Rpb24uCj4+Cj4+IEFsc28sIHBlcmhhcHMgd2Ugc2hvdWxkIGFk
ZCBhIGNvbW1lbnQgaW4gaW1hX2FkZF9rZXhlY19idWZmZXIoKSBhYm91dAo+PiBob3cgdGhpcyBh
bGwgd29ya3MsIHNpbmNlIHdoZXJlIHRoZSBJTUEgYnVmZmVyIGxpdmVzIGFuZCB3aGVyZSBpdCBn
ZXRzCj4+IHVwZGF0ZWQgaXQgZmFpcmx5IGNvbXBsaWNhdGVkIGFuZCB0b29rIG1lIHNvbWUgdGlt
ZSB0byBwaWVjZSB0b2dldGhlci4KPgo+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCByZXZpZXcgYW5k
IHN1Z2dlc3Rpb25zISBJIGFncmVlIHdpdGggeW91ciBwb2ludAo+IG9uIHRoZSBJTUEgcGFydCwg
SSB3YXMgY29uZnVzZWQgYnkgdGhlIGNvZGUgdG9vLCBlLmcgaW4KPiBpbWFfYWRkX2tleGVjX2J1
ZmZlcigpOgo+Cj4gdm9pZCAqa2V4ZWNfYnVmZmVyID0gTlVMTDsKPiBrYnVmLmJ1ZmZlciA9IGtl
eGVjX2J1ZmZlcjsKPiByZXQgPSBrZXhlY19hZGRfYnVmZmVyKCZrYnVmKTsKPiBpZiAocmV0KSB7
Cj4gICAgIHByX2VycigiRXJyb3IgcGFzc2luZyBvdmVyIGtleGVjIG1lYXN1cmVtZW50IGJ1ZmZl
ci5cbiIpOwo+ICAgICB2ZnJlZShrZXhlY19idWZmZXIpOwo+ICAgICByZXR1cm47Cj4gfQo+Cj4g
RG8gd2UgbmVlZCB0byB2ZnJlZShrZXhlY19idWZmZXIpPyBXaGVuIGtleGVjX2J1ZmZlciBpcyBO
VUxMIGFuZCBzZWVtcwo+IG5ldmVyIGdldCB1cGRhdGVkLgo+Cj4gSSdtIG5vdCBmYW1pbGlhciB3
aXRoIElNQSBjb2RlLCBtYXliZSB0aGVyZSBpcyBhIHJlYXNvbiB3aGljaCBJJ20gdW5hd2FyZSBv
Zi4uLgoKSSB0aGluayBpdCBpcyBqdXN0IGxlZnRvdmVyIGZyb20gcmVmYWN0b3JzLiBrZXhlY19i
dWZmZXIgdXNlZCB0byBwb2ludAp0byBhbiBhY3R1YWwgYnVmZmVyIGF0IHNvbWUgcG9pbnQgYW5k
IHJlZmFjdG9ycyB0byB0aGUgZnVuY3Rpb24gbGVmdAp0aGVtIGFsd2F5cyBOVUxMIGJ1dCBuZXZl
ciByZW1vdmVkIHRoZW0uCgotLSAKUmVnYXJkcywKUHJhdHl1c2ggWWFkYXYKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
