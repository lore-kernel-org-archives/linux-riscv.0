Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F04D1C43602
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Jul 2026 12:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=I4zuDUGi2YrFswTuebZdejgbhXNBAxt0l0m7B8pvSpc=; b=R0u5LBcNaQmwCyaS0esfbo5Ne7
	zXeFYPT3gWl3mJpcK13acBaI9igyFGHEBBZUCNTMKMgrx6s3DlcOSvji11pIX8GryCGnz2BIrvxCP
	L8jQzKEVeroDDGGgPz67F/m84UKSofyNIALWWuyYfil/BH77PX6VmWYAHFrU5bgrXEbw5ImlPu6ZI
	YHrypnDiwCdUy5/1lDByEqjvzZv3k5D2jC5oX5rF51J21HAjp0sf6W89cp/G8Gk667myKBw6n9VBq
	04pl7GJSgG89tSkkE15bQ2+yUhsHSGU6cA/8aAhwu+ktdLvWZ3FCsie2eUff3GMP35jq8UBf5Cd+R
	QLz52pGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLrr-00000009IOv-0iLq;
	Sun, 05 Jul 2026 12:22:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgLrp-00000009IOc-0kAB
	for linux-riscv@lists.infradead.org;
	Sun, 05 Jul 2026 12:22:38 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-380a02c71e2so761418a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 05 Jul 2026 05:22:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783254156; cv=none;
        d=google.com; s=arc-20260327;
        b=prM/geGY39liQ3nRkRWuqpHf/oK1pVoYDEP7Fz3v8jvay5YjnjcVm2BjS+s5P0Los7
         9JUubXkXcpN11kViXCZiSV5EJIZWdmunQrV4/cmQ8r4TrCmImtzluJQTL5Gp6V1H4bKi
         Zn+Prfre/oJZCpVA3S0kS+05h0Dox4J8BuSiuOsGxY5g2bS8swDiX28nNKYg++QYk0Ym
         F0HyE7Q1LwUJIz0AAyjN4sbHfLYvqOC3p6bYtQkMZyW8wd4bddW3OwalGc6vj6mxZnwT
         VAiJIjaeE3XFnmlEWrIW+NDuc+HTU3va7eig2RuZPEniHiZXzCYCT66h+7KDlYhU1Wja
         SFcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        fh=qQI3BVcTq8Cd6cMUuD69ZCuRpNCo5yWxSVbCfxfydbo=;
        b=A2gi2cgLlDYAfLpGLVtD/kq9z9zECGsgOfOcTtQlcuiMYfiAwfRmwZXCGAc7TGz4yC
         zG1yu15yfs2VXv57L93tVUd0+PJb3DAejwI8Beeby7SZ9PH6wTE5umI9YmJV1qqEDIJU
         f2plWR6TWF+dGV1BsrIZQG6d+z4TNPXc+eXuq+COtA0afpGYkcd2TzuXqyS3+WyuQxr7
         n73mLDuq9ODswqjq+5b4euQnlMupORSFeMt7IXPLz/YtXATXECu41t0JSc7aZCf+wBLG
         +kSZi8LVeBERMMXPjG6y5Q6amGwL6cUUh0/AxzF4q/eWAVpp2JcsjitI9t1sOEItz+B6
         HUPQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783254156; x=1783858956; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=FuyVDsdcUoW0NE8B8Js1iJB9Tjy01QBuAPeciLNIzm4ehjPkjppYt28JrBy8u9y+D2
         dXYqvQS1VcLciCdgJsqY0+PqRuPr2Cqmw1dS2fe8Cgt5+dIgyB0hLrk26JyKdUtVsvC+
         LfiYSTJrkyFI/uxyheW2gl59WqFF38EIwqVYnmFwRQJMnLYkss6iCZ7dRIkezWVURJta
         9qlxamMZfgeVpDPImWgo4lBBMj+Op49vXr3MLXc6nmpERTZWHjaLxul82iPRG6WRBOZM
         SysUdw/IvO0FaUx/IGfddAh0FGWDCSPMD70xI0PZ2VSZpCE+IZVEDLPHPikHpwYqu8Q5
         97Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783254156; x=1783858956;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cVZuwq26LJUbjnXW20W3nbICqbmkh5x02bCyytPFsmg=;
        b=Hf9LrzPG2O8SLU2lh73Ykcym5ps7kaNZ4CBLPSUHnHcRpO9E6AsCTCz6qJBw29jKXM
         G2VoYrzwy3CTTvUAHKNWJ513bL/IS/WNT8ABzKIaR4zWDTjlzzcTBuSjBFMfeaRYV1yb
         Tawf3vcdPRF1WzyKnU2c2rhJx6jvF+zhgx2ijQBr/JDj9CGjQtbO3gIZdcSQEYwCyc9m
         GB5grJfQLigCYlQfONDhAM5/Jv0EF6yjPUwRAqW4ZblzkhVT1g043GjekO2wKVmcx1t+
         szs7/tJxAOvuH4Pu5grJZKvxzfvleynG2MMAhNMPvrWMOmWacC7BvGDXmEwgxjOHQAPs
         Fj9Q==
