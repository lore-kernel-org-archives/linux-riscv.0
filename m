Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C05F8D13580
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 20:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ye6Fg3mXNsxrelpE5FcWzZIEdAuUaXBYPB2Ss9WUaVA=; b=M5OCnX8tDt+2pn
	IZiMvbI2TpC7qI1+egJS5p2g6iohVo1pLOYlgLqTlzPd0spLc0GZINY99SbCgxgLIQhhS9whjkcip
	8gJiVt0XtZB5X4P+/VopN/bGjS5S6waJU/fg/YueOuvkf4WMarR1ioRaBBi53ej7/CPlRsY0Uoose
	damTL5piRaX2QkshN3V+KBq5jSUB8quxqr10erBiVFpCcDhc3wOvwo9S7L5QZ5OOCf+lsSVQ1sB3J
	iAe+Z/CQlekV7djK6UvgQynN+/WOi9vF1CR4poFkVLjqQIFYA1mfYZBmgsP7mrcryfFuqcYsbbq9P
	RBxbalAQNcYG99I3Iy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59fK-00000008oWs-1YYk;
	Sun, 27 Oct 2024 20:15:10 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59aC-00000008nxH-2geT
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 20:09:54 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-2e30fb8cb07so2590777a91.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 13:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730059791; x=1730664591; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cn0EyHtcGrdcmD6hlX0YTNvVFhgAh1Ym6B0WIFTqsw=;
        b=Yny2c0JIchkNztsUCJcM4wkuArYAmdhJdsKqbEUHZvWwxpX+/WK5sT96zmrRHfCVy3
         Oi3+5TCGkcDzEZeiOW0JdVOxVh+X88zRSfajPP9sXqp4LtitV/XzTsN6oQW/5rQaWnfM
         yGPlkZgc3eojVwW/9j4mF1HtVoN73D28x4n4FA1B5LimrdR8VlNC19NOhRYxk2stp8TH
         Iap1jM0/5q6TtSxg78cyz3Yi7YS6DUCMG4SEasQepTOZt+B5qkY1XcU7D6MktzQ82LVR
         Nkg92TjhbjxAoKjqQODndmea1D0REsfQnxRuFdqR3JIyIhSuZClR3GU2efLCrhTLODqf
         NLhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730059791; x=1730664591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8cn0EyHtcGrdcmD6hlX0YTNvVFhgAh1Ym6B0WIFTqsw=;
        b=pUcxFksPQ3qPreVohiu7rsMDzS92C2JK0pEBxeGC8yT0/uvbutwixZSYYY/77WjiVv
         drFa5g4qN9zuY6wsmHr2nGVUAUFLocykUkYmL0a4C2xk7V3UCMeWTHJgituOMjoKg0l/
         UtVKkp8wJNqeKwXXi8uaVUp8tawnX3zoFwJa1had0vwJcdix97Xk3gG4GZZKIQlJA+wC
         lEGkoXex0+7+WpHHLMCoEsRwHkUVAPN1DQKoqYEj7KOTclC4mFWpU+rG0SaCCXSq1rht
         0G1lET0uLaJw7fDtrrgrP43kJzulmGwq6VvqgCyK1ONuVIfBbAln912Trpn7+LutQ5Rw
         Px1g==
X-Forwarded-Encrypted: i=1; AJvYcCWmNuHxch9BmAk9wYKJ1MPNaa3iitQ754aUna7YKKUhVuOoBJMOEYa8wo8v3K+01bldB8yvnHaaZUfnSQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNSccB3y9u0eTam9xSaTvnIFhz1b0tNsNuwZ4jyP8YtVBJm8mZ
	k3HX84P8W9fRMUvc0Z+V1KegxyvMSJJe43xm789FxdFp1/X1tOIL5xRLws+LQvtGDjRwy0UKz/2
	oXakHUZpD5GYkQ6rEBLSPwbyD2dY=
