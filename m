Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0222ECA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 11:54:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=v1FnDlbB53bPSGjmO1kjmyfa6q+UK8NJrHIUiWL2mb4=; b=UwkHbDUoZoppm4
	G++6b88bdT6T450eAh2cDvKNxCTnDsDoc9cuGACWghf5RnAnP8NEH3cyQhFPVsqvugcfC88urKUkf
	CqC6tA2vfRp0O3TG95aOvhfsu2qV8cZ8dObSxjWP7eCnQjb5vOrzJZvc+J6BAn1x4SH6d1OgSReuM
	3+SI64hdp6LYklHCgfm2eA3d4GkieeKbNFJO7yBE9JibLfViQxwrPMCwvCTCIFnsOpukfTcXJ4tlS
	HxW18gc9xZyZ6bHFZvetp6AfiG1XLuLWy1ebx2CjT9XnorNnWJSVQfpAJHSB/zJ/moAsYeqyHs57V
	JnmCRALQguLDU7YVc1Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWPf-00000003SQB-01li;
	Tue, 29 Sep 2026 11:54:23 +0000
Received: from mail-dy2-x0d.google.com ([2607:f8b0:4864:36::d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBWPc-00000003SPN-0sut
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 11:54:21 +0000
Received: by mail-dy2-x0d.google.com with SMTP id 5a478bee46e88-34ba85727b6so49084eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 04:54:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790682859; cv=none;
        d=google.com; s=arc-20260327;
        b=Fto1rk1daBt/tWAqtRzgne+Mvtu7/yzWFNXSVaYcRLrVkb4bQR2/0s1NSroAfNXsbn
         cuZ0fRRmCZA3wLt4KgzgkeeVCflGp2oZAiV8Ep7iQQnecIAT0tTokeFaEo3ddDucardk
         i0O4ADFoxY/mjCbuGzBHIOC0wws0akWuyMayyWIkqNj8mUbRsBz+ZzBqlRvJKcoeBCSb
         mY0DiVlBPiRSQTPp1t2k0wJkdVQY5pvOhCaVLRR+zqK9Usuz5rc3NbjeFJga6958J/a/
         LvB9CUEczW32UM61TEpG7fz0gkzLmqgQU1YXla35RYgzOaMhKbQMu3b7wwUdnqcH6q7s
         qLNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
        fh=fDf9sdJBEJV1ysmE1i7mZp3o2GcsA1JdV9qHIp55rbs=;
        b=O+YOHt2zhzfZ/2+QX3bbdKdI4SrZmZtqVN2apFR56M11IUf1ctP09ttOqxIsoLPCdn
         wjEZBKCrrhVHbBzhws8LpPKMGx91/czR96yFn/+x8kWjo0zzzJlPGc1eMUuMNbxNxq9b
         w9J6r7WSwS583goNzHlB+lCWG5mCwRpGXgBmvpyVxHBug3QD4vcJrNT4d0xW9QBA0Gxe
         EQHSRVZBpqed+OXaZEBT2Io6S4p34fnIRlobMl7rbuAxN4MNHiTPgjBgm/KbiMq6Zkrv
         /rV91C5/1AUeicjB4CUQ2HdQGRH+rxXhQhI3wU4yFaa1Q0JJrNhvV9SUbDBWX1dbBJ+q
         +mLA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790682859; x=1791287659; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
        b=nH8M0uwWz1Qv6OdIPbqh+ZEVK2cTifM7sNXwbRqxB1HZ7wUg2BvT47GlOhf4nfaLdQ
         JgnUNjJIHLgPtKzNHfTfoUuhLKnYY+T/WUvqc/6P9SuPtcdH3Z4svMBE109YI+vnBoeU
         Jn22t0x/aY7GIA7RtyVxli4lQZP+jpj2roT6VM0FADxe1QTOx8EadRVN3JUCgcu31tIQ
         ih2kGcJlXIXiWf5X9IH/VI1wkO46gtlNxyXYocojCCC39z+xIsqEML2niVvVoqzYic8c
         V8qvGihowt2LPdAr3rok62CoG1YYbKYd6vL7+zJEkcpwqdS9MUd4+wsDx2zf4ow/M5f0
         Q7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790682859; x=1791287659;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SmGw5cwf8FkwhSK428tv2i7rM92jCATM9asrQ/AXIpA=;
        b=MaEr1i2lLPkFg8d+JeYplKwu5SwJdFqesrCaK1JnQNXqpcHl2iihNlQBvknYC6EWC2
         MJQ4S4Ep6RSpB4mGee0+Ip6J9xgGo13doXX0tTD6RwfjQnjfjUiytr3lhcbJyWWJJul7
         HvxkJgtWVeUgMhZCGYgirYUPefmqlH/vFoLmUUL77s84EpAyQbG+y60pT1UlnOldY1Y9
         eVtcbKzfjrzMzNItLq9FdnBOr99l/dEqYns0sSeAC26ibi7/jjV7OJeeXLa7BVtCgPgL
         BMYcfzpNOtMYPN2WP7eLLiaEY4MOzJu6VSrCaCPMZ2md8yTZXWZOK4P7qTCBqamwPxak
         npIg==
X-Forwarded-Encrypted: i=1; AKwUvBwaxSpe/Zcrez3gp6oVClbNq+DPtI7o8Ls1mO36NLaLiIN+sdcalofcSZ5IVkQvd8AE5QuvknWIRtKDZQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIJSy6AZ68Q8iUkqsxiTUtXrzHVR2GcRHXv8OFyUqyQ2GwwU9aW
	V45R3y/hauxwEcg46PpJM25WV2e7T7DSZvd7k9zXkpZ70HTkdiT4NDPPSuxuHmG+oQV4RanJ51k
	8vBvjp6h7pJtzo1PwA5SHHiVA8U0HNm0=
X-Gm-Gg: AYBFou3ZZmyFa8citF658T6/lj3NOm8ifid2E3B9w7a/dD3OXK2x+H50nSa51gGb1Xy
	5583wNIXEgdDDvH/e38RbgqrmgjPlCXij5WCAXPMLMoBUbU/rIph4M1gR3TW+i69L+5Ez8X8rKm
	Vck8QJXfoicwJWh7KuId9ACsYAcJxbB4+vz0tECpWuHZzjt+f8yBP48uuKgIeXsqbBszJXAttIP
	D+GRAEYEvI71n5oK5o7wCHHkax0ygMqMofhTW7nUOVFzll8gbFy+/HwMZHYuE7bgWvds8dijM/i
	i4EQmh6kzXNLPXHgXEFy592ZbGWmLv5kd2ruhLKYs/htQ8jenuqs/0KgEBxJrES61g8kXkqy+67
	7VImBPtb62RtT+sRuNIUxV1FoZty2s/Q39e7mlk6jz9sGPTgcSu8PLsCGlip7XZHQPERshge5qG
	rHDOT3uDzu6RT24P3FAiXvzBIW9Utgr7S5KA7wOyiB1wX5POUD1oA=
X-Received: by 2002:a05:7301:1f15:b0:33e:6714:3945 with SMTP id
 5a478bee46e88-34271c88f71mr27262504eec.2.1790682859021; Tue, 29 Sep 2026
 04:54:19 -0700 (PDT)
MIME-Version: 1.0
References: <20260929095612.1072417-1-tomo@flapping.org>
In-Reply-To: <20260929095612.1072417-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 13:54:05 +0200
X-Gm-Features: AclHuK-K2YexCYLcXJ4KxzZzKWIv2PzV5wQE8Dzyu3hoI7PHx3IWsNWfTmQEZ1E
Message-ID: <CANiq72mRRajbvJzwZZzaMiG8UQT1yeHn3Cm1+MSg0VqLT22dVg@mail.gmail.com>
Subject: Re: [PATCH v1] pwm: th1520: Fix 32-bit build with COMPILE_TEST
To: FUJITA Tomonori <tomo@flapping.org>
Cc: ojeda@kernel.org, fustini@kernel.org, guoren@kernel.org, wefu@redhat.com, 
	a.hindborg@kernel.org, acourbot@nvidia.com, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, dakr@kernel.org, 
	daniel.almeida@collabora.com, gary@garyguo.net, lossin@kernel.org, 
	tamird@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_045420_259118_D30860B8 
X-CRM114-Status: UNSURE (   8.10  )
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

T24gVHVlLCBTZXAgMjksIDIwMjYgYXQgMTE6NTbigK9BTSBGVUpJVEEgVG9tb25vcmkgPHRvbW9A
ZmxhcHBpbmcub3JnPiB3cm90ZToKPgo+IGhlIFRIMTUyMCBpcyBhIDY0LWJpdCBSSVNDLVYgU29D
LCBzbyB0aGUgZHJpdmVyIGlzIG9ubHkgdXNlZCBvbgoKQ3V0IHdvcmQgYXQgdGhlIGJlZ2lubmlu
Zy4KCj4gRml4ZXM6IDNjMTgwMDAzZGZmYiAoInB3bTogdGgxNTIwOiBGaXggbWlzc2luZyBLY29u
ZmlnIGRlcGVuZGVuY2llcyIpCgpTaG91bGQgdGhpcyBoYXZlIENjOiBzdGFibGVAdmdlci5rZXJu
ZWwub3JnPwoKVGhhbmtzIQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtcmlzY3YK
