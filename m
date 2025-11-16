Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D474CD4F3E
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 14:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:MIME-Version:
	Date:Message-ID:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uLlGpt9UKzFiT9xn6PIo9iqY3A4vUQKbBlmq9OT/fDw=; b=PhZIbeQZqJuUHMS7rfVgqzmmZL
	eRZyZWcHgXWBgUixPoj5KZnEYz67vO2AguueaM4kc24bsLrIqo3sT23mERIogxV0Og3w7ihe69oeW
	8B0lbV+TA6vFvpQu4PJ2hUIf64iG/lEPwVQh6uN86ZpSl/p1y51M60YweaK3KGI/WdcObvhAMTSW2
	1fGp5b7PGRjWxvyjvWEjYGotNtu4YX9Lt77+QH4KYN9UTGTxZMHaQIrhBikJKaRdf6ud6fIY4aNQ8
	TPUBdgi7/2u0YPgfW87PxFMtxeuqr58s5bGoQ08l5RPcW97L/NDukzvIYjjWoWvkEEof2swbTG7x9
	jZTf9Eaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdrh-0000000EkPH-3EFV;
	Sun, 16 Nov 2025 14:36:29 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdrf-0000000EkOu-1rhH
	for linux-riscv@lists.infradead.org;
	Sun, 16 Nov 2025 14:36:28 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-787eb2d86bfso34379077b3.2
        for <linux-riscv@lists.infradead.org>; Sun, 16 Nov 2025 06:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763303786; x=1763908586; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H+F1DJD0GZc6bvHB+TDiZj6OgrECMAIQWaZ2LQwvMyk=;
        b=FaPVpBzLxbQSY3DzCwJF4uh+LMyCFTOeZ21nklN56d/lehLfcn5ibdZvd0BY8Uf2dH
         X1pb/kotCaTKiOUeLpQI6r5CLPTs7a3/zB2MkC2kupElB0U9lEzNOD3yh7Ki3eZBbyfA
         70kQ05YafDlalR1nHX2OgfYp0WDaaR8n5mxfWOQwXKfh65G5E67O6N7SZr3Xdh171izb
         3389P3tIgHlhVjrrg9sUCjg3GJQuTA9NMx55BLANj1DaIC73P+UrFZipdHP38DNEd/7V
         uceseKvgLJq3QOAYknX3fKcEtKvDaxMosiziDBYmG6cRq5J2n3dWj15hzMuR00NREMJs
         UlfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763303786; x=1763908586;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H+F1DJD0GZc6bvHB+TDiZj6OgrECMAIQWaZ2LQwvMyk=;
        b=QEbyzig8Oe6hQT+dy/SpAqPlFFQEzF/DYqTKc5o2+jjcypzxWZ3MLHVqhas5Y2JCkz
         Ajxp3GspR5/J650bS7J1wYgDquxhqUZ4wmgygJhmdsi9DsxCtI9KiYOVhcWByTaiYBVV
         NpdH4nKxH8s4hobtU9nYCqR5MQcsrJWyxVcRyF83nGmW0Nzt7juRel0dVX3jxgTJRQ1l
         YmM/Gg/bKY24o7d05ays3Xw/pvGzrXhopFKkH4yT5k9ddrNLpo5RuwIJAxFz5RYNPkzW
         qX4vopCpvleMkcfI3sPcOrcDHzwMMi9I+ZNYByHGE4EIUoXxXsUf80ya63CMKbkaQg11
         gX4g==
X-Forwarded-Encrypted: i=1; AJvYcCUi+RL04G3fjSy/BaLtU4DYoyUPJ19oIg+4pTfh740LRqnsSIvVpvkQlKUDjHiJixPes81dEB7gcq12tg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxu/zz6DTIX8MH/Rl5sLQHnZTJKYChWqWWZCfRuaAJm5kbQu9kH
	ioUiMITz0oL4dFFPh3eobZB0FzbHjhsiRgos0d4Hj6CfAk/oAmQRT3P6
X-Gm-Gg: ASbGncspJRAyVqlp977izIUQJCGiRChNZYtLOFZkpYS6aJ33wWOWUB/k5lfIGTMGfbK
	KX187TcD1nkIKzQQZr7d1Q9br2moklBa8f6L+TBiZ2MkrAcpmID/Ug5RPeT8+Vjm5K5Af9C9ga+
	1CecZFQ3IYjYLstYH4EuUBReOnQwKcyyo9LzElXjHoUFa9Fmx7mg4Nj1WbSXIfE3tHKdUoJKyrN
	6BV0RrW4kXuALlwViXVw8nd4xum0+s3Pg+aXtgoCkvmfsGnykAN7k+iNMV7kr87qYmGQtekGR3u
	8fzCsT/hTNdaoMGl4tiiW+/C/nfzlXGW0ArmD6hUdpDmRdisAYIkm2ne8P4RJA7rGIjSFJoWlh0
	9dkwCguEYTULxERJwgNXlLWl/jHFmjtoa3ZvI+jraCLMKmd5D05E0c8IktAFS7MunpJKatdvCYM
	OUwjn1Gm9XB6E6fhnrxQIgGC02HW6/jcDTu/L2/0c8
