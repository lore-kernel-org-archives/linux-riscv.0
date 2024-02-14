Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B1B8C4829A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 03:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eJtH3KgafTlYfhssL7oT+9xADOb/Hhw7C7BJa96au8U=; b=0xdHpLH2uObVwp
	lFPgGnIbCX6zxP8ZBJlSdY9MqbZXkbsp0XFmVZc/Zomi84rXJHpzJtRGqLKLoG7FTGJigzT6faLOM
	Pw2m+1Lu/XKMhma8fvjJDoEj+WMPrtNXAAq5PL+GUyPCQdgUjYeus6PI1ONd/g8fiaA56HQ86owvs
	gIkSYXCHDbzJAzSdTLDSh7gdTb/liIqLlFS4shuF3qndYRSodmJLZsakYt69MpOeq30uyGCw4/x5O
	blwd7TXhXHpoaQYTNamjL0/Ib3sGk5rCRml63P8SzTBXctBsl7bISY5c/3SXH1Apa+8WUY7dPGcfy
	jMCEZ1SvEx0YrtweAQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5jN-0000000BbQj-1ZBy;
	Wed, 14 Feb 2024 03:14:41 +0000
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ra5jJ-0000000BbNf-3VrR
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 03:14:39 +0000
Received: by mail-yb1-xb2f.google.com with SMTP id 3f1490d57ef6-dc6e080c1f0so4366669276.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 19:14:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1707880465; x=1708485265; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DjlvOe+u+cyrL4JYuO9gr+urwu384Wuuey1WJE8DSes=;
        b=r/3SXIyV2mUeiwwh0p/8zeWcJR4bXXWl/ouixiV5v8TRf7xyTcrt4qE/NyWIBJSsF7
         u3D51i9Jp1NtFuzRXaGzVQJYnyBpT+hD8c25csArxpM0UukLjw67LQh6OnoJkzzzNq8c
         sKmv6fH9v1eTz0xcf8Q/uv8d8WVy87QjelpdeofseyLavM/6Ywb6xwzWjUDvw8fsYsqT
         rG8vnZD5xwx9J2EQC3xruU/vyA1UN77O0fyAWrlgmso0u+7UsWd6lBQJb+VFQ+WhwN1L
         biGgBvgniPzp0SZ571doLXvXn3Mz7sqlsXK2B6tS5YhkKgNcrOCd5tFJuCyG6uyftOXk
         QmRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707880465; x=1708485265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjlvOe+u+cyrL4JYuO9gr+urwu384Wuuey1WJE8DSes=;
        b=okr3yfe0uaEWUl7gr4Be5q0Enssi+3fAmBaIIeZgBCvchTajyMgQZlGdQ44z45/vfL
         +dfrzMn7X0AsHML8/4e+z5o9IdaoG2eqG/bRtohOAQbUq8DkDhv9JTIax4QYwHY07vQY
         5B3fnSxw0FbLudcqiuKEDNT3LDNx1849HBSKUQo23EHRB5GiMZApH2TkmSEgipCUL/1o
         oLkRQMyrq8OYrCpotrTJ9WrkuaKj5Y2FM9NN12kknlNTfhePuXQ/7AFFCagix87KGnAX
         s3LYWzBN0RnVORj+uyEkahE1KY8gIsW6X9K0IqveOrbpevAEV0yecCrioIsDM0+jow2Z
         plCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXQm01EZetpvMlYnyrqN8v3Sn9Fcnt3VcVLp8Lp9MUWD16qVwgIZlrJ5Pk4aN2xhzhO0AcwkxlPtjQdYRcmI6zpNqcqeGH1xLLMbbO4QrD
X-Gm-Message-State: AOJu0Yz3ZMXyA539u7Pe79roc3V1Os9hTWis1KpxsBhTz+dwRbNKXIZL
	7EDLS3Y7HflRm1atGRpGukTJgAeFN+UgaQBJhGHZ0CQT/zZxZ/KK/Txxl7p1sToozTgVJvEJwE+
	dZQA8Ff+9hysfPC01DxHHt0sGbHAdBtA/7uVwyw==
X-Google-Smtp-Source: AGHT+IFmvahvMgHVHQaI6LwlEgKPCBhhHem9kf5KUi6p+9U914j80HCS2QMvVYyZLMVtuaXgRDEFCZnR80UsYKJdDNU=
X-Received: by 2002:a25:aacb:0:b0:dcc:35ca:aac4 with SMTP id
 t69-20020a25aacb000000b00dcc35caaac4mr1239282ybi.51.1707880465625; Tue, 13
 Feb 2024 19:14:25 -0800 (PST)
