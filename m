Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDEA0C54798
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 14:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qUgEaswJbAoiyz5UDOLPU9c25dEQ8jKhN22G/qGjbVE=; b=DyTfgSNyH0tRag
	UBbjiRVvx7d3ouy1NesWE2Lv5MoxfHsWAiohEFw549LPyd8+JNn//I9d/C2uLh/z7hjbELC9b+j5G
	Sc4GW7UGcm1LMNxSosOFZPuCT6YDvMJyYGbaN5DuY1O9yeW3GUCAP6ExffQ3PUPD7aoWMzWh5BNo+
	Vv2fwq38wbbONGNyEdd/ytH4rX8w1GJucbhaHbqPbcNuYIsRZPtLifHpPVy5FWOx1xeljW2IXhvfb
	WNrC4YbysGHmBJvT7cuk12KZUWLsaL+INNWu6nXrvDmOwlnk0/Y0ns5DR4xlzUgUNLmp+97HmybQT
	3PgnzLl98aZ3faJDdhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reykF-00000005dXd-29GL;
	Tue, 27 Feb 2024 14:47:47 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reykC-00000005dW1-1Oeu
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 14:47:45 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cfd95130c6so2576037a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 06:47:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709045262; x=1709650062; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCy743fk4tyJkNw6DXsgUea2FahrCbo/h1GwjkT/m8w=;
        b=iBzO5lPT6/kQz0k/gmD5dJ9XKhHw4KUPKScnGVBVlpbWfaTu1pjKKdSrv07s8hXAji
         Am7X16q4jEltWla9nvFO27lKNS+l1ma/wtSeeJU9pXhGpu73QdFbgbgMiGtVWa5xGB7D
         daRXtA2KAQ/Ymv4BXHcmYNljJ1G1JWNRMZSugVEAMtgK3GDjlWSfL+n/G9D6kA+eOaZL
         qylODGJVOcesAcsTBGKo3Aee3cRNXB32ZMeR8E/k6QEMYwkBKEyhTIQTCSxr+NBvrc+o
         hH4wdmmMREsFC7qwHo0vzzqOGG4tAMt1ngXGA9l5Qsu7RySzwqS2NUyu9cgz+J41iMG7
         KowQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709045262; x=1709650062;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YCy743fk4tyJkNw6DXsgUea2FahrCbo/h1GwjkT/m8w=;
        b=RcioTBW9Vz9F2ZBuopcbaElx1xvUBQawnUA4JRdXsA0WEtdun0T+9wYc1XjCfpGWbr
         koEO1k30BsSEvhzgBLjoKHBWiwujOHwkChu2JAx1yvB3c6NH9oiOB7WL0lNJNeGw7qxk
         9GauKGptK4HArkqIMDf+AXYrwXqHfceVK9MnM8AnDb2CzDTXgCXVn/ceVsRqCT0iUNyy
         LC+EZ+mXz594LUwYPDaWStRjUIdrBx4gXMX5qaoqmHaxC6qL5+EIK6Vgt23kk5oE/CSD
         jz+dnaYd0jWRw3mottpwpzUbWAEUay9x6dlYGzWiXtlNvnyVU9Wu7bWHzDaTzQtCZL/P
         ZZLg==
X-Forwarded-Encrypted: i=1; AJvYcCW8HwMeTYDCqhrK+JxsqCky+A1iS/MsKNtVt30rqbgWinyUrNA2idLaeUcfvIkzWehSNQz0VwjApbOfpvPMSfVAk6UeZ76RJ084UJ54dq23
X-Gm-Message-State: AOJu0YyiXdedA5WFwHZAW1zgGnIIQxCHz7D2OEZXprv7/5w6swMK4KEw
	zIYfmrfGs6R+vXWDxj0dV08Razo8HldhoAWFag29wv65AjWnDf1e2KkEv9TZUzI/oeci7USzUZ4
	gTHaGjyJ0B3zLmEpbBHibkVl06Ak=
