Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B55A10ED674
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Mar 2026 14:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uDi78mO3yMjTWdwl8GNl3SdTN/IiUq8nkE5IsL9rFuM=; b=FgRIL5BF2gt/9N
	6QG8VuIB9z0hQMmvVHjor5zhtVsQBHUl7iucuMOXPfPHGKDoiiatOkLbbL04BhMuslKW7/O9oX/hY
	+5GAGc/8JTb2Sdq/XcoU2k30FIbkyxsYOPVNl/IaDyF47QP1iHOAR/YOe8hXZO53lHhNPpxo9S4s7
	bAb3GYn4/tYSZAH1HgwKokJR/Y3Ejz2MipUvSzR0edRrkGhaL1cIO4526bFskFamQTIpvktstL/0R
	+fObw5SXrlYhIX4OqGffQyT3eE5h5v3az1nt2iYLwGj7dH41iWLcrY8QW60NKYGLEo0vVDHLJNkRF
	k8WhYqYfBVDrwMPmGJkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w684i-00000007bJk-1RZO;
	Fri, 27 Mar 2026 14:22:12 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w684f-00000007bIs-3MPF
	for linux-riscv@lists.infradead.org;
	Fri, 27 Mar 2026 14:22:10 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso18949085e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 27 Mar 2026 07:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774621327; cv=none;
        d=google.com; s=arc-20240605;
        b=hcZJQDbNdAY9pFf9bxlVvYOe8RlxJVUTUtpcNoFez78anJLF/J+wIZU4YesE7XYLY+
         RXJpPW1slgVvgHoOLMR/cqJEFisFLqM4N7A9IlDn76ZGMtxr7CYwaeseOIWq4fp9pXQs
         4TwTnEsZhkl4DCdD4NODSGVS9wHfCs3lshw79XzL0uEEODTyiLdPL2czn30dSXDwOSjM
         4414m/tWHQ3m1PPjDXk4jYCXpjx8zrUqJLLW8HmWKxOP+73WYHvHR9ypNl67W4Povhio
         WJdrJXVE689bpEhFmZsAou4x4JyRBSPB+6h/REGi9/wWQ1sR+pUVBQzfIYejdTzkItlQ
         d2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        fh=OeW8xZL6FkpGP6BA9nnsOy+VYkdB6Nwq3Lmd0E3rNQc=;
        b=XyN+exwLV4v9ni52guHLii3CUGSGu2FLT/WydN8I/0QwfUMSGry8sm/VaWgbxQixK2
         JENhrS+Mq024hily0gTycaIYH4CR7M2sg9P+kH3vrNBCnZWM+paU4Xb+EWWXK75jV0u4
         Qoj8X+eYNEUB9kVnVYmsKpV8O8s8zltq7YAedpGkkGMBtDpCR6D7xbkJiQjwMPD+C79R
         2d05lADpUsR70ejtLJtZalKum9UE9B1+p7V3h49fHuIWzkI4TSpm3mt7GUfQyGrlUyVb
         pEpZLSzafjH0UftqgkW8R3pUcEMr6k3WHzxORPO7Z+W9ZZXUfo8jWz8iJKzwQk1jALP3
         Riow==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774621327; x=1775226127; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        b=n9Gn6+IONg9zIwS72NGlS1nU1WF05u1w7ZTr5zPKxATSYk9xHyoMtZ5vt8zX7B3oly
         X3uO+cc0nvwDBpnFRqzJGYTwNSG7hpmypCsAHA0f3JWdgj80HV3CIaRDWnS0NapPomGB
         6w+pa/cJf0iB72vQhYp/HcPbm3u1Bm+162Socw22uVmxw9XBDg29iuiykkGQaL3cItM2
         qIdoWi/R7AApFvpVvWZr0yV/50+Vir0HP0jCwO+R1FkbrTa85uM72X3T4mYCO0ipDTTQ
         oSkTri1COAc81rUnt42M2aCU5fXzEBad/BWDEQ41QgQ/s0W3Yj7wQlPfCJ6A+QrVFT68
         pJdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774621327; x=1775226127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ms382mXmeMfyEZXo+JDpLmvuZwZ5tlyqI074nqlFpZI=;
        b=GiX9hl01Z5zUNvVThInHFi60aQzbJOvqc1nLQYQitkwZaRVNZEcO8E0+cJ2qPWjBpK
         UOs6Eln10RhSKpKSAceVqzEGgsX8da42qfJIabWp8c6cgknewF83Tr3kMoyEcGq640Jp
         WSjj4/zzLmygzPIOlAWyQKNOMsPUP4Bey8EJQ9DQ6uDsz+gkXYUwowdeIX1IIhFcoFah
         3xHoYKZyAxjvU8WZcSmO3P3Q7BmTFSqya2NmhYtTzPgH9E3r2bj0IOkaWu1AsSRw+5Zm
         rgg8kmURn54rzojr/PIiYRDDJ+tSPYB53Vsw+RrHPIQbdHozi/K40GARWAI43ThNOyaa
         JSUw==
