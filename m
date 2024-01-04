Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB5A6C47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 15:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5WjbFZ3CCpI04Pnf7x53lB2+0YNtzXhuskxgieYO8zU=; b=rZ9RTIt8f+RATr
	HyrhiUDOSBM+O+KMGQQiWekTxktwSsfrMOpFUjBYr1iz9v5Klm3qore0XjaISycIxN+nSW0ZCBVVV
	8eQALvsFILpCbRTDUiDCvoJh/h040sqRYO0GkjrVZk9qwAEBz/P6aT1UdZdh9x1C73kmVTNINkAJa
	1YZG0QKLlqGp0eYaqtXa/0+plfgxLzFof/mFvTdFYZJeZXshHlRfmHkKekbK1FCB8PP+8fqBm6XTp
	MHNVAPuDphL9OyyFX8pz5mljsCnwU/P87bTRsVbHWTji9+Z/6zTX/SPVPyGETRgby0CW8CwQ0uPF3
	D2wEOlJlqn4hX6Ed3WGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPrx-00EXI8-3A;
	Thu, 04 Jan 2024 15:42:53 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLPrv-00EXH2-1Y
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 15:42:53 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-7b7fdde8b98so23876639f.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 07:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1704382970; x=1704987770; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bCy1i3Gb1NX5g0K1r9bUje/jgcenFppGeFwkwujTXi4=;
        b=dQuecAm87id6hF9dBD1atOsE/H7cgqNop3hJHfAdJ2tldfIHY5PQ3TU8zjS1y52mqH
         31c6FVgt4ujSv88DifqhPgeb5XtRGpw6q1tyv49hGok0k5ifEMC6Hhjor0MrIYMKAi9u
         1Y+Shqscti22Pd+0j3bmVOp0RL0ylXIyZVkQO394SF7mBeNFc8oOxDG7o3bm5sWHI0TK
         8A6sbaIB3j+9ySlERXL6JDzVm4b14/PzMRXcVPwaCrsUIc2/fIPKaQCJ3VDz6w9YxkDu
         G+9oa4X8eKf9BoGWkDIaScbMFUfzw3xRl5lTXV7h1W+HLok42MuS9AFTAC8CmrKB/g7g
         V/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704382970; x=1704987770;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCy1i3Gb1NX5g0K1r9bUje/jgcenFppGeFwkwujTXi4=;
        b=B2pfhNfAAqyvH2YQJ/DsZMjTq7xSpYhgf5myBEVTQl9nu5huJNvtPEmVnhVv2aGUW1
         Tak44Cn9OO20gfnIBDkS30PMl/m/ic7osWE69jDb0NYUbe8IkVuD1yWmHYOkyUsG9zkl
         DyG0e2ypb8zvOPibCF0GZgl41drAg1db5BdizrylXnckPmrlX4iwHPHtTqvY+f2S5CDu
         lq3IWAW+ngtW0J2FRptLT/C0mXagvxHsiT2EvmUOb7ysFshfb/XBdV/C5bTjAUhLxkIO
         RD5wf6Njtaef+Ix/wr01EifZ9CWYGeYgGj/2rdGEH9SWSHrEufDxNf7UhcNnTM9+GH4m
         Oebw==
X-Gm-Message-State: AOJu0YzqiBEwacf85M78LNK4cbiNY/Pvfi2wwaBkwuxOVzY6PaEKZutf
	XB93P4C4/PfdYzAPUGsWzdSSlvQuocb4CQ==
X-Google-Smtp-Source: AGHT+IGZEWXPVw7OSf05ViMeKZMnGrSiJ/PnLgklrDrsnQyuI8SeiKthsoOlG9HJPrpd9bUMwN9Ncw==
X-Received: by 2002:a05:6602:218f:b0:79f:a25b:51c with SMTP id b15-20020a056602218f00b0079fa25b051cmr795113iob.11.1704382969798;
        Thu, 04 Jan 2024 07:42:49 -0800 (PST)
Received: from ?IPV6:2605:a601:adae:4500:b86c:e734:b34:45c6? ([2605:a601:adae:4500:b86c:e734:b34:45c6])
        by smtp.gmail.com with ESMTPSA id n7-20020a05663831c700b0046ceccc798asm7764042jav.6.2024.01.04.07.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 07:42:49 -0800 (PST)
Message-ID: <057f7d38-08b7-4693-907c-b2efa6a75a22@sifive.com>
Date: Thu, 4 Jan 2024 09:42:47 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/12] riscv: mm: Introduce cntx2asid/cntx2version
 helper macros
