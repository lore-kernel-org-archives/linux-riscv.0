Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D298F46C66
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 19:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CUAeFahZJrNtsrZ+cuE0lQIoyB3Gagsj7HP0VA6HSl8=; b=rznK4TZr6rAy6Q
	RgnGz7QpVamerVLskX3PSnGy9PurVgw9XeevqDgtvh7Vr5buEIulvJogKvkRLuAmRqc2DqgYtV0YL
	UNLLaBrOjmpzLQHcz+rR0LB8dKDF6IP9Nk87dNu7WdQvhnQ+nY72HSOj2Cni/tV2HarAvcEJW0BLn
	zW41d7rjQQ/5OAoaX2GbmFxYYh620YIIP3K0u0MEcdVhzSyXGEjgOqoOgvpBEuXIGBXCmCDZEHRSM
	SbE+zANjyjScJfjiEQ9EFAAs3Rrh6EesN6Ph33mxKOEyLbg7gWmyJo1eXZd8p0De5Ku3bBk4b3g9x
	9jZbeTBdjC79tEyCmktA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pCr-00000005R31-0wYY;
	Mon, 06 Apr 2026 19:01:53 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9pCm-00000005R27-44Aw
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 19:01:51 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2bd5658b901so258254eec.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 12:01:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775502108; cv=none;
        d=google.com; s=arc-20240605;
        b=Zee6Hq/3BdV1kd4wrIKjSuvp/JQO8Eq219sMl51ACn8n7RWWmslvHJ2tTGUE3z6rEC
         lNNMwfu42oGLBBVKIlNrc1US15t/3VNxZQ/rbgzDsRJ99SuhXJ9dhI0whxWCPXwxni+I
         z1617xtRNY8ptX7zi5NrpO/Mrzd5BnX/aDpLt4RYGT9dRcYR9MWZ5nbZXydI9joj5NJp
         gVc3RYgiMxrMc0pOKUVyJvtHQolCE8Btla46oPdy5X9jEWU7p9mGbO2mPHGSjbUi82pM
         VaRXvALu0jymNwXSrGZMb15WCQwuw+jpKfd94G6uWnwaZNIZrUq87yQtvKu9Lnb37FCd
         d9mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        fh=VVUwXUrS/W7E/oDlzUTnYUqgueGDA0GgzO3SuRNc96Y=;
        b=PHOhSkM3fAZDwmIPdBK8RnLhh4XFsRLlYyq51UZkL57ox8v9O+GDoJbP2ReIhesTeC
         QuLA0uKLIkevpOKjPDSucDGpIUCLR/yh7ayixWLmHtKq63I55fKyNIY5fu6FKSruRijO
         jMgMYqlb0duv+8qPr5MX0x6Tb876QW95h3ZfPv0uWhffWjEOuWCbw1KaFG6DnaK26O4G
         F7bB3jW6PmeUwPsJg88JdZvUBcCP28d1NJp1WzkAyVsjtbFYWW+T36lLXL/ClF9UuqV3
         ylrXQPm1GS2RZm/U3z5Ll28dXP10jxzhWO0DGgnibGtNzMB7IiPc4sONcJJdKc3twcAQ
         DROA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775502108; x=1776106908; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=M02hHpfRNYB9wGqMBl6eFiH69oIJUpEFyrPQFyU3Gn7RVhvtYJtJJuXOxjNorrjJn1
         sDA3C5KPKtucz+DqnGSCG/k9f61MBQw/3ieb2ZwMUN0CaneVnmtu5h6fWq8i1fPHTYjm
         Xhj++iSuiXoCuD2icNsItDEO8eo08Ns+Gff0lILxIfigZxmss7yZ86p6NZGX+agPpG+u
         wMAGLcR83j1ZgDPgaUK1US9Jsh4pJMSzc86Um8GTGqEcznrd/61vKhuIc0HFQAtiVFAm
         RmA0QQbCgoh0phWB5IPN2/Gy/O6GJCuoGREED7gn9hdcAsQrgcNyIuyekh243+n9QTnW
         7ktQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775502108; x=1776106908;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gf3VuwShgbYg5PZ/J/6LyKGap1JcrY8bWhqVawvmQIs=;
        b=K1Ak6Vs4QhT24ADxO6WIY+EKGKWBm/hlEumKuT1sTT0K8Zu0ybmDP/HAHNX5Gm/c63
         W70tf33DRoS4/tqh9+KMAUVeEAvRQl/4lmFQSGCSW/d0ickpcQgHDRhkT5UexG66h4vf
         9b5fEtk4S6FJxb558kEtkgBZ/POGSKOg2YAJJnXEkwRij2GS09O45H6LWGXv1cTmkClV
         qPsNuwGhamwjda88KMHCASUaotEY/HR5b6aKclcPxrF8CR+UZM+XYM1xCLZF6uWko6kj
         xW/wvW/n4kycnBiNZxINNgG3sQwnJQqv5zVVjzmlQCzSVNlqDO+SQbkpc3gHRUFX6Vdc
         q+mg==
