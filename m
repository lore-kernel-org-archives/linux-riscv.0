Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C067EEE26C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 22:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sm7nP/b76vjcOWyIneG/ORAAQX7/qRnVcRS7aTlntzI=; b=nb/i462aI8vX4h
	H06Z/2m68b+Fwmeb49a7Bp05kOxSI4xpLeP+H5uvPujajvm44pIo/JOJKEP4SfBC7uYKpTfM8dq8m
	KK1aFLLkx41z4Fj5GPtqOpLLbtBL+GYst9Yb/cSlDf6VknAHmOzXUckz88JgmXP00IqnQJQkYXqQp
	AtnsGCEKG+WP9zf8XHB5R8/bUKDy3aH+dXoAsl+3rRR6Tn7cvFkK+/nGgEvvBJtQLFDYZqDnLAp9l
	YeMiUPHfiLkSBV3FBf8rT5aJsB1R/hBClIEWpc8ieV+uKMkODps697sKrm1RthPqIONtQf/Itjw9W
	jskxDqjl97zxg/NXggng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sos0S-0000000EKZP-1xKg;
	Thu, 12 Sep 2024 22:09:40 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sorzN-0000000EKUh-3AEV;
	Thu, 12 Sep 2024 22:08:35 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-2d8741c85bdso228148a91.1;
        Thu, 12 Sep 2024 15:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726178912; x=1726783712; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2YLoM8QgDHNOaLNzKK8v/KNYvua5uBzCv9i1eFPyFY=;
        b=l5v6MywdCu7HKloqsRSdscM7f5UUWPnNLMu2lCa+vNLK6PBDLv6E8AStyEvTa8g6Gt
         uFyautxlUmNJIgWnvXa9hXmo1vZN5pV4ndsfR6osErFN8j7RwDnDNgYvPrBGsVvmSG9Z
         a25wjCXYyxaYkW33oX2H62NxFdgznkNQGDnTOWvKUfogS2Xwzbl9u3MIcx0mUPCK30IJ
         nit0BQOFrzw4qPpHsn+ANvu+W455x6CJm8Nn7/m5ncVRyFUfZRh15Xv30BzUpSprYHs3
         0cWSxwz3VVV1OQCIy9IzyWO1ga9E4PAWNFvgpUUvM9u3uTKgdHP6m+aDSJH7V5/JvStQ
         WhHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726178912; x=1726783712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/2YLoM8QgDHNOaLNzKK8v/KNYvua5uBzCv9i1eFPyFY=;
        b=j+KNRHE6SYuGpx/EiSZdR/yuvkEVFKlkC/Gsa+dpAtDXvLvSp+YjCXw6vrU1Zy1NNk
         yBeL6xuGKnaD+yOxx/1h1MndG3IuZc2JmoQNQTNs/eIGPQ560m19/m7ZViU8ruLwxdtn
         peNREsw7VK7VW3Dxx+Jb7cxCg4KjHlrQWfn8Q3YnuGV3GXC/roL9SQDhqh8mlwVOpxJ6
         Xq0oYYBY2NeXR+UxLf/C0D9b+tyIzHtFCH3ajnV8MD1ELSQGtGOAvdsHjg+gq+fZ4kx2
         8lEm/Umy4IjbgX9aGVTOtlz4cU8U+PsUAj3XJWZt6nCyhcJDHGin0sQzTGBLFIRO+NwI
         rxnQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ7DSu3kIIeV3Zg6teOvTUguRbvcsqgJsLfav+VehJIr72Mvn84bKDBwPqxkYC1i9mkS7Fu2cvd5BNPcd2TWtc@lists.infradead.org, AJvYcCVUi0onUYKXoez6e2wicVpyuvz1Glix2bWREHExwgoD878HqWlkTqvY9yci9gYEHqiebXJTwzi+HGF9Ak8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx0cFGLPHj+I8Ql59Hk934PKzfGWAaUhPDsGCl7ukp85qpqBD5
	fKfxx51zM/M0iy4CHSpyxY0ADIetS6uDeX7WFEdTMc2oznYRii7Xil//oXErZb8CJ/kjLB6Wq4o
	ZIa3tBGlR2DKXKRFAFAD0BOXhQcM=
X-Google-Smtp-Source: AGHT+IG6aej/NB5LBMrn83sRcBRKI2TpgN93fxt/vJJgonNH0ivdw+rd6rheCsWsaNjoH5e3gvokg2/fm6nDqHPOGEI=
X-Received: by 2002:a17:90a:d791:b0:2da:71f8:7ff with SMTP id
 98e67ed59e1d1-2dba005b46amr2003435a91.5.1726178912177; Thu, 12 Sep 2024
 15:08:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
In-Reply-To: <20240829-shadow-call-stack-v7-1-2f62a4432abf@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 13 Sep 2024 00:08:20 +0200
Message-ID: <CANiq72kNmvFOXhhAcQJQdMC872908=CWW15_bzyyt9ht2q=twQ@mail.gmail.com>
Subject: Re: [PATCH v7] rust: support for shadow call stack sanitizer
To: Alice Ryhl <aliceryhl@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Jamie Cunliffe <Jamie.Cunliffe@arm.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Nathan Chancellor <nathan@kernel.org>, 
	Conor Dooley <conor@kernel.org>, Kees Cook <kees@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, Marc Zyngier <maz@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Mark Brown <broonie@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Valentin Obst <kernel@valentinobst.de>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	rust-for-linux@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_150833_813370_520B4339 
X-CRM114-Status: UNSURE (   9.17  )
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

T24gVGh1LCBBdWcgMjksIDIwMjQgYXQgMTA6MjPigK9BTSBBbGljZSBSeWhsIDxhbGljZXJ5aGxA
Z29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBBZGQgYWxsIG9mIHRoZSBmbGFncyB0aGF0IGFyZSBuZWVk
ZWQgdG8gc3VwcG9ydCB0aGUgc2hhZG93IGNhbGwgc3RhY2sKPiAoU0NTKSBzYW5pdGl6ZXIgd2l0
aCBSdXN0LCBhbmQgdXBkYXRlcyBLY29uZmlnIHRvIGFsbG93IG9ubHkKPiBjb25maWd1cmF0aW9u
cyB0aGF0IHdvcmsuCgpBcHBsaWVkIHRvIGBydXN0LW5leHRgIC0tIHRoYW5rcyBldmVyeW9uZSEK
ClBhdWwvUGFsbWVyL0FsYmVydC9SSVNDLVY6IEkgdGhpbmsgeW91IHdlcmUgbm90IENjJ2QgKGF0
IGxlYXN0IGluIHRoaXMKdmVyc2lvbj8pLCBzbyBwbGVhc2Ugc2hvdXQgaWYgeW91IGhhdmUgYSBw
cm9ibGVtIHdpdGggdGhpcy4KClsgRml4ZWQgaW5kZW50YXRpb24gdXNpbmcgc3BhY2VzLiAtIE1p
Z3VlbCBdCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
