Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03AF4CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 09:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fRiJRoMci3wHU32RYnaJzbd523UYufyzym9991VCR5I=; b=Ord00hfuitxbbZ
	eOy/xE0tf1Zo5QkUdQk58xIPZ+2UgQiOWB/Ef3BGguD1tgG3KTknTXx+1em/6An+Hh5fUvWgaz8x1
	XIohng1cBC1N74UiMuZ46GD3rQWqCR+dZmSqEHlnRIq62xbyXqBXKzFrWHOQ4UFDts9vQNGnGH7Yk
	iI5CTlx+yX1Dpr9WdeN6MuaN/099Bmcc4H7iqay+DZ4zh+DGYS1F4mx+toi3LQc3ZgLt3brRbchKv
	//DkSlMY6Uli4k9UXULKnBY/4I9DeBeglE58juY2qfyiKO+utk/Fxr5TRW9UyH2UJJqFoO0l0WfJP
	+CRqcvi/tig283vW/oDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZPx-0000000B7V9-33g8;
	Fri, 02 Oct 2026 09:19:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZPw-0000000B7UD-0QU2;
	Fri, 02 Oct 2026 09:19:00 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id A3F8760A96;
	Fri,  2 Oct 2026 09:18:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854CD1F000FF;
	Fri,  2 Oct 2026 09:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932738;
	bh=kUPal21B/mSeq/i2I0fVbafYDiAiPgFaWqso5GBNYgw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Bib7a0PM9uB/Juf5Fvu+oSR5+RsFmNc22FbQ3W8GIqtnemb+ACt71CTBw2sib4s92
	 fFnF4433pDjiEGcg7x5zAEvURZ47Q+qrMo2IYrA95mk7vxbQjDv/9+rywF+rGaZ2P7
	 MWKHtnnqTQ8pjgpyCRbNP4t/CulAsggec5uV/Q4dsuX2d3LyZTJU72PUMvHEvpTwms
	 bQHF6mNjpQkROI+pb8cwG0OWRm4RbVW2IZfgTwGPNyr7ZCIRlyeoMH50oI1zzLRcfH
	 fUDv5QFMQ3ZAiDD1vUKWIdfRDKrY3rzo4o2Sj1ojPFTeN/KT1OBRSYQl++2ya2NmOw
	 blTAYWLPs3B3Q==
