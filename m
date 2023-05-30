Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A48DDC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 12:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3PGd7ShfgF6FmNd6TFRmwLL/v3iFyf1Sz9L3eENO3DU=; b=O7QtkTR3eNZvsb
	GYqT1TQv1ke2CBe5FoRfwK57SGBJcarUvFYRY7jU4kPeut+ByoON/HMwzDDnwltpP/ase0sohpnKc
	jk3zYvCyVvS6QzHcIFqSbYVbwHaO6N6kN5dqTDBuB5WWTywICVrBfjY+v6j8EdS0alCq6SNV9ctgk
	RIQpHFeHjHjfNxuIhp4GzqwtLAEbaLsHo42ky5Q4TMRZFjnKGAxak8N9aGyhBQvvfrSckPbLES8DA
	L0ILVu9+FXrush7YOhNSZqpI2ntb+jsYczt7vp95qb1tpI+mWt9V50aCeLEnsmd7xRD+2ns/D3ELZ
	c1VRpvduTssMClwjDC4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yVp-00DsPY-01;
	Tue, 30 May 2023 12:31:41 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3yVm-00DsN8-1O
	for linux-riscv@lists.infradead.org;
	Tue, 30 May 2023 12:31:39 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id C5B0121ADF;
	Tue, 30 May 2023 12:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1685449893; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4r2dKrL0esFEC4r6mNqOb67BdMVIEvOCW/VAhqjUWc=;
	b=h5MmXUfhWOwZcrwe7NZWvEHK+/tpbD3lT5ESYjsR/fIPtu0KHvMknKC6cW3VNZ5Ptrf73A
	RiUbbCXvcUxaLhr/974N3UlCeCE2fWfJkosgaAY6FY4bGoIG0EyQLRKSHjbyFGraUOfq4b
	hYmHNi5oR+WcaQkUO0odCa4BhJs352E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1685449893;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k4r2dKrL0esFEC4r6mNqOb67BdMVIEvOCW/VAhqjUWc=;
	b=ywPZow5zX5ejCdKMprk/QdgpbZJt1V+/FKo3w6H4WtoQU4el7u8hpvk/rQx1kFoRAHOfjY
	YB+M+lY49OFM8bAg==
Received: from hawking.suse.de (unknown [10.168.4.11])
	by relay2.suse.de (Postfix) with ESMTP id 528F92C141;
	Tue, 30 May 2023 12:31:33 +0000 (UTC)
Received: by hawking.suse.de (Postfix, from userid 17005)
	id 3F3164A037E; Tue, 30 May 2023 14:31:33 +0200 (CEST)
From: Andreas Schwab <schwab@suse.de>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>,  Zhangjin Wu
 <falcon@tinylab.org>,
  arnd@arndb.de,  linux-kernel@vger.kernel.org,
  linux-kselftest@vger.kernel.org,  linux-riscv@lists.infradead.org
