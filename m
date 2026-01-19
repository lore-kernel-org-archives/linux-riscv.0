Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2BCD29C39
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9qaqTz3Ye4XXlZr9Hf61ZY11I5S4NLMZkG8Zrpy1X2I=; b=ZS0j3BsaOm4Sav
	+gC4Yf756VcjeJekFQDYBeVdJEBS/qNjHDumFdZU3TqOhAns9oTQWwQg0zHTECxAxZJpHAxfXOwMP
	GDyz6jHlrwLuJgsD20DsAsRpk6SZOl8CJQ9Gi+wsuFDNMipUawwPLS/tXabh1KI/+gqoa8322e95E
	Ip7CBC0QJj8GoIsXLHVJDudUUvy/znsG2amEJvL1LqvL7Vl96HwvDCcPsNLOMMy4TyUV40fl7TOqH
	fRhi7250AyMNQu+NKXR9GVCJi4F7M4J0f2VPTe/xrnsIO0V+qG8qoDdX4f1qSOGUCzJOqFSAVnDZe
	8l1uuI3z3xYEd0qikgyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrSQ-00000002NtE-1Hhu;
	Mon, 19 Jan 2026 15:46:22 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhrSK-00000002Nr3-3JbX
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 15:46:20 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1233ad1b4cdso284600c88.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 07:46:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768837576; cv=none;
        d=google.com; s=arc-20240605;
        b=ECfd1fTrHasD3iun8hZXMYRACvbZDV4GI4mo+mxPdbHpG8+nUpQywObYPJA0lSVtpQ
         7M0v6gqGqE0jwuY7mwvrepzDQ8GrqmEriZgVNIBUd/CyIj20QHE6Lp3mhEQTXDpVMcFO
         mt25P6ZbUvd1bvv08VgIEzqXzYiaVlvBaj207VVRsFB0gmdVfg1vw+MTTaTHnfOaY59q
         4SUoYALN55VqpP6RXIZQzgwHCHIX8JFUi3IkwVyqM0Kl5gRxrBsF4mZx03Z5zgNpcOwI
         VcyLBcqdxrbP3LiM9cfjrcLh2nsNlcoqpmlKQq8g/blfT69HiSrhtDwEre5E6Jp2xtMA
         nSng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        fh=FgSU46L2PZyp8WRsdwMANZVXqKrsReHkfHkxhwKt7lA=;
        b=MCs293R32ujPMy9jPRIZpA9ztT/Pf69ipu2mcS8l8dVGEAR2Xwx0QvFav9x3qCTIxC
         3hga75anVy7l75zqSfZjEOUFbDcp4l2XAyxuYqDsnJlybop1lIEUJCPdZeDG/uI/tnQD
         zj4Sgz7fT12HyL8PvOyO8d5OWaONtS0cTr+DPy+8H1QHyQbt8SV5J7CJDVjpRqK0o/Md
         oXbAXuhqGTJ0ws6K9wWC5jWa/sissrCpJY24q02o28xUvOTQIJf7neSibQGUqrpRE6mD
         WVA/9WJNCppU1Ph4fjI96AHUnvZDA8SAz6a8sxTDOmMCg+3uEg3/WPTf0CTnM2pe3jFT
         8CCw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768837576; x=1769442376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        b=Vrd3exEYQmk7qYaIvpjmMCgNkCa8ZRLDjmh3Gss9QrEJGoQzzkXaysGKjLN8YFf4A5
         BiQwdCcpPzLJT+j8lwZixuOQ9gr1iFuvZRSwoKIcL0gNhEWDDAijefyA3P8yFnBvNyAy
         p+8JHrj2NEYH2ngj1fuc5ZEsjDa2MU74MPlS6mE8TuSflNFwcI93yCQLTWXUL/XaL3+8
         IllQS62z4VLAQrayq5KxMHyrVp+/SKVF2Xkv5QvorEJ3vK3RyJgwJIyqSH04Qs6l218k
         vR1tkv8qeQQkMYjbQi2Ws9ss0+c5C+izexwGkXdUYl7+wganmtX6Kpp5cBmcQqqPaloY
         ushA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768837576; x=1769442376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=46u/WokqzTLpaWP1GT0SroKxBKxCn8SDXm21fmrsTi0=;
        b=MKLr7wOTt51ycCbS0hgK90LFfGNy7EG080TahgO0kbUNaokXm0IQTObiHby5oFCzin
         K6Ns/d5uUXsSK2Jn7ZY543lhgCKuta4KjRr2JCjGtdolV7gswcngZFUtVl0WWn/uuGMU
         lomGzV307oX1KTt+gGxU//3COGU0oO4wveCNHqygl6kNAQ68/ITlMg1mbNsJeCxbC8+x
         1Iqj5r6kPp+e2yWAOTo3aVgcdRSZiXdvpCHj/Alw0pFJHKmArzrpIWvVroturBKlLW3L
         cMRo44XC60Y2ynlyp9aLHSkoRGIW4hHFB0yb1ZC5hzJ+rp+sA3f1Z0uD2miDi4TYu9rC
         ae/w==
