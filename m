Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F1AC531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Aug 2024 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HQDFNITHiP/wxVvhpXEjwEjnBhJd7MGhAAiGcOqIhA=; b=ATlGrdmVKJnzok
	yTU3NnElVsn04lW7+YbTK6LMqMjC052QlqWkZkV8kwH6yh4anBI1/+dy8Qnw6H1M4S4j6vpTfGJ4J
	yvRL/OFDNuKJFi2VBMcxXtYRBRMGZmxaUTtLvTXOhJ1kc4QxNAJjJKQL+LAsp0N7bb2cA9G8oJ42r
	yDteNlJuMQQ/5icuzML2hswZV0hJUEU0D5fa1B/7d3psvISrzM09Fh9ynwfWZLV3ik2jVjXTPr7RY
	oJCeUR/d+SFuiqvdnpFJ2LjnXrz6eZO0HiUMio8lw6Sg07eJMy26xwf6EPid5ByGmJchw8nzdAfLs
	Av2Pe8+vJKeClx4yzoEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWWJ-0000000HO7Q-1Jd6;
	Fri, 23 Aug 2024 15:48:11 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1shWSk-0000000HMgp-3Gna
	for linux-riscv@lists.infradead.org;
	Fri, 23 Aug 2024 15:44:32 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5334c4d6829so2806382e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2024 08:44:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724427869; x=1725032669; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rUKpTbjTMGO6d8DrZaKlv/gPDbWH6oSJzFoDGFB2HMI=;
        b=gL53ug+N/VS1ILJ2grglBlXz3sTOjZ9XjYcR2lFyXPs1HXe7M5NIsNFPXhxTUBRxb4
         LAt3KYZaBadqNG5EQnu36aSpHDtSe5OXFmh9zo/fUBq6R3r+w/MIAe4SRueWlnv6DTV4
         NPXs2Go1b4WhaTyQ1LcKVnFG5tB6OoqZ5HuG/s6pupW3IPHLuBnOahpxYY4SR7dvKaTn
         576HQEjbknk0rXOJJSP/5m8xOxYpwShKRVj9uJA5RaFG4I4naFdimbKbNy5hM2RsuXvA
         7FYdbJstdUOXxZgA7sC832iVl+eDeZsIkhysVa8cuXlXl4Yk977Nhzs+WFvsGU1K+Old
         lQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724427869; x=1725032669;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rUKpTbjTMGO6d8DrZaKlv/gPDbWH6oSJzFoDGFB2HMI=;
        b=B7jV6wNhTZPN0lD2sNRvTto96ZKUO5BPc3pKqosIMBQlUyqgWpTXmBEzAfifAS3eJ/
         rAEq+BVCe4oy6ZVRZOELqilD9An9++zNzF67wBUKi0Sxr2PgzBna9eYNOT8XlcQaIGY9
         Maf2Mn6VTxkS+qMXhNxHbsMm2ZXP8U3DZ7pF+Nfbv/82QBZuvBy6BzeaMgaJm4AjXJdt
         dpkHEsx6ht8ZrPOJD7H8u8v47zINKG3MFOnKaHgMpT2spuJy5hdMTF9KDPrBgyHY9Lk3
         qOZpLoLmNRICogrEZktoremn03rHuG9yq5N+bF2B31AZHA98tG3ynGvSqTOvLGvYxF9D
         1T1g==
X-Forwarded-Encrypted: i=1; AJvYcCW4TjhrZdDhJXSyB8GnNx3fQVUqKjd9L94sL533t0DHbekRhmytb5W+FSrnp4T93peARa9fwaY74LYUAw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwmAvuge6erqAhtvtDKQf04wAxwyypUWEM8HtxMaQFj8fweg/4t
	cA2ojktWUx8aMGDWAEY0vge3f9yD5Y45z/bVZdYDr7+OqST8YSh/XGTr4BdHgeZaNw4iSjQ/uFT
	v5t22NruRAVURMS8IMda3d1JlLnDV5YxMKudk0g==
X-Google-Smtp-Source: AGHT+IGLphY6wmw4p3puKJ7pV1BhETJaO8yEFBVUQMStXaSJMfBctlVKM+lBdvBVLSNIacxc9U5SyjAaRt7G1oWZN4M=
X-Received: by 2002:a05:6512:3191:b0:533:44d7:c055 with SMTP id
 2adb3069b0e04-5343876c109mr1889079e87.5.1724427868274; Fri, 23 Aug 2024
 08:44:28 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB4953DC78BB0FE0C57EA94F91BBB32@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 23 Aug 2024 17:44:17 +0200
