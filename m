Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A387EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Jul 2023 20:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kXR0hac8xwrZdjqsqd5U9cRy1BTzxSweTg0xo/UhlsQ=; b=Noh7p9DAXCh9eC
	cNwaE/O3eG0iFD2IaoaCxRGsLjPmbGSRF5vsLixhYnEdJ3WHGCE97cwCL1I8WQzvCikouKDxvPzJS
	Eqx9Ab8yHZYkWpTJQHWuv5MpMfIykOC64HEuCVREGWya+bRSMSskbjkY/HeOkK9/Wgn4ek65n2M1m
	lMLgtoREGodmodIGaUw8lFIAfaIHPunFSU9JRVkvXvK3uhEuJ0wfgzXFVeoewpyBrF9z87XTLXIVP
	E4oQLUYLP87w15T17ITnm4DNuKvul5BdqXoc149mz9a2XxB6wu4MX1U++/yUwRnqzFFsRvfwUCc5U
	NOT7TsN57JJNtBTKnR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9Kc-00H2i8-0P;
	Wed, 05 Jul 2023 20:42:34 +0000
Received: from mail-qv1-xf2a.google.com ([2607:f8b0:4864:20::f2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qH9KZ-00H2gf-2d
	for linux-riscv@lists.infradead.org;
	Wed, 05 Jul 2023 20:42:33 +0000
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-635dd1b52a2so658126d6.3
        for <linux-riscv@lists.infradead.org>; Wed, 05 Jul 2023 13:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1688589746; x=1691181746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9IOBh2dErzq5pc0UHadZ7sAXf6kWe3n0/dn9RfHGYo=;
        b=dh4WoR3tlKTcrXQJem35j9FNYUIenpsZPsRsu3o2yL/euzR3wgpNzFqRsyPvjtniX9
         BGsTSgz5HwMiKXmztwf6HK4vEMBgpB3lkyj2Cz211Vf4iA518z0wdqt9dCU0H2kDwDO7
         0tDgNaFk3pNdxVbcagamldZztzPyJDuioE1zv9d4+rARk5gQ3SJC+ChUBasjRWHRlwe3
         D126qlNKwo+q/dkpU41pQ2FTa+o3P/2ij5eqp4c71aNUxifzhGntBeO1zSGWy1Je06Kx
         1FuuX3Tky8IM1L5vLiI/e3mB66822aXFocZSTtzWT5cFoQ9Pq3Nn0sUAB/1QwATZD6N+
         M+eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688589746; x=1691181746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k9IOBh2dErzq5pc0UHadZ7sAXf6kWe3n0/dn9RfHGYo=;
        b=AWDbcUr8ZpEdGChDutjr+Scfgg2BH+XK/v59jV8bLrzI0bc94N039oyW+mC6ZQBKDL
         dVbPg0s+rKAIyrAfOR5t/mWg8XccJZYsNZeRvTTK+j4c8hdKJEHZ0EtL6k2RZdWtFU17
         7Ns7UNp2kVrgldJ4ogq2J1yi+FdwKIvVi/velFCKX/v4yz8571OZ02e5kB9/f1gmHzJg
         B5UMCM95nqY670UKRLAYu5ETwsqauKonW9WJ6zurqjl+ObARlD5pc15Xo8GDL88Lxj/M
         V+fHSP7tdPbefQoUTFsm0j1hHdhTzz9qbXOrjhbUSmmf6USInaHDVDgW+er+WrUNzCyY
         VvyA==
X-Gm-Message-State: ABy/qLZfrzuxkBiDFI+1aJb8U2+ZlHJ1F9MArPHQOma+oIWNTYjOHU+d
	b04cC1yMSaTR5NBo4fS3wQ2alodYmzj4UVyvGMfxXQ==
X-Google-Smtp-Source: APBJJlGWRpwfhA4itLA+4UG2F5/nsuTLfZv6whI8ChgzNcaYXQwv2I0wbKEv2ceM7nlvKMw4nMyhYlyjVDw07pw7s9E=
X-Received: by 2002:a05:6214:b6c:b0:636:cc82:8cb4 with SMTP id
 ey12-20020a0562140b6c00b00636cc828cb4mr12099439qvb.33.1688589746277; Wed, 05
 Jul 2023 13:42:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230629234244.1752366-8-samitolvanen@google.com> <20230630-phrasing-strung-12e53988ad81@spud>
In-Reply-To: <20230630-phrasing-strung-12e53988ad81@spud>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Wed, 5 Jul 2023 13:41:49 -0700
Message-ID: <CABCJKue+4E7mbzkZqsUYzwUf9VY4+nY6+5E1aF_XyQito_399g@mail.gmail.com>
Subject: Re: [PATCH 0/6] riscv: KCFI support
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230705_134231_854584_62FA02AA 
X-CRM114-Status: GOOD (  14.86  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEp1biAzMCwgMjAyMyBhdCAxMTo0OOKAr0FNIENvbm9yIERvb2xl
eSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZXkgU2FtaSwKPgo+IE9uIFRodSwgSnVu
IDI5LCAyMDIzIGF0IDExOjQyOjQ1UE0gKzAwMDAsIFNhbWkgVG9sdmFuZW4gd3JvdGU6Cj4gPiBU
aGlzIHNlcmllcyBhZGRzIEtDRkkgc3VwcG9ydCBmb3IgUklTQy1WLiBLQ0ZJIGlzIGEgZmluZS1n
cmFpbmVkCj4gPiBmb3J3YXJkLWVkZ2UgY29udHJvbC1mbG93IGludGVncml0eSBzY2hlbWUgc3Vw
cG9ydGVkIGluIENsYW5nID49MTYsCj4gPiB3aGljaCBlbnN1cmVzIGluZGlyZWN0IGNhbGxzIGlu
IGluc3RydW1lbnRlZCBjb2RlIGNhbiBvbmx5IGJyYW5jaCB0bwo+ID4gZnVuY3Rpb25zIHdob3Nl
IHR5cGUgbWF0Y2hlcyB0aGUgZnVuY3Rpb24gcG9pbnRlciB0eXBlLCB0aHVzIG1ha2luZwo+ID4g
Y29kZSByZXVzZSBhdHRhY2tzIG1vcmUgZGlmZmljdWx0Lgo+Cj4gPiBiYXNlLWNvbW1pdDogYzZi
MDI3MTA1M2U3YTVhZTU3NTExMzYzMjEzNzc3ZjcwNmI2MDQ4OQo+Cj4gQ291bGQgeW91IHBsZWFz
ZSByZWJhc2UgdGhpcyBvbiB0b3Agb2YgdjYuNS1yYzEgd2hlbiB0aGF0IGNvbWVzIG91dD8KPiBU
aGlzIGJhc2UtY29tbWl0IGlzIHNvbWUgcmFuZG9tIGNvbW1pdCBmcm9tIExpbnVzJyB0cmVlLCB0
aGF0IGJlY2F1c2Ugd2UKPiBhcmUgY3VycmVudGx5IGluIHRoZSBtZXJnZSB3aW5kb3cgaGFzIGlz
IG5vdCBpbiB0aGUgUklTQy1WIHRyZWVzIHlldCwKPiBhbmQgbWVhbnMgdGhlIHNlcmllcyB3YXNu
J3QgYXBwbGllZCBieSBvdXIgQ0kgc3R1ZmYuCgpTdXJlLCBJJ2xsIHNlbmQgdjIgcmViYXNlZCBv
biB0b3Agb2YgLXJjMSBvbmNlIGl0J3Mgb3V0LiBUaGUgcmFuZG9tCmNvbW1pdCB3YXMgdGhlIFRv
VCBhdCB0aGUgdGltZSB0aGlzIHNlcmllcyB3YXMgc2VudCBvdXQuCgpTYW1pCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
