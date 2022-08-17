Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 362D5C25B08
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Aug 2022 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrsxqI7tvowDIq2Ui4+HrQ9pUm9I85IKgTaklQV2tuM=; b=KxVQlwXxI2Fytw
	SN6rZ3nr0CQqUJyZTpNc8Rqp781DkLHoGaKvZkUVXcCz8Cgx9oyzYUbY5SfGMGW7bxKAcBvSYTz45
	nn5HueShQzGrGIyCZWfRRHzYafxJRvpglXEo4rg6BS4bzc1VLVHxwtL+3kBjSS0RE5uOlyqckBmT4
	Vi24J0Q9+ajU7RJXlIqafu4ACxkdsz67/tkP/6I7KfFbChRScZX/j8cGBtblIUloWGdymP33sAWAN
	CjHbACx6+8MfzjmH1t5bGsU96SNhTUwynwh4KhojpLIHfq9ihcafZfE4qo/KMavExfsBcEKADpdvJ
	6ps0KIZxLltnHUCqyDiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oORkU-007u54-EE; Wed, 17 Aug 2022 22:42:54 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oORkR-007u2t-FH; Wed, 17 Aug 2022 22:42:53 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-f2a4c51c45so16780859fac.9;
        Wed, 17 Aug 2022 15:42:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc;
        bh=vJ56H4HHvdOEMXdVFBYNUPdgSXtxD8je+p7tgo3xp+A=;
        b=XIWINdBlm5TS4jOlsPceVH2dmu3LBWJlovIs+j2AuwKL0XTyDXSxX01FkSQTnyf0Vh
         ftu8cZXWCF7MbPuPHGMtOmJ0w+M0SFa9SSGbZXi5SUI2xZWLfD07/dca5x7qCROUHYQ8
         WqVnzWNDRLfs7GdfK6lDg/Ca1Dey9JiGHSdui+qBmwOeYsow5N8qRTUWNShCh6UzXiQq
         QXN0/GjpdkJzIyMHYy3S7vnKYiYU8GGlYl4rvimx0LoW7MMHwkpf9RR2tVV6+hqJIEuB
         NVYJ20fHy+ck6OkIdFi4wtHu2+S2lNCkRCOxM2b3Deq2JpZuR523mD6SrGR7redBLSi4
         aYfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
        bh=vJ56H4HHvdOEMXdVFBYNUPdgSXtxD8je+p7tgo3xp+A=;
        b=UKJUd9Nx9DwW1cW6ggJ89LqwQmLT1hi3B0/ydL9j+x5n7Kx7Lo+KzePihguzhaWO8i
         GLTafUSEP6ksVQRiZ2sap2S0UilgZ8grbjYllYb3AcWRiKY8Pro/6BooRrv9D/zeUP2k
         4KZkFh2yluObWYiVcomeOLRrbrx8ZE6o/VaGK8jEK1ublmqoXicvN+EUbF3xWu07o0BN
         x118k1flpimo4yr4ng7iveRidxvIxDEp47GlYz9XCXGX9DHA43NlOxQd+5NHe/pBLdyb
         8n6MzP0s+OIiUh9KsfC7JIBCCqRo4CYCKpeEUqSx0iYETmQuMgVFKT1rvKyQm0tW78+F
         pQFQ==
X-Gm-Message-State: ACgBeo0VJlEtmyz/7ec6VMDAElU5AfV+GS0sJcX/q40WanDVbvlM8XeD
	aUGs599+/UIzYzNEep4xvk6s0sJDMu0cODh2xTU=