X-Forwarded-Encrypted: i=1; AJvYcCVpqVb6mhWXCx86u41FgDQ9ZKAOb4cgkqHTqzJTbkA+r9d8ohQceS28PlcgWhjf56T/AiF2p9o2JFjKAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwIq0JNSOcsMTcFS/NtZcdZ52R0KxRkh5+dSaJtWHZRy8aD9Xkr
	0qINyIib0LdlWI7AYTmbqPUAiN/wLImuaol8v/DgXao+e+mKGGyOfS0I/A0ooU0DlWOTt9aQCLI
	LjhaYUhTXJsSKiWbj4Py3aLihPIMuAVc=
X-Gm-Gg: AZuq6aLqtBUTBpEGEA7HOp06CWBGsC+8YrOzwd52Ydnxebuw2Jwm3MTegG6GaMSuGRz
	Vmb5YFf4mYNTwKOkdHr2J/KOGzGauBUQuiXVtYFGOQn0vMNPTavabvYvGHXJ6wYdoGTAsn24HKD
	7QS7oFcYH7EjVSYx1BipcCES/zO78uDOKwRKMYeY4yliYfNXdxnhvOx5vjMnT4bVqSCXHWW+LQ9
	4RnNmNu0KapDqlt+yTPrvhSYoZGIePVe2s0BiX6nQn8unLv6EaUQw6L9zc7B9Fwhpq5T+quwldm
	m2Hl8rihWKmsZSoltkIzaNbHV3NYkTt5Qu18XauDSpPsN1SN31Bfe9fRaYdNAWzyWRLBHuZkmD2
	j6ODQhgoYVdV9HSWilBi5JlU=
X-Received: by 2002:a05:7301:3f13:b0:2ab:ca55:8940 with SMTP id
 5a478bee46e88-2b6b40fc353mr4845380eec.7.1768837574267; Mon, 19 Jan 2026
 07:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <DFSMRQFIYQPO.1A38Y84XZ1GZO@garyguo.net>
 <CANiq72kcRQShDgMJKZ+ekUEdP1T6Jr=4PDiMJCqnQjgCQEK_eA@mail.gmail.com> <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
In-Reply-To: <DFSODY3NWRBQ.2VGQWXERVW1R1@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 16:46:01 +0100
X-Gm-Features: AZwV_QjEkXpU0cn_dPvCmG7mx9ccCkl54ToiMM9A8sew4Jw7jWCplASiAflPTPs
Message-ID: <CANiq72kCi8=mK8V282O-tsbWvLC6M2vdc50mnLW3M3pWTACyOA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Gary Guo <gary@garyguo.net>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_074616_861481_FD586E46 
X-CRM114-Status: UNSURE (   6.96  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgNDozNuKAr1BNIEdhcnkgR3VvIDxnYXJ5QGdhcnlndW8u
bmV0PiB3cm90ZToKPgo+IFdoaWNoIGNyYXRlIGFyZSB5b3UgdGFsa2luZyBhYm91dD8gSSBjYW4n
dCBmaW5kIGEgbGlua2VkIGNyYXRlIGluIHRoZSBpc3N1ZS4KClRoZSBjb21taXQgbWVzc2FnZSAo
aS5lLiBub3QgdGhlIGlzc3VlKSBoYXMgYW4gKHVudXNlZCkgbGluayB3aXRoIHRoZQpgc2VhbGVk
YCBjcmF0ZToKCkxpbms6IGh0dHBzOi8vY3JhdGVzLmlvL2NyYXRlcy9zZWFsZWQgWzFdCgpDaGVl
cnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
