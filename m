Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C4FEB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 16:38:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UctwxNDPf3grToE58w8CZW9BquK+FCEFxy1CVBjRkTY=; b=CPtvM7WQQotYaD
	wjrALR+87sFCAuQETXiPJCuow0cTKdr+ZjH+afHfHjgHHKjKN7CZciJddGffaMqnTmJbjrN5CspgR
	X+HHb2d1m3ebDh8yKTyx/LR8ulPapDdUTLM9VwYPKj5zDifhtQSrmn7IAhbMqG8pklto1RufFl6KX
	FneLUoS2AkzaVr5eypjGJLEnzFUsP99JTBvFHUl6cIxnAWYN/LI+0cB4UtGAhVODUmRENCh7rjokM
	Gl4eoK1deQMB7m7QRuBIzKldmLC9Code5I2s9PfYkUMlicILD+Pt4jLptOzeG0YNPENH9XXb28eQa
	CpP7VlmEQmQI413APJGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYwf-003v7a-0K;
	Sat, 17 Jun 2023 16:38:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAYwb-003v5I-13;
	Sat, 17 Jun 2023 16:38:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C7C116124D;
	Sat, 17 Jun 2023 16:38:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1161C433D9;
	Sat, 17 Jun 2023 16:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687019911;
	bh=wsV5PAOYMtSK534qTONYBGMJADMTf/thu6AVR5VKWFg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=q5TvC7wXcesBdrAtVwBAqlybicfQ3l31tWhe47gCHoheDPlgSrgt59SLSMZIhYDmm
	 jGSI/AbGdyvh5m2k3AnGCSYg1w5Ip7D6pqCyW2WpiRZOEAGiOwo2Hmd+1j6rAUprE/
	 b4HC/Njwt5Mk8bqvMnWE6kMHhKXtbhBU8/LPHAhQqUf6bNYjoID11JcNvnbHR/Wty1
	 Ci4aW7m3E0aYzqV5URi12B3tlQTJav9/V3UGVH6RUi6w1dQdJ06xsBzhXtuLm5kC4A
	 9lTOU3FN61E41TP3c36eHFu7PswdRbNKM83MrM077JEeujQ0StC2gBK9V8FMll8Kgo
	 IyVxt6UshhCrg==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-4f7deee339dso2324210e87.0;
        Sat, 17 Jun 2023 09:38:31 -0700 (PDT)
X-Gm-Message-State: AC+VfDyZssAX5Hbt1jB5RhlWZ53v0gx3x3LqYsaKV/rvOgVtMuGsyR5i
	WM3UVg9Ie9JCaiy4pOwtFDVLUE5KC3nxWOGg3i4=
X-Google-Smtp-Source: ACHHUZ7/x1kYUhYXMtUENPjhDtD48HKOo5oy2K5VqpfigImzwjTDz7CrLzlDpzPNd4SA2zOD7D4teoP7FVQzMuuaU40=
X-Received: by 2002:ac2:5bd1:0:b0:4eb:42b7:8c18 with SMTP id
 u17-20020ac25bd1000000b004eb42b78c18mr3005243lfn.53.1687019909491; Sat, 17
 Jun 2023 09:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20230616085038.4121892-1-rppt@kernel.org> <20230616085038.4121892-8-rppt@kernel.org>
 <CAPhsuW6BG2oVrGDOpCKyOEvU9fBOboYYhducv96KUBe276Mvng@mail.gmail.com>
 <20230617065759.GT52412@kernel.org> <ZI3TGhJ2y5SBWmnA@moria.home.lan>
In-Reply-To: <ZI3TGhJ2y5SBWmnA@moria.home.lan>
From: Song Liu <song@kernel.org>
Date: Sat, 17 Jun 2023 09:38:17 -0700
X-Gmail-Original-Message-ID: <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
Message-ID: <CAPhsuW4KDriCDfQ40MKKQ3AjyeRbEUJxjqoBLipe5AJMxY3U-w@mail.gmail.com>
Subject: Re: [PATCH v2 07/12] arm64, execmem: extend execmem_params for
 generated code definitions
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "David S. Miller" <davem@davemloft.net>, 
	Dinh Nguyen <dinguyen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Puranjay Mohan <puranjay12@gmail.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Russell King <linux@armlinux.org.uk>, 
	Steven Rostedt <rostedt@goodmis.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-mm@kvack.org, linux-modules@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_093833_464506_B4A7D917 
X-CRM114-Status: GOOD (  24.05  )
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

