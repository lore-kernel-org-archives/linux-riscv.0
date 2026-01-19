Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C08DCCF2EF
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 12:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7lGIonE0g4fe5WFFt3XNYq43LImtxAZCHY3iHXbkBAo=; b=4+IKAHA5cw8fWEC70ObxzDYYK3
	vQ7XPoNFcC4TZlTqHhi7vuCay7t/MAw/ooZonbKiP8Fpl+BsjD/ZDLDWXY+Pj5g4XZIORLVDKusQa
	ngfv1wICKoDdcxsknL5Ujvwgjj/X5iuypTRT9A2W8FD6Wl9q2aakwHDwcNB4g87rEi756J+deV01H
	mwQlaEfxOQlDOrfLw8dAVz1OwQA1OlsyAgVNDPufzC3yoyKO1EDlXoch0DqbG5E7a2BHPVVGDf1OZ
	g23GoVVX8h3nMs7h1h5U5NXlvzXww49GIXu0lXYWdWFWOkJfzMjUojikVDpK+edFrBpVjMp2V1kO0
	Opk6sOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoUB-000000021Zt-2g7g;
	Mon, 19 Jan 2026 12:35:59 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhoTs-000000021Of-1JxK
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 12:35:53 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-4803b4e3b9eso1151555e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 04:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768826123; x=1769430923; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L339R8Vsk/eWURHJ0AqPSpw3w1NFXPchbsihcVaLjUM=;
        b=USp9h12vRT/+J1jeDlwFQ9J3m/JDh1bfJ1XQymzht7Zwd3giJXhW5s7Mby2D0nFj2E
         VVfiti0ii/17I1VzNt9r97wtNu5Xv9kW7rNlZ6KiOo8VGxOBl/JA051uN/MpAf1/N/71
         rV/BlXcS8SJb2tLyorykgsA19wTxzDdkDhqJ8MBSqtrqh/6WccB6Wep/L2A+GCOubtRv
         5ttXUZWJ5ScprWZmLaKgXwDCDc9dlpcl+5d659/fxO6bCIqZMb9S6otL6mlqgUo30fvw
         pfbps1a9z8zhXBUpKVhu3yD7oQNJEMylkzKcrFw8h7KvmhIs8+V3xCwaHW6dptg/wxHL
         XEXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768826123; x=1769430923;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L339R8Vsk/eWURHJ0AqPSpw3w1NFXPchbsihcVaLjUM=;
        b=TKIxJLWHkrrw+YcszrhPNG5E9q0KhzoKlyrH8Bt/dd5TslMD7fryiWswcvk90wQqmy
         rRfntojpb7Ep+BQzcGIWdT+mPsfM06aRF8da1w7SMq/hO4JHc+PWrSqj3C43WpT06B0G
         q/DkiChh/93YSyhooEuP6oI4f6ON3z/rImU6zfi28Ndjj52VelzzlbcPO8Ys86QHuQXV
         ALZ8YzaRiJGJkcRbXQ0LhpoC3J3G82Hbb3YidOFVJ01WM4E+JvG11YEn62qp9GraQIsr
         tBVN1ZTZZlIzQ7OyU2sj21dLsvuJ5XYmv+HxdsCTOABmFOLTzNWXc5L808JnoyJPopae
         ZqPg==
X-Forwarded-Encrypted: i=1; AJvYcCV6MCt3RVICVrSk2NM3oH4dQYeQQgQmCMEQNZCfuCDfPTLaQ9CWxTPJEJFIRVFDTsyQnJ7UiEvpcyX+dA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1ZwDqoOMwm6n2eGilqa77jwX/5M9u7LQqPrwQrNJhO3jilI2N
	Px90dDNI+tAfBnxg4hZJmcT76y76QYH3jR3YHI54MRql548JnN/ZvJ8iO1n1stPohjLn2Wbt82R
	7tf955ACNiDEqUXK9Qw==
