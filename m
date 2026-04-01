Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ECE107638D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 17:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oIx1Q2X4smmfcWJkTnkd9hM3ks5sHGqguAdzR8mkhp0=; b=Kz2z0uEKBWmgZV
	vUq1Tm6v+2N8dGfk0YQFyZyPh0aKlAm51a+eiPXzc8ePS9oSM1+FXIEa2Je2qdhWS2WLEZ846HL+h
	j3W0TlCmo677+juzK9I4BehUjZLxw67rSmCEe0avOByeI+5oVXRxQmfKEJFxXd2dZnfn4FRRNLscE
	vzGm9m0RR8Y6dDPrFqnpbyLQc9VSRm4TLVH+jsrST/I7Pcf7HTt/3n1eWArJSZtbINbmXxq1FWQw/
	7tXl/OYzx78yLewCVnd+f+ccIwXltv2VWYLYDm8DaVq5K/rTzftPjblbMIzaEG/l7Yoyz+s99UpD3
	v4SGiJ3Sv6Aik5rqNQ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zdj-0000000FspN-23GE;
	Wed, 01 Apr 2026 17:46:03 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7zdg-0000000FsoY-3QIm
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 17:46:02 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2c98928e4bfso5259eec.2
        for <linux-riscv@lists.infradead.org>; Wed, 01 Apr 2026 10:46:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775065560; cv=none;
        d=google.com; s=arc-20240605;
        b=MWGIlCICjmyRLQmMikg0n1ylmWX087SrMeAwApT7iULmI+2G9laUh5A9ZsPbkQq3J0
         hvWb7Dmjy7UnwGiLwtLRYvNYf1UKZPTjQogFEszepYn2slGHl+SgBXUGZmOkK+uMhvNi
         pDF/fKt2YdYHx7qwoXUDA0sK+K6wc8ec2EH7Yvm/0YJb/CBR69yTF+j7+ckEoQBlkRqJ
         VHZg9T4rImzKQPFXjeLVtxv4ddM4gjMxCT7HqRbcayRKm24znYrLL/CZnVo8TDPLnSaO
         cLUBKowX56CRu6+kP5Vc05Ey5oYkg9p9HcP0i7PVtlUhYa1p3tCKdQmR4YrEvoHs3cSD
         Kxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        fh=BHUIiKKUwmJ74o/JzMAPlOHgO5dv/hZ63OyKYyncYHk=;
        b=fHEdLFMNP6zRPXQzSlG3B60ewGbZwbDwkgi3r1XdC6RH1JcsF3uM746lXcJY2cX2D7
         IzY19ocCRffcqcfszAUJWeCBit2ATyGxyXimAGRUEmJFLc8dPszCnafK2DQnF+CHCeFh
         62HMJYAekoAlBQQCuSSKmndXYTHsodceC2COyFmAt8YhOQ0qY7UyTgTgdN8C28WPL02O
         ooTogX9Lyq28GWGFVAvrzh1kdsOVsq635XjJMXU8pf5rLTBzSk3LRcg4rg/tGUffkYmf
         tXt9Ih61EUA9xTw1cL3WlerBBgdpNotwtw8RVy2XLDTllMiPRlCYeeaYUlmuYde7i7ZA
         zA4w==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775065560; x=1775670360; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=Er1sJ3DoQvvVHidqEv5JK29LEsVCrhyCQDeQHToCvlQJDXUcwk/zDt9UL/AgCy82vN
         SN57bRaCSl1EXyPcHqqp6SnEtrwAIbdYlFOByMlRmFvL+jwWZ6RUFIapavVGS+bPawzt
         goVVaNLimX2uHEhutyrTAzRBmBzg9R+CNfL1o7mIJ3k4q3hAIksp4Rtg9nW8jqOoqbru
         keibLA0kSSsb0sD7p5TfBfncxmDcjlU/fQpdMXQN9KP83avX3eFmPLS5gLyFpPzGBCEz
         gnuqGDJSg/cF/Tn0vW5229ZwuxPBCHz2rjYcKYBsH5hQPnc4fFYV3jR4tq5obn+4rll1
         XL2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775065560; x=1775670360;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI4ZvYmbpYFMS5F4DxWr2Qtcv3EtByJoEsfGF8Isxow=;
        b=QDaJWJr1B9s5CleBk6WfBJ0yF8D+WhqiFpuZ3HE0oqQ2O3VDWjPipwEK41yv/nwmRW
         SQ/a3snLhfAkyzR0ZyxGIVI5+k0nf6GiU4fR7xpP1ZqMHE5FtfiMtGEBFX+qO5A01HV9
         WCqyd6DHfH3dladiSs1/14+A29S9k5Ao/7/ZureX+Fe1uveLtBiFwwa9GoWtlz+XRQnZ
         aNzpj8LjU5tBLO/cO121X9OhbHmwLuGERXgOi3vrs4bWERVthC2Jv+Kp610nZ5VCiwXs
         7BckOWdZsykhL1anF9urkk4NB0YX420WnqQoO7iw9E89o7wz2BBv3ugZZWNgYLhS3JWy
         6XOA==