X-Google-Smtp-Source: AGHT+IFafpLdk0evJiKKq2WOgHZJ334wUaliiML9yKUEBDk7ieZRcShNP65NIpPeHhXYIz7pBy67jwjYFUhaFlkV+Ak=
X-Received: by 2002:a17:90a:dc0f:b0:29a:b713:8b27 with SMTP id
 i15-20020a17090adc0f00b0029ab7138b27mr5063628pjv.46.1709045262472; Tue, 27
 Feb 2024 06:47:42 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-employee-pessimism-03ba0b58db6b@spud>
 <CANiq72ngEZskjH0f=8+cJuQsFTK227bGCxe5G0STMHuPbZYnXg@mail.gmail.com>
 <20240227-resolved-deceit-4a59a6af5b71@wendy> <CANiq72mwM+4Oh-H5WmRoqQ_nE1w-eJ1wn-nEwS=BR9JRwzxMMQ@mail.gmail.com>
 <20240227-glove-underwire-f562a56cf2c7@wendy> <CANiq72=f03_bw9B8ww8UxHkVyP2F7ZPyvC+KWCyhO3Nk1yqdaw@mail.gmail.com>
 <20240227-swarm-serpent-2010b255f68a@wendy>
In-Reply-To: <20240227-swarm-serpent-2010b255f68a@wendy>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 27 Feb 2024 15:47:29 +0100
Message-ID: <CANiq72=69uBBhKMrw5P8K6eDHPiwAw_Oj8g1aYcywEYhhUG8OA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] scripts: generate_rust_target: enable building on RISC-V
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_064744_406305_EF9C584F 
X-CRM114-Status: UNSURE (   8.12  )
X-CRM114-Notice: Please train this message.
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

T24gVHVlLCBGZWIgMjcsIDIwMjQgYXQgMTozN+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gTG9va2luZyBjbG9zZXIgYXQgdGhvc2UgdGFy
Z2V0cywgYWxsIG9mIHRoZW0gZW5hYmxlIGNvbXByZXNzZWQKPiBpbnN0cnVjdG9ycywgYnV0IHdl
IHN1cHBvcnQgaGFyZHdhcmUgdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRoZW0uCj4gSSB0aGluayB0
aGF0IG1lYW5zIHdlIGFyZSBzdHVjayB3aXRoIHRoZSBjdXN0b20gdGFyZ2V0cy4KCkRpZCB5b3Ug
dHJ5IGAtQ3RhcmdldC1mZWF0dXJlPS1jYD8gaS5lLiBhcyBmYXIgYXMgSSBrbm93LCB5b3UgY2Fu
CmRpc2FibGUgdGFyZ2V0IGZlYXR1cmVzIGV2ZW4gaWYgdGhleSBhcmUgZW5hYmxlZCBmcm9tIHRo
ZSBidWlsdC1pbi4KCkl0IHNlZW1zIHRvIHdvcmsgZnJvbSBhIHF1aWNrIHRyeSAoaW4gdXNlcnNw
YWNlKSwgZS5nLgoKMDAwMDAwMDAwMDAwMDAwMCA8Zj46CiAgICAgICAwOiA5YiAwNSAwNSAwMCAg
ICAgIHNleHQudyAgICBhMSwgYTAKICAgICAgIDQ6IDEzIDA1IGEwIDAyICAgICAgbGkgICAgYTAs
IDB4MmEKICAgICAgIDg6IDYzIDg0IDA1IDAwICAgICAgYmVxeiAgICBhMSwgMHgxMCA8ZisweDEw
PgogICAgICAgYzogMTMgMDUgYjAgMDcgICAgICBsaSAgICBhMCwgMHg3YgogICAgICAxMDogNjcg
ODAgMDAgMDAgICAgICByZXQKCnZzLgoKMDAwMDAwMDAwMDAwMDAwMCA8Zj46CiAgICAgICAwOiA5
YiAwNSAwNSAwMCAgICAgIHNleHQudyAgICBhMSwgYTAKICAgICAgIDQ6IDEzIDA1IGEwIDAyICAg
ICAgbGkgICAgYTAsIDB4MmEKICAgICAgIDg6IDk5IGMxICAgICAgICAgICAgYmVxeiAgICBhMSwg
MHhlIDxmKzB4ZT4KICAgICAgIGE6IDEzIDA1IGIwIDA3ICAgICAgbGkgICAgYTAsIDB4N2IKICAg
ICAgIGU6IDgyIDgwICAgICAgICAgICAgcmV0CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
