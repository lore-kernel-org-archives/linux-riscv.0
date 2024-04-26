Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71966C04FFE
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 12:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OGpzFGw3qlkt87eqbOSXQf+HUG1Vca3v56k+jW5sd64=; b=LbcoMNJvCNl2/d
	tYBmTXf24oB8amDGVGU7mPHc32Bg/S/NiSs6L7UrsetNiyBwJKK4j3MpbM9GTRFH6aF8jhmeOS6mK
	P8snHSB6EXeibaOCkcayI2RYRYwvTA+Hsv6PQLcQizfx9IISzl9daRyuVAUHu0lWdeIN3Ca2aKKlN
	DYtXHSWx4eSht1YZEZINJwfbGYvw+e1AB7fUQqHIG8vuXbMrHdhcpHXJWyzJyPYXw+Rt7LAM2GK7I
	1SQrb7dyWAEHHSL+eVAmDHWGh7Mm5ZhbcInLApmbr0qooM6j/9CqCjUwbeFjAU5Du7qsF5hPHEMj0
	d0B3Ksbb60QVFVHdpU6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0KZq-0000000CSSm-3JsR;
	Fri, 26 Apr 2024 12:21:18 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0KZi-0000000CSMD-2kUv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 12:21:13 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5cf2d73a183so2221682a12.1
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714134068; x=1714738868; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
        b=U6fSJbACr3V16/mrep1EDjUqYp2K3HFW9oy3SxQX5nb1IZ2undEP8d+lLCwYa5rEFQ
         IzNwfa7RrCS/eYZiytn/lyoGKkYAC1fGwF2PrcVZvsV+V3E3OzmF/dG2MaXzld51eFqW
         2M32H4zgYec5g6ryFCY7WYVddVtnVJWO8QqtUv6gI/nVApBRaby2s+ugHkApaTM5gI8q
         Q/a/evKBDVHF+V0wVb+tr5uDZtuBC4mR+JwuvJNAqf3bxiCvP+iZlxhohfYS5Q9s3Cqg
         qVI0rNASvofSiGje2mHUfW1MvwPAF1akY6obDDOTTJRt3aTWBq4HckzS+Q08T6zh59QR
         TlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714134068; x=1714738868;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VFUk/8mezBkp2jG4lxOgugvzQyyyqYxEDgBoU4W+9R0=;
        b=DKbrlu3ors6T5nPMf8ATS4Ny0w1owr+AAOp0BgagIJoN+tlGQfFNx5J4TLOtdeBOD3
         aOIVXRzqwpuqd03+h6szKBDPe0Btsc5l4d0p69qNVTPk4694fSwoQ424Lbqr9L6orMZN
         wkWZZKvyvOrWUWQH+ZsBnqffN9vmiI+HcYivzfl8X5i/X4fddNjF+rb05/8u0r4Vlum0
         zhj98DXKyxgCHL4F8fqawtJi65YGRUM/qiW5cxgWFShFHAJe2W4dJzKSBaftuCg1UxJl
         H65vMLEY+TiNfiqI6Wuc4RjCuLAKRegM0E6aTHqHxUBEc97VMEQ8TZBHkiV206jhnEVb
         9YsA==
X-Forwarded-Encrypted: i=1; AJvYcCWYZ+O1IiBOuntHX29nDjS7AcLfay9NAfH/cY0IF61Vln6rVvmXAudoexakVnaGeDJ38UsTDdNkCLy23Fkx97ImX+TZlj90mAquENbF8ncy
X-Gm-Message-State: AOJu0YwTAv6POQnrVfW7FzEMKQVdT44tHFckktqzYNZA4TwjJTY/UjLh
	Qa6jwKcIq1IRsumvqTJcVtq+TXbhvV0U0zM+MG/pyFrtMX42fzpZ6aB9k3Y9R6GvnHnBNCJvqxL
	D0FivJ5qT38SjKL/4uDKSv9V7lk0=
X-Google-Smtp-Source: AGHT+IHQ0i2Z+JiSphGpy0VElFmysG0D6y1RO6zJ2spHmtLaNeadT9T7sGBsWfuOBTgfYf9daaHlhTS+KLOAtOcApTc=
X-Received: by 2002:a17:90b:28cb:b0:2a5:575:c58d with SMTP id
 qj11-20020a17090b28cb00b002a50575c58dmr8343368pjb.16.1714134068133; Fri, 26
 Apr 2024 05:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1714113680.git.siyanteng@loongson.cn> <CANiq72meE9txt5b09Y7cUJd-hEqcZX1ZtRc_0YYDZqWQgyo3wA@mail.gmail.com>
 <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
In-Reply-To: <9cae4c4a-55a6-4c6c-9780-866f796a52c0@loongson.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 26 Apr 2024 14:20:02 +0200
Message-ID: <CANiq72=b=G3GPVWQ2XV1MT-wdT0KL4jZVQfD55Mcz_st-G7r=Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] rust: docs: Update the translation of rust to 6.9-rc4
To: Yanteng Si <siyanteng@loongson.cn>
Cc: ojeda@kernel.org, corbet@lwn.net, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, benno.lossin@proton.me, a.hindborg@samsung.com, 
	aliceryhl@google.com, nathan@kernel.org, ndesaulniers@google.com, 
	morbo@google.com, justinstitt@google.com, alexs@kernel.org, dzm91@hust.edu.cn, 
	linux-doc@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_052110_851764_2A9C66E8 
X-CRM114-Status: GOOD (  10.63  )
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

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMTI6MzXigK9QTSBZYW50ZW5nIFNpIDxzaXlhbnRlbmdA
bG9vbmdzb24uY24+IHdyb3RlOgo+Cj4gSSdtIHRoaW5raW5nIHRoYXQgSSdtIHR3byBjb21taXRz
IGFoZWFkIG9mIHRoZSBkb2MgdHJlZSwgaXQgZG9lc24ndCBzZWVtCj4gdG8gZml0Cj4KPiBtZXJn
ZSBpbnRvIHRoZSBkb2MgdHJlZSBpbiB0aGlzIHdpbmRvdywgYW5kIHRoZXJlIG1pZ2h0IGJlIGNv
bmZsaWN0cyBvbgo+Cj4gbGludXgtbmV4dCBpZiBJIHNwbGl0ZSB0aGUgcGF0Y2ggb3V0IG1vcmUu
CgpIbW0uLi4gSSBhbSBub3Qgc3VyZSBJIGZvbGxvdyAtLSBjb25mbGljdHMgd2l0aCB3aGF0PyBU
aGVzZSBwYXRjaGVzCm9ubHkgY2hhbmdlIHRoZSB0cmFuc2xhdGlvbnMgYW5kIHRoZXkgYWxsIGdl
dCBhcHBsaWVkIGJ5IHRoZSBkb2MgdHJlZSwKcmlnaHQ/CgpDaGVlcnMsCk1pZ3VlbAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