X-Forwarded-Encrypted: i=1; AJvYcCVKcmWjDWP1n3VWaZLisS4BbCQs87d/paHO3chGjJe5XKBJg16CWYnZZiqzx4bg8bI1T93+NiJ5xkNBnA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw787z5CMUK5JwS9v4+CO8hlIBnCNhZQ2hFeZqA24nb1URHDvF1
	EUrDjaZ3pfSK8Keb7fxIFdLXKdCoK+vKqyH6TqmiiR7TvByFr9ejwYiZxPqYyI45HBUOXHj8HBn
	4GFhcybZtjv4SwKE0j6sKIB+ZrkE6BCI=
X-Gm-Gg: ATEYQzz/XvmpSDL2lZxY4jqdsJ+9js3OJ00zJauteww/URsi251y9kh45TrzPM5qB/7
	x8pqKD4abI7Nf7Q4id4ZWIujDDGM6iKRO3H5f22blNas4KKhUKes7MRdIo0EkIr16SIgi67cL5h
	kDqTXjcwJcKJWPBdiAoTXhbRgag/MFnb5OXA86CXjDEBS+y0x5oQQ5Z/ahdw6oyT754hNeAVu5C
	GN/aNHP8JLxZPw0+vZCFZ7AsxOgm+bt+lSrps8axk979c/PoPI6GkUJctrgzKx64RSQUn/hPuhk
	pQ2+Gy7cqLHyNhg8Qg9kUPe6k3M8a4YWlqU60BT5XAa2brKR56JFRoJ5UX99Jd4S+NNRzDUUxCk
	VOsEz0yQO9VOqD3IjxkO7nqpB9A45w+XSfA==
X-Received: by 2002:a05:7301:2c05:b0:2c6:7f49:a840 with SMTP id
 5a478bee46e88-2c930798a4dmr1033595eec.1.1775065559731; Wed, 01 Apr 2026
 10:45:59 -0700 (PDT)
MIME-Version: 1.0
References: <20260401114540.30108-1-ojeda@kernel.org> <20260401114540.30108-13-ojeda@kernel.org>
 <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
In-Reply-To: <DHHVSX66206Y.3E7I9QUNTCJ8I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 1 Apr 2026 19:45:44 +0200
X-Gm-Features: AQROBzDasvNfwm3irNcxLclKgLrVzocIHNQudR_c4deB-93-CSbalwIa-aYY_TU
Message-ID: <CANiq72=8eVKk0gqyvgWM_-VSsRZY1s2e7gx9AbAg+q0dRRYO=Q@mail.gmail.com>
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO comment
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
X-CRM114-CacheID: sfid-20260401_104600_877680_8BA3585E 
X-CRM114-Status: GOOD (  11.12  )
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

T24gV2VkLCBBcHIgMSwgMjAyNiBhdCA0OjE44oCvUE0gR2FyeSBHdW8gPGdhcnlAZ2FyeWd1by5u
ZXQ+IHdyb3RlOgo+Cj4gV2hlbiBJIHdyaXRlIHRoZSBjb21tZW50IHRoZSBpbnRlbnRpb24gaXMg
dG8gZW5hYmxlIHRoZSB1bnN0YWJsZSBmZWF0dXJlIGFuZAo+IHN3aXRjaC4KClllYWgsIHRoYXQg
aXMgd2hhdCBJIG1lYW50IGFzIHRoZSBhbHRlcm5hdGl2ZSBpbiB0aGUgY29tbWl0IG1lc3NhZ2Uu
CgpJIGFtIE9LIHdpdGggZWl0aGVyLgoKKEJ5IHRoZSB3YXksIEkgd29uZGVyZWQgd2h5IHlvdSBt
ZW50aW9uZWQgMS44NSBpbiB0aGUgY29tbWVudCwgSSBndWVzcwppdCB3YXMgc3VwcG9zZWQgdG8g
YmUgMS44NiBpbnN0ZWFkIG9yaWdpbmFsbHksIGkuZS4gImFib3ZlIiBhcyBpbiA+CjEuODYpCgpD
aGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
