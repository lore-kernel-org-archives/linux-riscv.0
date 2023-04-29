Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C7B7C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 19:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=KLyjAAmockN6mIYi4muruMie6e6nNDBI5CGhIL5W7uQ=; b=A3dQlakQ2+rm/SR+ZH+uhn94d2
	WR9snVGBboCrmILksJtzbuQnvfQEI/sEdG3S7WI9nPBQqf/rko7YivPnSW2JCYYzohQfeTYQy4Ev/
	I/EFlVEX4hd1dQ2dGSVL9zH/hC8k3/8tDOo+QPoJyTdxNgZs1DQdu3Mff+mLGDjZpqIcT+v2YTEj1
	RFgT+RCjCtJNKc/W962PFXQocfFxs3a7sPKwYilErNtdgdRXzRHwNOhqJlZjmM3fdzb7ZYRsLLFXA
	JyZgDH/f25ZE/+sQp5Fl+B3Qz5Zl9lUQJZ6Jp8hzNUYh3XHRfHNG38LUHBleTSB+enrJFu5PNkaYR
	pr7sT+FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psqYp-00D4c8-0m;
	Sat, 29 Apr 2023 19:48:47 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psqYn-00D4bm-0J
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 19:48:46 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-63b35789313so845870b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 29 Apr 2023 12:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1682797720; x=1685389720;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8xJIhfAmBebYnbahg0bpFD4DMd494RsecF0TgLD/p0=;
        b=Doyc93mM3AnjFpPb7gpeQnhTZLSB8LYtEOTkT+8UvUCTXTpzdv72gJ8x/qntRWW9er
         7qtRU3IPhr66KAGZEuGXxsL3Qbk2JB4BSVJ9Wh+Bl/Jd6TMiMNzLoVHO9pNN50b9oL2x
         ZbBMEtjMHbTcKVuHE7ox8F3dh1QyXBmvf7hhIJxels3TAh+8/bWPKSes+pI7HoMHYxPm
         ZM52kHnLWS+2s3ku+jbetBh0kVkG3WFO92Wst9khTKdve0/TZ1Ula1KqXQEtYmgQ6lB+
         O/tUPqVkRPLdD0//bzGqIMjzmqwtJnHrqAttmGnw2TR9rtklD7ou1hRrrJh7PMrNPqFB
         NBJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682797720; x=1685389720;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y8xJIhfAmBebYnbahg0bpFD4DMd494RsecF0TgLD/p0=;
        b=mGFL7iWvl0vt09pnsFHCnDWtZAMo0pGaes0ktX6v6HeVvBocX1IIwSldrJz70LA1Jx
         a68GUGywGdgH5xknlcmIs9p9frwqP4V2r6hm4VV/90qgIkZYMziajeCz8vKFeMPeSGZA
         novyhS9+vxfhrXvjASctpb2lFbfSEzNlnTvTaMy0ZGO4VvpLcd8PLF5sgbcW+ips1c2k
         EteSKbEuB12urJnGc3tg7DxeotaWgT8p6qHpPi3nG6j+wHd1RFLd21XFiTv4lt9AmxWW
         RVXtYeVO89niVEjKDZUoIVq/RBrcN9is+TwlecT/Q9vy56tACOglEp4DtDMmvqMC35fi
         HHHw==
X-Gm-Message-State: AC+VfDxElsFD+5j5KnIzLMTfp3Y11310gwly0z16e6kJs1frMCK7IgQ5
	38k6k8yRiCNn/VVQGnyuJie5mvaaPhEJGEV99G4=
X-Google-Smtp-Source: ACHHUZ6rL9+YorT4U00gKrGITqTvNqPLHeZoI2n1PiWZBmsw87UJit7ourhmHGifgfBHTHVSWmkC8w==
X-Received: by 2002:a05:6a00:2392:b0:641:4e80:a7c0 with SMTP id f18-20020a056a00239200b006414e80a7c0mr1003018pfc.22.1682797719812;
        Sat, 29 Apr 2023 12:48:39 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id e6-20020a056a001a8600b0063b7a0b9cc5sm17265602pfv.186.2023.04.29.12.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Apr 2023 12:48:39 -0700 (PDT)
