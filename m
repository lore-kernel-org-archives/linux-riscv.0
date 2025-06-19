Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA980C71136
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 03:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+LDMgcIX+//idmn3wZM9oyfxdHww8PaOpgtooXvzm0Q=; b=nOvgPpMAjFnoLL
	PC/aeXJ/bqt1rUcN8sS/JJkHi16R01rsoIUeKZbwx2chUD8L1jE0jIc3iJrXn2Qq7HyfMz7N/S2a2
	sXzIGGA8S1gwhMQUnAKZvAcYxkQAV1ErlyukFLysCwtCVwG9QiQu8eIAdR4Isei8qnyKbbUikAfyG
	JvZkmQEDv0aSxv3Ri6LwlV74hZyiaxTbmOgCj+KPrmLKACdGC5vqrs1+WQ/1+g6D+wf10n8goXH9I
	Wgi+12o8xAvOmMMKSx0oN72M90OMM5KN6wG5jTVVAVQdI38Ld9wGaGV6K/7S19go5iysiK/s4irep
	moMwoPLqKBs2wgwAlpNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS6Bl-0000000BvLF-44wW;
	Thu, 19 Jun 2025 03:43:45 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS61S-0000000Bufg-0sdC
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 03:33:07 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-71101668dedso3489017b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 20:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1750303985; x=1750908785; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60xy8wKrKO+1t7u1ffpNKlJu/zpqbkDRJr1SZgFpJWI=;
        b=Qlmijiz6F9kLo7T9GZjzHRaKfhRl9CnNK0XPJlfcYOHPhOqEKQ5HTRDiLsmYqst+/o
         VB1DxPc71Ah3Id0+/EdtSnhqdOiMVnP1hv+9AHu01gwgmEy5KNmHzPtwp0rW+4PnmWrD
         lwQwiKixWeWiDlVv7gaEaQLYlLaOFF85jBNVoy3pnV7eiH/mIJ/gvUNGA71PlZBlWiOE
         N0DUCEor6QEIhMwv+O3PfkOp6vi5dYkjwxHtpXWHh+3J/XuUZMqJss7owL+4kNRZvCXN
         INS8BsTwZprnlrC1ycRNbSmuAIP3fil1IdSM7TEoIJE06B6an9py83ZWd9R0emg6OmQK
         lwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750303985; x=1750908785;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60xy8wKrKO+1t7u1ffpNKlJu/zpqbkDRJr1SZgFpJWI=;
        b=lzma4Eojd2z2xNURma6zvNREh7zx3EZJSFF4IhHTZ9PQAlJvDzIZ0EWSJIrppG76qv
         4frx5mXL7Zzxwz+HQuKH8+GDpFftaXwtrBBK7cFoT5oIBqpplBIjIlPcjnmDSZOyCP3S
         dh1/J4tSCGbXLqNk5mGzLLMbMcWWReI3gs6jGPeneolUUqrNmpcJTZcuf4M48Ng2EKJf
         UXCZgh6aKPQspobrAbUK1cOxDoRMr4dnvhMOmWm9wR3lRXMbMNOMuvc+OJy03vPEQrgm
         dZiz89QaxxdwurbEricf09ysX+j9OoBvL8GQLUjJTIYboANhO1VRWSOd2rEGPlrVYOs7
         k5Aw==
X-Forwarded-Encrypted: i=1; AJvYcCVPGLjmI7NUC8tE8KbRMr8neHuJirNydthuFfnf4H7oDRzM3Lsp+VqxX+lUmj7eu2uMPjYrpCDuqdSg+g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxyeh7GOGWwHzwYdYESaQLdaKISIJeLEzSdEpKV1cT1r/TKtfOO
	oAdtV4x/b4zV3pewUkYNKiRz6AXXokCT6ns9vQ3hNoNqsaprTd8k23WE4edR2p1/57VqwQWgii2
	L/DocL9b9ub7SUgTDEkONVS4gvzLPydCQLILZCC59pg==
X-Gm-Gg: ASbGnctBfWkrOrK/3RYMJoon6Yg8Z5tRTLl5FnrWz3lf1boEXTZPybGaz36u0VOTHyb
	/W/vOHmBRkmKew8mkYnoSQyIK63K1CYrk31C+jGm5ueGP8aorI3ngM8ivj5k3nQrY8Rr+qIr1FW
	4xd93YmqtznR6Dh1xVTl1cmjA1eSueS0bxBGa/+//9VA==
