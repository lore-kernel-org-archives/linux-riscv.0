Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80400EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 23:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=N0ncHLg0wN+7U9r3OBvNbdwdrSq7M2quCnJF/KhLJyY=; b=ltzDktxBQFBCYyXRXcAfZeeh6M
	RqOnAnu0CjaE4diD3JrYohslH7CGK0jecZCWYPWBMi+DyEuQhAY+QTYVgOX7lSagw6HBo9q9alIR9
	a/yZsbuLDOg3qMoOF3mcWNebaszuvFpU0fkol6m8EQz736GmQ5fshH4y4O72T9yDsGmlNcF+O3Rjf
	X/1yBaS/YLetMZzvFGnSe8ztvotBHgiVpdyv/FHlY1Vs1b3YYDfX5DpZqWUezndIac/CYTeCHmOIx
	VwNDEp7PJP5Aa4gNzQP9wzD058dAKYDRq0FGbob0K6qBKFxagVT8tz8IosebtmQTfh5uBmEj7lO6U
	G/bPgfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBOYF-009gsZ-24;
	Mon, 19 Jun 2023 23:44:51 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBOYC-009gsC-2b
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jun 2023 23:44:50 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-62fe6580f17so32206916d6.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jun 2023 16:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687218286; x=1689810286;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6NVBN3x4KrAYlFI5NJJMWbkFks+jrlTm7nV+Qf0S1A=;
        b=DC8vg/VHEzuBj5dHLugui1wJEWfATTozq8rSoU8iW2VInUwqg0k2wXK82rVw5yxGGn
         RlIKoLpVcEPPjolbCopKExuQm25nzEsthEm14/fFoQobBCjsKi+QgmyzuuEWEzs2+i1y
         lsTH5vZBqLLJwtcN+9dSjAC1eZRXbfYmbZ9wRkwuW4nYYYEz2LXC10vNCAelvV07NBPz
         S4QkVgD1mdzB9B6wE8bW2ujvYY5bpd0Z/bDsAClhebwveFdviPnpKQ2WEL7haq1GJzvu
         LtRIEXyEPnf2ehWS6/NKpNMZ82VTBDAkC+QS9ST86eY91wRnzgO1IxyKZ6XAX0ohZNXY
         Jxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687218286; x=1689810286;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6NVBN3x4KrAYlFI5NJJMWbkFks+jrlTm7nV+Qf0S1A=;
        b=gaW+dNbqmObJQMb1zfuh3xRK3VH4U5JQSPvyzxPc7kLy9LLOeSHTZXGHsDi5Zca4HM
         vpkTKXDfR3mWVQVcOqZk9laQm6ffBduUfQxYSPeAR8dUwJwXd8cXKCO4qUa3tVBRKNrd
         BIz8VNIGJ3vM7xQcE7Gti9khFZHV47Eux8OAgWCYlqorXYGfw2PFnM13ecmv2J/pREsg
         lM+EqL7XwCQ0D5nC4eFJuseCm3+poovhjLysLjrJDLgwu8J4O9xK0Ac6kUcCJKCuRKy7
         t0wGiF0Ys0Uoe3ELJaQSNo6rYYsD0E1JTILOC6U12XiXtCGp9dAf3D2b8zcc8/a5GvO+
         uPrg==
X-Gm-Message-State: AC+VfDxGUVcherJDfVEkftxjtR652bmQvEzw6pGO4SY/m59Gjaw+FAP5
	obgTYyPSnjpWMkrufq5tXs70RRFL49sWRR3NX2I=
X-Google-Smtp-Source: ACHHUZ6ykADNR4ba4m3MttX4Zwe8bV6FzvLAWlo7P94vWhsGn4ambgFET6InpYy7OQWy9VqozVPvTA==
X-Received: by 2002:ad4:5de8:0:b0:62d:e1ac:7133 with SMTP id jn8-20020ad45de8000000b0062de1ac7133mr11906766qvb.33.1687218286636;
        Mon, 19 Jun 2023 16:44:46 -0700 (PDT)
Received: from localhost ([135.180.227.0])
        by smtp.gmail.com with ESMTPSA id n1-20020a6563c1000000b0054ff075fb31sm177473pgv.42.2023.06.19.16.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 16:44:46 -0700 (PDT)
Date: Mon, 19 Jun 2023 16:44:46 -0700 (PDT)
X-Google-Original-Date: Mon, 19 Jun 2023 09:54:19 PDT (-0700)
Subject: Re: [PATCH v2 1/3] RISC-V: Add Zba, Zbs extension probing
In-Reply-To: <23717157.ouqheUzb2q@diego>
CC: linux-riscv@lists.infradead.org, apatel@ventanamicro.com, aou@eecs.berkeley.edu,
  linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>,
  jszhang@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
  ajones@ventanamicro.com, Evan Green <evan@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: heiko@sntech.de
Message-ID: <mhng-40d6f343-f3cf-4248-8944-c344d60d189a@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_164449_072289_D321F9F0 
X-CRM114-Status: UNSURE (   8.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gV2VkLCAxMCBNYXkgMjAyMyAwNzo0NTo1MCBQRFQgKC0wNzAwKSwgaGVpa29Ac250ZWNoLmRl
IHdyb3RlOgo+IEFtIERpZW5zdGFnLCA5LiBNYWkgMjAyMywgMjA6MjU6MDEgQ0VTVCBzY2hyaWVi
IEV2YW4gR3JlZW46Cj4+IEFkZCB0aGUgWmJhIGFkZHJlc3MgYml0IG1hbmlwdWxhdGlvbiBleHRl
bnNpb24gYW5kIFpicyBzaW5nbGUgYml0Cj4+IGluc3RydWN0aW9ucyBleHRlbnNpb24gaW50byB0
aG9zZSB0aGUga2VybmVsIGlzIGF3YXJlIG9mIGFuZCBtYWludGFpbnMKPj4gaW4gaXRzIHJpc2N2
X2lzYSBiaXRtYXAuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEV2YW4gR3JlZW4gPGV2YW5Acml2b3Np
bmMuY29tPgo+PiBSZXZpZXdlZC1ieTogQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3Jv
LmNvbT4KPj4gUmV2aWV3ZWQtYnk6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAcml2b3NpbmMuY29t
Pgo+Cj4gUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5l
dT4KCkp1c3QgRllJOiBiNCBpcyBnaXZpbmcgbWUgdGhpcwoKICAgIE5PVEU6IHNvbWUgdHJhaWxl
cnMgaWdub3JlZCBkdWUgdG8gZnJvbS9lbWFpbCBtaXNtYXRjaGVzOgogICAgICAgICEgVHJhaWxl
cjogUmV2aWV3ZWQtYnk6IEhlaWtvIFN0dWVibmVyIDxoZWlrby5zdHVlYm5lckB2cnVsbC5ldT4K
ICAgICAgICAgTXNnIEZyb206IEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+CiAgICBO
T1RFOiBSZXJ1biB3aXRoIC1TIHRvIGFwcGx5IHRoZW0gYW55d2F5CgpJIGFkZGVkIGl0LiAgTm8g
YmlnIGRlYWwgb24gbXkgZW5kLCBJIGFsc28gc2VuZCBlbWFpbCBmcm9tIHJhbmRvbSBhZGRyZXNz
ZXMKdGhhdCBhcmUgZGlmZmVyZW50IGZyb20gbXkgdHJhaWxlcnMuICBJdCdzIGp1c3QgdGhlIGZp
cnN0IHRpbWUgSSByZW1lbWJlciBiNApzYXlpbmcgc29tZXRoaW5nLgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
