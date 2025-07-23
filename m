Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F5AC83F1A
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 10:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIhSgq3AJiP0WQ9PJyaN2pOhHW2OTtXAcVQ2wP9W4EQ=; b=KvHQafQWJNpuMG
	3fSjElmBqBKNdtdfwTqOy8BWJyfYZ56lR1kZ1zFKFj4WpxrOeg7YbVNNV1hgdQSY2Nh9Pdl7IgrLq
	IApwobTSh5mo8Qy0ky4ImqGoCGbyPkXCcGi8chZamTs+jvw3IPVt549+kN7RJQbzO/J48fSe+Kuiw
	L+D93udtRw6P9/pM2VzQjb/bfXxItUC1zTkOOO6AySXuROv4tvOc2sdbda4FkS5ykBt7pl5azb3Ct
	/04M3h5HdAtdkDVLjojRJ5pi3J61h6XbbN+6i86OouhMydYe9GubzDbET3qzqIHkMq06ZgkU2eWoD
	iXCk6MvoP1ukKs2x+/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueWSi-00000004dte-2GHF;
	Wed, 23 Jul 2025 10:12:36 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueW93-00000004ZVL-0Ttu;
	Wed, 23 Jul 2025 09:52:18 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so403794a91.1;
        Wed, 23 Jul 2025 02:52:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753264336; x=1753869136; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V+/dV0S/yM5ebUUQww27WfFYh9svGL82SiTI5/e7B7U=;
        b=deEoSfhqsnXTwcdnJvlEtKwyRPKsZ+59YgkzrA5o5Zi5OsGWsE+gRwUB3mCxqXSBm7
         0ggsvee3e48VxNaYvQocBPTr4oY+KLONMIy+E+RgpcH6o5QWyFMDBg/SGFkfUYQxRrzj
         VUXJk8oUv03LHxU1DBJEJYN+9C9TA6TMR8I5DfXYHJIU5nTCOzYTJaqspph8oif0+vVX
         PTszRABGARuuVfPGc86xCq+buYF1KuClKWLgkr/BNmOoRVmgHATy5D26JonmJ9R6YPoC
         3QBR/1EV0uX4e+2Q5DXK7dIi7f5Pm5eK+PJugUIjpydfU6b3aBt4o0z5sy3GDyIjtCAB
         PV7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753264336; x=1753869136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V+/dV0S/yM5ebUUQww27WfFYh9svGL82SiTI5/e7B7U=;
        b=EO6QBFgHJiK8Kdw4kCH/8Ih4YlkGLF0UJqISROxdHefokC3QNq9jOrAfYCNq6PtVJ7
         z4Jkm6ph7m6cJsyLFXJW5GQTUcWkwlBai03KPzqIJ8gYX/y8maPk2Jp9BDiazxKDFPYT
         bGr3aEDHGaYqFPKP0p8pbKRrcqiDRO57f6+sn8RQc3+921PW2YLv/XjeYO5EHA5HKHqG
         PO7DdLb2TpR7UqL/RSANJBcqaR8FcsqQDVdWNwt4JI9GaaIMoroyFgWcIdgLNJfIUK8K
         4gY39s4fGQfO7+Ojyt1FjZNNErri8skvJYDG56D5DjordfgkaEg3W+dn0cVy4AA0i87x
         mJig==
X-Forwarded-Encrypted: i=1; AJvYcCXBsPHQve4iEyUDRnmwEHYlApWDFWjsCyUQ/t+IXPLQddfoCAEGwemOBFJDWvgiCElPxEbopu9xs6vAr8z2Fp7o@lists.infradead.org, AJvYcCXqN6P+H20eycO9Z3uGiEpSQNopzMuvJP+AwZh2nr0V40L+kMs0u7+fMCk06Yb6YLTB7UemKb2R3a/jv6g=@lists.infradead.org
X-Gm-Message-State: AOJu0YwjuBW7AydX5c7HyHsci3wGjo9PvrTjK9+Z/1TRDVWHh8jm+9n1
	kcONKT8fUFXh2BTkqUGiYHY85VGp11vfuuaEsmnaKMx5i5uouQPgJ7TCRMHp+s6s4ZJVXxQAEyN
	+1v6ZDPrrJPsUEt+ir3YnR4yfk/J0oog=
X-Gm-Gg: ASbGncsxYYh9N3XA57mexIuO0qPikv7CaMKi1MfS++/oYKe49TRURihiRHGH6xPikWs
	L7LFoSgaVjZf3EyJvgosrtJj/Q0COmUGT5DeFE4Arx/Cmzk2I0mYsXGsYMoxUow9HuO8UowhHje
	mWX4ru6MfqTkM2h7gVu8mOj4hL559phYzi99QCSthKJ0vECBMufMIFwpaTmvE4TyL2Epj/EC+Nb
	DF9qG0o
X-Google-Smtp-Source: AGHT+IF5yp3x1uoUnaGZMoJBe+fzYcdYddNENz2TuSijJoibHeDm9sWJWjMzhPHdSfVi3F/pn5nO7IChbp80rUU+c7Q=
X-Received: by 2002:a17:90b:4a47:b0:312:e76f:520f with SMTP id
 98e67ed59e1d1-31e5088598emr1376264a91.8.1753264336236; Wed, 23 Jul 2025
 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
 <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com> <20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
