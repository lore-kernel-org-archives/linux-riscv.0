Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3974BCA1018
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 03:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xCIdKd9ZycKq48h1BQAW+ERZ/LngOz/syvTnn7Zxgbw=; b=Wj2fFbf5D7hND4
	wj7wC7hBh+Ho75yB8JvHTzjNuhJT1xFlhqz9xdaL1p/sr8Nds+sqPRya8HI6VK/QQBi2b4AGUI+yw
	2Y2arJbvdpuPiHmTK6PdSpxwj9IzYTPUKJbTiT5BNFPULv55SRyYYTBdcglOjOHX53aANtrDCX4D7
	kU0PJ/+HgJQheqAqMIW9zFB0SlACgj0A9vg5od3xTvniLRnNFWmw6Vlh6rJtqpbXf/KfGjflT4Kkx
	iVY4hy7TeAmZYcHHBm/kSCSjIzVBpUDG6r+d9/PbRG7QFlkiWqbYYH4EkdL+03Unq1PrV+ZHbL6r0
	+Uo1NIoUzEIN6U4kvxfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uu0bk-00000008fLp-0hjc;
	Thu, 04 Sep 2025 03:25:56 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utwsm-00000007uXW-2Dub
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 23:27:17 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-248e3eade89so836655ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Sep 2025 16:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756942036; x=1757546836; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
        b=Hw9AiEozuWVVnED7X7eC4HYKb1BMj14trL0GL51QGjvbNorrPrsK0n+4MuqdU/OKy9
         GuiuUv4J9W0nYTP0i/D9d7E7bd/2aDYJiLKOg0QR+VNb8Wn4abNY/+Sei3JHGIYqvlYP
         vdBka5XuQjZkZtgirdS5yGYzPiV6DjzAuFCLA7UEofJvhWsRXUyGyLnosZkk42VhvF5u
         7v1UoNQSZCkK2Dn2eI6euD20u+ZOBCZoiCt47jKAV9mu8nQjfai4yjP8aZE/InRYo3U9
         yfL1W51YcwZXLDp+LXmoIF4lX61ecoa2ek1X4Moj+UgXm1ascZecSAWzKkcxjt7CpAj5
         m3Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756942036; x=1757546836;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=agSZSZe+tQVZN8rhVQvwRsToQCPpFg14KIdGBgQcrtA=;
        b=Vs5nzR3W26V51Rpu7giXWbn/k84PeAPNmHB8SsIcXLO9FmfT1oHSAPufYBk/kmL5UQ
         bxrUJc9R6xU6KTgA3WJ//05nm3Pd4BPxcMMzZ22sRC+SR7Tz1y175hTEzpiNz8UwZO2J
         C6u81Dq5AZeRYfW9ENmRyQldRW4lF8lGGjKh0rwo8pAE9oScSUe19V8eicpDb8D7e5XU
         Kd3DKiu9yRuYZcAxbC6FX7Gxffc43q9oVsRJ2ni6nHMQR4QI8hjPe1zfsCQYSCp37izY
         HS6eN6qQ5gMwRv/eTP3nOYPiZP0ylyjPZHLZah/TkjYoK7aHViK6kTf+S6Z5YvADKQPa
         PbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnFuvdjbeVl2VLNZdabGJCNp5kzQQLsybLSMUMDSnpmxIFgaoFtUdEacLYSs71wdTAple+PXSEjKjedA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywi6U6/YyVlCdARphiy+GGjKdFH/WoRUZzUE4Fog/b2YxNAW8f7
	YD0FSClj0PBlOXqR1iR4e/8DIQ9tDjW2j/rpGarn98j22JBOfhTB7IyB32Ct2urvDCaZ+EtYI/X
	tA71kwC5OGG9lqhaP8hvAgUn95lqS8eU=
