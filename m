Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A7ECEACDE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L/dHpOd8uAlJYaIr/c6DuE+C9AGRSBBHfHvpwvpMn6w=; b=eSQDTa/FBHJAb5
	aOYvA4jEogqI7ldxdtQasY1zwkTuZbiZEHfTVyZQg/CZZ78/VigKrrtSu7S51hsBigd2qDw5clGfo
	c80X/m2ztFonhJJjYUCy6ExEONh393nWaaJpMd7NvtwPTRgblCvQCp3+LDVcmw68jOfTI4NNyumqF
	vVZgqLoAR3qNmQGDUBUrU948uFaRQ0p7tGr1gRW4wxQDhYLXmlNF06EoWU9Wv+DalpTG92II3bpMI
	Hs5bCo6OIN5tS+LogMz9mM1vXQuNPUr+WcZuB+6SuPk5B5h6PXa3XI+qNGFHT6xEGRiQQ/KfyM8Kb
	g0NSIDzi2r8f9LHiyQ3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svfJZ-00000003PWn-0l4O;
	Tue, 01 Oct 2024 16:01:29 +0000
Received: from mail-yb1-f172.google.com ([209.85.219.172])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sveED-00000003Cdx-1mv6
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 14:51:54 +0000
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e25e4023cafso3683904276.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 07:51:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727794310; x=1728399110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNruZBGCuXHJI2C/Fv8WrfBhkuB98dRgPlwbcD0yhng=;
        b=dFwivtQvDZFTH3bm4IUIfe3+Hwqt2JbDiUzmWOjQZ5pJ4o7d3sII8jUYFpBTnnF3/H
         xeXz584oG86WiT+YbNxjN2jDx95we8XxdmM1pBiLMp+lRtZvMxXzLnXR3IuKhAwqW3ke
         9ZabnTtTCLC+yTk3NYFyjB5nLj/9J/EJXOJ0T5byWFqAS0LRc80w06Qx5hjnqIcbvdDY
         B1cdmmv7kYGAoGn3D5ehoEFsJZzxe8f26D4zvh5aXHOJ2ZLLKnWH8W1XD+G3xJmTwb49
         Kl4pJYCewGNtPrU+w4ZbvKNd5aWtxsYKQ8FPg6Wt9suzeCmuPuA6/aC5+Yteg/D2Q6Tg
         gnaw==
X-Forwarded-Encrypted: i=1; AJvYcCWdIr3lvSZzS6h88L5zpFlQRTq7ydlIcQH9CsF3avUK/zLhjAsg+L7LfZyyNqXEqsmOWHtZc41ETGEv6w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwfI5K5uD2y+MZ/RyOiil8NGcEiyLFFl9bIzhEKYl9nrf7OTgMm
	Q1QdCcI/2hXRxYGSz2xr7h0g8gtmAsj5RuEYQAHGlNFqr2YtPJbdYwSNv3IH
X-Google-Smtp-Source: AGHT+IEq2WbRDljqtYIjzkw1kItDw5+Hk4Th46COszsa9Ai6QfLsqe90WT346j8MAtXtWQ2NbUjrZw==
X-Received: by 2002:a05:6902:2009:b0:e1d:a827:2a46 with SMTP id 3f1490d57ef6-e2604c91f4cmr11565331276.36.1727794310094;
        Tue, 01 Oct 2024 07:51:50 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e25e6c329afsm3171173276.63.2024.10.01.07.51.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 07:51:49 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6e2772f7df9so18688457b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 01 Oct 2024 07:51:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWwm9UFmLuYC9mZ8fN7ijErmCj/UUns56EE5xhy6STBrSwKN9I7U2eaP2WT0H99VJnJecBcB5LuD7/6Mg==@lists.infradead.org
X-Received: by 2002:a05:690c:112:b0:6e2:985:f4df with SMTP id
 00721157ae682-6e24dc9c710mr105345037b3.44.1727794308335; Tue, 01 Oct 2024
 07:51:48 -0700 (PDT)
MIME-Version: 1.0
References: <20240924210123.2288529-1-linux@roeck-us.net>
In-Reply-To: <20240924210123.2288529-1-linux@roeck-us.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 1 Oct 2024 16:51:35 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXQEAwVHDzsqypisOB_n4PcXMD+4UHgxjZMwvdKfWutAQ@mail.gmail.com>
Message-ID: <CAMuHMdXQEAwVHDzsqypisOB_n4PcXMD+4UHgxjZMwvdKfWutAQ@mail.gmail.com>
Subject: Re: [PATCH] mmc: core: Only set maximum DMA segment size if DMA is supported
To: Guenter Roeck <linux@roeck-us.net>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-mmc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Christoph Hellwig <hch@lst.de>, Robin Murphy <robin.murphy@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_075153_537412_3845978A 
X-CRM114-Status: GOOD (  16.97  )
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

T24gVHVlLCBTZXAgMjQsIDIwMjQgYXQgMTE6MDHigK9QTSBHdWVudGVyIFJvZWNrIDxsaW51eEBy
b2Vjay11cy5uZXQ+IHdyb3RlOgo+IFNpbmNlIHVwc3RyZWFtIGNvbW1pdCAzMzQzMDRhYzJiYWMg
KCJkbWEtbWFwcGluZzogZG9uJ3QgcmV0dXJuIGVycm9ycwo+IGZyb20gZG1hX3NldF9tYXhfc2Vn
X3NpemUiKSBjYWxsaW5nIGRtYV9zZXRfbWF4X3NlZ19zaXplKCkgb24gYSBkZXZpY2UKPiBub3Qg
c3VwcG9ydGluZyBETUEgcmVzdWx0cyBpbiBhIHdhcm5pbmcgdHJhY2ViYWNrLiBUaGlzIGlzIHNl
ZW4gd2hlbgo+IGJvb3RpbmcgdGhlIHNpZml2ZV91IG1hY2hpbmUgZnJvbSBTRC4gVGhlIHVuZGVy
bHlpbmcgU1BJIGNvbnRyb2xsZXIKPiAoc2lmaXZlLHNwaTAgY29tcGF0aWJsZSkgZXhwbGljaXRs
eSBzZXRzIGRtYV9tYXNrIHRvIE5VTEwuCgpUaGFua3MsIHNlZWluZyB0aGUgc2FtZSB3aXRoIG1t
Y19zcGkgb24gU2lQZWVkIE1BSVggQmlULgoKPiBBdm9pZCB0aGUgYmFja3RyYWNlIGJ5IG9ubHkg
Y2FsbGluZyBkbWFfc2V0X21heF9zZWdfc2l6ZSgpIGlmIERNQSBpcwo+IHN1cHBvcnRlZC4KPgo+
IENjOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KPiBDYzogUm9iaW4gTXVycGh5IDxy
b2Jpbi5tdXJwaHlAYXJtLmNvbT4KPiBDYzogVWxmIEhhbnNzb24gPHVsZi5oYW5zc29uQGxpbmFy
by5vcmc+Cj4gU2lnbmVkLW9mZi1ieTogR3VlbnRlciBSb2VjayA8bGludXhAcm9lY2stdXMubmV0
PgoKVGVzdGVkLWJ5OiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJl
PgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0g
CkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIg
LS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0
ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFs
a2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcg
bGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZh
bGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
