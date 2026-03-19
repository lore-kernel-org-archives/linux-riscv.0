Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3B51090221
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Mar 2026 12:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bGaq1WsuC7ZfUfx3K4XHIiTJ7RjgGAk9lbGqbMfh2WE=; b=igMpwKdYJmqmWG
	YBMH9A9hjXu9lbSvkotw3sAjkqoEsYc9YCX+Pz6ma5DAasmOvp9jna17ZOXru1lNsQ5DG9ZUinWlD
	iAbaK7TOIQfrR97tB7fFdW+8E9rFdqB1ezLV/RP9N5SRkqluP86tUWvXKswEE+6cJ7vFqDTn4vCfw
	E1X2YYvfEIPccpYSMnQUhY1yhsPutqXTeVx3FqIAA9y1HucvBrHXUi3l0dAqdYwlt3HX/su1IHKP+
	RNHLh+YB6MFdu4vlSLqNFDYLeBfXqnYTPNYMH7bqAlbz/y9NNWJ1QtzS6pqeVaeEwJuPdBurANuv2
	uGUr7GYkjyPhP4dmhAJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CtD-0000000Adn8-03Bw;
	Thu, 19 Mar 2026 12:54:15 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3CtC-0000000Admv-0nPW
	for linux-riscv@lists.infradead.org;
	Thu, 19 Mar 2026 12:54:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CCFC60103
	for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 12:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E43F0C2BC9E
	for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 12:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773924852;
	bh=3iSW66KyCo4L/u2cSUmtSnRq1Ih4KCkQb/PbdYRwPpk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PVvo2xWsffNFKA82CjReh2BfnxkanYNMH5Ra0sSNWsPXEVo5+GjgjRgkDAUMUAxCt
	 OeGAqd47pO1gKNhyKVGEbnxmccrVmDRYttpNAJQera+9DxE6j0yS42+TOkz5F5f0CB
	 qIIQVYTIeNk9vJ0n14+0xZBjqFj3iWqHVCkiNCnO+gt/+01P+4hprlhlFP3LU9WKnA
	 yZViNfVfWXY/CDfXeivfTOJ+ePs3jusw6jBPcIJmPutPCNLk5DpgnniDfo6Oy+7LaC
	 rby1BhW9YJh/13mLe3AlyhvKGaMYmj/GlTPytOf8kh8AmhTCsJWyj0mzOGS7fNJbBj
	 Vw0cch299OeoQ==
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-79a62a2bb8cso9797587b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 19 Mar 2026 05:54:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVU1Y6zkJoKA3r5q3vdv5ywRASCH3l0j6bNGaDiaoejlyZdQdwGm7teAXw7By+ipfWQRCLD5QkzkDaHig==@lists.infradead.org
X-Gm-Message-State: AOJu0YybO5Cy9VjbL84xe1IvZNelbveSDII7HOjUP/qYXVcCacfnWwQW
	Rkd46fZ0a0NLuZhAogs9oXEgrrPEAJOx3aiwHLul+3l311FYS0y+9iLtC+bX7yI7b7LXHUSg3Fg
	tiZ7NkWD38NIiiF4JGBUhNm3zlWXwmUg=
X-Received: by 2002:a05:690c:ec9:b0:79a:6e1a:3f2f with SMTP id
 00721157ae682-79a71834809mr81461497b3.13.1773924852348; Thu, 19 Mar 2026
 05:54:12 -0700 (PDT)
MIME-Version: 1.0
References: <20260312-k1-gpio-set-config-v1-0-8c3541da16b1@pigmoral.tech>
 <20260312-k1-gpio-set-config-v1-2-8c3541da16b1@pigmoral.tech> <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
In-Reply-To: <CAMRc=MdvvqboLa5_EF3Y3Eh7GSu=_eMpJed8mCLQR7upf2oV6Q@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 19 Mar 2026 13:54:01 +0100
X-Gmail-Original-Message-ID: <CAD++jLmhKcP0b-n3F5U3MYeWYMZT87gQzBAqmjw=HDuRzKQm=g@mail.gmail.com>
X-Gm-Features: AaiRm51pgjUGdP0TcwefP-B1exPpSQSVKtoiqSE_dDtLNQI-rfaw6LzXziWJj10
Message-ID: <CAD++jLmhKcP0b-n3F5U3MYeWYMZT87gQzBAqmjw=HDuRzKQm=g@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: spacemit-k1: Add set_config callback support
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>, Yixun Lan <dlan@kernel.org>, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
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

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMzowNeKAr1BNIEJhcnRvc3ogR29sYXN6ZXdza2kgPGJy
Z2xAa2VybmVsLm9yZz4gd3JvdGU6Cj4gT24gVGh1LCBNYXIgMTIsIDIwMjYgYXQgOTo0M+KAr0FN
IEp1bmh1aSBMaXUgPGp1bmh1aS5saXVAcGlnbW9yYWwudGVjaD4gd3JvdGU6Cj4gPgo+ID4gQXNz
aWduIGdwaW9jaGlwX2dlbmVyaWNfY29uZmlnKCkgdG8gdGhlIHNldF9jb25maWcoKSBjYWxsYmFj
ayB0byBzdXBwb3J0Cj4gPiBwaW4gY29uZmlndXJhdGlvbiB0aHJvdWdoIHRoZSBHUElPIHN1YnN5
c3RlbS4gVGhpcyBhbGxvd3MgdXNlcnMgdG8KPiA+IGNvbmZpZ3VyZSBHUElPIHBpbiBhdHRyaWJ1
dGVzIGxpa2UgcHVsbC11cC9kb3duIHdoZW4gc3BlY2lmeWluZyBhIEdQSU8KPiA+IGxpbmUgaW4g
dGhlIERldmljZSBUcmVlLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEp1bmh1aSBMaXUgPGp1bmh1
aS5saXVAcGlnbW9yYWwudGVjaD4KCj4gQWNrZWQtYnk6IEJhcnRvc3ogR29sYXN6ZXdza2kgPGJh
cnRvc3ouZ29sYXN6ZXdza2lAb3NzLnF1YWxjb21tLmNvbT4KPgo+IExpbnVzLCBwbGVhc2UgdGFr
ZSBpdCB0aHJvdWdoIHRoZSBwaW5jdHJsIHRyZWUuCgpPSyBkb25lLgoKWW91cnMsCkxpbnVzIFdh
bGxlaWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
