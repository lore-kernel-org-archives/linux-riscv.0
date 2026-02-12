Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEB56EDF055
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Feb 2026 08:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HSfJhiYGy3gn1wYlqquY0CUuKJ8WSWBAJdhMXH1MriQ=; b=sgG84BeE/5rwkG
	CUhAvCrRJb15vNSXy7G6NBbqyamVb98d6REKXets5QXMEdBAAM7rSWMlF88bovAe4qm7er9cssg+D
	98pxMRexrTzgr3d57yO891Ee0ZZ3gehbaycedivEVc8XLwb9WEGO67G01HoDZW8poDFEMyXlhsNhA
	21r02wDey9ypDna32FIpuhQZnaSRcuXjz2+RONvfnBVME0LZoKCz6ByWQnGK/USE0ACxKMhm93r2G
	+Lu/T3LOjXz/rQaL4KTtNbpixNaSKz2Qzc5t12lFnd2tvxDnaQccM9J3hsIpPnaHTO0N/d8YhdC/H
	sbzE+liVFfEmAwlLK5VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRsq-00000001kPs-0EsW;
	Thu, 12 Feb 2026 08:17:08 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqRso-00000001kPX-0GFU
	for linux-riscv@lists.infradead.org;
	Thu, 12 Feb 2026 08:17:07 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-436356740e6so5547017f8f.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Feb 2026 00:17:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770884223; cv=none;
        d=google.com; s=arc-20240605;
        b=Cyx3S5jk7LUc02bRyf5PwJn8Y23ykrfgipYbSsF+wc9FVlEPVwvs71xoBnVLNxLKhK
         CvSuUAh7oTFJC8QxVIJPDgCM8IhSabKZDIdy7x5/14oukEUDBKjpqzvTDw5EtsKi7eed
         Y3rw2Ob+oUvc+1yH/oOmOQdHWUWfZqe7M1t1K0pw7qr7VgMSOI1EGDfPidSkbjhef6++
         gvTy8Tztpi/SqidOPGokNRJ+sd19PDaDL1sQzPblxUXVYwkYYkg/U6fZcwFb4h1+/Myj
         pK6IjBTQygT8vOdgi+6hPWq4vAD9mom6evFDu26Udq4QU7bam3juR7zovBEAkaxvZ/Kw
         d0JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NpjJ+bXgoJAJdq6/RHAgpjIs0bFSGiAauGnbv0NC43o=;
        fh=lpaDk8r/K8om63sdb6L4MnVtM0Cnffm5zYYcuPXfpTY=;
        b=dlW3E+jMuXnWQqQTBItgQuf8B09xpsYxtQG6MeHM/N3APmkKBiXKlySQP0+VX5hBpG
         zTow7EuYlR1ck8Rnu67EpgZ6eYYnGx5pRmfW1ilVsAVKKvkhPRctFZbGtaFsTvB50QM8
         jZVQaO+W3QwC2f9fGOeykxcLE0rSDuI310Ac+xCR8j5LMY1VdtqX7oGa7EYqbB0rK5Tr
         WmmR7NS25D/6jrQdt1FjQnNsDYGeBoXhYzMjJdRUtWZoD1xv6PGqkhRguSQ9QUmQoAeB
         VRMQoemYAhQZqt50MxPcD8iueLYTwW8zUYWaUSsLy7Rw0GLK4nKC9Df5CLD2bQdQ6Mfj
         w5zQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770884223; x=1771489023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NpjJ+bXgoJAJdq6/RHAgpjIs0bFSGiAauGnbv0NC43o=;
        b=MZmKXygQ+eWp0u7Vs5qWqTmE0C4yaN3U6hAhOSr+h37JqgmvvxiEWfR4esEBXFwaAM
         mPzqhpXvIFjeOK3hVk2gpiq0zbF8AbvHThy1R5H9oyztE3KZgODYkLUWrpGVJUYTZqqG
         mZe+Q+R6gH1cQgbPvkJaGV30YqjLBCMe7sfu5vXl7zRkvJCsG+Fh+filWT8b4jKQ8Ypi
         Mr61w7nhkjcPp7K7Hmmgd2zW3/CkTT/lSW+3Y+5sND80WdGZJEFhQrlWpn9kUPaAMq0c
         x1N3+07topnu4tjkexLFjZcfz7LOGq62FGYFnDu6sfv4DpIDkRcz9Dn9EsB/EHbgU6vP
         BltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884223; x=1771489023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NpjJ+bXgoJAJdq6/RHAgpjIs0bFSGiAauGnbv0NC43o=;
        b=Pcq8Y46n41uNbmXJThVvDb445b+ClRCcugD2UiE0OiEw5zmkOuhOmsI6D+1YKpD1HE
         +cFcroIQOiJcx99MIPO2HQ+yjngaQkrF/7zysl8pjqeHGp3g2rmWFZDbWficrhZo7tiU
         S0zopu8IDRv5flOCT/P+dn11ntL/yo4nJev2EXOuaGF2Ijs5UpR/f4AkU+QDVf5NKVqA
         ZGf6qiRjYj1CsI70v3E+tgYb9FuLXfe1FmT3Fbn4DAqVwh6rM0djheGQtuDGbnletL6F
         rvMl40WGu8KcZtfC+4JjfIReGLEl1LdZL0G7As2atr82KWikIt8JmfJIeG/AEjI83t/y
         YLZA==
