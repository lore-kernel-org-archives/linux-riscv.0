Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D6ACC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 08:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q/bOk8mYYafG+OheNL3jFVC+vFD0g+uLZeHxSZ9+cpA=; b=nS9OYXg+t1Rml/
	OLLFNDkSGDFmM8uViMeEI6d60XpSP2Hm+MGs1JWBvOX+QmYNXCF0y5Ecsho5s/7bRqU5F9giE9WJg
	5jQ05EuiU9kjtiBExsn+0vBl3iQmuE49STUmgja4LJSg8ptJVa1D4hlxhWBTbvjsKIUKbgnCtAWZg
	UFkd9ROL838AOE2eiaAss9Vl+RY12fvLKNx8VBWoPJv8f8VG8SO2ZJupfSaNopsxb2SuuDNm2nGZL
	E0ZUglrslnHbB/WU6KXbEo16bHHSIFtnhJ57Ics9G7GqZ6iGT7A9HQmN3oIfjYjIQK5mTOTKnthGH
	4c1hQzzgb3y+WtfC5CrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMxm-0000000BlRG-0A6z;
	Mon, 29 Jan 2024 08:25:54 +0000
Received: from mail-yb1-f182.google.com ([209.85.219.182])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUMxj-0000000BlQo-1GaE
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 08:25:52 +0000
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dc236729a2bso2534685276.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 00:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706516749; x=1707121549;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qnxd1+UMtflAeTNDn68oCiHgIyPBn7p4OxcQPfoNqMU=;
        b=kckCe38Z3HFxkNMKIKB3ZZYnoS+/YVyeO6TF7mzKUPCp0qHvkepUwHHMCqOfSQqrVr
         Y+SBABmIFfU9v9U6KHKAX4DBfaZ5tPrK4aDgDomiS/Lf4ZsTPog6e2VpOuQRrAzBNhqV
         xfZEWKjrIgIOOMaE8EUS1TmOcpa2+e6ilCuh6C9g9WjvsfUpOPVIdEfBeA/96ZZqSKeA
         uA61p7sd2UYy4+hH948eAcGrQkvniFP9X3Muos304Nhixws3/fE9Gb6coJzHF+mJa2AD
         4HN+Oje7DYy7Rf/rm9NC5sHjqLPfZGJOiWbfqTtuITLG0wX17LYhH0skMHUZDCSM75td
         Eu8w==
X-Gm-Message-State: AOJu0YwWyI0CLkkCdcNT1Uc+6rnZSTC7wBgx9xNCSIdr0vgNzb1ak5m0
	PJ1wDzShOppWQxtB+NPZi4W3wx1XkA98sJ2Wf2jr3huVoTnZ82QDpjejfJ6pRCM=
X-Google-Smtp-Source: AGHT+IEGEyZG8WyHfXnEv55tmXtoTjwVmITRXg2POjSqVTLNKQ9tXnK3o5so3KyHsKOeWAMissjdAg==
X-Received: by 2002:a25:8904:0:b0:dc6:1a52:6eff with SMTP id e4-20020a258904000000b00dc61a526effmr1967658ybl.104.1706516749481;
        Mon, 29 Jan 2024 00:25:49 -0800 (PST)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com. [209.85.128.180])
        by smtp.gmail.com with ESMTPSA id u18-20020a250952000000b00dc608353fb3sm2084978ybm.39.2024.01.29.00.25.48
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jan 2024 00:25:48 -0800 (PST)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-602d0126e80so20828007b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 00:25:48 -0800 (PST)
X-Received: by 2002:a05:690c:338f:b0:5ff:b07c:3b72 with SMTP id
 fl15-20020a05690c338f00b005ffb07c3b72mr3540193ywb.62.1706516748639; Mon, 29
 Jan 2024 00:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20240115130817.88456-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <CA+V-a8t4v2CxZWrLRKBinS5fyG-_FzDFz5zA=mgcrNutJABr5g@mail.gmail.com>
