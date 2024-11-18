Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B2DD60CFA
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Nov 2024 22:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CGV0hNZ14or3DiCG2vOQ18EAqbIM8py2kKbglgrRJnQ=; b=JIZ4bLxcttyjpy
	06Y07V44mLybLKMbEzDYopvcwPqfJCeCf/y2QxZq6kzlTKwZA7smiRgBk9C2Os3T08+O5y9z5UQMH
	5Pvo6iJx+0hzKcOpM08MLqfGUbQhsAo7i4t4BtnearcIo6NnOVpeBbMZedkuizaGiphyEQsfGSTvA
	t0YWZi8+KaNApcvgk2Th2Xr270ETCR7ju4sEwTD/0ydB/Rv34JamA8vuAtWhatgAMHUGNXDmNSMWP
	Jx07QZ14h3bPDFSCHuMjaoqvkNasl990RCqsXkReMZx8wYvySMK8QGPsCB9vjzjOeQI2Bil2yFb1i
	aGGlx1HfnYIKMCxSjkuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAb1-0000000AmpU-3Wsp;
	Mon, 18 Nov 2024 22:51:51 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDAaz-0000000Amov-06HK
	for linux-riscv@lists.infradead.org;
	Mon, 18 Nov 2024 22:51:50 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ff589728e4so50914731fa.1
        for <linux-riscv@lists.infradead.org>; Mon, 18 Nov 2024 14:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1731970306; x=1732575106; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f33F97b+PnpJRlX/x5cwj0kMNkbiVool2hmrJOLGnKI=;
        b=dzBdSEqleeMDTT5DNPXJ3Uea/t97UjTYHlR+jRjBGcglAcBLITAYb7/hGsr8IuAn6C
         wF5okA+3dx+OLCKAheoZQgY/DV0cCnwMJX2Na2aF0N2yimmYJmvUpdWZxhmmSw9gAh0Y
         H4vvqvrmirBUzECWy0a7mAJEUdvgoHd+yFKNAoYGEbQf1ovKAbuPo5WP6KwQphBoebLM
         S228oiLvmBOmS9wV69Gq5+89BKDvRKOIvzhLKEnpPaLpXWzeg7ytp5aqwG9KY6X2jh+W
         wZ3sf/iHJ1KwW2GdY6DZyYzd20UU8sxcuYsG3rd7kf5NtvHeavLb/w/HPF46HifDKmgF
         5VPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731970306; x=1732575106;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f33F97b+PnpJRlX/x5cwj0kMNkbiVool2hmrJOLGnKI=;
        b=KpBz864rttoqP5Z7onHsuClx/JofrdzGL/4nMA4gcX41jITV3/ooNjJ9PP17D/mQaY
         0XGtsj1LByfD1L283+1kFGkRiqaMT9id7YwQHyXTvS+suhUvDL635esQ16NsO9qyTzJ9
         QMsN0Fbvk5gIsCTyHry/UOeil6NXPtl0Ril3Cs2BGUwNgZGYTZVrBFnaRb/q1ZRQJcma
         0pClj7QTOPIXQb9M851Rief80NR6O/q4oJP22xBxCb7jheQJ37rLbgn01+cvmtwnuKX6
         qhFadl2t+UpbrUVupWc/87S65CGCdSaZLdZfAx619cz430lGiXP8KdG5+cxAN5S+f474
         8r+w==
X-Forwarded-Encrypted: i=1; AJvYcCUYGs1al40h1CAS21qbPYO71+XtjCqqrVI3K8M+h3Z13Ux9JQoIxLhCSlsGfH5xUT7Vi7KwgwyQWQUlfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3eOlV1KFoB9qPikawkMxk57ZTZxypSQusx8zeyUaP27QN7ZbQ
	+5qwdyjVr87iXTTDuPI51+itNqQlCfg8Sm+lZQ9m1nQNNnS/tw7Oi7r6k8w2CtHEctIA2iCm5b5
	na4OLNrsbw7lVHea3V3Up+JHOmHtJhscInYMojw==
X-Google-Smtp-Source: AGHT+IE+LvSb06JlRpJBvrLSVlQfASmL5cVYrbSxkjEHmvKeJ5/pEjU4kAEyRVZfdyZirCFmy1wVfiU16ORjy82esSE=
X-Received: by 2002:a2e:bc81:0:b0:2fb:4b0d:9070 with SMTP id
 38308e7fff4ca-2ff83ba13f4mr2979351fa.10.1731970306401; Mon, 18 Nov 2024
 14:51:46 -0800 (PST)
MIME-Version: 1.0
References: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
In-Reply-To: <20241113071201.5440-1-zhangjiao2@cmss.chinamobile.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Nov 2024 23:51:35 +0100
Message-ID: <CACRpkdauNYwqBhNuV5Z_ToyCzRwLyLPPMUSfoZa6in7J-y3B=A@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: k210: Undef K210_PC_DEFAULT
To: zhangjiao2 <zhangjiao2@cmss.chinamobile.com>
Cc: dlemoal@kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241118_145149_076528_C74B8B49 
X-CRM114-Status: UNSURE (   8.95  )
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

T24gV2VkLCBOb3YgMTMsIDIwMjQgYXQgODoxMuKAr0FNIHpoYW5namlhbzIKPHpoYW5namlhbzJA
Y21zcy5jaGluYW1vYmlsZS5jb20+IHdyb3RlOgoKPiBGcm9tOiB6aGFuZyBqaWFvIDx6aGFuZ2pp
YW8yQGNtc3MuY2hpbmFtb2JpbGUuY29tPgo+Cj4gV2hlbiB0aGUgdGVtcG9yYXJ5IG1hY3JvIEsy
MTBfUENfREVGQVVMVCBpcyBub3QgbmVlZGVkIGFueW1vcmUsCj4gdXNlIGl0cyBuYW1lIGluIHRo
ZSAjdW5kZWYgc3RhdGVtZW50IGluc3RlYWQgb2YKPiB0aGUgaW5jb3JyZWN0ICJERUZBVUxUIiBu
YW1lLgo+Cj4gRml4ZXM6IGQ0YzM0ZDA5YWIwMyAoInBpbmN0cmw6IEFkZCBSSVNDLVYgQ2FuYWFu
IEtlbmRyeXRlIEsyMTAgRlBJT0EgZHJpdmVyIikKPiBTaWduZWQtb2ZmLWJ5OiB6aGFuZyBqaWFv
IDx6aGFuZ2ppYW8yQGNtc3MuY2hpbmFtb2JpbGUuY29tPgo+IFJldmlld2VkLWJ5OiBEYW1pZW4g
TGUgTW9hbCA8ZGxlbW9hbEBrZXJuZWwub3JnPgo+IC0tLQo+IHYzLT52NDoKPiAgICAgICAgIE1v
ZGlmeSBjb21taXQgaW5mbyBhbmQgYWRkIHJldmlldyB0YWcuCgp2NCBwYXRjaCBhcHBsaWVkIQoK
WW91cnMsCkxpbnVzIFdhbGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
