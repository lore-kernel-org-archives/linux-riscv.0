Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63221CAC582
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Sep 2025 17:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ptk5r0Dn/I+GhG/jQSI+nZ/XJ5/veKLpsm0GE5VmSVw=; b=a/7bjRi7LXktYX
	o5Sasn1UhnJYakY+aRq0qJOq/siuzAEKubZ95Qo4YtVE6Z3cRqlpKWRwxzP6xL/i/jR2ZvOHCl46L
	qbhDAEB/7e7OeSMn2yohfMnzaCPDU52j+wrmR/bKw+ksOnv4xv/ptMisRajmuYo9ju3MphPctjeTU
	IF3piWsrzcZxeXVEFlybciZhYRbzpo0RzC/8JkO+LVECwXHkf3ssHFeCYDVx7KrVwuEV464Hcr3sd
	LlH1zw+HhMDosk+PComf7h7bk9B2WqFd3VF7J3DQDRH9syPiRLGBU5Ti3/juTnccPc59osFaa6E49
	iTY+kSoblY4nuxW76ZNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw23I-00000008ziZ-2CBt;
	Tue, 09 Sep 2025 17:22:44 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0Ei-0000000838k-1J4h;
	Tue, 09 Sep 2025 15:26:25 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-b043da5a55fso773410366b.0;
        Tue, 09 Sep 2025 08:26:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757431583; x=1758036383; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=JOjIljSkgiclH0Hd8rqgpuUNVOIvyaMbVLe45Lt1BTLVgf80VuwjIMTVOLyur5HNwT
         UIyNYQ1ekhi7cl5IpSUKcmSpCHDKwwOceLo6QnG7ZFwUyJ4PkN60GqApnCJagj5bsobA
         CBgm1LliSzVaVpcnJUnjcULzgMv8Jk0DV4cAhKT0eopYfHqN4SoP50DUncPjnbG4XFcR
         /VZ0sTLmdQ42aM/oylzFAsI2v3SQ1HS3FQx+hPZxmRErlQiV71CbkgFTyZp5KgZz4GmO
         rvUbvuEYrdv31G2+j4XjbpPz7xYg/3ReV9oni0WUWC86LpDyHSx4ysFuC1/uHNM48luw
         kJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757431583; x=1758036383;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ACvYPivQ1a8I17yD0UYeNvhtUQ6DCC5FT/ARS5wLzjU=;
        b=tyUucGu6CZgAFNmgGI2Hai1OUl2LLZniK/ggDr0tj8/kyTkW5CvFDw1Tgb/hSNoiWc
         11YF6q5a2SfI82sm0Q7569+/R8Yf8Gien2vfnctlo8H6hARM07e+8oKWKcMcJeb0xfEk
         Cw6ZSCzG7rDAmyryVk6SMnOgZZbMgihxESflYz5i9zzMJh/NbGI/43wLudP/BKt5Vlhe
         7yO1Z8KpdfZqYZMEDswJc9xam0NKHPkS2udJSoxyOBslnTXxZJJnIsZch4a1CiWd4Y5L
         t0h4z7Aem55CCXVnw6f9njqovwBh4Nad3nsAo/YKX32VUUkAVD+jpZOh0A9b+j8mc2qv
         0gDQ==
X-Forwarded-Encrypted: i=1; AJvYcCU/rWgBd34NDgTjJcBEYnxmm96hLJnipaND/U5R7sOr7f7ziZHy14ss2SILSzMVJ7PrrVhndeUCBZMVPAY=@lists.infradead.org, AJvYcCU8/1StqMdE8lBnFOgL9cJDMuNqb53F5xvZ7kSRrYz8X7QIl7b4YpXpeX6M9S4RC1pRJOli1au+rnxx64BGwvKe@lists.infradead.org, AJvYcCW2vQM22147xXiesD1lzItKNfi0Xl/aGrJ8ilOVwabZTfxvD6bUSoPorAxCHNp9JWhvkJlJc1u7rIQq5037/dw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm9J1ZC3FuwB1dEN8HFs99JOIZ6LcdEo5tY6G2MbqGRzjICe0x
	Ix2obBmvM8N/tRtVcJtaF0W4EL0loy5eW91QSPGnkTHyWx4cCtA3HWJM6n585XnEX54e0DT7/VW
	tAd+ct5dg91NdJKgmv7xxKs7OIXErjvg=
