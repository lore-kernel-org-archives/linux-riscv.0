Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18DCCDE020
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 16:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MW5Wo2wcMixvt4JxIsTUX3SW72WTAvEjzlghsVeRVvg=; b=vMLyxvMaBeJMjQ
	e2jjqzxPhDHUaqKQSetyfsuVdqxFLqQos8koDfB/534b2udDWtDkCtOQxr3IZPJ4OdDPRKBpBHu6E
	fyq1qkV2bP4FRgvPCXCM/xKh5CFKo8SCHkkY5LYDvQSmNN7yHijhgn40+b3JgzMeykD/06rtrs8Ye
	aTqMe8QYh64zJs+ajCeLO+XlwW1qnbWjY7R+40ReNNTOnMORbMwmJpiWs/AiCCKHC52cEo9Rj9+Vk
	4By/j/bMj3Y2a5F4U9jgF+FiZhHTvgDRC+2tBn+7jlwsmH0Q0n0KuwoiyuJrFbKMouQmlHH8ALBh0
	0JmqZT3f7LMMhNTXfs8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1strBP-00000008rl3-26zy;
	Thu, 26 Sep 2024 16:17:35 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1str5X-00000008r0I-2k2P
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 16:11:33 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d883286bd2so87892a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 09:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727367090; x=1727971890; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=shJSHXjlK547ydVvMCQRSZN4pxzvR+ilNKJfQM11QHE=;
        b=ilLHdcxRlsHpzSmKcPTlMwyIx8pxYg+rswO8FxrhKemEzwQnx00W+BFyJ8pFsBSnpn
         Zo6PPGPsMfrOAW3XEeT1Mls42174XRx65SHTcj/mlTgfXgkaXLnJSui3auGHJtXZ9qD6
         SOAfrAO9Q6ISh4MG0/bGMmVuITx51E5V1qewwS/IsapSEerWfKf+m7t0e8iYyMz6Z75i
         Tlgd/4D/vKd/oKq6+MtSvj+Ojr6Tt1rnl1s65NQ6Q0/0Zb7FjeX6rcJ9F8rLUhwSI8Dt
         7ERw/Io7WoaWuJeyvmqBK9a9oFB50j1NZc/gUb53x5FKEqBVf6tpmMN6kI9r7G6SP52b
         UFbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727367090; x=1727971890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=shJSHXjlK547ydVvMCQRSZN4pxzvR+ilNKJfQM11QHE=;
        b=P43x8Y5wJnlHyFnFwP7oxnEVSLhC1Qkb2UC8BvONl3SqICEeuUzmt8sQ7EP8e4I3UZ
         8JVx4MF0frYFiDn3TmiSZwsDa6QQgBPLDde6Rp1PCXIFt+Lk78kmxTp/rId53SJAT37/
         E+oB01owJEIBO4NGzclj+1MMNUxjUX7toJjxop6l1pojzfT8oVnkOS5ouGD8BiHpOYf9
         gr3r2ycBfkGbWxB4PUHW7BEyljUryNXY5wGejJIXXrOWr/SyaGqgPiHim6rNYEQ9sG0O
         f34KRPYZjq/VvIu2TU1P5pxAp+NP8eRlFJdmld9GYF7UY4uMbw3+41JqyR+8584YsZwu
         OXbA==
X-Forwarded-Encrypted: i=1; AJvYcCUwcPcTN4wD7JbgStdUiOTUWkPYO/KNekGIG7yrwvhsRidhChKuFNH5G2bvnWTUJU9brmXt2fRXfn/ZoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YysVGNx5z6seS4GQF0OqTmEOLehxNUIhNWnSuwd1erWUnBL4n4h
	tuD8QgnDa7FXR1eVub9PGP5Q6Wi7O/Hv45/8AMxoA/5DtsjE4t+7JGoqBMCIt1AxgUfuE6pzQdJ
	EwIpTJqFp/xZWF1K675HnuJC8iuQ=
X-Google-Smtp-Source: AGHT+IHOPDH1wb+stuy0EfXx5p0HnQnqPFmeGMm37xP4Tf5VJjlZHx1w8z7puUade36nUeULNJZImKA1mSHvAcplnsI=
X-Received: by 2002:a17:90a:a78a:b0:2e0:876c:8cbe with SMTP id
 98e67ed59e1d1-2e0b8ee52a2mr104368a91.7.1727367090120; Thu, 26 Sep 2024
 09:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org> <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
 <20240926-plated-guts-e84b822c40cc@spud>
In-Reply-To: <20240926-plated-guts-e84b822c40cc@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 18:11:17 +0200
Message-ID: <CANiq72=ShT8O0GcN8G-YRE1CB8Z9Ztr-ZNcQ6cphHYvDGanTKg@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: Fix building rust when using GCC toolchain
To: Conor Dooley <conor@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Jason Montleon <jmontleo@redhat.com>, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	nathan@kernel.org, ndesaulniers@google.com, morbo@google.com, 
	justinstitt@google.com, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240926_091131_725614_A904C3F1 
X-CRM114-Status: GOOD (  21.38  )
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

