Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691F1CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 10:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mjqBKyh7i0NMTTqR3oRsM5dbcnt25wrJneqVwgPwfhc=; b=ZOwofi2Sxq3o6n
	u2U3HOFkWy265JeqyAoQArW6btjSVwvD8aUm13pLOAaIwbUoxJEPnELfAH3OlRZMp0cLI1qUwfZTl
	5v16y/eYgJp9MRtJvXU+0ndPNgxdTTdw94PJ5dfvlHh6pOEmJBjDd9sxbzKq9F5p6aHq5K0z8WSV1
	0mGOVtRue2iNsyRX//Tiug6aetpTmOWKn/uUFp1XDC2y6frAphj9xtopXp6V7rhaK86NuSqMaC3Wg
	hwYeFlbQV9vA9pe6KlE63pcPMO/DhStBud+AVzss4jrBUjp8xwSI1nnOAA2bdPqeNIsS1BdWxWz2t
	y3NKg1GIEXYrThr0x1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAAg-000000017CT-36O4;
	Thu, 18 Jun 2026 10:40:30 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waAAe-000000017C6-22AQ
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 10:40:29 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-30bc5fa5a2aso97753eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Jun 2026 03:40:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781779227; cv=none;
        d=google.com; s=arc-20240605;
        b=UTvgJ3Ua0+mMTUHoSGIUhslTpXNDDDEyLUz6Rsm+YzAZsPoPKr9oxpNqsJAp7suSAP
         R1Ohkq5VqI1NjkTckUOq+JwvQY91dvMhpItA6agtIBGx9AlCcBQSJYYs47PRXBA9GGf6
         JBeqMzOLPRprg3mt9nuuvyQ2+cFlWqcu0C1C3rAJdNiVJEnPp+8QAdoNIAeGzS+7CXQ/
         vq3X8340zJYm6wtYy/Zy3sw7zZUbTgrDRxk/u5eiUBRRype4MCGzrbBYVnpd7ZJTUcoh
         fJhYieVKvs8YzctlwOjoNX7ZRRMojF3btoukCFIXvzafYM5OjgkVK+oPQ6ExLoknEAzN
         I4pw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        fh=2vj0WG3T0RfK1ay8vzya09IFUEbTyJ777BN9csiZ5l4=;
        b=E9K75YzJH8XySe6xHtxpFpkuLpWR130a+S6eKn8DGZEzQPhRlsopUKuEzvFgImrjDk
         6WKdnnov3sHO5vMjCxf5SBWjXHJwHxtIOvGqD9Om2RIaVk3ePLZUIhYO2oYJW3CQIWru
         b3w6JTDwz6VJnQlsYtbT5g9K9HlUoxetvVaM1IFZrBVMwQXZAq8giKkMM89qFZL/yhe7
         IEfyBwUmamUFSh58r4aezCPnDtc5pEUSwnkIBlWm08dBfkAliBkxIMMFHteZ8LtiA+a6
         fWcGMURcKMHX6E8cwFGq9nzB+XOHGDNWBOBiKDZqJ6h/+/K0MxcjdClMSKouxTtNtDoX
         g48A==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781779227; x=1782384027; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        b=T5VlsjvMFByAS5+lJfy35rVDWsyKBCohyjPU0NhA22sW4gSTFIrOMs+uPj4kD/4RU3
         EiIeyqrKppCz3Xq2O36YgXFWDSMBouZ7Iw3MPPbt+qrfCGw/yFFeX7z4ZPpPfY105txG
         aWuzNxY7FJag4vtLF7E1VHHIo0hoXbIkKS0W9/bX+WwkeuTjukrUMT9QXB07Acq3Ddk/
         CxNXowPiOmW+lsa495hdD/s4WYIcH7abePxWBhucaPs522Jpj/DHxgZ1/ZiAVjujwWse
         6Bf41vOKfGqKJYLnPtxY8XM1fKH5TGxUd+G84hWRVU+H+s9WBRcxX79LP3deBRyvqPDN
         aooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781779227; x=1782384027;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7DUQbCb92xOvO01pv+r7iCHPQp0UAu27WllptLJOlB8=;
        b=leCJNWJQXcKu9VxS1T9Pjx4LgYy1EmB9cHYUdZSfNH9+s53Lj7oQJY+pcF7DY8l5Mk
         dEt1WPYarjow1lk+V0wWcKYxGWl3U4DHhRiE6JZIUXkB80f9ovmE3IOJb/7nZrmqUprA
         X9pyDhJSfSCI4lk0AIfsLFTi0cxgYofjCy07BsCxvXz/5vtJBzXvUZWmcYB30HKgsAiY
         UaFB01xquvVOwIgR8C6rXan98gYByObT8XEanJd58N18U8XDW9dYuKQnZlOJkaoFGZD1
         65R4RbnEq9c7dK7fPPXtHyG+r8o2HQWQu49ufNxwRJfbOHp+h6XJ3IOAL9urvY4UWN+q
         X6FQ==
