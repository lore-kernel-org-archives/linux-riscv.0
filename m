Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60718C2A069
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jan 2026 02:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pHE7y3IEQx6mHog9NP5QVVwWl68yyr+SaKNmfOfNLvo=; b=O1LRuddenu55+7
	cUVSJCRZESwJS1ILoxHOjieRgWLU5nbRHjU19jPKLocCmM+w4Ley6axnVQLzySrmlkwuBfPjc0dyv
	ZqvisXscsNBZNGQt5D3XRkOPlUchsC7LmGR48Hu4twQu6jwLwQPzcGds6jAq+yVchMz+4akK8ZFxj
	7drzGtfOi/Iq0xqtk1KaWSqVtSEzOrgudpUjhTnasMHEH20G0c8vXO1PobExA0oo6NnfAOFEIjbIQ
	Ug7UM0DuiW7ZpK62qfvmpiidpZESupGhF2VnNvRUVnrBuFNSrOJ2XzLKpbO9ubb632CTSl3dAfQ8I
	VrH4uj9GKAVx3OZYO1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcDth-00000009xwz-186T;
	Sun, 04 Jan 2026 02:31:13 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcDte-00000009xwc-1EuQ
	for linux-riscv@lists.infradead.org;
	Sun, 04 Jan 2026 02:31:12 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5958931c9c7so14949611e87.2
        for <linux-riscv@lists.infradead.org>; Sat, 03 Jan 2026 18:31:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767493867; x=1768098667; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hsRWgvZP95DFqQgE5Dg/83eeX9dTEUkTAnlAVYh6kW4=;
        b=hEIbm3xlRlQ2EI3Re2Ao8n0bQfTRAenKPAl6dOlPNwnldIUdKiIFTnlxRUtycpM0lS
         GasCchUaDE1QhCAZKjYTQwm7ZxiFfGTnGYWeNDNTfApd8d/xyv4Xa3IoX8cy+Q1M9L+M
         7ILTDh60p7udhXdnDycDhqA6grEs5gv5IRVd8VpP3HDzcE9tgRGhc1p1Fv1MAcYRbe8q
         8exLPsltOBJs4BQjvXQNOpohzy9n9ISfTOsDtcMwf6509pY9H0DJv9QtrHUQdhPDjfHW
         zYtF/yyXYs7JxjEmtg6R+NSG4gdFjb2/9eIV+mP6Pu88pcqE+oV4STrAZ8Gh9IOlGhvb
         QlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767493867; x=1768098667;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hsRWgvZP95DFqQgE5Dg/83eeX9dTEUkTAnlAVYh6kW4=;
        b=OEnDlXnaKWOaSF+doheD9SsKAlMrdB8RsJCH+OJtUowmCJYoz1GQwjcn/mntSZXtkA
         l14MBBYeWyWeALtxi8N89DcJdDAcvZEegzwP5hdcnXVkwlJcpEgCYy8Yj0ZQuItb1aMV
         Ud8W3o3eiA9+Ya3+Wielh3UANaGibT+WxRJbHtQpHgqwTVGwDlUX5VuPvWFUEdh/z5YD
         +KxOjh8Htc/UdR98jSC7IXYS9+HJI2yNTbDrz+taWoIa+Vs5GnDG8Qxosi3ErFPkGGcT
         FbWylOctvlEae4PE7PWPumNJnAVARbkDvmD3910S3LJRH1Jr6L+NIAk/VrpzsFhbvMUL
         G4VQ==
X-Gm-Message-State: AOJu0YwWRQBHCn0qkv/jVqQBW8/mkDRCS4T2VRSPBBWahwnUPhOpUht8
	1oiD8ldwvSSyl+xtix4tWCy3SKSWXGFrjEnlIoR7BMDw3o4tbe9VNcoHKVKsix8cO/MooIhZypv
	pfxdW93xnHmuqcePBWXZrpucz5+CCMjU=
X-Gm-Gg: AY/fxX4SXfiwHIDfwdeQDL9XB1Yl7KGu955L1fVREqMENXxidSaYJJHvmxh5UBEfsyC
	MUgpwStNhkqEjG8JTEanwBRZdplDDe6FxCzKQLnQorxRSUmQped7cH9gZcl2YZMWZR36Yoqr6Be
	sjKHErqtn2eDi/JheVNsZ1s3fzSWUGB22pPJi+I4kcZygXtCqjQhrNQB4aaO7ZErFbIqBWXK9lD
	HVZTBG5HJ7q50vLpdaE/LBtS+K0WmV3I5gBpvxzyMQqjWXXb1Q5nh4+iWY/zilWfPHfuk/lSJ/b
	HrHd6OA6Y6qcsSnYLxRKhFXXs+10wUpWCMQGaevuqy9bm6hgfS7j7H3BqojlsdJvJ54r6SLqm0t
	j8H85rZUI2YmTfAaIfmSJom0pR2SrOBqfuuUjTE7Lrw==
