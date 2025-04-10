Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89456C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B1NR9IWzY2b4LtxGtMgo31MXp8TC5ENtP5gqE4dRjfc=; b=u6MTA6SHf09Zw6
	g239lzwdNYkR6NDaZgMUuZktI8HZTAA7u626KkABklaH7kH5/SiyRWI/xidHXguQrvjn3f4rfzuF6
	d/eXm8Yvi4IGh+7EzJ/dkFTlG4G308bIUKmSKlyYskp75MCHpCcUVof0oQlHGfon8nM2diqemvw2j
	7+7cAzxW3SBNHnl475DWpl1XRLGBrOmmsP1mgIMRCBCi8IGOqr5+xscIMlYkAAojOWSAVyhC0a5g8
	SVoQ09X9A3BOd+kH2v5aerQ4x3l/S6v5uzcoUOI3QFVfqX5H+Y9Dosqf9ONIk9L1UvWpWrEA3ey74
	2AILM1BbMxvRUinEYMGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2whR-0000000BXLj-3reI;
	Thu, 10 Apr 2025 18:32:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2whP-0000000BXJD-0zUc
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 18:32:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33C815C059C
	for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 18:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F30C4CEEA
	for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744309943;
	bh=rhq98F1oAt15i089HgDHKF8FTORTwBNqnGhkaUMvkGE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AulYPUUGsOPhwa+Kt6zt/bF4SQ+MXk286rhsVsmpe2mlfpPgF70lZBTSnsR5ntMwT
	 ZkZ1ToXf/gNg5d0kTQ3LaxQHhZ/OV8AyMKmXZAXIySY6/dt80IAZs/Dq4S7TCaD1RG
	 oibILCU7xUCwRzh85baDrWOsnoswhPJvtEXC2U0GJngapQVeRRPBUuBcfovgE7X6WP
	 xWeGG90XHGWZ76vzkeD0FhF3cQxYlBMQnGKXJx+X4Gs55Pqxu6zXwRTUYNyNRPLgrp
	 AKAEj6NwSrvd65oWn/btbRNM+RkN6o/0/d3P2d3KfgpG9Ra5zNqi63peDg7+DHZKtA
	 fZfxddu2IO8/Q==
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30beedb99c9so9391511fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 10 Apr 2025 11:32:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmapNsWhYc7sfATuftwkoq5UBY1km2m5B566ckbJtQ6ic4i4t7bLfKPd9URtj1/1S73jCKoYZ+svljAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxdqkGU2r2G31JoVZYjfzDPy9s00fRGoBlN8YGvud9yPxTGxtJG
	+Zq3qjlcq/q6D9fvSV7jIQxWX9R3CWI0luK2VG0Yz+8TwZRKeDNuovLoQh8PGBApV+FBSoTSDjT
	4kSI/7FmJMbR3rbu2SHeGmSh3nfc=
X-Google-Smtp-Source: AGHT+IGGRB7Ex6YVXi0NvNO+40T2HkvRuSGCeSMU/GnQkY0sfugEXhoQVsAzbBNrtu6Y5hVIAnWVcOlNqjOfW1Ob5aU=
X-Received: by 2002:a05:651c:2118:b0:30b:cb10:3a20 with SMTP id
 38308e7fff4ca-30faccb2938mr17777751fa.32.1744309940933; Thu, 10 Apr 2025
 11:32:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250403134200.385077-1-alexghiti@rivosinc.com>
 <CAMj1kXGzrn6i20LvUBnz_mGi946=GCogNHHUL=mNsv513qYv7A@mail.gmail.com>
 <2874fc20-9135-4b13-b825-43fb350ce552@ghiti.fr> <CAK7LNAT5sDhh1v3U2xUuVnrbhNXp3SJ_ngxSqAgwmZL0E2QGpA@mail.gmail.com>
 <CAHVXubgZ+Dwx70vU03R9MZ7BjkzbdR21y-Ort6pBngFmFYs-uw@mail.gmail.com> <e760a42c-1147-4fe8-9c65-6c4919f15fff@ghiti.fr>
In-Reply-To: <e760a42c-1147-4fe8-9c65-6c4919f15fff@ghiti.fr>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 11 Apr 2025 03:31:44 +0900
X-Gmail-Original-Message-ID: <CAK7LNATik6YPYZ5H2n9NXcG=WP3ThvCHpN=azAULmvUEMs5R3A@mail.gmail.com>
X-Gm-Features: ATxdqUFhBy0hx4SI9K9tecnkTRNiTM5aHBLCMene6OVtrID6RDX8fCW86LYQ_CA
Message-ID: <CAK7LNATik6YPYZ5H2n9NXcG=WP3ThvCHpN=azAULmvUEMs5R3A@mail.gmail.com>
Subject: Re: [PATCH v2] scripts: Do not strip .rela.dyn section
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
	Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_113227_363565_B377B5E1 
X-CRM114-Status: GOOD (  30.45  )
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

