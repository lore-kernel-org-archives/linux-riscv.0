Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA19E9D80D
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 19:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KmagCocyVWPK35t5igWNZVqkXnAUEkyoJCx8eNmRLYQ=; b=YBZOmUOa29u6sd
	JSh9RTFFvqvjN4zMnvKkpOpZ/LhUUilZvCONWDBbxqT5QSVfAOck949VDaD1sHQ3J7Xq/m7WaD6vS
	GYzw3dU0lzEzES47l5F4YxorTkaZ6x9fM5vDJ3vHHRxj5A/RGQwO/v06OWwGpOqYoPUCsShQjkLbt
	+NtWghfbeOUoWmMC19A8rg5DyhFVXGTGgc2GjMdo37ZlcUTRnuL0mG0FHnmO1m3C/REgUkg0Wnbkd
	pMwEwlARaIFmiNZcCt0S9chThdzQT5Su6DdgRF2iLMQvuSprwZzmncARSeypxxZvuQzp6NPJQ98+a
	oyMtAntyt81U5eO+ELrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TAb-00000004Q2f-3kJS;
	Sun, 05 Apr 2026 19:30:06 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TAZ-00000004Q23-1JrR
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 19:30:04 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2cb19ddda43so250151eec.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 12:30:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417402; cv=none;
        d=google.com; s=arc-20240605;
        b=kuxEDXVUTZ9GSZ+iqeDk/KXw94nxQoU07d7tb6e0hU+77n7JFGqLBEuvjzxwJGZR/l
         N1TTG6aPxPDJaVTKzKVD2RJvlvgp5mqbV5oNjyQn5CEvoN3ppnv8fO1Skcgi57/xLbhW
         s4YD4gKAmFSdVpi25ayrb3H2Q3JgMRYcnDsvdu8Kx95p/DA7Dq5gFOGPdkEDCeEVuN6g
         axnYtVg/S01BQY5OIO8O9Q12E7AY0EI7FEao+94nGIOdmzykXgfrCagtJgT3+19poWca
         AprmpfS9hdO0no/ydtOiYwGTegUTwlIIJ/5gu+Kykkyr3+d4ABQ86SzCHASxKpRBAhzS
         A61g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        fh=T52HdJ/Ma1yTcOIjFUVcSIuS6MRfdRPnWlLLSjKH0Io=;
        b=NbWh1btIc1H5KWZSfAg31Ips7pHPkYr73Si5SeRfGlpsfrrD2KW3knWgDrOeJm8Mw0
         MpZjmHXXhj9OlrwZvY34+rU63JIHQQv36m3plRmT1MOxAgf13L99DLZcdtJdH0HHFL41
         kDX5JW9g2L68+vJ74lY0PYmwXEbiZZMb4qdgBINF/eNmqGSfI+3Zy74lqjF30TvYU1Ne
         HGJfH8tAAIZEtL04XmzPRHKcOcLlPcOSZ/oWvLyXbkdEFzaSsrZAWGQllPZkjEo+zsDC
         A+VE0zp7A1ITSzRBPqTSUzokPQ15LnHak1RzGOBrZkwkYqv3nlrDQMs/nO7eqUESNdaW
         1HFg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417402; x=1776022202; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=dBi3o8h2V24HEHnNxlVbGvHwOtYb0SDNY2Ti3K+KOKgO07QivawN4al2IuYEmmp/Le
         +Mi25xMYLcVygYgs9VilgV4rbJ5u1Ut9lFChdSfwtQB13PGXmCCcDaoKVoi4gyqKiG7c
         JUR6+GXZvvhR5oaRSYv+CUGyvoWGpsUfUyrT4UziIChCiCZvM4XCtHKh4O8cKE/HpygO
         0Lu8GxcsfsddgeT0wnZt6Gf+Aim+h4e0ujzuTlDtpEBXmM3gX25gZqyLRjfMpySS6CdT
         XuoTqmTARRzgpnPQad1M989pfv+7fxoW+i+NtscKQ+q8y5bGMWCqOAlLXImZSo1jUehX
         a6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417402; x=1776022202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tF2TWpDhS6JNHMclno4d/CgtX1qUDK1fcIW7BQ+2mZI=;
        b=IdnAIg4M6oTG6IYd11uoaCqfSMDl1EbIbHumD6AysiQ2H9GVcpvj9hulV04YqhpfW6
         PLTOLazDW6GZeTHWTg3imGpRJYAvoMWr8TTdlrAUuRiAx0vHmn8tF4J54I2Q0IQu/DLr
         4TOWq61QKZKkCEUB2JwS1rA8HX+/FrtJFsTbNmLCnKUq2eshBaZXrl6J6z5mY3V6Jnql
         AqW33tr8K5S7g6CUqHEXO7JaTDO0aALKKM9VGxN55I192UrFg0gzvFVFzbSgaMzJdpZJ
         VqZVctJTbiY/TUZuCKnd0TYFDnETaK7P++N5KMiHy8C/ofnDWxBh+6FwNOTdCUVIBv4R
         /zyA==
