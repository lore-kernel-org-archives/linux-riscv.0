Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2594EE9D827
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 23:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f+szqjkvfyJeOKIzwYXm2JbfC0KhyJvD5AW5VKzBYKs=; b=ALC4jePcTVBwtm
	0QqSIQ72xWVAkWziysUkBCk+vuO+g/oGoHqdj7U/heePx68pj0qvcNdSgXOig9DGCoIrll6U0WzwI
	mt8sGbE263OGR1CQSAQtNKh6kAgyHN9IM0ONVtOlRnA2b8c22n5sRAPCVjYxjTFS7tztgMdQXiNHW
	A6OCrfWw7uoK9JaaAprM5/uT/GYDHsyKUnE6yFEi5zU5B9TEKO7TxCWxYFYRbpJ1gLKP2l3YvuXc/
	woNdxbFZ4BHZZbAfRaniu9HzYOzjYwtKZdO8feyQIXTQIOyEHcQyZtXoJOU9qSCWckrwtnpTfSO1y
	78ebwHlGoUQeSmCUxboA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9WhA-00000004Y9i-2Gq2;
	Sun, 05 Apr 2026 23:15:57 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Wh7-00000004Y93-3Geq
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 23:15:54 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-2bd801b40dbso273768eec.0
        for <linux-riscv@lists.infradead.org>; Sun, 05 Apr 2026 16:15:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775430953; cv=none;
        d=google.com; s=arc-20240605;
        b=aC+RJmEZCpAeULO6IAL75cBm0b0Ar3NR+VKYP2sYSbAgs5AXRrnV95rLKOvTt6lUFT
         z0DUTVajf4OkjOq/istQLGNTfWr2GU6f3ohgPiDvJW+ejBpr+xzgUhX4L8LsVmx7PKGB
         Mw+vHdJnwgInP0nibz/+pfuuClw7LpfsY1mSyrBC8T5pJIRrlg6/qZpo4hFkqc5oOd0C
         tdoVloHuUVCIeH92m1hGegW4GGsuot3FY5DiQvWlxLejxB7m+Ed8yf6looREKkzjaAQT
         xUzEshzGjIko39q6itOouhmlMQgo3yEEA7VZx9FGbNywjcteoTOvLn+DBnsktuGZVYBi
         lHCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        fh=+Ty8ENQmN9GfQ92DrKPN1Tre7XwY2v9ehMxL8W43M9Q=;
        b=G0d3rn6kKd1uf4ft0FDiMY5uMtUVx2Oq6HZPh1dYkCpACOt/1DSK3uIn6mOtyw5XjV
         X/mRBJjpS6F9RfG6sqM9xUrehUQ/5r3FzJR8+cLsUMjqggCibfqLbBhubIPR4vOl0I0m
         JtPobk2nR+YEF0ee0VE1k89xy5qFXk9GK0CMDyb2ZDpYPtIGmD8CyBOgcdCU/356V2n5
         Qr8EuuAch9wp6e2kI7AUKhXh9XJVRR6MWNbl+AT8HpjckbYa8tv1mWMUkGSRhAoRNKFI
         I336mTJSst4VZQzInTxU4HvbpsDNWLuT2w98BtcrqdkfCuAglWrbcvEb/Z6FBumqvflk
         wWOg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775430953; x=1776035753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=UomZZmi8yhjL+i8cmZd0HP8U+2MIjTOtjQZ1hbyEk/zZgMju0LO64YNHg54jkUhQqC
         GAPXy+x7cNTzbG4Tp8iKFU2NnU8pu48OuMl7TQ0FL6mfCGnr4ZJNkuRz67ixcK2plzs4
         L6tGTRxdZ+JitzCwthuBcZUxtariq5En8Mccph3M93xL/8ajxe/Xqy5ZkZAjLSjRhRk0
         YPnjEjk2y79JOIiFX6ptqHO9NGyI6yqkCF0/IF/gj7itymC4mGZwiRWTkmgPb38CxJOY
         Yr1Euh6AksZ26ZwnNEDOMAaZFfBkfm4zYKYBfnMxhW0314VMhQuEo/jMHp7vyLAfV5XI
         CQMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775430953; x=1776035753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7nRF2alQvQ2aT54Jx0Zl/2nZdMqcYryRscNapi5ZMxM=;
        b=qCWKsPOBEZur1/hMp2Q7+MMttTfvrCSjnkEMORPgQiy9sOP6QHG8hnjLCW5+SSkOn9
         jJpRc9zAHf+88SSspdkgZS8HtbU2XbnP3mLM0fX+WVwEOYHr0MqeHr7lVrGjtyS1KEIT
         1Y1Qbvmjt+fHXeuLS6KxU2sXSKjdWvLapMe7jf5zfmS+HprGyiwKlejJisfh8YYjPgzc
         ekIqcjl4UDPN+6iPvx4Dm8T4Qz+/zDeuaDJOkuLUgpsrgT72DkmaRY4/wr+jm3A6j4E8
         QC1fa9+BrxknbfKdJ4PBeTeRIAQ7ZQozpAV3CS7EcRpIk0xFPL6eZjb8wGcdlAA1njnE
         yBEw==
