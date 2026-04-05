Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D14BBE9D800
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 19:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bDWf2Vln+sQIPuUaNJT7FejDYmcNyLYfnnCJ57BF6o0=; b=lT8r0E6+F/UA1T
	FrNTeLLAIq5katxsY+Q/Xdpdt2kBJoN6JGmOlkGgpcCwZfCVnJeHavu2nW7DYxX0Z/4ozpnG11qwA
	OtczVijtSBcTitPP6sArqy68+SsX2xhUoL20NhoP4/P5MdHegGP6bj+uTzqJOMxVOMkUmQh9TLmch
	D3uUOcxUVi6p5r2CBmcG5rCsiN8q1D891v9HSouXkmtKkLdDoyTmFc8vHc6gdBKjrwKm+LipeBTwX
	VoTOqmF0VwC+wXYV1SyGbkrzWAJV3swe5syn4LqS3wBpkqoGzq6J5ZgOO/DP1lE8BgNQLrbdjc2rS
	YHDu/uGK4RJaFjCKSYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TC5-00000004QJr-2OWS;
	Sun, 05 Apr 2026 19:31:37 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9TC3-00000004QIP-2kGn
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 19:31:36 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2cc43ca447aso109011eec.1
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 12:31:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775417495; cv=none;
        d=google.com; s=arc-20240605;
        b=RTOUx8GOs/ia7ZBUOZQ9qwiUD20PiLdNC24pd//IH2W+R9AcmwDVzvBPFaaObO0QXv
         zBLHO75VH0P9PbCFbayjJzzL4V7UL+ZSKHgn1FZRl0WZ/6fIOuV87Pb3osbiBOASYi/7
         IxWM0Ebv827aZpKCSSLITVVmSaZ6z1c1yE8AnBCFUXveRNV5UjgH1nf3M4Fikv+YZ57x
         Ex5DK3gp3iXRb402n+kxEfa6FEbB9X7rS4uahgoPyjUbhjNAJwi9aJPeNQU9JsEbmfUw
         kt9auQ1qvNJdDvIo97b1vfg9c+QWp30635JlMboPZWRPEfcugIUr34Q09+xVMGr2JCI4
         h9jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        fh=eh3vRfruN9Ikt7MtuUxG1oEu4uHjmUXX7p5H2EhsJa0=;
        b=H44mb8bDoq3c7i0Kpdd+KMSTOA5ZjANH8G2PJo0IXXuqs/a0joefUBODUW3BTIjEUe
         73pcihdJRM6nZlT+9HV9T/emwjxlepweMZzE07wxv8QAAmv1QXu1Fa2/PDrY6xR2lOsc
         yr+ysbvASVi+DvtV7pSD3APfkOg7jH4BmX49lQmCemwjHH/2MUCLpvSPb0zZcMmlQuhn
         AaKwMxA6Nty6DmKeLyEBYFF7aaSDvSv6fli5vfXJxoqyPUhpmGWT9axnbUaEANTzXrAL
         OSVt+NbBgoE9CxqBpoSvq4lAimNDnlNvkxdLIdwi/mvzz9fQNkjXgeQ5MtwHOLFPHHae
         gXcw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775417495; x=1776022295; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=UfE414t9mCJBOErRz+FWgUqgs5jl5N1abAQyBHrmcigcFvxntQQvgzkEf+2diUFou4
         ZYO57Qoj22JaHWgBa/s9DGg5BBmk8aHL8iZQuWmszVXwt2oaR86I2yFpitQ+7kFKnU8k
         BNpR7FK+fP3Iw6dUBw8brqdHQECczvmTtJsw2HVl1YKjAexoQAqCcF0FKQNNXN8sVEkM
         bAlg2kropDEtdHAdHFw2JrAVSE0P+RABXHSKTRhG5pKhY2UdAfM1jONVdhk22mmajSCW
         Wl9mlB3UT+yIuFXNZ5Z0H0gCLQlUDHqHTluv6HLJQxqu3iozn+/rtLQBIrxr33qIWPCr
         DD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775417495; x=1776022295;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NE2biLOaCGqGSKm11Njp+ZmwyPkoVtMqAuCiMoTPLSM=;
        b=Ap8aQQGHJePlodQMgBQYoyMmLlBx0cAayGd20EYKOSP95kGK1HRTMJPZq0GRTG0ceR
         Ba2DpcDXTCoRMEXRetCotA3TmsVclDSqN3w0aKxv0H7dXKl8iLG0cNKeAdY/4/kiu1Nn
         AzQvs1WADE4vLgWRWdkEcxg2zv5TWZL4WJ9xscKupT0D4CzWGg3/cepV4n32OGgPWbtZ
         Co5M9I1U6RS+IktTJIcDNlV10K+KkFt5Fdkqisk5YHWnJt+kVNPJ46xZC8i17GDkclRx
         yxiXGS6hG1vdx6KdaEs5brPUpff0o6JdlO3MR0xb2weZTU/wkOvgNnVZtaI/qViQWM5X
         sYBA==
