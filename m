Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 409B3CC6B1A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Oct 2026 08:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qfe01UtnEYUXvgHaKLNNxUwJmhibJRE+3JE3Quu/8pc=; b=vtb9yqGHJdSanP
	llYZMFbeN6xIxsszOC5Cod3rxuZczdIcuRSfjAxD+JUHB34Yz8WFVEvweeV6/nsLUEHNRIBd8UsKw
	zPQ797b+Ea0Y0I2Bb0xIx2M4xZ5gTt/Z7cL8hLryYDoY4hTUNYuUCFlVTd55oGL+tCCz0Q9XQCq4A
	6ZTQbSBRTf30kWI8izs8DgKM/1ox9X838dpLrMdcpDXIGvAIttsxyit1vg5xV3vegSmIlZbDCFwa3
	4bWhGayRSNNX2YD6pl7jczs7e+HiY4qV4lZ4JE/X7n/xYn3N+/vThUC5YbWkalKsDifwvTOcQ5wZQ
	9WUvDMhtywgvUzh12bfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGueT-0000000EwNY-3GZJ;
	Wed, 14 Oct 2026 08:47:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGueS-0000000EwNQ-0LUp
	for linux-riscv@lists.infradead.org;
	Wed, 14 Oct 2026 08:47:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 74D56433ED
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 08:47:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D3B21F0089B
	for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 08:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791967675;
	bh=7ZOwtKbzSs5jhvicAd0kCF0YNh/oXG040bjobslvnUY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iuUFTKdmNflpr2zGOcgLRI6af5tKNsgVJnfvOfoTt/My0qyWK9/roCDtSQdUhsqcc
	 QJ1Dmn98mCMHN+LOhK9n3KQ+HqSEBQg/pzA9fKPLNorZdjTEBuPN2UIPEYH68Sh9dR
	 LJM0voMhZjoeiueNyArXId7bTmYr7xpOvDBINJ52SoViHkyV2ErwBZncLOyXIfSFEn
	 Y/FTJ2fsy8691AQ2hkCBgdq+PBGLpUEx1TTIZozLRZ6GdaN9jZdl1I9cF6CTg+v/9F
	 HLMrvauKdtQvE49XJdiuWCuSA7nRZLxSugkCOm3gecnaoHilXmRzMvSaDwBWdTHNYQ
	 LP6dwbkrLoqZQ==
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a020e65269so24845775e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 14 Oct 2026 01:47:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBx5FbVlxYbmUsM8Ow+VtgXH9Cq8WBYmsJHpt1it27G556YmMpfEIF0zWvXClyUa9ONAL4ov7nlgvBo+aA==@lists.infradead.org
X-Gm-Message-State: AFq9FYIr3OKiC+pC2OGYwjQDYqI98YRcJy3QIFdHBlDm0x7dtIQQ71XI
	bv//nuklSNy+wQmel5OAVFelwxaVJxqAElCfEnlNj/yT8S8Bj1ud21Dd5U7kpfXoxrnBcTGYXLI
	OfNSV/gfQwlyvhByedJN35m5k4HWtGOU=
X-Received: by 2002:a05:600c:190b:b0:4a1:82cc:1e9a with SMTP id
 5b1f17b1804b1-4a18e4b2b25mr301538815e9.17.1791967673845; Wed, 14 Oct 2026
 01:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20261012131034.1026-1-cp0613@linux.alibaba.com>
In-Reply-To: <20261012131034.1026-1-cp0613@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 14 Oct 2026 16:47:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRY+tHOHTAj0N_C1xDks91-5PtdhmrGcO9pYnQOUM_mOg@mail.gmail.com>
X-Gm-Features: AclHuK-QtzubWf2t0mbfoZoD_8_OMKg294M-GgKqr1kCkyEkHT-Mzth_q5OWNaY
Message-ID: <CAJF2gTRY+tHOHTAj0N_C1xDks91-5PtdhmrGcO9pYnQOUM_mOg@mail.gmail.com>
Subject: Re: [PATCH] riscv: Populate boot CPU topology on UP kernels
To: Chen Pei <cp0613@linux.alibaba.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	sudeep.holla@kernel.org, conor.dooley@microchip.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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

