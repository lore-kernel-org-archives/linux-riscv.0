Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84AFCC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Dec 2023 03:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5IZmnPgXQ/c3YgULBCMQwv3tIT1ABT2I9Id1UefBQDk=; b=hKHSV3RiQmqcrQ
	+vVozc50ejDm7iMeBKtkRhQyJe9GLSmUqhHhp7HSUj+WSrEK2uKhA4sZpIQE0msjmCvlvKE7e7Jsv
	dQqHKif34iJYha7XLwTuGss35l9kyQCUsQ3VdZDgYR5DPtlyaei5Uabi8lYxjMFFgilVMuZdWUIck
	+Z5HKeOPNMhvkz3TJpPcVCenvX0QJxiMtBOeKPqfbpVGeeU7tz9IIB7zf679BQnhTqjrxaO/Di7U9
	UJEy8BblkBzLb+Ck30nybAG3qjgWC1s+jVldT4tJVW8NlABAAEbhh87cHj0kX9SmPkigFKk0pS/Mm
	EOXs40l+iaVPjZtFBTnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsMf-007FhQ-0K;
	Sat, 23 Dec 2023 03:07:49 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGsMb-007Ffe-2r
	for linux-riscv@lists.infradead.org;
	Sat, 23 Dec 2023 03:07:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 7DE2CB824B8
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 03:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D23DCC43391
	for <linux-riscv@lists.infradead.org>; Sat, 23 Dec 2023 03:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703300861;
	bh=kZedLaa16kwTEyFxJs+q6Gr9GjNmSh1HuJCb7sl/NTs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=uYV75HBsOfO/d3tsP14QnJ41zHZbL+lOfttKwgKmrJWBio3nQhlj8wVDZbOELE9HM
	 E/QyQeltlfwQ/kr6LlXXmxfali8U0hb/2y2GcAjC8yMAszF3qaG+WQlJSYSbU3QZ+Z
	 bhLRxrRHObuW+JwcMWg+oMyQwrHFvUuspCae3K/bJSVutEtG7YkvYM8yGQ33cileUa
	 WKuJr6lePPCY3fzkzO0TbmNDhjTeij7792LrUkXMJR+GOWze1RvNaFMNrGVFaIsvTE
	 hmzIdLLU0/kfIzWel1RWts//Xgc1fr6ZCt4Goc/fplAjCek3G24Hs8cyPTJ2Yd9L5V
	 Tr4UcZaXipefA==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a236d77dceeso285142966b.2
        for <linux-riscv@lists.infradead.org>; Fri, 22 Dec 2023 19:07:41 -0800 (PST)
X-Gm-Message-State: AOJu0YzspUdRfGqqdjkcIc5NAQeswaAz6AO3QUs33Jw9CrcqDY+yidy1
	CBSSkjUTCZky5GSQvvh7dUVeB9aUPTQze9bBwwc=
X-Google-Smtp-Source: AGHT+IFtb17ydeBiPuJbAjCzuvD7pJhi1ywoe1Fs8tNlKXIs9PlRdzxw9WzQS3h3TxK0p8IQwe0Lhud5AkJP0oaCeMY=
X-Received: by 2002:a17:906:714d:b0:a26:92be:4592 with SMTP id
 z13-20020a170906714d00b00a2692be4592mr801420ejj.162.1703300860215; Fri, 22
 Dec 2023 19:07:40 -0800 (PST)
MIME-Version: 1.0
References: <20231222115703.2404036-1-guoren@kernel.org> <20231222115703.2404036-2-guoren@kernel.org>
 <ZYZMsgL9Bcz1J_Bd@LeoBras>
In-Reply-To: <ZYZMsgL9Bcz1J_Bd@LeoBras>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 23 Dec 2023 11:07:29 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR7VvHhm4QUpEkk8P=b__HqbXZ7ggW9DvkD1fUpoKPTew@mail.gmail.com>
Message-ID: <CAJF2gTR7VvHhm4QUpEkk8P=b__HqbXZ7ggW9DvkD1fUpoKPTew@mail.gmail.com>
Subject: Re: [PATCH V3 1/4] riscv: mm: Fixup compat mode boot failure
To: Leonardo Bras <leobras@redhat.com>, charlie@rivosinc.com
Cc: linux-kernel@vger.kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	alexghiti@rivosinc.com, xiao.w.wang@intel.com, david@redhat.com, 
	panqinglin2020@iscas.ac.cn, rick.p.edgecombe@intel.com, willy@infradead.org, 
	bjorn@rivosinc.com, conor.dooley@microchip.com, cleger@rivosinc.com, 
	linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, 
	stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_190746_202495_A210D1E6 
X-CRM114-Status: GOOD (  24.99  )
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