X-Forwarded-Encrypted: i=1; AJvYcCXyWOY6wJ1VBcTSQ2sRnVMYLgaQijQV1eOqyXxUeAaqhKvwIqN2Wl8j9mvbKKLuoQmWiMC7MqfHFG4TzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxTf6lwOQNKceSdeY3Ps6jIRBuIJZAE3hf7jGD17tbwo7ByoCxh
	y4wxo0tlL+HvtWtE4ykb/NBSJtU2VUUTzl5qA3Z2DUsO3n0PNTpJYdteTZ3XGbWiFHld0uN1iYC
	uxWJA/8q6+8JVssyT9fY+oo3m8ifwxXE=
X-Gm-Gg: AeBDieu+0Tt3B0KuRWi55ZyA0wDCABGbUBEb+P/P9mUoQ8BvVCT/AIRKwaV5f6t+6HC
	qttPYxPlufk61tPNI0Q73RD4jwWwMlWa9D5T/7tS7xd96NJ22ZJnWH5hXm1lWd74Y0wsbTeOUqv
	JO0QU3ON2pgLCjweZU6bqTY00177Oln2ILwUVk3v1svYGiJYi5DS9HCV1GqbJTIwC0BzzfPsHTW
	DbBdv6u+JcuXywupw0kPCi08k151qIguM8vBP6uTVZfJ/93Ed69/lwj+C2bvycFZSrUtlEDbSnv
	kQskXRISNTnVdaS8AYgPOTABkEdwqfI0GyFv8jSHh0idWrb/6cuwGNhXPhPzBefvUU8e1B+DVFQ
	KuteWyH7NMH3pqjDcjnksaHQ=
X-Received: by 2002:a05:7300:fb8a:b0:2c7:3a7:c795 with SMTP id
 5a478bee46e88-2cbf669b785mr2053063eec.0.1775430952689; Sun, 05 Apr 2026
 16:15:52 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-33-ojeda@kernel.org>
 <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
In-Reply-To: <DHHX9O7V06VZ.G0N1CQ7BUKFO@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 6 Apr 2026 01:15:39 +0200
X-Gm-Features: AQROBzBr0aNQIDV47zgxZ35JmTq7j6zQBNm1bxMAs_nutxdLV5rErBhW_SWV5gw
Message-ID: <CANiq72mTaA2tjhkLKf0-2hrrrt9rxWPgy6SfNSbponbGOegQvA@mail.gmail.com>
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
To: Gary Guo <gary@garyguo.net>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
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
X-CRM114-CacheID: sfid-20260405_161553_874464_CA24FBA5 
X-CRM114-Status: GOOD (  17.40  )
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

