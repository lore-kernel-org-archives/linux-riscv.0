Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76AE5EE3683
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 14:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YbDYZF8wjf+UeCOksd4SQ6lzM/nejGhB3o97wbqtsJU=; b=oNM+prv8/l3SyN
	NNJl4ZXwXEcRgib8qkI/fUaLv+jPiey4LEyJaDhDm9t0bpCuWk6H4XnTFt9ip/ngmf0T3+YzhkxGM
	6JX2vTvNEq3b+EfTU52wXFQyadJdRXgk7sOCE+4y/g6tGY9H29hA/kOzBZpgF0TCHG2DuBkg9Jlky
	/2ium911Ru7t8s/DGGWHXvv/HBLoFJbDKB17iZtKnh5fzfmDwlY9krzWTYr/EzQNaM5BAgeuAoQ1x
	A9VjURfk3Ialaf56KFgnQ0RTmSzfP+F0HGxFtzGK32iqu2lTKmc7tEtTSNqGlTqb0Mxuy7s8Z+rAN
	meFP2taRBZPpFflOh60w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXH0-00000002Az3-39Lk;
	Thu, 12 Feb 2026 14:02:26 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqXGy-00000002AyG-0Zdt
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 14:02:25 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4359249bbacso1468623f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 06:02:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770904942; cv=none;
        d=google.com; s=arc-20240605;
        b=NvKy09Xa9zMelI1ufc5q33pJZKoVLfPF1XVJrNQjO2d1b7J+48uNpFVzsmLlMv5ZYu
         W9R++0FkyQzNFfg7bhxdqzAWGDl0F6YYTf9LpVisaLWbiQbWSghThqz9HZQcg+ISMnHS
         oG1sQ6VPxGk+eVDCPFBgUXo6FwsfXRs86i80VbnIvZb+5ZdJye9zsN6R743kcUj2AeRE
         RlrWfsBBF6qblp3g4DXl04kmtvsJzY5/xZkcpdFYSvmQRLVV9HQ7aBrBxgcCpNkZYORU
         awboi1ux2u09Tz+3zHeRJAhca0PkGBmxFLe8Yr3Vw/KZ+Z6sATu+tjJOiC0fkRdoAIMJ
         9AIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        fh=8c/e9C61ENYDqhaFndgRl8mrNgmXr7/3jqm3ipmT27E=;
        b=XN0uCg1jIKCFIyvnTdDJU0YRCLE3R/1N+7lbbvKHeeolBIFF1oWLENmEE8FAUCtXRc
         s49WLMBjx5KV8ohIzKC3ze+sP5xd5DBhhcsrvFOEOKQsZVjfbXMwyyI03FIOsONPj1j5
         ZnzOubKcIOgx5yewIS4wS0She/mkGv36qq1rEcsp7TGLBOpDLhrydvHBpYCVXbAPiZ55
         +8eWd1aHavoBdRBaNd921E4/lj73ZSWjglIPj3UpUuoy0W1x9RgRPQOqd5CtFAOrT7RU
         9e0HOSe7/dBkRs2Qj3mf1LKSTzLvOXfpclZN2USMBNCcrPsY7gK1cs2i9eMwG6WxSkG/
         AaKA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770904942; x=1771509742; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        b=naRwRGn9TY5bn5+RkV64tMQTW3HssFtXV48z2DUWlISILqZKqfQMS81b7u1tUAoFBO
         4UwPK5+xtHRJMqu7nUnUfA1OHRJ2ysEQ4IXJcEuSjXriJba3KBLkKpD5jssoPGEoMzlN
         IEPFqwAScW7q+ErtQ2Rv/rNW8jkdy0WkgULB1/U1bozpw+ndiZQmrN/vb87JFs9DfDCp
         BMGp4RJQb0jkeNsz5N7k4+FiUH/WbebJ2SxfB+YPhUYJ8Jun6nQ/XEbuZjlkEdJ7jLjA
         PE/TYXwhMs++RGL9aec2RrQJ/SwrkUZiStCNCxPkpXoAR+gvBlJ2tmx8bIByeqF+gI0g
         V2Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770904942; x=1771509742;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JQdMCRkRLmIpXiZMZIzEwhlQnq6p9FnzGfa9kKgZNL0=;
        b=i2d7/2Hs56JrdLKz9LC2TjW0GE2cJbCMgJliODA0mfnRZ4Lj6rnb+HyL5ht9PUwmhG
         KDojSaRkwnwc7NK+yVpQrR5UX+5BEk7ilaL4rVF4HKpNZeH7OGcducBhC8VM1iYrPQHX
         WwuRlQimwCvzv8Rj1DW8YGyfS8wqxT0YRSngom8fWCpZHNiJ6ASA9z6Ilq2D1Ni3pym4
         ttd3YbeAKBvOYEJw35uh36FHLF7CICw6XQ+ANbLsCdO0sKVcoeXZr5uzADHfe5jXz1n7
         UPyZm1s5gidGU5alkm/HIM2iOU2C9KyXF8c53PzKfs0EagkNMN5+s0AZXM3xJaU0nHKn
         ty3A==
