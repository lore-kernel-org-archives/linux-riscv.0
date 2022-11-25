Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2158EC4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 10:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iodARbyiVUxxI0wyvBEJBMckhol5/EQDl2HspowyxdU=; b=VrafSixE7tyodq
	Sv1uuGTIHzlUP4u9s2oxoqelU6r/M0sKiVZ+VsFXWYEIqZczCipA4c8F2Ypl00FkZGWMVGryL/ELo
	fc7S7SMAltYKIdZy8ztgDvc7wZlLXc3CgturD7/RQzeix76DcME3k756C9lx5Pw/CBNhTE7iTgatl
	Z8U4Y2l5/0u5lNPqdI6JChsKeXOtAJGOxkGyLi/03CZn3zov0P+vDzu69M4epwstEPGryRZ1QPJRX
	wew9wLCBnR4O+/c5rDsdgHBHHsg4kjZqxoFEwQpub8v2i4WOHF23VfJnv/ZY5q1xF06+XHjteVXei
	KnxKu0vVa638uck3Rt1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVt3-00FOV0-Pc; Fri, 25 Nov 2022 10:24:49 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyVXn-00FCl7-E6
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 10:02:52 +0000
Received: by mail-ed1-x52f.google.com with SMTP id e13so5702085edj.7
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 02:02:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WHVG/ftyLvsI2SLH3rhoCHZquoZnr7zU2xMaBrAelgg=;
        b=nBSz6UY3qO3u7pzvCu/9sA4R5b3f0sCG0JEJ6y5sDJmo4jOuZljZSY5Kx85GcQBqUH
         u7+e9RK1KwZnZHpTcDlT9gYxMmCQL2AfWK/E5W4fh98OKTdQEpPPCjGQg035INwJVfnZ
         jukZLROa1+QwmCyRT8jtBdW8sfUBvhYjVwdA/ghxCPDp8stJxjhLb8n8/h9GyIARHNqv
         syA/KbDn+Oxd57kaAbwCdPZaJhklrLgy4mtczKkR3d1R67fIjJVMsctbq5wcomOqnblG
         FpSCcjWxeUtKlvLSNpJyt7YzfT9S42QEdDeKtBmAmZTVpxiBrcWvho5guuA1hauRwJwR
         f75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WHVG/ftyLvsI2SLH3rhoCHZquoZnr7zU2xMaBrAelgg=;
        b=gTeJfQedkTr26rYnt18toXjoOxaxnp85I3ABo5ce+c68P0g2+Uln2Oqzoz+FHzdhQr
         owPuvWzirlNckaorOfS0xnqaNAtrmqXCRObIIWRn7gWHFSwdzDz4RBU67SJMmC5ih7t/
         cM3xkId7qOaMwg4YzTQ3W9x6BaF4oikRDw5TvQtMbZjgybbWOYWrfWLi3bpuh6PLs93T
         aZxpnbP/6WtVKefBCVRhRfHO7PpZVExkFU0/yuNy4NH5Y9+EkP0VRp/kk20pc/CR8R5a
         5b2rcMhrzpxsoyGFZqUae5Te14s7hWnbfNY6Dua/Dbt4ET3e1V5DhYinvCQCP8+AvPPg
         lDNw==
X-Gm-Message-State: ANoB5pkCHK1qotkYfJBwLL/xI5+BxvnKYV5NA9jtmpV6fnBuUdJ7RpPV
	wiirAcgtsCrL9CECj7Yp9g1ab92EeiFN4n+p9x4=
X-Google-Smtp-Source: AA0mqf6qdSUyHdl8QC7NBwyDgjeso78W0GVOCIlAOjzRLR1Pa8cTfhmrPWjNmHdP97HIJya+K4baeTLeV83DY1C7pMo=
X-Received: by 2002:a05:6402:2987:b0:45c:a9d3:d535 with SMTP id
 eq7-20020a056402298700b0045ca9d3d535mr33749986edb.0.1669370568259; Fri, 25
 Nov 2022 02:02:48 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Y3/LgZkR1hkblJ8D@spud> <4801607.MHq7AAxBmi@diego>
