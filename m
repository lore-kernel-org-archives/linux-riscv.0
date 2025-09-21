Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B624CAC5A7
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 19:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ba7lSV4YLaAqEZI4HKJgumFnqplhiA/vVSXGd8z2crY=; b=nbLsBA/DgvJY5V
	bW+QK9GXhJ5ZUIuhBwkk9t1T0xErJwghuSLy4Mt/kOLVzfmrp62sYjpTYWpaSuyg5Ydtq55HbP3vt
	0jFd4pkErq8tqT/1kJdBzbZrLNXxQRDo4l1fXmnW0smR9/kAw/SNy4B4xt+MEHTjdRpG3c745XCAj
	HC7IPloXJjXIRXKC+gvCq1IVdzfs4yLsxXR354lwNqoKRChlZjyDWxVNTXWMjUBEG/3ef6cq1FVpP
	M1ctD/HJWfc7ZMIfBBePeLdKoH8+3HzCZFr7r+cliNRKxjI+qW4CwUjP/K7TGJEYbnTspyt3sbNy6
	6mnBpAvvTRiOc3UptUkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Pog-0000000862H-38Ph;
	Sun, 21 Sep 2025 19:33:46 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0Poe-0000000861n-09C7
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 19:33:45 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b54bb1f3790so319027a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 Sep 2025 12:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758483223; x=1759088023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
        b=WOx8afbBnO7MlWfCSqQ+CyNrGA6mO2jYTbbZ2iieICImdffj7ZXe6TxjVMkY31u/5R
         Xv2OTc34dNOFdLQ0VqAiyxR1JOZJ3Tn+SSMeNTJq6nQx3WFEUYZQAOZ97kh93pXCoebM
         AOxyUHGquktau354rkO3YDbi9vOQ1BAynjwZBpSAXNzSBb1VQOaESoZADTHDzu/zEulO
         P1w96/cE8snt+Cm9QOJ5GbwwdNdySb51oP7MB9sqAtxhFQ4wUj5GwIKdTydKanBIz88D
         Fpn21SqqIoVpmYRp/7bqQ9U7vMu5QESqGQeb44SNAcs7Bc9GKROlk7avRXEt3+imAwUS
         9JXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758483223; x=1759088023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2m+X/nfuv9HOhbheWVXsceeU1oB9iRe5Dx2bNoWj8Nk=;
        b=e26wSmwJQgrv/JwT2JRim90OUqz0tsiDNM304dnUchU9kji0vBETYt+kQA0UcwnAY1
         U9i7etcETkEC2cD0o7Q7v6cJ8RdPB1qpl1DJgzEYceLiWEculnaudxKHa2wSMkj7lxFz
         4beMA5I9Yb+vAIHqajWpRXFiKv4Os1bxBpR56pxAUEMqx67yxuHkqG62BIvbWGAwltSc
         5yUGiGEwcgxJVi+Q3UmGA9pgQUmpBmaz5rG4iQFpjFMLU5Q+r6NzGRA5NeyE6RW/niSK
         8hjX7IsBot5/5fVi95tns+F66PiSsOo8kwa8olNqfJ0skYJwrdgMFL+Vf/6J2kuTRZPI
         IZwg==
X-Forwarded-Encrypted: i=1; AJvYcCWPChTB8Q850NZ4C1T3Cos/sEF9AisSNMUIduxgAVvbxgC/65ybfbze6LdQQMSas/Kftdm5l6MqsaKHgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxxpOXOcOao61qlCGZIyxJmv04o7YxGwWnmuAGc+q24pi+7j+7W
	3HURRuprQcZwjhDsHGBU6y3NHqleWkHu9gA7+VV7nArkqn+cXz2O8N3IX/EDORWx/GdaWn6Hqs5
	0bapR9jjtcxt2DxPcp5vNUPTXAwgzFH8=
X-Gm-Gg: ASbGnct8osnOod66Cf0ffUYwVCanY5S8YcW4e9EdOq2CVasqTEdNgwr3svLdT0a+3o9
	N2VyEzBKzY2DrmfYA0S0q7yZuts+dS2NheF79SJNF+ak3nnc/a2R+M2iTWnwcdeqk7MiNj5GlzL
	nJeercAqgzFhjOBKUDGNFLbVjaiV+ykD5PscUC5GzhLe1Ad+WnrHD5QZrQEcT/ICUcE5mumb0Zz
	XK7F8My5grAhXZmLOT8h+dy1gaYYyT7EQ8WZR1WC3y1d1AIBtPj8K3IkZFiw6Qbw2VRevGVKqo/
	s8gFWbqGrf6x/s0ytlCv5lz5YQ==
X-Google-Smtp-Source: AGHT+IG4kRzeiPGLm59ZZQszVAWsNaDqqCH2KI2Z0y+NJALvZL1xRg5SeR7LL082wuOV46ofwPf8NpR+imqiZxjX0Qk=
X-Received: by 2002:a17:902:f68e:b0:269:96d2:9c96 with SMTP id
 d9443c01a7336-269ba2611c1mr76464005ad.0.1758483223077; Sun, 21 Sep 2025
 12:33:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com> <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
In-Reply-To: <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 21 Sep 2025 21:33:30 +0200
X-Gm-Features: AS18NWAcFs0MDi_Dw6rCzaLkE9gp-FV3yn7YymzJYRPsBMfxvetkj0p00jJxboU
Message-ID: <CANiq72n6_JdbgBiZHHiTg4vqnFHdfQhHcV2JpyQ0pz2J+KBSDw@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
To: Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Asuna Yang <spriteovo@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Han Gao <rabenda.cn@gmail.com>, Jason Montleon <jmontleo@redhat.com>, 
	Conor Dooley <conor@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
	llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_123344_079173_0FEE4644 
X-CRM114-Status: UNSURE (   7.91  )
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

T24gRnJpLCBTZXAgMTksIDIwMjUgYXQgNzoyMeKAr0FNIFZpdmlhbiBXYW5nIDx3YW5ncnVpa2Fu
Z0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPiBJcyB0aGlzIG5lY2Vzc2FyeT8gTWF5YmUgdGhpcyBj
YW4gZ28gaW4gYSBzZXBhcmF0ZSBwYXRjaCwgb3IgZXZlbgo+IHN1Ym1pdHRlZCBzZXBhcmF0ZWx5
IGVudGlyZWx5IC0gaXQncyB1bnJlbGF0ZWQgdG8gIlJJU0MtVjogcmUtZW5hYmxlIGdjYwo+ICsg
cnVzdCBidWlsZHMiIGFuZCB3b3VsZCBiZSB3ZWlyZCB0byBzZWUgaW4gZ2l0IGJsYW1lLgoKQWdy
ZWVkLCBJIG1lbnRpb25lZCB0aGUgc2FtZSBpbiBhIHByZXZpb3VzIHZlcnNpb24gb2YgdGhlIHBh
dGNoLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