X-Google-Smtp-Source: AGHT+IHrGSjFKH9SncqpBZHXGRv9cjlezV03OA7MRXYOgG0sQQ+U00lTiREVcpKN/xwG2bM9NX0Zx7Z0kGH/LpmBcRA=
X-Received: by 2002:a17:90b:1d85:b0:2e2:b46f:d92a with SMTP id
 98e67ed59e1d1-2e8f106d638mr7068411a91.14.1730059790623; Sun, 27 Oct 2024
 13:09:50 -0700 (PDT)
MIME-Version: 1.0
References: <20241026171441.3047904-1-samuel.holland@sifive.com> <20241026171441.3047904-2-samuel.holland@sifive.com>
In-Reply-To: <20241026171441.3047904-2-samuel.holland@sifive.com>
From: Jesse T <mr.bossman075@gmail.com>
Date: Sun, 27 Oct 2024 16:09:14 -0400
Message-ID: <CAJFTR8Sg_4DTQqWG05NVeNy8mbNA5mStTdPx6=QcR=EZAoM-zQ@mail.gmail.com>
Subject: Re: [PATCH 1/6] riscv: Remove duplicate CONFIG_PAGE_OFFSET definition
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Alexandre Ghiti <alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_130952_705405_0E0ED30D 
X-CRM114-Status: GOOD (  15.68  )
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

T24gU2F0LCBPY3QgMjYsIDIwMjQgYXQgMToxNuKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IFRoaXMgZGVmaW5pdGlvbiBpcyBhbHJlYWR5
IHByb3ZpZGVkIGJ5IGluY2x1ZGUvZ2VuZXJhdGVkL2F1dG9jb25mLmgsCj4gc28gaXQgZG9lcyBu
b3QgbmVlZCB0byBiZSBwcm92aWRlZCBvbiB0aGUgY29tbWFuZCBsaW5lLgo+Cj4gU2lnbmVkLW9m
Zi1ieTogU2FtdWVsIEhvbGxhbmQgPHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+ClJldmlld2Vk
LWJ5OiBKZXNzZSBUYXViZSA8bXIuYm9zc21hbjA3NUBnbWFpbC5jb20+Cgo+IC0tLQo+Cj4gIGFy
Y2gvcmlzY3YvTWFrZWZpbGUgfCAxIC0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L01ha2VmaWxlIGIvYXJjaC9yaXNjdi9NYWtlZmls
ZQo+IGluZGV4IGQ0NjlkYjlmNDZmNC4uNmZmMmNiZGU1Mjk2IDEwMDY0NAo+IC0tLSBhL2FyY2gv
cmlzY3YvTWFrZWZpbGUKPiArKysgYi9hcmNoL3Jpc2N2L01ha2VmaWxlCj4gQEAgLTkyLDcgKzky
LDYgQEAgS0JVSUxEX0FGTEFHUyArPSAtbWFyY2g9JChyaXNjdi1tYXJjaC15KQo+ICBDQ19GTEFH
U19GUFUgIDo9IC1tYXJjaD0kKHNoZWxsIGVjaG8gJChyaXNjdi1tYXJjaC15KSB8IHNlZCAtRSAn
cy8ocnYzMmltYXxydjY0aW1hKShbXnZfXSopdj8vXDFcMi8nKQo+Cj4gIEtCVUlMRF9DRkxBR1Mg
Kz0gLW1uby1zYXZlLXJlc3RvcmUKPiAtS0JVSUxEX0NGTEFHUyArPSAtRENPTkZJR19QQUdFX09G
RlNFVD0kKENPTkZJR19QQUdFX09GRlNFVCkKPgo+ICBpZmVxICgkKENPTkZJR19DTU9ERUxfTUVE
TE9XKSx5KQo+ICAgICAgICAgS0JVSUxEX0NGTEFHUyArPSAtbWNtb2RlbD1tZWRsb3cKPiAtLQo+
IDIuNDUuMQo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IGxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
