Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C2A4EDB7CC
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:37:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=B6ZO5j/Vl4ZioDA1PQA+KHnTisLORtiHeCCblAm4ojQ=; b=3ZGnPGOZSJVf5V
	ILBcV/0SVHEkpRZAjfbWZ4ndUzfIKil/C/aOp70WtrR6z3cE/QzSAIeTZG/0R0KBIe1KVrFL57coP
	a9a0yjA7YpxtyRfBTZdPMivaeelJSU3JSPEdtUStMcCXkRn6TqKPKM1AwY48WGW71GooECYpzXoIO
	PGwg4+zJGGrjG16p4GXpIyL5gyTK7xgk7rpAWfhL5NzRNrqk/rw9t0v8fIxs4p0LPA5Dcfcp74bU/
	ali5nlw8IdbvmAocAHF7IhxSERYiyus0A2UqN+owNGISh9UICl/9spw4mJyIMaToFiEq8R3hnNDS3
	XkUeVVljt7UykTDFysgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1wT-00000006AjT-3DtA;
	Tue, 07 Apr 2026 08:37:49 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1wR-00000006Aij-1S85
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:37:48 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-2cbc50e6a36so303653eec.3
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775551062; cv=none;
        d=google.com; s=arc-20240605;
        b=JTEPiPSWFCgEiqQkfNm4yvl3lNKDrVfYfQ/BFlSgk9ukjEnkYPIxmy/q38U8U1opYn
         iJVJmyMnrifhGZ0+2NstHKE/f2x2DYIWtSp+JDwEtb0qCC29+1C2GQNSihFE+rUqaaj9
         t5YuOPiLPZkwDNwFjVXa+l0q5E0pBDW1/anuOKuWNfTiwUBFR+2JH0P0m7r1cxXeK9ZW
         O5TVPPi3JB+luFR8Z0Faf7aVdaX0rzsKeHtRn8sDE91BsAGVqkzHdzuIJnJldOVsByvb
         J5RWLiy/kXX2/16aj7apS6XvhUMO0/GY2ZKvQpqs9cldFSB3tNSt9FS8W+OkD6j596Ca
         rJFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        fh=UxZWHAenk0WpuM5kzKsAHigxjKu1ZS5L+LKoKKz3Fas=;
        b=lDHNPHXDju64Yj33MXmmAOaW7R5rOJzmGGGuF86/HkZHZlnR30oes5gZqqcNk6as4D
         rqXorhFQliZc6soO1j1S3S4biL1ZuYbvb3RARPBejNsqdH00OlQGwT8ddhfr5aGVn1gQ
         vu9WAiu71OCN1K0Iwr0vBnGmm2GNz6ng66U2+N/lbaqWz/RG9r2leMqebgN/tdBPjsrU
         r0r4om6kytO8najoPkxE/htEv2rMtMcKPr9INr2FBqTvYpCkLJwGiY7c3QUgzBIeJNSC
         dFEW3+jREQZQViH0G+IxZ1fAdhViQyIap5K0oRfFKowSQogS7LQOkORseKfgCub1rDC1
         p1Ew==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775551062; x=1776155862; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=fxeuv0ofJH3NLhhAo1fYJ53+BJxGhAsaDbJ8A6a3LUlBuL8pjSkwQ9XBQylAEN88c+
         Z6PMXxNKXxLcgHNOWGFGVSgp/uhgl0PPHLTnxLXWfQzmR4PsYk2mUdZABGb2pNwdEzYU
         vqfSoo9QvB7Unj9mEGcg8wNTywxDff94LNmvAaSiLORISn1gd6ogr2UBW4avRQq+IJsg
         ImSYFH8RqyiF+dYC8H3/1x1Yy4A/cuKN+IdqOknQlk2r07mT+yCijEd2Fpvh9to6bGqH
         lrpHQS8spfocvE619ySskiyBL1APC4gDV9iQ1cJFVHLYfMsBw+OlRVgcaYMBQ76oZXSi
         ueIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775551062; x=1776155862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Gy0ttEzqHnoPOGT+UhllrpZ7VKqpJE2isFAosOgHjU4=;
        b=lMh7nTCV/whlwLyy2PhX0M6mhlcgA1RVrgfvIw+u7ojiXqMi0xP0QYytOuCYN8LEcT
         gMqn+bRsI76bYcJ9R9JIpz04j76vNbanW8asMcpi9y7gYdTrG0OuENz6wIdU6QJcu3nd
         3LgeXjma6A2W3CY9lkEy1QlO/LCyeQgKJw74lJYqSSblZIYhJDco5PxARZkAi7X4u4L7
         WqQEwT72qM67gYZLS+P9txs5ud2/l/9/D7tn/qsYIWx31X0qcPStrrP58ANDh4sz2lyK
         nCpYeUuIAemaLJ/joXnNsYRVg4RV2em1tKdRl0EM4TI5dQ8TXdUDR9UhCjTybjwEjvgC
         ZPGw==
X-Forwarded-Encrypted: i=1; AJvYcCWJuSV2VKwntWQ9bU52aXPqTHf//qaGEhxHHnwItORNzPoFbpBNa/V4pewVJypZ3sqy+lp1dQYKnEbJRw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyA4QSKehoL1btoLvpXK1MZW/oYHG9lmnG6J78lLfM4CYdJwsfm
	pIfpDaP4yJj+Fr1gJyI+ohL9qmWr6I/6xAGTVGU0QQ/xX3hxWzLRdUjhWfR92cCd24sfHXUQ/Vg
	RsbxBQiS0PJsW9xxkh1r/dcbSMYYIa8M=