Content-Language: en-US
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-9-samuel.holland@sifive.com>
 <CAHVXubhKrC_7DEBXR_wCP9g7-KfWg9nuyim7+X1Ja2gh8s9+HA@mail.gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <CAHVXubhKrC_7DEBXR_wCP9g7-KfWg9nuyim7+X1Ja2gh8s9+HA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_074251_521715_F3C85580 
X-CRM114-Status: GOOD (  22.18  )
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

SGkgQWxleCwKCk9uIDIwMjQtMDEtMDQgNjozOSBBTSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+
IE9uIFR1ZSwgSmFuIDIsIDIwMjQgYXQgMTE6MDHigK9QTSBTYW11ZWwgSG9sbGFuZAo+IDxzYW11
ZWwuaG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPj4KPj4gV2hlbiB1c2luZyB0aGUgQVNJRCBh
bGxvY2F0b3IsIHRoZSBNTSBjb250ZXh0IElEIGNvbnRhaW5zIHR3byB2YWx1ZXM6Cj4+IHRoZSBB
U0lEIGluIHRoZSBsb3dlciBiaXRzLCBhbmQgdGhlIGFsbG9jYXRvciB2ZXJzaW9uIG51bWJlciBp
biB0aGUKPj4gcmVtYWluaW5nIGJpdHMuIFVzZSBtYWNyb3MgdG8gbWFrZSB0aGlzIHNlcGFyYXRp
b24gbW9yZSBvYnZpb3VzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2Ft
dWVsLmhvbGxhbmRAc2lmaXZlLmNvbT4KPj4gLS0tCj4+Cj4+IChubyBjaGFuZ2VzIHNpbmNlIHYx
KQo+Pgo+PiAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXUuaCB8ICAzICsrKwo+PiAgYXJjaC9y
aXNjdi9tbS9jb250ZXh0LmMgICAgICB8IDEyICsrKysrKy0tLS0tLQo+PiAgYXJjaC9yaXNjdi9t
bS90bGJmbHVzaC5jICAgICB8ICAyICstCj4+ICAzIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL21tdS5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9tbXUuaAo+PiBpbmRleCAzNTU1
MDRiMzdmOGUuLmE1NTBmYmY3NzBiZSAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS9tbXUuaAo+PiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdS5oCj4+IEBAIC0y
Niw2ICsyNiw5IEBAIHR5cGVkZWYgc3RydWN0IHsKPj4gICNlbmRpZgo+PiAgfSBtbV9jb250ZXh0
X3Q7Cj4+Cj4+ICsjZGVmaW5lIGNudHgyYXNpZChjbnR4KSAgICAgICAgICAgICAgICAoKGNudHgp
ICYgYXNpZF9tYXNrKQo+PiArI2RlZmluZSBjbnR4MnZlcnNpb24oY250eCkgICAgICgoY250eCkg
JiB+YXNpZF9tYXNrKQo+IAo+IE5vdCBhIGJpZyBmYW4gb2YgdGhlIG5hbWluZywgSSB3b3VsZCBo
YXZlIHNvbWV0aGluZyBsaWtlCj4gZ2V0X2FzaWRfZnJvbV9jb250ZXh0KCkgYW5kIGdldF92ZXJz
aW9uX2Zyb21fY29udGV4dCgpIG9yIHNvbWV0aGluZwo+IGxpa2UgdGhhdCwgYnV0IHVwIHRvIHlv
dSBvZiBjb3Vyc2UuCgpUaGFua3MgZm9yIHRoZSByZXZpZXcuIEknbSBub3QgcmVhbGx5IGEgZmFu
IG9mIGl0IGVpdGhlciwgYnV0IEkgdHJpZWQgdG8gbWF0Y2gKcHJlY2VkZW50IGZyb20gb3RoZXIg
YXJjaGl0ZWN0dXJlcy4gVGhlc2UgbG9vc2VseSBmb2xsb3cgdGhlIG5hbWluZyBvZgpjdHhpZDJh
c2lkKCkgZnJvbSBhcm02NCBhbmQgaWR4MmFzaWQoKSBmcm9tIGNza3kuIGFybSB1c2VzIEFTSUQo
KS4KClJlZ2FyZHMsClNhbXVlbAoKPj4gKwo+PiAgdm9pZCBfX2luaXQgY3JlYXRlX3BnZF9tYXBw
aW5nKHBnZF90ICpwZ2RwLCB1aW50cHRyX3QgdmEsIHBoeXNfYWRkcl90IHBhLAo+PiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgcGh5c19hZGRyX3Qgc3osIHBncHJvdF90IHByb3QpOwo+
PiAgI2VuZGlmIC8qIF9fQVNTRU1CTFlfXyAqLwo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9t
bS9jb250ZXh0LmMgYi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+PiBpbmRleCAyMTdmZDRkZTYx
MzQuLjQzZDAwNWY2MzI1MyAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMK
Pj4gKysrIGIvYXJjaC9yaXNjdi9tbS9jb250ZXh0LmMKPj4gQEAgLTgxLDcgKzgxLDcgQEAgc3Rh
dGljIHZvaWQgX19mbHVzaF9jb250ZXh0KHZvaWQpCj4+ICAgICAgICAgICAgICAgICBpZiAoY250
eCA9PSAwKQo+PiAgICAgICAgICAgICAgICAgICAgICAgICBjbnR4ID0gcGVyX2NwdShyZXNlcnZl
ZF9jb250ZXh0LCBpKTsKPj4KPj4gLSAgICAgICAgICAgICAgIF9fc2V0X2JpdChjbnR4ICYgYXNp
ZF9tYXNrLCBjb250ZXh0X2FzaWRfbWFwKTsKPj4gKyAgICAgICAgICAgICAgIF9fc2V0X2JpdChj
bnR4MmFzaWQoY250eCksIGNvbnRleHRfYXNpZF9tYXApOwo+PiAgICAgICAgICAgICAgICAgcGVy
X2NwdShyZXNlcnZlZF9jb250ZXh0LCBpKSA9IGNudHg7Cj4+ICAgICAgICAgfQo+Pgo+PiBAQCAt
MTAyLDcgKzEwMiw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fbmV3X2NvbnRleHQoc3RydWN0
IG1tX3N0cnVjdCAqbW0pCj4+ICAgICAgICAgbG9ja2RlcF9hc3NlcnRfaGVsZCgmY29udGV4dF9s
b2NrKTsKPj4KPj4gICAgICAgICBpZiAoY250eCAhPSAwKSB7Cj4+IC0gICAgICAgICAgICAgICB1
bnNpZ25lZCBsb25nIG5ld2NudHggPSB2ZXIgfCAoY250eCAmIGFzaWRfbWFzayk7Cj4+ICsgICAg
ICAgICAgICAgICB1bnNpZ25lZCBsb25nIG5ld2NudHggPSB2ZXIgfCBjbnR4MmFzaWQoY250eCk7
Cj4+Cj4+ICAgICAgICAgICAgICAgICAvKgo+PiAgICAgICAgICAgICAgICAgICogSWYgb3VyIGN1
cnJlbnQgQ09OVEVYVCB3YXMgYWN0aXZlIGR1cmluZyBhIHJvbGxvdmVyLCB3ZQo+PiBAQCAtMTE1
LDcgKzExNSw3IEBAIHN0YXRpYyB1bnNpZ25lZCBsb25nIF9fbmV3X2NvbnRleHQoc3RydWN0IG1t
X3N0cnVjdCAqbW0pCj4+ICAgICAgICAgICAgICAgICAgKiBXZSBoYWQgYSB2YWxpZCBDT05URVhU
IGluIGEgcHJldmlvdXMgbGlmZSwgc28gdHJ5IHRvCj4+ICAgICAgICAgICAgICAgICAgKiByZS11
c2UgaXQgaWYgcG9zc2libGUuCj4+ICAgICAgICAgICAgICAgICAgKi8KPj4gLSAgICAgICAgICAg
ICAgIGlmICghX190ZXN0X2FuZF9zZXRfYml0KGNudHggJiBhc2lkX21hc2ssIGNvbnRleHRfYXNp
ZF9tYXApKQo+PiArICAgICAgICAgICAgICAgaWYgKCFfX3Rlc3RfYW5kX3NldF9iaXQoY250eDJh
c2lkKGNudHgpLCBjb250ZXh0X2FzaWRfbWFwKSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAg
cmV0dXJuIG5ld2NudHg7Cj4+ICAgICAgICAgfQo+Pgo+PiBAQCAtMTY4LDcgKzE2OCw3IEBAIHN0
YXRpYyB2b2lkIHNldF9tbV9hc2lkKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLCB1bnNpZ25lZCBpbnQg
Y3B1KQo+PiAgICAgICAgICAqLwo+PiAgICAgICAgIG9sZF9hY3RpdmVfY250eCA9IGF0b21pY19s
b25nX3JlYWQoJnBlcl9jcHUoYWN0aXZlX2NvbnRleHQsIGNwdSkpOwo+PiAgICAgICAgIGlmIChv
bGRfYWN0aXZlX2NudHggJiYKPj4gLSAgICAgICAgICAgKChjbnR4ICYgfmFzaWRfbWFzaykgPT0g
YXRvbWljX2xvbmdfcmVhZCgmY3VycmVudF92ZXJzaW9uKSkgJiYKPj4gKyAgICAgICAgICAgKGNu
dHgydmVyc2lvbihjbnR4KSA9PSBhdG9taWNfbG9uZ19yZWFkKCZjdXJyZW50X3ZlcnNpb24pKSAm
Jgo+PiAgICAgICAgICAgICBhdG9taWNfbG9uZ19jbXB4Y2hnX3JlbGF4ZWQoJnBlcl9jcHUoYWN0
aXZlX2NvbnRleHQsIGNwdSksCj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBvbGRfYWN0aXZlX2NudHgsIGNudHgpKQo+PiAgICAgICAgICAgICAgICAgZ290byBzd2l0
Y2hfbW1fZmFzdDsKPj4gQEAgLTE3Nyw3ICsxNzcsNyBAQCBzdGF0aWMgdm9pZCBzZXRfbW1fYXNp
ZChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQgaW50IGNwdSkKPj4KPj4gICAgICAgICAv
KiBDaGVjayB0aGF0IG91ciBBU0lEIGJlbG9uZ3MgdG8gdGhlIGN1cnJlbnRfdmVyc2lvbi4gKi8K
Pj4gICAgICAgICBjbnR4ID0gYXRvbWljX2xvbmdfcmVhZCgmbW0tPmNvbnRleHQuaWQpOwo+PiAt
ICAgICAgIGlmICgoY250eCAmIH5hc2lkX21hc2spICE9IGF0b21pY19sb25nX3JlYWQoJmN1cnJl
bnRfdmVyc2lvbikpIHsKPj4gKyAgICAgICBpZiAoY250eDJ2ZXJzaW9uKGNudHgpICE9IGF0b21p
Y19sb25nX3JlYWQoJmN1cnJlbnRfdmVyc2lvbikpIHsKPj4gICAgICAgICAgICAgICAgIGNudHgg
PSBfX25ld19jb250ZXh0KG1tKTsKPj4gICAgICAgICAgICAgICAgIGF0b21pY19sb25nX3NldCgm
bW0tPmNvbnRleHQuaWQsIGNudHgpOwo+PiAgICAgICAgIH0KPj4gQEAgLTE5MSw3ICsxOTEsNyBA
QCBzdGF0aWMgdm9pZCBzZXRfbW1fYXNpZChzdHJ1Y3QgbW1fc3RydWN0ICptbSwgdW5zaWduZWQg
aW50IGNwdSkKPj4KPj4gIHN3aXRjaF9tbV9mYXN0Ogo+PiAgICAgICAgIGNzcl93cml0ZShDU1Jf
U0FUUCwgdmlydF90b19wZm4obW0tPnBnZCkgfAo+PiAtICAgICAgICAgICAgICAgICAoKGNudHgg
JiBhc2lkX21hc2spIDw8IFNBVFBfQVNJRF9TSElGVCkgfAo+PiArICAgICAgICAgICAgICAgICAo
Y250eDJhc2lkKGNudHgpIDw8IFNBVFBfQVNJRF9TSElGVCkgfAo+PiAgICAgICAgICAgICAgICAg
ICBzYXRwX21vZGUpOwo+Pgo+PiAgICAgICAgIGlmIChuZWVkX2ZsdXNoX3RsYikKPj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2gu
Ywo+PiBpbmRleCA3NmIyNGQ0ZWQ0YWIuLjVlYzYyMTU0NWM2OSAxMDA2NDQKPj4gLS0tIGEvYXJj
aC9yaXNjdi9tbS90bGJmbHVzaC5jCj4+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+
PiBAQCAtODUsNyArODUsNyBAQCBzdGF0aWMgdm9pZCBfX2ZsdXNoX3RsYl9yYW5nZShzdHJ1Y3Qg
bW1fc3RydWN0ICptbSwgdW5zaWduZWQgbG9uZyBzdGFydCwKPj4gICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+Pgo+PiAgICAgICAgICAgICAgICAgaWYgKHN0YXRpY19icmFuY2hfdW5s
aWtlbHkoJnVzZV9hc2lkX2FsbG9jYXRvcikpCj4+IC0gICAgICAgICAgICAgICAgICAgICAgIGFz
aWQgPSBhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkgJiBhc2lkX21hc2s7Cj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGFzaWQgPSBjbnR4MmFzaWQoYXRvbWljX2xvbmdfcmVhZCgm
bW0tPmNvbnRleHQuaWQpKTsKPj4gICAgICAgICB9IGVsc2Ugewo+PiAgICAgICAgICAgICAgICAg
Y21hc2sgPSBjcHVfb25saW5lX21hc2s7Cj4+ICAgICAgICAgfQo+PiAtLQo+PiAyLjQyLjAKPj4K
PiAKPiBZb3UgY2FuIGFkZDoKPiAKPiBSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRpIDxhbGV4
Z2hpdGlAcml2b3NpbmMuY29tPgo+IAo+IFRoYW5rcywKPiAKPiBBbGV4CgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