X-Google-Smtp-Source: AA6agR4pM4EalGAbyux0BG08SI5+/4TnznXhO7kXWQlvmYlVx3u054RnqrzzKxCyvK+opTCtVaw2C/ESacsMZKYMWGQ=
X-Received: by 2002:a05:6871:783:b0:101:3d98:ba86 with SMTP id
 o3-20020a056871078300b001013d98ba86mr2804128oap.132.1660776170197; Wed, 17
 Aug 2022 15:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <20220802015052.10452-28-ojeda@kernel.org>
 <CAK8P3a0jqhGY9E85VC9gNem5q6-dWeq0H6-7bhJopinMnLtOKQ@mail.gmail.com>
 <CANiq72nNucEhXAXkXSujnGkpQrkv3-Pcn7ua8N=2XB-suAjs9w@mail.gmail.com> <rYTolA_zKqIX3oCL_i-vlIqKS99s0bYQmRKAdcScDq0mcyxti3imzP7AvJzBpiI6RAuH5RU5BpU4xuEY1Vzq57CuY5v47tO3SuUNAMd7seM=@protonmail.com>
In-Reply-To: <rYTolA_zKqIX3oCL_i-vlIqKS99s0bYQmRKAdcScDq0mcyxti3imzP7AvJzBpiI6RAuH5RU5BpU4xuEY1Vzq57CuY5v47tO3SuUNAMd7seM=@protonmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Aug 2022 00:42:37 +0200
Message-ID: <CANiq72mp4pgfszjM5t6zgLOBFTmUO4oZkbMxHhekbiNwUe9YLw@mail.gmail.com>
Subject: Re: [PATCH v8 27/31] Kbuild: add Rust support
To: =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Miguel Ojeda <ojeda@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sven Van Asbroeck <thesven73@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, 
	Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, linux-riscv@lists.infradead.org, 
	Will Deacon <will@kernel.org>, Martin Rodriguez Reboredo <yakoyoku@gmail.com>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, x86@kernel.org, Russell King <linux@armlinux.org.uk>, 
	Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, 
	Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	Boqun Feng <boqun.feng@gmail.com>, linux-um@lists.infradead.org, 
	Michal Marek <michal.lkml@markovi.net>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, 
	linux-arm-kernel@lists.infradead.org, Tiago Lam <tiagolam@gmail.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-kernel@vger.kernel.org, Boris-Chengbiao Zhou <bobo1239@web.de>, 
	Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Richard Weinberger <richard@nod.at>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, 
	linuxppc-dev@lists.ozlabs.org, Philip Herron <philip.herron@embecosm.com>, 
	Arthur Cohen <arthur.cohen@embecosm.com>, Antoni Boucher <bouanto@zoho.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_154251_577503_A4516E04 
X-CRM114-Status: GOOD (  23.67  )
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

