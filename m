Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A366CFD2F6
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Nov 2025 01:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kPHD7Zx0oeTpZYg7j+j+qyab6nZiadnuRNcE7fLgxNs=; b=nYYF8N/XW7GV2p
	CqUCFiAUn9kZg7afr1NPzPoVGRI4kNvIpGJYgP/cc4k2yTYLuU45L/Q+Nl2LzoJTFwiw/rLxmLmJe
	8RPNdNW6rZ+QbezKzaHskqn3xsHczHUfC5rURdyffcsHcnppzEeiy3fz9QejcoZAcZJr47AuSvKqM
	a3kqrasfQ1BB18Cr8VspJNTb6EUv6CTw3/n8x06bcwi2tby6aIAIX+SbNJhd88LC9uh8z22EuUdYK
	eKwSaftxHeHA6o7jpb/Dj1WTxzM+PXdLLQSO2N8dEcVSQ3qfVh920FKtEyJ3ZHh+ymb8ov7NNGZ3S
	tvRRYJPNPTEY+o6mcR7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLZK-0000000Aw8m-15K0;
	Mon, 24 Nov 2025 01:40:42 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNLZH-0000000Aw7R-0vJh
	for linux-riscv@lists.infradead.org;
	Mon, 24 Nov 2025 01:40:40 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-37a990ec4e5so2604071fa.3
        for <linux-riscv@lists.infradead.org>; Sun, 23 Nov 2025 17:40:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763948437; x=1764553237; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=VA5ClduRk8QXXGLgyMdd693zpMN9Tweux25IHpwMfFdK6S5zoqxARfHkZP2JiKYE/e
         1Yq4N/Rpf8DFt+kzVHwL5gAU5v9SNPOf9GkeRzAUO32PTmrcJwOHzw/UrGnZptQ1Pv+v
         voTmvDaGzormbJhOUyYVVjnY4bxh/cQsd0WCIEStGM2xJ5etI1FONTS+uhVc1MrfriEU
         eZ1L7cuF3iB61Y7yTd/jNb/Tui0hCpcJV89kn5/6Unl/hQHJsXL/PF6ziLYiUTVOFyf/
         xwb746LzudwFomvYIQx1hvKcQqyodLT63nLa8wzedVsZ5gN/NlQH5BHrGYnd1Ya0YeHK
         P7BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763948437; x=1764553237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U0mWAOFY/KvS1IDb78vj1ueFROS6qmeAjXM0xlP2rT0=;
        b=fDTNZZSROAMYv6TGE6Sc9O2gr0FW5bqygigdSr/KMfhwFlKqbmaYW+FhdN9XNq8eyV
         9BvBss0YsyVQLhwdGGIvxQVdr4JZulZnx9tNGhEH3Ps2tga/KzBgR8iO4mbqHdps614D
         Z8pSBbqkjHyAigBMV91un/VzhZ38OKw80uTPJODXWjvs0XxGWknjnJzSZYL+/c1sEJBL
         kH7Vl5h5NYafJrZ3FQxj2aiWvRlPsuogD3bHbDkXFqztsCKPZU4yWVBc9DkgClKu+T2x
         mNQhJ5VDr49Slsv7Rci62fBRHByPLBVIV4vwfDvcqylSgD/VOO+nt4u+jEZUumme9mzZ
         t3lg==
X-Forwarded-Encrypted: i=1; AJvYcCUQhQzoLmomAzOuIBoISuWsu2CrIcuQbZ85t0Hhnxa4sA7GuhOz2b6x1ogKkRCl3DUhPDJFc+LvRezxtw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSVxAPeWmjCgtdkySCpnvAlBx7DYbG5BnazbQ5l82mEELjhly1
	/DmAk6YTpPgWcMYQCwCOrDjeRNlyq15KIX2xoELyMMZ8bJWaDe4D+0bbHlGZlZxg1n5DE/jUQbo
	cxIji1M5rdJNUgh6x4p3q1pgZn1hzbJg=
X-Gm-Gg: ASbGncvaCGeV721+5HZ0UYFd7dL/jvtpGz82fb8EOr6d1vs2WD3F6Ntr6GswnrV4p4L
	wvnfcbJyfq/2AfAk3J5XjIgIeBQfjBd5NHNa8D9lLa1mjEt6w/lb62Z64bHfKhgxe6l/ROvukna
	0KovI5at4MVZ6lg9Q85kLWL5eLZoYT4tmOWmD6h8UE7bLfaol+W4R4szduscBOHXcI/jvF/WMht
	5Bun88Ero/cHoeZdqH4kIQ90VVqmFWtVjc19q/XGhPtnGL4vHV6iV2r/o3XCCCJVheXJeseDePi
	uMvyvrBrhXt/2vxhZ7p9Xm0/ykDocjdSb6j3OVPw7GnAtzCe/CCQMjStFGFIb9PDBIQPvO3bFv0
	eTOc7PQ4TMvuegA==
