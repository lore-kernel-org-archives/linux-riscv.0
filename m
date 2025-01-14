Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECADE77188
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jan 2025 10:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=owc/KavCuUIw0Y3pcz5hLdAli64N5SKIT5mPzOpZKoc=; b=l9tNHqWSoqL3Es
	WnkIxfpyQ1vHpYzPe3X3AOp5JWs2B4DR9iczTtctQoweFbp11x6Z45VVAVAYLiCL9F4pn1oZ0+apb
	Y9C52XQMX9orl9iyAH3kW76FoJUPKKBUzcL3DPOCXYWDRwJx7RKzKy29Py4Ivh4Qq0ZVU0qq8vNrn
	PbHGEDNXJgVWiRZKhvswcCseaX2tKoTftg+Uv0Wa1M6G2nTL61v1CfafT6XKjXKdI/4a+Y2j/nYaY
	tZ9zZG7dJjKJKe6Isqvi8wvVjTJCjJbw8TMuINDUYlUpW/KBC/gXYsatkzgzuDMu5K0B8u8p3yoMy
	qB8VVBYGKB/OVBFxOY8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeX9-000000089df-1SLu;
	Tue, 14 Jan 2025 10:52:31 +0000
Received: from mail-vk1-f174.google.com ([209.85.221.174])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeX7-000000089cS-0xEQ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jan 2025 10:52:30 +0000
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5189105c5f5so3208123e0c.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 02:52:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736851947; x=1737456747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=id29KENdHdFIEm7YGxzEaCcOwl3ksuw4MMZf/lx76pc=;
        b=YBPy29dXVL9ax2zDfnQwSLEcobm8ZyAM8VB2dayKzu390Po/6ljKlLc6/3M52oEwe8
         5MuXcqhVL+1CbgcYRE5WpvXU5N8HbB1j2k5Pm5QN1qmbcf1SZFMC5jPfcu54m59a7Tfp
         F9V6B4f2/Rb2PngRYofI8M+2MCxslmEcGAOvxZhmEYO5cQUmyu9GG1lPaHlzf5yiNeXL
         oLUpZWCt8yOnlMhV3WDkpHPxAsapUfjxISW328eHBe6cEnzdRD5s1v6AsAxfenwADXp2
         DyhEoUMWzDRpnrAeHZBpNbtehpe44w/PsbgNU6LVMXRtwtAWYTPK7/wfScJJpFzc2TtD
         oaJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVDbzsh0B9qqMVNdLRyi3nBsMtpP8xNqF3/7nLx0lyFDpzdVMqybS3Exz0necYDqd6Yly1INWCvJoWDOQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwMBiS+gybPFY/L2X5XRvpdym07p02ZuGQ4xjPHtenOBC6zQNxf
	sSqr2MMre24avahRMoVOUoY+NhzdLHTSuSmTvTVZiNj4idIPWZhS3/T9E7wn
X-Gm-Gg: ASbGncs4zcOH+nML/jKyQ3VN+zUfOfpT/PSN4NSya00QxGRkd2HFE+FdvYm70h87IQn
	WPrnQnr7zBK0wuUnBJ+q73GbL4BW4WwPYqLN4kLDK3va+Srfibe3fmyr6XqGobgBOdvzImofyFn
	cRXyS4FkRePzRLJPYOTFHYlRpbNdSy15QrkdFXjEpvVJ4f0GxAvCXWKTvvM1PiFzXujXUiUWv22
	UCHSpffdaw/ecojn/IwMjRaxZ3TBwdowZ6CMSk5r5SoELEHwt1D4u0gY6oidCZfwjaCSyn+hXXO
	J8glTF7I9hQ6HQjBg2+vUYo=
