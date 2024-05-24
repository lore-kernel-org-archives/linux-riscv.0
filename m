Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6844C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 24 May 2024 05:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uLppC0rrlryInKjBIaCy5dvDjsXNB6rtJ7HcibWlrIk=; b=mT2HwzeDqqUU5b
	rhqYdg9ej5jM8QZ+w3oZa/8TgoTGaBWcJnMgE+BG32ioMlVnI18zbl74M/ny69jOtjngspzv2GGrJ
	zsveRz5c97vTBG+gNgIRSF8I8qCJEoGEv7srn7Ulxo098gaZrQGREoEdf9gklmW1BbSPqDQfSgf0l
	YagZWQBMM2vU4GM4zPbAw+kB8Gm0VFvLZQ9awVerFs2zDrf6yUPANUbyRYyGA3r7F5cJvI7LV9usv
	GPsCQB/BDZ8rUlzcDyTTxnpgTfzH9Tqgdso9OlMxvtiDRBG6eKQ2qkMjl33bhMOqrY8ck8l8RJTsn
	FT0Xmi8VfsYhko68kaxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAN9W-000000084ln-3phJ;
	Fri, 24 May 2024 05:07:39 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAN9S-000000084l9-1SbQ
	for linux-riscv@lists.infradead.org;
	Fri, 24 May 2024 05:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8141DCE185F
	for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 05:07:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB4CFC2BBFC
	for <linux-riscv@lists.infradead.org>; Fri, 24 May 2024 05:07:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716527250;
	bh=GK/V1QQD57TCm3aTnWvaZuyMKv97lo7ihqyFiCTHVH4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gHdzqMoiSBchjJmRSkLxFuJtEiotCsSp2EIXu9kE5gAoC+S6+4Go6/E3h98uTVSTM
	 R88wlrSL1ztQE+JuAjTVYxkTGLcGs9U4q4a4+3h0C5MOgTkSEsdxzo8u5/AE/Ikb4T
	 KTJO+tmLc/ZI7rtbNBoAJUZ1c4UW8enqYyO6xGb6Xd5o0AEcyPHuOGS8aWK8wlkzpF
	 LMBZNCHEyYgW1ux1w2s2VhPOHXVLPvq0D8iHpEIBnZeAz5TeM3RYaYHhixnC0RCwWG
	 IhLWzsgvHYKRRxnrs7iHuiNi5RGlsYuHrNbVE+2w2PG9CPYr6ZGTeuDFeJFSLkif09
	 SgSy32yLEumig==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52388d9ca98so12734830e87.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 22:07:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXacvCVNNsyOQOaRWMxGDm+c0O7y7Yt9NzaRuCEEDvRBld1EcUaJgS+5YzofmJ3BAvL+6bvevYYRQZIPktVqAfpHl5aqXYCckmfX2ZN5WuM
X-Gm-Message-State: AOJu0YxOCfUSnfyja9GCO8EYGBhEQ2TdWKngKGXc40i/pUBZG7GI1Xj6
	yryHSli7Nrs6Y5/BK9m3ovhcPTKNFK8N2wtvYpKSnpFWxbpmepaK6tIexWT9w+TTeLcbbTNLCmO
	6ml4C/pFmRy2OvhmLE6KEO4E7Q6g=
X-Google-Smtp-Source: AGHT+IF5borjWS+EoVCFZTJVzvu0BFneN5NQLU0c+j27aNCmdIZ7uUmDcRXXzgAMVGog9KLMwYcDyxgy90AjZfUKuWQ=
X-Received: by 2002:a19:910a:0:b0:51f:2a80:a982 with SMTP id
 2adb3069b0e04-5296736bb70mr619521e87.47.1716527249327; Thu, 23 May 2024
 22:07:29 -0700 (PDT)
MIME-Version: 1.0
References: <mhng-e73e59bf-92fc-4122-9f9e-a329d20eba55@palmer-ri-x1c9>
 <CAK7LNASVhbtJ2=72TsCu1C7+uLsXySNffPcNZU2NiFKitM6-Ew@mail.gmail.com> <87ed9s3fjg.fsf@mail.lhotse>
In-Reply-To: <87ed9s3fjg.fsf@mail.lhotse>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 24 May 2024 14:06:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQbHVR2r1YdWCiTg+Tp29uJZyZv2nghFsrUoKszFP-UdQ@mail.gmail.com>
Message-ID: <CAK7LNAQbHVR2r1YdWCiTg+Tp29uJZyZv2nghFsrUoKszFP-UdQ@mail.gmail.com>
Subject: Re: [GIT PULL] RISC-V Patches for the 6.10 Merge Window, Part 1
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Linus Torvalds <torvalds@linux-foundation.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_220734_793897_F7241E0F 
X-CRM114-Status: GOOD (  18.53  )
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

