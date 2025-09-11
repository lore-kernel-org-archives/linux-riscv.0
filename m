Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEACDCAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 19:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ISGiS/j1nV2pL0e7eSBtw0hiZwhn41Z+Mz9+Dw+FNNA=; b=wdDawi/tn1DP4u
	CojR1T3fAMKb5zupsZ/ksJ3iyFYK+RpEtaUD2BsN/0SMjXjitYDkGn5KQFz2UEoae0EKNpWjIbbXU
	Jbz/8gQOjAhQy0f+XaYNrb0Gfcd38erXjGBl0sz2DgR+2KnFq8NaWyAJTNW6yRlUXzCwyeSZvQkcr
	jzWRgvyzarxJxh2xGCs5jxg/z097cmN3uQ94hac8hbV1i8IThqhaGbPPycN+yd6i6BljHml84awZm
	xzaFmhWqhvsHqa9c4KkzZEweOY3QB11LXAmEp3E9jpELVOzFF5Xr9Kjzb+f2yQIBqEhBBAMXBZIEe
	87NQ/gUfIQyy+SaAtSFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnJf-000000054vN-1bzy;
	Thu, 11 Sep 2025 19:50:47 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnJc-000000054tB-31pn
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 19:50:46 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-24456ce0b96so13745185ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 12:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757620244; x=1758225044; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=VEgn7UxBuWQUaIcV+zvCRxJ9gD9zWWXkpuQn9qEVMh1QthqrzMiEUSjdK1V9Nvvfdo
         t5lTJu6Ql7fuQKgOZ5GwNHsi/P3sCkNidmUXPe7jAyBStUuU+KbFhwTVab4B8ihVjZ5o
         7lCsICLwvH3XKpOuEApC6PUkMi4M6/zy5bK7yBUz0bdx8v4qRVu6gH9NHOQSbUc1Fpll
         Zm81h/Z17Q/uPpNKF1t8A8PtJPTF8XGvuYEmHUshCFjgpqKoihozA4ssOHirPs/UlNO6
         ZCh/vxo+LXjEx1jRrsW0gDSlRqwHNbYUtq2CNLkJoWH7OxbmQTeShpagYen9QGA/j5xb
         IyVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757620244; x=1758225044;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TJeew9YIVoP09p3LirTxwS5JzCuSaF7BlgkulwqqjZw=;
        b=HAS4MaPh0ttzfMGDizE8NFiLO0FEGfMX9MSpAbwSrg3mk/yevDvq+pDcpFC+1j92KA
         lcW6Aa+JuD0mfcqQb3y4GKE+5h5Xji+ANIfnsKYBBVuoySYRFwAHpPpNBhQ6v1Rv3dFz
         n8nGUwDfcXRjfrbaMJ9QkQYHeQmVaA6DRmNqTWezI5OSM8I75UlQTsypy1+hG/o48ZuA
         gePj1M2pcJH4azRUbLiQ0hLxtPhRwRs7Zkt+YQKK4FpsXHWFc//iqNEHGb/5+RgJVjKA
         yEkfAgICtg1HlzM4C6nkur0nFI20aaPlXVCATHsCo/MqCSFBI7vCFIh4qSC4Z9vOTDC2
         +KQw==
X-Forwarded-Encrypted: i=1; AJvYcCVtEwOcgjP6BS2CGHHUOUM7QFgGS/3uqu/WrBQ4Qcor/ybwo4WUKezLIIFPp7mEPMUa1VjSGeJtbM6eMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPV/lFwlo+qvic50I2LMAYeXaKBghqeVZVvZBKOHctUclwt4+v
	q7arwwU0ddC//Ue5kPmyJ3xSyfjSiazNl6A3dI4DQByI/RJeVDLTe5ZJ
X-Gm-Gg: ASbGncsCwP82I9YsO4me1+uB/NdLPwWAK5fPGnYUW0BcI3Uq5y/WnkbhW4oNeH3xpQ6
	CrIqBUsp8k98HdbpB6dngLBHwHRlOKmUPII7b8AgpGpYvsWKZfnD5PoudM8J6yb5BYW4FgdvP45
	089B56ejdnCB+2ei872KioWdKRj8yRTl5Lfd1mKRRJRM5OWxuaThl4ZyR2MZjbdlJWz/rClMkWy
	DZjGe/nsB0ox4064Y7A4130zyz91gc7x9XwpXvwYyyTL57KLJn/m/l0/7H49kTanV8yeFHveTg6
	YhNEzFKW+5O+skzP77F8VjltvCs0QNVyNkMVsw5g+JkKDBlaiQJqqnz3kfNlMUOtb1bvGbyEK/W
	mWIa3fY4VmBRAVpvguxIx+GUWxq4Owyo9m82Q50m0TEQGt5qf