Message-ID: <CACRpkdbaDW2=R881G9C=r1iW4YNdYpRZ2kHaN63T7EX1A0xVrA@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] riscv: sophgo: Add pinctrl support for CV1800
 series SoC
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen Wang <unicorn_wang@outlook.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Drew Fustini <dfustini@baylibre.com>, Haylen Chu <heylenay@outlook.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_084430_837784_704FE240 
X-CRM114-Status: GOOD (  16.58  )
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

T24gRnJpLCBBdWcgMiwgMjAyNCBhdCAyOjM04oCvQU0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QG91dGxvb2suY29tPiB3cm90ZToKCj4gQWRkIGJhc2ljIHBpbmN0cmwgZHJpdmVyIGZvciBTb3Bo
Z28gQ1YxODAwIHNlcmllcyBTb0NzLgo+IFRoaXMgcGF0Y2ggc2VyaWVzIGFpbXMgdG8gcmVwbGFj
ZSB0aGUgcHJldmlvdXMgcGF0Y2ggZnJvbSBKaXNoZW5nIFsxXS4KPiBTaW5jZSB0aGUgcGluY3Ry
bCBvZiBjdjE4MDAgaGFzIG5lc3RlZCBtdXggYW5kIGl0cyBwaW4gZGVmaW5pbmF0aW9uCj4gaXMg
ZGlzY3JldGUsIGl0IGlzIG5vdCBzdWl0YWJsZSB0byB1c2UgInBpbmN0cmwtc2luZ2xlIiB0byBj
b3ZlciB0aGUKPiBwaW5jdHJsIGRldmljZS4KPgo+IFRoaXMgcGF0Y2ggcmVxdWlyZSBhbm90aGVy
IHBhdGNoIFsyXSB0aGF0IHByb3ZpZGVzIHN0YW5kYXJkIGF0dHJpYnV0ZQo+ICJpbnB1dC1zY2ht
aXR0LW1pY3Jvdm9sdCIKPgo+IE5vdGU6IEFzIGN1cnJlbnQgZG9jdW1lbnRhdGlvbiBpcyBub3Qg
ZW5vdWdoIHRvIGd1ZXNzIHRoZSBwaW4KPiBjb25maWd1cmF0aW9uIG9mIEh1YXNoYW4gUGksIG9u
bHkgdGhlIHBpbmN0cmwgbm9kZSBpcyBhZGRlZC4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9saW51eC1yaXNjdi8yMDIzMTExMzAwNTcwMi4yNDY3LTEtanN6aGFuZ0BrZXJuZWwub3Jn
Lwo+IFsyXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvSUExUFIyME1CNDk1MzQ2MjQ2MjQ1
MDc0MjM0RDMzN0E2QkJBQzJASUExUFIyME1CNDk1My5uYW1wcmQyMC5wcm9kLm91dGxvb2suY29t
Lwo+Cj4gQ2hhbmdlZCBmcm9tIHYzOgo+IDEuIGJpbmRpbmc6IGRyb3AgdW5uZWNlc3NhcnkgdHlw
ZQo+IDIuIGJpbmRpbmc6IHVzZSByaWdodCByZWYgZm9yIHBpbiBub2RlLgo+IDMuIGJpbmRpbmc6
IHJlbW92ZSBtaXhlZCBzcGFjZXMgYW5kIHRhYnMuCgpUaGlzIHY0IGxvb2tzIGdvb2QgdG8gbWUg
YW5kIGhhcyBuZWNlc3NhcnkgQUNLcy4KCkl0IGNvbnRhaW5zIGRldmljZSB0cmVlIHBhdGNoZXMg
d2hpY2ggSSBhbSBpY2t5IHRvIG1lcmdlIGJ1dApJIGNhbiBtZXJnZSB0aGUgcmVzdCBhbmQgZ2l2
ZSB5b3UgYW4gaW1tdXRhYmxlIGJyYW5jaCBpbiB0aGUKcGluY3RybCB0cmVlIHRoYXQgdGhlIEFS
TSBTb0MgbWFpbnRhaW5lcnMgY2FuIHB1bGwgaW4gdG8KbWVyZ2UgdGhlIGRldmljZSB0cmVlcywg
ZG9lcyB0aGlzIHdvcmsgZm9yIHlvdT8KCllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
