Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5403FC982D0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7GqeaSHwEiaNTqdcdFfXZuzobc6+WJXjYOg6Qa8nr6U=; b=Eti8MucivYytvh
	vWiwAQyyRSfl+DRLuhMjiglviB03jz+UF1wECVImOEFvYN3ueGPDi7xU/pbBT2fI+dvgdQeFGpNTB
	Vkk8+HLq+B76k9MKZV3bQ7BUCUchdGhtyPgy/qKGL57iJhQqU6dV1p006fUIKaqnCtSQlXQ3yHioH
	eJU72zqhkSxGZ+6eRoAZgCCLP+2TbAB+/9R+1UEhz3FqW4YsDyvC7I7HCVVpfuWoACR3ZvrUyEKCk
	YuDMr+ZbHl7c9na1GCWEPsxhZLwnxyuhR2EWo0WFzpXicMpaSETbk19muBQ0Ff+PxX7sqz4KAVv2B
	aX9RFotzvwW9h0Zfx6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IK0-0000000COUa-32ZH;
	Thu, 17 Sep 2026 20:03:04 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7IJy-0000000COTa-1auP
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 20:03:03 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e79a408deso127705e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 13:03:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789675380; cv=none;
        d=google.com; s=arc-20260327;
        b=Z2VY38UOhOSTESKdmIiSwzIuLGKGKWRUemFY0PCmj2O1ZZPezAkIxULAmGCy1Oi1DA
         2sXz9/KB7Em5f4ETxuyBNVOUIhkp4BpRoL+cCt4JcqeZKoMfPW7ahieG5ZyItaZu8fWR
         zExw5ufUeH8LbuiFG25JXH4OXkqebnk7FUhHE7qyApBDb3sfIMaF0Z8FOv0bo0pq+yZv
         FlTAyGYa7Y/51FzBKIpSqA9iOB7hUAV+VQvEmYSeUQZh2QbMQmiBr4u46DtWl/w16FKA
         todOGycitMn93NCkwbZju1jKMHlOf3zWlOXwWbQ5F4oqqYwZzCDRb7Jk1MKCKXFZkKFT
         B6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        fh=WwVIhZvSaY9ZgsbT0NgTdAi9+huc6r/je0PmzOcpc/Q=;
        b=RMHF6wQeII8CUT1iURJmhBDzZltxgh+jfXnxLKCCBMoJblioxgT0r73rQ9u6YEzbt8
         DTwumOj/KDRi79/GP8JejMN6TruC5hIFk2qf8XO5lQx0Bh7/jBsNFB16ceck6AJaYBv5
         q+Me441US9aygZZT04NRYFYgCYp8KKJ9+/8AsEfpqM9keUcnbgRwolXnnauP50YbMolL
         8IpsPqofhBmYq6D6vnqr2QUBWWh/LzXk57DvuhaN1tG24+88rZe3ais+V6IPZLj6qddH
         IkMHcEjwKzF1X2XegO8LEAa7V4qc0zDPgcyGUjHJMlLOmxb63cX2iGeysYo223UT/K3U
         7LQg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789675380; x=1790280180; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=KG23cg6AgPbVWQV6q2QMgt3n+BXxFqwXi1PlexOVmP7dLe+/tx99PqAQ6nf+eLbNxP
         Rp/gVoLcipiSUgDM6nyPZh2c0+5Xh85Gfw2JQKhCcT+8IsIWOFbVDscQ3M8Lc5gzsVx/
         CffFsI1R8bvOQPpSTj+VJhSnl/nNGkNSTBiFoAjvRHfwWi1qXhM4ev0arROMuTAm8faL
         1FVHrLbADmlIOyzFTnzSgQx9OHvBBzGOY7ijGxBjcZx7rjS4E0vJfVF66+7p8kCkxcsH
         xb7+DclOMjfpYE/koejvEn+NpNAgp9h2Jf2mgD2UMKsp2WERdRbmAKtDTRl/ZDO+t5Gd
         uTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789675380; x=1790280180;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25a39fQthoJQenvf3ilsmj4we8U0R1UDFLTQO2djkUo=;
        b=aKemw9eQyCVEoS1H19mURnIGa/R6AimA9yyKTjnQFz/6aWveLJdGWJHnNIg6av/ryd
         EDmVPctEBf/6AiONiFPGYLNO1Ob9ZsE3xcALNya0RpM+654nQdpJjFhKQFigfMwsNVxX
         b6rjUpBVcQX4cBUeOKMej+2tyeTcA6LyovJX4VXeHkwCx3sYneTYYFfQYYKMAQS+J/xO
         i+w/nMaGFjYxTY0WY/kGTWXfyqbZjYnEM0Vx3txjznx/8fyH75Ow9jkpyhMIokB6JFRJ
         UMg1si2uJWJvB1ggpwmThkG4vB94GmOHZSziyEW8cYxZaVzscEw7Px0WxSmxk9JnmWJx
         G+tw==