In-Reply-To: <4801607.MHq7AAxBmi@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 10:02:21 +0000
Message-ID: <CA+V-a8sT8VxpeM=eBgmDeojOka-LDmvP4JkhVfEDKi3D3VOsmw@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] riscv: asm: alternative-macros: Introduce
 ALTERNATIVE_3() macro
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_020251_511830_30DEBE57 
X-CRM114-Status: GOOD (  15.45  )
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

SGkgSGVpa28sCgpPbiBUaHUsIE5vdiAyNCwgMjAyMiBhdCA3OjU4IFBNIEhlaWtvIFN0w7xibmVy
IDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Cj4gQW0gRG9ubmVyc3RhZywgMjQuIE5vdmVtYmVy
IDIwMjIsIDIwOjUyOjMzIENFVCBzY2hyaWViIENvbm9yIERvb2xleToKPiA+IE9uIFRodSwgTm92
IDI0LCAyMDIyIGF0IDA1OjIyOjAxUE0gKzAwMDAsIFByYWJoYWthciB3cm90ZToKPiA+ID4gRnJv
bTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29t
Pgo+ID4gPgo+ID4gPiBJbnRyb2R1Y2UgQUxURVJOQVRJVkVfMygpIG1hY3JvLgo+ID4KPiA+IEJp
dCBwZXJmdW5jdG9yeSBJIHRoaW5rISBUaGVyZSdzIGEgbG92ZWx5IGNvbW1lbnQgZG93biBiZWxv
dyB0aGF0IHdvdWxkCj4gPiBtYWtlIGZvciBhIGJldHRlciBjb21taXQgbWVzc2FnZSBpZiB5b3Ug
d2VyZSB0byB5b2luayBpdC4KPiA+IENvbnRlbnQgbG9va3MgYWJvdXQgd2hhdCBJJ2QgZXhwZWN0
IHRvIHNlZSB0aG91Z2guCj4KPiBBbHNvIGJvdGggdGhlIGNvbW1lbnQgb24gdGhlIG9yaWdpbmFs
IEFMVEVSTkFUSVZFXzIgYW5kIHRoZSBuZXcgQUxURVJOQVRJVkVfMwo+IHNob3VsZCBwcm9iYWJs
eSBiZSBtZXJnZWQgaW50byBhIHNpbmdsZSBjb21tZW50IGV4cGxhaW5pbmcgdGhpcyBvbmNlIGZv
ciBhbGwKPiBBTFRFUk5BVElWRV94IHZhcmlhbnRzLgo+Cj4gRXNwZWNpYWxseSB3aXRoIHRoZSBk
bWEgc3R1ZmYsIEknbSBwcmV0dHkgc3VyZSB3ZSdsbCBnZXQgYXQgbGVhc3QgYW4gQUxURVJOQVRJ
VkVfNAo+IGlmIG5vdCBldmVuIG1vcmUgOy0pIC4gU28gd2UgZGVmbml0bHkgZG9uJ3Qgd2FudCB0
byByZXBlYXQgdGhpcyBtdWx0aXBsZSB0aW1lcy4KPgpEbyBhZ3JlZS4gSG93IGFib3V0IHRoZSBi
ZWxvdz8KCi8qCiAqIFNpbWlsYXIgdG8gd2hhdCBBTFRFUk5BVElWRV8yKCkgbWFjcm8gZG9lcyBi
dXQgd2l0aCBhbiBhZGRpdGlvbmFsCiAqIHZlbmRvciBjb250ZW50LgogKi8KClNvIHRoZSBvdGhl
ciBBTFRFUk5BVElWRV8yKygpIG1hY3JvcyB3aWxsIGtlZXAgb24gYnVpbGRpbmcgb24gaXQuCgpD
aGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
