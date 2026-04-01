Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D21DD2ED0A
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 13:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NlBFQ8Am4HCfLrjumgSIklAsH0I2O1Bqg6KcEFYL/6Q=; b=o97GwyQH8tT1WT
	2KwAQSL3QWuMU15tqb4ac+FXfRhwQJd3FnOjRRCn2nm2x2u7jPD8WGp1w9Zr7pOUbEUZofK2cwqlg
	hdb6p7iNBl0FIAcR7ZXpciVQxXwtszwEr4y62Vggoj2s/2XEgAmmoNUtmDigIDWfRuLXgioOR6rs1
	qJt+xnxhxhVr/C/N9laVVAuFbu5Zx1DN0KHg52OnS30YCvpN4MLZyzJH74PwUS1/dBWNBquLC5jmA
	QxbRpDE70BCeEPPYCE/JJFtiPPXVyWezq8ley+7QXMsx4XYSAg7pbZya6x0hpvdBkxUTSOfsXbQt3
	dADGjiXFToBSa+5ORnHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vfq-0000000FJfG-1fUq;
	Wed, 01 Apr 2026 13:31:58 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vfn-0000000FJeT-0Onn
	for linux-riscv@bombadil.infradead.org;
	Wed, 01 Apr 2026 13:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=; b=FmUyyEnCuaqLqchdTzuxqtOYnG
	BQXbGgUi80x3R8qYfWXjtFkgDu4jkfXj/F3CIRFZ/VA0ZrIzh7cuC6MuONcSNrp1r7DSh6keAFgSH
	M5eWXQpZft5+YdObYyp4x+AUsWMhrcemin9zumTKm8j8S6IEhc6S/+LOc5aVLUS8S2vkElTIziMG+
	6aC4ik3OW0x7Ri/H/ifPTODZI3u/kkHankS5+O6iFg33Ai+y14d7XCP9MqkSfVhn11LmALzsfayzk
	8G3F5Dvg/sodNUwdz0BOTIzvvEyHik/yaCDhP7/NXsPyAlxjTr1MdOzlPxXy4GTiycnyBVieAas9k
	NVUMCjEA==;
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7vfk-00000000T3j-1SNa
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 13:31:54 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-2c6f5574d07so109605eec.0
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 06:31:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775050310; cv=none;
        d=google.com; s=arc-20240605;
        b=O4YqTaFxPLe6J63Y4s0JKgxF5vh9kIKN+xcOpZhAnWxg/XKlUJMkgszxdWNhhpi9FE
         uXMeNddEpwtwWPRK4KsWmRirK7x+YrNe79DNXfPHxjDdANwDD1lNYixGG1GvYEehD1jl
         txUwgO3crOYPuibIYXZnCBaZRYSg3GkAkwKvFd0xuSEA8A1QR5qLjYonrhSCtpDy9TNb
         SyxVVZmDf6LEbV+BAsb4L2CLjPtYwrlZFhDWtknPWgIHrwK1TqKKXF96Tbq2hM0iA4GX
         1f1ESodM8MD7o/peemFRKUWUAN0xGf+qRRBUy6mg1G2WRSUMVDJhN4LUyB5npQk2namw
         D0XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        fh=ssNPdEDClqVyBXPnze0vor1G8uSUgRXjb3nFywPXJdc=;
        b=EbxMsgC8yjCk7AyBwgobsY1fjwalOVE7z9bBRorP7269oHhbd2Sw9m6g/0wXmvLD7t
         vR1nXA1qmq7696AT4o+7Dan8WeaqIGP46HZUNWNy4whQBFLGSriD1x7ux6yR8O+GVU3I
         Igy7mhWnXyIVPbQZQm0EmjJNKtqceV2+4isSJGrHzhjLKxUA3kLCixYaMkscwgFtp57j
         6GLohKTKWRt7Bjuq2/M7FKo9l9i+YQA+tcCbawTcMiP4VURvkdpl+JAgCQNQxAWxC0uV
         shVCdsvh7F7UMkWJw2yPvuxZj/b6D0xrt25ZdSkyYkejv2jVI/VReqW8jlc2l+LjY7Cw
         xOtA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775050310; x=1775655110; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=SCgR0gvuCjobaq9a9ZFi5Bsp5GabYzSyQ2nsqnL5+i3+12XIMqdV1qoIBIndTOBz9E
         UjT6ubnVI4IDJOKjgBPeLNxbSrBj7+nd00hCA0/4bYQ2mHX7FDMyRPetq9X0fDst7tjt
         fp7XV/1ZuQGhB+yiZbAxf+O5qkLjAnkzeW3oJ+OeUHYWyve+JBCJ8OvZWyyLSJgZW+3s
         syqSre9BxIapR0DD82IyMr1G4yTzPEJraEJdlgzjwxV4S5UFTlnaW1ZsWWOFq0+uwnYs
         AScAGHWhiRm3pPdwuMQP7Sv40CazaXEziCwSFy1Iw8PEC54gHSgKrt8wX6UVnCEqgvZp
         btXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775050310; x=1775655110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Pxwyobpuf86TQi+f2j4+wIWXBQigp/e8eZSaPuRG5TU=;
        b=JO5vaXaiFnh3p7oRMldUJRGZeGc1ScPPbtukHg0HaHO4E5+Q+AqBtAkoXn2IaEpS0C
         D6XfsT1+dUjxDtNx8vV9pdtL6GwH+MxxBEyCW4PhTZn2R0Vpo0XOxwMvFClMogUsoay0
         oXcccfO8NJlHe0OsrnjdDpWkzLq9e6YxF/JQp3SdKSjepemXx8Zr0fN91ARhxuO3sbgr
         /LuCM/KThrJdcW/k6D+RXZgyKcZdwfU7bXyYVPYjtPpbaDYO6vHUDd6eVVRKTlsOlEGs
         AqkWErhwkLl0Yz84oMVHlRxaFmVw9mmMuCwi99cgaLTj3Zewxr+/cxF1S59jA0WnmQAA
         qC7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXULckWdUDorhLn59H8us5pimrMuw9SSzbtRkdkV06Ah2mz+nwZMbnxHsD6VjYgQeb76y+s8VZ8hRrSdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXu29dPhUIs8NgMZYVBtAjrACpzmEfPMBdEbtjm1X6RFBf8UTH
	diVbkfjl4bqb9KoozhD5Fx1ILfF3lXpTqj+CLMuqlV11VWbcIIggi4RBsK09alKRmx8hf3SfjkY
	YFrux/910VSTHCNkOmTm5sUoQs8EcqbM=
