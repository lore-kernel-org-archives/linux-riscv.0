Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A7F4EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 19:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ax3bnHJPTzBIAWxd/bdLA7ybRRlmDwqwsPkrCHglw58=; b=rKcfKe2sHTBmD/Angy7jCNS7TH
	nbU3DvJz7XdKnmFXBSWL39pKxj/BRh0BNoVdI0m4VX22NrV6X+WO8D4ChwILR9w7be/cGAfSCvqUZ
	2xBGALBlmVH0jnO36GDVBZ/VuMoaJBbUbGu8+Fcb+8/lH+VYvUxv3/TwmjsItMYSkXLZ7FrMDIf/8
	jSDzgmI34F282JaQCAVyop6B/wkPO9+ffKgZeQamJMHTF2sFrSPeE+6ojlnJGPnv7GZE4DCCu76bb
	6itu6VZLR/WU6f0m+5cLkOcw4i+4PKZ/VovG/3L53N6EBVWmGzUyeey/uDYEgDOeT487aWvqmcXJQ
	nL+hL7+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhF1-00CChh-25;
	Tue, 20 Jun 2023 19:42:15 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBhEy-00CCgs-2V
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 19:42:14 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1b51780c1b3so39751045ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 20 Jun 2023 12:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687290131; x=1689882131;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KHU5CwA5u8pSrmDppHcT4qFU7dGFryoenZ6OqORvEs8=;
        b=F/4PvAGbsDJNMQNZRVwv4lMqDOI41XUjCyn+5TQG4/s17oVEsd/Cihbm/Sxav0pkON
         pbv+U1N1KxMshXDXoW0C1j7II1qehV4llRKEAU8f8IVNfBRrhB739/AtdkiR4SbEkkCC
         R4teCwxSranNzpKONPzRHai9FyQf+zBbHejZUcNu5JtGkDDxcwRaoFlUMXm4sVwudHyC
         sTzdUjL+NShCSigwrAroMAwD29HI4El1WLCPgJrbam8yzZDr7ogsO/PvbAfbzmrCQKTN
         bAk1Jj6SmKaaHKM566zCi6lNRuDtsbc6lXb+mV8AyeA0qaVlJK1yd8SMdgEy988DbhFE
         33ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687290131; x=1689882131;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KHU5CwA5u8pSrmDppHcT4qFU7dGFryoenZ6OqORvEs8=;
        b=XCqRTZslDBfMpFY1LEgJLFg0m0smqLq59gwaueuyOyq5/4wV2fp+GsFF14mSx9KCn5
         BMuI1YqeDXxtt4FVS5Ski/oJFmROt6Q0GVJUJ9io9q9ORi2j+IkTBRhGWhPE7K/1PPvS
         9LP/R4uOTstp5KdVki382At2oOvvJMk8ZqfNossuOo3i8JUxY5PMxyG5hEfFf6hLlHbL
         QpuZgXhR+jISfm/pGUHvY/YWq7opqTGdsDeBMGweqiw5W2Pg5FtBqDbD2O379g0td2XO
         e80CSBDv7u47dAz6UWZeF5pR1xTDm+xRRiQ+iO8X/iZaUsqyT4ThA4+266hi6+OwSfKH
         S8xg==
X-Gm-Message-State: AC+VfDxV0c0BRKuFEnpXfigXyBOrcULJXqOGuFnJ1ryrqWgVzWbkQR41
	++uFJ1W8qd/8Cga9lLQSmYSTzA==
X-Google-Smtp-Source: ACHHUZ7M5H+Lb2l7RjrGwDbavqFd07Q1CmIGajRPCoPGx5ZVej4nFjxGA1fiO3QiDimYzv6xtZ1t2A==
X-Received: by 2002:a17:903:48a:b0:1b5:cbc:b4c with SMTP id jj10-20020a170903048a00b001b50cbc0b4cmr12337830plb.46.1687290131574;
        Tue, 20 Jun 2023 12:42:11 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id jm2-20020a17090304c200b001b558c37f91sm1950372plb.288.2023.06.20.12.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 12:42:11 -0700 (PDT)
Date: Tue, 20 Jun 2023 12:42:11 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 12:41:31 PDT (-0700)
Subject: Re: [PATCH v5 1/4] RISC-V: add Zbc extension detection
In-Reply-To: <75cf8335-af1f-e06c-c770-b2b540e812ed@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, heiko@sntech.de,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, herbert@gondor.apana.org.au, davem@davemloft.net,
  Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  linux-crypto@vger.kernel.org, christoph.muellner@vrull.eu, heiko.stuebner@vrull.eu
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Jeff Law <jlaw@ventanamicro.com>
Message-ID: <mhng-5286e1ed-b3ae-40ce-bd33-8871a1a07f3a@palmer-ri-x1c9a>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_124212_814034_475ECD96 
X-CRM114-Status: GOOD (  16.46  )
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

