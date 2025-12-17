Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CF3D64077
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 05:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLQpKD5f4BrswQSVsDT4bH+D3gd8VKqJwXABLuEMzJo=; b=03GZDIrd/qFN59
	nPNcRFVDmJin/repXcUnj4ghYxBfKZl3nWJGh7u2Cr+9phU/s3OqF+ZOrBc1HOwfpYnkpQP3NygNG
	TOrch4LJ2+q7u1Khfm/UO7iu4YAZX5fTwMEbA1ZzLh/BM3TfaoNxrsT0F9erK2QIVQ/XA+f7R5qz9
	pNcrpiieeopnLpMGEr1JP/1CVepQe4+Pjt1s5+gsObe+2tvmHdUHTsIHiA7zDsiaMcciLexcH3zb+
	u+Q+vwWgdpwBdgk6I4TN1O0DrndJ9EyrFDrb6Ip9fivAIJ7EXpREkt5nFiUvJyoTFy5dLq8zVw6RM
	i6EcNmeLbYdsC01GT63A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVkFv-00000006CKg-2MFx;
	Wed, 17 Dec 2025 05:39:23 +0000
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVkFs-00000006CKL-373i
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 05:39:22 +0000
Received: by mail-yx1-xb132.google.com with SMTP id 956f58d0204a3-6420c08f886so6411150d50.3
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 21:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765949959; x=1766554759; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pFqMWNctIpaDjfvcIDvHAL/YeS1NSnOIH4BsKBfjtTQ=;
        b=h/0X3/OC0JJcG2bZM8HVYHvCJmQB6iZtUBF25D7bXIHPBEL7chiEOuCCTiZ5r6LaS2
         ZILMRW8C4cuUHQrvk3//wNDLF0JgLICEDXDccuUtFtdOx0oRu/F02Ihw7j4Jb0KHfO4t
         ImHBCeE50xtYbMOipVMwlMABUps1OTs/qPvmv2Y1iWQJd/7sA1/zKvpIijTJV+vsrcBg
         GO/nll1BrBy35EsI9CGCFUqH+eWxr4czRC0tDSYsSweFLEyLV3RXZoCEOBZl4MTrqCrb
         4Kt5b2DQ3hP82wdst/55tv1FRE/iSkwog13YIhFvtFhlHE9sSECPKFbjol96jy1kGpsD
         Z8Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765949959; x=1766554759;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pFqMWNctIpaDjfvcIDvHAL/YeS1NSnOIH4BsKBfjtTQ=;
        b=WYBnyptXI2HOt5mqHsZxmpCTbjZ8Cu0kSTYIxn3fW6PQV7ZYrX019Oonul9HKs7ExK
         09QJZw3/j5yo5Ze96a1HGbzz++wfyPvyCGK3qQONRBd8oC1m0p0mEgEAvatpnks5O8B7
         0S67XsUWiVBkLsNbvxKEnkMmOHpTTO3StMMotRRDnO2iQkzq2eUEvfo7lvJs3NiP3coI
         57S6FoOlIkKtJEeZDlrGAIRiESKq56GRV1OUoAvDHseD22jNzwdBCMhUFFW9cj128hvt
         5LNZzFF2PZzMaafKWCMCglMlN14c6Y8NadViMWTTww0iQAHfhQvnBUAwDisUhjK8MRid
         AOXg==
X-Forwarded-Encrypted: i=1; AJvYcCXmOaF4jp/nkmLXmgWzBIEZhI3JAWz/yoLHz/JsxafqxLlhWSn/Y3c0EOoIy+OjCHFUHQHtszGFQ3pgUA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5k9knm82urUvrHGy0DCxdHTp0PW3yOFDkdoj/rbCQ4iZSgFmh
	DOi6aML6YFcMGqvHcBCmppEkTcOZjYoCVMWh8sqZD22VftWf5RKjcz0FQndu/7XLRXQHgL+/slk
	EWZqusuH7H/lFtgybVwoVXP4i8ox0otfyZDFhHaeFS1NHwQpEtsBz7FY=
X-Gm-Gg: AY/fxX7w2Crf/7Eg4aN7zF/mWkYL0oqvPao+3JtP1bOFR4j38K3GL7+oRWyioceEfS7
	CSRCSs744q1MyWm7AGR1DJ+bVKH6VbvhMwQ4ZpnXaubJPYzB7x6WVGnHM8tTu4ktD3mbzvrFTON
	CxFz6NBlOc2W2lpF6LjfygrBvH6hIGz/cIZlhk7yzoYVkOi5A+S3Mftt/ghedoMtzPk6IW9npFT
	+IURDLxpOdrwsNTz04P0EJbnknPrB0lB8XfYmS6B5k4U3y7+g9izCJjlqS/NxrESWCm87DOeaR0
	nKPQ+jfUEc8uVKkuHkjSXdIqwtsrV+b8h6seZeQ+RP2R
