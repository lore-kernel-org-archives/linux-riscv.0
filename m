Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8281CCC6B03
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 07:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyFkQRfm5LhGvoxMFyTDc6OoQtwt71F3aw6wJ63Z3kE=; b=bPJxLhmjPtqX2m
	YroTs64BFu0nlqN9hyLoXLqdT1ooTE9RKVliUFy+1j+1ZE8X94JJswBZGF9SzeeQOKD8ulm/uuNXl
	uBYKXKgxrG/7YL+fZURl5+IfEh8uJAPK1GOcNWv6H/XepMoIwYkeyQLd2q/uipIYd2p5aX7vXodSq
	6CPCQA8NXmSChOts6eK2uhttP3Gsm3nmOZtOcLXbPehXvZHMS3xOnLWCdXzvbpkdNMeZFLQUc3l7h
	5seDXUckWHUgU7vCAVdZUDYVPYQfhKRNBPtDXntWarMB4r4KcM9On8Jm8LcaOAaPD8QSB9OcX/Au/
	tnuu0L8umjgRSl8ISXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CEK-0000000H0Qz-3FCr;
	Thu, 02 Apr 2026 07:12:40 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8CEH-0000000H0Pc-2OZ6
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 07:12:39 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2bd5658b901so21709eec.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 00:12:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775113957; cv=none;
        d=google.com; s=arc-20240605;
        b=GlJ7v/WXYXbG/w1DgAsQinnJCwqZZr6FnhuVfxgarFxD30UyYaWfiTC7DSfMkzwfxw
         fse2mvRKiQ3PltfESNQmMUILitb2GQkqddBnD6nggi6IwrppcIk9PQ3x7eLlzRX8ACyc
         kC+zpfEp8eYQlngBUpbhBSuh4k5bVNZ31ru5XID1VOC56m1jRu/eVX2l7y0jlCoseh3Y
         or2zBXqjXVx/MafN2lNgkPgTfBjpvPfTzGLHUeMJnK4lcDjoemVD5GimSfwdFxegrwfj
         Y5dqBtAMpMZ17hBl/6msy6s6daD24H9QaVQNyI+KVCyD2xHn6Gb3JDYoSMjfMqOBc60b
         qhyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        fh=lS6+CB0GHQWuXkrvFpNyiCZozeG3llfYN0QIfIk1NaA=;
        b=e87EGou8TrV0wtGcxNtGq4u/Y76M7ntJcyTwMk6aYvxdRXMInLVHsyCiQjh3IIwSik
         +N+LibrhN5TMoAMiZ18kr9zpfpzUK8JucI8nCbn6UegOp6nfZ3mA3Gk58duzT5NodPlB
         /sBfGcSijLGW7ybd5qep/znQNL+MB7f8Z+Dykkvce3T+T3OT6gwJOt2cMiaAGTbr/L9O
         BZ+Ju4v2zDpG0FX5bIfViMcMl2eanilKG+3cuteWxMqXa/Ss1WYx1GFurmQbTXVw8DTD
         h1siI2NFFjgTfDcwcRomgZQ1Q/4UCtyyjbmg8CECHt2kGFNxDn10gwdk+uv3hWNMJko1
         X4YA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775113957; x=1775718757; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=kDf8rgoZBqnM1kuyvPs6jcICSWGmsT0uFJGvlMuwDTonebD0MW0nGwmnesEDboYpcx
         4Pcsv7EhgAByTirfIpIJ6S370/ysbtKuhX5oN11Rtyxjt0oErmmTLqrBoCWWByxnO2Si
         9VIBMuAYRGPUJ5ne56itIJ8tJt977TFoW7ujolt1xnve0K4EWYzyCedmuaF+uy6KtROL
         VkufVpIGAtil55or89BZzcmsgbMUAn3pYkuVueXvOAJxnW93x96+CsqJBvY0pkSGR2SC
         +AZNY7R1Mw+vQ0Ave5N0bN5tFc/xXleFxQIpH8e88zm3hcVmR5HopeTJTokNE50iHVxa
         bkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775113957; x=1775718757;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5KsNlup00ToveqB7aTUYVDBzpUNHd54qGWP+GbDHjCc=;
        b=R0m9o/7WgrlaDjrrzePH3HrQwxWZlltmWPXJ5Yy4EWN5siyUK3xYjrPJJEm0HHoDDq
         4FEDim3KzR2cinWMyE2nVu2L10dzj3tK5RvU0qXh94exxn4UMzdHB2ldAjBw052fT6fi
         HmTmHb+76TzIqnZcjPLddKf6do0vAD0IpYGgY7yvRSARS8t9XQmsx+emWWc5T0JbB39B
         P2crTFFZGyaRr5d7vJ0YYxM/qOoo8WGDgLPlivsVeeQSYeZS/o3XAOvDpoTX9uBeF1LZ
         ZAO5QY8Qv3kX8UJ/NctexjBiRg+pu9PKsoykOMZWs33Jcd6d9v5jCGQV+R6d5hlXUjiU
         vH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCW5f/Ld6FLBp3cg8uDXkfDkF2enx8CNrPm4MztwvIHoy9ICbw2TzglFwrFdyAHGEC0O1X/OqVupRwV3hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOyp0JJBfOOlWm1ogTRtoM4gcKlHXUJreGRLHWHPwklxELgtog
	nzWleaCGd9Pon1Nz8BE8jR2/sN/BOpk0Xm3xuaacEAD1WBA3uIt22PjVuM4VAzTCFBCDa+23A/q
	3mHF6Qs0kxk04JLvAjmodW3m7TlYTU7TDxr//YCAD0w==