X-Google-Smtp-Source: AGHT+IHNIw6QIiDFPjc4EkBNFnRmBFkcbvwCydSVQ0KYuZPWWteIOQJm4rOkV5skYl/t6OkSO5fGIw==
X-Received: by 2002:a05:690c:c019:b0:788:1086:8834 with SMTP id 00721157ae682-78929e0d1a3mr64629257b3.12.1763303785409;
        Sun, 16 Nov 2025 06:36:25 -0800 (PST)
Received: from [192.168.1.209] (89.208.240.37.16clouds.com. [89.208.240.37])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78821de192asm33464657b3.8.2025.11.16.06.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Nov 2025 06:36:24 -0800 (PST)
From: Asuna <spriteovo@gmail.com>
X-Google-Original-From: Asuna <SpriteOvO@gmail.com>
Message-ID: <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>
Date: Sun, 16 Nov 2025 22:36:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>,
 Conor Dooley <conor@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
Content-Language: en-US
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_063627_513216_4A6681EF 
X-CRM114-Status: GOOD (  14.06  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgZXZlcnlvbmUuIFNvcnJ5IEkgd2FzIGluYWN0aXZlIG9uIHRoaXMgcGF0Y2ggZm9yIGEgd2hp
bGUuIEknbSBnZXR0aW5nIApiYWNrIGludG8gdGhpcyB3b3JrLgoKT24gOS8xOS8yNSAxOjIwIFBN
LCBWaXZpYW4gV2FuZyB3cm90ZToKPiBJIHRoaW5rIGluc3RlYWQgb2YgdGVzdGluZyBsaWJjbGFu
ZyB2ZXJzaW9uLCBpdCB3b3VsZCBtYWtlIG1vcmUgc2Vuc2UgdG8KPiBmZWF0dXJlIHRlc3QgaWYg
YmluZGdlbiB0aGUgYmluYXJ5IHN1cHBvcnRzIHRoZXNlIGZsYWdzLCBsaWtlIHdoYXQgd2UKPiBh
bHJlYWR5IGRvIHdpdGggJChjYy1vcHRpb24sLi4uKS4KPgo+IFNhbWUgZm9yIGFsbCB0aGUgb3Ro
ZXIgdmVyc2lvbiB0ZXN0cy4KCkNvbm9yLCBzaW5jZSB5b3UndmUgcmV2aWV3ZWQgdGhlIHYzIHBh
dGNoLCBkbyB5b3UgdGhpbmsgVml2aWFuJ3MgCnN1Z2dlc3Rpb24gaXMgYSBiZXR0ZXIgc29sdXRp
b24/IElmIHNvLCBJIGNhbiBzdGFydCB0cnlpbmcgdG8gbWFrZSBhIHY0IApwYXRjaCB0b3dhcmRz
IHRoYXQgcGF0aCBpbiB0aGUgbmV4dCBmZXcgZGF5cy4KCgpPbiA5LzE5LzI1IDE6MjAgUE0sIFZp
dmlhbiBXYW5nIHdyb3RlOgo+PiBbLi4uXQo+PiAgIAo+PiArY29uZmlnIFRPT0xDSEFJTl9NQVRD
SEVTX1pJQ1NSX1pJRkVOQ0VJCj4gVE9PTENIQUlOX0FDQ0VQVFNfWklDU1JfWklGRU5DRUk/CgpU
aGUgd29yZCAiYWNjZXB0cyIgaXMgbm90IHZlcnkgY2xlYXIgdG8gbWUsIGFzIHRoaXMgb3B0aW9u
IG1heSBhbHNvIGJlIApZRVMgd2hlbiB0aGUgdG9vbGNoYWluIGRvZXMgbm90IHJlY29nbml6ZSBa
aWNzci9aaWZlbmNlaSBpbiAKLW1hcmNoLsKgWmljc3IvWmlmZW5jZWkgYXJlIGFsd2F5cyBlbmFi
bGVkLCB0aGlzIG9wdGlvbiBhY3R1YWxseSBkZXRlY3RzIAppZiB0aGUgc2FtZSBmbGFncyByZWxh
dGVkIHRvIFppY3NyL1ppZmVuY2VpICgtbWFyY2g9X3ppY3NyX3ppZmVuY2VpIG9yIAotbWlzYS1z
cGVjPTIuMikgY2FuIGJlIHJlY29nbml6ZWQgaW4gbXVsdGlwbGUgdG9vbGNoYWlucyBhdCB0aGUg
c2FtZSAKdGltZSB3aXRob3V0IGNhdXNpbmcgYW55IGVycm9ycy4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