T24gVGh1LCBNYXkgMjMsIDIwMjQgYXQgODo1OeKAr1BNIE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBl
bGxlcm1hbi5pZC5hdT4gd3JvdGU6Cj4KPiBNYXNhaGlybyBZYW1hZGEgPG1hc2FoaXJveUBrZXJu
ZWwub3JnPiB3cml0ZXM6Cj4gPiBPbiBUaHUsIE1heSAyMywgMjAyNCBhdCAxOjEz4oCvQU0gUGFs
bWVyIERhYmJlbHQgPHBhbG1lckByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4+Cj4gPj4gVGhlIGZv
bGxvd2luZyBjaGFuZ2VzIHNpbmNlIGNvbW1pdCA0Y2VjZTc2NDk2NTAyMGMyMmNmZjc2NjViMThh
MDEyMDA2MzU5MDk1Ogo+ID4+Cj4gPj4gICBMaW51eCA2LjktcmMxICgyMDI0LTAzLTI0IDE0OjEw
OjA1IC0wNzAwKQo+ID4+Cj4gPj4gYXJlIGF2YWlsYWJsZSBpbiB0aGUgR2l0IHJlcG9zaXRvcnkg
YXQ6Cj4gPj4KPiA+PiAgIGdpdDovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVs
L2dpdC9yaXNjdi9saW51eC5naXQgdGFncy9yaXNjdi1mb3ItbGludXMtNi4xMC1tdzEKPiA+Pgo+
ID4+IGZvciB5b3UgdG8gZmV0Y2ggY2hhbmdlcyB1cCB0byA5MmNjZTkxOTQ5YTQ5N2E4YTQ2MTVm
OWJhNTgxM2IwM2Y3YTFmMWQ1Ogo+ID4+Cj4gPj4gICByaXNjdjogZGVmY29uZmlnOiBFbmFibGUg
Q09ORklHX0NMS19TT1BIR09fQ1YxODAwICgyMDI0LTA1LTEzIDE0OjI2OjM0IC0wNzAwKQo+IC4u
Cj4gPj4KPiA+PiBNYXNhaGlybyBZYW1hZGEgKDIpOgo+ID4+ICAgICAgIHJpc2N2OiBtZXJnZSB0
d28gaWYtYmxvY2tzIGZvciBLQlVJTERfSU1BR0UKPiA+PiAgICAgICBleHBvcnQuaDogcmVtb3Zl
IGluY2x1ZGUvYXNtLWdlbmVyaWMvZXhwb3J0LmgKPiA+Cj4gPgo+ID4gSSBhbSBjb25mdXNlZC4K
PiA+Cj4gPgo+ID4gVGhpcyBjb21taXQgd2FzIGFwcGxpZWQgdHdvIG1vbnRocyBhZ28gYnkgbXlz
ZWxmLAo+ID4gYW5kIGl0IGFscmVhZHkgZXhpc3RlZCBpbiB0aGUgbWFpbmxpbmUuCj4gPgo+ID4K
PiA+IEFmdGVyIHRoaXMgcHVsbCByZXF1ZXN0LCBJIGRvIG5vdCBzZWUgbm8gc3VjaCBhIGNvbW1p
dAo+ID4gYXBwbGllZCBieSBQYWxtZXIuCj4KPiBJdCBpcyBpbiB0aGVyZToKPgo+ICQgZ2l0IGxv
ZyAtLXByZXR0eT1mdWxsZXIgLTEgMzZkMzdmMTFmNTU1ODEyYjBkZWQ1ZDE1YWE2ODZhNmI5ZGE1
N2Y2MQo+IGNvbW1pdCAzNmQzN2YxMWY1NTU4MTJiMGRlZDVkMTVhYTY4NmE2YjlkYTU3ZjYxCj4g
QXV0aG9yOiAgICAgTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4KPiBBdXRo
b3JEYXRlOiBTYXQgTWFyIDIzIDE4OjA2OjE1IDIwMjQgKzA5MDAKPiBDb21taXQ6ICAgICBQYWxt
ZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5jLmNvbT4KPiBDb21taXREYXRlOiBXZWQgTWFyIDI3
IDA3OjE0OjE5IDIwMjQgLTA3MDAKPgo+ICAgICBleHBvcnQuaDogcmVtb3ZlIGluY2x1ZGUvYXNt
LWdlbmVyaWMvZXhwb3J0LmgKPgo+ICAgICBDb21taXQgM2E2ZGQ1ZjYxNGExICgicmlzY3Y6IHJl
bW92ZSB1bm5lZWRlZCAjaW5jbHVkZQo+ICAgICA8YXNtLWdlbmVyaWMvZXhwb3J0Lmg+IikgcmVt
b3ZlZCB0aGUgbGFzdCB1c2Ugb2YKPiAgICAgaW5jbHVkZS9hc20tZ2VuZXJpYy9leHBvcnQuaC4K
Pgo+ICAgICBUaGlzIGRlcHJlY2F0ZWQgaGVhZGVyIGNhbiBnbyBhd2F5Lgo+Cj4gICAgIFNpZ25l
ZC1vZmYtYnk6IE1hc2FoaXJvIFlhbWFkYSA8bWFzYWhpcm95QGtlcm5lbC5vcmc+Cj4gICAgIExp
bms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDAzMjMwOTA2MTUuMTI0NDkwNC0xLW1h
c2FoaXJveUBrZXJuZWwub3JnCj4gICAgIFNpZ25lZC1vZmYtYnk6IFBhbG1lciBEYWJiZWx0IDxw
YWxtZXJAcml2b3NpbmMuY29tPgo+Cj4gT3IgdmlhOgo+Cj4gJCBnaXQgbG9nIC0tb25lbGluZSAt
MiA5MmNjZTkxOTQ5YTQ5N2E4YTQ2MTVmOWJhNTgxM2IwM2Y3YTFmMWQ1IG9yaWdpbi9tYXN0ZXIg
LS0gaW5jbHVkZS9hc20tZ2VuZXJpYy9leHBvcnQuaAo+IDAzMTZlNGIwNGUwMSBleHBvcnQuaDog
cmVtb3ZlIGluY2x1ZGUvYXNtLWdlbmVyaWMvZXhwb3J0LmgKPiAzNmQzN2YxMWY1NTUgZXhwb3J0
Lmg6IHJlbW92ZSBpbmNsdWRlL2FzbS1nZW5lcmljL2V4cG9ydC5oCj4KPiBjaGVlcnMKPgoKCgpP
SywgdGhhbmtzLgpJIHRoaW5rIEkgd2FzIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGVmZmVjdCBvZiAi
Z2l0IGxvZyAtLSA8cGF0aD4iCgoKV2hlbiAiLS0gaW5jbHVkZS9hc20tZ2VuZXJpYyIgaXMgcGFz
c2VkLCAzNmQzN2YxMWY1NTUgaXMgaGlkZGVuLgoKCiQgZ2l0IGxvZyAtLW9uZWxpbmUgLS1hdXRo
b3I9TWFzYWhpcm8gfCBncmVwIGluY2x1ZGUvYXNtLWdlbmVyaWMvZXhwb3J0LmgKMDMxNmU0YjA0
ZTAxIGV4cG9ydC5oOiByZW1vdmUgaW5jbHVkZS9hc20tZ2VuZXJpYy9leHBvcnQuaAozNmQzN2Yx
MWY1NTUgZXhwb3J0Lmg6IHJlbW92ZSBpbmNsdWRlL2FzbS1nZW5lcmljL2V4cG9ydC5oCgoKJCBn
aXQgbG9nIC0tb25lbGluZSAtLWF1dGhvcj1NYXNhaGlybyAtLSBpbmNsdWRlL2FzbS1nZW5lcmlj
LyB8IGdyZXAKaW5jbHVkZS9hc20tZ2VuZXJpYy9leHBvcnQuaAowMzE2ZTRiMDRlMDEgZXhwb3J0
Lmg6IHJlbW92ZSBpbmNsdWRlL2FzbS1nZW5lcmljL2V4cG9ydC5oCgoKCiJtYW4gZ2l0LWxvZyIg
ZXhwbGFpbnMgd2h5OgoKCjxwYXRoPi4uLgogIFNob3cgb25seSBjb21taXRzIHRoYXQgYXJlIGVu
b3VnaCB0byBleHBsYWluIGhvdyB0aGUgZmlsZXMgdGhhdCBtYXRjaCB0aGUKICBzcGVjaWZpZWQg
cGF0aHMgY2FtZSB0byBiZS4gU2VlIEhpc3RvcnkgU2ltcGxpZmljYXRpb24gYmVsb3cgZm9yIGRl
dGFpbHMKICBhbmQgb3RoZXIgc2ltcGxpZmljYXRpb24gbW9kZXMuCgoKCi0tIApCZXN0IFJlZ2Fy
ZHMKTWFzYWhpcm8gWWFtYWRhCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
