Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E903C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Apr 2024 12:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5DVG2lMlUsifBjQtIAYl2yp+41iu5LZ3+NF8oFw+WHg=; b=FYsaAw1fVfUHXa
	hoGF7GkOFtExNTeokFfsyP+ef3fXplItXvqJhgXAQnv7HBf+7zgQO9syQzLBSJLhH+12QeKWxGzPV
	6gt1O/RBHazvnKcbdI/CYVkOcnQNghMG1etY37/mGD4/R/s8GaDKIB+wI81kgSM16ZF1wBYMXTw4q
	8WXVnt76DwspwDk1VyxDWVCv1y5R8jcUWz4U6o/nuXoBsUB7QzMmUoHeJXeMdws3WoG9rJKlncxA+
	y5iyYnTMf+Pr9VAelj25OkdDc/YE8g/apGfFMZuYc1JBeHGyubAmOSRHT1O62SmANvedq1wVqDwpb
	yH6GlhFwEzFg+civOKhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdIu-0000000B3jJ-3P60;
	Tue, 02 Apr 2024 12:31:53 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrdIr-0000000B3iU-0lby
	for linux-riscv@lists.infradead.org;
	Tue, 02 Apr 2024 12:31:50 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-dc74435c428so4878986276.2
        for <linux-riscv@lists.infradead.org>; Tue, 02 Apr 2024 05:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712061107; x=1712665907; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p0a8acw+7ULihTf8lE/ghLH059TUPnJn47JiEnYgccM=;
        b=fVa59jGEs+daUHBZZlV1CU5ZRxpryBhxMrOH7jHUX9jK4zLpXUpfon0UEXFKkcJEPU
         et7B5LXtOHEcRMciM99lEbiFf3EJajwc4FrVy8zBhrdSshaaBur6HgD1SUdBS5zJB+qI
         1Zvirynz36hTwJHrZNP7QkLZ81hpKtllx0pZZxdUe+GsjoMtGMo/5Uh5D3HwchxDiJeG
         xwe+M4ASK0/r5zdqIYMYEy8bt4YOk64cb0Zvg4jSb/NJBbFEdeKA0kMhjBPy4jwNOgsp
         6eaVArgIPnvm0zKsgS6OwW9r2renMDODwWMdze4n4a0UToKK38YwmVDKQ3FwTFSB2eMB
         4t6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712061107; x=1712665907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p0a8acw+7ULihTf8lE/ghLH059TUPnJn47JiEnYgccM=;
        b=eMOUTEqCqZtMzREwDEbARgxmQnjnJSrcxrLACv6aMn2pyse6Dfc3w7b/8iAOnk/P4Y
         WFoPJUM1xE4dQM9brh7sj223p7BigdIdCKzRnVuvnkhP1kSyCoPoi9QxIzrJImiJg4MJ
         x4/QiB3Z9ONz+MCffTPA/deyUfJ0gcclOHqEogFkM2yauw73Yjp0+uidIX8oW//KH2tK
         031S+wvsbesXlLR2yV7yTfjM+Z30pBvKttrswMbQZJK+hU7ppuAwLvBSkwipwL0P5Mwf
         0tOsAr/eEHtFgu3eEYbCNy5h5NN7VYUiULnwM1G6GWsHR3QdJ3L4mcvSMwq6RANrt7gy
         u2ug==
X-Gm-Message-State: AOJu0YxCLwHoWBCMqs1euk0tqo3CRjcIK3JjQwXaLhRhmqCg4qIqLxN8
	7/RsEhNsqvg0LfL+IkCszoFoW7nXyDdTucoF2+ym5OsLhxhlW+bkZzE+DQwJ5UDbskDulEFz40R
	xCivXhCh+padMVF/xDv7UlqEB64KzSJbN0iZBNsf/Ig+NaJwX
X-Google-Smtp-Source: AGHT+IE0J84TqRbakQrC6l14h9si7x2di9LmRSJuCIgA2LQ8vJmxYu7A/iE7PWTtStw1Hw8SCsS1GQo4L/akposnPKg=
X-Received: by 2002:a25:a14a:0:b0:dcb:b3dd:4f95 with SMTP id
 z68-20020a25a14a000000b00dcbb3dd4f95mr10698210ybh.43.1712061107020; Tue, 02
 Apr 2024 05:31:47 -0700 (PDT)
MIME-Version: 1.0
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com> <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com>
In-Reply-To: <tencent_6D10A9C63E3E0F412EED33477B5CDB98C207@qq.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 2 Apr 2024 14:31:36 +0200
Message-ID: <CACRpkdY1wpGM7M5QV5rN0M6JMN_yugQJ7CEtnQjzsheD5AT23A@mail.gmail.com>
Subject: Re: [PATCH v6 08/11] pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>, 
	Damien Le Moal <dlemoal@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_053149_263478_6068CC14 
X-CRM114-Status: GOOD (  10.68  )
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

T24gU2F0LCBNYXIgMjMsIDIwMjQgYXQgMToxM+KAr1BNIFlhbmd5dSBDaGVuIDxjeXlAY3l5c2Vs
Zi5uYW1lPiB3cm90ZToKCj4gU2luY2UgU09DX0ZPTyBzaG91bGQgYmUgZGVwcmVjYXRlZCBmcm9t
IHBhdGNoIFsxXSwgYW5kIGNsZWFudXAgZm9yIG90aGVyCj4gU29DcyBpcyBhbHJlYWR5IG9uIHRo
ZSBtYWlsaW5nIGxpc3QgWzIsMyw0XSwgd2UgcmVtb3ZlIHRoZSB1c2Ugb2YKPiBTT0NfQ0FOQUFO
IGFuZCBpbnRyb2R1Y2VkIFNPQ19DQU5BQU5fSzIxMCBmb3IgSzIxMC1zcGVjaWZpYyBkcml2ZXJz
LAo+Cj4gVGh1cywgd2UgcmVwbGFjZSBpdHMgZHJpdmVycyBkZXBlbmRzIG9uIFNPQ19DQU5BQU5f
SzIxMCBhbmQgZGVmYXVsdCBzZWxlY3QKPiB3aGVuIGl0IGhhcyB0aGUgc3ltYm9sIFNPQ19DQU5B
QU5fSzIxMC4KPgo+IFsxXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDIy
MTEyMTIyMTQxNC4xMDk5NjUtMS1jb25vckBrZXJuZWwub3JnLwo+IFsyXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDMwNS1wcmF5aW5nLWNsYWQtYzRmYmNhYTdlZDBh
QHNwdWQvCj4gWzNdIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2LzIwMjQwMzA1
LWZsZWQtdW5kcmlsbGVkLTQxZGMwYzQ2YmIyOUBzcHVkLwo+IFs0XSBodHRwczovL2xvcmUua2Vy
bmVsLm9yZy9saW51eC1yaXNjdi8yMDI0MDMwNS1zdHJlc3MtZWFyZmxhcC1kN2RkYjg2NTVhNGRA
c3B1ZC8KPgo+IFNpZ25lZC1vZmYtYnk6IFlhbmd5dSBDaGVuIDxjeXlAY3l5c2VsZi5uYW1lPgoK
QWNrZWQtYnk6IExpbnVzIFdhbGxlaWogPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz4KCklzIHRo
aXMgcGF0Y2ggc29tZXRoaW5nIEkgY2FuIGp1c3QgYXBwbHkgdG8gdGhlIHBpbmN0cmwgdHJlZT8K
CllvdXJzLApMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