T24gU2F0LCBKdW4gMTcsIDIwMjMgYXQgODozN+KAr0FNIEtlbnQgT3ZlcnN0cmVldAo8a2VudC5v
dmVyc3RyZWV0QGxpbnV4LmRldj4gd3JvdGU6Cj4KPiBPbiBTYXQsIEp1biAxNywgMjAyMyBhdCAw
OTo1Nzo1OUFNICswMzAwLCBNaWtlIFJhcG9wb3J0IHdyb3RlOgo+ID4gPiBUaGlzIGlzIGdyb3dp
bmcgZmFzdC4gOikgV2UgaGF2ZSAzIG5vdzogdGV4dCwgZGF0YSwgaml0LiBBbmQgaXQgd2lsbCBi
ZQo+ID4gPiA1IHdoZW4gd2Ugc3BsaXQgZGF0YSBpbnRvIHJ3IGRhdGEsIHJvIGRhdGEsIHJvIGFm
dGVyIGluaXQgZGF0YS4gSSB3b25kZXIKPiA+ID4gd2hldGhlciB3ZSBzaG91bGQgc3RpbGwgZG8g
c29tZSB0eXBlIGVudW0gaGVyZS4gQnV0IHdlIGNhbiByZXZpc2l0Cj4gPiA+IHRoaXMgdG9waWMg
bGF0ZXIuCj4gPgo+ID4gSSBkb24ndCB0aGluayB3ZSdkIG5lZWQgNS4gRm91ciBhdCBtb3N0IDop
Cj4gPgo+ID4gSSBkb24ndCBrbm93IHlldCB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0byBk
aWZmZXJlbnRpYXRlIFJXIGFuZCBSTwo+ID4gZGF0YSwgYnV0IHJvX2FmdGVyX2luaXQgc3VyZWx5
IHdvbid0IG5lZWQgYSBuZXcgdHlwZS4gSXQgZWl0aGVyIHdpbGwgYmUKPiA+IGFsbG9jYXRlZCBh
cyBSVyBhbmQgdGhlbiB0aGUgY2FsbGVyIHdpbGwgaGF2ZSB0byBzZXQgaXQgUk8gYWZ0ZXIKPiA+
IGluaXRpYWxpemF0aW9uIGlzIGRvbmUsIG9yIGl0IHdpbGwgYmUgYWxsb2NhdGVkIGFzIFJPIGFu
ZCB0aGUgY2FsbGVyIHdpbGwKPiA+IGhhdmUgdG8gZG8gc29tZXRoaW5nIGxpa2UgdGV4dF9wb2tl
IHRvIHVwZGF0ZSBpdC4KPgo+IFBlcmhhcHMgcm9fYWZ0ZXJfaW5pdCBjb3VsZCB1c2UgdGhlIHNh
bWUgYWxsb2NhdGlvbiBpbnRlcmZhY2UgYW5kIHNoYXJlCj4gcGFnZXMgd2l0aCBybyBwYWdlcyAt
IGlmIHdlIGp1c3QgYWRkZWQgYSByZWZjb3VudCBmb3IgInRoaXMgcGFnZQo+IGN1cnJlbnRseSBu
ZWVkcyB0byBiZSBydywgbW9kdWxlIGlzIHN0aWxsIGxvYWRpbmc/IgoKSWYgd2UgZG9uJ3QgcmVs
YXggcnVsZXMgd2l0aCByZWFkIG9ubHksIHdlIHdpbGwgaGF2ZSB0byBzZXBhcmF0ZSBydywgcm8s
CmFuZCByb19hZnRlcl9pbml0LiBCdXQgd2UgY2FuIHN0aWxsIGhhdmUgcGFnZSBzaGFyaW5nOgoK
VHdvIG1vZHVsZXMgY2FuIHB1dCBydyBkYXRhIG9uIHRoZSBzYW1lIHBhZ2UuCldpdGggdGV4dCBw
b2tlIChybyBkYXRhIHBva2UgdG8gYmUgYWNjdXJhdGUpLCB0d28gbW9kdWxlcyBjYW4gcHV0CnJv
IGRhdGEgb24gdGhlIHNhbWUgcGFnZS4KCj4gdGV4dF9wb2tlKCkgYXBwcm9hY2ggd291bGRuJ3Qg
YmUgd29ya2FibGUsIHlvdSdkIGhhdmUgdG8gYXVkaXQgYW5kIGZpeAo+IGFsbCBtb2R1bGUgaW5p
dCBjb2RlIGluIHRoZSBlbnRpcmUga2VybmVsLgoKQWdyZWVkLiBGb3IgdGhpcyByZWFzb24sIGVh
Y2ggbW9kdWxlIGhhcyB0byBoYXZlIGl0cyBvd24gcGFnZShzKSBmb3IKcm9fYWZ0ZXJfaW5pdCBk
YXRhLgoKVG8gZXZlbnR1YWxseSByZW1vdmUgVk1fRkxVU0hfUkVTRVRfUEVSTVMsIHdlIHdhbnQK
cm9fYWZ0ZXJfaW5pdCBkYXRhIHRvIHNoYXJlIHRoZSBzYW1lIGFsbG9jYXRpb24gaW50ZXJmYWNl
LgoKVGhhbmtzLApTb25nCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
