Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F64BC83F01
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v32AnJ4orSIXY9EMaZwrM8f+7WSeVBQM1+3mJota+B4=; b=GZ5salAbd4JH+M
	/jK5jsX0vI8lNVNZJd/vLntIJIuosutaeL5nM0voY5csopwMYxSPScZp0+6kQYzd3cp3LAjJebDgY
	0pOgvjBSR3ifGPxWp+qS1vm6mnN3CFBMlsVNjKT1n8it47SB/NJRLt11AiA8Zjpq9MH5sOMdF15GW
	u/jz3864Q8WIo+clPf7OXksdwU+tlVrbRw1HKEsrj3kFlAns+iUarzpLusCpcwjKE5/q8C6yDWzQN
	sK7U89UY9usU3MbJligLxBWMxClIgg5St9YECbe+dQVGVhAryt/7cgaoONkZ5p0lGPupzcpggoJn2
	cPNWqoDgWkFlQnwzfjRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaArs-007e8P-0y;
	Sun, 27 Aug 2023 08:11:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaArq-007e7z-0p
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 08:11:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5A5AF60B8F;
	Sun, 27 Aug 2023 08:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E935C433C7;
	Sun, 27 Aug 2023 08:11:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693123888;
	bh=a7gvVdvjt2McMEtENvLa0Q/lHREJXWh8ZYndPgK9RuE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OS0Ktsoim8Fs8DR7r22wvZRiiJw/lt8rJ6u2s8o8vxQjs7c0CmMG9VCAEJapyZ1NR
	 FkbiYU75I4lUmyVv8h57H6cDstXw7BAwvfMPUZfZW413gLyAfRVr6HEiviGTC16AXY
	 8o2VstFWRBudj5jo1UBhTu3KrHYEX4fYksbex9tDTL5FItxlTPyGzEw0cZmeMJC4PH
	 OPEsDNj7xL3b3SleICmqaUY+F3d/eP/KR2uTrbQ3uWgeH1W71PU76mAKgDJM8uiRT0
	 nPYHZOieXl7VhED/BNRfLRMUge1BJmjMqvqGKtU3vEzUKT4642g5+wCdp1MZrwXb7D
	 K56Kt56H6ZLOg==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Nam Cao <namcaov@gmail.com>
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@kernel.org>,
 bpf@vger.kernel.org, Hou Tao <houtao@huaweicloud.com>,
 yonghong.song@linux.dev, Alexei Starovoitov
 <alexei.starovoitov@gmail.com>, Puranjay Mohan <puranjay12@gmail.com>
Subject: Re: RISC-V uprobe bug (Was: Re: WARNING: CPU: 3 PID: 261 at
 kernel/bpf/memalloc.c:342)
In-Reply-To: <ZOpAjkTtA4jYtuIa@nam-dell>
References: <87jztjmmy4.fsf@all.your.base.are.belong.to.us>
 <87v8d19aun.fsf@all.your.base.are.belong.to.us>
 <ZOpAjkTtA4jYtuIa@nam-dell>
Date: Sun, 27 Aug 2023 10:11:25 +0200
Message-ID: <87cyz8sy4y.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_011130_382928_14C2A085 
X-CRM114-Status: GOOD (  30.29  )
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