Message-ID: <83a874fb-db66-4dc2-8e14-68c7e28ae27c@kernel.org>
Date: Fri, 2 Oct 2026 11:18:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] random: vDSO: Avoid call to memset() when zeroing
 reserved in __cvdso_getrandom_data()
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 llvm@lists.linux.dev
References: <are6s5e6On3hpD3M@zx2c4.com>
 <CAKwvOd=BrMfFT88jsvBPhh383qqk5G+J07CsofNu0MVkziyhCg@mail.gmail.com>
 <20260930133813.GA3142230@ax162> <ar0a4b9CjL2YHCkY@zx2c4.com>
 <ar0gTS71qxnx9AkW@zx2c4.com> <20260930151337.GD3142230@ax162>
 <CAHmME9pA+AntJ6hWoFYpTVjh-NUSd0ZGXp5XiUuhQcq3HjQT3g@mail.gmail.com>
 <ede392d7-3104-4a0f-9fa1-99b22552dcd6@kernel.org>
 <ar4nD8aRH7wEvTMt@zx2c4.com> <20261001102059.GA4176271@ax162>
 <ar46ap4jzLWyP92C@zx2c4.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <ar46ap4jzLWyP92C@zx2c4.com>
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgpMZSAwMS8xMC8yMDI2IMOgIDEyOjQ4LCBKYXNvbiBBLiBEb25lbmZlbGQgYSDDqWNyaXTCoDoK
PiBPbiBUaHUsIE9jdCAwMSwgMjAyNiBhdCAxMjoyMDo1OVBNICswMjAwLCBOYXRoYW4gQ2hhbmNl
bGxvciB3cm90ZToKPj4gY29udHJvbC4gVGhlIGNoYW5nZSB0aGF0IGludHJvZHVjZWQgLW1heC1z
dG9yZS1tZW1zZXQgb25seSBkaWQgaXQgdG8KPj4gImFsbG93IGZpbmUtdHVuaW5nIG9mIHRoZSBp
bmxpbmluZyB0aHJlc2hvbGQgZm9yIHBlcmZvcm1hbmNlIGFuYWx5c2lzCj4+IGFuZCBvcHRpbWl6
YXRpb24iLiBJZiB0aGV5IGRlY2lkZSB0byByZW1vdmUgaXQgZm9yIHdoYXRldmVyIHJlYXNvbiwK
Pj4gd2UncmUgYmFjayB0byBzcXVhcmUgb25lLgo+IAo+IEkgc3VwcG9zZSBhbGwgdGhlIG1vcmUg
cmVhc29uIHRvIGdldCAtZmlubGluZS1zdHJpbmdvcHM9bWVtc2V0IGFkZGVkIHRvCj4gY2xhbmcu
IFRoZW4gdGhlIGR1YWwtZGVmYXVsdCB0aGluZyB5b3UgY2FtZSB1cCB3aXRoIGJlbG93IHdpbGwg
bmF0dXJhbGx5Cj4gc3RhcnQgY2hvb3NpbmcgdGhlIGZpcnN0IG9wdGlvbiB3aGVuIGl0IGJlY29t
ZXMgYXZhaWxhYmxlLgo+IAo+PiBJIGtub3cgc29tZXRoaW5nIGxpa2UgYmVsb3cgd291bGQgYmUg
dWdsaWVyIGR1ZSB0byB0aGUgaWZkZWYgYnV0IGl0Cj4+IHdvdWxkIGF2b2lkIGNoYW5naW5nIGFu
eXRoaW5nIGZvciBHQ0Mgd2hpbGUgY2xlYXJpbmcgdXAgdGhlIGlzc3VlIGF0Cj4+IGhhbmQgZm9y
IGNsYW5nIGluIGEgZ3VhcmFudGVlZCBzdGFibGUgYW5kIHN1Y2NpbmN0IG1hbm5lci4KPiAKPiBC
dXQgdGhlbiB3ZSdyZSBiYWNrIHRvIHRoZSBieXRlLWJ5LWJ5dGUgY29kZWdlbiB0aGF0IENocmlz
dG9waGUgcG9pbnRlZAo+IG91dC4KPiAgIAo+PiBJZiB0aGF0IGlzIG5vdCBhY2NlcHRhYmxlLCBz
b21ldGhpbmcgbGlrZSB0aGUgZm9sbG93aW5nIGRvZXMgYXBwZWFyIHRvCj4+IHdvcmsgZm9yIG1l
Lgo+IAo+IE9rYXksIGdyZWF0LCBsZXQncyBkbyB0aGF0Lgo+IAo+IERvZXMgdGhpcyBjb21taXQg
c2VlbSBva2F5IHdpdGggeW91PyBJIHVzZWQgdGhlIGRpZmYgeW91IHNlbnQgYmVsb3cgYW5kCj4g
YWRqdXN0ZWQgdGhlIGNvbW1pdCBtZXNzYWdlOiBodHRwczovL2V1cjAxLnNhZmVsaW5rcy5wcm90
ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZnaXQuengyYzQuY29tJTJGbGlu
dXgtcm5nJTJGY29tbWl0JTJGJTNGaWQlM0Q1NmZmOTVlZTg1NzE1MDQ3ZWI1YjUyMjAyNDM3Nzhh
ZjY1Nzc3OGM4JmRhdGE9MDUlN0MwMiU3Q2NocmlzdG9waGUubGVyb3klNDBjc2dyb3VwLmV1JTdD
ZDg5YjRkZTIyZmY5NGI2YmU3MTIwOGRmMWZhOTgzOWElN0M4Yjg3YWY3ZDg2NDc0ZGM3OGRmNDVm
NjlhMjAxMWJiNSU3QzAlN0MwJTdDNjM5MjY0NDg1MDU1NDkwMDI5JTdDVW5rbm93biU3Q1RXRnBi
R1pzYjNkOGV5SkZiWEIwZVUxaGNHa2lPblJ5ZFdVc0lsWWlPaUl3TGpBdU1EQXdNQ0lzSWxBaU9p
SlhhVzR6TWlJc0lrRk9Jam9pVFdGcGJDSXNJbGRVSWpveWZRJTNEJTNEJTdDMCU3QyU3QyU3QyZz
ZGF0YT1WeGY4eFJDZExhdnR3NERtaSUyQjQ5RlkxbEpEV3RtJTJCakt2N2Y4QnhLVEdxNCUzRCZy
ZXNlcnZlZD0wCj4gCgpUaGUgY29tbWl0IG1lc3NhZ2Ugc2F5czogU2ltaWxhcmx5LCBHQ0MgaGFz
IC1maW5saW5lLXN0cmluZ29wcz1tZW1zZXQgdG8gCmRvIHRoZSBzYW1lIFs0XSwgc2hvdWxkIHRo
aXMgaXNzdWUgZXZlciBoaXQgZnV0dXJlIHZlcnNpb24gb2YgR0NDLgoKV2h5IGRlZmF1bHQgIi1m
aW5saW5lLXN0cmluZ29wcz1tZW1zZXQiIGlmIAokKGNjLW9wdGlvbiwtZmlubGluZS1zdHJpbmdv
cHM9bWVtc2V0KSwgaGF2ZSB3ZSBpZGVudGlmaWVkIGNhc2VzIHdoZXJlIApidWlsZCBmYWlsIHdp
dGhvdXQgdGhhdCBvciBpcyBpdCBqdXN0IGZvciBmdXR1cmUgcHJvdmlzaW9uID8KCkFzIHNob3du
IGluIG15IHByZXZpb3VzIGVtYWlsLCB3aXRoIEdDQyAxNiBvbiBwb3dlcnBjMzIgd2UgZ2V0IGEg
CnNsaWdodGx5IGJldHRlciBjb2RlIHdpdGhvdXQgdGhpcyBvcHRpb24uCgotLS0KZGlmZiAtLWdp
dCBhL2luaXQvS2NvbmZpZyBiL2luaXQvS2NvbmZpZwppbmRleCA4NTgzZDlmMDZjNTIuLjk4ZDhk
N2ZhNjRjNSAxMDA2NDQKLS0tIGEvaW5pdC9LY29uZmlnCisrKyBiL2luaXQvS2NvbmZpZwpAQCAt
MTczLDYgKzE3MywxMSBAQCBjb25maWcgQ0NfSEFTX0FMTE9DX1RPS0VOCiAgY29uZmlnIENDX0hB
U19NVUxUSURJTUVOU0lPTkFMX05PTlNUUklORwogIAlkZWZfYm9vbCAkKHN1Y2Nlc3MsZWNobyAn
Y2hhciB0YWdbXVs0XSBfX2F0dHJpYnV0ZV9fKChfX25vbnN0cmluZ19fKSkgCj0geyB9OycgfCAk
KENDKSAkKENMQU5HX0ZMQUdTKSAteCBjIC0gLWMgLW8gL2Rldi9udWxsIC1XZXJyb3IpCgorY29u
ZmlnIENDX09QVF9JTkxJTkVfTUVNU0VUCisJc3RyaW5nCisJZGVmYXVsdCAiLWZpbmxpbmUtc3Ry
aW5nb3BzPW1lbXNldCIgaWYgCiQoY2Mtb3B0aW9uLC1maW5saW5lLXN0cmluZ29wcz1tZW1zZXQp
CisJZGVmYXVsdCAiLW1sbHZtIC1tYXgtc3RvcmUtbWVtc2V0PTQyOTQ5NjcyOTUiIGlmICQoY2Mt
b3B0aW9uLC1tbGx2bSAKLW1heC1zdG9yZS1tZW1zZXQ9NDI5NDk2NzI5NSkKKwogIGNvbmZpZyBM
RF9DQU5fVVNFX0tFRVBfSU5fT1ZFUkxBWQogIAkjIGxkLmxsZCBwcmlvciB0byAyMS4wLjAgZGlk
IG5vdCBzdXBwb3J0IEtFRVAgd2l0aGluIGFuIG92ZXJsYXkgCmRlc2NyaXB0aW9uCiAgCSMgaHR0
cHM6Ly9naXRodWIuY29tL2xsdm0vbGx2bS1wcm9qZWN0L3B1bGwvMTMwNjYxCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