X-Forwarded-Encrypted: i=1; AJvYcCUFbV24pzNYjB9L+vgnzKXHqv4d2HfDMDbB7hNXluvbafX5syhaFAzIOegDN8BPb1N78z9xqFp2o35Xtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzO/euWIsjRALf2SC6sFiy/QknNi3VWERBq/dJ7nZ6l5QjZYlRg
	wlhPu+CqSlXZr5CS9MPQx6gQgFGAaVfQMPiByOU5v4MD9GNkfPk2cjHsymv0v8BGohqiYDI/Fog
	tpKlf0jYmtd9B2E0m5HKQDl5lA8PWdek=
X-Gm-Gg: AeBDievRmhZSABlsQbnfmIpmOPmba6FJIO2rp9YK0GHiDjEiYI6AdR8op1a5O04tgup
	OBpudtIMxIM0OLmby06kiEnEWvaeV2LimjN2YGBWKddxHCu3I1Sa8P1UPjdAH0y00aB0qJuKCOF
	A/2XKBQ9gMiNeK6bp7HjiJSGj4zbF1VHAroAtaRP7Wv7z1d7mfWWCKA5jKnE/E2DYyqgslhXPlX
	84nLT80Y8WIW/wjh1JWHOreHtCmDzRyQ6WfC7vpftPfAfQtP8HmqWQ+hjcqOqYoIVMkP6x/v+Og
	VlwMKUX9jjPdo+XQ4qLOZ6COQwEwANd9J4yeq/SOLJLrujsXYOEPgWg2ZeOqdoYSxsZ/2bGhi/z
	fVlH8DA2fBVvJ9n625DszuEA=
X-Received: by 2002:a05:693c:2b02:b0:2cb:6653:ea05 with SMTP id
 5a478bee46e88-2cbfcf5295fmr2949463eec.4.1775502107727; Mon, 06 Apr 2026
 12:01:47 -0700 (PDT)
MIME-Version: 1.0
References: <20260405235309.418950-1-ojeda@kernel.org> <CANiq72mnGArtgAbe7xXZCYW1x7Zd5hozfnzoftaGy9rxoLO4ew@mail.gmail.com>
 <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
In-Reply-To: <cf28afe0-ede5-4d1a-9824-65a1448f8161@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 21:01:35 +0200
X-Gm-Features: AQROBzAfx15_qleB1FpEnqVT3LDjlhAucDNDkuNXvaEMC2J19jPyg217OqF9cWw
Message-ID: <CANiq72n4tmTzqbcHCnzUBFyLVmJzB-AJng_1FgELJCWr7hDg4A@mail.gmail.com>
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
To: John Hubbard <jhubbard@nvidia.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>, 
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
	moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>, Alexandre Ghiti <alex@ghiti.fr>, 
	linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_120149_050481_8A2D8DBB 