X-Received: from wmbh20.prod.google.com ([2002:a05:600c:a114:b0:47d:586e:2b7b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:811a:b0:480:1dc6:2686 with SMTP id 5b1f17b1804b1-4801eac0cfcmr114218055e9.13.1768826122871;
 Mon, 19 Jan 2026 04:35:22 -0800 (PST)
Date: Mon, 19 Jan 2026 12:35:21 +0000
In-Reply-To: <20260119-thundering-tested-robin-4be817@houat>
Mime-Version: 1.0
References: <20260107-clk-type-state-v3-0-77d3e3ee59c2@collabora.com>
 <20260107-clk-type-state-v3-1-77d3e3ee59c2@collabora.com> <20260108-delectable-fennec-of-sunshine-ffca19@houat>
 <98CD0BF6-3350-40B9-B8A9-F569AE3E3220@collabora.com> <20260119-thundering-tested-robin-4be817@houat>
Message-ID: <aW4lCfUyumOKRRJm@google.com>
Subject: Re: [PATCH v3 1/3] rust: clk: use the type-state pattern
From: Alice Ryhl <aliceryhl@google.com>
To: Maxime Ripard <mripard@kernel.org>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Danilo Krummrich <dakr@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	"Uwe =?utf-8?Q?Kleine-K=C3=B6nig?=" <ukleinek@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_043540_727630_4308FC23 
X-CRM114-Status: GOOD (  34.32  )
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

T24gTW9uLCBKYW4gMTksIDIwMjYgYXQgMTE6NDU6NTdBTSArMDEwMCwgTWF4aW1lIFJpcGFyZCB3
cm90ZToKPiBPbiBUaHUsIEphbiAwOCwgMjAyNiBhdCAxMToxNDozN0FNIC0wMzAwLCBEYW5pZWwg
QWxtZWlkYSB3cm90ZToKPiA+ID4gRm9yIGV4YW1wbGUsIGl0J3MgcXVpdGUgdHlwaWNhbCB0byBo
YXZlIChhdCBsZWFzdCkgb25lIGNsb2NrIGZvciB0aGUgYnVzCj4gPiA+IGludGVyZmFjZSB0aGF0
IGRyaXZlcyB0aGUgcmVnaXN0ZXIsIGFuZCBvbmUgdGhhdCBkcml2ZXMgdGhlIG1haW4KPiA+ID4g
Y29tcG9uZW50IGxvZ2ljLiBUaGUgZm9ybWVyIG5lZWRzIHRvIGJlIGVuYWJsZWQgb25seSB3aGVu
IHlvdSdyZQo+ID4gPiBhY2Nlc3NpbmcgdGhlIHJlZ2lzdGVycyAoYW5kIGNhbiBiZSBhYnN0cmFj
dGVkIHdpdGgKPiA+ID4gcmVnbWFwX21taW9fYXR0YWNoX2NsayBmb3IgZXhhbXBsZSksIGFuZCB0
aGUgbGF0dGVyIG5lZWRzIHRvIGJlIGVuYWJsZWQKPiA+ID4gb25seSB3aGVuIHRoZSBkZXZpY2Ug
YWN0dWFsbHkgc3RhcnRzIG9wZXJhdGluZy4KPiA+ID4gCj4gPiA+IFlvdSBoYXZlIGEgc2ltaWxh
ciB0aGluZyBmb3IgdGhlIHByZXBhcmUgdnMgZW5hYmxlIHRoaW5nLiBUaGUgZGlmZmVyZW5jZQo+
ID4gPiBiZXR3ZWVuIHRoZSB0d28gaXMgdGhhdCBlbmFibGUgY2FuIGJlIGNhbGxlZCBpbnRvIGF0
b21pYyBjb250ZXh0IGJ1dAo+ID4gPiBwcmVwYXJlIGNhbid0Lgo+ID4gPiAKPiA+ID4gU28gZm9y
IGRyaXZlcnMgdGhhdCB3b3VsZCBjYXJlIGFib3V0IHRoaXMsIHlvdSB3b3VsZCBjcmVhdGUgeW91
ciBkZXZpY2UKPiA+ID4gd2l0aCBhbiB1bnByZXBhcmVkIGNsb2NrLCBhbmQgdGhlbiBhdCB2YXJp
b3VzIHRpbWVzIGR1cmluZyB0aGUgZHJpdmVyCj4gPiA+IGxpZmV0aW1lLCB5b3Ugd291bGQgbXV0
YXRlIHRoYXQgc3RhdGUuCgpUaGUgY2FzZSB3aGVyZSB5b3UncmUgZG9pbmcgaXQgb25seSB3aGls
ZSBhY2Nlc3NpbmcgcmVnaXN0ZXJzIGlzCmludGVyZXN0aW5nLCBiZWNhdXNlIHRoYXQgbWVhbnMg
dGhlIEVuYWJsZSBiaXQgbWF5IGJlIG93bmVkIGJ5IGEgbG9jYWwKdmFyaWFibGUuIFdlIG1heSBp
bWFnaW5lIGFuOgoKICAgIGxldCBlbmFibGVkID0gc2VsZi5wcmVwYXJlZF9jbGsuZW5hYmxlX3Nj
b3BlZCgpOwogICAgLi4uIHVzZSByZWdpc3RlcnMKICAgIGRyb3AoZW5hYmxlZCk7CgpOb3cgLi4u
IHRoaXMgZG9lc24ndCBxdWl0ZSB3b3JrIHdpdGggdGhlIGN1cnJlbnQgQVBJIC0gdGhlIGN1cnJl
bnQKRW5hYmxlZCBzdGF0ZWQgb3ducyBib3RoIGEgcHJlcGFyZSBhbmQgZW5hYmxlIGNvdW50LCBi
dXQgdGhlIGFib3ZlIGtlZXBzCnRoZSBwcmVwYXJlIGNvdW50IGluIGBzZWxmYCBhbmQgdGhlIGVu
YWJsZWQgY291bnQgaW4gYSBsb2NhbCB2YXJpYWJsZS4KQnV0IGl0IGNvdWxkIGJlIGRvbmUgd2l0
aCBhIGZvdXJ0aCBzdGF0ZSwgb3IgYnkgYSBjbG9zdXJlIG1ldGhvZDoKCiAgICBzZWxmLnByZXBh
cmVkX2Nsay53aXRoX2VuYWJsZWQofHwgewogICAgICAgIC4uLiB1c2UgcmVnaXN0ZXJzCiAgICB9
KTsKCkFsbCBvZiB0aGlzIHdvdWxkIHdvcmsgd2l0aCBhbiBpbW11dGFibGUgdmFyaWFibGUgb2Yg
dHlwZSBDbGs8UHJlcGFyZWQ+LgoKPiA+ID4gQUZBSVUsIGVuY29kaW5nIHRoZSBzdGF0ZSBvZiB0
aGUgY2xvY2sgaW50byB0aGUgQ2xrIHR5cGUgKGFuZCB0aHVzCj4gPiA+IGZvcmNpbmcgdGhlIHN0
cnVjdHVyZSB0aGF0IGhvbGRzIGl0KSBwcmV2ZW50cyB0aGF0IG11dGF0aW9uLiBJZiBub3QsIHdl
Cj4gPiA+IHNob3VsZCBtYWtlIGl0IGNsZWFyZXIgKGJ5IGV4cGFuZGluZyB0aGUgZG9jIG1heWJl
PykgaG93IHN1Y2ggYSBwYXR0ZXJuCj4gPiA+IGNhbiBiZSBzdXBwb3J0ZWQuCj4gPiA+IAo+ID4g
PiBNYXhpbWUKPiA+IAo+ID4gSUlVQywgeW91ciBtYWluIHBvaW50IHNlZW1zIHRvIGJlIGFib3V0
IG11dGF0aW5nIHRoZSBzdGF0ZSBhdCBydW50aW1lPyBUaGlzIGlzCj4gPiBwb3NzaWJsZSB3aXRo
IHRoaXMgY29kZS4gWW91IGNhbiBqdXN0IGhhdmUgYW4gZW51bSwgZm9yIGV4YW1wbGU6Cj4gPiAK
PiA+IGVudW0gTXlDbG9ja3Mgewo+ID4gICAgIFVucHJlcGFyZWQoQ2xrPFVucHJlcGFyZWQ+KSwK
PiA+ICAgICBQcmVwYXJlZChDbGs8UHJlcGFyZWQ+KSwKPiA+ICAgICBFbmFibGVkKENsazxFbmFi
bGVkPiksIAo+ID4gfQoKSSBiZWxpZXZlIHlvdSBuZWVkIGFuIGV4dHJhIHN0YXRlIGlmIHRoZSBz
dGF0ZSBpcyBub3QgYm91bmQgdG8gdGhlIHNjb3BlCm9mIGEgZnVuY3Rpb246CgplbnVtIE15Q2xv
Y2tzIHsKICAgIFVucHJlcGFyZWQoQ2xrPFVucHJlcGFyZWQ+KSwKICAgIFByZXBhcmVkKENsazxQ
cmVwYXJlZD4pLAogICAgRW5hYmxlZChDbGs8RW5hYmxlZD4pLCAKICAgIFRyYW5zaXRpb25pbmcs
Cn0KCnNpbmNlIG1lbTo6cmVwbGFjZSgpIG5lZWRzIGEgbmV3IHZhbHVlIGJlZm9yZSB5b3UgY2Fu
IHRha2Ugb3duZXJzaGlwIG9mCnRoZSBleGlzdGluZyBDbGsgdmFsdWUuCgo+ID4gSW4gZmFjdCwg
SSBzcGVjaWZpY2FsbHkgd2FudGVkIHRvIGVuc3VyZSB0aGF0IHRoaXMgd2FzIHBvc3NpYmxlIHdo
ZW4gd3JpdGluZwo+ID4gdGhlc2UgcGF0Y2hlcywgYXMgaXTigJlzIG5lZWRlZCBieSBkcml2ZXJz
LiBJZiB5b3Ugd2FudCB0bywgSSBjYW4gY292ZXIgdGhhdCBpbgo+ID4gdGhlIGV4YW1wbGVzLCBu
byB3b3JyaWVzLgo+IAo+IFllcywgdGhhdCB3b3VsZCBiZSBncmVhdC4gSSBkbyB3b25kZXIgdGhv
dWdoIGlmIGl0IHdvdWxkbid0IG1ha2Ugc2Vuc2UKPiB0byB0dXJuIGl0IHRoZSBvdGhlciB3YXkg
YXJvdW5kLiBJdCBjcmVhdGVzIGEgZmFpciBzaGFyZSBvZiBib2lsZXJwbGF0ZQo+IGZvciBhIG51
bWJlciBvZiBkcml2ZXJzLiBDYW4ndCB3ZSBrZWVwIENsayB0aGUgd2F5IGl0IGlzIGFzIGEKPiBs
b3dlci1sZXZlbCB0eXBlLCBhbmQgY3JhdGUgYSBNYW5hZ2VkQ2xrIChvciB3aGF0ZXZlciBuYW1l
IHlvdSBwcmVmZXIpCj4gdGhhdCBkcml2ZXJzIGNhbiB1c2UsIGFuZCB3b3VsZCBiZSByZXR1cm5l
ZCBieSBoaWdoZXItbGV2ZWwgaGVscGVycywgaWYKPiB0aGV5IHNvIGNob29zZT8KPiAKPiBUaGF0
IHdheSwgd2UgZG8gaGF2ZSB0aGUgdHlwZXN0YXRlIEFQSSBmb3Igd2hvZXZlciB3YW50cyB0bywg
d2l0aG91dAo+IGNyZWF0aW5nIHRvbyBtdWNoIGJvaWxlcnBsYXRlIGZvciBldmVyeWJvZHkgZWxz
ZS4KCkkgdGhpbmsgdGhhdCBpZiB5b3Ugc3RpbGwgd2FudCBhbiBBUEkgd2hlcmUgeW91IGp1c3Qg
Y2FsbCBlbmFibGUvZGlzYWJsZQpkaXJlY3RseSBvbiBpdCB3aXRoIG5vIHByb3RlY3Rpb24gYWdh
aW5zdCB1bmJhbGFuY2VkIGNhbGxzLCB0aGVuIHRoYXQKc2hvdWxkIGJlIHRoZSBzcGVjaWFsIEFQ
SS4gUHJvYmFibHkgY2FsbGVkIFJhd0NsayBhbmQgZnVuY3Rpb25zIG1hcmtlZAp1bnNhZmUuIFVu
YmFsYW5jZWQgY2FsbHMgc2VlbSByZWFsbHkgZGFuZ2Vyb3VzIGFuZCB1c2Ugc2hvdWxkIG5vdCBi
ZQplbmNvdXJhZ2VkLgoKVGhlIGN1cnJlbnQgdHlwZS1zdGF0ZSBiYXNlZCBBUEkgaXMgdGhlIGxl
YXN0LWJvaWxlcnBsYXRlIG9wdGlvbiBmb3IKZHJpdmVycyB0aGF0IGV4aXN0IHRvZGF5LgoKQWxp
Y2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