T24gTW9uLCBPY3QgMTIsIDIwMjYgYXQgOToxMeKAr1BNIENoZW4gUGVpIDxjcDA2MTNAbGludXgu
YWxpYmFiYS5jb20+IHdyb3RlOgo+Cj4gUklTQy1WIHNlbGVjdHMgR0VORVJJQ19BUkNIX1RPUE9M
T0dZIHVuY29uZGl0aW9uYWxseSwgc28gdGhlIHRvcG9sb2d5Cj4gY3B1bWFzayBhY2Nlc3NvcnMg
cmVzb2x2ZSBpbnRvIGNwdV90b3BvbG9neVtdLiBUaGUgUklTQy1WIGNhbGxzIHRvCj4gaW5pdF9j
cHVfdG9wb2xvZ3koKSBhbmQgc3RvcmVfY3B1X3RvcG9sb2d5KCkgYXJlIGluIHNtcGJvb3QuYywg
d2hpY2ggaXMKPiBvbmx5IGJ1aWx0IHdpdGggQ09ORklHX1NNUC4gT24gVVAga2VybmVscywgY3B1
X3RvcG9sb2d5W10gcmVtYWlucwo+IHplcm8taW5pdGlhbGl6ZWQgYW5kIGl0cyBzaWJsaW5nIG1h
c2tzIGFyZSBlbXB0eS4KPgo+IFRoZSBzeXNmcyB0b3BvbG9neSBpbnRlcmZhY2UgaXMgYXZhaWxh
YmxlIG9uIFVQIGtlcm5lbHMgdG9vLiBBcyBhCj4gcmVzdWx0LCBjcHUwIGV4cG9ydHMgZW1wdHkg
dGhyZWFkX3NpYmxpbmdzX2xpc3QgYW5kIGNvcmVfc2libGluZ3NfbGlzdAo+IGF0dHJpYnV0ZXMg
cmF0aGVyIHRoYW4gbWFza3MgY29udGFpbmluZyBpdHNlbGYsIHZpb2xhdGluZyB0aGUgZXhwZWN0
ZWQKPiB0b3BvbG9neSBzZW1hbnRpY3Mgb2YgdGhpcyBzdGFibGUgQUJJLgo+Cj4gSW5pdGlhbGl6
ZSBhbmQgc3RvcmUgdGhlIGJvb3QgQ1BVIHRvcG9sb2d5IGluIGEgVVAtb25seSBlYXJseSBpbml0
Y2FsbC4KPiBUaGlzIHJ1bnMgYWZ0ZXIgRFQgYW5kIEFDUEkgQ1BVIGRpc2NvdmVyeSBhbmQgYWZ0
ZXIgdGhlIG1lbW9yeSBhbGxvY2F0b3IKPiBpcyBhdmFpbGFibGUsIGJlZm9yZSB0aGUgdG9wb2xv
Z3kgaXMgZXhwb3NlZCB0aHJvdWdoIHN5c2ZzLgo+Cj4gU01QIGtlcm5lbHMgY29udGludWUgdG8g
aW5pdGlhbGl6ZSB0b3BvbG9neSBpbiBzbXBfcHJlcGFyZV9jcHVzKCkuIE5VTUEKPiBuZWVkcyBu
byBhZGRpdGlvbmFsIGhhbmRsaW5nIGJlY2F1c2UgaXQgZGVwZW5kcyBvbiBTTVAuCj4KPiBGaXhl
czogZmJkOTI4MDk5OTdhICgicmlzY3Y6IHRvcG9sb2d5OiBmaXggZGVmYXVsdCB0b3BvbG9neSBy
ZXBvcnRpbmciKQo+IFNpZ25lZC1vZmYtYnk6IENoZW4gUGVpIDxjcDA2MTNAbGludXguYWxpYmFi
YS5jb20+Cj4gLS0tCj4gVGVzdGVkIG9uIFFFTVUgdmlydCAoUlY2NCk6Cj4gLSBVUCwgZGVmYXVs
dCBEVDogY3B1MCB0aHJlYWRfc2libGluZ3NfbGlzdCwgY29yZV9jcHVzX2xpc3QsCj4gICBjb3Jl
X3NpYmxpbmdzX2xpc3QgYW5kIHBhY2thZ2VfY3B1c19saXN0IGFsbCBjb250YWluIENQVTAuCj4g
LSBVUCwgRFQgd2l0aCAzMiBLaUIgTDEgaW5zdHJ1Y3Rpb24vZGF0YSBjYWNoZXM6IHRoZSBzYW1l
IHRvcG9sb2d5Cj4gICBjaGVja3MgcGFzcywgYW5kIGJvdGggY2FjaGVzIGFwcGVhciBpbiBzeXNm
cyB3aXRoIHNoYXJlZF9jcHVfbGlzdD0wLgo+IC0gU01QLCA4IENQVXM6IGVhY2ggQ1BVJ3MgdGhy
ZWFkX3NpYmxpbmdzX2xpc3QgYW5kIGNvcmVfY3B1c19saXN0Cj4gICBjb250YWluIGl0c2VsZjsg
Y29yZV9zaWJsaW5nc19saXN0IGFuZCBwYWNrYWdlX2NwdXNfbGlzdCBhcmUgMC03Lgo+Cj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3NldHVwLmMgfCAxMiArKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9z
ZXR1cC5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2V0dXAuYwo+IGluZGV4IGQ3OWY5OWI4NjAzMy4u
MjM0ZDlhZjQxNGI3IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yva2VybmVsL3NldHVwLmMKPiAr
KysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zZXR1cC5jCj4gQEAgLTksNiArOSw3IEBACj4gICAqLwo+
Cj4gICNpbmNsdWRlIDxsaW51eC9hY3BpLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9hcmNoX3RvcG9s
b2d5Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9jcHUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2luaXQu
aD4KPiAgI2luY2x1ZGUgPGxpbnV4L21tLmg+Cj4gQEAgLTM3MCw2ICszNzEsMTcgQEAgdm9pZCBf
X2luaXQgc2V0dXBfYXJjaChjaGFyICoqY21kbGluZV9wKQo+ICAgICAgICAgcmlzY3ZfY2xlYXJf
aHlwZXJ2aXNvcl9jc3IoKTsKPiAgfQo+Cj4gKyNpZm5kZWYgQ09ORklHX1NNUAo+ICtzdGF0aWMg
aW50IF9faW5pdCByaXNjdl9pbml0X2NwdV90b3BvbG9neSh2b2lkKQo+ICt7Cj4gKyAgICAgICBp
bml0X2NwdV90b3BvbG9neSgpOwo+ICsgICAgICAgc3RvcmVfY3B1X3RvcG9sb2d5KDApOwo+ICsK
PiArICAgICAgIHJldHVybiAwOwo+ICt9Cj4gK2Vhcmx5X2luaXRjYWxsKHJpc2N2X2luaXRfY3B1
X3RvcG9sb2d5KTsKPiArI2VuZGlmCj4gKwoKR29vZCBjYXRjaC4gQWx0aG91Z2ggQ09ORklHX1NN
UCBpcyBlbmFibGVkIGJ5IGRlZmF1bHQgKGRlZmF1bHQgeSksIHdlCnNob3VsZCBzdGlsbCBzZXQg
dGhlIGNwdW1hc2sgdG8gQklUKDApLCBzbyB0aGUgY3B1bWFzayBzdGF5cyB2YWxpZApldmVuIHdo
ZW4gU01QIGlzIGRpc2FibGVkLgoKUmV2aWV3ZWQtYnk6IEdVTyBSZW4gPGd1b3JlbkBrZXJuZWwu
b3JnPgoKLS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