X-Forwarded-Encrypted: i=1; AJvYcCUpbprErm7jIQpwiQlumxS5U3jalygIlfywoEBasUA6RShm/z9y5JcdD1NR4d/QxKawI8YQM79xKANH6A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUCL1g3wejBZ+aLflwNheKSCAn0lYNVsunP/YB92Awc7TU97tR
	6rYnPiLWVb1ErnheNlPlHpW/V2G5Mh3vt7CApqFUjVH4djL+83Ue25RKF711OLrfqclsMeIXzNW
	2gUNw/rwarJBpqQSaYRDSHLYcY8coerhwORExZf71
X-Gm-Gg: AZuq6aKeOUCNFm469snbAQXzkjQESH3en0IntaLlg8GlKg1pbKeikVkLbCjYyLftqTa
	PlhKN7d/DF69YABXgLM/5+6Rk6QYiKoKXGA7ye8B5F7bM0KL3W20ko3qBK7wRpPLXV/MrM2gbWf
	ze643OXaK9pVpZm5u62FS4fY/01CKrQVpjf+8yL+4MLmHXD/B40AH57F2JLKHOCphjF7nHZwlQJ
	7bWOdGcgMhGgzLiNeQ2MRG18c8edvr1T4lAPFfLJsBtQSR2Czvt+qTjPRVe8PNQKoQRCqbqv2TY
	2sdHu4WtFz9UytUCPzO6Pa7uCS/1PRiS11RUahwo6O0NxvUwZJPOejwwI2DIoFIMK2R4uw==
X-Received: by 2002:a05:6000:208a:b0:435:932e:f924 with SMTP id
 ffacd0b85a97d-4378e6d8d92mr4583407f8f.2.1770904941572; Thu, 12 Feb 2026
 06:02:21 -0800 (PST)
MIME-Version: 1.0
References: <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
 <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com> <20260212-lumpy-uptight-petrel-cac725@houat>
In-Reply-To: <20260212-lumpy-uptight-petrel-cac725@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 15:02:09 +0100
X-Gm-Features: AZwV_Qg2-1q5B4F446nU29Cn7SlWuusys2TSQd4MD8qGMnFLRNj2Nk7LREIXN9Y
Message-ID: <CAH5fLghyg-QzT11gehvwTb2ii4FA-dkse=QtYD0Tc5MT5Dhd7A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
To: Maxime Ripard <mripard@kernel.org>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_060224_199880_A965F721 
X-CRM114-Status: GOOD (  25.59  )
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