X-Forwarded-Encrypted: i=1; AKwUvBwolgE4i3C805fRYoPSSsJO4jdN9mIv6U+N1CuQCHj8f7yTzzrkoYZIG0mpNORvv2OUtW9/F5K78v+HSQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nyQEQojJ5AKa8PRnIs7WYxTD/AF4k0JYjRyngHqGqU/xrNmDbP
	jkhgARyQ/On5ghGky/P/38EqsYWo3oOPpqGhPOEx85sWuNy83h14JCDC1XCchkotzL1WAg7GUoK
	wtpqblk4Fr3WQLuF34dt/H69WqnNro847EUDFNf/K
X-Gm-Gg: AYBFou1MyGGZr7nq6AfJlL/M5+05Ybb1oWRtPCuAFomEB/61aCBrJeZD8uxV9HKJFjf
	fNbEyjH9PytpdVlKiwW+qIcoth91ktEZJBbPp3ieFALQd9XWoR+tBY5I/QoVZgaGqLbBTIULGUn
	ts/v6Rl+xDv1SlpQtWzKIBpYZJpS/OwRaX1kBg2G1Bbvg/No3RsOY9Z1SCQRodXeHDLuCCvyrtF
	pg8J5qNCr9XDa9ZS1Mnso9IBlxquabVNQngeO3NjBElqqiGQApCCIYqVhsBd+rfX6litI/0VpI1
	UXIY413HXlypKu8nuE63SHwagLp/rDuy1OKk18BENSa0ug9HKPsrLnsnTsjAbBQcAD+sd5UQerA
	5uRREY6xWxrkhHg+hYx3ZtUEwLmIHqaftPTJzHkQXDh8se4zn/l7033P9ju4SqGcLSkwYjek=
X-Received: by 2002:a05:600c:a013:b0:49e:6891:27a8 with SMTP id
 5b1f17b1804b1-49fc574a9bcmr72735e9.25.1789675379819; Thu, 17 Sep 2026
 13:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260917-build-speedup-v3-0-9ecf4163ff36@kernel.org>
 <CAHk-=wjwtJQPW+MRAkQCcSGA1EZWehxBTUiEUUhdACCNHSKvTQ@mail.gmail.com>
 <aqwkk7FcQ0XWeqJW@gremlin> <aqxCNyxYRzN2Oher@gremlin>
In-Reply-To: <aqxCNyxYRzN2Oher@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 17 Sep 2026 13:02:48 -0700
X-Gm-Features: AcwNN1XUt93HLe1Zu-oZLdknUZyAU05hxj4P7Ko_JzOHOx4U0fnT6yaI1XKYaw4
Message-ID: <CAKwvOd=zbE8MZXCNCBJNpd2WWn7f+AOfxYcmCp7e-8uFSM+D9g@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>, linux-hardening@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_130302_445171_7B6FCAA8 
X-CRM114-Status: GOOD (  17.66  )
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

