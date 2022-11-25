Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0E1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rZlsl/84cbNo2kqqhyhlnURpuklgtsCQfnUhZNfiui4=; b=s75GUARI/zazUl
	qximggR0TykbCZzv+1KvfumgJOmmc3/vlTPm4Jhu0owqMf5BmNOrvAS40avq47gX/HWfCQew1bq8f
	6LXITtYjJgddtRnjC7W9Odqbv3bUQ+O6g/B9oZYsuVuN5Z/+HdB9ImYTYRgJajm3vNSjwDn3XlDqF
	Yl20zMw7HToAQmK0jQsmaVZ8lkGT5xFfr8ALrqhoJfenQvR06m7DgjCOPiYXbxAwYzHggiP5PwE5Z
	LNWFqW9HZJlPG6TTFIFl0KTNl2ZGuciI7CQ6rfwSI5AAymc0mFXlNtXTSVwzElY5v6ZFlSkAYlBEC
	GMDTWaeQAIfvCEobex2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyfhZ-0029FR-9Z; Fri, 25 Nov 2022 20:53:37 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyfhW-0029DN-H2
	for linux-riscv@lists.infradead.org; Fri, 25 Nov 2022 20:53:35 +0000
Received: by mail-ej1-x62a.google.com with SMTP id ud5so12713737ejc.4
        for <linux-riscv@lists.infradead.org>; Fri, 25 Nov 2022 12:53:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6sD/Opg2kMqx/4KzDzQ2UqRnrUwBi1wf4XCjq+pkybA=;
        b=bm45a8aZ6R6jyfumNKlTQyyX9hJCa0YY6TrulwUgivh5dhWtAX1bCCMmZ08MHPJr5C
         mPuiZLrNlD35kkTOdRQX3P6vmYKq6k88AiAyxUNTeiLX5kZfS2FIb8F4LVRwMRwLyoBR
         sBJarFQgNJ2Rw5J5CTM0fKSLfGS+AMheq8vm7Gh+7GgYzxeLXtgK4Grq9hEMOJ1Puc+p
         BhPbWAPaKANSNaWrUuHQ9wofHHU5krRiyj+W/YRKUPUtL115CxeSSL4kRBpZIiJV7n9M
         fmP1eSAOAmUa2Tl6bgoTtzluUzFDlRbkjk3BeOHi8tPpqN9oxOyHgn7udlOJIrpMhNwW
         Ngag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6sD/Opg2kMqx/4KzDzQ2UqRnrUwBi1wf4XCjq+pkybA=;
        b=QYlY8PTzy2MnXWrCqyg75ZRvly5jw+KBmdtZVyadBrr1Q/yARixL/onF2Y/iDjpZsk
         BqLMbL2W3rB3BcPaYBQ/kzUt69zIXx2J4usrJKAFKRbs7XYFRvMncPfO064eg518RdrT
         sXPVpKm9llnG27FbMzUq0WDI4cl1SrUZQrZxswhjg+2/4wF7uLGgWDi5pCTvjM2F9DfB
         8JyR/yAFRj+Qd1Bl3GlwNJBdxzbCSxOIrF5ZakJID062sKzBZrwGBawAE6BxZXMbVasY
         zo2Ce1dr6ViR33vY8wscJHoFIQS+P6ijLYIG9jNV6zUhTjsL98Q5xjf+lhjpXrrZdSxj
         wFNA==
X-Gm-Message-State: ANoB5pm76hAHXb0pV1VdFbpjWLgneej0sVXZ2E3CZ0od0xquJbLUwL4v
	DbTQdqPQMVlpXtclisNWFcdEIKQ/cdkep6lEZ4I=
X-Google-Smtp-Source: AA0mqf6ZqeXlwkzzwv31EFgGaPOJIe9a20QRlRigNwZ5FuDhorinVjP2uOsFChpXkysNFQeb3b9Pc4fGT34f1ILc/Ro=
X-Received: by 2002:a17:906:8a57:b0:7ad:a030:4915 with SMTP id
 gx23-20020a1709068a5700b007ada0304915mr34077097ejc.267.1669409609046; Fri, 25
 Nov 2022 12:53:29 -0800 (PST)
MIME-Version: 1.0
References: <20221124172207.153718-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20221124172207.153718-6-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <3689906.Lt9SDvczpP@diego> <CA+V-a8uQh=q8ksTe8ttHkJThcoYtggSU-AXUqPGYnam0CiqZWw@mail.gmail.com>
 <3b5e52c5-7a1c-8bdd-b076-0c5e13463274@sholland.org>
In-Reply-To: <3b5e52c5-7a1c-8bdd-b076-0c5e13463274@sholland.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 25 Nov 2022 20:53:02 +0000
Message-ID: <CA+V-a8tZgswanaN2gbmWzswO4pLLQ884aQa+KVNLwjDS9YqS=A@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] riscv: mm: dma-noncoherent: Pass direction and
 operation to ALT_CMO_OP()
