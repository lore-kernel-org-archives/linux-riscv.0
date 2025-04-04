Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FDB4C36010
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Apr 2025 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMTnY4g1X5mz+PQHnkgpXSU6hDm1bKWcTNPa5RVPNls=; b=uHUVo+Zo3qS/yc
	KTBsGU9j81AuY/eT/lyrbjclt9CZyvyiV4lZbkzv3GLkd9dEJek2l8FUVcuDz3leAs11kE4YRRZ6i
	ysV+xhzyxnMUgrZSrg1j5cwB/9suojfjYFladjzAy0elbCBP4IvY6JPmYAEylGrMm3ycytUCn5Czh
	ES8qlzn+Ej2z8L9yzEbee82gW+inU9ib1yWizLnrumLO1SsIZOnW6OaRlhp3GXZYu26fKUFzt3eff
	+I8DzjlXo8epYujs2QrM2psYoHD+3bGvEfH+IMNgbOohZlBlhxbWFPVGmR00w5MaHVA7nekjvuMx8
	Ndd9plGXxYMe3aMrbhcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ivL-0000000CAO1-29kJ;
	Fri, 04 Apr 2025 15:25:39 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ivJ-0000000CAN3-0iNv
	for linux-riscv@lists.infradead.org;
	Fri, 04 Apr 2025 15:25:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 742D345079
	for <linux-riscv@lists.infradead.org>; Fri,  4 Apr 2025 15:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91E2C4CEEC
	for <linux-riscv@lists.infradead.org>; Fri,  4 Apr 2025 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743780335;
	bh=nK6IXtqAJZLLyw0GWtzRaeO5dpR8mdeA56ldyu1ncbo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MqSdlYDypLBGkooMf84Fafs/nnBUjhwYVSpVR4cNTxTWYWm7+c+EgttWBRNgQA3za
	 jn3oheX3bhnsb4w2j/rZ2ZJqqilpqlgfv25vFcMYFTYVtbWCCiWHKRchhbhSISQQcl
	 BFb/p9gOGiMPPe9n94zPSwY682425LjBZnl6bgRwGUnPNVfZv8HjMLpYgdu8cuMtir
	 +n6bmFLjV5U3B6Qw3BC+YtY9mxzTuZK22V7hGod2qV0s7QPZaWm/orhTIgcTcn+va+
	 SN8PdEdHgki4xuf5o+KHdxLXNiO4P0hmW+N8ACiCqwD2i4qvQU50ANLwKGu10tWVoj
	 vDDMKaTkl/mGg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30bfe0d2b6dso19614761fa.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 08:25:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUPSpJUBFoQmTLsbT4b2u4yhzxWD4IDUFrZP0tGGvhyQGB/v5+Tb3ABonF0waPq30HOmhzZJRsBzrec+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn5k4lNCXRFdcEW3EqP7U0TV8I0vi+swrjW5ec/UW2DRZh4rPz
	wEbQyCuPNLSCssXW6dsa2RFfpT0OYeA02Vr87JUuqX24k6x2sGPXkhHrTFIeRuXEMyaH+hn/FrI
	Gz19n5jK8uu20z2wMzixlh8b8IHA=
X-Google-Smtp-Source: AGHT+IHm9oLp2VNs6gVeqyQoqXKbHof+ipk+8pg/ZnlGiMrdli/D4QrtcDONAkA1jcay3in9eUiUE/zUq6fh7pGxa2c=
X-Received: by 2002:a2e:ab19:0:b0:30c:7a7:e874 with SMTP id
 38308e7fff4ca-30f0bf1e9b3mr11238561fa.11.1743780334401; Fri, 04 Apr 2025
 08:25:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com> <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
In-Reply-To: <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 5 Apr 2025 00:24:56 +0900
X-Gmail-Original-Message-ID: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
X-Gm-Features: ATxdqUGGrznrJ02mnRz79MwDnvO85yAln5KDtwraC_VKsuL1jogPgQbWExeTD0E
Message-ID: <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_082537_247119_403C23F0 
X-CRM114-Status: GOOD (  25.72  )
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