T24gV2VkLCBBdWcgMTcsIDIwMjIgYXQgNjoxMSBQTSBCasO2cm4gUm95IEJhcm9uCjxiam9ybjNf
Z2hAcHJvdG9ubWFpbC5jb20+IHdyb3RlOgo+Cj4gVGhlcmUgaXMgYWxyZWFkeSBhIHByb3RvdHlw
ZSBvZiBzdWNoIGEgZHJpdmVyLiBJdCBjYW4gYmUgZm91bmQgYXQgaHR0cHM6Ly9naXRodWIuY29t
L1J1c3QtR0NDL2NhcmdvLWdjY3JzLiBVbmxpa2Ugd2hhdCB0aGUgbmFtZSBzdWdnZXN0cyBpdCBp
cyBub3QgY2FyZ28gc3BlY2lmaWMuIEl0IGNvbnNpc3RzIG9mIHR3byBiaW5hcmllcy4gVGhlIGZp
cnN0IGNhbGxzIGNhcmdvLCBidXQgdGVsbHMgaXQgdG8gdXNlIHRoZSBzZWNvbmQgYmluYXJ5IGlu
c3RlYWQgb2YgYSByZWFsIHJ1c3RjLiBUaGlzIHNlY29uZCBwYXJ0IHRoZW4gdHJhbnNsYXRlcyBh
bGwgYXJndW1lbnRzIHRvIHdoYXQgZ2NjcnMgZXhwZWN0cy4gSXQgaXMgcG9zc2libGUgdG8gZGly
ZWN0bHkgaW52b2tlIHRoaXMgc2Vjb25kIGJpbmFyeS4gRm9yIG5vdyBpdCBwcm9iYWJseSB3b24n
dCB3b3JrIGZvciBydXN0LWZvci1saW51eCB0aG91Z2ggYXMgaXQgZG9lc24ndCBoYXZlIGFsbCBh
cmd1bWVudHMgdGhhdCBhcmUgdXNlZCBieSBydXN0LWZvci1saW51eCBpbXBsZW1lbnRlZC4KCkkg
c3Bva2Ugd2l0aCB0aGVtIGFib3V0IHRoaXMgYSBmZXcgd2Vla3MgYWdvLCBidXQgSSB0aG91Z2h0
IGl0IHdhcwpiZXN0IHRvIGxlYXZlIGl0IHVwIHRvIHRoZSBHQ0MgUnVzdCBmb2xrcyB0byBkZXRh
aWwgaG93IHRoZXkgd2lsbApwcm9jZWVkIGlmIHRoZXkgYWxyZWFkeSBrbm93LgoKPiBBcyBhbHRl
cm5hdGl2ZSB0byBHQ0MgUnVzdCB0aGVyZSBpcyBhbHNvIGdpdGh1Yi5jb20vcnVzdC1sYW5nL3J1
c3RjX2NvZGVnZW5fZ2NjLyB3aGljaCB1c2VzIGxpYmdjY2ppdCBhcyBiYWNrZW5kIGZvciB0aGUg
b2ZmaWNpYWwgcnVzdCBjb21waWxlciByYXRoZXIgdGhhbiB3cml0aW5nIGEgZnVsbCBSdXN0IGZy
b250ZW5kIGZvciBHQ0MgZnJvbSBzY3JhdGNoLiBXaXRoIGEgYml0IG9mIHBhdGNoaW5nIHRvIGZv
cmNlIGl0IHRvIGJlIHVzZWQsIEkgd2FzIGFibGUgdG8gY29tcGlsZSBhbGwgUnVzdCBzYW1wbGVz
IHdpdGggR0NDIHVzaW5nIHJ1c3RjX2NvZGVnZW5fZ2NjLiBIb3dldmVyIGl0IGdpdmVzIHdhcm5p
bmdzIG9mIHRoZSBmb2xsb3dpbmcga2luZDoKPgo+ICAgICBsZC5sbGQ6IHdhcm5pbmc6IHJ1c3Qv
YnVpbHQtaW4uYShjb3JlLm8pOiguZGF0YS5yZWwubG9jYWwpIGlzIGJlaW5nIHBsYWNlZCBpbiAn
LmRhdGEucmVsLmxvY2FsJwo+Cj4gQW5kIGhhbmdzIHZlcnkgZWFybHkgaW4gdGhlIGJvb3QgcHJv
Y2Vzcy4gSWYgSSBlbmFibGUgZWFybHkgbG9nZ2luZywgaXQgcHJpbnRzIHVwIHRvICJCb290aW5n
IHRoZSBrZXJuZWwuIiBhbmQgdGhlbiBkb2VzIG5vdGhpbmcuIFRoaXMgaXMgcHJvYmFibHkgYmVj
YXVzZSBzdXBwb3J0IGZvciBzZXR0aW5nIGEgZGlmZmVyZW50IHJlbG9jYXRpb24gbW9kZWwgaXMg
bm90IHlldCBpbXBsZW1lbnRlZC4gSSBvcGVuZWQgaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFu
Zy9ydXN0Y19jb2RlZ2VuX2djYy9pc3N1ZXMvMjA1IGZvciB0aGlzLgoKVGhhbmtzIEJqw7ZybiBm
b3IgZ2l2aW5nIGl0IGEgZ28hCgpBcm5kIG1haW50YWlucyBhIHNldCBvZiBjcm9zcy1HQ0MgYmlu
YXJpZXMgZm9yIGtlcm5lbCBkZXZlbG9wZXJzLCBzbyBJCmFzc3VtZWQgaGUgd2FzIG1haW5seSBp
bnRlcmVzdGVkIGluIGluY2x1ZGluZyBHQ0MgUnVzdCB0aGVyZSAtLSBJCmRpZG4ndCBtZWFuIHRv
IGxlYXZlIGBydXN0Y19jb2RlZ2VuX2djY2AgYXNpZGUhIDopIEluIGZhY3QsIGEgZmV3CndlZWtz
IGFnbyBJIGFsc28gc3Bva2Ugd2l0aCBBbnRvbmkgKENjJ2QgdG9vISkgYWJvdXQgd2hldGhlciBo
ZSB3b3VsZApiZSBpbnRlcmVzdGVkIGluIGdldHRpbmcgaXQgdG8gd29yayB3aXRoIFJ1c3QgZm9y
IExpbnV4IHNvb24sIHdoZXRoZXIKYW5kIGhvdyB3ZSBjb3VsZCBoZWxwIGhpbSwgZXRjLgoKSW4g
YW55IGNhc2UsIGJvdGggR0NDIFJ1c3QgYW5kICBgcnVzdGNfY29kZWdlbl9nY2NgIHdpbGwgYmUg
cHJlc2VudCBpbgpLYW5ncmVqb3MgYW5kIExQQyAoUnVzdCBNQyksIHNvIGhvcGVmdWxseSB3ZSB3
aWxsIGRpc2N1c3MgdGhlIGRldGFpbHMKZmFjZS10by1mYWNlIQoKPiBUaGVyZSBtYXkgYmUgb3Ro
ZXIgaXNzdWVzLCBidXQgcnVzdGNfY29kZWdlbl9nY2MgaXMgcHJvYmFibHkgZ29pbmcgdG8gYmUg
dGhlIGVhc2llc3Qgcm91dGUgdG93YXJkcyBhIExMVk0gZnJlZSBydXN0LWZvci1saW51eCBidWls
ZC4gQnkgdGhlIHdheSBub3RlIHRoYXQgcnVzdC1iaW5kZ2VuIHdoaWNoIHdlIHVzZSBmb3IgZ2Vu
ZXJhdGluZyBydXN0IGJpbmRpbmdzIGZyb20gQyBoZWFkZXJzIGRlcGVuZHMgb24gTExWTS4gU2Vl
IGh0dHBzOi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC1iaW5kZ2VuL2lzc3Vlcy8xOTQ5LgoK
WWVhaCwgYHJ1c3RjX2NvZGVnZW5fZ2NjYCBpcyBwb3NzaWJseSBnb2luZyB0byBoYXBwZW4gc29v
bmVyIHRoYW4gR0NDClJ1c3QgZm9yIHRoZSBrZXJuZWwuCgpBcyBmb3IgYGJpbmRnZW5gLCBpdCBp
cyBpbmRlZWQgYSBwYWluIHBvaW50LiBUaGVyZSBhcmUgc2V2ZXJhbApwb3NzaWJpbGl0aWVzIHdl
IGhhdmUgYmVlbiBjb25zaWRlcmluZyAoR0NDIGJhY2tlbmQgaW4gYGJpbmRnZW5gLCBhbgplcXVp
dmFsZW50IHRvb2wgaW4gR0NDLCBzb21ldGhpbmcgYmFzZWQgb24gb3RoZXIgcGFyc2Vycywgc29t
ZXRoaW5nCmVsc2UgZW50aXJlbHksICJqdXN0IGNoZWNraW5nIHRoZSByZXN1bHRzIiBhcHByb2Fj
aGVzLCBldmVuIGNvbnZpbmNpbmcKdXBzdHJlYW0gUnVzdCB0aGF0IEMgaGVhZGVyIHN1cHBvcnQg
d291bGQgYmUgYW1hemluZyBmb3IgUnVzdAp1cHRha2UuLi4gOy0pLiBJZGVhbGx5IHdlIHdvdWxk
IGdldCBmdW5kaW5nIHRvIGhhdmUgc29tZWJvZHkgd29ya2luZwpvbiB0aGUgcHJvYmxlbSwgYnV0
IHdlIHdpbGwgc2VlLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