X-Forwarded-Encrypted: i=1; AFNElJ97CUTtryTfn6HgzEDsxmKwnCcUfrncnf6+Fh9crlfYvBuDyTIpSXUzI4lvQf+bIuSzCpYNHVP7S5vsRQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa3flM0YDzUyihb3krXDrZmrZ2XTCLCFSc3LCvC0t74Bl4msrE
	cUlQeXHFPvf1sSopbFXwCS6SxmUNgcOkePZuxEjUzN4+O5hmjpbpDGqaACHPS6M3mmEulpSVkHK
	ZJ1KcduseMPkh7ZE1WNarY4Zp0qQsaLc=
X-Gm-Gg: AfdE7cm35C1kogZCl1KmKoyPAQfNGyvqrAku9BHtK8hRe/5yjswCZlU5HLGGhIvVW6u
	Py11uxEtdeEWAK00aElLJGLwjExW/ETK6dQcMc/UR8EmPC7KilRTiarX4QsW5GiwFlqjeuFthO6
	lqYCg4zYOayoKP23Alh7o27RE+DbqJOLxSbPqY/LadFUhmlwaq3/VSh5rivQI7P6xlfI2kFVhH6
	5xvl6i3TjyvjlkjsHc1Td+wGmwGhu3at4hV5uQ7mvdR8bL4Ppjm9MpujbkDdfPiOHzjLKDhgMqY
	WqYnisHleJ2D7qBQfxpeV5Lh04oF+28Y2oVcF7/sfac2cRJX/mfKzXYTQBY3sVwqBy7FkoltHQy
	MfwzduwoRKMkC
X-Received: by 2002:a05:7300:ed85:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30bf09c4416mr1020403eec.5.1781779227291; Thu, 18 Jun 2026
 03:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260618-clk-type-state-v4-0-8be082786080@collabora.com> <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
In-Reply-To: <20260618-clk-type-state-v4-3-8be082786080@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 18 Jun 2026 12:40:14 +0200
X-Gm-Features: AVVi8CcKkRQ8t8MfiUD4gXtI1Y4DMiQAI7JLxiiYKqJ_3SsG98lF2VyIrlJ2k1o
Message-ID: <CANiq72myoVT9npyaB0pVvbJ1v9ELzw68uAvSoAkdJJX2MJQ=kA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] rust: clk: use 'kernel vertical style' for imports
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Brian Masney <bmasney@redhat.com>, Boqun Feng <boqun@kernel.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Boris Brezillon <boris.brezillon@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_034028_531976_5BA22652 
X-CRM114-Status: UNSURE (   7.87  )
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

T24gVGh1LCBKdW4gMTgsIDIwMjYgYXQgNTo0OOKAr0FNIERhbmllbCBBbG1laWRhCjxkYW5pZWwu
YWxtZWlkYUBjb2xsYWJvcmEuY29tPiB3cm90ZToKPgo+ICsgICAgICAgICAgICBSZXN1bHQsIC8v
CgpTaW5jZSB5b3UgaW1wb3J0IHRoZSBwcmVsdWRlLCBJIHRoaW5rIHlvdSBjYW4gdGFrZSB0aGUg
Y2hhbmdlIHRvCnJlbW92ZSBlLmcuIHRoaXMgb25lLgoKPiAgICAgICAgICAvLy8gdXNlIGtlcm5l
bDo6ZXJyb3I6OlJlc3VsdDsKCj4gICAgICAvLy8gdXNlIGtlcm5lbDo6ZXJyb3I6OlJlc3VsdDsK
Cj4gICAgICAvLy8gdXNlIGtlcm5lbDo6ZXJyb3I6OlJlc3VsdDsKCj4gICAgICAgICAgLy8vIHVz
ZSBrZXJuZWw6OmVycm9yOjpSZXN1bHQ7CgpTaW1pbGFybHksIHRoZSBwcmVsdWRlIGlzIGltcG9y
dGVkIGluIGRvY3Rlc3RzIGJ5IGRlZmF1bHQuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