T24gRnJpLCBBcHIgNCwgMjAyNSBhdCAxMjo0NeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxleEBn
aGl0aS5mcj4gd3JvdGU6Cj4KPiBIaSBBcmQsCj4KPiBPbiAwMy8wNC8yMDI1IDE3OjExLCBBcmQg
Qmllc2hldXZlbCB3cm90ZToKPiA+IE9uIFRodSwgMyBBcHIgMjAyNSBhdCAxNjo0MiwgQWxleGFu
ZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPiB3cm90ZToKPiA+PiByaXNjdiB1c2Vz
IHRoZSAucmVsYS5keW4gc2VjdGlvbiB0byByZWxvY2F0ZSB0aGUga2VybmVsIGF0IHJ1bnRpbWUg
YnV0Cj4gPj4gdGhhdCBzZWN0aW9uIGlzIHN0cmlwcGVkIGZyb20gdm1saW51eC4gVGhhdCBwcmV2
ZW50cyBrZXhlYyB0bwo+ID4+IHN1Y2Nlc3NmdWxseSBsb2FkIHZtbGludXggc2luY2UgaXQgZG9l
cyBub3QgY29udGFpbiB0aGUgcmVsb2NhdGlvbnMgaW5mbwo+ID4+IG5lZWRlZC4KPiA+Pgo+ID4g
TWF5YmUgZXhwbGFpbiB0aGF0IC5yZWxhLmR5biBjb250YWlucyBydW50aW1lIHJlbG9jYXRpb25z
LCB3aGljaCBhcmUKPiA+IG9ubHkgZW1pdHRlZCBpZiB0aGV5IGFyZSBhY3R1YWxseSBuZWVkZWQg
LSBhcyBvcHBvc2VkIHRvIHRoZSBzdGF0aWMKPiA+IHJlbG9jYXRpb25zIHRoYXQgYXJlIG5vdCBl
bWl0dGVkIGFzIFNIRl9BTExPQyBzZWN0aW9ucywgYW5kIGFyZSBub3QKPiA+IGNvbnNpZGVyZWQg
dG8gYmUgcGFydCBvZiB0aGUgcnVudGltZSBpbWFnZSBpbiB0aGUgZmlyc3QgcGxhY2UuCj4KPgo+
IE9rIEknbGwgZG8uCj4KPgo+ID4gSXQKPiA+IHdvdWxkIGJlIG5pY2UgaWYgd2UgY291bGQgdXNl
IC0tcmVtb3ZlLXJlbG9jYXRpb25zPSBoZXJlLCB3aGljaCBvbmx5Cj4gPiByZW1vdmVzIHN0YXRp
YyByZWxvY2F0aW9ucywgYnV0IHVuZm9ydHVuYXRlbHksIGxsdm0tb2JqY29weSBkb2VzIG5vdAo+
ID4gc3VwcG9ydCB0aGlzLgo+ID4KPiA+IEFsc28sIEkgd29uZGVyIGlmIHRoaXMgc2hvdWxkIGFw
cGx5IHRvIGFsbCBvZiAucmVsLmR5biwgLnJlbGEuZHluIGFuZAo+ID4gLnJlbHIuZHluLCBhcyB0
aGV5IGFsbCBjYXJyeSBydW50aW1lIHJlbG9jYXRpb25zLgo+Cj4KPiBPaywgSSdsbCBhZGQgdGhl
bSB0byB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4KPiA+Cj4gPiBGaW5hbGx5LCBJJ2QgYmUgY3VyaW91
cyB0byBrbm93IHdoeSBSSVNDLVYgcmVsaWVzIG9uIC0tZW1pdC1yZWxvY3MgaW4KPiA+IHRoZSBm
aXJzdCBwbGFjZT8gSXMgdGhlIHJlbG9jcyBjaGVjayByZWFsbHkgbmVlZGVkPyBJZiBub3QsIGl0
IHdvdWxkCj4gPiBiZSBhIG5pY2Ugb3Bwb3J0dW5pdHkgdG8gZ2V0IHJpZCBvZiBNYWtlZmlsZS5w
b3N0bGluayBlbnRpcmVseS4KPgo+Cj4gU28gSSBoYWQgdG8gY2hlY2sgYW5kIGl0IGhhcHBlbnMg
dGhhdCB0aGlzIHdhcyBhbiBpc3N1ZSB3aXRoIHRoZQo+IHRvb2xjaGFpbiwgSSBzaG91bGQgY2hl
Y2sgaWYgdGhhdCBzdGlsbCBoYXBwZW5zIHdpdGggbmV3ZXIgb25lcy4KPgo+IGNvbW1pdCA1NTlk
MWU0NWExNmRjZjE1NDJlNDMwZWEzZGNlOWFiNjI1YmU5OGQwCj4gQXV0aG9yOiBBbGV4YW5kcmUg
R2hpdGkgPGFsZXhnaGl0aUByaXZvc2luYy5jb20+Cj4gRGF0ZTogICBXZWQgTWFyIDI5IDA2OjUz
OjI5IDIwMjMgKzAyMDAKPgo+ICAgICAgcmlzY3Y6IFVzZSAtLWVtaXQtcmVsb2NzIGluIG9yZGVy
IHRvIG1vdmUgLnJlbGEuZHluIGluIGluaXQKCgoKClNvLAoKRml4ZXM6IDU1OWQxZTQ1YTE2ZCAo
InJpc2N2OiBVc2UgLS1lbWl0LXJlbG9jcyBpbiBvcmRlciB0byBtb3ZlCi5yZWxhLmR5biBpbiBp
bml0IikKCklzIHRoaXMgdGhlIGNvcnJlY3QgdGFnPwoKCgoKCi0tIApCZXN0IFJlZ2FyZHMKTWFz
YWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
