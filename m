Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C910C4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Dec 2023 19:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:Mime-Version
	:References:In-Reply-To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kGAxY8zZv7N7m+wwHUMzV0s5aHNr2fbGKhzdXrfBc5g=; b=aU+j9/zXLhcoRJ
	CIzvOLvl9DVHnzYHphhsqM3tkSiTPvYnv8LLtRr24J1CHZ7j25QjO4cjttfxAMoxc1Fco/a+nD4Bw
	7frJA2aPZwaHKugGfrbzFeT1pvmVUu2XNsmm4UwaB3Ow+yI1BFwxGpjMP09ko7Fe2QTyM+Nea/3dx
	w2dqO7R6BbAJP/L4EoWYYYE+Dh9RJJUq9NxBNn7xFmWy8TmQbk0UCrMGJEPiKhc6zJLMuxFXCmbLv
	dgYbAegq0SaIByiSZFcxBS7wN5c4ISXAe4egbVUKPY1sFANYf1UFXFyIFM16JE5gj1sqDauMifhrC
	QkfVPcREYIhmyEiFPFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEDcX-004JgP-2N;
	Fri, 15 Dec 2023 19:13:13 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEDcU-004JfY-1Z
	for linux-riscv@lists.infradead.org;
	Fri, 15 Dec 2023 19:13:12 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 101AB3F2BE
	for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 19:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702667589;
	bh=A1KQCHoagGRE/Fri7ZMPinskZZrpSG0JKrmQZH3FV6g=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=I21cfapcDH5NZ15eHsUBj8KHhiujqxDSFDDPjeHoUwtVnJxbck4wKZQjuAtu++Lgq
	 y67WVxbQgtN7F58ruyKNu8TkgJbEdcMGl1iboDOdaGKNvGF005bQuic2JvABjrBoHS
	 gwM2qGmVu/LF6glnaqLlPBJXryBWBiChKONJWhdAfiHcDK5YZj62rqavuYdoERcMBq
	 dCPvV6bMgMwzbOevjzSR/gjUTLUJnQugvptGFi0CHXXTFlTT3q294TNrkXmkp10f16
	 RUAjgE3fwp56mLIGgvxuxYg3oiU5n36+2+tuj1RrqUshZi2W4AOZt8FP2HGWgZhKSs
	 4C/jB7DMl3C2A==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-425927c274aso15547021cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 15 Dec 2023 11:13:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702667588; x=1703272388;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=A1KQCHoagGRE/Fri7ZMPinskZZrpSG0JKrmQZH3FV6g=;
        b=JQ4IwYcjWZxnNVsiCr8zTw2ATzplFh3H5wy3qTszA91rthLWzlln8uml+e9b1b+K/z
         Hqc73e8ItlnbTXrhpnQLY611kpj+4W6X+pdZtVXRUQjNJsHu3lnHH7C9fB2jp301IKX5
         GGdKnkykIf7ktNC7tM5Zo92cXxGjKUfRywMucfAFWxwDXAnboSnxf+oVWzniMYV59flj
         Xwvy0fXofladpFWwyiFXM3gBgKhyQQFyzgebQ00sN4lmkFroruAAK+4AFeerT8dUH0rq
         k5rnS17lyxY4QyZ1BWGETVpdKlToA2Ukf/mPu5ZnyyCX94bwOQmJih1RYR7ZGd0WNq1Y
         lIkA==
X-Gm-Message-State: AOJu0YxsR6VG4MRP7esGPmEAEt6f7GnTxsv0+JVcu5HtnDPK+bNnqPub
	xKyoVkpGGeaR+yLAfArr+Vn0zV0Ibqb5PAVAsCjuTLkPBpQBu3R4Xg+il9YYS8rJUHSf39s5rhh
	cTUc78+qhspYN5LIXJ8jRZImDzBQGG0+XYBlZBU0a7d9PgBYLidzy6eGoHoZ3MebdcRXOTQ==
X-Received: by 2002:ac8:5909:0:b0:425:78fc:446d with SMTP id 9-20020ac85909000000b0042578fc446dmr16222536qty.29.1702667588046;
        Fri, 15 Dec 2023 11:13:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQ33pMMGoaNI9twd5osVzgTSarT/cVWUeo35du2j8Q7yxXEdTqukpbqrobo5IDN+bItJEQlbp48Xge01CaYl4=
