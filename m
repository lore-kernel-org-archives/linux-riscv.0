Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244DBC5B572
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Aug 2026 14:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OB9G7UDkK9vrkKFEnjwm9zmngO6DEPOav6kIXgfUwj8=; b=2Zp/HLrMSW+iZH
	0varVhpewS/VoOjKr+IPtQefoKv8h2nrBO7dJ/I7Hiup7FUgmwQud/j6KkvkuzRLIwbeX4WwNAKkf
	p8Xpq2h5TRhvnxepLfAsnLZWtk7AZzKqLv5UmKZUmFzQvS/qJKQrdHoO0FUtimt4wyadPey0UTCKj
	GQwaCJJFxPpJYN1TTJ2E3s/B228oaOSYQcNnQSbSDtzyKx/bOVD/mdqRTisjORmYMFQzMtIcz6c3Y
	UOP7LSMt3DQ6u8ceOU/XZHt4rq4Af5FkgdXa80T0FL5XjUwScoFo1IEbOn7naIwk9xsO2Y2tnFz1T
	rbCABkf2Nqj4Kkh/1U3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnff-0000000EEwA-43Bt;
	Tue, 11 Aug 2026 14:41:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtnfc-0000000EEvt-18fj
	for linux-riscv@lists.infradead.org;
	Tue, 11 Aug 2026 14:41:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8FC34434B1
	for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 14:41:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 746561F00A3E
	for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 14:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786459295;
	bh=xdXgRqs7Nr1fLxjk//ew78HlNUVWPILwUi7Fxa2du00=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=BfqeRKnTSHza2m4ZbgzufxURoNhXHn/55WSk1QDBxuYMPAlUP55GZ5aCBeY9y9cHw
	 oxCU4RxDQ9yVad0X8z5QTG1f0sOkjtu7lBwpyu+GxSSTy88fXdyCiRa4o+Tnpw9H0V
	 Bnoi6gjzXafo9uM/Be+6kEVqGon7dEQan6scVIslihTxSpZWJ9Gw9BE84VPpkOQqQF
	 FMWqWZESRdIym/Z4R8ZO/yh/SAD/L17Ja60Xo5gjT/9q8ZTPDMEqcGITzRpKHkJaQr
	 XHBZ9cHC4DjiEcZpG/Tm7WHh+gnNhf2e3Qzz4fd0XOmBxU6LDgFgAXlRKuoCJx0nIx
	 SSriCOLFTecTA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6a051b737d8so3336894a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 11 Aug 2026 07:41:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpfqtlVYTvsza3QroSzzKrC68J39OeqVBhAJyRsYffu30B9Z3URrVxcjennsxMsu7zkwco6cekkaEJTNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyNkVA4db/hxP+1TsYFhWS2xWsei9UqkMQYx4h8xBwZ6qg8yePb
	vkZD+S8PxifCHr1QjLDUwu96gJ39BBMAZOG8CKdisxg6Z3sr0cgq8l9kSbnIgo0A0bpPuSi9ZvB
	VxEAy2zlGnrX2/igHOm7broRJCckV2cI=
X-Received: by 2002:a05:6402:a6c5:20b0:6a0:9cb5:4f33 with SMTP id
 4fb4d7f45d1cf-6a3644f660cmr1538034a12.13.1786459294109; Tue, 11 Aug 2026
 07:41:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260811115749.3465579-1-gaohan@iscas.ac.cn>
In-Reply-To: <20260811115749.3465579-1-gaohan@iscas.ac.cn>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Tue, 11 Aug 2026 22:41:23 +0800
X-Gmail-Original-Message-ID: <CAAhV-H7FcV73VB58=zyscfCvP1L5sJ0CZTZ2EZNZkYB=X5dhAg@mail.gmail.com>
X-Gm-Features: AUfX_mwNj_BrvlUMS1ChJZwUqksdFIOQl2gtTOLntxho3QInMnkLV4UGOsmxN9E
Message-ID: <CAAhV-H7FcV73VB58=zyscfCvP1L5sJ0CZTZ2EZNZkYB=X5dhAg@mail.gmail.com>
Subject: Re: [PATCH] LoongArch: mm: Define DIRECT_MAP_PHYSMEM_END
To: Han Gao <gaohan@iscas.ac.cn>
Cc: WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Andrew Morton <akpm@linux-foundation.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Tianyang Zhang <zhangtianyang@loongson.cn>, 
	Magnus Lindholm <linmag7@gmail.com>, Kiryl Shutsemau <kas@kernel.org>, 
	Hongchen Zhang <zhanghongchen@loongson.cn>, WangYuli <wangyuli@aosc.io>, 
	Mingcong Bai <jeffbai@aosc.io>, Zhang Yuhao <xinmu@xinmu.moe>, Kexy Biscuit <kexybiscuit@aosc.io>, 
	loongarch@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Han Gao <rabenda.cn@gmail.com>, 
	stable@vger.kernel.org
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