X-Google-Smtp-Source: AGHT+IGM3HY9cYe0k8sf5GxMMVgG9l2ykvqk4n7ayiGGr2GhLio6Ij8ygJsJDwHZ88T4ZvBeMdpxjA==
X-Received: by 2002:a17:902:d506:b0:25c:9084:4172 with SMTP id d9443c01a7336-25c908466d3mr25755745ad.14.1757620243626;
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Received: from [10.69.47.143] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c36cc53bcsm26957775ad.28.2025.09.11.12.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Sep 2025 12:50:43 -0700 (PDT)
Message-ID: <cfe7bc19-763f-4e92-b1ae-355c661bcc19@gmail.com>
Date: Thu, 11 Sep 2025 12:50:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] gpio: brcmstb: use new generic GPIO chip API
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Keguang Zhang <keguang.zhang@gmail.com>, Alban Bedel <albeu@free.fr>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Samuel Holland <samuel.holland@sifive.com>, Yixun Lan <dlan@gentoo.org>,
 Andy Shevchenko <andy@kernel.org>, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
References: <20250910-gpio-mmio-gpio-conv-part4-v2-0-f3d1a4c57124@linaro.org>
 <20250910-gpio-mmio-gpio-conv-part4-v2-7-f3d1a4c57124@linaro.org>
 <e0941449-7a62-4bbb-8790-616f393f2cc8@gmail.com>
 <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
Content-Language: en-US
From: Doug Berger <opendmb@gmail.com>
In-Reply-To: <CAMRc=MfZ5ss8Gd_TTPV8EYSv04ENp_C26b3=wukO+UTy_boXUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_125044_763943_1D0331EA 
X-CRM114-Status: GOOD (  13.63  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gOS8xMS8yMDI1IDEyOjU2IEFNLCBCYXJ0b3N6IEdvbGFzemV3c2tpIHdyb3RlOgo+IE9uIFRo
dSwgU2VwIDExLCAyMDI1IGF0IDI6MTHigK9BTSBEb3VnIEJlcmdlciA8b3BlbmRtYkBnbWFpbC5j
b20+IHdyb3RlOgo+Pgo+Pj4KPj4+IEBAIC03MDAsNyArNzA3LDggQEAgc3RhdGljIGludCBicmNt
c3RiX2dwaW9fcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPj4+ICAgICAgICAg
ICAgICAgICAqIGJlIHJldGFpbmVkIGZyb20gUzUgY29sZCBib290Cj4+PiAgICAgICAgICAgICAg
ICAgKi8KPj4+ICAgICAgICAgICAgICAgIG5lZWRfd2FrZXVwX2V2ZW50IHw9ICEhX19icmNtc3Ri
X2dwaW9fZ2V0X2FjdGl2ZV9pcnFzKGJhbmspOwo+Pj4gLSAgICAgICAgICAgICBnYy0+d3JpdGVf
cmVnKHJlZ19iYXNlICsgR0lPX01BU0soYmFuay0+aWQpLCAwKTsKPj4+ICsgICAgICAgICAgICAg
Z3Bpb19nZW5lcmljX3dyaXRlX3JlZygmYmFuay0+Y2hpcCwKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICByZWdfYmFzZSArIEdJT19NQVNLKGJhbmstPmlkKSwgMCk7Cj4+
Pgo+Pj4gICAgICAgICAgICAgICAgZXJyID0gZ3Bpb2NoaXBfYWRkX2RhdGEoZ2MsIGJhbmspOwo+
Pj4gICAgICAgICAgICAgICAgaWYgKGVycikgewo+Pj4KPj4gSSBzdXBwb3NlIEknbSBPSyB3aXRo
IGFsbCBvZiB0aGlzLCBidXQgSSdtIGp1c3QgY3VyaW91cyBhYm91dCB0aGUgbG9uZ2VyCj4+IHRl
cm0gcGxhbnMgZm9yIHRoZSBtZW1iZXIgYWNjZXNzZXMuIElzIHRoZXJlIGFuIGludGVudCB0byBo
YXZlIGhlbHBlcnMKPj4gZm9yIHRoaW5ncyBsaWtlPzoKPj4gY2hpcC5nYy5vZmZzZXQKPj4gY2hp
cC5nYy5uZ3Bpbwo+IAo+IEkgZG9uJ3QgdGhpbmsgc28uIEl0IHdvdWxkIHJlcXVpcmUgYW4gZW5v
cm1vdXMgZWZmb3J0IGFuZCB0aGVzZSBmaWVsZHMKPiBpbiBzdHJ1Y3QgZ3Bpb19jaGlwIGFyZSBw
cmV0dHkgc3RhYmxlIHNvIHRoZXJlJ3Mgbm8gcmVhbCByZWFzb24gZm9yCj4gaXQuCj4gCj4gQmFy
dApPaywgc28gYXNzdW1pbmcgc3RydWN0IGdwaW9fY2hpcCBpcyBzdGlja2luZyBhcm91bmQgbG9u
ZyB0ZXJtIHRoYXQgbWFrZXMgCnNlbnNlIHRvIG1lLgoKVGhhbmtzIQoKQWNrZWQtYnk6IERvdWcg
QmVyZ2VyIDxvcGVuZG1iQGdtYWlsLmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