X-Forwarded-Encrypted: i=1; AJvYcCUb9DdhriMZNZy/fO7OygsfllopmAcegOudzAi3Vd3t0/fx2w3chJIL9boR+SUClT1jpNSws9yX8ss3wA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywrlcf4U8StUXPpp8gY5z8a6GElXYPOsIWpO/TjmhlPYkyQOW7N
	6XpaUV9izvwEoleMmVdhITVFCb/VIQu+H4shC24XGqrw390l8rXjM0O8J2iM5zCSDePoHszEhfJ
	xy751lLZf2h2sL/1L6FUrgzc5ogxOsyjAQozqYPUR
X-Gm-Gg: AZuq6aLTRFnWLeOw9g56+oKxJw/ziIvcekq7j8bX5NloAHldHYxvfECF+htCoSd7VDx
	P+F6vy3/0A0Nu32mZrppD1CPbWWz467Vjm/iXSq4rw1ilDyfThOFqgVV8ncQCiZlBx/0S6OWRy8
	65d/WBeJuezaFDk/bbO7E7vDkz0g205FhRR1vFbpwj6UCjZbXoCpHZ9WYACKCZycsYfj+mYP4II
	5ZLZsbduAAlekquU7LalNNu3zUWyRNa58Avori7t0q7EH96Yi+ALvh5jyLjaSwpUhqHSAnCY9U/
	rE3+OMtUTmIuCy0FEx0P/MttfIh5ecn2fP9xDQ==
X-Received: by 2002:a05:6000:1a89:b0:437:678b:83ca with SMTP id
 ffacd0b85a97d-4378ac99f00mr3631820f8f.50.1770884222766; Thu, 12 Feb 2026
 00:17:02 -0800 (PST)
MIME-Version: 1.0
References: <518D8B09-B9A1-4DB4-85CD-37A2DD3D5FB1@collabora.com>
 <DFSLCI9U4NCW.2HI2UPUI7G134@kernel.org> <20260119-weightless-pelican-of-anger-190db0@houat>
 <DFSN4FDCYHMW.3J3237PEBV2ZP@kernel.org> <20260122-majestic-masterful-jaguarundi-d0abde@houat>
 <2F3D3A40-6EF9-46FC-A769-E5A3AAF67E65@collabora.com> <20260204-nickel-seal-of-poetry-8fdefb@houat>
 <91A92D84-1F2E-45F3-82EC-6A97D32E2A78@collabora.com> <20260204-angelic-vermilion-beagle-fd1507@houat>
 <20260209105047.693f2515@fedora> <20260211-flawless-feathered-boar-0b87ad@houat>
In-Reply-To: <20260211-flawless-feathered-boar-0b87ad@houat>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 12 Feb 2026 09:16:51 +0100
X-Gm-Features: AZwV_QinKyXJ-A463YThqNsT1M__XmmPzGQJrynVFHR1tMFsQH08Zqmn37iT6Tc
Message-ID: <CAH5fLgiQE7mJBpAxv6xTVKKFWadg2GdVe31hRM6gNk3Vah61MA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20260212_001706_160665_4A9585BF 
X-CRM114-Status: GOOD (  63.05  )
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