X-Google-Smtp-Source: AGHT+IGcgeMo27lTgaDy9bbMAdcQR1xe3fMVRu8/9DI/Df3XMM3eOfwyhPsLvfFCCnJDn+wQXZA6c6yxRggua+A+pZ4=
X-Received: by 2002:a05:690c:3501:b0:70a:36b2:8f94 with SMTP id
 00721157ae682-7117544b8a1mr301360657b3.18.1750303985204; Wed, 18 Jun 2025
 20:33:05 -0700 (PDT)
MIME-Version: 1.0
References: <221b0b7c-1879-4944-b9c4-cfb9fad9ae91@ghiti.fr> <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
In-Reply-To: <mhng-131B0C4B-6AD9-4B65-BC91-927FD725E63F@palmerdabbelt-mac>
From: Guodong Xu <guodong@riscstar.com>
Date: Thu, 19 Jun 2025 11:32:54 +0800
X-Gm-Features: AX0GCFtELZSRZqubW6lHS8cOASUCtzDo1F3xvWoK2w2WWudZIiFtQ6t7sUz4_vI
Message-ID: <CAH1PCMYR2L8TeuveA-XTorQE70wmJVA1Vbt3Qhz0864Vr206PQ@mail.gmail.com>
Subject: Re: [PATCH] riscv: defconfig: run savedefconfig to reorder it
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, dlan@gentoo.org, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_203306_403897_616347A8 
X-CRM114-Status: GOOD (  28.11  )
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