Subject: Re: [PATCH 1/2] selftests/nolibc: add new gettimeofday test cases
In-Reply-To: <ZHXmbNg4BdJNd4cO@1wt.eu> (Willy Tarreau's message of "Tue, 30
	May 2023 14:05:00 +0200")
References: <cover.1685428087.git.falcon@tinylab.org>
	<bfc3dba52300dcce03ae1c7c41f2bb8984cf459b.1685428087.git.falcon@tinylab.org>
	<96f1134d-ce6e-4d82-ae00-1cd4038809c4@t-8ch.de>
	<ZHXmbNg4BdJNd4cO@1wt.eu>
X-Yow: I represent a sardine!!
Date: Tue, 30 May 2023 14:31:33 +0200
Message-ID: <mvmedmyatlm.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_053138_609752_730D74F5 
X-CRM114-Status: GOOD (  21.57  )
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

T24gTWFpIDMwIDIwMjMsIFdpbGx5IFRhcnJlYXUgd3JvdGU6Cgo+IE9uIFR1ZSwgTWF5IDMwLCAy
MDIzIGF0IDEyOjU5OjMxUE0gKzAyMDAsIFRob21hcyBXZWnDn3NjaHVoIHdyb3RlOgo+PiBPbiAy
MDIzLTA1LTMwIDE0OjM3OjQ5KzA4MDAsIFpoYW5namluIFd1IHdyb3RlOgo+PiA+IFRoZXNlIDMg
dGVzdCBjYXNlcyBhcmUgYWRkZWQgdG8gY292ZXIgdGhlIG5vcm1hbCB1c2luZyBzY2VuZXMgb2YK
Pj4gPiBnZXR0aW1lb2ZkYXkoKS4KPj4gPiAKPj4gPiBUaGV5IGhhdmUgYmVlbiB1c2VkIHRvIHRy
aWdnZXIgYW5kIGZpeCB1cCBzdWNoIGlzc3VlOgo+PiA+IAo+PiA+ICAgICBub2xpYmMtdGVzdC5j
OigudGV4dC5nZXR0aW1lb2ZkYXkrMHg1NCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fYWVh
YmlfbGRpdm1vZCcKPj4gPiAKPj4gPiBUaGlzIGlzc3VlIGhhcHBlbnMgd2hpbGUgdGhlcmUgaXMg
bm8gInVuc2lnbmVkIGludCIgY29udmVyc2lvbiBpbiB0aGUKPj4gPiBuZXcgY2xvY2tfZ2V0dGlt
ZSAvIGNsb2NrX2dldHRpbWU2NCBzeXNjYWxsIHBhdGggb2YgZ2V0dGltZW9mZGF5KCk6Cj4+ID4g
Cj4+ID4gICAgIHR2LT50dl91c2VjID0gdHMudHZfbnNlYyAvIDEwMDA7Cj4+ID4gCj4+ID4gU2ln
bmVkLW9mZi1ieTogWmhhbmdqaW4gV3UgPGZhbGNvbkB0aW55bGFiLm9yZz4KPj4gPiAtLS0KPj4g
PiAgdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgfCA1ICsrKysr
Cj4+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKykKPj4gPiAKPj4gPiBkaWZmIC0t
Z2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMgYi90b29s
cy90ZXN0aW5nL3NlbGZ0ZXN0cy9ub2xpYmMvbm9saWJjLXRlc3QuYwo+PiA+IGluZGV4IDhiYThj
MmZjNzFhMC4uMjBkMTg0ZGE5YTJiIDEwMDY0NAo+PiA+IC0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL25vbGliYy9ub2xpYmMtdGVzdC5jCj4+ID4gKysrIGIvdG9vbHMvdGVzdGluZy9zZWxm
dGVzdHMvbm9saWJjL25vbGliYy10ZXN0LmMKPj4gPiBAQCAtNTMzLDYgKzUzMyw4IEBAIHN0YXRp
YyBpbnQgdGVzdF9zdGF0X3RpbWVzdGFtcHModm9pZCkKPj4gPiAgICovCj4+ID4gIGludCBydW5f
c3lzY2FsbChpbnQgbWluLCBpbnQgbWF4KQo+PiA+ICB7Cj4+ID4gKwlzdHJ1Y3QgdGltZXZhbCB0
djsKPj4gPiArCXN0cnVjdCB0aW1lem9uZSB0ejsKPj4gPiAgCXN0cnVjdCBzdGF0IHN0YXRfYnVm
Owo+PiA+ICAJaW50IGV1aWQwOwo+PiA+ICAJaW50IHByb2M7Cj4+ID4gQEAgLTU4OCw2ICs1OTAs
OSBAQCBpbnQgcnVuX3N5c2NhbGwoaW50IG1pbiwgaW50IG1heCkKPj4gPiAgCQlDQVNFX1RFU1Qo
Z2V0ZGVudHM2NF9yb290KTsgICBFWFBFQ1RfU1lTTkUoMSwgdGVzdF9nZXRkZW50czY0KCIvIiks
IC0xKTsgYnJlYWs7Cj4+ID4gIAkJQ0FTRV9URVNUKGdldGRlbnRzNjRfbnVsbCk7ICAgRVhQRUNU
X1NZU0VSKDEsIHRlc3RfZ2V0ZGVudHM2NCgiL2Rldi9udWxsIiksIC0xLCBFTk9URElSKTsgYnJl
YWs7Cj4+ID4gIAkJQ0FTRV9URVNUKGdldHRpbWVvZmRheV9udWxsKTsgRVhQRUNUX1NZU1pSKDEs
IGdldHRpbWVvZmRheShOVUxMLCBOVUxMKSk7IGJyZWFrOwo+PiA+ICsJCUNBU0VfVEVTVChnZXR0
aW1lb2ZkYXlfdHYpOyAgIEVYUEVDVF9TWVNaUigxLCBnZXR0aW1lb2ZkYXkoJnR2LCBOVUxMKSk7
IGJyZWFrOwo+PiA+ICsJCUNBU0VfVEVTVChnZXR0aW1lb2ZkYXlfdHopOyAgIEVYUEVDVF9TWVNa
UigxLCBnZXR0aW1lb2ZkYXkoTlVMTCwgJnR6KSk7IGJyZWFrOwo+PiAKPj4gQ2FsbGluZyBnZXR0
aW1lb2ZkYXkoTlVMTCwgLi4uKSB3aWxsIGFjdHVhbGx5IHNlZ2ZhdWx0IG9uIGdsaWJjLgo+PiBJ
dCB3b3JrcyB3aGVuIGNhbGxpbmcgdGhyb3VnaCB0aGUgVkRTTywgYnV0IG5vdCB0aGUgbG9naWMg
aW4gZ2xpYmMKPj4gaXRzZWxmLCB3aGljaCBpcyBndWVzcyBpcyBhbGxvd2VkIGJ5IFBPU0lYLgo+
Cj4gVGhlbiB0aGF0J3Mgc2hvY2tpbmcsIGJlY2F1c2UgdGhlIG1hbiBwYWdlIHNheXM6Cj4KPiAg
ICAgICAgSWYgZWl0aGVyIHR2IG9yIHR6IGlzIE5VTEwsIHRoZSBjb3JyZXNwb25kaW5nIHN0cnVj
dHVyZSBpcyBub3QgIHNldCAgb3IKPiAgICAgICAgcmV0dXJuZWQuICAgKEhvd2V2ZXIsIGNvbXBp
bGF0aW9uIHdhcm5pbmdzIHdpbGwgcmVzdWx0IGlmIHR2IGlzIE5VTEwuKQo+Cj4gSSdkIGV4cGVj
dCBnbGliYyB0byBhdCBsZWFzdCBzdXBwb3J0IHdoYXQnZCBkb2N1bWVudGVkIGluIHRoZSBtYW4K
PiBwYWdlIDotLwoKVGhlIG1hbnVhbCBwYWdlIGlzIG5vdCBwYXJ0IG9mIGdsaWJjLiAgTmVpdGhl
ciB0aGUgZ2xpYmMgZG9jdW1lbnRhdGlvbgpub3IgdGhlIFBPU0lYIHNwZWMgaGFzIGV2ZXIgc3Vw
cG9ydGVkIE5VTEwgZm9yIHRoZSBmaXJzdCBhcmd1bWVudC4gIFRoZQpnZW5lcmljIFBPU0lYIGlt
cGxlbWVudGF0aW9uIGluIGdsaWJjIG9yaWdpbmFsbHkgcmV0dXJuZWQgRUlOVkFMIGZvcgp0aGF0
IGNhc2UsIHRob3VnaC4KCi0tIApBbmRyZWFzIFNjaHdhYiwgU1VTRSBMYWJzLCBzY2h3YWJAc3Vz
ZS5kZQpHUEcgS2V5IGZpbmdlcnByaW50ID0gMDE5NiBCQUQ4IDFDRTkgMTk3MCBGNEJFICAxNzQ4
IEU0RDQgODhFMyAwRUVBIEI5RDcKIkFuZCBub3cgZm9yIHNvbWV0aGluZyBjb21wbGV0ZWx5IGRp
ZmZlcmVudC4iCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