X-Forwarded-Encrypted: i=1; AJvYcCWguQa+S/GMq/15UQrNd1Z1MG6mCsEuiTN/rfw0rP37OWCv9R0kUcavwjJ3vvB6EniLOaC3o0x5LcoK5w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Xq6y2Qxt9juuZE9XVTwWHYxWDAiDqDBhlEGC5jbA0AmICEpu
	1JfTuQKho4gJcR5O1oQks6PLgtD2Ft+JdYMMpbk+EWkDE4ENIHuzdAljPqUG0ENoHGNoK5UsGm1
	zHQFpvDqOm9q1ERF9sfQHd0i9vsgMtnA=
X-Gm-Gg: ATEYQzy96PlxVqL++Mz9zKHTW3q6tsDkE5fWq4DV2LwAmLe3Cj5OjBA3COJdM7yhW4C
	ZT4ZznJ6SGQBzyzNGFy/HmKyFnZrIXcqExGDpRfmKtfxXWilt7GNZ0wU9fQDhLMWhRavgBkeZOz
	XunRA2qeLB88vjCWNpouT7eVNJBg2NlJxC87op0SdQz+Afj2kGUTr/2WKtuzst0+mJdhVESwvcR
	Y2P6nOWw+jwK+4cd5gvUlZUneOWHsnPXuuRiUGvVfw1dk4S4jAPcKBwUm86im5nUoZvShLlhmat
	VJaNugI/82CBH35CwxLQSa7pW91qCaUUit/Z90lc2yXuDhQ+St3DcD+F3eQaFgPhGlYZL0bA8+1
	MOB4jMcGKEJA76O3cg+gvAg2F3Q==
X-Received: by 2002:a05:600c:4f91:b0:486:f634:ef1 with SMTP id
 5b1f17b1804b1-48727eda549mr46648885e9.17.1774621327165; Fri, 27 Mar 2026
 07:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <20260327114741.91500-2-pilgrimtao@gmail.com>
In-Reply-To: <20260327114741.91500-2-pilgrimtao@gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 27 Mar 2026 07:21:56 -0700
X-Gm-Features: AQROBzBIPfZAUsMrDB7LBzUtbbmaH79IMxVvd9bzKdqKC91ZGulsOHpJpWVa3Bc
Message-ID: <CAADnVQJizm+Y8_AE0rjJnBCrvNc+ThiWdbc-ZuUZqYTLtf=MOA@mail.gmail.com>
Subject: Re: [RFC 1/2] block: Introduce the UFQ I/O scheduler
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: Jens Axboe <axboe@kernel.dk>, pjw@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alex Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, Alice Ryhl <aliceryhl@google.com>, 
	tmgross@umich.edu, Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-block@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, bpf <bpf@vger.kernel.org>, 
	clang-built-linux <llvm@lists.linux.dev>, Kaitao Cheng <chengkaitao@kylinos.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_072209_851697_F6DEC3EE 
X-CRM114-Status: UNSURE (   8.30  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgNDo0OeKAr0FNIENoZW5na2FpdGFvIDxwaWxncmltdGFv
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiArCj4gK19fYnBmX2tmdW5jIGJvb2wgYnBmX3JlcXVlc3Rf
cHV0KHN0cnVjdCByZXF1ZXN0ICpycSkKPiArewo+ICsgICAgICAgaWYgKHJlcV9yZWZfcHV0X2Fu
ZF90ZXN0KHJxKSkKPiArICAgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICsKPiArICAgICAg
IHJldHVybiB0cnVlOwo+ICt9CgouLi4KCj4gK0JURl9JRF9GTEFHUyhmdW5jLCBicGZfcmVxdWVz
dF9wdXQpCgpJIGJldCB5b3Uga25ldyB0aGlzIGlzIG5vdCBzYWZlIGFuZCBkZXNwaXRlIHRoYXQg
eW91IHN0aWxsCmRlY2lkZWQgdG8gaGFjayBpdCB0aGlzIHdheS4KVGhpcyBjb3JuZXIgY3V0dGlu
ZyBpcyBhIHJlZCBmbGFnIGZvciB0aGlzIHBhdGNoc2V0IGFuZAp5b3VyIGxpbmsgbGlzdCBwYXRj
aGVzLgpTaW5jZSB5b3UgZ290IGNhdWdodCBkb2luZyB0aGlzIHlvdSBuZWVkIHRvIHByb3ZlIG11
Y2ggaGFyZGVyCnRoYXQgeW91IGtub3cgd2hhdCB5b3UncmUgZG9pbmcgYW5kIHRoZXJlIGFyZSBu
byBvdGhlciBzYWZldHkgaXNzdWVzLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