X-Received: by 2002:ac8:5909:0:b0:425:78fc:446d with SMTP id
 9-20020ac85909000000b0042578fc446dmr16222525qty.29.1702667587843; Fri, 15 Dec
 2023 11:13:07 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 15 Dec 2023 11:13:07 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <CAMuHMdXwRZRvLPh3JBShQy4hRHq=2fQJmcYjTyQhKZmtBPaOuw@mail.gmail.com>
References: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
 <20231213-jester-rendering-dd876ef8e8ac@spud> <CAMuHMdXwRZRvLPh3JBShQy4hRHq=2fQJmcYjTyQhKZmtBPaOuw@mail.gmail.com>
Mime-Version: 1.0
Date: Fri, 15 Dec 2023 11:13:07 -0800
Message-ID: <CAJM55Z85_qR8bpZwjEgz-fmC=WCZEJYHk5d=1bGfDE+oVMN7Fw@mail.gmail.com>
Subject: Re: (subset) [PATCH v2 0/8] Add JH7100 errata and update device tree
To: Geert Uytterhoeven <geert@linux-m68k.org>, Conor Dooley <conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_111310_655186_081B4114 
X-CRM114-Status: GOOD (  14.15  )
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
Cc: devicetree@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Emil Renner Berthing <emil.renner.berthing@canonical.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

R2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIENvbm9yLAo+Cj4gT24gV2VkLCBEZWMgMTMs
IDIwMjMgYXQgNDo0M+KAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gPiBGcm9tOiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+ID4K
PiA+IE9uIFRodSwgMzAgTm92IDIwMjMgMTY6MTk6MjQgKzAxMDAsIEVtaWwgUmVubmVyIEJlcnRo
aW5nIHdyb3RlOgo+ID4gPiBOb3cgdGhhdCB0aGUgZHJpdmVyIGZvciB0aGUgU2lGaXZlIGNhY2hl
IGNvbnRyb2xsZXIgc3VwcG9ydHMgbWFudWFsCj4gPiA+IGZsdXNoaW5nIGFzIG5vbi1zdGFuZGFy
ZCBjYWNoZSBvcGVyYXRpb25zWzFdIHdlIGNhbiBhZGQgYW4gZXJyYXRhIG9wdGlvbgo+ID4gPiBm
b3IgdGhlIFN0YXJGaXZlIEpINzEwMCBTb0MgYW5kIHVwZGF0ZSB0aGUgZGV2aWNlIHRyZWUgd2l0
aCB0aGUgY2FjaGUKPiA+ID4gY29udHJvbGxlciwgZGVkaWNhdGVkIERNQSBwb29sIGFuZCBhZGQg
TU1DIG5vZGVzIGZvciB0aGUgU0QtY2FyZCBhbmQKPiA+ID4gd2lmaS4KPiA+ID4KPiA+ID4gVGhp
cyBzZXJpZXMgbmVlZHMgdGhlIGZvbGxvd2luZyBjb21taXQgaW4gWzFdIHRvIHdvcmsgcHJvcGVy
bHk6Cj4gPiA+Cj4gPiA+IFsuLi5dCj4gPgo+ID4gQXBwbGllZCB0byByaXNjdi1jYWNoZS1mb3It
bmV4dCwgdGhhbmtzIQo+ID4KPiA+IFsxLzhdIHJpc2N2OiBlcnJhdGE6IEFkZCBTdGFyRml2ZSBK
SDcxMDAgZXJyYXRhCj4gPiAgICAgICBodHRwczovL2dpdC5rZXJuZWwub3JnL2Nvbm9yL2MvNjRm
Yzk4NGE4YTU0Cj4KPiBUaGF0J3MgdGhlIG9uZSB3aGljaCBhbHNvIG5lZWRzIGRlcGVuZHMgb24g
IURNQV9ESVJFQ1RfUkVNQVA/CgpZZXMsIHRoYW5rcy4gSSBzZW50IGEgZml4IG5vdzoKaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcmlzY3YvMjAyMzEyMTUxOTA5MDkuMzcyMjc1Ny0xLWVt
aWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20vCgovRW1pbAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
