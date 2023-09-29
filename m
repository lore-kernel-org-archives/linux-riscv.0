Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED80E71D3D
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Sep 2023 14:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5byMviowsfLyE7veqD7rR1CqXTh5roVun7NopuklHUw=; b=suQA7uiEwrW2rJ
	Xv++LU+iDXWVQFnXjSc5qj5aL01+xcDJwO7oLlaEh7jX74+8+C7oVEZ4EOdNZ/IRJBztZyhQOUKRq
	KLH87nqD/Ms6NI1kh1NTVHIS1QEM/mdrrdmpqZureQpALfirsyJWy/cnJ+j7XBClowGEWV+Kkt1Sp
	vbPLQ1IKcm2rlo9IVvksjezdEL5+85oMB69W3vd2rwB/b5vFb2eZWCWwTnsvID5vrMi9rM/kLYiMj
	/h4QIwjbU8EqbnvqHOoXIOlWoOEWPR5LpvTnMuYPkO7pqGyCyqCFErAva8ezKqpb9VYUORuxYBNAr
	5IsbEYB0Vnv0odd1hpvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmElU-00862p-2X;
	Fri, 29 Sep 2023 14:46:48 +0000
Received: from mail-vk1-xa31.google.com ([2607:f8b0:4864:20::a31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmElP-00861J-2W
	for linux-riscv@lists.infradead.org;
	Fri, 29 Sep 2023 14:46:46 +0000
Received: by mail-vk1-xa31.google.com with SMTP id 71dfb90a1353d-48feedb90d2so5189786e0c.1
        for <linux-riscv@lists.infradead.org>; Fri, 29 Sep 2023 07:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695998801; x=1696603601; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icHrBBDQRTeyt50Y1yLJwIMCK4gLih/YGVhUvYswbzQ=;
        b=Eel7iO7HNbuiMc9eJVnZqVroXFNYvK/DvcHg1asGMAJtTnoV+EK0n+hMYVO0Cm7Uvm
         t4QKzCr3YzgVJz4BQa7rTcbWAZI3ylZn0OYsW1lonnkSEwGQYh+cAjwsnlE5ZGz4nmGM
         K1u5BzadWQML0ilup8yedRxXmQ6g4F/IQq4fr35dCS2qoy1kl2v5ygWKmPvlNkFSSDev
         I6scX9fpcsxWzy4FXUWz2NlTSyWK3obep4QLSiwdKRtwho19v34zaBsZgrk/hPMiWCe0
         bZuHtB70oLLTKnOfmL41CpAmpcO1FqdQEl+uqsiT//u74nFYgSsIdash8r1F6EIUdoqC
         bY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695998801; x=1696603601;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icHrBBDQRTeyt50Y1yLJwIMCK4gLih/YGVhUvYswbzQ=;
        b=PnpNkniAs/qGhv3fNnITlYMXRKWfklV/nvTxafYTrfdC+Q3wXraU4KamQBSIR9KVYp
         fKE5Pnnr8Uo12XlfydU7yt0xBrGTmiV0OgQPdRDErzkfn9FnNfpe6EF3MXlHDzlM2xuU
         KdxOgzEUFJpr0JpJ8MXVdRM9ZKQLtZua02nNiYaJ7WKcmvkKE2DQIN0S8nv8LBwA6Ssy
         1u4XVJ8TQPTu6Lp6g6Gie1vCIxacvob6d6N3mDNc8pwxvNGfLYPpOlJ4E0t8yfB2uLto
         EfGJax4V0vV6LQjpllAMiYfEmquwzLRiOidC4XXL7HhlEILdL1ZIhTz50GpCXeRE5mvG
         bbVQ==
X-Gm-Message-State: AOJu0YwzhjK0A30ZRQj0VRyHU3d35sNWt53frW6y9moeeWaCpyIi17Kb
	CWidPhsJth8M8Opkw2UJtxUEPmBRmgPYGwXLQLM=
X-Google-Smtp-Source: AGHT+IGl4VBrxQ+OTUhg9OTarf1b8pDfiWJf2T72xV+dm5qW9La2mo3E4I94FnnRzmaI3CV+sty2yxhSjGASAlAxU3U=
X-Received: by 2002:a1f:d605:0:b0:49a:3537:881c with SMTP id
 n5-20020a1fd605000000b0049a3537881cmr4276555vkg.14.1695998800851; Fri, 29 Sep
 2023 07:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230929000704.53217-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230929000704.53217-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <20230929-professed-imperfect-4b2ed9073e04@spud>
In-Reply-To: <20230929-professed-imperfect-4b2ed9073e04@spud>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 29 Sep 2023 15:45:53 +0100
Message-ID: <CA+V-a8sXxzUPmV5LqGtYm2SYLHS+-VNo_jRsLNP4mUSAKxuoFw@mail.gmail.com>
Subject: Re: [PATCH 5/5] riscv: configs: defconfig: Enable configs required
 for RZ/Five SoC
To: Conor Dooley <conor@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230929_074643_818570_57CA77D5 
X-CRM114-Status: GOOD (  14.65  )
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

SGkgQ29ub3IsCgpUaGFuayAgeW91IGZvciByZXZpZXcuCgpPbiBGcmksIFNlcCAyOSwgMjAyMyBh
dCAzOjE04oCvUE0gQ29ub3IgRG9vbGV5IDxjb25vckBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9u
IEZyaSwgU2VwIDI5LCAyMDIzIGF0IDAxOjA3OjA0QU0gKzAxMDAsIFByYWJoYWthciB3cm90ZToK
PiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5l
c2FzLmNvbT4KPiA+Cj4gPiBFbmFibGUgdGhlIGNvbmZpZ3MgcmVxdWlyZWQgYnkgdGhlIGJlbG93
IElQIGJsb2NrcyB3aGljaCBhcmUKPiA+IHByZXNlbnQgb24gUlovRml2ZSBTb0M6Cj4gPiAqIEFE
Qwo+ID4gKiBDQU5GRAo+ID4gKiBETUFDCj4gPiAqIGVNTUMvU0RISQo+ID4gKiBPU1RNCj4gPiAq
IFJBVkIgKCsgTWljcmVsIFBIWSkKPiA+ICogUklJQwo+ID4gKiBSU1BJCj4gPiAqIFNTSSAoU291
bmQrV004OTc4IGNvZGVjKQo+ID4gKiBUaGVybWFsCj4gPiAqIFVTQiAoUEhZL1JFU0VUL09URykK
PiA+Cj4gPiBBbG9uZyB3aXRoIHRoZSBhYm92ZSBzb21lIGNvcmUgY29uZmlncyBhcmUgZW5hYmxl
ZCB0b28sCj4gPiAtPiBDUFUgZnJlcXVlbmN5IHNjYWxpbmcgYXMgUlovRml2ZSBkb2VzIHN1cHBv
cnQgdGhpcy4KPiA+IC0+IE1URCBpcyBlbmFibGVkIGFzIFJTUEkgY2FuIGJlIGNvbm5lY3RlZCB0
byBmbGFzaCBjaGlwcwo+ID4gLT4gRW5hYmxlZCBJMkMgY2hhcmRldiBzbyB0aGF0IGl0IGVuYWJs
ZXMgdXNlcnNwYWNlIHRvIHJlYWQvd3JpdGUKPiA+ICAgIGkyYyBkZXZpY2VzIChzaW1pbGFyIHRv
IGFybTY0KQo+ID4gLT4gVGhlcm1hbCBjb25maWdzIGFzIFJaL0ZpdmUgU29DIGRvZXMgaGF2ZSB0
aGVybWFsIHVuaXQKPiA+IC0+IEdQSU8gcmVndWxhdG9yIGFzIHdlIG1pZ2h0IGhhdmUgSVAgYmxv
Y2tzIGZvciB3aGljaCB2b2x0YWdlCj4gPiAgICBsZXZlbHMgYXJlIGNvbnRyb2xsZWQgYnkgR1BJ
T3MKPgo+IFlvdSBtaWdodCBvciB5b3UgZG8/Cj4KWWVzIHdlIGRvIHVzZSB0aGUgZ3BpbyByZWd1
bGF0b3IgZm9yIFNESEkuCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