T24gTW9uLCBBcHIgNywgMjAyNSBhdCA1OjQz4oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4QGdo
aXRpLmZyPiB3cm90ZToKPgo+Cj4gT24gMDcvMDQvMjAyNSAxMDoxNSwgQWxleGFuZHJlIEdoaXRp
IHdyb3RlOgo+ID4gSGkgTWFzYWhpcm8sCj4gPgo+ID4gT24gRnJpLCBBcHIgNCwgMjAyNSBhdCA1
OjI14oCvUE0gTWFzYWhpcm8gWWFtYWRhIDxtYXNhaGlyb3lAa2VybmVsLm9yZz4gd3JvdGU6Cj4g
Pj4gT24gRnJpLCBBcHIgNCwgMjAyNSBhdCAxMjo0NeKAr0FNIEFsZXhhbmRyZSBHaGl0aSA8YWxl
eEBnaGl0aS5mcj4gd3JvdGU6Cj4gPj4+IEhpIEFyZCwKPiA+Pj4KPiA+Pj4gT24gMDMvMDQvMjAy
NSAxNzoxMSwgQXJkIEJpZXNoZXV2ZWwgd3JvdGU6Cj4gPj4+PiBPbiBUaHUsIDMgQXByIDIwMjUg
YXQgMTY6NDIsIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4gd3JvdGU6
Cj4gPj4+Pj4gcmlzY3YgdXNlcyB0aGUgLnJlbGEuZHluIHNlY3Rpb24gdG8gcmVsb2NhdGUgdGhl
IGtlcm5lbCBhdCBydW50aW1lIGJ1dAo+ID4+Pj4+IHRoYXQgc2VjdGlvbiBpcyBzdHJpcHBlZCBm
cm9tIHZtbGludXguIFRoYXQgcHJldmVudHMga2V4ZWMgdG8KPiA+Pj4+PiBzdWNjZXNzZnVsbHkg
bG9hZCB2bWxpbnV4IHNpbmNlIGl0IGRvZXMgbm90IGNvbnRhaW4gdGhlIHJlbG9jYXRpb25zIGlu
Zm8KPiA+Pj4+PiBuZWVkZWQuCj4gPj4+Pj4KPiA+Pj4+IE1heWJlIGV4cGxhaW4gdGhhdCAucmVs
YS5keW4gY29udGFpbnMgcnVudGltZSByZWxvY2F0aW9ucywgd2hpY2ggYXJlCj4gPj4+PiBvbmx5
IGVtaXR0ZWQgaWYgdGhleSBhcmUgYWN0dWFsbHkgbmVlZGVkIC0gYXMgb3Bwb3NlZCB0byB0aGUg
c3RhdGljCj4gPj4+PiByZWxvY2F0aW9ucyB0aGF0IGFyZSBub3QgZW1pdHRlZCBhcyBTSEZfQUxM
T0Mgc2VjdGlvbnMsIGFuZCBhcmUgbm90Cj4gPj4+PiBjb25zaWRlcmVkIHRvIGJlIHBhcnQgb2Yg
dGhlIHJ1bnRpbWUgaW1hZ2UgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4+Pgo+ID4+PiBPayBJJ2xs
IGRvLgo+ID4+Pgo+ID4+Pgo+ID4+Pj4gSXQKPiA+Pj4+IHdvdWxkIGJlIG5pY2UgaWYgd2UgY291
bGQgdXNlIC0tcmVtb3ZlLXJlbG9jYXRpb25zPSBoZXJlLCB3aGljaCBvbmx5Cj4gPj4+PiByZW1v
dmVzIHN0YXRpYyByZWxvY2F0aW9ucywgYnV0IHVuZm9ydHVuYXRlbHksIGxsdm0tb2JqY29weSBk
b2VzIG5vdAo+ID4+Pj4gc3VwcG9ydCB0aGlzLgo+ID4+Pj4KPiA+Pj4+IEFsc28sIEkgd29uZGVy
IGlmIHRoaXMgc2hvdWxkIGFwcGx5IHRvIGFsbCBvZiAucmVsLmR5biwgLnJlbGEuZHluIGFuZAo+
ID4+Pj4gLnJlbHIuZHluLCBhcyB0aGV5IGFsbCBjYXJyeSBydW50aW1lIHJlbG9jYXRpb25zLgo+
ID4+Pgo+ID4+PiBPaywgSSdsbCBhZGQgdGhlbSB0byB0aGUgbmV4dCB2ZXJzaW9uLgo+ID4+Pgo+
ID4+Pgo+ID4+Pj4gRmluYWxseSwgSSdkIGJlIGN1cmlvdXMgdG8ga25vdyB3aHkgUklTQy1WIHJl
bGllcyBvbiAtLWVtaXQtcmVsb2NzIGluCj4gPj4+PiB0aGUgZmlyc3QgcGxhY2U/IElzIHRoZSBy
ZWxvY3MgY2hlY2sgcmVhbGx5IG5lZWRlZD8gSWYgbm90LCBpdCB3b3VsZAo+ID4+Pj4gYmUgYSBu
aWNlIG9wcG9ydHVuaXR5IHRvIGdldCByaWQgb2YgTWFrZWZpbGUucG9zdGxpbmsgZW50aXJlbHku
Cj4gPj4+Cj4gPj4+IFNvIEkgaGFkIHRvIGNoZWNrIGFuZCBpdCBoYXBwZW5zIHRoYXQgdGhpcyB3
YXMgYW4gaXNzdWUgd2l0aCB0aGUKPiA+Pj4gdG9vbGNoYWluLCBJIHNob3VsZCBjaGVjayBpZiB0
aGF0IHN0aWxsIGhhcHBlbnMgd2l0aCBuZXdlciBvbmVzLgo+ID4+Pgo+ID4+PiBjb21taXQgNTU5
ZDFlNDVhMTZkY2YxNTQyZTQzMGVhM2RjZTlhYjYyNWJlOThkMAo+ID4+PiBBdXRob3I6IEFsZXhh
bmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9zaW5jLmNvbT4KPiA+Pj4gRGF0ZTogICBXZWQgTWFy
IDI5IDA2OjUzOjI5IDIwMjMgKzAyMDAKPiA+Pj4KPiA+Pj4gICAgICAgcmlzY3Y6IFVzZSAtLWVt
aXQtcmVsb2NzIGluIG9yZGVyIHRvIG1vdmUgLnJlbGEuZHluIGluIGluaXQKPiA+Pgo+ID4+Cj4g
Pj4KPiA+PiBTbywKPiA+Pgo+ID4+IEZpeGVzOiA1NTlkMWU0NWExNmQgKCJyaXNjdjogVXNlIC0t
ZW1pdC1yZWxvY3MgaW4gb3JkZXIgdG8gbW92ZQo+ID4+IC5yZWxhLmR5biBpbiBpbml0IikKPiA+
Pgo+ID4+IElzIHRoaXMgdGhlIGNvcnJlY3QgdGFnPwo+ID4gVGhpcyBpcyB0aGUgaW5pdGlhbCBj
dWxwcml0IHllcywgYnV0IGlmIHdlIHVzZSB0aGlzIHRhZywgdGhlIGZpeCB3b24ndAo+ID4gYXBw
bHkuIFNvIEkgZGVjaWRlZCB0byBwaWNrIEFyZCdzIHBhdGNoIHNvIHRoYXQgdGhpcyBmaXggY2Fu
IGJlIGVhc2lseQo+ID4gYmFja3BvcnRlZCB0byA2LjE0LCBhbmQgSSdsbCBjb21lIHVwIHdpdGgg
YSBuZXcgdmVyc2lvbiBmb3IgcHJldmlvdXMKPiA+IHJlbGVhc2VzLiBJcyB0aGF0IG9rIHdpdGgg
eW91Pwo+Cj4KPiBBbmQgSSBoYXZlIGp1c3QgbG9va2VkIGF0IDYuMTUtcmMxIGFuZCBub3RpY2Vk
IHRoYXQgdGhlIHJlbG9jYXRpb24KPiBzdHJpcHBpbmcgd2FzIG1vdmVkIHRvIE1ha2VmaWxlLnZt
bGludXgsIHNvIHRoaXMgZml4IHdvbid0IGFwcGx5IHRvIDYuMTQKPiBuZWl0aGVyLgo+Cj4gSSds
bCB0aGVuIHVzZSB0aGUgaW5pdGlhbCBjdWxwcml0LCB3aGljaCBpcyBGaXhlczogNTU5ZDFlNDVh
MTZkICgicmlzY3Y6Cj4gVXNlIC0tZW1pdC1yZWxvY3MgaW4gb3JkZXIgdG8gbW92ZS5yZWxhLmR5
biBpbiBpbml0IikuCj4KPiBTb3JyeSBmb3IgdGhlIG5vaXNlLAoKWW91IGRvIG5vdCBuZWVkIHRv
IHdvcnJ5IGFib3V0IHdoZXRoZXIgdGhpcyBjb21taXQgY2FuIGJlIGNsZWFubHkKYmFjay1wb3J0
ZWQgdG8gdGhlIHN0YWJsZSBrZXJuZWxzIG9yIG5vdC4KCklmIHRoZSBmaXggY2xlYW5seSBhcHBs
aWVzLCB0aGUgcHJvY2VzcyBzaG91bGQgYmUgZWFzeSAoYW5kIGFsbW9zdCBhdXRvbWF0aWMpLgoK
SWYgbm90LCB3ZSBjYW4gbW9kaWZ5IHRoZSBwYXRjaCBjb250ZXh0IGFuZCBzdWJtaXQgdG8gdGhl
IHN0YWJsZSBNTC4KVGhpcyBuZWVkcyBtYW51YWwgbW9kaWZpY2F0aW9uLCBidXQgaXMgc3RpbGwg
cG9zc2libGUuCgoKLS0gCkJlc3QgUmVnYXJkcwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
