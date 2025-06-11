Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6924C71136
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 17:59:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=juJwZakoomVaaPhYzfpZ9+hRM+r4XuVBeikypZV8rEI=; b=Wrw2/0i7DVBhKQ
	d3YC7AE9tRDYldfAD1uxYa4kxCuLV8hiqFD462a9hpthatdktScyIySvXnQVKtmjThKqmWNne1fay
	iif44P79JKUDcMkm2YqRzz3qyzgisszIRAHB18ypEVpL2sTr7Sdn3GVCNMBt2MnBYDalKFSdgj6CJ
	w6Mq8I++zquHjckQvmooBx2U8cUOZTvSOmxpWPOAmDYr7bYTZP6T1FRt6XKVI7MO7wLl7eSnOtojo
	4kMCfOhFsc3im4fntfnlWcWPBXzbtqlaAdRDrvCeRocXa1omECUD1zOZGkiEoOLCY6XPSX6Q5BRPr
	DEz+bDWqxgyKiJieFS7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPPjn-0000000Am0v-3yy2;
	Wed, 11 Jun 2025 17:59:47 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPLbp-00000009ya3-3XO4
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 13:35:19 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b26ed340399so21894a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 11 Jun 2025 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749648916; x=1750253716; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T7+YJEMDJ36thuIfANjb3mLZl0V1QkdkPulFRUlEhRc=;
        b=A5WA/J5L+XajFviEgSzqd9DX8lwXspm84Bg8jA6Z49wuYTwMuKWJe2zptJc6+vHy1t
         j2L/0+BDFfinQopSJcFfByrbfpF3waseR0fznkhtzb5nLwMik4kyJuAjUrOvOyQUEm/G
         rPNCv6IHNw9vAnzLixVculztB0K1oZQJZFNt+B46Ybi+yn4am3zhPLUneemQypAjgxD5
         QwpF6jjCkfLSdbP7COJ9oirdCqNnvVdq1FLqMbvI8fC1CbSyNujJqeswYRX4vEDwyS31
         Fx/tgC43GYieR82WrdxJLS5exumcpcRDIzMijBLdMT4GCsNJklkPz/gDcS2Ip3Q+P9e3
         a5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749648916; x=1750253716;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T7+YJEMDJ36thuIfANjb3mLZl0V1QkdkPulFRUlEhRc=;
        b=rYwVkra7HMcTznn0kXgS9ssIvYWY/nON+icknCFP91HYOyqfLAQ/52cm0xxcO6bpLr
         i7r24ZVzddnD4K8wtCz87Zbnk83uc437UKQ5wGI6LwM+48J/xVxJxHIahoEY9I5Xf62G
         Yf91fJY0v/oj6TSVXdFWpNOJaYCEOLU/Si/Dv5n8nMc0m8d7mPHGy7IZfjemND4sdlKU
         mt+KzHZ92OD1PaqMbilT3ygkWV24p19P3IYBr+ZvqJkSXI7rc7KB98z7VrSfR4nCReFn
         VkEjznFd8dFOxtk5bpx/Vrk0NUOJaafWUMjfe2PgCnme8OojQAS3p37H33wT11LBqv+W
         9WSg==
X-Forwarded-Encrypted: i=1; AJvYcCXLykQpGyLhL12dD6t25uBZWNn3dLLP1e8ecKdiBCuhdZDYi9+n6Iq7MVObxMhH9Y4aCX7hO+pvotmWhw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxOcpKKDOc7LFJ3jfG7123AbhMifoPDPaaPBepjAoCzgGJs3jN5
	lqZYWZqU1wT0izRjDo9//3TMvmQqMfEdkCBQETtX8h/z/XGH8MpCzG6N7k1js2zR6ySpjTlM48y
	ocuiVJ4YsX7A8GKghDqyl8+4fUR1IdhM=
X-Gm-Gg: ASbGncsl73MSmZKxtFWqtQTwc4M7OStGtGh+WmCXDLsg1qLlODmRPU/NRTchH8XAq0Z
	IsR3ToAZWVxQN6oywSIKPLt4IhchFSg//rMetPiCcAi+ImiC8MZ/aAyqkUPOBxyTVTDb2ta0QJ7
	j6CrqQFAZtLOMtaYsOJS1xNX22h/kr3mvuOe3tKTZpwKY=
