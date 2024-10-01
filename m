Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6C0CF64BE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 13:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RKMoPZFCAF37gH/4KoHsHqTFxH5TEoYTaX8vkawSFWk=; b=TCn2TNOwJVgs/F
	VUfwC5pkIJ459xcfzF+V7ixhwXmswhliQ6cO8TCaG0cSxO/+6m4G5xHxNMj1PGG/wr+ArgCLK2JYh
	e4avi9WrJkP9m5QIRBJ/RHUOLdNyzwiLdJigwUJuZe2AmeyT8ryWcQ3LvcmcHrPAMttMkgBOowvYu
	Bca9BN7PPtjKR/76DTRHdYJpQX8qal7S+RmasuDZoUXWNX6GIiYMk8KhBV+yXIIH78dhY04Ng08fP
	XlsYtwkKf8z+GOsgFGcWsHMZ5Y+1tJw45EY7hiemfRd7cv/uuhc5aTkFjztXT58HsKGT28T/AmeQ6
	F+8fn18s3+UKAAraMtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svd00-00000002xbS-2pFS;
	Tue, 01 Oct 2024 13:33:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svczy-00000002xau-3OTp
	for linux-riscv@bombadil.infradead.org;
	Tue, 01 Oct 2024 13:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=; b=X/lR5zW4GLHG6YknFbyl8I7ac1
	OQ/tOQFJAcBvcp9/go4Wm3rAav/928mFg5fKqMFgYxFUlbSdfZ/71SGfP65fvxtC7ZURy15wIwdTm
	zEcPPunYVWTUyMaNc1Dy+o1kddmj/O06poY6M2FxLRQ2ZZNPZuH66Vl2eG1woeH7xnD5ZSM9PtVn/
	JZtDkAZnuuNQYMkKf1Ke9EVUZUHhrlI4e4vD4NkDSvklJeVogP+TPK6deJA+liXilbG0ztauEt9z5
	Gk4uE6w+eJOemLcxi5Nu5xOl1occlxuzikPO9P2ykGo6XhvGw59VflEniSPQLu8y0pnX8ejMub9P/
	s65rM3Jw==;
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svczv-000000036tI-1vGM
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 13:33:05 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-37cd5016d98so2813582f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 06:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1727789575; x=1728394375; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
        b=YOolCgGKa67hXJOYiwS0hjeFHd8KYSGDPfBVXcYRHy738bMPKoeb+JLD750oPHdRsP
         +a64yWBWEIemvN5qeNKYriWxy0lNzbamM8OddR06uSlNspOFxlhyayERicat4w/OT34g
         RJuvxr475emJkxC+2fOGX1TJKYBLx0DbGaT7IEcScslo2rOrbpqK5YG7BKiwu+vvgt31
         TjdAqCOLOCAUrWDfLPAIyWuzGg7KjQ8KN8d+SSMqBkaLZsLsLX6Zinf7WY80L2Hbg8TM
         +igk7PnMklbDwXOz6q3eGgqf4SGpT6AbA3BwXoBLS66+fI03jMlaWqq1JXjupm7QRnjp
         Ug/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727789575; x=1728394375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jG1f8aoHpacDaHdb5KmywmlItDO2TWAWsVpCx9NXHQc=;
        b=o0BA4URpGNrEl85DwrK3NwqrKJimdGolRzTSotI5fE8p+8LeDa7u/Spc6ssKo6pRSX
         aCQxb+mZliO9IFkmvSKoLKGYPjjbBomX6Kark1h4HOe0tOxWFdtOgwasuNYyx+W9zkIT
         b46JsvicKUSQw9FcPSKo3x7GU7/Eyz1dv+iGptR2eynX9reU+mwcm5R3KZNKGmgr+M/7
         VapuQzHDvgjtcN3Eh3D9jgp2DL4o5ee4oGHbvZ5AEt7UdfRgEm6oQF2aaMmY0qwntJ8C
         dhX/yrpXPWLxPKbG0COW0qyZ97qZ+f6Eip5ZJ08C8yJTNroGO/mfBTN05BShXK9vbngK
         8eWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb9yFKaLoYVLpXqAO2TFFro3amY2x4EvOhjVxs5iqQLTeyfaItCp/ywgAb95663KxRRKHeuctfXnTx7g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+PrDQo0HOHAD2357PRnBD59GPzZDYsUDzvJkRUglktJXf5WBN
	HC3i/295c6WFeekerUyPQu5+GArrCoFgM+F9CN55gLSUgjHsERF/nb/hMzJVV6Mf3pUEJC89DY/
	edmsl2UnYeIFTH/aK/l7a3fo020UJCwppcTtx
X-Google-Smtp-Source: AGHT+IHyQsBQmmP7WyMzsvnT7IUWl/PkBkfPPLhhwzoxkBXURriZ4Opu2OW3tEtRkPbGqwQWer73IFV8Bp15N9mptmE=
X-Received: by 2002:adf:e8c1:0:b0:37c:d261:3c6e with SMTP id
 ffacd0b85a97d-37cd5aa9a0dmr7774912f8f.10.1727789575379; Tue, 01 Oct 2024
 06:32:55 -0700 (PDT)
MIME-Version: 1.0
References: <20240822-tracepoint-v8-0-f0c5899e6fd3@google.com> <20241001091527.2fe4e039@gandalf.local.home>
In-Reply-To: <20241001091527.2fe4e039@gandalf.local.home>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 1 Oct 2024 15:32:41 +0200
Message-ID: <CAH5fLghOiGmcpQZvOwn=d2Jyo5+CDA_cinbGjkmjTgSeusAC2Q@mail.gmail.com>
Subject: Re: [PATCH v8 0/5] Tracepoints and static branch in Rust
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Peter Zijlstra <peterz@infradead.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Jason Baron <jbaron@akamai.com>, Ard Biesheuvel <ardb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	linux-trace-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-arch@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Sean Christopherson <seanjc@google.com>, Uros Bizjak <ubizjak@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Mark Rutland <mark.rutland@arm.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Fuad Tabba <tabba@google.com>, 
	linux-arm-kernel@lists.infradead.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Samuel Holland <samuel.holland@sifive.com>, 
	linux-riscv@lists.infradead.org, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Bibo Mao <maobibo@loongson.cn>, 
	Tiezhu Yang <yangtiezhu@loongson.cn>, Andrew Morton <akpm@linux-foundation.org>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, loongarch@lists.linux.dev, 
	Carlos Llamas <cmllamas@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_143303_612144_9E2A7AB2 
X-CRM114-Status: UNSURE (   9.50  )
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

T24gVHVlLCBPY3QgMSwgMjAyNCBhdCAzOjE04oCvUE0gU3RldmVuIFJvc3RlZHQgPHJvc3RlZHRA
Z29vZG1pcy5vcmc+IHdyb3RlOgo+Cj4KPiBIaSBBbGljZSwKPgo+IENhbiB5b3UgcmViYXNlIHRo
aXMgc2VyaWVzIG9uIHY2LjEyLXJjMT8KCkRvbmU6Cmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3J1
c3QtZm9yLWxpbnV4LzIwMjQxMDAxLXRyYWNlcG9pbnQtdjktMC0xYWQzYjdkNzhhY2JAZ29vZ2xl
LmNvbS8KCkFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