X-Gm-Gg: ASbGncuBp6aS6Si6D8KkrYzs7yj2EtbKWFXvmAIc4BWDiP+AsCTsEAfqWB5o9+wTkk2
	Nb988choK9/VqC+PurBKYniFHR8g463hbdUVsy2y1vUYwhvpbM+NHKs93C3XIwnWUSjpHL7yTSa
	ebzLZx419v9dKEJpfqyiZOzN2LmWDHtNoRyaOFLNHIVoe9VvUVLqtl8Uy9W6a5sa/vMF5me7gj0
	zrY8iaVIm8ibDX7eMxiqdlVRFnjs63jZBxeZmS3qcKlN49+SlCgT5qUeJ4ZAqtkRVFWeLt1qwF/
	xzEGVCPiBpNFvKznWC2Ij/HMOqeI5l1UMR2Y
X-Google-Smtp-Source: AGHT+IHTidnBVrl9x28IZyAbFtRyk1faHWra3cfcqzPBbplLrvafS2wCVDCjldwrmyF+S5C53slJRXjDIWwmfw6CDg4=
X-Received: by 2002:a17:90b:4a8c:b0:329:cc8e:247c with SMTP id
 98e67ed59e1d1-329cc8e278cmr7164799a91.8.1756942035722; Wed, 03 Sep 2025
 16:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <20250830-cheesy-prone-ee5fae406c22@spud> <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
In-Reply-To: <20250903190806.2604757-2-SpriteOvO@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 4 Sep 2025 01:27:03 +0200
X-Gm-Features: Ac12FXzLAKLE3bvYxnCEro37dgST78_dgCYHlfdxLKDH7Bk_32DLgZHXXdMAE08
Message-ID: <CANiq72=FJSRwOPNG4ZFeoex3MssTjmhozp5Xd++PTCCSJaJ3hA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
To: Asuna Yang <spriteovo@gmail.com>
Cc: Conor Dooley <conor@kernel.org>, Jason Montleon <jmontleo@redhat.com>, 
	Han Gao <rabenda.cn@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tejun Heo <tj@kernel.org>, Kees Cook <kees@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Jan Hendrik Farr <kernel@jfarr.cc>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Christian Brauner <brauner@kernel.org>, Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_162716_571112_9DC172BB 
X-CRM114-Status: GOOD (  11.14  )
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

T24gV2VkLCBTZXAgMywgMjAyNSBhdCA5OjA44oCvUE0gQXN1bmEgWWFuZyA8c3ByaXRlb3ZvQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBDb21taXQgMzM1NDlmY2YzN2VjICgiUklTQy1WOiBkaXNhbGxv
dyBnY2MgKyBydXN0IGJ1aWxkcyIpIGRpc2FibGVkIEdDQwo+ICsgUnVzdCBidWlsZHMgZm9yIFJJ
U0MtViBkdWUgdG8gZGlmZmVyZW5jZXMgaW4gZXh0ZW5zaW9uIGhhbmRsaW5nCj4gY29tcGFyZWQg
dG8gTExWTS4KPgo+IEFkZCBhIEtjb25maWcgbm9uLXZpc2libGUgc3ltYm9sIHRvIGVuc3VyZSB0
aGF0IGFsbCBpbXBvcnRhbnQgUklTQy1WCj4gc3BlY2lmaWMgZmxhZ3MgdGhhdCB3aWxsIGJlIHVz
ZWQgYnkgR0NDIGNhbiBiZSBjb3JyZWN0bHkgcmVjb2duaXplZCBieQo+IFJ1c3QgYmluZGdlbidz
IGxpYmNsYW5nLCBvdGhlcndpc2UgY29uZmlnIEhBVkVfUlVTVCB3aWxsIG5vdCBiZQo+IHNlbGVj
dGVkLgoKSSB0aGluayB0aGUgY29tbWl0IG1lc3NhZ2Ugc2hvdWxkIHRyeSB0byBleHBsYWluIGVh
Y2ggdGhlIGNoYW5nZXMgaGVyZQoob3IgdG8gc3BsaXQgdGhlbSkuCgplLmcuIGl0IGRvZXNuJ3Qg
bWVudGlvbiB0aGUgb3RoZXIgY29uZmlnIHN5bWJvbHMgYWRkZWQsIG5vciB0aGUgZXh0cmEKZmxh
ZyBza2lwcGVkLCBub3IgdGhlIGBlcnJvcmAgY2FsbC4KCkNjJ2luZyB0aGUgcnVzdC1mb3ItbGlu
dXggbGlzdC4KClRoYW5rcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
