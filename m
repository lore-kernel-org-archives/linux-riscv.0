Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A66D5C77B70
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 08:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t18XBVRJMxRGrzcc3yD6R7jptgwZq56MDCCQ1N4AXVU=; b=qeoUl3OI80be8X
	81KBCMLl0oApiSM0ZhBPcc4zH/CNfrIxPuTTlDKbrG4VI1uyc4SdWfoVtvHDoa7NhVQyuo9ZZngMX
	wHIioMH3/Ahk0neTh46IZCtnoUmS8psgSrmG7XCR0rueXpNp/ndizkeThtAExZUZh5wQJHkPqNE9V
	q9sPDzhLZSD8Mxs3MDPseslI7W3cn1KwAxQ/LtN0E68tawUX53Jfb/tthFKtKs+jjFG+uB+cPSp8t
	Z17pQtaNYrBV1BnuLytl932EGj8oiPLpgUTaOyiIXMNUKhGBWaT8JtFL5TAq1aK+P9LaOwE+drTQG
	HXvW3Ya3fwGqYq8cOEbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poKbo-00FQqH-09;
	Mon, 17 Apr 2023 08:53:12 +0000
Received: from mail-yw1-f175.google.com ([209.85.128.175])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poKbm-00FQpM-0D
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 08:53:11 +0000
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-54c0c86a436so529317317b3.6
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 01:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681721587; x=1684313587;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mu7Hch1DiBF07SUCPix+0KBbOFjQRP+x98Um6bdp30s=;
        b=Vfn+nf/RNYZ0JR3tI3J+XnkJNtNgZCUADapQ9VA7UJ0PVlkWpn569UuAzphVlmtXdy
         mnUkoWo3rycOMz20kC/teQfcOQMvtPeLv47yzcxxu7Gc76RbOe/MHEGRwQPT3+ZfGHM3
         wGXbbX+DZsSJojh2R2l+OUyLg3wDW5NZ+KkzG011sGzRqiISHf0ASD1w2Ao5QuuuV8bO
         wimOr7on/nez5z840f5IrPYfsF1JM6n0sHwOOxVR7o1VrLsOkCAQgMohm7L7eudf+WK+
         V6RCos2MOHopmrathOphXIBuK8a/H+e14WOqohnxUmeG7oqeOqk1cvIcusCX5mgqEi/a
         eH9A==
X-Gm-Message-State: AAQBX9dAqfRaXOYXYzdcWNXy2v+TguKC5bRsrKkuJloNgOgYceqNaT4O
	QqPxHdPPjWk7vY8fxvuLyRz5w2/oQDqiXw==
X-Google-Smtp-Source: AKy350agyjk9Dym5K4UpPC4nk0JgDHle1hChT2VEaUkgGzRaIpUfD8nqhqq7ZRk+NZ31KIW09/YNIg==
X-Received: by 2002:a81:4fd6:0:b0:54f:1185:b591 with SMTP id d205-20020a814fd6000000b0054f1185b591mr15635173ywb.44.1681721586911;
        Mon, 17 Apr 2023 01:53:06 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id bg27-20020a05690c031b00b0054fb9f870b6sm3009333ywb.113.2023.04.17.01.53.06
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Apr 2023 01:53:06 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id t16so12090955ybi.13
        for <linux-riscv@lists.infradead.org>; Mon, 17 Apr 2023 01:53:06 -0700 (PDT)
X-Received: by 2002:a25:68cc:0:b0:a27:3ecc:ffe7 with SMTP id
 d195-20020a2568cc000000b00a273eccffe7mr11775312ybc.3.1681721586452; Mon, 17
 Apr 2023 01:53:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230412110900.69738-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230412110900.69738-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20230412110900.69738-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 17 Apr 2023 10:52:55 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVe6DXpM5zQk-zitNTk17QiStusOTQcjTMVy6HnhXyq1w@mail.gmail.com>
Message-ID: <CAMuHMdVe6DXpM5zQk-zitNTk17QiStusOTQcjTMVy6HnhXyq1w@mail.gmail.com>
Subject: Re: [PATCH v8 2/7] riscv: asm: vendorid_list: Add Andes Technology to
 the vendors list
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Conor Dooley <conor.dooley@microchip.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>, 
	Andrew Jones <ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel@sholland.org>, linux-riscv@lists.infradead.org, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230417_015310_100540_36E0975F 
X-CRM114-Status: GOOD (  14.33  )
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

T24gV2VkLCBBcHIgMTIsIDIwMjMgYXQgMTowOeKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNz
ZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5t
YWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPgo+IEFkZCBBbmRlcyBUZWNobm9sb2d5IHRv
IHRoZSB2ZW5kb3JzIGxpc3QuCj4KPiBTaWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyIDxwcmFi
aGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gUmV2aWV3ZWQtYnk6IEhlaWtv
IFN0dWVibmVyIDxoZWlrb0BzbnRlY2guZGU+Cj4gUmV2aWV3ZWQtYnk6IENvbm9yIERvb2xleSA8
Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+CgpSZXZpZXdlZC1ieTogR2VlcnQgVXl0dGVyaG9l
dmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT4KCkdye29ldGplLGVldGluZ31zLAoKICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUn
cyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBw
ZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2Vs
ZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNh
eSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