X-Google-Smtp-Source: AGHT+IGSLd2D2CSBzO+dXKH5DPKZo2JqHs6vGoM0Jjm0zJelF/ajgOSwoF4diEZ/hiPlfZ5/gCZA1dHDDTMrAvqUwxc=
X-Received: by 2002:a05:690e:169e:b0:644:6e20:da76 with SMTP id
 956f58d0204a3-6455566786bmr13919702d50.73.1765949959383; Tue, 16 Dec 2025
 21:39:19 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-7-a0d256c9dc92@riscstar.com> <b0857d3b-5b82-47c1-8415-ec9b2046e704@kernel.org>
In-Reply-To: <b0857d3b-5b82-47c1-8415-ec9b2046e704@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 13:39:08 +0800
X-Gm-Features: AQt7F2qTG9PP4QLt2CMlTWty4KDFsvhiC7T3NbO41z80jrBzYmPUXv5sSOzmWfQ
Message-ID: <CAH1PCMaD3WCNaaY3+V-72X9wA1GNF-BHpPixDSK3y_qQ+EX3dA@mail.gmail.com>
Subject: Re: [PATCH 7/8] riscv: dts: spacemit: add initial device tree of
 SpacemiT K3 SoC
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_213921_068868_7F7528F5 
X-CRM114-Status: GOOD (  16.20  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MzXigK9QTSBLcnp5c3p0b2YgS296bG93c2tpIDxr
cnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMTYvMTIvMjAyNSAxNDozMiwgR3VvZG9uZyBY
dSB3cm90ZToKPiA+IFNwYWNlbWlUIEszIGlzIGVxdWlwcGVkIHdpdGggOCBYMTAwIGNvcmVzLCB3
aGljaCBhcmUgUlZBMjMgY29tcGxpYW50Lgo+ID4gQWRkIG5vZGVzIG9mIHVhcnRzLCB0aW1lciBh
bmQgaW50ZXJydXB0LWNvbnRyb2xsZXJzLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2Rvbmcg
WHUgPGd1b2RvbmdAcmlzY3N0YXIuY29tPgo+ID4gLS0tCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0
cy9zcGFjZW1pdC9rMy5kdHNpIHwgNTI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDUyOSBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaSBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiA+IGlu
ZGV4IDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAwMDAuLmNiMjdiNzkwNzE2
ZmRkNmRjMmJjODljMjhkZDI1ODhhNTk2YTVhZjkKPiA+IC0tLSAvZGV2L251bGwKPiA+ICsrKyBi
L2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQvazMuZHRzaQo+ID4gQEAgLTAsMCArMSw1Mjkg
QEAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ID4g
Ky8qCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1IFNwYWNlbWlUIChIYW5nemhvdSkgVGVjaG5v
bG9neSBDby4gTHRkCj4gPiArICogQ29weXJpZ2h0IChjKSAyMDI1IEd1b2RvbmcgWHUgPGd1b2Rv
bmdAcmlzY3N0YXIuY29tPgo+ID4gKyAqLwo+ID4gKwo+ID4gKyNpbmNsdWRlIDxkdC1iaW5kaW5n
cy9pbnRlcnJ1cHQtY29udHJvbGxlci9pcnEuaD4KPiA+ICsKPiA+ICsvZHRzLXYxLzsKPiA+ICsK
PiA+ICsvIHsKPiA+ICsgICAgICNhZGRyZXNzLWNlbGxzID0gPDI+Owo+ID4gKyAgICAgI3NpemUt
Y2VsbHMgPSA8Mj47Cj4gPiArICAgICBtb2RlbCA9ICJTcGFjZW1pVCBLMyI7Cj4gPiArICAgICBj
b21wYXRpYmxlID0gInNwYWNlbWl0LGszIjsKPiA+ICsKPiA+ICsgICAgIGFsaWFzZXMgewo+ID4g
KyAgICAgICAgICAgICBzZXJpYWwwID0gJnVhcnQwOwo+ID4gKyAgICAgICAgICAgICBzZXJpYWwy
ID0gJnVhcnQyOwo+ID4gKyAgICAgICAgICAgICBzZXJpYWwzID0gJnVhcnQzOwo+ID4gKyAgICAg
ICAgICAgICBzZXJpYWw0ID0gJnVhcnQ0Owo+ID4gKyAgICAgICAgICAgICBzZXJpYWw1ID0gJnVh
cnQ1Owo+ID4gKyAgICAgICAgICAgICBzZXJpYWw2ID0gJnVhcnQ2Owo+ID4gKyAgICAgICAgICAg
ICBzZXJpYWw3ID0gJnVhcnQ3Owo+ID4gKyAgICAgICAgICAgICBzZXJpYWw4ID0gJnVhcnQ4Owo+
ID4gKyAgICAgICAgICAgICBzZXJpYWw5ID0gJnVhcnQ5Owo+ID4gKyAgICAgICAgICAgICBzZXJp
YWwxMCA9ICZ1YXJ0MTA7Cj4KPiBUaGVzZSBhcmUgbm90IHByb3BlcnRpZXMgb2YgdGhlIHNvYywg
YnV0IHRoZSBib2FyZCBEVFMuCgpUaGFuayB5b3UgS3J6eXN6dG9mLCBJIHdpbGwgZml4IHRoYXQg
aW4gdGhlIG5leHQgdmVyc2lvbi4KCkJlc3QgcmVnYXJkcywKR3VvZG9uZyBYdQoKPgo+IEJlc3Qg
cmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