X-Gm-Gg: AeBDietCGwhkYdQ+iLRAVx7iN2rs1iFLs6icZJO+xiYwVayxGLufBkmvHR4oUf+d6lr
	0Pj84jx6Ux+XUk1HVPWQLQQNK0conCySZOXA05s7lj2loNThD4mA2LQSr6+oFGNPWLtFg4LMJop
	CbhZo0SJP1rkV9LT5GUGxqFPqcQH9bRHzfGcja7FuYG5i5Ue/XuGn+JrB1c67U3JurApYJz+gcd
	1DwKjlL4asjc5GJK7WkLblhVP2a9REh+SD7+35Q9fwr6MkkwOar6fPw2LL47N8674x65EREuwsE
	1eRw9EmZ3I6FNA4QV+tGCkRYbMVXoYZtpgxhItBVMDXo3sYz9QBkvbVXeVu8yQTS9m8aydwHv0B
	clMxRDq/Jijv0f0GMJe+PcjE=
X-Received: by 2002:a05:7301:d1b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2cbfcd54f9bmr3830933eec.7.1775551061539; Tue, 07 Apr 2026
 01:37:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <20260405235309.418950-8-ojeda@kernel.org>
 <177548573697.95472.13544191227699996309.b4-review@b4> <CANiq72ne_JYPodnROckyNto10ZF0PqadRxSrng5-mZyqVovxFg@mail.gmail.com>
 <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
In-Reply-To: <CAJ-ks9kbHz_KYAXx02vgW1dN2pfb5MFoaSoU1HbJbJg2O8EUaw@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Apr 2026 10:37:28 +0200
X-Gm-Features: AQROBzD3OQzI1eA28hVCCiGMvz4r5THmhHuU5dUr3xJV-N5wbeOjrOxDF8RLuuQ
Message-ID: <CANiq72mJTT7xFnhm-CeOZM_3ZwGdaQ8F2zUbONpPbqJ8g7DokQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
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
X-CRM114-CacheID: sfid-20260407_013747_482531_D61F0DC3 
X-CRM114-Status: GOOD (  12.93  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCA1OjMx4oCvUE0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gWW91J3JlIHdlbGNvbWUhIEFjdHVhbGx5IGl0IHNlZW1z
IHRoZSBsaW50IHdhcyBhbHJlYWR5IGltcHJvdmVkCj4gdXBzdHJlYW0sIHN0YXJ0aW5nIHdpdGgg
MS45MC4wLgo+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL3J1c3QtbGFuZy9ydXN0LWNsaXBw
eS9jb21taXQvYzBkYzNiNjEgWzBdCgpJbmRlZWQsIEkgaGFkIHRoZSBQUiBsaW5rZWQgaW4KaHR0
cHM6Ly9naXRodWIuY29tL1J1c3QtZm9yLUxpbnV4L2xpbnV4L2lzc3Vlcy8zNDksIGFuZCBpdCBp
cyBuaWNlciwKYnV0IGl0IHdvdWxkIHN0aWxsIGZpcmUgaW4gYSBjYXNlIGxpa2UgdGhpcyBwYXRj
aCA6KAoKU28gd2UgY291bGQgY29uZGl0aW9uYWxseSBlbmFibGUgaXQgZm9yIFJ1c3QgPj0gMS45
MC4wIG5vdyB0aGF0IHdlCmhhdmUgc3VwcG9ydCBmb3IgdGhhdCAoYW5kIGFsbG93IGxvY2FsbHkg
c29tZSBjYXNlcyBsaWtlIHRoaXMgb25lIHdoZW4KdGhleSBwb3AgdXApLCBidXQgaXQgaXMgc3Rp
bGwgc2ltcGxlciB0byBqdXN0IGlnbm9yZSBpdCAoZXNwZWNpYWxseQpzaW5jZSBpdCBjYW4gYmUg
cXVpdGUgY29uZnVzaW5nIGZvciBvdGhlciBkZXZlbG9wZXJzIHRvIHNlZSBpdAp0cmlnZ2VyaW5n
KS4KCkkgdGhpbmsgd2UgbWF5IHdhbnQgdG8gZXZlbnR1YWxseSByZS1lbmFibGUgaXQgd2hlbiB3
ZSB1c2Ugbm8gdW5zdGFibGUKbGFuZ3VhZ2UgZmVhdHVyZXMuCgpBZGRlZDoKCiAgICBbIEluIGFk
ZGl0aW9uLCB0aGUgbGludCBmaXJlZCB3aXRob3V0IHRha2luZyBpbnRvIGFjY291bnQgdGhlIGZl
YXR1cmVzCiAgICAgIHRoYXQgaGF2ZSBiZWVuIGVuYWJsZWQgaW4gYSBjcmF0ZSBbMl0uIFdoaWxl
IHRoaXMgd2FzIGltcHJvdmVkIGluIFJ1c3QKICAgICAgMS45MC4wIFszXSwgaXQgd291bGQgc3Rp
bGwgZmlyZSBpbiBhIGNhc2UgbGlrZSB0aGlzIHBhdGNoLiBdCgpUaGFua3MhCgpDaGVlcnMsCk1p
Z3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