T24gVHVlLCAyMCBKdW4gMjAyMyAxMjozNzowMCBQRFQgKC0wNzAwKSwgSmVmZiBMYXcgd3JvdGU6
Cj4KPgo+IE9uIDYvMjAvMjMgMTM6MDksIFBhbG1lciBEYWJiZWx0IHdyb3RlOgo+PiBPbiBNb24s
IDEyIEp1biAyMDIzIDE0OjMxOjE0IFBEVCAoLTA3MDApLCBDb25vciBEb29sZXkgd3JvdGU6Cj4+
PiBIZXkgSGVpa28sCj4+Pgo+Pj4gT24gTW9uLCBKdW4gMTIsIDIwMjMgYXQgMTE6MDQ6MzlQTSAr
MDIwMCwgSGVpa28gU3R1ZWJuZXIgd3JvdGU6Cj4+Pj4gRnJvbTogSGVpa28gU3R1ZWJuZXIgPGhl
aWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+Pj4+Cj4+Pj4gQWRkIGhhbmRsaW5nIGZvciBaYmMgZXh0
ZW5zaW9uLgo+Pj4+Cj4+Pj4gWmJjIHByb3ZpZGVzIGluc3RydWN0aW9uIGZvciBjYXJyeS1sZXNz
IG11bHRpcGxpY2F0aW9uLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGVpa28gU3R1ZWJuZXIg
PGhlaWtvLnN0dWVibmVyQHZydWxsLmV1Pgo+Pj4+IC0tLQo+Pj4+IMKgYXJjaC9yaXNjdi9LY29u
ZmlnwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwo+
Pj4+IMKgYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9od2NhcC5oIHzCoCAxICsKPj4+PiDCoGFyY2gv
cmlzY3Yva2VybmVsL2NwdS5jwqDCoMKgwqDCoMKgwqAgfMKgIDEgKwo+Pj4+IMKgYXJjaC9yaXNj
di9rZXJuZWwvY3B1ZmVhdHVyZS5jIHzCoCAxICsKPj4+PiDCoDQgZmlsZXMgY2hhbmdlZCwgMjUg
aW5zZXJ0aW9ucygrKQo+Pj4KPj4+IFBsdW1iaW5nIGludG8gdGhlIGh3cHJvYmUgc3R1ZmYgd291
bGQgYmUgbmljZSwgYnV0IHRoYXQncyBub3QgYQo+Pj4gcmVxdWlyZW1lbnQgZm9yIGdldHRpbmcg
c3R1ZmYgbWVyZ2VkIDopCj4+Cj4+IElJUkMgd2UgdGFsa2VkIGFib3V0IHRoaXMgb24gSVJDLCBi
dXQgSU1PIHdlIHNob3VsZG4ndCByZXF1aXJlIHNvbWV0aGluZwo+PiBiZSB1c2VyIHZpc2libGUg
Zm9yIGl0IHRvIGJlIG1lcmdlZCBpbiB0aGUga2VybmVsLgo+IE5vdGUgdGhhdCBleHBvc2luZyBa
YmMgaXMgcG90ZW50aWFsbHkgdXNlZnVsLiAgV2UndmUgZ290IEdDQyBhbmQgTExWTQo+IGNvZGUg
dGhhdCBjYW4gZGV0ZWN0IGFuZCByZXdyaXRlIGEgYml0d2lzZSBDUkMgaW50byBjbG11bC4KCllh
LCB0aGVyZSdzIGFub3RoZXIgdGhyZWFkIGFib3V0IGFkZGluZyBpdC4gIElNTyB3ZSBzaG91bGQg
ZG8gc28sIGp1c3QgCnRoYXQgd2Ugc2hvdWxkbid0IGdhdGUga2VybmVsIHN1cHBvcnQgb24gYWxz
byBzb3J0aW5nIG91dCB0aGUgdUFCSSBhcyAKc29tZXRpbWVzIHRoYXQncyBjb21wbGljYXRlZC4K
Ckl0J3Mgc2ltcGxlIGZvciB0aGlzIG9uZSwgdGhvdWdoLCBzbyBJJ20gbm90IG9wcG9zZWQgdG8g
dGFraW5nIGl0IGZvciAKdGhlIG1lcmdlIHdpbmRvdyBpZiBpdCBzaG93cyB1cCBpbiB0aGUgbmV4
dCBkYXkgb3IgdHdvLi4uCgo+Cj4gSmVmZgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
