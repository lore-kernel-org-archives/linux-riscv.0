Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B88C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 19:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TNv8LDnGST4nLF1qy6118gLuDFZUGXLFY0VrZ/JmRFI=; b=SSzYJskcTXm5ye
	yWvK46Yaz1zajZAQUWrV6/D66bI2z/iSIbL3XFD5lkOFkqG+SsgGMmLH+Jwt4YUBT74S9Wd42arh7
	zePpIZ7sEyLa4IHLO3bBC4X9PEZrG/ajRAyx4skPrplPNYkbnjnJV7b6B0aet0c0Cfef2ewV48H2n
	QyarNfl3/GrnhCdlHE/BDlZLjolTl0Q5GI19fGvRlCUNV++EKQNwh7hbAqvv8/s/LkwrxgTYjpFJE
	jCOU9U2X3DTfKPCB6WvhJlWlmEiLDu3hwANoM8GXCu8y4VE6/5pns89vXPqKeyp/tYvf3iQioFs1j
	vYTd4cJClAmAUd2HtIoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyHk0-00BCNY-OQ; Thu, 24 Nov 2022 19:18:32 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyHjx-00BCKC-KM
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 19:18:30 +0000
Received: by mail-ej1-x632.google.com with SMTP id kt23so5962413ejc.7
        for <linux-riscv@lists.infradead.org>; Thu, 24 Nov 2022 11:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kWoRrNDgHDvAiElkaM9ey/BkEhFNRR4kcdpp5ftZc90=;
        b=G6I0pdiG9+FJ7AxQvCRN/NCC8/HyD532a5M1tG0c8SFT1MMsNlNonirbr35ya3fR3r
         iLSMHGD9O6zi6qyr7i52EQSIUFiCNdRI8IEDO38DEu9lI7EQ/gUlC1SAmbfWV69Q59Gj
         3fSriUJ0BIPNLg6zDRx5PFXqzZekfhMX8hYdMoR3mVXpe6HBFBbOGFizMVwAdwqQ5Yl0
         Wd63uFtzx7e1A7Hb1bCKue9IybJXneMGgvlDbGBDzbzVIzYYowCZ47pCvtFmrjOJXbJo
         Xwqd8OQEkiB+25DrGT6GycGV/WF/HqgGXqXEX+7VnF/GNai1+R51464iBbVlLnem2Juh
         ASHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kWoRrNDgHDvAiElkaM9ey/BkEhFNRR4kcdpp5ftZc90=;
        b=xrBZMWpd6nLpbYQru/ObUcOrvDRiZCjH6NOJBbOEMSRPHMARZ1zwC45XjQDj/g/1GO
         faMUFVfUG89BbaWFRQGgTB6Sod2Y8Mry2UypavM3bVT97KlKKDblfptj8IkWID9ayoTT
         2G4DUQCm/Ctlms+/YtDk0p2OtYdC4AMezNbdR+TjSHP18UcHn3IE/5SuRcAtFBvvV7GD
         UVSe3ba67U+eFp+ezvG2D1QpohhDvZzcXUOwWYlV4gPkaAw48SSfa5ZPSAH2NHCKwemZ
         DQEW817C8cckofRR7ZjK5rei519jh0sTwKWiowipNFvpqBAXVxJBrofB1pDEZVhI5DMq
         7asQ==
X-Gm-Message-State: ANoB5pmWSua9FyOwoFAp4YW8FH45oCfM+e6iZ2erz9KpQ9KWU8DIQCjU
	5D21larKB0wJKaaalXrGNMTzZcqoEjnDZJJeSic=
X-Google-Smtp-Source: AA0mqf4WrZ/GykWiZqfe3oroUEIfEHqNDi9z0Lnip9PJsnUGxVHzil2Hb+kFxbeVynw2bI+m/BgujuTA2L1DS5ybuk8=
X-Received: by 2002:a17:906:560c:b0:7ae:5884:81b1 with SMTP id
 f12-20020a170906560c00b007ae588481b1mr14232995ejq.155.1669317508056; Thu, 24
 Nov 2022 11:18:28 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <3689906.Lt9SDvczpP@diego>
In-Reply-To: <3689906.Lt9SDvczpP@diego>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 24 Nov 2022 19:18:01 +0000
Message-ID: <CA+V-a8uQh=q8ksTe8ttHkJThcoYtggSU-AXUqPGYnam0CiqZWw@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Atish Patra <atishp@rivosinc.com>, 
	Anup Patel <apatel@ventanamicro.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Nathan Chancellor <nathan@kernel.org>, Philipp Tomsich <philipp.tomsich@vrull.eu>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_111829_715092_9512AE0A 
X-CRM114-Status: GOOD (  11.47  )
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

SGkgSGVpa28sCgpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCgpPbiBUaHUsIE5vdiAyNCwgMjAy
MiBhdCA2OjI5IFBNIEhlaWtvIFN0w7xibmVyIDxoZWlrb0BzbnRlY2guZGU+IHdyb3RlOgo+Cj4g
QW0gRG9ubmVyc3RhZywgMjQuIE5vdmVtYmVyIDIwMjIsIDE4OjIyOjA1IENFVCBzY2hyaWViIFBy
YWJoYWthcjoKPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5y
akBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBQYXNzIGRpcmVjdGlvbiBhbmQgb3BlcmF0aW9uIHRv
IEFMVF9DTU9fT1AoKSBtYWNyby4KPiA+Cj4gPiBUaGlzIGlzIGluIHByZXBhcmF0aW9uIGZvciBh
ZGRpbmcgZXJyYXRhIGZvciB0aGUgQW5kZXMgQ1BVIGNvcmUuCj4KPiBjYW4geW91IHByb3ZpZGUg
bW9yZSBleHBsYW5hdGlvbiB3aHkgdGhhdCBpcyBuZWNlc3NhcnkgcGxlYXNlPwo+IEkgZ3Vlc3Mg
eW91IHdhbnQgdG8gdXNlIGRpZmZlcmVudCBjYWNoZSBvcGVyYXRpb25zIGZvciBzb21lIGNhc2Vz
Pwo+ClllcyBiYXNpY2FsbHkgdG8gY2FsbCBkaWZmZXJlbnQgY2FjaGUgb3BlcmF0aW9ucyBiYXNl
ZCBvbiB0aGUgZGlyIGFuZApvcGVyYXRpb25zIChhbmQgYWxzbyB0aGlzIGFsbG93cyB0byBleHBv
cnQganVzdCBvbmUgZnVuY3Rpb24gdG8gaGFuZGxlCnRoZSBlcnJhdGEpLiBJJ2xsIHVwZGF0ZSB0
aGUgY29tbWl0IG1lc3NhZ2UgaW4gdGhlIG5leHQgdmVyc2lvbi4KCkNoZWVycywKUHJhYmhha2Fy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