X-Google-Smtp-Source: AGHT+IHCfWg304ZdWsohB+YD/N10Y1S3fIz7YcKtU4yVi6JuHY84X3Cvj0L0zoUQtCI/DmqwIRlf4bayHj2gTJG6s+o=
X-Received: by 2002:a05:6512:398c:b0:594:522d:68f4 with SMTP id
 2adb3069b0e04-59a17de2c1amr15711243e87.28.1767493867357; Sat, 03 Jan 2026
 18:31:07 -0800 (PST)
MIME-Version: 1.0
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
In-Reply-To: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Sat, 3 Jan 2026 21:30:31 -0500
X-Gm-Features: AQt7F2qNa6HgMSZbmev-xRE2S9e0Bs2mMObDhaf91cavhP-VhsbNAWN5nPUG0C8
Message-ID: <CAJ-ks9mrpcLaeiGjBcXNqTUwo00Y2MhhHWnWauou6exU1y920Q@mail.gmail.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260103_183110_940949_077C7075 
X-CRM114-Status: GOOD (  14.46  )
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

T24gTW9uLCBEZWMgMjIsIDIwMjUgYXQgNzoyNOKAr0FNIFRhbWlyIER1YmVyc3RlaW4gPHRhbWly
ZEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IFRhbWlyIER1YmVyc3RlaW4gPHRhbWlyZEBn
bWFpbC5jb20+Cj4KPiBDLVN0cmluZyBsaXRlcmFscyB3ZXJlIGFkZGVkIGluIFJ1c3QgMS43Ny4g
UmVwbGFjZSBpbnN0YW5jZXMgb2YKPiBga2VybmVsOjpjX3N0ciFgIHdpdGggQy1TdHJpbmcgbGl0
ZXJhbHMgd2hlcmUgcG9zc2libGUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBUYW1pciBEdWJlcnN0ZWlu
IDx0YW1pcmRAZ21haWwuY29tPgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd21fdGgxNTIwLnJzIHwg
MyArLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcHdtL3B3bV90aDE1MjAucnMgYi9kcml2ZXJzL3B3bS9w
d21fdGgxNTIwLnJzCj4gaW5kZXggZTNiN2U3NzM1NmZjLi44YWU4Zjg1MmVjMDIgMTAwNjQ0Cj4g
LS0tIGEvZHJpdmVycy9wd20vcHdtX3RoMTUyMC5ycwo+ICsrKyBiL2RyaXZlcnMvcHdtL3B3bV90
aDE1MjAucnMKPiBAQCAtMjIsNyArMjIsNiBAQAo+Cj4gIHVzZSBjb3JlOjpvcHM6OkRlcmVmOwo+
ICB1c2Uga2VybmVsOjp7Cj4gLSAgICBjX3N0ciwKPiAgICAgIGNsazo6Q2xrLAo+ICAgICAgZGV2
aWNlOjp7Qm91bmQsIENvcmUsIERldmljZX0sCj4gICAgICBkZXZyZXMsCj4gQEAgLTMyNyw3ICsz
MjYsNyBAQCBmbiBkcm9wKHNlbGY6IFBpbjwmbXV0IFNlbGY+KSB7Cj4gICAgICBPRl9UQUJMRSwK
PiAgICAgIE1PRFVMRV9PRl9UQUJMRSwKPiAgICAgIDxUaDE1MjBQd21QbGF0Zm9ybURyaXZlciBh
cyBwbGF0Zm9ybTo6RHJpdmVyPjo6SWRJbmZvLAo+IC0gICAgWyhvZjo6RGV2aWNlSWQ6Om5ldyhj
X3N0ciEoInRoZWFkLHRoMTUyMC1wd20iKSksICgpKV0KPiArICAgIFsob2Y6OkRldmljZUlkOjpu
ZXcoYyJ0aGVhZCx0aDE1MjAtcHdtIiksICgpKV0KPiAgKTsKPgo+ICBpbXBsIHBsYXRmb3JtOjpE
cml2ZXIgZm9yIFRoMTUyMFB3bVBsYXRmb3JtRHJpdmVyIHsKPgo+IC0tLQo+IGJhc2UtY29tbWl0
OiA4ZjBiNGNjZTQ0ODFmYjIyNjUzNjk3Y2NlZDhkMGQwNDAyN2NiMWU4Cj4gY2hhbmdlLWlkOiAy
MDI1MTIyMi1jc3RyLXB3bS1jOWI5YTQ3MDExNTcKPgo+IEJlc3QgcmVnYXJkcywKPiAtLQo+IFRh
bWlyIER1YmVyc3RlaW4gPHRhbWlyZEBnbWFpbC5jb20+Cj4KCkBVd2UgY291bGQgeW91IHBsZWFz
ZSBoYXZlIGEgbG9vaz8KCkNoZWVycy4KVGFtaXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
