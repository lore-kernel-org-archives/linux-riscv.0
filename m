Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5330C54F89
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Nov 2023 14:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cjT2Usx5jpMQS99WZanc4YR59w9ywh6B2X3DQmRbv7I=; b=2X/EV2pb3ihrq5
	ST0WC0E6z2O9ytmjX/gpzos/QzoeL1jiTEh5VWl+yk6VEIxMcIcaqZenrlLiBZPhrsQq89z3fB3IV
	jrkuUzUTvRW0/K4GDkQ/4M1EsFmNprmuemZzMRl65q4FZlrragl5NBZF6koteS0IAy9sh+2ekGkto
	dCTav7MPqJRhEQkqIQzKJpDIY5Yt3PnMaM/fQqQ4OFZPrUFm4aODO4rX4wENkvP9eXVi+zVomiNid
	DpQ/4DanH9UE2eu6RCPXURe4aJq8TqndXAirZaKDZSA8/4u0lSvOjww5oxN6p+LtSnE7sOG9XSXHY
	28CJaZv9jxT9cYcTtYmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H3z-0011ep-2E;
	Wed, 15 Nov 2023 14:40:19 +0000
Received: from mail-vk1-xa36.google.com ([2607:f8b0:4864:20::a36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3H3w-0011ck-1u
	for linux-riscv@lists.infradead.org;
	Wed, 15 Nov 2023 14:40:18 +0000
Received: by mail-vk1-xa36.google.com with SMTP id 71dfb90a1353d-4abf8ba3e4fso2748934e0c.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Nov 2023 06:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1700059213; x=1700664013; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4x+AROzqaSUGbYJGBNTViIpRJb4Xy2XNSOVc+/9rb+0=;
        b=YyczXSRqa3vqoYhi9FXGY9xGHpkDYxCjGmb7estq7kAmjyxFARA00xIVwfTSctenK7
         lP4YI+QS8M1m4gtxx/wHvoqjO3l9mtBWs6PhzfosWERdZlMLiSmbArD2CH3kYNvC2D2x
         mT14WTrFOJPbfy99+cpC15by6Q8jCyNJtTve2tG4O7VHe7wrfOEOCkHZB7B6F8yVZ78I
         Oq06Ekgo8J5d7mf5xM+kKoYbPJK6aM8K09Z4HQOIEgM8QMRSLzCZbStdHIkKABobVZkt
         /QwI5Am61l5r6sSYyfwPEueVgGnC6c0eFEOK8Onn7azWu8KOYHBqwsL6V45qvwNhAWbZ
         nM0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700059213; x=1700664013;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4x+AROzqaSUGbYJGBNTViIpRJb4Xy2XNSOVc+/9rb+0=;
        b=RNUvo6hLUchS/iezWwr0B8ZDB4wr05gZmBSAdlIK39esuAnlTQriy83OfZvJCJ9/pv
         IAqmqQGlel1WH1orvSNffaVr2L+2wy5WfxoKCOWqMM2DWe0g5RsynESDd1ZD9c3ZcPXJ
         gO4H/85MGy+wqvSnYx4iLiKsgOeF7ZhfFamVpB2Bnk5DLG9+PUn3ZPzLZQVTEV6e+I+O
         FuoWfIXVIZSTpnyTaffhklU8bEHGTjh5ebqQEQrs1HDDl4EF38kJULHSe4QmH5sWhZrC
         AnTiH+7bxto63UZLZCPzrimUdUjY2fwdNGoZxokQyDyTpddC32SQD4+Cgtmgm2v0duwq
         wfTA==
X-Gm-Message-State: AOJu0Yx+IGrKk89IiakNE8hB1Cv8Is1pUgM+xfHAbby7w5gfnXj/7s6/
	69ePk2VEsMCJhkOySqdrRtGP5ln4AiLJLCt5ZOCrUA==
X-Google-Smtp-Source: AGHT+IFSBUM4YtIzlDwxJKuvSy5YJ1owFz4UfEiN+Yb8y94S/oC+n4+FP0cbt9m2DQBQkPYOvzbRxgVd5sfQol8jHiU=
X-Received: by 2002:ac5:ccc7:0:b0:495:febd:9187 with SMTP id
 j7-20020ac5ccc7000000b00495febd9187mr13178237vkn.0.1700059213161; Wed, 15 Nov
 2023 06:40:13 -0800 (PST)
MIME-Version: 1.0
References: <20231113023434.1186043-1-samuel.holland@sifive.com>
In-Reply-To: <20231113023434.1186043-1-samuel.holland@sifive.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 15 Nov 2023 15:40:02 +0100
Message-ID: <CAMRc=Mc=nzkTxVyYkg0y8r5cW9MDKD7LZggfmj2jtaq68yamFw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: remove unneeded call to platform_set_drvdata()
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>, 
	Andrei Coardos <aboutphysycs@gmail.com>, Alexandru Ardelean <alex@shruggie.ro>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231115_064016_963667_1BC50E0F 
X-CRM114-Status: GOOD (  10.62  )
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

T24gTW9uLCBOb3YgMTMsIDIwMjMgYXQgMzozNOKAr0FNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEZyb206IEFuZHJlaSBDb2FyZG9zIDxhYm91
dHBoeXN5Y3NAZ21haWwuY29tPgo+Cj4gVGhpcyBmdW5jdGlvbiBjYWxsIHdhcyBmb3VuZCB0byBi
ZSB1bm5lY2Vzc2FyeSBhcyB0aGVyZSBpcyBubyBlcXVpdmFsZW50Cj4gcGxhdGZvcm1fZ2V0X2Ry
dmRhdGEoKSBjYWxsIHRvIGFjY2VzcyB0aGUgcHJpdmF0ZSBkYXRhIG9mIHRoZSBkcml2ZXIuIEFs
c28sCj4gdGhlIHByaXZhdGUgZGF0YSBpcyBkZWZpbmVkIGluIHRoaXMgZHJpdmVyLCBzbyB0aGVy
ZSBpcyBubyByaXNrIG9mIGl0IGJlaW5nCj4gYWNjZXNzZWQgb3V0c2lkZSBvZiB0aGlzIGRyaXZl
ciBmaWxlLgo+Cj4gUmV2aWV3ZWQtYnk6IEFsZXhhbmRydSBBcmRlbGVhbiA8YWxleEBzaHJ1Z2dp
ZS5ybz4KPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZWkgQ29hcmRvcyA8YWJvdXRwaHlzeWNzQGdtYWls
LmNvbT4KPiBSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5QGtlcm5lbC5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+
Cj4gLS0tCgpBcHBsaWVkLCB0aGFua3MhCgpCYXJ0CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
