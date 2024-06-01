Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2A5C25B7E
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Jun 2024 06:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+6g2ShKgRq6K1Z4BBGUgQHuxqvqfgreQb9i3jsdLErE=; b=VkgdX2fc0lm4oB
	IHWv6+G5zWeJaXAAunskz6cTbPUYypK0xNnk6fMsExHEJ3NDZ+Yu4p49aPXmHDpOqslIS1PoPRJ7A
	jrrcg6Ttt5isLbm7bJ3p1SICKjBKelQNnSJe9TSHhi+Y0NU5qVOzm/32D5KoFwPbwcYnmZ3L9nU8y
	toJZ+wYWhy7njarwr3qZ4KeUUVys4BP4wvFAHR8pVKAUQxHWfpu7s9aCYA1af9LgI4GtKnxfimO4D
	QAZzmxANHUqjHhqEKhkrOeHpycPFhGBQJbA0nEGdoqMvY3xaxFxy9o6pWzoCwV8qOMei6FN2wnVqu
	F0rVRs40oYJuA4OYQi6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDI4q-0000000C4ZH-2lKd;
	Sat, 01 Jun 2024 06:18:53 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sDI4n-0000000C4XC-41dM
	for linux-riscv@lists.infradead.org;
	Sat, 01 Jun 2024 06:18:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DFB5ACE1CFB
	for <linux-riscv@lists.infradead.org>; Sat,  1 Jun 2024 06:18:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A8AC3277B
	for <linux-riscv@lists.infradead.org>; Sat,  1 Jun 2024 06:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717222723;
	bh=qv/TpTCLIjAt2eWLAMdx+nkTx3R9H3xNd5p/PM0KR/Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=T3l21jx6DRIWYURgryuGOT3ad9rDOO3VpyZ+i7KLuV3CcXvTubeGccG9yaHbBfJpY
	 LsrboZ2sQWcX9Ec/3B69HuI2DM9AN2sbX2oU2rv+UPKctEENjsZN3ASah5wZia7ZK3
	 RNc651eTlMdCQiTtGD9ElY2qefzF2jz335808HGpaAPQZDz9k6TXGPKefYGoTbxyvg
	 l0IAo0pij8zWp3qwUG62akh6IMydtrt0QifAulzwqW5jbbYmLZfoENjqQ7JyCHmInL
	 jznE2vMfiu0ThzP5s4rWrOEo4GqI3tS5wfe6DIgNbuelsCyxK0vo7pd/AyLGoiISdF
	 o0D+603L2oJlw==
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a6267778b3aso244008466b.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 23:18:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXWSu2p+aeudkHVCwMUpfwelmItYPqJkAPNQ88/jSnl7Rw+UkKX1V1y7VCUard5fn5tmlfN3LTlsDDIsHM1w7Se+HZk0xCFMOy+NVcjEgYT
X-Gm-Message-State: AOJu0YwMt7hzA+Jo1L+P/e3NBb/ep6Ij1Ks5+4S3T3gNdfJgIu5MKDBj
	psdmaREP5btvyAt5oialjXOCS4aSG/u/AjJq/4HsiRenokvt0FCjMQsFX+r3Olvra3gNAUZp8IX
	AdLSHZw4qnTw+x32fZ3qY9L0KrNo=
X-Google-Smtp-Source: AGHT+IEA4/ILSczbK0xOrDgN8sjL32cYwfghwWG8IasCH/Si+Iwy3qd1z6J8H3j9DILXwkN3hkhqqm3H1a7TEeNrKmU=
X-Received: by 2002:a17:906:4114:b0:a68:b6c7:516b with SMTP id
 a640c23a62f3a-a68b6c75209mr37608866b.73.1717222722373; Fri, 31 May 2024
 23:18:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240528151052.313031-1-alexghiti@rivosinc.com>
 <20240528151052.313031-8-alexghiti@rivosinc.com> <ZlZ8/Nv3QS99AgY9@andrea>
 <39a9b28c-2792-45ce-a8c6-1703cab0f2de@ghiti.fr> <ZlnyKclZOQdrJTtU@andrea>
In-Reply-To: <ZlnyKclZOQdrJTtU@andrea>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 1 Jun 2024 14:18:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTz2H5McxgsrEcMeCNMnchS6sr3vRn53J=FWk_6HPoP6A@mail.gmail.com>
Message-ID: <CAJF2gTTz2H5McxgsrEcMeCNMnchS6sr3vRn53J=FWk_6HPoP6A@mail.gmail.com>
Subject: Re: [PATCH 7/7] riscv: Add qspinlock support based on Zabha extension
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_231850_446024_C1DDAA9B 
X-CRM114-Status: GOOD (  21.85  )
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