T24gVGh1LCBTZXAgMTcsIDIwMjYgYXQgMTI6NDLigK9QTSBMb3JlbnpvIFN0b2FrZXMgKEFSTSkg
PGxqc0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFRodSwgU2VwIDE3LCAyMDI2IGF0IDA2OjM2
OjE4UE0gKzAxMDAsIExvcmVuem8gU3RvYWtlcyAoQVJNKSB3cm90ZToKPiA+IE9uIFRodSwgU2Vw
IDE3LCAyMDI2IGF0IDEwOjE1OjI2QU0gLTA3MDAsIExpbnVzIFRvcnZhbGRzIHdyb3RlOgo+ID4g
PiBPbiBUaHUsIDE3IFNlcHQgMjAyNiBhdCAwOTowNiwgTG9yZW56byBTdG9ha2VzIChBUk0pIDxs
anNAa2VybmVsLm9yZz4gd3JvdGU6Cj4gPiA+ID4KPiA+ID4gPiAgICAgICAgICAgICAgICAgPT0g
ZGVmY29uZmlnIEZVTEwgYnVpbGQgPT0KPiA+ID4gPgo+ID4gPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGJlZm9yZSAgICBhZnRlciAgICAgZGVsdGEKPiA+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ID4gPiA+IFRocmVhZHJp
cHBlciwgZ2NjICAgICAgICAzMi41cyAgICAyNi4zcyAgICAgLTYuMXMgKC0xOSUpCj4gPiA+ID4g
VGhyZWFkcmlwcGVyLCBjbGFuZyAgICAgIDM0LjVzICAgIDI3LjJzICAgICAtNy4zcyAoLTIxJSkK
PiA+ID4gPiBFUFlDLCBnY2MgICAgICAgICAgICAgICAgMjguN3MgICAgMjAuNnMgICAgIC04LjFz
ICgtMjglKQo+ID4gPiA+IEVQWUMsIGNsYW5nICAgICAgICAgICAgICAzOS44cyAgICAzMi4ycyAg
ICAgLTcuNnMgKC0xOSUpCj4gPiA+ID4gTTIsIGdjYyAgICAgICAgICAgICAgICAgNTE5LjNzICAg
NTEyLjRzICAgICAtNi45cyAoLTElKQo+ID4gPiA+IE0yLCBjbGFuZyAgICAgICAgICAgICAgIDYz
NC41cyAgIDU2OS40cyAgICAtNjUuMXMgKC0xMCUpCj4gPiA+Cj4gPiA+IFRoZXJlJ3Mgc29tZXRo
aW5nIG9kZCBnb2luZyBvbiB3aXRoIHRoYXQgTTIgZ2NjIGJ1aWxkLiBXaHkgaXMgaXQgc3VjaAo+
ID4gPiBhbiBvZGQgZHVjaz8KPiA+Cj4gPiBVZ2ggZGVhciBsb3JkIEkgdGhpbmsgdGhlIExMTSBz
b21laG93IGNvcnJ1cHRlZCB0aGUgbnVtYmVycy4uLiBMZXQgbWUKPiA+IHJlLXJ1biB0aG9zZSBt
eXNlbGYgbG9jYWxseSBhbmQgY29tZSBiYWNrIHdpdGggdGhlIGFjdHVhbCB0aW1lcyEKPgo+IE9L
IG51bWJlcnMgYXJlIGluOgo+Cj4gTTIsIGdjYyAgICAgICAgICAgICAgICAgNTY0LjdzICAgNTEy
LjFzICAgIC01Mi42cyAoLTklKQo+IE0yLCBjbGFuZyAgICAgICAgICAgICAgIDYxNS4xcyAgIDU2
NC4xcyAgICAtNTEuMHMgKC04JSkKPgo+IEZyb20gdGhlIHYxOgo+Cj4gTTIsIGdjYyAgICAgICAg
ICAgICAgICAgNTY0LjBzICAgNTEyLjRzICAgIC01MS42cyAoLTklKQo+IE0yLCBjbGFuZyAgICAg
ICAgICAgICAgIDYxNi4xcyAgIDU2OS40cyAgICAtNDYuN3MgKC04JSkKPgo+IChUZXN0ZWQgYXMg
cGVyIHRoZSBjb3ZlciBsZXR0ZXIgcHJlLXJlcXMsIGkuZS4gYXBwbHlpbmcgZGVwZW5kZW50IHNl
cmllcwo+IGZpcnN0IGV0Yy4pCj4KPiBOb3Qgc3VyZSBvbiB0aGUgLTVzIGRlbHRhIG9uIHRoZSBj
bGFuZyBidWlsZCA6KSB0aGF0IG1pZ2h0IGhhdmUgYmVlbiBtZQoKQ2xhbmcgaXMgZmFzdGVyIG9u
IFRodXJzZGF5cy4KCj4gYmVpbmcgbW9yZSBkaXNjaXBsaW5lZCB0aGlzIHRpbWUgdG8gbm90IHVz
ZSB0aGUgbGFwdG9wIGF0IHRoZSBzYW1lIHRpbWUuCj4KPiBCdXQgYnJvYWRseSBpbiBsaW5lIHdp
dGggdGhlIG9yaWdpbmFsIG51bWJlcnMuCj4KPiA+Cj4gPiA+Cj4gPiA+ICAgICAgICAgICAgICBM
aW51cwo+ID4KPiA+IC0tCj4gPiBDaGVlcnMsIExvcmVuem8KPgo+IC0tCj4gQ2hlZXJzLCBMb3Jl
bnpvCgoKCi0tIApUaGFua3MsCn5OaWNrIERlc2F1bG5pZXJzCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