X-Gm-Gg: ASbGnctMwqI8g8l6eWMbN0HIJ8eOCwHywRshdNbIDnPaUxT5/wqez7C8kvjM+wJOGEq
	o2iLfNyL77VMSUxs0K5ipUrA3t9b0CFhh1Di6c6Miuj2qWmR5gYKxMBWmRwOkzMI9+WT16v4XQN
	S6tU4eZPoN8cfk3pt/e6/NlwU0XjACXpB5uZ/1n/6QtPkkxwdGhAAxcMoqhdo2DGdZI7Id/S0UQ
	Nrkoor+2A==
X-Google-Smtp-Source: AGHT+IGZg15DrtF72G9h9dyt21xSsowFAKz71cJqtEpccOZC9aRv/EPnYIUJriaKNXq/eDdw8hEDX9pZ4E1DPi0ePuo=
X-Received: by 2002:a17:907:8687:b0:b04:5200:5ebe with SMTP id
 a640c23a62f3a-b04b173704cmr1239828766b.54.1757431582431; Tue, 09 Sep 2025
 08:26:22 -0700 (PDT)
MIME-Version: 1.0
References: <20250909-gpio-mmio-gpio-conv-part4-v1-0-9f723dc3524a@linaro.org>
 <20250909-gpio-mmio-gpio-conv-part4-v1-13-9f723dc3524a@linaro.org>
 <aMAP9hAWars0T83r@smile.fi.intel.com> <CAMRc=MeLTGq8Qu2aT43tkt3vaYCSaJPJPLmaUQ1SAyD_OgVr_g@mail.gmail.com>
 <aMAn4MM_Fs8q8qwj@smile.fi.intel.com> <CAMRc=Mdr4oW2d7XZ90rRr_fKC7WToz72v=_kW-s8=Urd0g8k3g@mail.gmail.com>
 <aMAve1MbONmKVjjg@smile.fi.intel.com> <aMAv3STeZUdSQ14p@smile.fi.intel.com>
 <CAMRc=MeA87p0QAzq_3MACQM90MhN0eRccr7u-VzcfyP8b90AaQ@mail.gmail.com>
 <aMAzZAbNwrRTgFi-@smile.fi.intel.com> <CAMRc=Mfn7atHTqKc9nMTQ19ZserqeNi3skb-QhG3CVdEhmr0gg@mail.gmail.com>
 <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
In-Reply-To: <CAHp75VdDAJO3+NPp29GnqL=C5m7tdWbyYvNFax=Dh+dG49YAnA@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 9 Sep 2025 18:25:45 +0300
X-Gm-Features: Ac12FXzLAWj8jy-m4m9ZPXb_pPgfqX2JAuL57q-duTifXdjD_POsau2MIQgkxqI
Message-ID: <CAHp75VffDLfvdVhnzZk6V6a9eXq4R0ZBYLUw3S=g0ABqozhWFQ@mail.gmail.com>
Subject: Re: [PATCH 13/15] gpio: sodaville: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Yixun Lan <dlan@gentoo.org>, Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_082624_353152_BBA2178C 
X-CRM114-Status: GOOD (  23.17  )
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