In-Reply-To: <CA+V-a8t4v2CxZWrLRKBinS5fyG-_FzDFz5zA=mgcrNutJABr5g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jan 2024 09:25:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWKvJRFP+zOeWPALbYwAf7Z_UW879q1aLXyFwXqaJp9GA@mail.gmail.com>
Message-ID: <CAMuHMdWKvJRFP+zOeWPALbYwAf7Z_UW879q1aLXyFwXqaJp9GA@mail.gmail.com>
Subject: Re: [PATCH v5 0/4] Add missing port pins for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_002551_385115_EFDE5A76 
X-CRM114-Status: GOOD (  22.24  )
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

SGkgUHJhYmhha2FyLAoKT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgOToxNuKAr0FNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gTW9uLCBKYW4g
MTUsIDIwMjQgYXQgMTowOOKAr1BNIFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5j
b20+IHdyb3RlOgo+ID4gRnJvbTogTGFkIFByYWJoYWthciA8cHJhYmhha2FyLm1haGFkZXYtbGFk
LnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gVGhpcyBwYXRjaCBzZXJpZXMgaW50ZW5kcyB0byBpbmNv
cnBvcmF0ZSB0aGUgYWJzZW50IHBvcnQgcGlucyBQMTkgdG8gUDI4LAo+ID4gd2hpY2ggYXJlIGV4
Y2x1c2l2ZWx5IGF2YWlsYWJsZSBvbiB0aGUgUlovRml2ZSBTb0MuCj4gPgo+ID4gQ2hlZXJzLAo+
ID4gUHJhYmhha2FyCj4gPgo+ID4gdjQgLT4gdjU6Cj4gPiAqIE1hZGUgc3RydWN0IHJ6ZzJsX3Zh
cmlhYmxlX3Bpbl9jZmcgdmFyaWFibGVzIHUzMgo+ID4gKiBVcGRhdGVkIFBJTl9DRkdfUElOX01B
UF9NQVNLIG1hY3JvIHRvIHVzZSBHRU5NQVNLX1VMTCgpIGFzIHJlcG9ydGVkCj4gPiAgIGJ5IGtl
cm5lbCB0ZXN0IHJvYm90LgoKPiA+IExhZCBQcmFiaGFrYXIgKDQpOgo+ID4gICBwaW5jdHJsOiBy
ZW5lc2FzOiByemcybDogSW1wcm92ZSBjb2RlIGZvciByZWFkYWJpbGl0eQo+ID4gICBwaW5jdHJs
OiByZW5lc2FzOiByemcybDogSW5jbHVkZSBwaW5tYXAgaW4gUlpHMkxfR1BJT19QT1JUX1BBQ0so
KQo+ID4gICAgIG1hY3JvCj4gPiAgIHBpbmN0cmw6IHJlbmVzYXM6IHBpbmN0cmwtcnpnMmw6IEFk
ZCB0aGUgbWlzc2luZyBwb3J0IHBpbnMgUDE5IHRvIFAyOAo+ID4gICByaXNjdjogZHRzOiByZW5l
c2FzOiByOWEwN2cwNDNmOiBVcGRhdGUgZ3Bpby1yYW5nZXMgcHJvcGVydHkKPiA+Cj4gPiAgYXJj
aC9yaXNjdi9ib290L2R0cy9yZW5lc2FzL3I5YTA3ZzA0M2YuZHRzaSB8ICAgNCArCj4gPiAgZHJp
dmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jICAgICB8IDI4NCArKysrKysrKysr
KysrKysrKy0tLQo+ID4gIDIgZmlsZXMgY2hhbmdlZCwgMjQ4IGluc2VydGlvbnMoKyksIDQwIGRl
bGV0aW9ucygtKQo+ID4KPiBXaXRoIHJlY2VudCBjaGFuZ2VzIHRvIHBpbmN0cmwtcnpnMmwuYyB0
aGlzIHBhdGNoIHNlcmllcyAocGF0Y2ggIzIpCj4gZG9lcyBub3QgYXBwbHkgY2xlYW5seSBhbnlt
b3JlLiBTaGFsbCBJIHJlc2VuZCBpdD8KClllcyBwbGVhc2UuIFRoYXQgd291bGQgc2F2ZSBtZSBm
cm9tIHJlc29sdmluZyB0aGUgY29uZmxpY3Qgd2hlbgpJIGdldCB0byB0aGlzIHNlcmllcy4KVGhh
bmtzIQoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoK
LS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlh
MzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0
aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20g
dGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhp
bmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRv
cnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
