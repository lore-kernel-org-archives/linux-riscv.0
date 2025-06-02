Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B848CC5AD49
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jun 2025 21:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TVablV7BaN8lUkMWOBQ7HD2wT5FPfMunNR0P70L6mac=; b=32UG/uPnrWz1A7
	MycQyI4nnv+SSyCp1q7DrfFEXPQwu0ooTkIhEGr/K4pqx5yxEhl+r0t+kZt8yaOBYW0432Wpnt2XL
	OM22OxiJBg6SJKplUEf7tBb/lRtzi1Gi/+FPHwv+HpswF89gSC6wKOS0CKMlBfLYEJU2OKK1xNrPw
	UhfLrv/rvE51CQhoofDIL3FU4fU4uKM3qDYjjuXvDqJfW6wJUot7pjgZOpjVwJ20psdQ6p6ao7xoG
	T3MYo/2mlbyu7YfGfghQ4M3zEQ+I2wnh9lEF93Z11gg7AINpF2WC7CMZrmmXtYpisiWsbpzXKxYH0
	6LS96fTqeGhKe5t++G5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCOz-00000008vqW-27yX;
	Mon, 02 Jun 2025 21:09:01 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMCOx-00000008vpm-2Er5
	for linux-riscv@lists.infradead.org;
	Mon, 02 Jun 2025 21:09:00 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a3758b122cso3270700f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jun 2025 14:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748898537; x=1749503337; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a/8L0hwmoewX6XMClNvSa1w1jQ17S1ZfwQS9T8uDa1o=;
        b=Alqwt9uRJL/ndQU7HSJi50kZN5yT6Ts/s1uAFNtwYa+pRfSeu+P5DwiV4eaWOSsvTf
         jxYWCp+JJoLR7A+r7TTP5u3sntcpUnptier+xftUfkwHCgg1CNqp0/bGDMHiJJoNJHzg
         Stf4lefKw+psln1OtImTvNMCbySLxxE5p7et7zpl1GJEnKkXMUu60N24Im3MmsddQBFE
         +R+x862MLjThZVFtGLmH2owKq4XVVfxisq4RHsbsvT52LshPeJ2PplCIUl/5oyzBgBDU
         CavftJLWZGN9w/5WD5YJs2tgAeflmVzJFTi6hRSEYYyKnENUw+7LfzGOuaZ7S1N4Hey8
         TgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748898537; x=1749503337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a/8L0hwmoewX6XMClNvSa1w1jQ17S1ZfwQS9T8uDa1o=;
        b=ut5g6fVsy/AYUXpvwL3UDoY0Cgh64/3Zoh4O7+gK0JNx0WVyZHI8mbcVyKMmEEDJ2f
         Q8nYkIlF3+Nbie+JyB1nrhMykzSEXdNHI+l/hgf+NLKcrsbnvmnvzdgue8hoGxGKyP+P
         7L0BmBQmcOJ/BRwRuJR4YuCMqqjKK31SRVgmuxYzrcXSmqAX1weFiWmtuQT/tAbsKWLJ
         ep2s5Ae3SCt0CsGIdOl36yNPJ0yez76ByYGWHlkni+68OQWWBm8btyLVAge7fl9vNJk9
         hYbkX9rqwkZF3hs8PMga8uP0VxXcZOCKzkM8OaTjhcAiW3ZVBh7RNJHOZbPj4bA3v+mN
         4Ttw==
X-Gm-Message-State: AOJu0YzzpM09KLdfonbh7aRAojiOrki90/88E4kbqz0C8KI+pZUnKov+
	p3Itm6Mc8u+RgTJKE9kv3DETE5FT/+FzUbTgzeAuI8sWr7ykjpVPFRvW
X-Gm-Gg: ASbGncuEIhAHaBo7XoNe9uCu/T2I4llr4whXRDL7MgSvRqKn7E2aT9fqUr8Xhc/O51K
	vHteI71FbNYNkBlcN9Oz8/9PtYtRzBQG3VMQXEGmUDtNY41gjkMcsJnmX9Bj9tpB6gtUzcSrlBw
	qV11fbhhK/I8710nz7Nh1bglP3YouNbcz/dP5BKQExBQo4u8rIsyBBP6/KeEaE5/pmmDPaVkURR
	4+WJF/9GhdLviHDpqRh8eNXu7dMNAaVhqokgPsnWIB1fB0dDMTWZzTp8t1Etf58i8QvY4d1lvR2
	5Wis7ODu/rj0/7y42fVlQPoMquCF49jfmAqvqzCcrTw2zZ6LXl0p5kb46z5dq+dYII3m2EyYXdf
	LeW3tow15qgh/eA==
X-Google-Smtp-Source: AGHT+IGiv8lXCx81OoXElhMBnUo+8yluZ62FHU6F3qYBpMOqYqb4VzvN8sVVu800Ue1wccTl9sLyqw==
X-Received: by 2002:a5d:584a:0:b0:3a4:dbdf:7140 with SMTP id ffacd0b85a97d-3a4f7aaf85amr11248071f8f.49.1748898537300;
        Mon, 02 Jun 2025 14:08:57 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009fbf7sm16005839f8f.83.2025.06.02.14.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 14:08:57 -0700 (PDT)
Date: Mon, 2 Jun 2025 22:08:55 +0100
From: David Laight <david.laight.linux@gmail.com>
To: =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, "Maciej
 W . Rozycki" <macro@orcam.me.uk>
Subject: Re: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses
 handling in put/get_user()
Message-ID: <20250602220855.519e23e5@pumpkin>
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_140859_575382_FBA27E81 
X-CRM114-Status: GOOD (  10.02  )
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

T24gTW9uLCAgMiBKdW4gMjAyNSAyMTozOToxMyArMDIwMApDbMOpbWVudCBMw6lnZXIgPGNsZWdl
ckByaXZvc2luYy5jb20+IHdyb3RlOgoKLi4uCj4gVGhlIHNlY29uZCBzb2x1dGlvbiB3YXMgdGhl
IG9uZSBjaG9zZW4gYXMgdGhlcmUgYXJlIHRvbyBtYW55IGNhbGxzaXRlcyB0bwo+IHB1dC9nZXRf
dXNlcigpIHRoYXQgY291bGQgcG90ZW50aWFsbHkgZG8gbWlzYWxpZ25lZCBhY2Nlc3Nlcy4gV2Ug
dHJpZWQKPiB0d28gYXBwcm9hY2hlcyBmb3IgdGhhdCwgZWl0aGVyIHNwbGl0IGFjY2VzcyBpbiB0
d28gYWxpZ25lZCBhY2Nlc3Nlcwo+IChhbmQgZG8gUk1XIGZvciBwdXRfdXNlcigpKQoKWW91IGNh
bid0IGRvIFJNVyBiZWNhdXNlIGl0IGlzIHZpc2libGUgdG8gb3RoZXIgdGhyZWFkcy4KCglEYXZp
ZAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