T24gVHVlLCBTZXAgOSwgMjAyNSBhdCA2OjE14oCvUE0gQW5keSBTaGV2Y2hlbmtvCjxhbmR5LnNo
ZXZjaGVua29AZ21haWwuY29tPiB3cm90ZToKPiBPbiBUdWUsIFNlcCA5LCAyMDI1IGF0IDU6MDXi
gK9QTSBCYXJ0b3N6IEdvbGFzemV3c2tpIDxicmdsQGJnZGV2LnBsPiB3cm90ZToKPiA+IE9uIFR1
ZSwgU2VwIDksIDIwMjUgYXQgNDowMuKAr1BNIEFuZHkgU2hldmNoZW5rbwo+ID4gPGFuZHJpeS5z
aGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+IE9uIFR1ZSwgU2VwIDA5LCAyMDI1IGF0
IDAzOjU2OjQxUE0gKzAyMDAsIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gPiA+ID4gT24g
VHVlLCBTZXAgOSwgMjAyNSBhdCAzOjQ34oCvUE0gQW5keSBTaGV2Y2hlbmtvCj4gPiA+ID4gPGFu
ZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4gd3JvdGU6CgouLi4KCj4gPiA+ID4gPiBUQkgsIEkg
dGhpbmsgdGhvc2UgNiBhbGwgbWFkZSB0aGUgc2FtZSBtaXN0YWtlLCBpLmUuIHRoaW5raW5nIG9m
IHRoZSBjb21wb3VuZAo+ID4gPiA+ID4gbGl0ZXJhbCBhcyBhIGNhc3QuIFdoaWNoIGlzIG5vdCEK
PiA+ID4gPgo+ID4gPiA+IFdoYXQgZG8geW91IHN1Z2dlc3Q/Cj4gPiA+Cj4gPiA+IFdyaXRlIGl0
IGluIGxlc3Mgb2RkIHdheSA6LSkKPiA+ID4KPiA+ID4gZm9vID0gKHN0cnVjdCBiYXIpIHsgLi4u
IH07Cj4gPgo+ID4gSSBkb24ndCBnZXQgeW91ciByZWFzb25pbmcuIHR5cGVvZigpIGl0c2VsZiBp
cyB3ZWxsIGVzdGFibGlzaGVkIGluIHRoZQo+ID4ga2VybmVsIGFuZCBkb2Vzbid0Cj4gPgo+ID4g
Zm9vID0gKHN0cnVjdCBiYXIpeyAuLi4gfTsKPiA+Cj4gPiBldmFsdWF0ZSB0byB0aGUgc2FtZSB0
aGluZyBhcwo+ID4KPiA+IGZvbyA9ICh0eXBlb2YoZm9vKSl7IC4uLiB9Owo+ID4KPiA+ID8gSXNu
J3QgaXQgc3RpbGwgdGhlIHNhbWUgY29tcG91bmQgbGl0ZXJhbD8KPgo+IEl0IG1ha2VzIGl0IHNv
LCBidXQgdHlwZW9mKCkgdXN1YWxseSBpcyB1c2VkIGZvciBjYXN0cyBhbmQgbm90IGZvcgo+IGNv
bXBvdW5kIGxpdGVyYWxzLiBUaGF0J3MgKHVzYWdlIHR5cGVvZigpIGZvciBjb21wb3VuZCBsaXRl
cmFscykgd2hhdAo+IEkgYW0gYWdhaW5zdCBpbiB0aGlzIGNhc2UuCgpGV0lXLCBicmllZiBnb29n
bGluZyBzaG93ZWQgdGhhdCBub2JvZHkgKG9rYXksIEkgaGF2ZW4ndCBmb3VuZCB5ZXQKcmVkZGl0
L1NPL0dDQyBvciBMTFZNIGRvY3VtZW50YXRpb24pIHVzZXMgdHlwZW9mKCkgZm9yIGNvbXBvdW5k
CmxpdGVyYWxzLiBTbywgdGhpcyBtYWtlcyBtZSBmZWVsIHJpZ2h0LCB0aGF0IHRoZSBmb3JtIG9m
IHR5cGVvZigpIGlzCndlaXJkIGFuZCB3b3JrcyBkdWUgdG8gdW5rbm93biByZWFzb25zLiBBbnkg
cG9pbnRlcnMgdG8gdGhlCmRvY3VtZW50YXRpb24geW91IHJlYWQgYWJvdXQgaXQ/Cgo+ID4gPiA+
IEFuZCBhcmUgd2Ugbm90IGFsbG93ZWQgdG8gdXNlIEM5OSBmZWF0dXJlcyBub3cgYW55d2F5Pwo+
ID4gPgo+ID4gPiBJdCdzIGZpbmUsIGl0J3Mgbm90IGFib3V0IHRoZSBDIHN0YW5kYXJkIG51bWJl
ci4KCkUuZy4sIGh0dHBzOi8vZ2NjLmdudS5vcmcvb25saW5lZG9jcy9nY2MtMTUuMS4wL2djYy9D
b21wb3VuZC1MaXRlcmFscy5odG1sCig4LjEuMCBpcyB0aGUgc2FtZSkuCgoKLS0gCldpdGggQmVz
dCBSZWdhcmRzLApBbmR5IFNoZXZjaGVua28KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