T24gRnJpLCBNYXkgMzEsIDIwMjQgYXQgMTE6NTLigK9QTSBBbmRyZWEgUGFycmkgPHBhcnJpLmFu
ZHJlYUBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gPiA+ID4gKyBzZWxlY3QgQVJDSF9VU0VfUVVFVUVE
X1NQSU5MT0NLUyBpZiBUT09MQ0hBSU5fSEFTX1pBQkhBCj4gPiA+IElJVUMsIHdlIHNob3VsZCBt
YWtlIHN1cmUgcXNwaW5sb2NrcyBydW4gd2l0aCBBUkNIX1dFQUtfUkVMRUFTRV9BQ1FVSVJFLAo+
ID4gPiBwZXJoYXBzIGEgc2ltaWxhciBzZWxlY3QgZm9yIHRoZSBsYXR0ZXI/ICAobm90IGEga2Nv
bmZpZyBleHBlcnQpCj4gPgo+ID4KPiA+IFdoZXJlIGRpZCB5b3Ugc2VlIHRoaXMgZGVwZW5kZW5j
eT8gQW5kIGlmIHRoYXQgaXMgcmVhbGx5IGEgZGVwZW5kZW5jeSBvZgo+ID4gcXNwaW5sb2Nrcywg
c2hvdWxkbid0IHRoaXMgYmUgdW5kZXIgQ09ORklHX1FVRVVFRF9TUElOTE9DS1M/IChub3QgYSBL
Y29uZmlnCj4gPiBleHBlcnQgdG9vKS4KPgo+IFRoZSBjb21tZW50IG9uIHNtcF9tYl9fYWZ0ZXJf
dW5sb2NrX2xvY2soKSBpbiBpbmNsdWRlL2xpbnV4L3JjdXBkYXRlLmgKPiAodGhlIGJhcnJpZXIg
aXMgY3VycmVudGx5IG9ubHkgdXNlZCBieSB0aGUgUkNVIHN1YnN5c3RlbSkgcmVjYWxsczoKPgo+
ICAgLyoKPiAgICAqIFBsYWNlIHRoaXMgYWZ0ZXIgYSBsb2NrLWFjcXVpc2l0aW9uIHByaW1pdGl2
ZSB0byBndWFyYW50ZWUgdGhhdAo+ICAgICogYW4gVU5MT0NLK0xPQ0sgcGFpciBhY3RzIGFzIGEg
ZnVsbCBiYXJyaWVyLiAgVGhpcyBndWFyYW50ZWUgYXBwbGllcwo+ICAgICogaWYgdGhlIFVOTE9D
SyBhbmQgTE9DSyBhcmUgZXhlY3V0ZWQgYnkgdGhlIHNhbWUgQ1BVIG9yIGlmIHRoZQo+ICAgICog
VU5MT0NLIGFuZCBMT0NLIG9wZXJhdGUgb24gdGhlIHNhbWUgbG9jayB2YXJpYWJsZS4KPiAgICAq
Lwo+ICAgI2lmZGVmIENPTkZJR19BUkNIX1dFQUtfUkVMRUFTRV9BQ1FVSVJFCj4gICAjZGVmaW5l
IHNtcF9tYl9fYWZ0ZXJfdW5sb2NrX2xvY2soKSAgIHNtcF9tYigpICAvKiBGdWxsIG9yZGVyaW5n
IGZvciBsb2NrLiAqLwo+ICAgI2Vsc2UgLyogI2lmZGVmIENPTkZJR19BUkNIX1dFQUtfUkVMRUFT
RV9BQ1FVSVJFICovCj4gICAjZGVmaW5lIHNtcF9tYl9fYWZ0ZXJfdW5sb2NrX2xvY2soKSAgIGRv
IHsgfSB3aGlsZSAoMCkKPiAgICNlbmRpZiAvKiAjZWxzZSAjaWZkZWYgQ09ORklHX0FSQ0hfV0VB
S19SRUxFQVNFX0FDUVVJUkUgKi8KPgo+IEFyY2hpdGVjdHVyZXMgd2hvc2UgVU5MT0NLK0xPQ0sg
aW1wbGVtZW50YXRpb24gZG9lcyBub3QgKGFscmVhZHkpIG1lZXQKPiB0aGUgcmVxdWlyZWQgImZ1
bGwgYmFycmllciIgb3JkZXJpbmcgcHJvcGVydHkgKGN1cnJlbnRseSwgb25seSBwb3dlcnBjKQo+
IGNhbiBvdmVyd3JpdGUgdGhlICJkZWZhdWx0Ii9jb21tb24gI2RlZmluZSBmb3IgdGhpcyBiYXJy
aWVyIChOT1ApIGFuZAo+IG1lZXQgdGhlIG9yZGVyaW5nIGJ5IG9wdGluZyBpbiBmb3IgQVJDSF9X
RUFLX1JFTEVBU0VfQUNRVUlSRS4KPgo+IFRoZSAoY3VycmVudCkgImdlbmVyaWMiIHRpY2tldCBs
b2NrIGltcGxlbWVudGF0aW9uIHByb3ZpZGVzICJ0aGUgZnVsbAo+IGJhcnJpZXIiIGluIGl0cyBM
T0NLIG9wZXJhdGlvbnMgKGhlbmNlIGluIHBhcnQuIGluIFVOTE9DSytMT0NLKSwgY2YuCj4KPiAg
IGFyY2hfc3Bpbl90cnlsb2NrKCkgLT4gYXRvbWljX3RyeV9jbXB4Y2hnKCkKPiAgIGFyY2hfc3Bp
bl9sb2NrKCkgLT4gYXRvbWljX2ZldGNoX2FkZCgpCj4gICAgICAgICAgICAgICAgICAgIC0+IGF0
b21pY19jb25kX3JlYWRfYWNxdWlyZSgpOyBzbXBfbWIoKQo+Cj4gYnV0IHRoZSAiVU5MT0NLK0xP
Q0sgcGFpcnMgYWN0IGFzIGEgZnVsbCBiYXJyaWVyIiBwcm9wZXJ0eSBkb2Vzbid0IGhvbGQKPiB0
cnVlIGZvciByaXNjdiAoYW5kIHBvd2VycGMpIHdoZW4gc3dpdGNoaW5nIG92ZXIgdG8gcXVldWVk
IHNwaW5sb2NrLgpZZXMuCgo+IE9UT0gsIEkgc2VlIG5vIHBhcnRpY3VsYXIgcmVhc29uIGZvciBv
dGhlciAidXNlcnMiIG9mIHF1ZXVlZCBzcGlubG9ja3MKPiAobm90YWJseSwgeDg2IGFuZCBhcm02
NCkgZm9yIHNlbGVjdGluZyBBUkNIX1dFQUtfUkVMRUFTRV9BQ1FVSVJFLgpJIGxvb2tlZCBhdCB0
aGUgcmlzY3YtdW5wcml2aWxlZ2VkIHBwbyBzZWN0aW9uLCBzZWVtcyBSSVNDLVYgLnJsIC0+Ci5h
cSBoYXMgUkNzYyBhbm5vdGF0aW9ucy4KcmVmOgpFeHBsaWNpdCBTeW5jaHJvbml6YXRpb24KIDUu
IGhhcyBhbiBhY3F1aXJlIGFubm90YXRpb24KIDYuIGhhcyBhIHJlbGVhc2UgYW5ub3RhdGlvbgog
Ny4gYSBhbmQgYiBib3RoIGhhdmUgUkNzYyBhbm5vdGF0aW9ucwoKQW5kIGZvciBxc3BpbmxvY2s6
CnVubG9jazoKICAgICAgICBzbXBfc3RvcmVfcmVsZWFzZSgmbG9jay0+bG9ja2VkLCAwKTsKCmxv
Y2s6CiAgICAgICAgaWYgKGxpa2VseShhdG9taWNfdHJ5X2NtcHhjaGdfYWNxdWlyZSgmbG9jay0+
dmFsLCAmdmFsLCBfUV9MT0NLRURfVkFMKSkpCgpJZiB0aGUgaGFyZHdhcmUgaGFzIFN0b3JlLVJl
bGVhc2UgYW5kIENBUyBpbnN0cnVjdGlvbnMsIHRoZXkgYWxsIG9iZXkKRXhwbGljaXQgU3luY2hy
b25pemF0aW9uIHJ1bGVzLiBUaGVuIFJJU0MtViAiVU5MT0NLK0xPQ0siIHBhaXJzIGFjdCBhcwph
IGZ1bGwgYmFycmllciwgcmlnaHQ/Cgo+Cj4gQnV0IGRvZXMgdGhpcyBhZGRyZXNzIHlvdXIgY29u
Y2Vybj8gIExldCBtZSBrbm93IGlmIEkgbWlzdW5kZXJzdG9vZCBpdC4KPgo+ICAgQW5kcmVhCgoK
Ci0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