X-CRM114-Status: GOOD (  11.29  )
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

T24gTW9uLCBBcHIgNiwgMjAyNiBhdCA4OjUx4oCvUE0gSm9obiBIdWJiYXJkIDxqaHViYmFyZEBu
dmlkaWEuY29tPiB3cm90ZToKPgo+IExvb2tzIGdvb2QgZnJvbSB0aGUgcGVyc3BlY3RpdmUgb2Yg
dGhpcyBwYXRjaHNldC4gSSBhbSBzZWVpbmcKPiBvbmUgcmVtYWluaW5nIHByb2JsZW0gdGhhdCB3
ZSBwcmV2aW91c2x5IGNhbWUgdXAgd2l0aCBhIGZpeCBmb3IsCj4gc28gSSBleHBlY3QgdGhhdCB0
aGF0IGZpeCBpcyBzdGFnZWQgaW4gYW5vdGhlciBicmFuY2guIEJ1dCBpbgo+IGNhc2UgaXQncyBu
b3QsIGhlcmUgaXMgdGhlIHJlcG9ydDoKPgo+IE9uIHRvZGF5J3MgcnVzdC1uZXh0LCB1c2luZyBy
dXN0YyAxLjg1LjAsIGF0IGNvbW1pdCAyMzJlNzljNzJmNTcKPiAoInJ1c3Q6IGtidWlsZDogYWxs
b3cgYGNsaXBweTo6cHJlY2VkZW5jZWAgZm9yIFJ1c3QgPCAxLjg2LjAiKToKPgo+ICAgQ0xJUFBZ
IFtNXSBkcml2ZXJzL2dwdS9kcm0vbm92YS9ub3ZhLm8KPiB3YXJuaW5nOiBjb25zaWRlciByZW1v
dmluZyB1bm5lY2Vzc2FyeSBkb3VibGUgcGFyZW50aGVzZXMKPiAgICAgLS0+IHJ1c3QvZG9jdGVz
dHNfa2VybmVsX2dlbmVyYXRlZC5yczo0MjQwOjE0Cj4gICAgICB8Cj4gNDI0MCB8ICAgICBwcl9p
bmZvISgiVGhlIHBvbGljeSBkZXRhaWxzIGFyZTogezo/fVxuIiwgKHBvbGljeS5jcHUoKSwgcG9s
aWN5LmN1cigpKSk7Cj4gICAgICB8ICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Xl5eXl5eXl5eXgo+ICAgICAgfAo+ICAgICAgPSBoZWxwOiBmb3IgZnVydGhlciBpbmZvcm1hdGlv
biB2aXNpdCBodHRwczovL3J1c3QtbGFuZy5naXRodWIuaW8vcnVzdC1jbGlwcHkvbWFzdGVyL2lu
ZGV4Lmh0bWwjZG91YmxlX3BhcmVucwo+ICAgICAgPSBub3RlOiBgLVcgY2xpcHB5Ojpkb3VibGUt
cGFyZW5zYCBpbXBsaWVkIGJ5IGAtVyBjbGlwcHk6OmFsbGAKPiAgICAgID0gaGVscDogdG8gb3Zl
cnJpZGUgYC1XIGNsaXBweTo6YWxsYCBhZGQgYCNbYWxsb3coY2xpcHB5Ojpkb3VibGVfcGFyZW5z
KV1gCj4KPiB3YXJuaW5nOiAxIHdhcm5pbmcgZW1pdHRlZAoKVGhhdCBpcyBhbHJlYWR5IGZpeGVk
IGFuZCBpbiBtYWlubGluZTogNDg3ZjliM2RjNmU1ICgicnVzdDogY3B1ZnJlcToKc3VwcHJlc3Mg
Y2xpcHB5Ojpkb3VibGVfcGFyZW5zIGluIFBvbGljeSBkb2N0ZXN0IikuCgpDaGVlcnMsCk1pZ3Vl
bAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