X-Gm-Gg: ATEYQzy8/A4QmjXS0d/rHcfk2sEn0Znml8kQqOz6tPPsHhAFoA860Tu3iaj21T5IhI2
	bUoOa3b7HJwDpLJVGQ+2rQgkgWRnAi4k6f9M/hfv3jjoMowedLMugfqn9YHqJCPAlzDn9R8mOVO
	zqFbEoREGFH/fmJGbk/CRN7uYJk+T8itnI11J/exRM/XrBwOmf5EheqaE12DGsR1P7skNQR9/Vi
	7//Af2Nj70Kfb64aDAeOnY4f52vPD8AAIIrUlhr4rb32oOE+1hoq750IYUsg9k7aG5fnltUunls
	h18HlZ8u2GKDLApnNAWvtOuTUwPbyH341j4BUedJQkIciwLSF5TBZ/0z3KwsKhQrhBINf0YatA3
	BA3jGSwyC1AelOECCIhmYS/9tCuRKMpmS4g==
X-Received: by 2002:a05:7300:fd16:b0:2c4:6ec:141e with SMTP id
 5a478bee46e88-2c932bab66bmr849425eec.7.1775050310241; Wed, 01 Apr 2026
 06:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-2-ojeda@kernel.org>
 <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
In-Reply-To: <DHHUQRB9ZL54.VQZ7OUZNSYDS@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 15:31:36 +0200
X-Gm-Features: AQROBzD4KmXruNHpjUyy0X5nLhLhXQUuTTY9eP3fb4LBTyRyQ4wVkUjvlUGGI0w
Message-ID: <CANiq72=FBbJ--jrzYyKe3T56YqT5eU+0DXzPG3Ho7a+D9rfu=Q@mail.gmail.com>
Subject: Re: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
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
X-CRM114-CacheID: sfid-20260401_143152_446357_FB4F1805 
X-CRM114-Status: UNSURE (   9.14  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCAzOjI44oCvUE0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gVGhpcyBkaWZmIGZhaWxzIHRvIGFwcGx5IG9uIGxpbnV4LW5leHQsIGR1
ZSB0byBjb25mbGljdCB3aXRoIGVjZTdlNTdhZmQ1MQo+ICgiZG9jczogY2hhbmdlcy5yc3QgYW5k
IHZlcl9saW51eDogc29ydCB0aGUgbGlzdHMiKS4KClllYWgsIHNvcnJ5LCBJIHNob3VsZCBoYXZl
IGFkZGVkIGAtLWJhc2UtY29tbWl0YCAtLSBpdCBpcyBgcnVzdC1uZXh0YCwKaS5lLiAzYTI0ODZj
YzFkYTUgKCJrYnVpbGQ6IHJ1c3Q6IHByb3ZpZGUgYW4gb3B0aW9uIHRvIGlubGluZSBDCmhlbHBl
cnMgaW50byBSdXN0IikuCgpUaGVyZSB3aWxsIGJlIG90aGVyIGNvbmZsaWN0cyB0b28sIGUuZy4g
aW4gdGhlIGxpc3Qgb2YgZmVhdHVyZXMgaW4KYHNjcmlwdHMvTWFrZWZpbGUuYnVpbGRgLgoKQ2hl
ZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