X-Forwarded-Encrypted: i=1; AJvYcCXPmDj4Efbt4UwbZnVOWpYNf0o6sOyd2SqhtnDu2sRPTh1iy9Nv7qAq6m79kidT0zfN+f7xznGAWkG0Hw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXTTfIt+azjTdZQayR7tHWoEv+PkJFRJ0+rRgdMS2xbcfbJSy0
	DuzeXloGluOz7ZfaXbxxHjRFfxJwqqE5/wjF9g+7HFDAwt5HR7aAwTQX9a/IrNKZxIYzveI5jA0
	UUpUlbJue5edyf/sBmkVxyzkONlMvCeQ=
X-Gm-Gg: AeBDievFOf8DnuoCi5/BSr42k791P8Pw+tRHOkV5M5UUalIs6XmKJLJdbM8x6uplnyE
	wef0Lhox5v7q/O52cwQU+9psV3xIziBDDETjRLlsz3lUtb61INYWg4dlVCpq9dmCo2Iiazz00Zd
	pPD4YgXoDr/8hC7EN1HXf7aFKjCObmKfE8yUmtxKjh2ajgxG8g2FjoXNJNAwhXida5cBlVfh5vX
	MYbseunRgDPw18Zel74fujixh1fmWpYeKZDyOnCFx+3wVApWH9kp379oaGkzi1g2c9lV9qNG2b8
	lnikyb0wSriVFBKy1m7/MeWu0gVTajklKDzTnO1axsOyQNY+YtBnADBxbhrr66kxFM1hDeEr9fZ
	IRKnCsuT+fokS8juVGLLTh5g=
X-Received: by 2002:a05:7300:aa8d:b0:2cb:cc20:1771 with SMTP id
 5a478bee46e88-2cbfdb8142amr2476120eec.7.1775417494698; Sun, 05 Apr 2026
 12:31:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-12-ojeda@kernel.org>
 <177508434445.73816.7873322235592463050.b4-review@b4>
In-Reply-To: <177508434445.73816.7873322235592463050.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Apr 2026 21:31:22 +0200
X-Gm-Features: AQROBzAFcfOg6EKctMXZNeC0mwP27xs6Xk4PYTGLQOlXdHdfwi1d9GtE-fAbfxA
Message-ID: <CANiq72k1U0JacHf9rEVhOMmeZ4szCPBhbfLxC1K_0a0cQPw6HA@mail.gmail.com>
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
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
X-CRM114-CacheID: sfid-20260405_123135_693833_E42826F7 
X-CRM114-Status: UNSURE (   9.99  )
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
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gVGhpcyBkZXNjcmlwdGlvbiBpcyBpbmNvbnNpc3RlbnQg
d2l0aCB0aGUgcHJldmlvdXMgb25lIHdoaWNoIGhhZAo+IGNpdGF0aW9ucyBmb3IgYm90aCB0aGUg
ZmVhdHVyZSAoZnVuY3Rpb24gaW4gdGhpcyBjYXNlKSBhbmQgdGhlIGZlYXR1cmUKPiBpbiB3aGlj
aCBpdCBiZWNhbWUgc3RhYmxlIChhdmFpbGFibGUgaW4gdGhpcyBjYXNlKS4gSSBkb24ndCBwcmVm
ZXIKPiBlaXRoZXIgc3R5bGUgaW4gcGFydGljdWxhciwganVzdCB0aGF0IHRoaW5ncyBhcmUgY29u
c2lzdGVudC4KClN1cmUsIEkgYWRkZWQgYSBjb3VwbGUgcmVmZXJlbmNlcy4gSSB0aGluayBpdCBp
cyBnb29kIHRvIGJlIGNvbnNpc3RlbnQKKHdlbGwsIGF0IGxlYXN0IHdpdGhpbiBhIHBhdGNoIHNl
cmllcywgYnV0IEkgd291bGRuJ3Qgc2F5IG5vIHRvIG1vcmUKaW5mb3JtYXRpb24gZXZlbiBpZiBp
dCBpcyBpbmNvbnNpc3RlbnQgc29tZXRpbWVzLCBlc3BlY2lhbGx5IGFjcm9zcwpkaWZmZXJlbnQg
cGF0Y2ggc2VyaWVzLCBzaW5jZSBldmVyeW9uZSB3cml0ZXMgbWVzc2FnZXMgYSBiaXQKZGlmZmVy
ZW50bHkuLi4pLgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