X-Gm-Gg: ATEYQzz5grbd5pgoH+KmVlFLkgvumUTZmcAEf5K8euNgNmz4JPDrTUwmW+FzIpoUHHN
	1/OSAc3kFz2RMwH8LtnGNPuZocVeJRJOr5LfCD19aAfK/BZKxGevcm3x2SpZOj5TyltxTamnzIi
	qZgLY2ZnrIhUeaqoB9j8UO9gXK48nBqkNihjSJdFRIqFNfniSrxXXNojGNWv/4+pr1K7VBSkREs
	UgziDjoJx3F3nSS+opv/wSIXD/+k+5CIB7JTSYzw+fk8auwm9REPQ3WNCjVfWKwC6YvLzezP/L5
	VW5knIC2e4OkwZb6+rVDBY/7/E2De7PBaYvciiFs9XVUBWerDfc7Nb55Yt7Vz1haFz7d7atzeSt
	6dUJQ6Rvzfuj5gCyJ3HK4wuc=
X-Received: by 2002:a05:7301:6790:b0:2c1:6416:2a07 with SMTP id
 5a478bee46e88-2c9321b7bf4mr1634311eec.4.1775113956496; Thu, 02 Apr 2026
 00:12:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-16-ojeda@kernel.org>
 <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
In-Reply-To: <DHHWO582XLXH.1DU3CO41F1PV7@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 2 Apr 2026 09:12:22 +0200
X-Gm-Features: AQROBzDaEWueCbjTzytnJo43NDIAkvyWYngeEqQLnAsLh-4PZJOJIJpad43tD2c
Message-ID: <CANiq72n4sCU=2m4Uee8Wpsv3mjkw_BuT8Sg54Gu0U68j7qAM5A@mail.gmail.com>
Subject: Re: [PATCH 15/33] rust: rust_is_available: remove warning for
 0.66.[01] buggy versions
To: Gary Guo <gary@garyguo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>, 
	Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>, 
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
X-CRM114-CacheID: sfid-20260402_001237_607007_F60D726F 
X-CRM114-Status: GOOD (  11.23  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCA0OjU44oCvUE0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gVGhlIHNjcmlwdHMvcnVzdF9pc19hdmFpbGFibGUuc2ggY2hhbmdlIGxv
b2tzIGNvcnJlY3QgdG8gbWUsIGFsdGhvdWdoIEkgY291bGRuJ3QKPiBnZXQgc2NyaXB0cy9ydXN0
X2lzX2F2YWlsYWJsZV90ZXN0LnB5IHRvIHJ1biBvbiBOaXhPUy4KPgo+IExvb2tzIGxpa2UgaXQg
ZmlsdGVyZWQgb3V0IFBBVEggYnV0IHVzZXMgL3Vzci9iaW4vZW52IHRvIGZpbmQgcHl0aG9uIGJp
bmFyeT8gRm9yCj4gb2J2aW91cyByZWFzb25zIHRoYXQgd2lsbCBvbmx5IHdvcmsgaWYgcHl0aG9u
IGlzIGxvY2F0ZWQgL3Vzci9iaW4vcHl0aG9uLgoKWWVhaCwgdGhlIHNjcmlwdCBoYXMgc29tZSBh
c3N1bXB0aW9ucyBvbiBpdCAoZS5nLiBpdCBhbHNvIGFzc3VtZXMKYGRhc2hgIGJlaGF2aW9yIHZz
LiBgYmFzaGAgaW4gYSBjb3VwbGUgdGVzdHMgd2hpY2ggSSBzaG91bGQgcmVsYXgKdG9vKS4gSGFw
cHkgdG8gY2hhbmdlIHRoYXQuCgpUaGFua3MgZm9yIHRlc3RpbmcgaXQgOikKCkNoZWVycywKTWln
dWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