T24gRnJpLCBKdW4gMTMsIDIwMjUgYXQgMjo1N+KAr0FNIFBhbG1lciBEYWJiZWx0IDxwYWxtZXJA
ZGFiYmVsdC5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCAxMiBKdW4gMjAyNSAwNjoxMjowOSBQRFQg
KC0wNzAwKSwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4gT24gNi8xMi8yNSAxMTozMiwgWWl4
dW4gTGFuIHdyb3RlOgo+ID4+IEhpIEFsZXhhbmRyZSwKPiA+Pgo+ID4+IE9uIDEwOjM3IFRodSAx
MiBKdW4gICAgICwgQWxleGFuZHJlIEdoaXRpIHdyb3RlOgo+ID4+PiBIaSBZaXh1biwKPiA+Pj4K
PiA+Pj4gT24gNi8xMS8yNSAxNjo1NiwgWWl4dW4gTGFuIHdyb3RlOgo+ID4+Pj4gQ2hhbmdlcyB0
byBkZWZjb25maWcgc2hvdWxkIGJlIGFsd2F5cyB1cGRhdGVkIHZpYSAnbWFrZQo+ID4+Pj4gc2F2
ZWRlZmNvbmZpZycsIHJ1biB0aGlzIGNvbW1hbmQgdG8gbWFrZSBpdCBhbGlnbmVkIGFnYWluLgo+
ID4+Pj4KPiA+Pj4+IFRoaXMgd2lsbCBlYXNlIHRoZSBlZmZvcnQgb2YgcmV2aWV3aW5nIGNoYW5n
ZXMgb2YgZGVmY29uZmlnCj4gPj4+PiBpbiB0aGUgZnV0dXJlLgo+ID4+Pj4KPiA+Pj4+IFNpZ25l
ZC1vZmYtYnk6IFlpeHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+ID4+Pj4gLS0tCj4gPj4+PiBV
cGRhdGUgUERNQSBjb25maWcgYnJpbmcgaW4gdW5uZWNlc3NhcnkgY2hhbmdlc1sxXSwgbGV0J3Mg
Zml4Cj4gPj4+PiBpdCBieSBydW4gc2F2ZWRlZmNvbmZpZyBmaXJzdC4KPiA+Pj4KPiA+Pj4gSXQg
d291bGQgYmUgZWFzaWVyIGlmIHRoaXMgcGF0Y2ggd2FzIHBhcnQgb2YgdGhlIFBETUEgc2VyaWVz
IHNpbmNlIHRoZQo+ID4+PiBsYXN0IHBhdGNoIHdpbGwgZGVwZW5kIG9uIGl0OiBAR3VvZG9uZyBj
YW4geW91IGludGVncmF0ZSB0aGlzIHBhdGNoIHRvCj4gPj4+IHlvdXIgbmV4dCByZXZpc2lvbiBv
ZiB5b3VyIHBhdGNoc2V0Pwo+ID4+Pgo+ID4+IEknZCByYXRoZXIgbWFrZSB0aGlzIHBhdGNoIGlu
ZGVwZW5kZW50LCBhcyBub3RoaW5nIHN0cm9uZ2x5IHJhbGF0ZWQgd2l0aCBQRE1BLAo+ID4+IGFu
ZCBpdCBwcm9iYWJseSB3b3VsZCB0YWtlIHNldmVyYWwgcm91bmRzIGZvciBQRE1BIHBhdGNoIHRv
IGJlIHNldHRsZWQgZG93bi4uCj4KPiBZYSwgSSBhZ3JlZS4KPgo+ID4+IEJlc2lkZXMsIHRoZXJl
IGlzIG5vIHByb2JsZW0gZm9yIFBETUEgcGF0Y2ggdG8gZGVwZW5kIG9uIHRoaXMgcGF0Y2ggaWYK
PiA+PiBuZWVkZWQgKGVhc3kgdG8gdXNlIGI0IHRvIGhhbmRsZSB0aGlzLi4pCj4KPiBZZXAsIHNv
bWV0aGluZyBsaWtlICJiNCBzaGF6YW0gLWx0cyAtLW1lcmdlIC0tbWVyZ2UtYmFzZSA5NTgwOTdi
ZGY4OCIKPiBzaG91bGQgZG8gaXQgb24gdGhlIG1lcmdlIHNpZGUgLS0gYW5kIG1heWJlIHlvdSBk
b24ndCBldmVuIG5lZWQgdGhlCj4gbWVyZ2UgYmFzZSwgaWYgYWxsIHRoZSBiNCBzZW5kIHNpZGUg
c3R1ZmYgcGlja3MgaXQgdXAgcmlnaHQuCj4KPiA+PiBUaGUgaWRlYSBoZXJlIGlzIHRvIGdldCB0
aGlzIHBhdGNoIG1lcmdlZCBhcyBlYXJseSBhcyBwb3NzaWJsZSwgYXMgaXQncwo+ID4+IHF1aXRl
IHN0cmFpZ2h0Zm9yd2FyZCwgYW5kIG90aGVyIHBlb3BsZSBtYXkgaGF2ZSBzaW1pbGFyIHByb2Js
ZW0gaW5zdGVhZAo+ID4+IG9mIFBETUEgaGVyZQo+ID4KPiA+Cj4gPiBPayBtYWtlcyBzZW5zZSwg
c28gbGV0J3MgR3VvZG9uZyBkZWFsIHdpdGggdGhhdCB0aGVuLgo+Cj4gKGZvciBzb21lIHJlYXNv
biB0aGlzIGlzbid0IHNob3dpbmcgdXAgaW4gcGF0Y2h3b3JrKQo+Cj4gSSdtIGdvaW5nIHRvIG1l
cmdlIGl0IGFzIGEgc2luZ2xlIHBhdGNoIGludG8gZm9yLW5leHQuICBJdCdsbCBsb29wCgpTb3Vu
ZHMgZ29vZC4gVGhhbmsgeW91LgpJIHdpbGwgcmViYXNlLCAob3IgaGF2ZSBpdCBhcyBhIHByZXJl
cXVpc2l0ZSBpbiB2MiBvZiBteSBQRE1BCnBhdGNoc2V0KS4KCkd1b2RvbmcKCj4gdGhyb3VnaCB0
aGUgdGVzdGVyLCBidXQgdGhpbmdzIGxvb2sgaW4gZ29vZCBzaGFwZSBzbyBpdCBzaG91bGRuJ3Qg
dGFrZQo+IHRvbyBsb25nLiAgVGhpcyB3YXkgdGhlcmUncyBhIHN0YWJsZSBoYXNoIHBlb3BsZSBj
YW4gYmFzZSBzdHVmZiBvZmYsCj4gcmF0aGVyIHRoYW4gd2FpdGluZyBmb3Igc29tZSBvdGhlciBw
YXRjaCBzZXQuCj4KPiA+Cj4gPiBUaGFua3MsCj4gPgo+ID4gQWxleAo+ID4KPiA+Cj4gPj4KPiA+
Pj4gVGhhbmtzLAo+ID4+Pgo+ID4+PiBBbGV4Cj4gPj4+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