SGksIEhhbiwKCk9uIFR1ZSwgQXVnIDExLCAyMDI2IGF0IDc6NTjigK9QTSBIYW4gR2FvIDxnYW9o
YW5AaXNjYXMuYWMuY24+IHdyb3RlOgo+Cj4gZ2V0X2ZyZWVfbWVtX3JlZ2lvbigpIGFuZCBtaHBf
Z2V0X3BsdWdnYWJsZV9yYW5nZSgpIGJvdW5kIHRoZWlyCj4gc2VhcmNoIHRvIERJUkVDVF9NQVBf
UEhZU01FTV9FTkQuICBMb29uZ0FyY2ggZG9lcyBub3QgZGVmaW5lIGl0LCBzbwo+IHRoZSBmYWxs
YmFjayBpbiBpbmNsdWRlL2xpbnV4L21tLmggYXBwbGllczogdW5kZXIKPiBDT05GSUdfU1BBUlNF
TUVNX1ZNRU1NQVAgaXQgaXMgKDFVTEwgPDwgTUFYX1BIWVNNRU1fQklUUykgLSAxLCBhCj4gY29t
cGlsZS10aW1lIGNvbnN0YW50IHRoYXQgZG9lcyBub3QgYWRhcHQgdG8gdGhlIHBoeXNpY2FsIGFk
ZHJlc3MKPiBiaXRzIG9mIHRoZSBDUFUgKGNwdV9wYWJpdHMsIHByb2JlZCBmcm9tIENQVUNGRzE6
IDQ4IG9uCj4gM0E1MDAwLzNBNjAwMCwgNDcgb24gM0M2MDAwLCA0MCBvbiB0aGUgMksgc2VyaWVz
KS4KQXMgZmFyIGFzIEkga25vdywgTG9vbmdzb24tM0M2MDAwIGlzIGFsc28gUEE0OC4KCj4KPiBU
aGUgdm1lbW1hcCB3aW5kb3cgb25seSBjb3ZlcnMgcGh5c2ljYWwgc3BhY2UgYmVsb3cgMl4oY3B1
X3BhYml0cysxKQo+IChWTUVNTUFQX1NJWkUpLCBzbyBvbiBDUFVzIHdpdGggZmV3ZXIgdGhhbiA0
OCBwaHlzaWNhbCBhZGRyZXNzIGJpdHMKPiBnZXRfZnJlZV9tZW1fcmVnaW9uKCkgbWF5IGhhbmQg
Wk9ORV9ERVZJQ0UgYSByZWdpb24gd2l0aCBubyBzdHJ1Y3QKPiBwYWdlIGJhY2tpbmc6Cj4KPiAt
IE9uIHRoZSAySyBzZXJpZXMgdGhlIHJlZ2lvbiByZXR1cm5lZCBhdCB0aGUgdG9wIG9mIHRoZSA0
OC1iaXQKPiAgIHBoeXNpY2FsIHNwYWNlIGlzIG91dHNpZGUgdGhlIHZtZW1tYXAgd2luZG93OyB2
bWVtbWFwX3BvcHVsYXRlKCkKPiAgIHdyYXBzIHRoZSByYW5nZSBhcm91bmQgYW5kIG1hcHMgaXQg
aW50byBsb3cgbWVtb3J5LCBzaWxlbnRseQo+ICAgY29ycnVwdGluZyB0aGUgcGFnZSB0YWJsZXMu
Cj4gLSBPbiAzQzYwMDAgdGhlIHZtZW1tYXAgcmFuZ2Ugb2YgdGhlIHJlZ2lvbidzIGxhc3Qgc2Vj
dGlvbiB1c2VkIHRvCj4gICBlbmQgZXhhY3RseSBhdCAyXjY0IGFuZCB3cmFwIHRvIDAsIGxlYXZp
bmcgdm1lbW1hcF9wb3B1bGF0ZSgpIHdpdGgKPiAgIG5vdGhpbmcgdG8gbWFwLCBzbyBtZW1tYXBf
aW5pdF96b25lX2RldmljZSgpIGZhdWx0ZWQgd2hpbGUgd3JpdGluZwo+ICAgc3RydWN0IHBhZ2Ug
KHJlcG9ydGVkIHdpdGggYW1ka2ZkIG9uIDYuMTYgWzFdKS4gIENvbW1pdCAyOTY5YjQyYzhmOTkK
PiAgICgiTG9vbmdBcmNoL21tOiBhbGlnbiB2bWVtbWFwIHRvIG1heGltYWwgZm9saW8gc2l6ZSIp
IG1vdmVkIHRoZQo+ICAgdm1lbW1hcCBiYXNlIGRvd24gYnkgb25lIFBNRCwgd2hpY2gga2VlcHMg
dGhhdCBzZWN0aW9uIGluIGJvdW5kcyBvbgo+ICAgY3VycmVudCAzQzYwMDAgY29uZmlncywgYnV0
IHRoZSAySyBzZXJpZXMgaXMgc3RpbGwgYWZmZWN0ZWQgYW5kIHRoZQo+ICAgM0M2MDAwIGNhc2Ug
b25seSBob2xkcyBmb3IgdGhlIGN1cnJlbnQgdm1lbW1hcCBsYXlvdXQuCj4KPiBEZWZpbmUgRElS
RUNUX01BUF9QSFlTTUVNX0VORCBhcyAoMVVMTCA8PCBjcHVfcGFiaXRzKSAtIDEgc28gdGhhdAo+
IGJvdGggc2VhcmNoZXMgc3RheSB3aXRoaW4gdGhlIHZtZW1tYXAtY292ZXJlZCBwaHlzaWNhbCBz
cGFjZSwKPiBtaXJyb3JpbmcgY29tbWl0IGYzMzM2YjQ4Y2Y5ZCAoInJpc2N2OiBtbTogRGVmaW5l
Cj4gRElSRUNUX01BUF9QSFlTTUVNX0VORCIpLgo+Cj4gWzFdIGh0dHBzOi8vbG9yZS5rZXJuZWwu
b3JnL2FtZC1nZngvMjAyNTA4MTQwMzIxNTMuMjI3Mjg1LTEtamVmZmJhaUBhb3NjLmlvLwo+Cj4g
Q2M6IHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmcgIyB2Ni4xMysKPiBTaWduZWQtb2ZmLWJ5OiBIYW4g
R2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gLS0tCj4gIGFyY2gvbG9vbmdhcmNoL2luY2x1ZGUv
YXNtL3BndGFibGUuaCB8IDcgKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25z
KCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vcGd0YWJsZS5o
IGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vcGd0YWJsZS5oCj4gaW5kZXggMjIzNTI4YzA0
ZDczLi4yNDQ5MzFlNGJjNTggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9h
c20vcGd0YWJsZS5oCj4gKysrIGIvYXJjaC9sb29uZ2FyY2gvaW5jbHVkZS9hc20vcGd0YWJsZS5o
Cj4gQEAgLTEyNSw2ICsxMjUsMTMgQEAgc3RydWN0IHZtX2FyZWFfc3RydWN0Owo+Cj4gICNlbmRp
Zgo+Cj4gKy8qIE5lZWRlZCB0byBsaW1pdCBnZXRfZnJlZV9tZW1fcmVnaW9uKCkgKi8KPiArI2lm
IGRlZmluZWQoQ09ORklHX0ZMQVRNRU0pIHx8IGRlZmluZWQoQ09ORklHX1NQQVJTRU1FTV9WTUVN
TUFQKQo+ICsjZGVmaW5lIERJUkVDVF9NQVBfUEhZU01FTV9FTkQgKCgxVUxMIDw8IGNwdV9wYWJp
dHMpIC0gMSkKPiArI2VsaWYgZGVmaW5lZChDT05GSUdfU1BBUlNFTUVNKQo+ICsvKiBESVJFQ1Rf
TUFQX1BIWVNNRU1fRU5EIGlzIG5vdCBsaW1pdGVkIGJ5IFZBIHNwYWNlIGFzc2lnbm1lbnQgaW4g
dGhpcyBjYXNlICovCj4gKyNlbmRpZgogKCgxVUxMIDw8IGNwdV9wYWJpdHMpIC0gMSkgaXMgbm90
IGFsd2F5cyBzbWFsbGVyIHRoYW4gICgxVUxMIDw8Ck1BWF9QSFlTTUVNX0JJVFMpIC0gMS4KClNv
IEkgdGhpbmsgYSBiZXR0ZXIgd2F5IGlzOgorI2lmbmRlZiBDT05GSUdfU1BBUlNFTUVNCisjZGVm
aW5lIERJUkVDVF9NQVBfUEhZU01FTV9FTkQgKCgoMVVMTCA8PCAoY3B1X3BhYml0cyArIDEpKSAt
IDEpCisjZWxzZQorI2RlZmluZSBESVJFQ1RfTUFQX1BIWVNNRU1fRU5EIE1JTigoKDFVTEwgPDwg
KGNwdV9wYWJpdHMgKyAxKSAtIDEsCigxVUxMIDw8IE1BWF9QSFlTTUVNX0JJVFMpIC0gMSkKKyNl
bmRpZgoKSHVhY2FpCgo+ICsKPiAgI2RlZmluZSBwdGVwX2dldChwdGVwKSBSRUFEX09OQ0UoKihw
dGVwKSkKPiAgI2RlZmluZSBwbWRwX2dldChwbWRwKSBSRUFEX09OQ0UoKihwbWRwKSkKPgo+IC0t
Cj4gMi40Ny4zCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