X-Forwarded-Encrypted: i=1; AJvYcCUI/XNR3EtOXZAEICRny8gjbWS/jriAuAdiG58+RSPkCj34RHpxu8whKcnElMNnK+ReRpVtGi0B+EYYrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+uwEN5YKSqH1W9oUw4KNG/wJDA7XIfLBsqqj9N41zWJRZDJrt
	XhTHhXaLyhbjs8eqHFE2faCVqmQTaHVqXYuFv1293d0HI3P5Zq/azNIOBTUXkAIXVpwGllvwApX
	3HrK99z6ZynUYaoUYdChGb1Z/6Tq7u+c=
X-Gm-Gg: AeBDievVlRazNAk8isFhl05mMnQFVup52QqLwCUfknX3z7xwyRK/BnqYY4yL7xgqmQT
	hidSJDPch/EU1vI/8OSij03P/h2luboLqteF2ji2HpcEOdDLvK0i/MCji0hc9kzCbYRGmj7qvyL
	5tV6HEkeoaAOwPEhf5kSKODtvFb8706l6S61wIcLK9JBPed+F2hf21SwSJhHu+Dd43hynGMjjIn
	Z4CnGf9XflZxpLC3rHXI74hppZylk37FjtKnry0h4lBfope70kCHuOBal2qPBJ3u4X7iKcjWrVN
	al7mKdKYZ0bsV8uxUHyD3aih4xLxeQhrfOOJend66ZpRVWve0M53E+qxvQDtLZmThLKtaR578xd
	+JeoStLxVSaXa/4H2cqJGZ10=
X-Received: by 2002:a05:7301:1688:b0:2c7:2cac:8149 with SMTP id
 5a478bee46e88-2cbfc95a78bmr1941319eec.7.1775417401965; Sun, 05 Apr 2026
 12:30:01 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-11-ojeda@kernel.org>
 <177508434443.73816.5437391869400189147.b4-review@b4>
In-Reply-To: <177508434443.73816.5437391869400189147.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:29:47 +0200
X-Gm-Features: AQROBzCJ9cjSza_PQiGX42eHlVtWqYPN6hP4vKeYF-tVAvlxpiXLyawV-TKZkT8
Message-ID: <CANiq72=EL4pEagthmrQ=DTNe8-5jWMfgxxx+fsj=pFy3EX0zdw@mail.gmail.com>
Subject: Re: [PATCH 10/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
To: Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R . Howlett" <Liam.Howlett@oracle.com>, 
	Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_123003_355863_F571273B 
X-CRM114-Status: UNSURE (   6.40  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxOjAw4oCvQU0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gImJleW9uZCIgaXMgcHJvYmFibHkgbm90IHRoZSByaWdo
dCB3b3JkIGhlcmU/CgpJIHRoaW5rIHlvdSBhcmUgcmlnaHQgLS0gcmV3b3JkZWQuCgpUaGFua3Mh
CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
