Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 163ACE9D822
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 13:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kbD7mBH6O6pdhecYDjcQb2xWo8aadkFB4lApjOLTDA0=; b=blu999NZIE38BW
	cjUEBtumjiNhiwtz5Mk1lTKw6GVRkrCCOaJqyYIGWMl3pffqrQRizd6QmSeNnn8BqID0MgPQS845J
	wX4ZYC2sp6nspaToE8h/WA/qL3X/VVBMSv3DJN6+g3gDZpTSM+bI4hmQo+rcOuHfXB3zv3sAmUQF0
	qIhavCm/7I9iYUNSRxDyI4SuQqlxMw9Qcvg3njJjqvVawXxcEU9CuSosvd2bXkfrC8K6uRJfjVXQC
	3Tp54yCANrBNDyQFpjvtN9Hootvf+B+Y8r39TTPoKwyAf47Q0reMI/krj+T1BBQY+vlk6G9yfLERN
	94YRJqk3/U5ZLc7H5NFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jtT-0000000590F-3kq1;
	Mon, 06 Apr 2026 13:21:31 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9jtR-000000058zC-2ha8
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 13:21:30 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-127337e3870so199853c88.2
        for <linux-riscv@lists.infradead.org>; Mon, 06 Apr 2026 06:21:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775481689; cv=none;
        d=google.com; s=arc-20240605;
        b=R6CbhtBBgPT8DapTKKVR6SOFA4wznfjOdQzz2yh4ZChxVeahb2pSW6jK6bswOY5jL4
         BKq+vQXT3su3bTBNspcIJm5rOiodB9aZ+nsN9l9sjHxvvrA46E5T5cE0Ul7Kv9kYjJK/
         INWNa/3UCx8RyfUrSyyYUMbz6mF3wuH8LC+MGDgGQIA8e8/JX/XQbyZ8F52ddlM+DGEs
         dzhmWKtLRNIFBmBQu/nFBd2qx89RhrQwjlNfHXmU0fG0EZFL4Zxf/ofEmfgZ5eZolS6i
         zigGl+n7TnhhjB4fm1ShhqKGx1iTryDgE9+xDDDqPzK7nAZfdY1v+hPzDrwIBxpNOEFd
         eiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        fh=LDH0ccijb09Vbxea/coxPJZbHgKWDbruBDd6OZy/Yfc=;
        b=NGJ8M3tAXSf/u0sTBkpsv3GNqZrltUIlEDZkcnGKEowiRwYzlglruzxhKHoMol/JMn
         Ugg8XPQwr7En8Y73Vi/SFgID87SVr7GGCLm2Z13BvVGXshTKiZWU8SgWQX7lPsUSdz/F
         nmejlp1m/GfQS5xan/SlZQOrn9IvNK+Z67TtyRMpuy/Ge8cVSQwux669A5KBRUCMT6lS
         HQ0eS52EX+kaqojwsxVMvElPNNrmISBNn6W21GXDJhhUBAnQ9GOMHxxsIgPEArIis34r
         ddu7DAUOyV5r6F1BaqUqH//GYS4DevfvNUSKPsTuW1pP6S7PzkNHYLtEWL3J+V8tvq5z
         N8OQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775481689; x=1776086489; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=f5e/XtlX2AcRNA2F71qQ/5wuSeUWwR8oKi9j8Y5hRctah0Q44/VhOVsN2P+z1bTPIF
         pCbZEYKtrxvdeKcux5PTaZOulnlkg2hJFm39MTmuBtXnUEne2HREoH2u3sm3CrgJ2olm
         FDDGZuJBYKEJFTXs5z4x6qTNrhkQe8CBDv81gqfEAxNZSTp64HYFK34HchWAJUnvbDXV
         Y9EE4lBRBiCRfhEOr74a2YkHtnHN2wpeOL3cRUJrQ1C3THITjz+H2AdnACu9EXHONJWV
         XVJieSQYoP1O8Xr3cKhAOu6peCB3rP++Sht6JOhh/qU+niNTEkK93Jp7ZZ6zbudt1xY7
         MHAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481689; x=1776086489;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Xy7FALhcYqLgXu4fKO0MtrrfIdEU0qZJHPfoz//MdsY=;
        b=nZv4SCCIAmwdHhQ6ukwWUfSipAtO9RGPGg3D0OgpS0LEjY+LpnlIhxMoX2+0XnzZbT
         hptHCcIJZajc+Z3VFQkld7RK6g0Ao9MRM4ZUCjqzMaTgZXQIVupQEm5KCUJZu9FFn76c
         KjKQUcx1Sbte3iRwdvYnloncA1dBKi498c08yHeQMSU7qJuD68YMkeipb5Xhnu2sEeWB
         WKj9z9qYVw/zCrdf5VmrVERxGgruIwGqBVflbhFZ0uQV9Mp5GemNXp96iugzhe5/ESjz
         ZBlg0vPIkEngt33PE0yaSqG97OoTWixJBi8ibMSYzTNyutcqa1cQYu5pnBT8Lb5wsrys
         qZiw==
