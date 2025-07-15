Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D2DC83F1D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 06:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVM8eNyYdBrtTXuhx0ebfaF02hMbUGhdCtnXPFCwZCs=; b=fjY2m3fRzJIitI
	aQYQRh3R5P75wcudMJ2ZTmaU3PHn5YCG1vzgNKvUkATeizLXBQ2wnxLRLsY8+VZAntpNLNoASHEAT
	fGB94Np7e1IPfpCtgLjHlZ6e4IRr2Z4NCsbnugkmxnW+EAxGOcbsWwsJY9gAg8Cd4E2D560+YqA5/
	96EXFyi/ydwcbuLmGG5aO0MOkxB188+AbN3hvxrAgi/rE8LHW6589KOtTsthd6kZsgGnudWkljo0r
	vwMbBAAwcCnx44UkdifySUbQrhdFKqsoatFTiojSIjF2NEPfye6XuyrIUHwhSSUop7iduh8SxMOJW
	5K/uw2hKXA+SiSf0SAzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYwP-00000004BgG-3itQ;
	Tue, 15 Jul 2025 06:15:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubYwN-00000004BfX-0Wtg
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 06:15:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3FBC5C5932
	for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 06:14:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76652C4AF09
	for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 06:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752560097;
	bh=Owz7HM3oZ/dUFgrktnlHBz6CNj/X+oEOtmCDPMuOjT4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cSdO84tYdLtG+FlYIuKqK7r4AwuUpv3rmu0o7TkRVMe3ikLUjOuGB6SPEp07TsJQ8
	 KJyGYWauB+WQ/qmAMZT/IuffEp1hAUcfGd/9Wz9G/HM6uzsUo3hJ3qmtgFdpRip6Do
	 0rdul+ZDuFAly9PEm5tUypBvXtk0mrCMXj9oiBIdyxKI8yERdPIyXiwL4sxJxsETLJ
	 /BFMNc5C+/QTkyqUGBBhIWmO7x0zDO/15IGcAu7lSslV3Ud1cODXF7NOP8DSSjN3Av
	 vGuPZqq4pwCw3UaN6ZEixbzwNdXQhr9qNVa4IsZGhoSAFeqEgf27aK32+kfLR3tMgK
	 Z+YU1wBM3JUOA==
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6f2c6715fso3987631f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 23:14:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXmfvWsLcd3lDQSu6Sh67qNszWaM+9NEDTkopx44L6JoJhOYzqjNWpwfIWkf063j09X2Xh0SDIwGp7hoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywc0iSx1POmP9aW5Ye8DTr8surcNS2Ux6thj+uA5ybBdbZDHtUP
	pCfxiuQZ0+9DcY87LJMdTzCJURFr3LyOVvSg6Q5BdB81GC7zErmgBszUJcy3jBPcxH9bvrffRnY
	XKe1ylY9i3uFzfVmV0nZp3eeZr5Pos1Q=
X-Google-Smtp-Source: AGHT+IHLfAgaTi5jei9UtO0v9WiiSwIuxKXHl6o/lUHfLdgZ2pE6gsJ3CXtYwTkcUEpV70z9QdrQgJYjU4F2IIogjXo=
X-Received: by 2002:a05:6000:4010:b0:3ab:27f9:e51 with SMTP id
 ffacd0b85a97d-3b5f2dfd9c8mr10772054f8f.31.1752560095918; Mon, 14 Jul 2025
 23:14:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250713155321.2064856-1-guoren@kernel.org> <20250713155321.2064856-3-guoren@kernel.org>
 <aHXEx2a0qgiPXhBS@x1>
In-Reply-To: <aHXEx2a0qgiPXhBS@x1>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 15 Jul 2025 14:14:44 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQBzX9A=AEAaH5SyxWfuNwkG6eichC1w1ryEqRMeuOokA@mail.gmail.com>
X-Gm-Features: Ac12FXxIgjnJ02Xc-z1bd0MQw47wfc1l9w9HznRLlP-75-MHvnNs5H3wYMz37-8
Message-ID: <CAJF2gTQBzX9A=AEAaH5SyxWfuNwkG6eichC1w1ryEqRMeuOokA@mail.gmail.com>
Subject: Re: [PATCH V2 2/2] riscv: errata: Add ERRATA_THEAD_WRITE_ONCE fixup
To: Drew Fustini <fustini@kernel.org>
Cc: palmer@dabbelt.com, conor@kernel.org, alexghiti@rivosinc.com, 
	paul.walmsley@sifive.com, bjorn@rivosinc.com, eobras@redhat.com, 
	corbet@lwn.net, peterlin@andestech.com, rabenda.cn@gmail.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Leonardo Bras <leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_231459_364023_52824F0E 
X-CRM114-Status: GOOD (  20.68  )
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