MIME-Version: 1.0
References: <20240117-swiftly-parasail-618d62972d6e@spud> <CANiq72mVKCOAuK4Qe+8AHmpkFwyJsVfx8AqB7ccGi3DYpSSWcw@mail.gmail.com>
 <20240118-implode-delirium-eefdd86e170e@spud> <CANiq72nx1s_nyvPW86jL7eiOxROr18LfOJqNtw8L42CP+gkhRg@mail.gmail.com>
 <20240125-bucked-payroll-47f82077b262@wendy> <CANiq72k7n0aZrifRRU08N8qLkNe+2EZwijZy5sM7M56n2xYHgQ@mail.gmail.com>
 <20240125-lazy-thrower-744aacc6632a@wendy> <CANiq72kb+_utZrYHtoKZQtQazikmkjpVUHpTBcaANizduMF5QQ@mail.gmail.com>
 <20240126-eccentric-jaywalker-3560e2151a92@spud> <CANiq72nu2NXUWYanHZd5EXgX4P_v673EWn6SCRW60Es9naraQQ@mail.gmail.com>
 <20240209-rage-keg-1b2982cd17d9@spud> <CALNs47sRqAbE=u3=_ciO2oge7Afz-6GBBhW+BwcLRET-TsuxTg@mail.gmail.com>
 <CAOcBZOSfN8Yefez_Gy_T3_QTAd4HcLzmMCOoR37K2agWD_U_PQ@mail.gmail.com>
 <CABCJKueFuDkmUmXWbtA3DveQ719vdZx5kBQE1bZ1f6oD5zYNzA@mail.gmail.com> <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
In-Reply-To: <CAOcBZOQMF9_QqPvTPoRa=uHw11o74-hm=YdjtDCTj-yeq4nwjg@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Tue, 13 Feb 2024 22:14:14 -0500
Message-ID: <CALNs47tr4nGhGTahZ9jyv-t4yKAGs-EX_fSZ_jwyT7WoYaB2WA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] RISC-V: enable rust
To: Ramon de C Valle <rcvalle@google.com>
Cc: Sami Tolvanen <samitolvanen@google.com>, Conor Dooley <conor@kernel.org>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	linux-riscv@lists.infradead.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	Matthew Maurer <mmaurer@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_191437_902637_1D2D180F 
X-CRM114-Status: GOOD (  15.27  )
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

T24gVHVlLCBGZWIgMTMsIDIwMjQgYXQgMzowOeKAr1BNIFJhbW9uIGRlIEMgVmFsbGUgPHJjdmFs
bGVAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAxMiwgMjAyNCBhdCAxMjozNuKA
r1BNIFNhbWkgVG9sdmFuZW4gPHNhbWl0b2x2YW5lbkBnb29nbGUuY29tPiB3cm90ZToKPiA+Cj4g
PiBPbiBNb24sIEZlYiAxMiwgMjAyNCBhdCAxMTowNOKAr0FNIFJhbW9uIGRlIEMgVmFsbGUgPHJj
dmFsbGVAZ29vZ2xlLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IFNvcnJ5IGZvciB0aGUgbGF0ZSBy
ZXBseS4gU2FtaSBtaWdodCBiZSB0aGUgYmVzdCBwZXJzb24gdG8gYW5zd2VyCj4gPiA+IHRoaXMs
IGJ1dCBLQ0ZJIChub3QgQ0ZJKSB0ZXN0cyBhcmUgbG93ZXJlZCBieSBwYXNzZXMgdGhhdCBhcmUK
PiA+ID4gYXJjaGl0ZWN0dXJlIHNwZWNpZmljIChzZWUgaHR0cHM6Ly9yZXZpZXdzLmxsdm0ub3Jn
L0QxMTkyOTYpLCBzbyB3ZSdkCj4gPiA+IG5lZWQgdG8gYWRkIHN1cHBvcnQgZm9yIFJJU0MtVi4g
VGhlcmUgaXMgbm8gYWRkaXRpb25hbCB3b3JrIHJlcXVpcmVkCj4gPiA+IGluIHRoZSBSdXN0IGNv
bXBpbGVyIGJlc2lkZXMgZW5hYmxpbmcgaXQgZm9yIHRoZSBuZXcgdGFyZ2V0Lgo+ID4KPiA+IExM
Vk0gMTcgYWRkZWQgS0NGSSBzdXBwb3J0IGZvciBSSVNDLVYuIFNvdW5kcyBsaWtlIGl0J3MganVz
dCBhCj4gPiBxdWVzdGlvbiBvZiB3aGV0aGVyIHJ1c3RjIHVzZXMgYSBuZXcgZW5vdWdoIHZlcnNp
b24gb2YgTExWTSB0aGVuPwo+Cj4gcnVzdGMgaXMgdXNpbmcgTExWTSAxNyBzaW5jZQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9wdWxsLzExNDA0OCwgc28gSSBndWVzcyBJIGNh
biBlbmFibGUKPiBpdCBmb3IgUklTQy1WIHRhcmdldHMgaW4KPiBodHRwczovL2dpdGh1Yi5jb20v
cnVzdC1sYW5nL3J1c3QvdHJlZS9tYXN0ZXIvY29tcGlsZXIvcnVzdGNfdGFyZ2V0L3NyYy9zcGVj
L3RhcmdldHMsCj4gYW5kIHRoZSBMaW51eCBrZXJuZWwgd2lsbCBnZXQgaXQgb24gdGhlIG5leHQg
Y29tcGlsZXIgdXBkYXRlPwoKMTggYXMgb2YgYSBmZXcgaG91cnMgYWdvIDopIGh0dHBzOi8vZ2l0
aHViLmNvbS9ydXN0LWxhbmcvcnVzdC9wdWxsLzEyMDA1NQoKSnVzdCBmb3IgYW4gaWRlYSBvZiB0
aW1pbmcsIGFueXRoaW5nIG1lcmdlZCB0aGlzIG1vbnRoIHdpbGwgYmUgaW4gMS43OApvbiAyMDI0
LTA1LTAyLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
