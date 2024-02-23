Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3284C54798
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 14:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IuO1BuUSlSAO+blfJkPdUVF/EZWhkwRw8fe8Y8PJtfE=; b=2u8XfI4Dzq7Mju
	I3gQpDJxEK873Gj6Ve2u4dCsnGC68COF+AR0hIhttElaMrla7hNp/FQ2W1deJVR/FOEeACZ+akzgP
	mvmu9jm5UAVp0e5friamQRR36wY/ZT19rD/KFA4J0VkNPu+g4fON3STICQhqplO21HPKR6E8g6vJw
	503N+uG2xv0tSlUFYmyKIgUjU0R+09n5ky93e0AnNyota7h6V+AouUPYLDoLScbruimwsLOGb0x/2
	wqrBgYvOgO1hOWg+ScHj85D07jqDdSaa0ObeVyv4mZoZ+YEGzEx53ZKn3Ou4ChuvZBxaDtSqoYHnj
	yJ/J7tDccLK9ViPvweuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWrG-00000009qQQ-1kIh;
	Fri, 23 Feb 2024 14:49:02 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdWrC-00000009qNB-23Ht
	for linux-riscv@lists.infradead.org;
	Fri, 23 Feb 2024 14:48:59 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2998950e951so692151a91.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Feb 2024 06:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708699734; x=1709304534; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8JApompvM0J/gpnwcLTup3cUj8M9W3A4GPR/LpT+CDE=;
        b=HBHTX/sZKx84o3ynbWQS48kfWMzYVR3uOPgVjyljphHE7UK1l5gZ7zkz8Pf1rZqz/P
         5JRvM+n535nOb6GIwcAD6mm/9l8pG1lgDw29n27RnxwhzHH/E0Ob96hBT4BmdirfCUMj
         sG0c0w94L1ErR9N6rIehcyH4/WZWIyZR+O8mrykXCy2TBsOhjWyNPQ55QLpXyMynqqpO
         H5fdkv/iNwVJ6P3VgSnyTa3VEhVl2mr5YDvdvKCH6nKscNYa+Gs26yT1ll+mX5MMklvS
         oqRkHzOJj0pljWcx7ygm7RKTM18w/MNM207c+h+jvYp095dhEldGWoMUZOUJGmp1ymy9
         +CSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708699734; x=1709304534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8JApompvM0J/gpnwcLTup3cUj8M9W3A4GPR/LpT+CDE=;
        b=qqNCOTV5t0mqZSVxSQ+4Su47ZNo/t8gyBogCpJ4h674zoUGXjnEemgWXIqpI6G/Ebz
         IQp2Z2ERvDkAlbmkkVpg6QKwAg83g0N+86VXQCfBZd7ME7VFOEVAns+D9ReZ0q0yjdaL
         6mh/Ia84Psrr7/CL5VpbzTUt9o211Kb2VK2qvMcLWs7fC4IodK3rnsHGAKlZr9lNrgLb
         SsN7u64SEGqM/b0RNYj3/FwQ+grWltsTZKupt8QVc/75UTK8ta3V9RqH1yIMWVQG68/S
         UsI0GfTNJt5FyAgBkybTJe3/ouvl5M8CusVpQQdPSsXL65AF0izfYy5ENyx3UxPoTsMA
         ZQrg==
X-Gm-Message-State: AOJu0YyUXZ/gENuTOIInXqHDAX9iAnvJDA1urVvRsRrXPvoP5y1xxdCe
	9/LmcRsgBasl09lTxoTWtOZuzFIaHy5ZlmqRGxLbUqqm2AIKKoEVzffFAu+UNmb16MytQ4MO3zn
	I+WaUdQ/j9yQjT4FdETvJ63lxTUE=
X-Google-Smtp-Source: AGHT+IEx80L+NjAGNZBT0jrWK6YYZABf331Gny44+Vt2581VZkWmKe7cyuzJfytUyxpNvh1A/stzEYfy6+bcfMkUw/I=
X-Received: by 2002:a17:90a:68ce:b0:29a:2788:c9d1 with SMTP id
 q14-20020a17090a68ce00b0029a2788c9d1mr7269pjj.39.1708699734458; Fri, 23 Feb
 2024 06:48:54 -0800 (PST)
MIME-Version: 1.0
References: <20240223-leverage-walmart-5424542cd8bd@spud> <20240223-palatable-quintuple-ed221a517407@spud>
In-Reply-To: <20240223-palatable-quintuple-ed221a517407@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 23 Feb 2024 15:48:42 +0100
Message-ID: <CANiq72=z+aO2cvmyHNYOVQyAXLiZeM5KV+YrMXAsCkotJFcHag@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] RISC-V: enable building 64-bit kernels with rust support
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_064858_634347_885EE3EB 
X-CRM114-Status: UNSURE (   5.87  )
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

T24gRnJpLCBGZWIgMjMsIDIwMjQgYXQgMjozOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBBcyA2NC1iaXQgUklTQy1WIGlzIG5vdyBzdXBwb3J0ZWQsIGFk
ZCBpdCB0byB0aGUgYXJjaCBzdXBwb3J0IHRhYmxlLAo+IHRha2luZyB0aGUgb3Bwb3J0dW5pdHkg
dG8gc29ydCB0aGUgdGFibGUgaW4gYWxwaGFiZXRpY2FsIG9yZGVyLgoKTml0OiB0aGlzIGNhbiBi
ZSByZW1vdmVkIG5vdy4KCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
