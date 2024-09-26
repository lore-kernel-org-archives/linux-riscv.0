Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088CDCDE015
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 15:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CzgYmGAsW8J3+l6yEXv75FVQnjhsx+GRKK3RFZqUGTA=; b=2riEDKYoAwXqt1
	vNbsI50rzykLV+uv3Jm5AzJetlcric9hy0dv9Kv47LhVTFki9skhfs1azE7A+8J+SrJSLZeDbnsXn
	8x+3dIrKaxMt1tm/0dbaqnobHyEA9HlPcroprLZqdzvduTag0Pc5hHaA3Dpre174I9C1ZnP/ZDPq4
	rk6i83s/OkhiyVWcWxOUtVnTvhEsHw44Y7ffRniWZT+jmjsVBUqPXTUW3zQ19iGlhWxPAF4woqHu3
	/6JhmbO/QLaZtjEB4D6En7ryTVrG+QXjxDky+Y6uWILhv6Z/RH2h8UvON/Ij35ejWgBYdCYv4Gtdy
	gSyYzZ7iFaK4z++Xct9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stqd6-00000008lgQ-0fLz;
	Thu, 26 Sep 2024 15:42:08 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stqbZ-00000008lJu-0zYJ
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 15:40:35 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7d74dfb97a8so43920a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 08:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727365232; x=1727970032; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eBWvVfsKE4lYCkR9jWhTHTt0x1qkASzl46mhvR//R7U=;
        b=Q+OaZT+wzQ97deRGsGuHnRb7CWNKNbl9gx27DQGx+UNym5X0ZSGphoVTCVsFOCIWUm
         YUzTO7D60GaFLdcuBE+ye7jS2+ceAj3slUrttSIo4ybXEO8lx1QwiYwkep74kY/fGNjF
         OK4MnfjeRGmyz28mPtvUJ1HkLkMzf39YeKAM/IG7NGFfI56r9AG4iSBvIJCqSniFz249
         IpVW1uy6refb4WEJO0cnX393xMPtUSL+3Tyuu46FuuuII1QIJ/WouipmzLXT0dBca1HB
         GkUU2/Vw1pA4VBzb8Ix0Kt3xhzPzGgjjgm23xfax79FpH1iDrKuU8q7yb2tWbXhII3zb
         vsfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365232; x=1727970032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBWvVfsKE4lYCkR9jWhTHTt0x1qkASzl46mhvR//R7U=;
        b=C9sjuntX5x5XZ2VfONFNeZD9+v2kVZuSJq7ShQx/nCrWkNrjHiBISCrb6MV3j4DIFD
         WrgPMBVKFLmIuDcn4q81HaD1OqaVQ/HIv+qGoVs1FQjHXf8bsAbWoUMVKIgXCmmj29+8
         qX3Ru91ylmaXyn5Ab7BOMqXZ2Mgm/ouJCua3F1sYUaoTbhBULseibOwg3uqPw7x9MCtk
         cgm2Bc2dqHSBGQk9a7YACnlSIeBu72K0Nm+dJyNUXEk5El4HgE4rvPvfWHBtSDscdU5L
         dSw38x/KAbPoGi+ECRuCCahf1tFecoesocV6aUwbM58F8oshzr5X5vXSM21bj3QPqc+X
         gptA==
X-Forwarded-Encrypted: i=1; AJvYcCUZ1Mppyq3it6u2jXHIBg/QUtO0F0fXTo/xxFbcrXKj0G/PtIHg+YwsHEgid1f/pfyfoyomiK5uYZ1vPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwS3syhzYbjN/9ZZgDbXAryBqb3uL4ph1vNg5gTAksPn2kUH/wM
	jhuczyYX/jik7cZ0RVdN1CJ3gEgxbjArXfqppa9GiG58YJMUaH5ST2QBY+eKt/kp2Z5B2B6jAKW
	JEwsKpHv8YH/1eOSrDhmsir4irbc=
X-Google-Smtp-Source: AGHT+IG0/1g5eMwIe2YWirZf4Ac8fdSnvrNHQArrRR/tnb9tehSWeiCfeqtWgbf9mBS9CWxs1mPUyKjyQDvqh0yUQKk=
X-Received: by 2002:a05:6a00:891:b0:70b:705f:dda7 with SMTP id
 d2e1a72fcca58-71b26059671mr157176b3a.4.1727365232203; Thu, 26 Sep 2024
 08:40:32 -0700 (PDT)
MIME-Version: 1.0
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
In-Reply-To: <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 17:40:19 +0200
Message-ID: <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240926_084033_307734_E1D4C06E 
X-CRM114-Status: GOOD (  10.99  )
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

T24gVHVlLCBTZXAgMTcsIDIwMjQgYXQgNToyNuKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBZZXMsIGJ1dCB1bmZvcnR1bmF0ZWx5IEkgYWxyZWFkeSBrbmV3
IGhvdyBpdCB3b3JrZWQuIEl0J3Mgbm90IGZsYWdzIEkgYW0gd29ycmllZCBhYm91dCwgaXQgaXMg
ZXh0ZW5zaW9ucy4KPiBFdmVuIHVzaW5nIGEgbGliY2xhbmcgdGhhdCBkb2Vzbid0IG1hdGNoIGNs
YW5nIGNvdWxkIGJlIGEgcHJvYmxlbSwgYnV0IHdlIGNhbiBhdCBsZWFzdCBkZWNsYXJlIHRoYXQg
dW5zdXBwb3J0ZWQuCj4gTm90IGRpZ2dpbmcgaXQgb3V0IG9uIGFuIGFpcnBvcnQgYnVzLCBidXQg
d2UgZGlzY3Vzc2VkIHRoZSBsYWNrIG9mIEdDQyBzdXBwb3J0IG9uIHRoZSBvcmlnaW5hbCBwYXRj
aCBhZGRpbmcgcmlzY3YsIGFuZCBkZWNpZGVkIGFnYWluc3QgaXQuCgpEbyB5b3UgbWVhbiB5b3Ug
d291bGQgcHJlZmVyIHRvIGF2b2lkIHN1cHBvcnRpbmcgdGhlIG1peGVkIEdDQy1DbGFuZwpidWls
ZHM/IElmIHNvLCBkbyB5b3UgbWVhbiB5b3Ugd291bGQgcHJlZmVyIHRvIG5vdCBwaWNrIHRoZSBw
YXRjaCwKaS5lLiBhdm9pZCBzdXBwb3J0aW5nIHRoaXMgYXQgYWxsPyAoSWYgc28sIHRoZW4gcGVy
aGFwcyBpdCB3b3VsZCBiZSBhCmdvb2QgaWRlYSB0byBhZGQgYSBjb21tZW50IHRoZXJlIGFuZCBw
ZXJoYXBzIGEgbm90ZSB0bwpodHRwczovL2RvY3Mua2VybmVsLm9yZy9ydXN0L2FyY2gtc3VwcG9y
dC5odG1sKS4KCk90aGVyd2lzZSwgcGxlYXNlIGxldCBtZSBrbm93IGlmIEkgYW0gbWlzdW5kZXJz
dGFuZGluZyAtLSB0aGFua3MhCgpDaGVlcnMsCk1pZ3VlbAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
