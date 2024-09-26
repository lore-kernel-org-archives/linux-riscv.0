Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C33ECDE022
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 16:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PacrpIa2FNhyd1307+/SSv8TU0wTMM/M1vz3dqPY2zE=; b=F7tLaK4XaEzmbr
	TeX+bFkiMdsdSnHOO9syku4khh06N37rY0uE5slwR2FXp1Fq2EvHg0gqOaW43vh+/j29nc2ODzX1s
	CIYHxe3UsjrxzlVmQaM1sE5yyBhExn2iCUVfTRa9KhZ953n+q0g+8clXxutLN9eDHEwVDhfs0N4kU
	ih1+SY3HkVvBXK+h6zdPEZtKyR1conq/I93KZutA8OjV1TWxNjWapfgbvWlgDQHValW4LmTQ2s9H0
	zYpNG4jDbOWNgFIgY48kD2Hm4QE/aE5NDl7N+3VxZUF16onmTHeqVvleRFnHtZrnVEXV+H8wn9tUG
	lvsSwIeeZEYv/K0AcklA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1strNC-00000008tTj-1RfD;
	Thu, 26 Sep 2024 16:29:46 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1strN9-00000008tSv-14A5
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 16:29:44 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-20b0c5895aaso1405615ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Sep 2024 09:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727368182; x=1727972982; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enYKeiYzEZuiXlgCfHWUHkKt206E3RtoQkmTSzufcAk=;
        b=VRkgJSgVZKpfY0Zjion2FTR4HgzqLWcUFGVH3Fi3WbPViydaJZjjT6SoKTT34vx2GW
         f1aOz3eLXvDXP/trFwmLaFZpP9yM5t06HboF2AVDGtd51ebAV4jE0xdRxZS5i9HWfo5V
         Y1Q/ttWdZTANZGN4m4XgbeRTieqX+ENZC0wVzBR9tjH2A+E4PARGewmr8AcZZv76Dvz9
         yRbsYOH3M5Bmb8fHBSEmRHqV34whmDiieiWh+BXMUbfQ6BFozuIx01+JJZSCXavKAr8m
         r5i3zgh6NOCKN9PcJ5JroCUr1TqlbA9PeaYu6Td1c1/HZpHuw4qMsGr+8qmbr9DaNS2b
         ipJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727368182; x=1727972982;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enYKeiYzEZuiXlgCfHWUHkKt206E3RtoQkmTSzufcAk=;
        b=J4PxZVHoiN3QNeYkV0WflQ2iFL4F0Ko+nsG3tLwtIehAeeJnlUkjhfN/CozPYRMUbM
         XdCIDDh2wsX8M6vd4AGQBqbJlOwENMT3GkOGgquYzkvm6PV66Szu9BkII4eDtYttKmq2
         9jPLy/hthnkie1yNXw6aHxrfm7821ZukUGQeQcehV4IAdixlirLicJ0jJOYYvwSECQMf
         Qz6PY+X6El4NoHKDqCv+z/36qmD+NXGyTuXnQ4QwmnMwKIMAOuw73O6lMkDzVQwyjDiI
         Q2aEzm1I+eelv9o1Qb0wdN5XGDnTxyy5VBj5LjYWbgfd6CQ1thArsloraX7me6u+Q4gD
         cmyw==
X-Forwarded-Encrypted: i=1; AJvYcCVK7TfnGN7ksajus3fib25szY4B/TXEX2EVeVWVKnyFoPVaekTWIkDg8CGUbRJObHQsvrMewGs2tLc1hA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE8jt9I5GmkgqXBvZblFjjMhFGzywVx9vjSpbXws3VcCR4cy0G
	60jZ5qSXV/sd7qmDc6gcyp7KqthvB7NZwUcQADJyAQp2u46nLfCb+GrftsREaOltEFLO7Whl4wl
	oBPGyO+A0YlNXlpQvfeGUEI/qJdw=
X-Google-Smtp-Source: AGHT+IFWnPCIvNcird/b9jtNo2ic1qoJxCG4l3sNzelSgtW5Pt3GkMD1EioV4GRyG3deDzQmsovWpn69wT7w++8wlz0=
X-Received: by 2002:a17:903:191:b0:20b:9aa:efca with SMTP id
 d9443c01a7336-20b36adbadamr1866825ad.9.1727368181789; Thu, 26 Sep 2024
 09:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240917000848.720765-1-jmontleo@redhat.com> <20240917000848.720765-2-jmontleo@redhat.com>
 <334EBB3A-6ABF-4FBF-89D2-DF3A6DCCCEA2@kernel.org> <20240917142950.48d800ac@eugeo>
 <31885EDD-EF6D-4EF1-94CA-276BA7A340B7@kernel.org> <CANiq72=KdF2zrcHJEH+YGv9Mn6szsHrZpEWb_y2QkFzButm3Ag@mail.gmail.com>
 <20240926-plated-guts-e84b822c40cc@spud> <CANiq72=ShT8O0GcN8G-YRE1CB8Z9Ztr-ZNcQ6cphHYvDGanTKg@mail.gmail.com>
 <20240926-battering-revolt-6c6a7827413e@spud>
In-Reply-To: <20240926-battering-revolt-6c6a7827413e@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 26 Sep 2024 18:29:28 +0200
Message-ID: <CANiq72=JNS8eaQXJYCTNw8vNymD-0A-g4FmagyLkaH7L1DqhwA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20240926_092943_462246_F3D84F32 
X-CRM114-Status: GOOD (  10.35  )
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

T24gVGh1LCBTZXAgMjYsIDIwMjQgYXQgNjoyMeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBOby4gVGhpbmdzIGxpa2UgY2xhbmcgKyBsZCAmIGdhcy4KPiBJ
IGRvbid0IGNhcmUgYWJvdXQgb3V0IG9mIHRyZWUgbW9kdWxlcyA7KQoKQWgsIG90aGVyIHRvb2xz
LCBub3QganVzdCB0aGUgQyBjb21waWxlciwgSSBzZWUgLS0gdGhhdCBpcyB3aHkgSQptZW50aW9u
ZWQgb3V0LW9mLXRyZWUgbW9kdWxlcywgYmVjYXVzZSBvdGhlcndpc2UgSSB3YXMgbm90IHN1cmUg
aG93CnlvdSB3b3VsZCBnZXQgbWl4IHRoZSBDIGNvbXBpbGVyIGl0c2VsZiwgaS5lLiBHQ0MgYW5k
IENsYW5nLgoKPiBZZXMsIGp1c3QgZm9yIHJpc2N2LiBUaGUgbG9naWMgaW4gb3VyIEtjb25maWcg
bWVudSBpcyBjdXJyZW50bHkgc29tZXRoaW5nCj4gbGlrZQo+IHNlbGVjdCBIQVZFX1JVU1QgaWYg
UlVTVENfU1VQUE9SVFNfUklTQ1YKPiBzbyB0aGF0IHdvdWxkIGp1c3QgYmVjb21lCj4gc2VsZWN0
IEhBVkVfUlVTVCBpZiBSVVNUQ19TVVBQT1JUU19SSVNDViAmJiBDQ19JU19DTEFORwoKSWYgdGhh
dCBpcyB3aGF0IHlvdSB0aGluayBpdCBpcyBiZXN0IGZvciBSSVNDLVYsIHRoZW4gc3VyZSwgdXAg
dG8geW91IC0tIHRoYW5rcyEKCkNoZWVycywKTWlndWVsCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