T24gVGh1LCBGZWIgMTIsIDIwMjYgYXQgMjozOOKAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIaSBBbGljZSwKPgo+IE9uIFRodSwgRmViIDEyLCAyMDI2
IGF0IDA5OjE2OjUxQU0gKzAxMDAsIEFsaWNlIFJ5aGwgd3JvdGU6Cj4gPiBJZiB5b3UgbWFrZSB0
aGUgcmF3IEFQSSB1bnNhZmUsIHRoZW4gdGhhdCdzIG9rYXkgYnV0IGFueSB1c2Ugb2YgYW4KPiA+
IHVuc2FmZSBBUEkgZnJvbSBhIGRyaXZlciB3aWxsIHJlY2VpdmUgdmVyeSBoYXJkIHNjcnV0aW55
Lgo+Cj4gQW5kIHRoYXQncyB0b3RhbGx5IGZhaXIgdG8gbWUuIElmIGRyaXZlcnMgd2FudCB0byBo
YXZlIGEgbW9yZSBvcHRpbWFsCj4gYnV0IHBvdGVudGlhbGx5IHVuc2FmZSB1c2Ugb2YgdGhlIEFQ
SSwgdGhlbiBpdCBzaG91bGQgYmUgZmxhZ2dlZCwKPiBkb2N1bWVudGVkIGFuZCBzY3J1dGluaXpl
ZC4KPgo+ID4gWWVzLCB0aGVyZSBhcmUgb2NjYXNpb25hbGx5IGdvb2QgcmVhc29ucyB0byB1c2Ug
dW5zYWZlIGZyb20gZHJpdmVycywKPiA+IGJ1dCB0aGUgZW50aXJlIHBvaW50IG9mIHRoaXMgUnVz
dCBleGVyY2lzZSBpcyB0byBpc29sYXRlIHVuc2FmZSBjb2RlCj4gPiBvdXRzaWRlIG9mIGRyaXZl
cnMgYXMgbXVjaCBhcyBwb3NzaWJsZS4KPgo+IFNvLCBhc2lkZSBmcm9tIHRoZSByaXNrIG9mIGZ1
Y2t1cHMsIGFyZSB5b3UgY29uY2VybmVkIGFib3V0IHNvbWV0aGluZwo+IGhlcmU/IERvIHlvdSBl
eHBlY3QgdGhhdCBzY3J1dGlueSB0byBiZSBjb25zdGx5IG9uIHRoZSBtYWludGVuYW5jZSBzaWRl
Cj4gb2YgdGhpbmdzPwoKV2VsbCBJIGRvIHRoaW5rIGl0J3MgbW9zdGx5IHRoZSByaXNrIG9mIG1p
c3Rha2VzLCB5ZXMuCgo+IEkgZ3Vlc3Mgd2hhdCBJJ20gYXNraW5nIGlzOiBleGNlcHQgZm9yIHRo
ZSBvYnZpb3VzICJyZXZpZXciIGNvc3QKPiBhc3NvY2lhdGVkIHdpdGggaXQsIHdoeSB3b3VsZCB0
aGF0IGJlIGEgcHJvYmxlbWUgaWYgd2UgaGF2ZSwgc2F5LCBhIGZldwo+IGRvemVuIGRyaXZlcnMg
dXNpbmcgdGhhdCB1bnNhZmUgQVBJPwoKVGhlIHJlYXNvbiBJIHdvdWxkbid0IHJlYWxseSBzdWdn
ZXN0IHRoZSB1bnNhZmUgQVBJIGlzIHRoYXQsIGlmIEknbQp0aGUgcmV2aWV3ZXIgb2Ygc2FpZCBk
cml2ZXIsIHRoZW4gbXkgcmV2aWV3IHdpbGwgYmUgImp1c3QgdXNlIGEgc2FmZQpBUEkgaW5zdGVh
ZCIuCgpGb3IgZXhhbXBsZSwgaWYgeW91IHJlYWxseSB3YW50IGV4cGxpY2l0IGluYy9kZWMgY2Fs
bHMgZm9yCmNvbnZlbmllbmNlLCB3ZSBjYW4gbWFrZSBhIHNhZmUgQVBJIHdpdGggYSBjb3VudGVy
IHRoYXQgcmV0dXJucyBhbgplcnJvciBpZiB5b3UgZGVjcmVtZW50IG1vcmUgdGltZXMgdGhhbiB5
b3UgaGF2ZSBwcmV2aW91c2x5CmluY3JlbWVudGVkLiBPciBpZiB5b3UgcHJlZmVyIHNvbWV0aGlu
ZyBlbHNlLCBJIGNhbiB0aGluayBvZiBzZXZlcmFsCm90aGVyIHNhZmUgQVBJcy4KCj4gPiBJZiBE
YW5pZWwncyBwcm9wb3NhbCBpcyBpbmNvbnZlbmllbnQgZm9yIHNvbWUgZHJpdmVycywgaXQgd291
bGQgYmUgZmFyCj4gPiBiZXR0ZXIgdG8gaGF2ZSBhIHRoaXJkIEFQSSB0aGF0IGlzIGJvdGggc2Fm
ZSBhbmQgY29udmVuaWVudCBmb3IgdGhvc2UKPiA+IGRyaXZlcnMuCj4KPiBZZWFoLCBJIGd1ZXNz
IEkgd2FzIGV4cGVjdGluZyB0aGF0IG9uZSB0byBjb21lIGFmdGVyIHdlIGhhdmUgYSBmZXcKPiB1
bnNhZmUgZHJpdmVycyB1c2luZyBpdCBhbmQgd2UgZG8gbmVlZCB0byBjb25zb2xpZGF0ZSAvIG1h
a2UgaXQgc2FmZS4KCkZvciBtb3N0IHRoaW5ncywgd2UgaW1wbGVtZW50ZWQgYW5kIHVzZWQgdGhl
IHNhZmUgQVBJIGZyb20gdGhlIHZlcnkKc3RhcnQuIEknbSBub3QgZ29pbmcgdG8gc2F5IHRoZXJl
IGFyZSBuZXZlciBleGNlcHRpb25zIHRvIHRoYXQgYmVjYXVzZQp0aGVyZSAqYXJlKiBleGNlcHRp
b25zLiBCdXQgSSBkb24ndCByZWFsbHkgc2VlIHdoeSBjbGsgc2hvdWxkIGJlIG9uZQpvZiB0aGVt
LgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