T24gV2VkLCBGZWIgMTEsIDIwMjYgYXQgNTozN+KAr1BNIE1heGltZSBSaXBhcmQgPG1yaXBhcmRA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIEZlYiAwOSwgMjAyNiBhdCAxMDo1MDo0N0FN
ICswMTAwLCBCb3JpcyBCcmV6aWxsb24gd3JvdGU6Cj4gPiBIaSBNYXhpbWUsCj4gPgo+ID4gT24g
V2VkLCA0IEZlYiAyMDI2IDE1OjM0OjI5ICswMTAwCj4gPiBNYXhpbWUgUmlwYXJkIDxtcmlwYXJk
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+ID4gT24gV2VkLCBGZWIgMDQsIDIwMjYgYXQgMDk6
NDM6NTVBTSAtMDMwMCwgRGFuaWVsIEFsbWVpZGEgd3JvdGU6Cj4gPiA+ID4gPiBJJ20gcHJvYmFi
bHkgbWlzc2luZyBzb21ldGhpbmcgdGhlbiwgYnV0IGxldCdzIGFzc3VtZSB5b3UgaGF2ZSBhIGRy
aXZlcgo+ID4gPiA+ID4gdGhhdCB3YW50cyBpdHMgY2xvY2sgcHJlcGFyZWQgYW5kIGVuYWJsZWQg
aW4gYW4gaHlwb3RoZXRpY2FsIGVuYWJsZSgpCj4gPiA+ID4gPiBjYWxsYmFjaywgYW5kIGRpc2Fi
bGVkIC8gdW5wcmVwYXJlZCBpbiBhIGRpc2FibGUoKSBjYWxsYmFjay4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBGcm9tIGEgUE0gbWFuYWdlbWVudCBwZXJzcGVjdGl2ZSwgdGhpcyB1c2VjYXNlIG1ha2Vz
IHRvdGFsIHNlbnNlLCBpcyBhCj4gPiA+ID4gPiB2YWxpZCB1c2VjYXNlLCBpcyB3aWRlbHkgdXNl
ZCBpbiB0aGUga2VybmVsLCBhbmQgaXMgY3VycmVudGx5IHN1cHBvcnRlZAo+ID4gPiA+ID4gYnkg
Ym90aCB0aGUgQyBhbmQgUnVzdCBjbGsgQVBJcy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBUaGUgb25s
eSBzb2x1dGlvbiB0byB0aGlzIHlvdSBzdWdnZXN0ZWQgc28gZmFyIChJIHRoaW5rPykgdG8gaW1w
bGVtZW50Cj4gPiA+ID4gPiB0aGlzIG9uIHRvcCBvZiB0aGUgbmV3IGNsayBBUEkgeW91IHByb3Bv
c2UgaXMgdG8gaGF2ZSBhIGRyaXZlciBzcGVjaWZpYwo+ID4gPiA+ID4gZW51bSB0aGF0IHdvdWxk
IHN0b3JlIGVhY2ggb2YgdGhlIHBvc3NpYmxlIHN0YXRlIHRyYW5zaXRpb24uCj4gPiA+ID4KPiA+
ID4gPiBZZXMsIHlvdSBuZWVkIGFuIGVudW0gX2lmXyB5b3Ugd2FudCB0byBtb2RlbCB0cmFuc2l0
aW9ucyBhdCBydW50aW1lLiBJSVVDIHlvdQo+ID4gPiA+IG9ubHkgbmVlZCB0d28gdmFyaWFudHMg
dG8gaW1wbGVtZW50IHRoZSBwYXR0ZXJuIHlvdSBkZXNjcmliZWQuIEkgZG8gbm90Cj4gPiA+ID4g
Y29uc2lkZXIgdGhpcyAg4oCcYm9pbGVycGxhdGXigJ0sIGJ1dCByYXRoZXIgYSBzbWFsbCBjb3N0
IHRvIHBheS4KPiA+ID4KPiA+ID4gQSBtYWludGVuYW5jZSBjb3N0IHRvIHBheSBieSBldmVyeSBk
cml2ZXIgaXMga2luZCBvZiB0aGUgdGV4dGJvb2sKPiA+ID4gZGVmaW5pdGlvbiBvZiBib2lsZXJw
bGF0ZSB0byBtZS4KPiA+ID4KPiA+ID4gPiBJIHdvdWxkIHVuZGVyc3RhbmQgaWYgdGhpcyB3YXMg
c29tZSBlbGFib3JhdGUgcGF0dGVybiB0aGF0IGhhZCB0byBiZQo+ID4gPiA+IGltcGxlbWVudGVk
IGJ5IGFsbCBkcml2ZXJzLCBidXQgYSB0d28tdmFyaWFudCBlbnVtIGlzIGFzCj4gPiA+ID4gc3Ry
YWlnaHRmb3J3YXJkIGFzIGl0IGdldHMuCj4gPiA+Cj4gPiA+IEFuZCB5ZXQsIHRoYXQgZnJhbWV3
b3JrIGhhcyBkb3plbnMgb2YgaGVscGVycyB0aGF0IGRvIG5vdCByZW1vdmUKPiA+ID4gYW55dGhp
bmcgZnJvbSBkcml2ZXJzIGJ1dCBhIGNvdXBsZSBvZiBsaW5lcy4gU28gc3VyZWx5IGl0cyB1c2Vy
cyBtdXN0Cj4gPiA+IGZpbmQgdmFsdWUgaW4gcmVkdWNpbmcgdGhhdCBib2lsZXJwbGF0ZSBhcyBt
dWNoIGFzIHBvc3NpYmxlLiBBbmQgeW91IGRvCj4gPiA+IGltcGxlbWVudCBzb21lIG9mIHRoZW0s
IHNvIHlvdSBtdXN0IGZpbmQgdmFsdWUgaW4gdGhhdCB0b28uCj4gPiA+Cj4gPiA+ID4gPiBUaGF0
J3MgdGhlIGJvaWxlcnBsYXRlIEknbSB0YWxraW5nIGFib3V0LiBJZiBldmVyeSBkcml2ZXIgd2Fu
dGluZyB0bwo+ID4gPiA+ID4gaW1wbGVtZW50IHRoYXQgcGF0dGVybiBoYXMgdG8gbWFrZSBzdWNo
IGFuIGVudW0sIHdpdGggYWxsIHRoZSByZWxldmFudAo+ID4gPiA+ID4gdHJhaXRzIGltcGxlbWVu
dGF0aW9uIHRoYXQgbWlnaHQgY29tZSB3aXRoIGl0LCB3ZSBnbyBmcm9tIGFuIEFQSSB3aGVyZQo+
ID4gPiA+ID4gZXZlcnl0aGluZyB3b3JrcyBhdCBuby1jb3N0IGZyb20gYSBjb2RlLXNpemUgcGVy
c3BlY3RpdmUgdG8gYSBzaXR1YXRpb24KPiA+ID4gPiA+IHdoZXJlIGV2ZXJ5IGRyaXZlciBoYXMg
dG8gZGV2ZWxvcCBhbmQgbWFpbnRhaW4gdGhhdCBlbnVtLgo+ID4gPiA+Cj4gPiA+ID4gVGhlcmUg
YXJlIG5vICJ0cmFpdHMgdGhhdCBjb21lIHdpdGggaXQiLiBJdCdzIGp1c3QgYW4gZW51bSwgd2l0
aCB0d28KPiA+ID4gPiB2YXJpYW50cy4KPiA+ID4gPgo+ID4gPiA+ID4gQVBJIHdoZXJlIGV2ZXJ5
dGhpbmcgd29ya3MgYXQgbm8tY29zdAo+ID4gPiA+Cj4gPiA+ID4gVGhlIHByZXZpb3VzIEFQSSB3
YXMgZmFyIGZyb20g4oCcZXZlcnl0aGluZyB3b3Jrc+KAnS4gSXQgd2FzIGZ1bmRhbWVudGFsbHkK
PiA+ID4gPiBicm9rZW4gYnkgZGVzaWduIGluIG11bHRpcGxlIHdheXMsIGkuZS46Cj4gPiA+Cj4g
PiA+IE91dCBvZiBjb250ZXh0IGFuZCBub3Qgd2hhdCBJIG1lYW50LCBidXQgb2suCj4gPiA+Cj4g
PiA+ID4gPiBhKSBJdCBvbmx5IGtlZXBzIHRyYWNrIG9mIGEgY291bnQgdG8gY2xrX2dldCgpLCB3
aGljaCBtZWFucyB0aGF0IHVzZXJzIGhhdmUKPiA+ID4gPiA+IHRvIG1hbnVhbGx5IGNhbGwgZGlz
YWJsZSgpIGFuZCB1bnByZXBhcmUoKSwgb3IgYSB2YXJpYXRpb24gb2YgdGhvc2UsIGxpa2UKPiA+
ID4gPiA+IGRpc2FibGVfdW5wcmVwYXJlKCkuCj4gPiA+ID4gPgo+ID4gPiA+ID4gYikgSXQgYWxs
b3dzIHJlcGVhdGVkIGNhbGxzIHRvIHByZXBhcmUoKSBvciBlbmFibGUoKSwgYnV0IGl0IGtlZXBz
IG5vIHRyYWNrCj4gPiA+ID4gPiBvZiBob3cgb2Z0ZW4gdGhlc2Ugd2VyZSBjYWxsZWQsIGkuZS4s
IGl0J3MgY3VycmVudGx5IGxlZ2FsIHRvIHdyaXRlIHRoZQo+ID4gPiA+ID4gZm9sbG93aW5nOgo+
ID4gPiA+ID4KPiA+ID4gPiA+IGNsay5wcmVwYXJlKCk7Cj4gPiA+ID4gPiBjbGsucHJlcGFyZSgp
Owo+ID4gPiA+ID4gY2xrLmVuYWJsZSgpOwo+ID4gPiA+ID4gY2xrLmVuYWJsZSgpOwo+ID4gPiA+
ID4KPiA+ID4gPiA+IEFuZCBub3RoaW5nIGdldHMgdW5kb25lIG9uIGRyb3AoKS4KPiA+ID4gPgo+
ID4gPiA+IElNSE8sIHdoYXQgd2UgaGF2ZSBoZXJlIGlzIGFuIGltcHJvdmVtZW50IHRoYXQgaGFz
IGJlZW4gbG9uZyBvdmVyZHVlLgo+ID4gPgo+ID4gPiBOb3RoaW5nIGlzIGFic29sdXRlLiBJdCBp
cyBpbmRlZWQgYW4gaW1wcm92ZW1lbnQgb24gdGhlIHJlZmNvdW50aW5nIHNpZGUKPiA+ID4gb2Yg
dGhpbmdzIGFuZCBnZW5lcmFsIHNhZmV0eSBvZiB0aGUgQVBJIGZvciB0aGUgZ2VuZXJhbCBjYXNl
LiBJIGRvbid0Cj4gPiA+IHRoaW5rIEkgZXZlciBxdWVzdGlvbm5lZCB0aGF0Lgo+ID4gPgo+ID4g
PiBIb3dldmVyLCBmb3IgdGhlIHVzZS1jYXNlcyB3ZSd2ZSBiZWVuIGRpc2N1c3NpbmcgKGFuZCBk
b3plbnMgb2YgZHJpdmVycwo+ID4gPiBpbXBsZW1lbnRpbmcgaXQpLCBpdCBhbHNvIGNvbWVzIHdp
dGggYSByZWdyZXNzaW9uIGluIHRoZSBhbW91bnQgb2YgY29kZQo+ID4gPiB0byBjcmVhdGUgYW5k
IG1haW50YWluLiBUaGV5IHVzZWQgdG8gYmUgYWJsZSB0byBvbmx5IGRlYWwgd2l0aCB0aGUgQ2xr
Cj4gPiA+IHN0cnVjdHVyZSwgYW5kIG5vdyB0aGV5IGNhbid0IGFueW1vcmUuCj4gPiA+Cj4gPiA+
IFlvdSBtaWdodCBmaW5kIHRoYXQgbmVnbGlibGUsIHlvdSBtaWdodCBoYXZlIGEgcGxhbiB0byBh
ZGRyZXNzIHRoYXQgaW4KPiA+ID4gdGhlIGZ1dHVyZSwgZXRjLiBhbmQgdGhhdCdzIGZpbmUsIGJ1
dCBpZiB5b3UgY2FuJ3QgYWNrbm93bGVkZ2UgdGhhdCBpdCdzCj4gPiA+IGluZGVlZCBoYXBwZW5p
bmcsIHRoZXJlJ3Mgbm8gcG9pbnQgaW4gbWUgcmFpc2luZyB0aGUgaXNzdWUgYW5kCj4gPiA+IGNv
bnRpbnVpbmcgdGhlIGRpc2N1c3Npb24uCj4gPgo+ID4KPiA+IE9rYXksIGxldCdzIHNlZSBpZiBJ
IGNhbiBzdW0tdXAgdGhlIHVzZSBjYXNlIHlvdSdkIGxpa2UgdG8gc3VwcG9ydC4gWW91Cj4gPiBo
YXZlIHNvbWUgUE0gaG9va3MsIHdoaWNoIEknbSBhc3N1bWluZyBhcmUgKG9yIHdpbGwgYmUpIHdy
aXR0ZW4gaW4KPiA+IHJ1c3QuIEl0IHdpbGwgcHJvYmFibHkgdGFrZSB0aGUgZm9ybSBvZiBzb21l
IERldmljZXtScG0sUG19IHRyYWl0IHRvCj4gPiBpbXBsZW1lbnQgZm9yIHlvdXIgWHh4RGV2aWNl
RGF0YSAoWHh4IGJlaW5nIHRoZSBidXMgdW5kZXIgd2hpY2ggaXMKPiA+IGRldmljZSBpcykgb2Jq
ZWN0IChzaW5jZSBJJ3ZlIG9ubHkgcmVjZW50bHkgam9pbmVkIHRoZSBSNEwgZWZmb3J0LCBJCj4g
PiB3b3VsZG4ndCBiZSBzdXJwcmlzZWQgaWYgd2hhdCBJJ20gZGVzY3JpYmluZyBhbHJlYWR5IGV4
aXN0cyBvciBpcwo+ID4gY3VycmVudGx5IGJlaW5nIHByb3Bvc2VkL3Jldmlld2VkIHNvbWV3aGVy
ZSwgc28gcGxlYXNlIGV4Y3VzZSBteQo+ID4gaWdub3JhbmNlIGlmIHRoYXQncyB0aGUgY2FzZSA6
LSkpLgo+ID4KPiA+IFRoZSB3YXkgSSBzZWUgaXQsIHJhdGhlciB0aGFuIGhhdmluZyBvbmUgZW51
bSBwZXIgY2xrL3JlZ3VsYXRvci94eHgKPiA+IHdoZXJlIHdlIGtlZXAgdHJhY2sgb2YgZWFjaCBz
dGF0ZSBpbmRpdmlkdWFsbHksIHdoYXQgd2UgY291bGQgaGF2ZSBpcyBhCj4gPgo+ID4gdHJhaXQg
RGV2aWNlUG0gewo+ID4gICAgICAgdHlwZSBSZXN1bWVkU3RhdGU7Cj4gPiAgICAgICB0eXBlIFN1
c3BlbmRlZFN0YXRlOwo+ID4KPiA+ICAgICAgIGZuIHJlc3VtZSgmc2VsZiwgc3RhdGU6IFN1c3Bl
bmRlZFN0YXRlKSAtPiBSZXN1bHQ8UmVzdW1lZFN0YXRlLCBFcnJvcjxTdXNwZW5kZWRTdGF0ZT4+
Owo+ID4gICAgICAgZm4gc3VzcGVuZCgmc2VsZiwgc3RhdGU6IFN1c3BlbmRlZFN0YXRlKSAtPiBS
ZXN1bHQ8U3VzcGVuZGVkU3RhdGUsIEVycm9yPFJlc3VtZWRTdGF0ZT4+Owo+ID4gfTsKPiA+Cj4g
PiBlbnVtIERldmljZVN0YXRlPFQ6IERldmljZVBtPiB7Cj4gPiAgICAgICBSZXN1bWVkKFQ6OlJl
c3VtZWRTdGF0ZSksCj4gPiAgICAgICBTdXNwZW5kZWQoVDo6U3VzcGVuZGVkU3RhdGUpLAo+ID4g
fTsKPiA+Cj4gPiBhbmQgdGhlbiBpbiB5b3VyIGRyaXZlcjoKPiA+Cj4gPiBNeVN1c3BlbmRlZERl
dmljZVJlc291cmNlcyB7Cj4gPiAgICAgICB4eHhfY2xrOiBDbGs8VW5wcmVwYXJlZD4sCj4gPiB9
Owo+ID4KPiA+IE15UmVzdW1lZERldmljZVJlc291cmNlcyB7Cj4gPiAgICAgICB4eHhfY2xrOiBD
bGs8RW5hYmxlZD4sCj4gPiB9Owo+ID4KPiA+IGltcGxlbSBEZXZpY2VQbSBmb3IgTXlEZXZpY2Ug
ewo+ID4gICAgICAgdHlwZSBSZXN1bWVkU3RhdGUgPSBNeVJlc3VtZWREZXZpY2VSZXNvdXJjZXM7
Cj4gPiAgICAgICB0eXBlIFN1c3BlbmRlZFN0YXRlID0gTXlTdXNwZW5kZWREZXZpY2VSZXNvdXJj
ZXM7Cj4gPgo+ID4gICAgICAgZm4gcmVzdW1lKCZzZWxmLCBzdGF0ZTogU3VzcGVuZGVkU3RhdGUp
IC0+IFJlc3VsdDxSZXN1bWVkU3RhdGUsIEVycm9yPFN1c3BlbmRlZFN0YXRlPj4gewo+ID4gICAg
ICAgICAgICAgICAvLyBGSVhNRTogZXJyb3IgcHJvcGFnYXRpb24gbm90IGhhbmRsZWQKPiA+ICAg
ICAgICAgICAgICAgbGV0IGVuYWJsZWRfY2xrID0gc3RhdGUueHh4X2Nsay5jbG9uZSgpLnByZXBh
cmUoKT8uZW5hYmxlKCk/Owo+ID4KPiA+ICAgICAgICAgICAgICAgT2soUmVzdW1lZFN0YXRlIHsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICB4eHhfY2xrOiBlbmFibGVkX2NsaywKPiA+ICAgICAg
ICAgICAgICAgfSk7Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgZm4gc3VzcGVuZCgmc2VsZiwg
c3RhdGU6IFJlc3VtZWRTdGF0ZSkgLT4gUmVzdWx0PFN1c3BlbmRlZFN0YXRlLCBFcnJvcjxSZXN1
bWVkU3RhdGU+PiB7Cj4gPiAgICAgICAgICAgICAgIC8vIEZJWE1FOiBlcnJvciBwcm9wYWdhdGlv
biBub3QgaGFuZGxlZAo+ID4gICAgICAgICAgICAgICBsZXQgdW5wcmVwX2NsayA9IHN0YXRlLnh4
eF9jbGsuY2xvbmUoKS5kaXNhYmxlKCkudW5wcmVwYXJlKCk7Cj4gPgo+ID4gICAgICAgICAgICAg
ICBPayhTdXNwZW5kZWRTdGF0ZSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgeHh4X2Nsazog
dW5wcmVwX2NsaywKPiA+ICAgICAgICAgICAgICAgfSk7Cj4gPiAgICAgICB9Cj4gPiB9Owo+Cj4g
SSdtIG5vdCBzdXJlIHdlIG5lZWQgdG8gYXNzb2NpYXRlIHRoaXMgd2l0aCB0aGUgc3VzcGVuZC9y
ZXN1bWUgc3RhdGUgZWl0aGVyLgo+Cj4gPiBXaXRoIHRoaXMgbW9kZWwsIEkgZG9uJ3QgdGhpbmsg
RGFuaWVsJ3MgcmVmYWN0b3IgZ29lcyBpbiB0aGUgd2F5IG9mIG1vcmUKPiA+IGdlbmVyYWxpemF0
aW9uIGF0IHRoZSBjb3JlIGxldmVsLCBpdCdzIGp1c3QgZXhwcmVzc2VkIGRpZmZlcmVudGx5IHRo
YW4KPiA+IGl0IHdvdWxkIGJlIGlmIGl0IHdhcyB3cml0dGVuIGluIEMuIEFuZCBJIHNheSB0aGF0
IGFzIHNvbWVvbmUgd2hvIHN0cnVnZ2xlcwo+ID4gd2l0aCBoaXMgQyBkZXZlbG9wZXIgYmlhcyBl
dmVyeSB0aW1lIEknbSBsb29raW5nIGF0IG9yIHRyeWluZyB0byB3cml0ZQo+ID4gcnVzdCBjb2Rl
Lgo+ID4KPiA+IEFzIG90aGVycyBoYXZlIHNhaWQgaW4gdGhpcyB0aHJlYWQgKERhbmlsbyBhbmQg
R2FyeSksIGFuZCBhZnRlciBoYXZpbmcKPiA+IHBsYXllZCBteXNlbGYgd2l0aCBib3RoIGFwcHJv
YWNoZXMgaW4gVHlyLCBJIGRvIHNlZSB0aGlzIHNoaWZ0IGZyb20gbWFudWFsCj4gPiBwcmVwYXJl
L2VuYWJsZSB0byBhbiBSQUlJIGFwcHJvYWNoIGFzIGFuIGltcHJvdmVtZW50LCBzbyBJIGhvcGUg
d2UgY2FuCj4gPiBmaW5kIGEgbWlkZGxlLWdyb3VuZCB3aGVyZSBldmVyeSBvbmUgaXMgaGFwcHku
Cj4KPiBJIGRvIHRoaW5rIHdlIGNhbiBmaW5kIGEgY29tcHJvbWlzZSB0aG91Z2guIE1pZ3VlbCBz
dWdnZXN0ZWQgZm9yIGV4YW1wbGUKPiB0byBtYWtlIHRoZSBjdXJyZW50IGVuYWJsZS9wcmVwYXJl
L2Rpc2FibGUvdW5wcmVwYXJlIGZ1bmN0aW9uIHVuc2FmZSwKPiBhbmQgdGhhdCdzIHRvdGFsbHkg
cmVhc29uYWJsZSB0byBtZS4KPgo+IFRoZW4gd2UgY2FuIGltcGxlbWVudCB0aGUgIm1hbmFnZWQi
IGNsb2NrIHZlcnNpb24gb24gdGhhdCB1bnNhZmUgQVBJLAo+IGFuZCB3ZSB3b3VsZCBlbmQgdXAg
d2l0aCBhICJyYXciLCB1bnNhZmUsIHZlcnNpb24ga2luZCBvZiBlcXVpdmFsZW50IHRvCj4gdGhl
IG9uZSB3ZSBoYXZlIHRvZGF5LCBhbmQgd2hlcmUgY2FsbGVycyB3b3VsZCBoYXZlIHRvIGp1c3Rp
Znkgd2h5IHRoZWlyCj4gdXNhZ2Ugb2YgdGhlIEFQSSBpcyBhY3R1YWxseSBzYWZlLCBvciB0aGUg
bmV3LCBtYW5hZ2VkLCB2YXJpYW50IHRoYXQgaXMKPiBzYWZlIGFuZCBjYW4gYmUgZWFzaWx5IHVz
ZWQgYnkgbW9zdCBkcml2ZXJzLgo+Cj4gQW5kIHdlIGNhbiBjYWxsIHRoZXNlIFJhd0NsayB2cyBD
bGssIG9yIENsayB2cyBNYW5hZ2VkQ2xrLCBvciB3aGF0ZXZlci4KPgo+IEhvdyBkb2VzIHRoYXQg
c291bmQ/CgpJZiB5b3UgbWFrZSB0aGUgcmF3IEFQSSB1bnNhZmUsIHRoZW4gdGhhdCdzIG9rYXkg
YnV0IGFueSB1c2Ugb2YgYW4KdW5zYWZlIEFQSSBmcm9tIGEgZHJpdmVyIHdpbGwgcmVjZWl2ZSB2
ZXJ5IGhhcmQgc2NydXRpbnkuIFllcywgdGhlcmUKYXJlIG9jY2FzaW9uYWxseSBnb29kIHJlYXNv
bnMgdG8gdXNlIHVuc2FmZSBmcm9tIGRyaXZlcnMsIGJ1dCB0aGUKZW50aXJlIHBvaW50IG9mIHRo
aXMgUnVzdCBleGVyY2lzZSBpcyB0byBpc29sYXRlIHVuc2FmZSBjb2RlIG91dHNpZGUKb2YgZHJp
dmVycyBhcyBtdWNoIGFzIHBvc3NpYmxlLgoKSWYgRGFuaWVsJ3MgcHJvcG9zYWwgaXMgaW5jb252
ZW5pZW50IGZvciBzb21lIGRyaXZlcnMsIGl0IHdvdWxkIGJlIGZhcgpiZXR0ZXIgdG8gaGF2ZSBh
IHRoaXJkIEFQSSB0aGF0IGlzIGJvdGggc2FmZSBhbmQgY29udmVuaWVudCBmb3IgdGhvc2UKZHJp
dmVycy4KCkFsaWNlCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