X-Google-Smtp-Source: AGHT+IFpQX5S93iWBJEI1PjnN8fLyJLQ39cffNlwz9menrK74gJiFXxm8s62I0fiLXg+IMvPwTSmLg==
X-Received: by 2002:a05:6122:3295:b0:516:1ab2:9955 with SMTP id 71dfb90a1353d-51c6c242f58mr21326431e0c.6.1736851947204;
        Tue, 14 Jan 2025 02:52:27 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-51c7fd2dd88sm3882074e0c.47.2025.01.14.02.52.26
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jan 2025 02:52:26 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-5174d53437eso3166500e0c.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jan 2025 02:52:26 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVPpmGIM2YXko39zJc1MMGewDcO5xedVl0+sLOVHD13A+jzH44PF8IJeGbU0iPY+D8Z5SenOSCsD6Ritw==@lists.infradead.org
X-Received: by 2002:a05:6122:318c:b0:518:a287:56e3 with SMTP id
 71dfb90a1353d-51c6c304a0amr12474906e0c.7.1736851946726; Tue, 14 Jan 2025
 02:52:26 -0800 (PST)
MIME-Version: 1.0
References: <20241231161400.214307-1-robh@kernel.org>
In-Reply-To: <20241231161400.214307-1-robh@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 Jan 2025 11:52:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVKRJ4z-s6hF+=RyMk70n_TU8fQ4tu6A4NVzQPgakMBsQ@mail.gmail.com>
X-Gm-Features: AbW1kvYvUi8aIeCiEijCOuQ3IuadxfS8Fa2KAwDp32RBOJQ8veqboGlg-BwQsYY
Message-ID: <CAMuHMdVKRJ4z-s6hF+=RyMk70n_TU8fQ4tu6A4NVzQPgakMBsQ@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] riscv: cacheinfo: Use of_property_present() for
 non-boolean properties
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_025229_263233_D6E59E38 
X-CRM114-Status: GOOD (  15.89  )
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

SGkgUm9iLAoKVGhhbmtzIGZvciB5b3VyIHBhdGNoIQoKT24gVHVlLCBEZWMgMzEsIDIwMjQgYXQg
NToxNOKAr1BNIFJvYiBIZXJyaW5nIChBcm0pIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+IFRo
ZSB1c2Ugb2Ygb2ZfcHJvcGVydHlfcmVhZF9ib29sKCkgZm9yIG5vbi1ib29sZWFuIHByb3BlcnRp
ZXMgaXMKPiBkZXByZWNhdGVkIGluIGZhdm9yIG9mIG9mX3Byb3BlcnR5X3ByZXNlbnQoKSB3aGVu
IHRlc3RpbmcgZm9yIHByb3BlcnR5Cj4gcHJlc2VuY2UuCgpQbGVhc2UgYWRkCgogICAgVGhpcyBn
ZXRzIHJpZCBvZiB0aGUgZm9sbG93aW5nIGJvb3Qgd2FybmluZ3M6CgogICAgICAgIE9GOiAvY3B1
cy9jcHVAMDogUmVhZCBvZiBib29sZWFuIHByb3BlcnR5ICdpLWNhY2hlLXNpemUnIHdpdGggYSB2
YWx1ZS4KICAgICAgICBPRjogL2NwdXMvY3B1QDA6IFJlYWQgb2YgYm9vbGVhbiBwcm9wZXJ0eSAn
ZC1jYWNoZS1zaXplJyB3aXRoIGEgdmFsdWUuCiAgICAgICAgT0Y6IC9zb2MvY2FjaGUtY29udHJv
bGxlckAxMzQwMDAwMDogUmVhZCBvZiBib29sZWFuIHByb3BlcnR5CidjYWNoZS1zaXplJyB3aXRo
IGEgdmFsdWUuCgpzbyB0aGUgbmV4dCBwZXJzb24gZG9lc24ndCBoYXZlIHRvIGRpdmUgaW50byB0
aGUgY29kZSB0byBmaW5kIHRoaXMgcGF0Y2ggOy0pCgo+IFJldmlld2VkLWJ5OiBDbMOpbWVudCBM
w6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTogUm9iIEhlcnJpbmcg
KEFybSkgPHJvYmhAa2VybmVsLm9yZz4KClJldmlld2VkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4g
PGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPgpUZXN0ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+CgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAg
ICAgICAgICAgICAgIEdlZXJ0CgotLSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90
cyBvZiBMaW51eCBiZXlvbmQgaWEzMiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29u
YWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBo
YWNrZXIuIEJ1dAp3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInBy
b2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBs
aXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlz
dGluZm8vbGludXgtcmlzY3YK