In-Reply-To: <20250723.152042.1300024463910400.fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Jul 2025 11:52:04 +0200
X-Gm-Features: Ac12FXzZ5eWdKPVCRlnoxNrP6D3TFPlJaL8XzNsPkRFhVqP5xsNvOO-4LiDYGFY
Message-ID: <CANiq72nLQkJo8voGONJBEgE8st7=A4RW7VP+W++SVCWse49n=Q@mail.gmail.com>
Subject: Re: [PATCH v6 0/4] rust: Add bug/warn abstractions
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250723_025217_152638_82633925 
X-CRM114-Status: GOOD (  12.32  )
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

T24gV2VkLCBKdWwgMjMsIDIwMjUgYXQgODoyMeKAr0FNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcGF0Y2ggZm9yIGFybTY0PyBJIHRy
aWVkIHRvIG1pbmltaXplIGNoYW5nZXMgdG8gdGhlIG9yaWdpbmFsIGNvZGUKPiBzbyBub3QgaW50
ZW50aW9uYWwuCgpUaGUgcmlzY3Ygb25lLCBpLmUuIGZyb20gdGhlIHJhbmdlIGRpZmY6CgogICAg
QEAgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9idWcuaDogdHlwZWRlZiB1MzIgYnVnX2luc25fdDsK
ICAgICAgICAgICAgICAgICIyOlxuXHQiICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKICAgICAtICAgICAgICAgICAgICAgICAgX19CVUdfRU5UUlkgIlxuXHQiICAgICAg
ICAgICAgICAgICAgICAgIFwKICAgICAtICAgICAgICAgICAgICAgICAgIi5vcmcgMmIgKyAlM1xu
XHQiICAgICAgICAgICAgICAgICAgICAgIFwKICAgIC0tICAgICAgICAgICAgICAgICAgIi5wb3Bz
ZWN0aW9uIiAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICArICAgICAgICAgIF9fQlVH
X0VOVFJZKGZpbGUsIGxpbmUsIGZsYWdzKSAiXG5cdCIgICAgICAgICAgIFwKICAgICArICAgICAg
ICAgICAgICAgICAgIi5vcmcgMmIgKyAiIHNpemUgIlxuXHQiICAgICAgICAgICAgICAgIFwKICAg
IC0rICAgICAgICAgICAgICAgICAgIi5wb3BzZWN0aW9uXG4iICAgICAgICAgICAgICAgICAgICAg
ICAgIFwKICAgICsgICAgICAgICAgICAgICAgICAgIi5wb3BzZWN0aW9uIiAgICAgICAgICAgICAg
ICAgICAgICAgICAgIFwKICAgICArCiAgICAgKyNkZWZpbmUgX19CVUdfRkxBR1MoZmxhZ3MpICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKICAgICArZG8geyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAoK
SWYgeW91IGxvb2sgaW50byB0aGUgYC5wb3BzZWN0aW9uYCBsaW5lLCB5b3VyIHBhdGNoIGFkZHMg
YSBuZXdsaW5lLApidXQgSSBndWVzcyBpdCB3YXMgbm90IGludGVudGlvbmFsLiBJbiB4ODYgdGhl
cmUgaXMgYSBuZXdsaW5lIGFmdGVyCnRoZSBkaXJlY3RpdmUsIGJ1dCB0aGVyZSB3ZSBoYXZlIGBl
eHRyYWAgYWZ0ZXJ3YXJkcy4KCihJIG5vdGljZWQgc2luY2UgSSB3ZW50IHRvIGV4cGFuZCB0aGUg
bWFjcm9zIGluIGEgZHVtbXkgZmlsZSwgZ2l2ZW4gaXQKY2FuIGJlIHNvbWV0aGluZyB0cmlja3kg
dG8gc3BvdCBkaWZmZXJlbmNlcyBpbiB0aGUgbm9ybWFsIGRpZmYsIGJ1dCBpdAppcyB2aXNpYmxl
IGluIHRoZSBub3JtYWwgZGlmZi4pCgo+IFllYWgsIEkgZm9sbG93ZWQgdGhlIG9yaWdpbmFsIGNv
ZGUgc3R5bGUuCgpBbmQgaGVyZSBJIG1lYW50IChpLmUuIHRoZSBmaXJzdCBwYXJ0IG9mIHRoYXQg
cGFyYWdyYXBoKSB0aGF0OgoKICAgIC0gICAgICAgICAgICAgICAgICAgICJcdC5vcmcgMmIrJWMx
XG4iICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKCm5vdyBnZW5lcmF0ZWQgdGhv
c2UgdHdvIHNwYWNlcyBhcm91bmQgaXQ6CgogICAgKyAgICAgICAiXHQub3JnIDJiICsgIiBzaXpl
ICJcbiIgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAoKPiBJJ3ZlIGp1
c3QgdGVzdGVkIHJ1c3QtbmV4dC4gTG9va3MgbGlrZSBhbGwgYXJjaGVzICh4ODYsIHJpc2N2LCBh
bmQKPiBhcm02NCkgd29ya3MgYXMgZXhwZWN0ZWQuCgpUaGFua3MgYSBsb3QhCgpDaGVlcnMsCk1p
Z3VlbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