T24gU2F0LCBEZWMgMjMsIDIwMjMgYXQgMTA6NTjigK9BTSBMZW9uYXJkbyBCcmFzIDxsZW9icmFz
QHJlZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBEZWMgMjIsIDIwMjMgYXQgMDY6NTc6MDBB
TSAtMDUwMCwgZ3VvcmVuQGtlcm5lbC5vcmcgd3JvdGU6Cj4gPiBGcm9tOiBHdW8gUmVuIDxndW9y
ZW5AbGludXguYWxpYmFiYS5jb20+Cj4gPgo+ID4gSW4gQ09NUEFUIG1vZGUsIHRoZSBTVEFDS19U
T1AgaXMgREVGQVVMVF9NQVBfV0lORE9XICgweDgwMDAwMDAwKSwgYnV0Cj4gPiB0aGUgVEFTS19T
SVpFIGlzIDB4N2ZmZjAwMC4gV2hlbiB0aGUgdXNlciBzdGFjayBpcyB1cG9uIDB4N2ZmZjAwMCwg
aXQKPiA+IHdpbGwgY2F1c2UgYSB1c2VyIHNlZ21lbnQgZmF1bHQuIFNvbWV0aW1lcywgaXQgd291
bGQgY2F1c2UgYm9vdAo+ID4gZmFpbHVyZSB3aGVuIHRoZSB3aG9sZSByb290ZnMgaXMgcnYzMi4K
PiA+Cj4gPiBGcmVlaW5nIHVudXNlZCBrZXJuZWwgaW1hZ2UgKGluaXRtZW0pIG1lbW9yeTogMjIz
NksKPiA+IFJ1biAvc2Jpbi9pbml0IGFzIGluaXQgcHJvY2Vzcwo+ID4gU3RhcnRpbmcgaW5pdDog
L3NiaW4vaW5pdCBleGlzdHMgYnV0IGNvdWxkbid0IGV4ZWN1dGUgaXQgKGVycm9yIC0xNCkKPiA+
IFJ1biAvZXRjL2luaXQgYXMgaW5pdCBwcm9jZXNzCj4gPiAuLi4KPiA+Cj4gPiBJbmNyZWFzZSB0
aGUgVEFTS19TSVpFIHRvIGNvdmVyIFNUQUNLX1RPUC4KPiA+Cj4gPiBDYzogc3RhYmxlQHZnZXIu
a2VybmVsLm9yZwo+ID4gRml4ZXM6IGFkZDJjYzZiNjUxNSAoIlJJU0MtVjogbW06IFJlc3RyaWN0
IGFkZHJlc3Mgc3BhY2UgZm9yIHN2Mzksc3Y0OCxzdjU3IikKPiA+IFNpZ25lZC1vZmYtYnk6IEd1
byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJhLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wZ3RhYmxlLmggfCAyICstCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20v
cGd0YWJsZS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wZ3RhYmxlLmgKPiA+IGluZGV4IGFi
MDAyMzViMDE4Zi4uNzRmZmIyMTc4ZjU0IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS9wZ3RhYmxlLmgKPiA+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcGd0YWJs
ZS5oCj4gPiBAQCAtODgxLDcgKzg4MSw3IEBAIHN0YXRpYyBpbmxpbmUgcHRlX3QgcHRlX3N3cF9j
bGVhcl9leGNsdXNpdmUocHRlX3QgcHRlKQo+ID4gICNkZWZpbmUgVEFTS19TSVpFX01JTiAgICAg
ICAgKFBHRElSX1NJWkVfTDMgKiBQVFJTX1BFUl9QR0QgLyAyKQo+ID4KPiA+ICAjaWZkZWYgQ09O
RklHX0NPTVBBVAo+ID4gLSNkZWZpbmUgVEFTS19TSVpFXzMyIChfQUMoMHg4MDAwMDAwMCwgVUwp
IC0gUEFHRV9TSVpFKQo+ID4gKyNkZWZpbmUgVEFTS19TSVpFXzMyIChfQUMoMHg4MDAwMDAwMCwg
VUwpKQo+ID4gICNkZWZpbmUgVEFTS19TSVpFICAgICh0ZXN0X3RocmVhZF9mbGFnKFRJRl8zMkJJ
VCkgPyBcCj4gPiAgICAgICAgICAgICAgICAgICAgICAgIFRBU0tfU0laRV8zMiA6IFRBU0tfU0la
RV82NCkKPiA+ICAjZWxzZQo+ID4gLS0KPiA+IDIuNDAuMQo+ID4KPgo+IEkgYW0gbm90IHJlYWxs
eSBpbnZvbHZlZCBpbiB0aGUgaXNzdWUgdGhpcyBpcyBzb2x2aW5nLCBzbyBJIGhhdmUgbm8KPiB0
ZWNobmljYWwgb3BpbmlvbiBvbiB0aGUgc29sdXRpb24uCj4KPiBJSVVDIHRoZXJlIHNob3VsZCBh
bHdheXMgYmUgKFRBU0tfU0laRSA+PSBTVEFDS19UT1ApLCBzbyBieSBpdHNlbGYgdGhpcwo+IGlz
IGZpeGluZyBhbiBpc3N1ZS4KPgo+IEkgaGF2ZSByZXZpZXdlZCB0aGUgY29kZSBhbmQgaXQgZG9l
cyBleGFjdGx5IGFzIHN0YXRlZCBpbnRvIHRoZSBjb21taXQKPiBtZXNzYWdlLCBzbyBGV0lXOgo+
IFJldmlld2VkLWJ5OiBMZW9uYXJkbyBCcmFzIDxsZW9icmFzQHJlZGhhdC5jb20+ClRoeCwKCkkg
Zm91bmQgdGhpcyBwcm9ibGVtIGJlY2F1c2UgaXQgY2FuJ3QgYm9vdCBteSBydjMyIGJ1aWxkcm9v
dC1yb290ZnMgaW4KdjYuNi4gQnV0IGl0J3Mgb2theSBpbiB2Ni41LiBTbyBJIHVzZWQgZ2l0IGJp
c2VjdCBhbmQgZm91bmQgY29tbWl0OgphZGQyY2M2YjY1MTUgKCJSSVNDLVY6IG1tOiBSZXN0cmlj
dCBhZGRyZXNzIHNwYWNlIGZvcgpzdjM5LHN2NDgsc3Y1NyIpLCB3aGljaCBjYXVzZWQgdGhhdC4K
ClBpbmcgQ2hhcmxpZSwgSSBob3BlIGl0IGNhbiBiZSBmaXhlZCBpbiB0aGUgdjYuNiBsb25nLXRl
cm0gdmVyc2lvbi4KCj4KCgoKLS0KQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