To: Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
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
X-CRM114-CacheID: sfid-20221125_125334_585254_5F235150 
X-CRM114-Status: GOOD (  18.49  )
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

SGkgU2FtdWVsLAoKVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3LgoKT24gRnJpLCBOb3YgMjUsIDIw
MjIgYXQgNjo0OSBQTSBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4gd3JvdGU6
Cj4KPiBPbiAxMS8yNC8yMiAxMzoxOCwgTGFkLCBQcmFiaGFrYXIgd3JvdGU6Cj4gPiBIaSBIZWlr
bywKPiA+Cj4gPiBUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcuCj4gPgo+ID4gT24gVGh1LCBOb3Yg
MjQsIDIwMjIgYXQgNjoyOSBQTSBIZWlrbyBTdMO8Ym5lciA8aGVpa29Ac250ZWNoLmRlPiB3cm90
ZToKPiA+Pgo+ID4+IEFtIERvbm5lcnN0YWcsIDI0LiBOb3ZlbWJlciAyMDIyLCAxODoyMjowNSBD
RVQgc2NocmllYiBQcmFiaGFrYXI6Cj4gPj4+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Pj4KPiA+Pj4gUGFzcyBkaXJlY3Rp
b24gYW5kIG9wZXJhdGlvbiB0byBBTFRfQ01PX09QKCkgbWFjcm8uCj4gPj4+Cj4gPj4+IFRoaXMg
aXMgaW4gcHJlcGFyYXRpb24gZm9yIGFkZGluZyBlcnJhdGEgZm9yIHRoZSBBbmRlcyBDUFUgY29y
ZS4KPiA+Pgo+ID4+IGNhbiB5b3UgcHJvdmlkZSBtb3JlIGV4cGxhbmF0aW9uIHdoeSB0aGF0IGlz
IG5lY2Vzc2FyeSBwbGVhc2U/Cj4gPj4gSSBndWVzcyB5b3Ugd2FudCB0byB1c2UgZGlmZmVyZW50
IGNhY2hlIG9wZXJhdGlvbnMgZm9yIHNvbWUgY2FzZXM/Cj4gPj4KPiA+IFllcyBiYXNpY2FsbHkg
dG8gY2FsbCBkaWZmZXJlbnQgY2FjaGUgb3BlcmF0aW9ucyBiYXNlZCBvbiB0aGUgZGlyIGFuZAo+
ID4gb3BlcmF0aW9ucyAoYW5kIGFsc28gdGhpcyBhbGxvd3MgdG8gZXhwb3J0IGp1c3Qgb25lIGZ1
bmN0aW9uIHRvIGhhbmRsZQo+ID4gdGhlIGVycmF0YSkuIEknbGwgdXBkYXRlIHRoZSBjb21taXQg
bWVzc2FnZSBpbiB0aGUgbmV4dCB2ZXJzaW9uLgo+Cj4gVGhpcyBtYWtlcyB0aGluZ3MgbGVzcyBl
ZmZpY2llbnQsIGJlY2F1c2UgaXQgcmVxdWlyZXMgbW9yZSBpbnN0cnVjdGlvbnMKPiBhbmQgcmVn
aXN0ZXJzIGluc2lkZSB0aGUgYWx0ZXJuYXRpdmUgc2VjdGlvbiwgYW5kIHlvdXIgZnVuY3Rpb24K
PiBkdXBsaWNhdGVzIHRoZSBsb2dpYyBmcm9tIGFyY2hfc3luY19kbWFfZm9yX2RldmljZSgpLiBU
aGUgYWx0ZXJuYXRpdmUgaXMKPiBhbHJlYWR5IHBhc3NlZCB0aGUgb3BlcmF0aW9uIChjbGVhbi9m
bHVzaC9pbnZhbGlkYXRlKSBhcyBhIHRva2VuLCBzbyB5b3UKPiBjYW4gY29uc3RydWN0IHRoZSBm
dW5jdGlvbiBuYW1lIHdpdGggdG9rZW4gcGFzdGluZy4KPgpJIGRpZCB0aGluayBhYm91dCBpdCBi
dXQgdGhhdCBkaWRuJ3QgaGVscCBmb3IgZXhhbXBsZSBpbiB0aGUKYXJjaF9kbWFfcHJlcF9jb2hl
cmVudCgpIHdlIGFyZSBjYWxsaW5nIGZsdXNoIHRva2VuLCBidXQgb24gUlovRml2ZQpmb3IgYXJj
aF9kbWFfcHJlcF9jb2hlcmVudCgpIHdlIGhhdmUgdG8gZG8gbm90aGluZy4KCkNoZWVycywKUHJh
Ymhha2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
