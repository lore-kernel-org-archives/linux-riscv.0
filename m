Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275B2C83F27
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jul 2025 00:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bfwfjwvColLq02vhmurLvoeQmFCNwF4pg83PQwY5itg=; b=iYCMXJ8i2bLUuF
	MsdN1RAr8FfiMwgAEY5ODUinJzguq0iLF9wlcZBA8Dpnw6/U1X0+avRR1ZhcQOL4SCTIQdxUQn66x
	cBEWoGunLD5jjF5J7FsDft+/lkDlTkfycXdAv3STr6bPlzD+SCHXAv+NILq4dS68qDNBgShgVIxaO
	RC1O540nfSirRUfd3GwPOc7RBJQkeS5aRBZJ9i3CRqo6fVQNX0VVpwxZlPz7xqvgKI0adnX55fMDM
	/XmMcD9ZHXqLbSR0UxhRtmy2nFyDms4qw58gMCWWYSbCx3CoArpPKwpWcR4/v5B1ZwC2xMEWbQ+QA
	18jXGOgEuH5s5+92gA7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueNeu-00000003kAF-1xf0;
	Wed, 23 Jul 2025 00:48:36 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueNes-00000003k9b-03Pd;
	Wed, 23 Jul 2025 00:48:35 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-313bcf6e565so235104a91.0;
        Tue, 22 Jul 2025 17:48:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753231713; x=1753836513; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=;
        b=nCgAi/1e0h6Mn0USw/CK9rvN+3OfCcDwSxZUg6WWkxsBPzdzA5Y0rfY26BWvN4wTld
         lRizI9/kGCytLhX0ybCn6fRyIHi1MEiiIB335iu1wzJghB7ikaCUH/kvQo/g2oJZ1G53
         zr+Ky3w6FwTLCVuCJUFXWZYOo34K9WitZuFsZs92Ogdmx+QFHR4Y1OlbZcBA9wENZ6Tm
         YebmXpJAv3UaSmu5lE4bj/kA94rzS0BSXQXCclaeYRXQMZ4e7J6ucZlPRDvLeGYTwvE/
         Lra0W6jlWhSsyt2BqhNpkAnbKwRGeSrz6s2IpNKD/Tq/1QjvZ7Oh2OCu4xgkmD94tdfm
         HsWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753231713; x=1753836513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DDWwMCWNmNg13/uNfIiBkoY/WSAIAnYmTPwjUuO5SDo=;
        b=w1vTiN6Jts80Y1SC3mLWgxFZjv6EzDqirE367pnxW7P98EMD93YV8X4iYZ9wyZSouR
         pu2WZVriu81PQddQC+w2xBVHO1qqb/PxBnGkBd5EQaHCqRT/2dyau2z0ouaZBJdHcRjO
         VrJQEp2dKK2ZL8no6veZjLiZvTrJGRuDV0WyySyoopC8A2G52xFuqWiOFxea5xrjhKY3
         6KMFlmpm3mlaYHZqzwjfXdj1DW9UJnJiQiVnjhcAyXPU34mi8U+5oaAdbvFyTZsikQzf
         d7YQ1uBV1OaTFMEgXh/dBMgj8gcJpGOdF/1Hz8DSw88SfreLteY730pkAm/abgEFxQIU
         4Y6g==
X-Forwarded-Encrypted: i=1; AJvYcCW7c1RwjJ3bYWZYFFIXxui0uwOaUzhRvZpUfupYFv80rqnDSteSf7dh/3J6A0g2+xoqqYPat31D4r3OXho=@lists.infradead.org, AJvYcCWLKM/gvhgwb7aGNXanofQU/BA5Ly+2EFJNYyAV77oPIVb+SrO6+fwzXstpL9muQ4EzTPA0oByWhOAgOdTEcuWP@lists.infradead.org
X-Gm-Message-State: AOJu0YyIIGQ5jL05D4mQ3IRfxW8yvjwHd5nbkSeF2rghhpDi3L9NTvFb
	kW7oS17kZlNzj2S7Q9mNBnlcCLuuzgLSTW7B0bU5iNgHlRQbtAn/DsltCyzQJgziGm61jG+FzH/
	k1xzz3Gtt6LBEOcMrIR/zDisQVdgQZOg=