X-Google-Smtp-Source: AGHT+IGJ0/QqoFdh3XscVl74AmQLSg+MmbSCdBIAO+xihAcbKpwhdVEc+6URPzsvr/D4O5MVqOIaGXgotk7kl+mskSI=
X-Received: by 2002:a05:6512:4028:b0:594:33db:2836 with SMTP id
 2adb3069b0e04-596a52f41famr1664493e87.6.1763948436852; Sun, 23 Nov 2025
 17:40:36 -0800 (PST)
MIME-Version: 1.0
References: <20251124-gcc-rust-v4-v4-0-4e06e07421ae@gmail.com> <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
In-Reply-To: <20251124-gcc-rust-v4-v4-1-4e06e07421ae@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 24 Nov 2025 02:40:22 +0100
X-Gm-Features: AWmQ_bkux8gOmOA5I7Y1blTc1OP02EBuH81WNeWf8pohbW3LHlgv9oWzHxyvbW4
Message-ID: <CANiq72=QFL9-b7P0UBFT9VCCOQ9BKS4WUR0Q7wWioG7nAijr9w@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] rust: export BINDGEN_TARGET from a separate Makefile
To: Asuna Yang <spriteovo@gmail.com>
Cc: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Vivian Wang <wangruikang@iscas.ac.cn>, Han Gao <rabenda.cn@gmail.com>, 
	Jason Montleon <jmontleo@redhat.com>, Conor Dooley <conor@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251123_174039_282248_B809CF7A 
X-CRM114-Status: GOOD (  13.08  )
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgYXQgMToyM+KAr0FNIEFzdW5hIFlhbmcgPHNwcml0ZW92b0Bn
bWFpbC5jb20+IHdyb3RlOgo+Cj4gQSBzdWJzZXF1ZW50IGNvbW1pdCB3aWxsIGFkZCBhIG5ldyBm
dW5jdGlvbiBgcnVzdC1iaW5kZ2VuLW9wdGlvbmAgdG8KPiBgc2NyaXB0cy9LY29uZmlnLmluY2x1
ZGVgLiBUaGUgYmluZGdlbiBiYWNrZW5kIHJlcXVpcmVzIHRoZSBgLS10YXJnZXRgCj4gb3B0aW9u
IGZvciBjcm9zcyBjb21waWxpbmcsIGJ1dCB2YXJpYWJsZSBgQklOREdFTl9UQVJHRVRgIGluCj4g
YHJ1c3QvTWFrZWZpbGVgIGNhbm5vdCBiZSBleHBvcnRlZCB0byBgc2NyaXB0cy9LY29uZmlnLmlu
Y2x1ZGVgLgoKUGxlYXNlIGVuZCB3aXRoIGFub3RoZXIgcGFyYWdyYXBoIHNheWluZyB3aGF0IHRo
ZSBjb21taXQgZG9lcywgZS5nLgoiVGh1cyBtb3ZlIHRoZSB2YXJpYWJsZSB0byBhIG5ldyBgTWFr
ZWZpbGVgIHRoYXQgY2FuIHRoZW4gYmUgaW1wb3J0ZWQKZnJvbSB0aGUgbWFpbiBgTWFrZWZpbGVg
IiBvciBzaW1pbGFyLgoKQWxzbywgSSBhbSBub3Qgc3VyZSBpZiB0aGlzIHNob3VsZCBiZSBjYWxs
ZWQgYE1ha2VmaWxlLmJpbmRnZW5gLCBidXQgSQpndWVzcyBpdCBpcyBmaW5lIGFzIGl0IGlzIC0t
IHdpdGggdGhlIGN1cnJlbnQgbmFtZSwgdGhlIG5ldyBmaWxlCnNob3VsZCBiZSBjb3ZlcmVkIGJ5
IHRoZSBgRjogc2NyaXB0cy8qcnVzdCpgIHJ1bGUgaW4gYE1BSU5UQUlORVJTYAphbHJlYWR5LCBz
byB0aGlzIGxvb2tzIE9LLCBidXQgcGxlYXNlIGRvdWJsZS1jaGVjayBpdCBpcyB0aGUgY2FzZS4K
CkZpbmFsbHksIGlzIGl0IHBvc3NpYmxlIHRvIHB1dCB0aGlzIHVuZGVyIGBuZWVkLWNvbXBpbGVy
YCBsaWtlCmBNYWtlZmlsZS5jb21waWxlcmA/IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBldmFs
dWF0ZSB0aG9zZSBvcHRpb25zCmZvciB0aGluZ3MgbGlrZSBgbWFrZSBoZWxwYCwgYnV0IHBlcmhh
cHMgSSBhbSBtaXNzaW5nIHNvbWV0aGluZy4KUGxlYXNlIHNlZSBjb21taXQgODA1YjJlMWQ0Mjdh
ICgia2J1aWxkOiBpbmNsdWRlIE1ha2VmaWxlLmNvbXBpbGVyCm9ubHkgd2hlbiBjb21waWxlciBp
cyBuZWVkZWQiKS4KClRoYW5rcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