T24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMTE6MDLigK9BTSBEcmV3IEZ1c3RpbmkgPGZ1c3RpbmlA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIEp1bCAxMywgMjAyNSBhdCAxMTo1MzoyMUFN
IC0wNDAwLCBndW9yZW5Aa2VybmVsLm9yZyB3cm90ZToKPiA+IEZyb206ICJHdW8gUmVuIChBbGli
YWJhIERBTU8gQWNhZGVteSkiIDxndW9yZW5Aa2VybmVsLm9yZz4KPiA+Cj4gPiBUaGUgZWFybHkg
dmVyc2lvbiBvZiBYdWFuVGllIEM5MTAgY29yZSBoYXMgYSBzdG9yZSBtZXJnZSBidWZmZXIKPiA+
IGRlbGF5IHByb2JsZW0uIFRoZSBzdG9yZSBtZXJnZSBidWZmZXIgY291bGQgaW1wcm92ZSB0aGUg
c3RvcmUgcXVldWUKPiA+IHBlcmZvcm1hbmNlIGJ5IG1lcmdpbmcgbXVsdGktc3RvcmUgcmVxdWVz
dHMsIGJ1dCB3aGVuIHRoZXJlIGFyZSBub3QKPiA+IGNvbnRpbnVlZCBzdG9yZSByZXF1ZXN0cywg
dGhlIHByaW9yIHNpbmdsZSBzdG9yZSByZXF1ZXN0IHdvdWxkIGJlCj4gPiB3YWl0aW5nIGluIHRo
ZSBzdG9yZSBxdWV1ZSBmb3IgYSBsb25nIHRpbWUuIFRoYXQgd291bGQgY2F1c2UKPiA+IHNpZ25p
ZmljYW50IHByb2JsZW1zIGZvciBjb21tdW5pY2F0aW9uIGJldHdlZW4gbXVsdGktY29yZXMuIFRo
aXMKPiA+IHByb2JsZW0gd2FzIGZvdW5kIG9uIHNnMjA0MiAmIHRoMTUyMCBwbGF0Zm9ybXMgd2l0
aCB0aGUgcXNwaW5sb2NrCj4gPiBsb2NrIHRvcnR1cmUgdGVzdC4KPiA+Cj4gPiBTbyBhcHBlbmRp
bmcgYSBmZW5jZSB3Lm8gY291bGQgaW1tZWRpYXRlbHkgZmx1c2ggdGhlIHN0b3JlIG1lcmdlCj4g
PiBidWZmZXIgYW5kIGxldCBvdGhlciBjb3JlcyBzZWUgdGhlIHdyaXRlIHJlc3VsdC4KPiA+Cj4g
PiBUaGlzIHdpbGwgYXBwbHkgdGhlIFdSSVRFX09OQ0UgZXJyYXRhIHRvIGhhbmRsZSB0aGUgbm9u
LXN0YW5kYXJkCj4gPiBiZWhhdmlvciB2aWEgYXBwZW5kaW5nIGEgZmVuY2Ugdy5vIGluc3RydWN0
aW9uIGZvciBXUklURV9PTkNFKCkuCj4gPgo+ID4gVGhpcyBwcm9ibGVtIGlzIG9ubHkgb2JzZXJ2
ZWQgb24gdGhlIHNnMjA0MiBoYXJkd2FyZSBwbGF0Zm9ybSBieQo+ID4gcnVubmluZyB0aGUgbG9j
a190b3J0dXJlIHRlc3QgcHJvZ3JhbSBmb3IgaGFsZiBhbiBob3VyLiBUaGUgcHJvYmxlbQo+ID4g
d2FzIG5vdCBmb3VuZCBpbiB0aGUgdXNlciBzcGFjZSBhcHBsaWNhdGlvbiwgYmVjYXVzZSBpbnRl
cnJ1cHQgY2FuCj4gPiBicmVhayB0aGUgbGl2ZWxvY2suCj4KPiBUaGUgZmlyc3QgcGFyYWdyYXBo
IHN0YXRlcyB0aGUgcHJvYmxlbSB3YXMgZm91bmQgb24gYm90aCB0aGUgU0cyMDQyIGFuZAo+IFRI
MTUyMCwgYnV0IHRoaXMgcGFyYWdyYXBoIHN0YXRlcyBpdCBpcyBvbmx5IG9ic2VydmVkIG9uIHRo
ZSBTRzIwNDIuIElzCj4gd29ydGggbWUgdHJ5aW5nIHRvIHJ1biBsb2NrX3RvcnR1cmUgb24gdGhl
IFRIMTUyMCBmb3IgbWFueSBob3Vycz8KV2UgZGlkbid0IG9ic2VydmUgdGhhdCBwcm9ibGVtIG9u
IHRoZSAxNTIwIGR1ZSB0byBpdHMgc21hbGwgbnVtYmVyIG9mIGNvcmVzLgpCdXQsIHdlIHN0aWxs
IHJlY29tbWVuZCB0aGUgdGgxNTIwIGludm9sdmUgdGhpcyBwYXRjaCBmb3IgcG90ZW50aWFsIHdy
aXRlIGRlbGF5LgoKPgo+IFRoYW5rcywKPiBEcmV3CgoKCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