X-Gm-Gg: ASbGncuI24RwjptTkM5RwaJZFizLVyyYYmGu6+7Oti8lNwnjbUIugU5HZJYM3Gawzjb
	NRqH0C5lCRFyp5G6siFbtHkItNAHJ2wWWyRdMhvSVrFr62lCmuBEg1+mbXnt92IylzAYjlE5gf+
	SdolEHMx+wYCXrvjYHslGTt/Z9B1YazIsfOp0aw1vx59jRyEjm0j9DYQm/nDjvRk7qX5iL7q5jU
	+R0KdWv
X-Google-Smtp-Source: AGHT+IEROY3xKK1boGx8uMtw+7HtkmcD7Il1aBqwfuxTsZ79ub1lx8jvxICoebRQamqfzBv+TelUdZ/qR6LkFSGFHEw=
X-Received: by 2002:a17:90b:4d08:b0:310:cf92:7899 with SMTP id
 98e67ed59e1d1-31e50812d7cmr712415a91.3.1753231712760; Tue, 22 Jul 2025
 17:48:32 -0700 (PDT)
MIME-Version: 1.0
References: <20250502094537.231725-1-fujita.tomonori@gmail.com>
In-Reply-To: <20250502094537.231725-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 23 Jul 2025 02:48:20 +0200
X-Gm-Features: Ac12FXwgRZoR7Zgn1XC8m0WPG0N61nJSGet7-c0jdjdrsFebOoekk-VJ_EoxJF4
Message-ID: <CANiq72=Hr5rg7tYta8aUoxt8hOPjR2ik5_-xMWZwacr63=-7KA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250722_174834_052946_FC6DE59D 
X-CRM114-Status: GOOD (  16.67  )
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