X-Google-Smtp-Source: AGHT+IGbJpFZ+Qk6FvdsQn7PW78XJk+bb1d1PTP/d+zpCYzn/eIeprshnIC7HU+/be04GHkcxAD23HE18OQvHrvC4pg=
X-Received: by 2002:a17:90b:2f8b:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-313af1e1bfdmr2041537a91.5.1749648916482; Wed, 11 Jun 2025
 06:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250610125332eucas1p2da441aa44760236527afc82495af95d1@eucas1p2.samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-0-753e2955f110@samsung.com>
 <20250610-rust-next-pwm-working-fan-for-sending-v2-1-753e2955f110@samsung.com>
In-Reply-To: <20250610-rust-next-pwm-working-fan-for-sending-v2-1-753e2955f110@samsung.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 11 Jun 2025 15:35:04 +0200
X-Gm-Features: AX0GCFucCUfitmsrkVpmEkyboIYu-vqz9Ti13iybORi8Z5Q-FoT6_3kpjtnZoMo
Message-ID: <CANiq72mW2ZsBh8WxY26Knh=FxxPHWK_ikbS9iZip2qRLJAXiNg@mail.gmail.com>
Subject: Re: [PATCH v2 1/7] rust: Add basic PWM abstractions
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Drew Fustini <drew@pdp7.com>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Benno Lossin <lossin@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_063517_885026_21E44F5E 
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