Date: Sat, 29 Apr 2023 12:48:39 -0700 (PDT)
X-Google-Original-Date: Sat, 29 Apr 2023 12:48:22 PDT (-0700)
Subject: Re: [GIT PULL] RISC-V Patches for the 6.4 Merge Window, Part 1
In-Reply-To: <CAHk-=wivud6jefN+UKa4zkAf4dkapyh4iRazyUVgXTzqRntOMg@mail.gmail.com>
CC: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c9879e1f-4d38-41b9-8082-7c463fbed66c@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_124845_155284_4D293F96 
X-CRM114-Status: GOOD (  10.89  )
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

T24gRnJpLCAyOCBBcHIgMjAyMyAxNzowODo1MyBQRFQgKC0wNzAwKSwgTGludXMgVG9ydmFsZHMg
d3JvdGU6Cj4gT24gRnJpLCBBcHIgMjgsIDIwMjMgYXQgOTowOeKAr0FNIFBhbG1lciBEYWJiZWx0
IDxwYWxtZXJAcml2b3NpbmMuY29tPiB3cm90ZToKPj4KPj4gICBnaXQ6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvcmlzY3YvbGludXguZ2l0IHRhZ3MvcmlzY3YtZm9y
LWxpbnVzLTYuNC1tdzEKPgo+IFVnaCwgc28gdGhpcyBjb25mbGljdGVkIHByZXR0eSBuYXN0aWx5
IGluIGFyY2gvcmlzY3YvbW0vaW5pdC5jIGJldHdlZW4gY29tbWl0cwo+Cj4gICBlZjY5ZDI1NTlm
ZTkgKCJyaXNjdjogTW92ZSBlYXJseSBkdGIgbWFwcGluZyBpbnRvIHRoZSBmaXhtYXAgcmVnaW9u
IikKPiAgIDg1ODllMzQ2YmJiNiAoInJpc2N2OiBNb3ZlIHRoZSBsaW5lYXIgbWFwcGluZyBjcmVh
dGlvbiBpbiBpdHMgb3duIGZ1bmN0aW9uIikKPgo+IGFuZCB3aGlsZSBJIGRpZCB0cnkgdG8gbWFr
ZSBzZW5zZSBvZiBpdCBhbGwsIGFuZCBnZW5lcmF0ZWQgd2hhdCBsb29rcwo+IGxpa2UgYSBzYW5l
IHJlc29sdXRpb24gdG8gbWUsIEkgZGlkICpub3QqIGRvIHNvbWUga2luZCBvZiBidWlsZCBjaGVj
aywKPiBtdWNoIGxlc3MgY2FuIEkgdGVzdCBhbnl0aGluZy4KPgo+IFNvLi4gQ2F2ZWF0IGVtcHRv
ci4gSSBtYXkgb3IgbWF5IG5vdCBoYXZlIGdvdHRlbiB0aGF0IGNvbmZsaWN0IHJpZ2h0LAo+IGFu
ZCB5b3Ugc2hvdWxkIG1vc3QgZGVmaW5pdGVseSBkb3VibGUtY2hlY2sgaXQgdmVyeSBjYXJlZnVs
bHkuCgpUaGFua3MuICBJJ20gbm90IHN1cmUgd2h5IEkgZGlkbid0IHNlZSB0aGF0IGxvY2FsbHks
IGl0J2QgaGFkIHNob3duIHVwIAppbiBsaW51eC1uZXh0IGJ1dCBJJ2QgZmlndXJlZCBzb21ldGhp
bmcgZWxzZSB3YXMgZ29pbmcgb24uICBJJ2xsIGdvIHRha2UgCmEgbG9vaywgdGhlIHBvc3QtbWVy
Z2Ugc3R1ZmYgaXMgdGVzdGluZyBhbHJlYWR5IG9uIG15IGVuZCBhbmQgbm90aGluZyAKaGFzIGZh
aWxlZCB5ZXQuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