TmFtLAoKTmFtIENhbyA8bmFtY2FvdkBnbWFpbC5jb20+IHdyaXRlczoKCj4gT24gU2F0LCBBdWcg
MjYsIDIwMjMgYXQgMDM6NDQ6NDhQTSArMDIwMCwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPj4gQmrD
tnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3JpdGVzOgo+PiAKPj4gPiBJJ20gY2hhc2lu
ZyBhIHdvcmtxdWV1ZSBoYW5nIG9uIFJJU0MtVi9xZW11IChUQ0cpLCB1c2luZyB0aGUgYnBmCj4+
ID4gc2VsZnRlc3RzIG9uIGJwZi1uZXh0IDllM2I0N2FiZWI4Zi4KPj4gPgo+PiA+IEknbSBhYmxl
IHRvIHJlcHJvZHVjZSB0aGUgaGFuZyBieSBtdWx0aXBsZSBydW5zIG9mOgo+PiA+ICB8IC4vdGVz
dF9wcm9ncyAtYSBsaW5rX2FwaSAtYSBsaW5rZWRfbGlzdAo+PiA+IEknbSBjdXJyZW50bHkgaW52
ZXN0aWdhdGluZyB0aGF0Lgo+PiAKPj4gK0d1byBmb3IgdXByb2JlCj4+IAo+PiBUaGlzIHdhcyBh
biBpbnRlcmVzdGluZyBidWcuIFRoZSBoYW5nIGlzIGFuIGVicmVhayAoUklTQy1WIGJyZWFrcG9p
bnQpLAo+PiB0aGF0IHB1dHMgdGhlIGtlcm5lbCBpbnRvIGFuIGluZmluaXRlIGxvb3AuCj4+IAo+
PiBUbyByZXByb2R1Y2UsIHNpbXBseSBydW4gdGhlIEJQRiBzZWxmdGVzdDoKPj4gLi90ZXN0X3By
b2dzIC12IC1hIGxpbmtfYXBpIC1hIGxpbmtlZF9saXN0Cj4+IAo+PiBGaXJzdCB0aGUgbGlua19h
cGkgdGVzdCBpcyBiZWluZyBydW4sIHdoaWNoIGV4ZXJjaXNlcyB0aGUgdXByb2JlCj4+IGZ1bmN0
aW9uYWxpdHkuIFRoZSBsaW5rX2FwaSB0ZXN0IGNvbXBsZXRlcywgYW5kIHRlc3RfcHJvZ3Mgd2ls
bCBzdGlsbAo+PiBoYXZlIHRoZSB1cHJvYmUgYWN0aXZlL2VuYWJsZWQuIE5leHQgdGhlIGxpbmtl
ZF9saXN0IHRlc3QgdHJpZ2dlcmVkIGEKPj4gV0FSTl9PTiAod2hpY2ggaXMgaW1wbGVtZW50ZWQg
dmlhIGVicmVhayBhcyB3ZWxsKS4KPj4gCj4+IE5vdywgaGFuZGxlX2JyZWFrKCkgaXMgZW50ZXJl
ZCwgYW5kIHRoZSB1cHJvYmVfYnJlYWtwb2ludF9oYW5kbGVyKCkKPj4gcmV0dXJucyB0cnVlIGV4
aXRpbmcgdGhlIGhhbmRsZV9icmVhaygpLCB3aGljaCByZXR1cm5zIHRvIHRoZSBXQVJOCj4+IGVi
cmVhaywgYW5kIHdlIGhhdmUgbWVycnktZ28tcm91bmQuCj4+IAo+PiBMdWNreSBmb3IgdGhlIFJJ
U0MtViBmb2xrcywgdGhlIEJQRiBtZW1vcnkgaGFuZGxlciBoYWQgYSBXQVJOIHRoYXQKPj4gc3Vy
ZmFjZWQgdGhlIGJ1ZyEgOy0pCj4KPiBUaGFua3MgZm9yIHRoZSBhbmFseXNpcy4KPgo+IEkgY291
bGRuJ3QgcmVwcm9kdWNlIHRoZSBwcm9ibGVtLCBzbyBJIGFtIGp1c3QgdGFraW5nIGEgZ3Vlc3Mg
aGVyZS4gVGhlIHByb2JsZW0KPiBpcyBiZWJjYXVzZSB1cHJvYmVzIGRpZG4ndCBmaW5kIGEgcHJv
YmUgcG9pbnQgYXQgdGhhdCBlYnJlYWsgaW5zdHJ1Y3Rpb24uIEhvd2V2ZXIsCj4gaXQgYWxzbyBk
b2Vzbid0IHRoaW5rIGEgZWJyZWFrIGluc3RydWN0aW9uIGlzIHRoZXJlLCB0aGVuIGl0IGdvdCBj
b25mdXNlZCBhbmQganVzdAo+IHJldHVybiBiYWNrIHRvIHRoZSBlYnJlYWsgaW5zdHJ1Y3Rpb24s
IHRoZW4gZXZlcnl0aGluZyByZXBlYXRzLgo+Cj4gVGhlIHJlYXNvbiB3aHkgdXByb2JlcyBkaWRu
J3QgdGhpbmsgdGhlcmUgaXMgYSBlYnJlYWsgaW5zdHJ1Y3Rpb24gaXMgYmVjYXVzZQo+IGlzX3Ry
YXBfaW5zbigpIG9ubHkgcmV0dXJucyB0cnVlIGlmIGl0IGlzIGEgMzItYml0IGVicmVhaywgb3Ig
MTYtYml0IGMuZWJyZWFrIGlmCj4gQyBleHRlbnNpb24gaXMgYXZhaWxhYmxlLCBub3QgYm90aC4g
U28gYSAzMi1iaXQgZWJyZWFrIGlzIG5vdCBjb3JyZWN0bHkgcmVjb2duaXplZAo+IGFzIGEgdHJh
cCBpbnN0cnVjdGlvbi4KPgo+IElmIG15IGd1ZXNzIGlzIGNvcnJlY3QsIHRoZSBmb2xsb3dpbmcg
c2hvdWxkIGZpeCBpdC4gQ2FuIHlvdSBwbGVhc2UgdHJ5IGlmIGl0IHdvcmtzPwo+Cj4gKHRoaXMg
aXMgdGhlIGZpcnN0IHRpbWUgSSBzZW5kIGEgcGF0Y2ggdGhpcyB3YXksIHNvIHBsZWFzZSBsZXQg
bWUga25vdyBpZiB5b3UgY2FuJ3QgYXBwbHkpCj4KPiBCZXN0IHJlZ2FyZHMsCj4gTmFtCj4KPiAt
LS0KPiAgYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYyB8IDEwICsrKysrKysrKysK
PiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L3Vwcm9iZXMuYwo+IGluZGV4IDE5NGYxNjZiMmNjNC4uOTFmNGNlMTAxY2QxIDEwMDY0NAo+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMKPiArKysgYi9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4gQEAgLTMsNiArMyw3IEBACj4gICNpbmNsdWRlIDxs
aW51eC9oaWdobWVtLmg+Cj4gICNpbmNsdWRlIDxsaW51eC9wdHJhY2UuaD4KPiAgI2luY2x1ZGUg
PGxpbnV4L3Vwcm9iZXMuaD4KPiArI2luY2x1ZGUgPGFzbS9pbnNuLmg+Cj4gIAo+ICAjaW5jbHVk
ZSAiZGVjb2RlLWluc24uaCIKPiAgCj4gQEAgLTE3LDYgKzE4LDE1IEBAIGJvb2wgaXNfc3dicF9p
bnNuKHVwcm9iZV9vcGNvZGVfdCAqaW5zbikKPiAgI2VuZGlmCj4gIH0KPiAgCj4gK2Jvb2wgaXNf
dHJhcF9pbnNuKHVwcm9iZV9vcGNvZGVfdCAqaW5zbikKPiArewo+ICsjaWZkZWYgQ09ORklHX1JJ
U0NWX0lTQV9DCj4gKwlpZiAocmlzY3ZfaW5zbl9pc19jX2VicmVhaygqaW5zbikpCj4gKwkJcmV0
dXJuIHRydWU7Cj4gKyNlbmRpZgo+ICsJcmV0dXJuIHJpc2N2X2luc25faXNfZWJyZWFrKCppbnNu
KTsKPiArfQo+ICsKPiAgdW5zaWduZWQgbG9uZyB1cHJvYmVfZ2V0X3N3YnBfYWRkcihzdHJ1Y3Qg
cHRfcmVncyAqcmVncykKPiAgewo+ICAJcmV0dXJuIGluc3RydWN0aW9uX3BvaW50ZXIocmVncyk7
Cj4gLS0gCj4gMi4zNC4xCgpUaGUgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbiBvZiBpc190cmFwX2lu
c24oKSB3aGljaCBSSVNDLVYgaXMgdXNpbmcgY2FsbHMKaXNfc3dicF9pbnNuKCksIHdoaWNoIGlz
IGRvaW5nIHdoYXQgeW91ciBwYXRjaCBkb2VzLiBZb3VyIHBhdGNoIGRvZXMgbm90CmFkZHJlc3Mg
dGhlIGlzc3VlLgoKV2UncmUgdGFraW5nIGFuIGVicmVhayB0cmFwIGZyb20ga2VybmVsIHNwYWNl
LiBJbiB0aGlzIGNhc2Ugd2Ugc2hvdWxkCm5ldmVyIGxvb2sgZm9yIGEgdXNlcmxhbmQgKHVwcm9i
ZSkgaGFuZGxlciBhdCBhbGwsIG9ubHkgdGhlIGtwcm9iZQpoYW5kbGVycyBzaG91bGQgYmUgY29u
c2lkZXJlZC4KCkluIHRoaXMgY2FzZSwgdGhlIFRJRl9VUFJPQkUgaXMgaW5jb3JyZWN0bHkgc2V0
LCBhbmQgaW5jb3JyZWN0bHkgKG5vdCkKaGFuZGxlZCBpbiB0aGUgImNvbW1vbiBlbnRyeSIgZXhp
dCBwYXRoLCB3aGljaCB0YWtlcyB1cyB0byB0aGUgaW5maW5pdGUKbG9vcC4KCgpCasO2cm4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