T24gRnJpLCBNYXkgMiwgMjAyNSBhdCAxMTo0NuKAr0FNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoc2V0IGFkZHMgd2Fybl9v
biBtYWNybyB3aXRoIHRoZSBidWcvd2FybiBhYnN0cmFjdGlvbiB0aGF0Cj4gdXRpbGl6ZXMgdGhl
IGtlcm5lbCdzIEJVRy9XQVJOIGZlYXR1cmUgdmlhIGFzc2VtYmx5LgoKT2ssIGxldCdzIG1vdmUg
Zm9yd2FyZCB3aXRoIHRoaXMuCgpJIHRvb2sgYSBsb29rIGF0IHRoZSBmaXJzdCB0aHJlZSBwYXRj
aGVzIGFuZCBjb21wYXJlZCB0aGUgZXhwYW5kZWQKb3V0cHV0IGZvciB0aGUgZXhpc3RpbmcgbWFj
cm9zLCB0byBtYWtlIHN1cmUgd2UgKGhvcGVmdWxseSkgZG9uJ3QKYnJlYWsgYW55dGhpbmcgZWxz
ZS4KCkl0IHNlZW1zIE9LLCBJIG9ubHkgbm90aWNlZCBhIHJlbW92ZWQgbmV3bGluZS4gV2FzIHRo
YXQgaW50ZW50aW9uYWw/ClRoZXJlIHdhcyBhbHNvIGEgYmFkIHBhcmFtZXRlciBuYW1lLCBidXQg
dGhhdCB3YXMgbm90IGh1cnRpbmcgYW55dGhpbmcKc2luY2UgaXQgd2FzIHVudXNlZC4KCihGb3Ig
dGhlIHg4NiBvbmUgY291bGQgYmUgY2xvc2VyIHJlbW92aW5nIGEgY291cGxlIHNwYWNlcywgYnV0
IGl0CnNob3VsZCBub3QgbWF0dGVyIGFuZCBvdGhlciB4ODYgZmlsZXMgZm9ybWF0IGl0IHRoYXQg
d2F5LCBzbyBJIGRpZG4ndApjaGFuZ2UgaXQuIEkgYWxzbyBub3RpY2VkIHVuZXhwZWN0ZWQgc3Bh
Y2VzIHVzZWQgZm9yIGFsaWduaW5nIHRoZQptYWNybywgYnV0IGl0IHR1cm5lZCBvdXQgaXQgd2Fz
IGluIHRoZSBvcmlnaW5hbCBhbHJlYWR5LCBzbyBJIGxlZnQgaXQKYWxzbyB1bmNoYW5nZWQuKQoK
VGhlbiBJIGZvdW5kIGEgZmV3IG1vcmUgYml0cyBvbiB0aGUgbGFzdCBwYXRjaC4KClRvbW8sIGNv
dWxkIHlvdSBwbGVhc2UgZG91YmxlLWNoZWNrIHlvdSBhcmUgT0sgd2l0aCBhbGwgdGhlIGNoYW5n
ZXMsCmFuZCBwbGVhc2UgcnVuIHRoZSB0ZXN0cyB5b3UgZGlkIGJhY2sgdGhlbiBvbiBgcnVzdC1u
ZXh0YCBhZ2FpbiBmb3IKYWxsIGFyY2hlcywgZ2l2ZW4gaXQgaGFzIGJlZW4gYSB3aGlsZSBzaW5j
ZSB5b3UgcG9zdGVkIGl0IChwbHVzIEkgZGlkCmEgZmV3IGNoYW5nZXMgb24gdG9wLCBhZnRlciBh
bGwpPyBJIHdvdWxkIGFwcHJlY2lhdGUgaXQsIHRoYW5rcyBpbgphZHZhbmNlIQoKVG8gYmUgY2xl
YXIsIEkgZGlkbid0IHJlLWNoZWNrIGV2ZXJ5IHNpbmdsZSB0aGluZy9jb21iaW5hdGlvbiwgYnV0
CmhvcGVmdWxseSB3aGF0IEkgY2F1Z2h0IGhlbHBzLiBTaW5jZSB0aGVyZSBhcmUgbm8gdXNlcnMg
YW55d2F5IChvZiB0aGUKbGFzdCBwYXRjaCkgcmlnaHQgbm93LCBpdCBzaG91bGQgYmUgZmFpcmx5
IHNhZmUuCgpBcHBsaWVkIHRvIGBydXN0LW5leHRgIC0tIHRoYW5rcyBldmVyeW9uZSEKCiAgICBb
IEZpeGVkIHR5cG8gaW4gbWFjcm8gcGFyYW1ldGVyIG5hbWUuIC0gTWlndWVsIF0KCiAgICBbIFJl
bW92ZSBlbmRpbmcgbmV3bGluZSBpbiBgQVJDSF9XQVJOX0FTTWAgY29udGVudCB0byBiZSBjbG9z
ZXIgdG8gdGhlCiAgICAgIG9yaWdpbmFsLiAtIE1pZ3VlbCBdCgogICAgWyBBdm9pZCBldmFsdWF0
aW5nIHRoZSBjb25kaXRpb24gdHdpY2UgKGEgZ29vZCBpZGVhIGluIGdlbmVyYWwsCiAgICAgIGJ1
dCBpdCBhbHNvIG1hdGNoZXMgdGhlIEMgc2lkZSkuIFNpbXBsaWZ5IHdpdGggYGFzX2NoYXJfcHRy
KClgCiAgICAgIHRvIGF2b2lkIGEgY2FzdC4gQ2FzdCB0byBgZmZpYCBpbnRlZ2VyIHR5cGVzIGZv
cgogICAgICBgd2Fybl9zbG93cGF0aF9mbXRgLiBBdm9pZCBjYXN0IGZvciBgbnVsbCgpYC4gLSBN
aWd1ZWwgXQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
