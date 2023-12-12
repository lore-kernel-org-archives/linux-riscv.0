Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274CBC41535
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 08:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lS7Qoz/ri2BlnjiO1GvnlnmI7XI+/bpu4GZTfz6caMw=; b=a5puu8CC5A6ukQ
	BSgsg1dXs7liMsh15nhpjkO0kRzWHxdSDpYRsfgxEOA2U1dbipJgB9CqqBPe6DrXcqYr4qwimzMGE
	PPgzuo1CPcdCc4qRty/Rl779tqLnr5m182gavHanjUqOYUSBvFB46wvObLCJZwwfWLHrKGrO1sCBi
	wGgumGP5OyA04pbfUm5tszKjt3rXUiQbWf7IpfyhKZ6B+/sbX3Jyyc61zVv2/CZLp0dMYPASWm7Dr
	hhk/c7uhzUxtVnM/6tY+ViDZ4gdAEgK6VcDVJtNLeMuDkzs9qcX8eNvG2rLnErE2PXeCqkhHZR64B
	ymmEkclO9ldoPEUzKz/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxhw-00AzMp-1e;
	Tue, 12 Dec 2023 08:01:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCxhs-00AzJy-0l
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 08:01:34 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c3f68b69aso27384465e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 12 Dec 2023 00:01:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702368088; x=1702972888; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LeYaPkYZV1gUI785r4n26WvSzflCnVMfe7xejKrvhGw=;
        b=bzyO0RmIGmzaAkhlL0fxzIuRb1zyR1+GeCGcAAh8oHW/oLb8rV0DJyVD0+MeYum6b4
         0sX4/I+F7kWyqlBdYn0IB6VWkm2H6/QoDJf5LI2f2rWLoSbneQAdECNoovPhxSSScQaK
         1p7CRoxcfRK84CHh4JZuGXXvsHGHrIMl4pIrxU+d9AVuuLnu89rcIAS+3KV9ZVdv13jU
         Y+FzIPDG81jmADZyt86iflIUrlFz7Wfa/9DnUaok8pbGGxsevsPeWs5Gw4YjjqMVpSLX
         0KoYBwl/zpG9RHvMBMsayX5jb6kobAhD/5ojVU56sA8U5mKCP18WPsKuHx//k976/6zE
         uV2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368088; x=1702972888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LeYaPkYZV1gUI785r4n26WvSzflCnVMfe7xejKrvhGw=;
        b=nrNkWKBxz9XWjRM8QlUBIpPBLT2LRSQMfMpEWE6u5uGuVCziAPRvAmKJmkpZnMu2uF
         CuO5AyXchynjUCJZPkERCygI9yVu0lvbq365MypHBszClUj0MmJNzXmWRkMadd6BfSae
         opnwTpD+39Fl7cjdXUaFjdhAfuIvHRH5WtNS6GXgS1Y5Gl3H/NcWGYlH7IrdFITmOdo3
         qFAxb1gGyvqBH5y0qQ1N4eH934PnC4rh+PLw9/izRI+5FP9tMlrUpqrJSyFidczYU0S/
         Z9c/f/S37MmNwV99VNndO4a1PRDnKr+MBq6rgrwoCgTUEToPOx09ElXZXccUu1c8c9gY
         YFPQ==
X-Gm-Message-State: AOJu0YxCjXZ+1VpEkdfgBSD8sw6bgo9Ux8wY4ZDLSybbK1nq3TwGRQf+
	g08lp3xVxVSns0unXboTPRjmvh1ywkCgtXtcsq9SbQ==
X-Google-Smtp-Source: AGHT+IFthsZWcAFKZ2O87HfQ853PVDauwWiX60VS5xQ0+k/2Rm3ww0q4uXdZGsXn0wGM3e/0uXgR2LhRggD6zLr6gKo=
X-Received: by 2002:a05:600c:3093:b0:40c:2b93:6a08 with SMTP id
 g19-20020a05600c309300b0040c2b936a08mr3205498wmn.16.1702368087940; Tue, 12
 Dec 2023 00:01:27 -0800 (PST)
MIME-Version: 1.0
References: <20231211172504.058ad6b6@canb.auug.org.au> <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
In-Reply-To: <9f0763c0-8175-4160-b72e-8e9e3aee42f8@infradead.org>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Tue, 12 Dec 2023 09:01:17 +0100
Message-ID: <CAHVXubjbVxEvL01uu_Cm-_R8oLddwc6fUaQYE_Bc+sBThTmvWA@mail.gmail.com>
Subject: Re: linux-next: Tree for Dec 11 (riscv32: patch.c)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_000132_277428_5A60FA24 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