X-Forwarded-Encrypted: i=1; AJvYcCV0byX/9Szje5GO65IKn6RSW+udH/30hVHaNW8E+5xYWYkWCn6ArOf8k1gSRTxcP03GS4YIgg/sDwUs8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxizvBNaFVsdNtPEXWzPSwFJpl04IGjk7OUdd6UcbdaC4QrHnmZ
	V4N7LP/K8xQtYq/EuIzo8DbbZ7uh4uue/+nkFVNiNDm5P6V/EgzGcpoL7p+tIcMlkWxHCj7CG4c
	vwGV72iSr0INIzB+OlSGt1JzhMIfUQp4=
X-Gm-Gg: AeBDietcPXuhXlUJQ7cCqaYDMBxTIIoklMz5Go4bVJ8r94jrivPMwkuGhzWbwXaI8KY
	qHMv+Ff0GJcCfdTup/GHKNfuGgBVC8m5NUsi2CM0A9nSsPojd6ZvoA9JqqMYyV+rQSa3qu9Ub4B
	UNsqYdrShm442mzAxPtOMOzFfda71A7Ctg75YyHxPOEmX1Oyo2bixwJKtJCxqvq9LJu5oB8eUUE
	AvibC9J0mgw8bqdKQMGaQm+2Vl7dh7BR6+H3UtSjMu2P2jYMO3+ZsGSyoEO139xtSWh6FLGKdtW
	5WOWLLQ0W3+dwN6CP8ppxsMqmx763nVt0WKzWUUN/MIaN2DBekW4ZjIHDKEZJFQFuk629qHQcl/
	P8FHYiCz8UeYk6N7yAoJUJf4=
X-Received: by 2002:a05:7301:1007:b0:2be:298c:a11 with SMTP id
 5a478bee46e88-2cbfcf52a13mr2965052eec.3.1775481688630; Mon, 06 Apr 2026
 06:21:28 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-34-ojeda@kernel.org>
 <177508434476.73816.11744805605122440072.b4-review@b4>
In-Reply-To: <177508434476.73816.11744805605122440072.b4-review@b4>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 15:21:15 +0200
X-Gm-Features: AQROBzA0LUfPYuEZWH9uKj1KexaW3DTNKfQ_If4tWD7xnq1YUXDcYUMRbV47V4E
Message-ID: <CANiq72=25GRao7NciojymdbZN_=f-U3hp2+2qBMjb4VCaOgR2w@mail.gmail.com>
Subject: Re: [PATCH 33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
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
X-CRM114-CacheID: sfid-20260406_062129_674067_D5D0ABDA 
X-CRM114-Status: GOOD (  11.35  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxOjAy4oCvQU0gVGFtaXIgRHViZXJzdGVpbiA8dGFtaXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gTWlnaHQgYmUgZ29vZCB0byByZXRhaW4gc29tZSBvZiB0
aGlzIGluIGEgY29kZSBjb21tZW50LgoKQmFoLCBJIG1pc3NlZCB0aGlzIG5vdGUgYW1vbmcgdGhl
IHJlc3QsIHNvcnJ5IChJIGRpZG4ndCByZXBseSB0byB0aGUKb25lcyB3aGVyZSB0aGUgY29tbWl0
IHdlbnQgYXdheSBkdWUgdG8gdGhlIGNoYW5nZXMgaW4gdjIpIC0tIEkgYWdyZWUKaXQgd291bGRu
J3QgaHVydCB0byByZW1lbWJlciB3aHkgaXQgaXMgdGhlcmUsIGV2ZW4gaWYgaXQgaXMgYWxyZWFk
eSBpbgp0aGUgR2l0IGxvZy4KCkkgd2lsbCBwcm9iYWJseSBhZGQgaXQgZm9yIHRvbW9ycm93LCBl
c3BlY2lhbGx5IGlmIEkgaGF2ZSB0byByZWJhc2UuCgpUaGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