X-Forwarded-Encrypted: i=1; AHgh+RqB08q0rlxUgb6ca0dJNPDJ0ICXUnUv1zpjxu3jsIsePCcfR6waZeuUDWWJKO+5a4M7pZQLZKnU0tISHg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNbrSaJBR/N1cvaAjFNSiuWKRvWBQYQAh5jR1Zrg78TKMVoGl1
	REJGWHpvo4zj4wicM3GihfApgLJVXiBfsg5t0zULOe8MgksMmd0KZRMF7Y3x3UI4y4DfykoXJ9N
	O9th9KSzG0WjYIGO36FMOrxt0SaN45qs=
X-Gm-Gg: AfdE7cmr2O8rRWwUggmaYd3FOAs8kckX8LiY6FZMQAmn/2ZrCXlw3QKAWoI2lsbWZXd
	JvNSnKJcKhOcG4Bo4jtKuDqfKKRjwROWvTHIiCdvyy+Mm/h5qPSEIlSxyYxyKbeez//m2Y+V4tq
	FWfjHF0Pd/tNRTKJBcgud+fs+Feb0sn3GPhcmWuk99T9lV9I1mOGVuSkrMglZyffxma6omKokyJ
	gEn7pbh1dKErb+SAzZdz1Q8HQcbXnmOE3IfuN8vbgtMqZvYesXfb3QX2p4cK0GGrlaDSogPT5dd
	A5BRrt8IpZpKIaq1iGH2Qw5+h07uoQd6hYlcETwLYAEHoN5qOyY3WS6IrrfmxoGr1zOsjnZWjPC
	8D0bBu1WipWJO
X-Received: by 2002:a17:90a:a416:b0:383:5a16:bd67 with SMTP id
 98e67ed59e1d1-3835a16bddcmr2702118a91.4.1783254156186; Sun, 05 Jul 2026
 05:22:36 -0700 (PDT)
MIME-Version: 1.0
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <c89a1bc8-6cc1-4e16-ac95-add389e45a2b@lunn.ch> <akmnh0AKFfu9-OYn@gurudas.dev>
In-Reply-To: <akmnh0AKFfu9-OYn@gurudas.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 5 Jul 2026 14:22:20 +0200
X-Gm-Features: AVVi8CdKZk1uQg3RyoO9gWWnGdg1D5rtqZ5BcTTqS2w4TtsLqn1TqMImL9QufHY
Message-ID: <CANiq72k0zokLC_L2wPJRDb_CyvnJznOSKUgTaiHo87GT6Pwyag@mail.gmail.com>
Subject: Re: [PATCH 0/7] rust: Use kernel style vertical imports in various drivers
To: Andrew Lunn <andrew@lunn.ch>, Miguel Ojeda <ojeda@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Jens Axboe <axboe@kernel.dk>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-block@vger.kernel.org, netdev@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_052237_220726_F6A51EDA 
X-CRM114-Status: UNSURE (   8.60  )
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

T24gU3VuLCBKdWwgNSwgMjAyNiBhdCAyOjM44oCvQU0gR3VydSBEYXMgU3JpbmFnZXNoIDxsaW51
eEBndXJ1ZGFzLmRldj4gd3JvdGU6Cj4KPiBNaWd1ZWwsIGNvdWxkIHlvdSBwbGVhc2UgaW5kaWNh
dGUgaWYgeW91IGhhdmUgYSBwcmVmZXJlbmNlIGhlcmU/CgpHYXJ5IGlzIHJpZ2h0IC0tIGl0IGRl
cGVuZHMuCgpHZW5lcmFsbHkgc3BlYWtpbmcsIGl0IGlzIGJlc3QgdG8gZG8gY2hhbmdlcyB0aHJv
dWdoIGVhY2ggdHJlZTsKZXNwZWNpYWxseSBzbyBpZiBpdCBpcyB0aGUga2luZCBvZiB0aGluZyB0
aGF0IG1heSBiZSBwcm9uZSB0bwpjb25mbGljdHMuCgpJbiBjZXJ0YWluIGNhc2VzLCB5ZXMsIEkg
bWF5IHRha2UgdHJlZXdpZGUgY2hhbmdlcywgd2l0aCBBY2tlZC1ieSdzCmZyb20gbWFpbnRhaW5l
cnMgKGFuZCB2ZXJ5IGV4Y2VwdGlvbmFsbHkgSSBoYXZlIGRvbmUgaXQgd2l0aG91dCB0aGF0Cmlm
IGUuZy4gaXQgaXMgdHJpdmlhbCBlbm91Z2ggYW5kIGVub3VnaCB0aW1lIGhhcyBwYXNzZWQgLS0g
dHJ1c3RpbmcKdGhhdCBwZW9wbGUgdHJ1c3QgbWUgdG8gZG8gc28pLgoKSXQgaXMgcGFydCBvZiB3
aHkgdGhlIFJ1c3QgdHJlZSBleGlzdHMsIGkuZS4gYXMgYSBmYWxsYmFjayBhbmQgYWxzbwpmb3Ig
Y29udmVuaWVuY2UgaW4gY2VydGFpbiBjYXNlcy4KCkkgaG9wZSB0aGF0IGNsYXJpZmllcy4KCkNo
ZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