T24gVGh1LCBBcHIgMiwgMjAyNiBhdCAxMjoyOOKAr0FNIEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8u
bmV0PiB3cm90ZToKPgo+IEkgdGhpbmsgSSB3b3VsZCBwcmVmZXIgbW92aW5nIHRoZXNlIGRvd24u
Cj4KPiBUaGUgY3VycmVudCBhcHByb2FjaCBhcHBlbmQgdGhlIGZsYWdzIHRvIGFsbCB2YXJpYWJs
ZXMsIHdoaWNoIHdpbGwgY2F1c2UgdGhlCj4gZm9sbG93aW5nIGVxdWl2YWxlbmNlIHRvIHN0b3Ag
aG9sZGluZyBhZnRlciB0aGUgZmxhZyB1cGRhdGUuCj4KPiBLQlVJTERfSE9TVFJVU1RGTEFHUyA6
PSAkKHJ1c3RfY29tbW9uX2ZsYWdzKSAtTyAtQ3N0cmlwPWRlYnVnaW5mbyBcCj4gICAgICAgICAg
ICAgICAgICAgICAgICAgLVphbGxvdy1mZWF0dXJlcz0gJChIT1NUUlVTVEZMQUdTKQo+Cj4gKFBl
ciB2ZXJzaW9uIGZsYWdzIGRvZXNuJ3QgZ28gYmVmb3JlIC1PIGFueW1vcmUsIGl0IGNvbWVzIGFm
dGVyIEhPU1RSVVNURkxBR1MpLgoKWyBGb3IgY29udGV4dCBmb3Igb3RoZXJzLCBTYXNoaWtvIHJl
cG9ydGVkIHRoZSBzYW1lIGFuZCB3ZSBhbHNvIHRhbGtlZAphYm91dCBpdCBpbiBhIFJ1c3QgZm9y
IExpbnV4IGNhbGwuIF0KCkkgaGF2ZSBiZWVuIHRoaW5raW5nIGFib3V0IHRoaXMsIGFuZCBhYm91
dCBwb3RlbnRpYWwgb3RoZXIgd2F5cyB0bwphY2hpZXZlIHRoZSBzYW1lIHRoaW5nLiBJIHRoaW5r
IHRoZSBiZXN0IGF0IHRoZSBtb21lbnQgaXMgdG8gbW92ZSBqdXN0CnRoZSBgJChIT1NUUlVTVEZM
QUdTKWAgYmVsb3csIGJ1dCBub3QgdGhlIHJlc3QuCgpUaGUgcmVhc29uIGlzIHRoYXQgaXQgaXMg
Y2xvc2VyIHRvIHdoYXQgd2UgZG8gd2l0aCBvdGhlciB1c2VyIChrZXJuZWwpCmZsYWdzIChlLmcu
IGFyY2ggZmxhZ3MgY29tZSBhZnRlciB0aGUgZ2VuZXJhbCBvbmVzKS4gQnV0IEkgYW0Kd29uZGVy
aW5nIGlmIHdlIHNob3VsZC9jb3VsZCBzZXQgYWxsIHRoZSB1c2VyIHZhcmlhYmxlcyBsYXRlciBp
biB0aGUKYE1ha2VmaWxlYCBpbiBnZW5lcmFsIGBIT1NUKkZMQUdTYCBsYXRlciBpbiB0aGUgYE1h
a2VmaWxlYC4KCkluIGZhY3QsIHRoZXJlIGlzIGFscmVhZHkgYSBsaW1pdGF0aW9uIHdpdGggdGhl
IGhvc3QgZmxhZ3M6IGAtV2Vycm9yYCwKaS5lLiB0aGF0IG9uZSBnZXRzIGFwcGVuZGVkIGxhdGVy
LCBhbmQgc28gdXNlcnMgY2Fubm90IG92ZXJyaWRlIGl0LgoKVGhpcyBtYXkgYmUgY29uc2lkZXJl
ZCBhIGJ1ZywgYmVjYXVzZSBjb21taXQgN2RlZDdkMzdlNWY1Cigic2NyaXB0cy9NYWtlZmlsZS5l
eHRyYXdhcm46IFJlc3BlY3QgQ09ORklHX1dFUlJPUiAvIFc9ZSBmb3IKaG9zdHByb2dzIikgc2F5
czoKCiAgICBXaGlsZSBpdCBpcwogICAgcG9zc2libGUgdG8gYXZvaWQgdGhpcyBiZWhhdmlvciBi
eSBwYXNzaW5nIEhPU1RDRkxBR1M9LXcgb3IKICAgIEhPU1RDRkxBR1M9LVduby1lcnJvciwgaXQg
bWF5IG5vdCBiZSB0aGUgbW9zdCBpbnR1aXRpdmUgZm9yIHJlZ3VsYXIKICAgIHVzZXJzIG5vdCBp
bnRpbWF0ZWx5IGZhbWlsaWFyIHdpdGggS2J1aWxkLgoKQnV0IHBhc3NpbmcgYEhPU1RDRkxBR1M9
LVduby1lcnJvcmAgZG9lc24ndCB3b3JrLCBzaW5jZSBpdCBjb21lcwplYXJsaWVyIChgLXdgIGRv
ZXMgd29yaywgYnV0IGJlY2F1c2UgaXQgdHVybnMgb2ZmIGV2ZXJ5dGhpbmcpLgoKSSBhbSBhbHNv
IGEgYml0IGNvbmZ1c2VkIHdpdGg6CgogICAgV2hpbGUgdGhpcyBtZWFucyB0aGVyZSBpcyBhIHNt
YWxsIHBvcnRpb24gb2YKICAgIHRoZSBidWlsZCB0aGF0IGRvZXMgbm90IGhhdmUgLVdlcnJvciBl
bmFibGVkIChuYW1lbHkgc2NyaXB0cy9rY29uZmlnLyoKICAgIGFuZCBzY3JpcHRzL2Jhc2ljL2Zp
eGRlcCkKCmJlY2F1c2UgaXQgZ2V0cyBlbmFibGVkIGluIHRoZSBidWlsZCAoSSB0aGluayBpdCBp
cyByZWZlcnJpbmcgdG8gb3RoZXIKdGFyZ2V0cyBsaWtlIHRoZSBjb25maWcgb25lcykuCgpBbnl3
YXksIGZvciBub3cgSSBtb3ZlZCB0aGUgZXhwYW5zaW9uIG9mIGBIT1NUUlVTVEZMQUdTYCBpbiB2
Mi4gSWYKS2J1aWxkIChOYXRoYW4sIE5pY29sYXMpIHRoaW5rIGl0IGlzIGEgZ29vZCBpZGVhIHRv
IGRvIG9uZSBvZiB0aGUKYmlnZ2VyIGNoYW5nZXMgKGUuZy4gZm9yIG1vcmUgYEhPU1QqYCBmbGFn
cywgYXBwZW5kaW5nIGl0IGV2ZW4gbGF0ZXIpLAp0aGVuIHdlIGNhbiBkbyBpdCBhZnRlcndhcmRz
LgoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