SGkgUmFuZHksCgpPbiBNb24sIERlYyAxMSwgMjAyMyBhdCAxMDoxN+KAr1BNIFJhbmR5IER1bmxh
cCA8cmR1bmxhcEBpbmZyYWRlYWQub3JnPiB3cm90ZToKPgo+Cj4KPiBPbiAxMi8xMC8yMyAyMjoy
NSwgU3RlcGhlbiBSb3Rod2VsbCB3cm90ZToKPiA+IEhpIGFsbCwKPiA+Cj4gPiBDaGFuZ2VzIHNp
bmNlIDIwMjMxMjA4Ogo+ID4KPgo+IG9uIHJpc2N2MzI6Cj4KPiAvb3B0L2Nyb3NzdG9vbC9nY2Mt
MTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNoL3Jp
c2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5jdGlvbiBgLkw0JzoKPiBwYXRjaC5jOigudGV4dCsw
eGJlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9iZWdpbicKPiAvb3B0L2Ny
b3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4
LWxkOiBwYXRjaC5jOigudGV4dCsweGMyKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0
dGV4dF9iZWdpbicKPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxp
bnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBhcmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBm
dW5jdGlvbiBgLkwxMic6Cj4gcGF0Y2guYzooLnRleHQrMHhkMik6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJj
L3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBhdGNoLmM6KC50ZXh0KzB4ZDYp
OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2VuZCcKPiAvb3B0L2Nyb3NzdG9v
bC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBh
cmNoL3Jpc2N2L2tlcm5lbC9wYXRjaC5vOiBpbiBmdW5jdGlvbiBgLkwxNSc6Cj4gcGF0Y2guYzoo
LnRleHQrMHgxZWEpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2JlZ2luJwo+
IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2
MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDcn
Ogo+IHBhdGNoLmM6KC50ZXh0KzB4MWVlKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19leGl0
dGV4dF9iZWdpbicKPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxp
bnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBwYXRjaC5jOigudGV4dCsweDFmZSk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4y
LjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yv
a2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDIyJzoKPiBwYXRjaC5jOigudGV4dCsweDIw
Mik6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfZW5kJwo+IC9vcHQvY3Jvc3N0
b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6
IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGBfX3BhdGNoX2luc25fd3Jp
dGUnOgo+IHBhdGNoLmM6KC50ZXh0KzB4NDEwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgX19l
eGl0dGV4dF9iZWdpbicKPiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMy
LWxpbnV4L2Jpbi9yaXNjdjMyLWxpbnV4LWxkOiBwYXRjaC5jOigudGV4dCsweDQxNCk6IHVuZGVm
aW5lZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfYmVnaW4nCj4gL29wdC9jcm9zc3Rvb2wvZ2Nj
LTEzLjIuMC1ub2xpYmMvcmlzY3YzMi1saW51eC9iaW4vcmlzY3YzMi1saW51eC1sZDogcGF0Y2gu
YzooLnRleHQrMHg0MjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2VuZCcK
PiAvb3B0L2Nyb3NzdG9vbC9nY2MtMTMuMi4wLW5vbGliYy9yaXNjdjMyLWxpbnV4L2Jpbi9yaXNj
djMyLWxpbnV4LWxkOiBwYXRjaC5jOigudGV4dCsweDQyOCk6IHVuZGVmaW5lZCByZWZlcmVuY2Ug
dG8gYF9fZXhpdHRleHRfZW5kJwo+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jp
c2N2MzItbGludXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNo
Lm86IGluIGZ1bmN0aW9uIGAuTDQ2JzoKPiBwYXRjaC5jOigudGV4dCsweDUzYyk6IHVuZGVmaW5l
ZCByZWZlcmVuY2UgdG8gYF9fZXhpdHRleHRfYmVnaW4nCj4gL29wdC9jcm9zc3Rvb2wvZ2NjLTEz
LjIuMC1ub2xpYmMvcmlzY3YzMi1saW51eC9iaW4vcmlzY3YzMi1saW51eC1sZDogcGF0Y2guYzoo
LnRleHQrMHg1NDApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX2V4aXR0ZXh0X2JlZ2luJwo+
IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGludXgvYmluL3Jpc2N2
MzItbGludXgtbGQ6IGFyY2gvcmlzY3Yva2VybmVsL3BhdGNoLm86IGluIGZ1bmN0aW9uIGAuTDQ4
JzoKPiBwYXRjaC5jOigudGV4dCsweDU1MCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fZXhp
dHRleHRfZW5kJwo+IC9vcHQvY3Jvc3N0b29sL2djYy0xMy4yLjAtbm9saWJjL3Jpc2N2MzItbGlu
dXgvYmluL3Jpc2N2MzItbGludXgtbGQ6IHBhdGNoLmM6KC50ZXh0KzB4NTU0KTogdW5kZWZpbmVk
IHJlZmVyZW5jZSB0byBgX19leGl0dGV4dF9lbmQnCj4KPgo+IEZ1bGwgcmFuZGNvbmZpZyBmaWxl
IGlzIGF0dGFjaGVkLgoKV2UgY2FuIGlnbm9yZSB0aGlzIG9uZSBhcyBDT05GSUdfWElQIGlzIGVu
YWJsZWQgYW5kIHdlIGFncmVlZCBhdCBMUEMKdGhhdCBJJ2xsIHJlbW92ZSB0aGlzIHNvb24uCgpU
aGFua3MsCgpBbGV4Cgo+Cj4gLS0KPiAjUmFuZHkKPiBodHRwczovL3Blb3BsZS5rZXJuZWwub3Jn
L3RnbHgvbm90ZXMtYWJvdXQtbmV0aXF1ZXR0ZQo+IGh0dHBzOi8vc3Vic3BhY2Uua2VybmVsLm9y
Zy9ldGlxdWV0dGUuaHRtbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