T24gVGh1LCBTZXAgMjYsIDIwMjQgYXQgNTo1NuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBNaXhlZCBidWlsZHMgYXJlIGFsbG93ZWQgb24gdGhlIGMgc2lk
ZSwgc2luY2Ugd2UgY2FuIGZpZ3VyZSBvdXQgd2hhdCB0aGUKCkkgYW0gbm90IHN1cmUgd2hhdCB5
b3UgbWVhbiBieSBhbGxvd2VkIG9uIHRoZSBDIHNpZGUuIEZvciBvdXQtb2YtdHJlZQptb2R1bGVz
IHlvdSBtZWFuPwoKPiB2ZXJzaW9ucyBvZiBlYWNoIHRvb2wgYXJlLiBJZiB0aGVyZSdzIGEgd2F5
IHRvIGRldGVjdCB0aGUgdmVyc2lvbiBvZgo+IGxpYmNsYW5nIGluIHVzZSBieSB0aGUgcnVzdCBz
aWRlLCB0aGVuIEkgd291bGQgYmUgb2theSB3aXRoIG1peGVkIGdjYyArCj4gcnVzdGMgYnVpbGRz
LgoKSWYgeW91IG1lYW4gdGhlIGxpYmNsYW5nIHVzZWQgYnkgYmluZGdlbiwgeWVzLCB3ZSBoYXZl
IHN1Y2ggYSBjaGVjawood2FybmluZykgaW4gc2NyaXB0cy9ydXN0X2lzX2F2YWlsYWJsZS5zaC4g
V2UgY2FuIGFsc28gaGF2ZSBpdCBhcyBhCktjb25maWcgc3ltYm9sIGlmIG5lZWRlZC4KClJlZ2Fy
ZGluZyBydXN0YydzIExMVk0gdmVyc2lvbiwgSSB3YW50ZWQgdG8gaGF2ZSBhIHNpbWlsYXIgY2hl
Y2sgaW4Kc2NyaXB0cy9ydXN0X2lzX2F2YWlsYWJsZS5zaCAoYWxzbyBhIHdhcm5pbmcpLCBidXQg
aXQgd291bGQgaGF2ZSBiZWVuCnF1aXRlIG5vaXN5LCBhbmQgaWYgTFRPIGlzIG5vdCBlbmFibGVk
IGl0IHNob3VsZCBnZW5lcmFsbHkgYmUgT0suIFNvCndlIGFyZSBhZGRpbmcgaW5zdGVhZCBhIEtj
b25maWcgc3ltYm9sIGZvciB0aGF0LCB3aGljaCB3aWxsIGJlIHVzZWQKZm9yIGEgY291cGxlIHRo
aW5ncy4gR2FyeSBoYXMgYSBXSVAgcGF0Y2ggZm9yIHRoaXMgb25lLgoKPiBZZXMsIEkgd291bGQg
cmF0aGVyIHRoaXMgd2FzIG5vdCBhcHBsaWVkIGF0IGFsbC4gTXkgcGxhbiB3YXMgdG8gc2VuZCBh
Cj4gcGF0Y2ggbWFraW5nIEhBVkVfUlVTVCBkZXBlbmQgb24gQ0NfSVNfQ0xBTkcsIGJ1dCBqdXN0
IGFpbid0IGdvdCBhcm91bmQKPiB0byBpdCB5ZXQsIHBhcnRseSBjb3MgSSB3YXMga2luZGEgaG9w
aW5nIHRvIG1lbnRpb24gdGhpcyB0byB5b3UgZ3V5cyBhdAo+IExQQyBsYXN0IHdlZWssIGJ1dCBJ
IG5ldmVyIGdvdCB0aGUgY2hhbmNlIHRvIHRhbGsgdG8gYW55IHJ1c3QgcGVvcGxlIChvcgo+IGdv
IHRvIGFueSBydXN0IHRhbGtzIGVpdGhlciEpLgoKVG8gYmUgY2xlYXIsIHRoYXQgYGRlcGVuZHMg
b25gIHdvdWxkIG5lZWQgdG8gYmUgb25seSBmb3IgUklTQy1WLCBpLmUuCm90aGVyIGFyY2hpdGVj
dHVyZXMgYXJlICJPSyIgd2l0aCB0aG9zZS4gSXQgaXMgcmVhbGx5LCByZWFsbHkKZXhwZXJpbWVu
dGFsLCBhcyB3ZSBoYXZlIGFsd2F5cyB3YXJuZWQsIGJ1dCBzb21lIHBlb3BsZSBpcyB1c2luZyBp
dApzdWNjZXNzZnVsbHksIGFwcGFyZW50bHkuCgo+IFN1cmUsIEkgY2FuIGFkZCBhIGNvbW1lbnQg
dGhlcmUuCgpUaGFua3MhCgo+IEluIHNvcnRhIHJlbGF0ZWQgbmV3cywgaXMgdGhlcmUgYSBwbGFu
IGZvciBjb25maWcgIm9wdGlvbnMiIHRoYXQgd2lsbAo+IGFsbG93IHVzIHRvIGRldGVjdCBnY2Mt
cnMgb3IgdGhlIGdjYyBydXN0IGJhY2tlbmQ/CgpnY2NycyBpcyB3YXkgdG9vIGVhcmx5IHRvIGV2
ZW4gdGhpbmsgYWJvdXQgdGhhdC4gcnVzdGNfY29kZWdlbl9nY2MsCnllYWgsIGlmIG5lZWRlZCwg
d2UgY2FuIGFkZCBhIHN5bWJvbCBmb3IgdGhhdCB3aGVuIHdlIHN0YXJ0IHN1cHBvcnRpbmcKdGhl
IGJhY2tlbmQuCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