SGkgTWljaGFsLAoKU29tZSBkb2NzLW9ubHkvbml0cyBxdWljayByZXZpZXcgZm9yIGZ1dHVyZSB2
ZXJzaW9ucyBhbmQgb3RoZXIKcGF0Y2hlcy4gU29tZSBtYXkgYXBwbHkgbXVsdGlwbGUgdGltZXMu
CgpPbiBUdWUsIEp1biAxMCwgMjAyNSBhdCAyOjU04oCvUE0gTWljaGFsIFdpbGN6eW5za2kKPG0u
d2lsY3p5bnNraUBzYW1zdW5nLmNvbT4gd3JvdGU6Cj4KPiArLy8hIFRoaXMgbW9kdWxlIHByb3Zp
ZGVzIHNhZmUgUnVzdCBhYnN0cmFjdGlvbnMgZm9yIHdvcmtpbmcgd2l0aCB0aGUgTGludXgKPiAr
Ly8hIGtlcm5lbCdzIFBXTSBzdWJzeXN0ZW0sIGxldmVyYWdpbmcgdHlwZXMgZ2VuZXJhdGVkIGJ5
IGBiaW5kZ2VuYAo+ICsvLyEgZnJvbSBgPGxpbnV4L3B3bS5oPmAgYW5kIGBkcml2ZXJzL3B3bS9j
b3JlLmNgLgoKVGhlIHNlY29uZCBwYXJ0IHdlIHR5cGljYWxseSBkbyB3aXRoIGEgIkMgaGVhZGVy
IiByZWZlcmVuY2UgdG8KYHNyY3RyZWUvLi4uYCB3aGljaCB3aWxsIGdldCByZW5kZXJlZCBhcyBj
bGlja2FibGUgbGluayB0byB0aGUgZmlsZQoocGxlYXNlIGNoZWNrIG90aGVyIGZpbGVzIHRvIHNl
ZSBob3cgaXQgaXMgdXN1YWxseSBkb25lKS4KCkkgd291bGQgYWxzbyBzaW1wbGlmeSwgZS5nLiB0
eXBpY2FsbHkgYWJzdHJhY3Rpb25zIHRyeSB0byBiZSBzYWZlLCBhbmQKdGhlIGJpbmRpbmdzIHR5
cGljYWxseSBjb21lIGZyb20gYGJpbmRnZW5gLCBzbyBJIHdvdWxkIGp1c3Qgc2F5IGUuZy4KCiAg
ICAvLyEgUFdNIHN1YnN5c3RlbSBhYnN0cmFjdGlvbnMuCiAgICAvLyEKICAgIC8vISBDIGhlYWRl
cjogLi4uCgpXaGF0IHR5cGVzIGFyZSB5b3UgdXNpbmcgZnJvbSBgZHJpdmVycy9wd20vY29yZS5j
YCwgYnkgdGhlIHdheT8KCj4gK3VzZSBjcmF0ZTo6ewo+ICsgICAgYmluZGluZ3MsCj4gKyAgICBk
ZXZpY2U6OntzZWxmLCBCb3VuZH0sCj4gKyAgICBlcnJvcjo6e3NlbGYsIHRvX3Jlc3VsdCwgUmVz
dWx0fSwKPiArICAgIHByZWx1ZGU6OiosCj4gKyAgICBzdHI6OkNTdHIsCj4gKyAgICB0eXBlczo6
e0FSZWYsIEFsd2F5c1JlZkNvdW50ZWQsIEZvcmVpZ25Pd25hYmxlLCBPcGFxdWV9LAo+ICt9OwoK
QXQgbGVhc3QgYSBjb3VwbGUgb2YgdGhlc2UgYWxyZWFkeSBjb21lIGZyb20gdGhlIHByZWx1ZGUu
Cgo+ICsvLy8gTWF4aW11bSBzaXplIGZvciB0aGUgaGFyZHdhcmUtc3BlY2lmaWMgd2F2ZWZvcm0g
cmVwcmVzZW50YXRpb24gYnVmZmVyLgo+ICsvLy8gRnJvbSBDOiAjZGVmaW5lIFdGSFdTSVpFIDIw
CgpUaGlzIHdvdWxkIGJlIHJlbmRlcmVkIGFzIGEgc2luZ2xlIHBhcmFncmFwaCwgc28gSSB3b3Vs
ZCBzcGxpdCBpdCBpbnRvCnR3byBieSBhZGRpbmcgYSBuZXdsaW5lIGluIGJldHdlZW4uCgpJbiBh
ZGRpdGlvbiwgcGxlYXNlIHVzZSBjb2RlIHNwYW5zIChpLmUuIGJhY2txdW90ZXMpIHdoZXJlIHBv
c3NpYmxlLgoKPiArLy8vIFBXTSBwb2xhcml0eS4gTWlycm9ycyBgZW51bSBwd21fcG9sYXJpdHlg
LgoKV2UgZG9uJ3QgbGluayBjb25zaXN0ZW50bHkgQyB0eXBlcywgYnV0IGlmIHlvdSB3YW50ZWQs
IHlvdSBjb3VsZCBsaW5rCnRoZW0gKGVpdGhlciBgc3JjdHJlZS9gIGxpbmsgdG8gYSBmaWxlIG9y
IGEgZG9jcy5rZXJuZWwub3JnIHRvIGEKY29uY3JldGUgQyBpdGVtIGlmIGl0IGlzIHJlbmRlcmVk
IHRoZXJlIC0tIGVpdGhlciBpcyBmaW5lKS4KCihFdmVudHVhbGx5IHdlIHdhbnQgdG8gaGF2ZSBh
biBhdXRvbWF0aWMgd2F5IHRvIGRvIHNvLCBzaW1pbGFyIHRvCmludHJhLWRvYyBsaW5rcykKCj4g
KyAgICAvLy8gTm9ybWFsIHBvbGFyaXR5IChkdXR5IGN5Y2xlIGRlZmluZXMgdGhlIGhpZ2ggcGVy
aW9kIG9mIHRoZSBzaWduYWwpCgpQbGVhc2UgZW5kIHNlbnRlbmNlcy9kb2NzIHdpdGggYSBwZXJp
b2QuCgo+ICsgICAgTm9ybWFsLAo+ICsgICAgLy8vIEludmVyc2VkIHBvbGFyaXR5IChkdXR5IGN5
Y2xlIGRlZmluZXMgdGhlIGxvdyBwZXJpb2Qgb2YgdGhlIHNpZ25hbCkKCkkgc3VnZ2VzdCBhIG5l
d2xpbmUgYmV0d2VlbiB0aGVzZS4KCj4gK2ltcGwgRnJvbTxiaW5kaW5nczo6cHdtX3BvbGFyaXR5
PiBmb3IgUG9sYXJpdHkgewo+ICsgICAgZm4gZnJvbShwb2xhcml0eTogYmluZGluZ3M6OnB3bV9w
b2xhcml0eSkgLT4gU2VsZiB7Cj4gKyAgICAgICAgbWF0Y2ggcG9sYXJpdHkgewo+ICsgICAgICAg
ICAgICBiaW5kaW5nczo6cHdtX3BvbGFyaXR5X1BXTV9QT0xBUklUWV9OT1JNQUwgPT4gUG9sYXJp
dHk6Ok5vcm1hbCwKPiArICAgICAgICAgICAgYmluZGluZ3M6OnB3bV9wb2xhcml0eV9QV01fUE9M
QVJJVFlfSU5WRVJTRUQgPT4gUG9sYXJpdHk6OkludmVyc2VkLAo+ICsgICAgICAgICAgICBfID0+
IFBvbGFyaXR5OjpOb3JtYWwsCj4gKyAgICAgICAgfQo+ICsgICAgfQo+ICt9CgpTaG91bGQgdGhp
cyBiZSBmYWxsaWJsZT8gaS5lLiBzaG91bGQgdGhlIGRlZmF1bHQgY2FzZSBiZSBhbiBlcnJvciAv
IGlzCnRoZSBDIGVudW0gZXhwZWN0ZWQgdG8gaGF2ZSBhbnkgb3RoZXIgdmFsdWUgPwoKKEkgaGF2
ZSBubyBjb250ZXh0LCBzbyB0aGlzIG1heSBiZSBhbGwgZXhwZWN0ZWQsIG9mIGNvdXJzZSkKCj4g
Ky8vLyBSZXByZXNlbnRzIGEgUFdNIHdhdmVmb3JtIGNvbmZpZ3VyYXRpb24uIE1pcnJvcnMgc3Ry
dWN0IHB3bV93YXZlZm9ybS4KCkNvZGUgc3Bhbi4KCj4gKyAgICAvLy8gRHVyYXRpb24gdGhlIFBX
TSBzaWduYWwgaXMgaW4gaXRzICJhY3RpdmUiIHN0YXRlIGR1cmluZyBvbmUgcGVyaW9kLAo+ICsg
ICAgLy8vIGluIG5hbm9zZWNvbmRzLiBGb3IgYSB0eXBpY2FsICJub3JtYWwiIHBvbGFyaXR5IGNv
bmZpZ3VyYXRpb24gd2hlcmUgYWN0aXZlIGlzIGhpZ2gsCj4gKyAgICAvLy8gdGhpcyByZXByZXNl
bnRzIHRoZSBoaWdoIHRpbWUgb2YgdGhlIHNpZ25hbC4KPiArICAgIHB1YiBkdXR5X2xlbmd0aF9u
czogdTY0LAoKVGhlIGZpcnN0IHBhcmFncmFwaCBvZiBhbiBpdGVtIGlzIHRoZSAic2hvcnQgZGVz
Y3JpcHRpb24iLCBpLmUuIGl0CmFjdHMgYXMgYSB0aXRsZSB3aGVuIGl0IGdldHMgcmVuZGVyZWQg
aW4gaXRlbSBsaXN0cy4gU28gaXQgc2hvdWxkIGJlCnNob3J0IGlmIHBvc3NpYmxlLiBGb3IgaW5z
dGFuY2UsIGhlcmUgSSB3b3VsZCBhZGQgYSBuZXcgcGFyYWdyYXBoCmJldHdlZW4gdGhlIHR3byBz
ZW50ZW5jZXMuCgooRGl0dG8gZm9yIG90aGVyIGNhc2VzKS4KCj4gKyAgICAvLy8gVGhpcyB0eXBl
IG11c3QgYmUgYENvcHlgLCBgRGVmYXVsdGAsIGFuZCBmaXQgd2l0aGluIGBXRkhXX01BWF9TSVpF
YC4KClBsZWFzZSB1c2UgaW50cmEtZG9jIGxpbmtzIHdoZXJldmVyIHBvc3NpYmxlLCBlLmcuIFtg
Q29weWBdIGFuZApbYFdGSFdfTUFYX1NJWkVgXSAoYXNzdW1pbmcgdGhleSB3b3JrKS4KCj4gKyAg
ICAvLy8gIyBTYWZldHkKPiArICAgIC8vLyBDLWNhbGxiYWNrLiBQb2ludGVycyBmcm9tIEMgbXVz
dCBiZSB2YWxpZC4KClBsZWFzZSBhZGQgYSBuZXdsaW5lIGJldHdlZW4gdGhlc2UgdG8gbWF0Y2gg
dGhlIHVzdWFsIHN0eWxlLiBBbHNvLAoiQy1jYWxsYmFjayIgaXMgbm90IGEgcHJlY29uZGl0aW9u
LCBzbyBJIHdvdWxkIG1vdmUgaXQgb3V0c2lkZSB0aGUKc2FmZXR5IHNlY3Rpb24gKGFib3ZlKSwg
dW5sZXNzIHlvdSB3YW50IHRvIHJlc3RyaWN0IEMgdG8gYmUgdGhlIG9ubHkKb25lIGNhbGxpbmcg
dGhpcyBvciB0aGluZ3MgbGlrZSB0aGF0IChpbiB3aGljaCBjYXNlIEkgd291bGQgY2xhcmlmeSku
Cgo+ICsgICAgdW5zYWZlIGV4dGVybiAiQyIgZm4gcmVhZF93YXZlZm9ybV9jYWxsYmFjaygKPiAr
ICAgICAgICBjOiAqbXV0IGJpbmRpbmdzOjpwd21fY2hpcCwKPiArICAgICAgICBwOiAqbXV0IGJp
bmRpbmdzOjpwd21fZGV2aWNlLAo+ICsgICAgICAgIHdoOiAqbXV0IGNvcmU6OmZmaTo6Y192b2lk
LAoKUGxlYXNlIGF2b2lkIGBjb3JlOjpmZmk6OmAgLS0gbm93YWRheXMgeW91IHNob3VsZCBiZSBh
YmxlIHRvIGp1c3QKd3JpdGUgZS5nLiBgY192b2lkYCwgYW5kIHRoYXQgd2lsbCBnZXQgeW91IHRo
ZSBga2VybmVsOjpmZmk6OmAgb25lCihodHRwczovL2RvY3Mua2VybmVsLm9yZy9ydXN0L2NvZGlu
Zy1ndWlkZWxpbmVzLmh0bWwjYy1mZmktdHlwZXMpLgoKPiArICAgICkgLT4gaTMyIHsKClVubGVz
cyB0aGUgQyBzaWRlIHVzZXMgYW4gZXhwbGljaXRseSBgczMyYCwgd2hpY2ggYXMgZmFyIGFzIEkg
Y2FuIHNlZQppdCBkb2Vzbid0IGluIHRoaXMgY2FzZSwgcGxlYXNlIHVzZSBgY19pbnRgIGluc3Rl
YWQgKGkuZS4gcGxlYXNlIG1hdGNoCnRoZSBDIHNpZ25hdHVyZXMgaW4gY2FsbGJhY2tzLCBldmVu
IGlmIHRoZXkgaGFwcGVuIHRvIHJlc29sdmUgdG8gdGhhdAp0eXBlKS4KCkZpbmFsbHksIGluIGFu
b3RoZXIgcGF0Y2ggSSBub3RpY2VkIHRoZSBgYXV0aG9yYCBrZXkgLS0gd2UgYXJlIHRyeWluZwp0
byBtb3ZlIHRvIHRoZSBgYXV0aG9yc2AgKHBsdXJhbCkgb25lLCBzbyBwbGVhc2UgdXNlIHRoYXQg
b25lLgoKVGhhbmtzIQoKQ2hlZXJzLApNaWd1ZWwKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
