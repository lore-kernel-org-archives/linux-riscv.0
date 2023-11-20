Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36FEC2BB3F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Nov 2023 04:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZhk7ejZA7gnz4du5mPtd+OitfGrgxB96GCmgJ0pax0=; b=o6kODTKvedfaMZ
	WN0b0xx3Ai61B/KKm63g/4DaUouM68JJOe44nZqyTcaw/9etzYkOh8skr/DjpC/5rxDtJGXs43U6s
	p0sc5QO96w5rnbqxVYeerGYNdjdLcjQcgJ9I5zeqSfZaeEYVDhhFKiTD1btuYSwEvnDgpcFUDGf7L
	52YdantdnUUwDX5m9CQ2mE0FYkzsafh7OXx4Lv5a4yyO5GykPJZsD7fS0GneYSJGkBWRyt43Lhs0p
	ZPFD2Pt6UYKTKAUy2vX8+w78x5qEh7aJ+KAVnehOfY7Hcuzi6N1Mty63zasRKDHYeiSivPKO2zinc
	m9mbK+Gz71MF1/p3DJkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r4vkS-00B59s-1n;
	Mon, 20 Nov 2023 04:19:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r4vkQ-00B58Q-0U
	for linux-riscv@lists.infradead.org;
	Mon, 20 Nov 2023 04:18:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6FE4BCE0E15
	for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 04:18:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9407DC433CD
	for <linux-riscv@lists.infradead.org>; Mon, 20 Nov 2023 04:18:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700453934;
	bh=eJc3t+vjty0J6ATUE4Rsu1fv8yiYA2QdwTT2oLeeNpc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=G/2HIGaIq7151RXjukRJmEbQbVLRf20uMRs4ARHzoBejz0WoIhuw34AJGl7dDmlGQ
	 FT0Lzt+sDylZNbyTpXPvH/ipyE8oa7wyIAmNJvWA08d0hle+bUNW2lv1L8ta1gu/dz
	 VbTqckmIC1eZpHNdxPwebpe1oNTRuS6dMIN7TOs2BgnvvqClE5ffP2UNx9JSTqCRle
	 qNpp9USlyq9Xx35DMG4rngRY/V6iIB2WpwOj/f8hJklD+pOffb73KO5sijsW++Wb0G
	 qZicqxiQWpPnuCgWs2x1Sv7NeLYzPdhIb3/s3Uf3fX7/7LArr10uKbvGTWQyNSdBcx
	 Ck1KGLdk6f7Kg==
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-1efabc436e4so2506743fac.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 Nov 2023 20:18:54 -0800 (PST)
X-Gm-Message-State: AOJu0YysKNrLSLLkluvzVkJU0T9doPMeRdQm/OJO5lbaADyfp/UJ6ASg
	j0gKqPze4dnQKjRAVFX/Y7BWNpfQFjVslTnKPa0=
X-Google-Smtp-Source: AGHT+IFjUvCUwL9dlENvgBWSAvBVxN2mi2cDv4rqkgfxU4VoW6wZ29EQ2LekMKBcBn1C8Sq7Y6MIhJJPQ/V/mcv6WHM=
X-Received: by 2002:a05:6870:f69e:b0:1e9:a3e1:c388 with SMTP id
 el30-20020a056870f69e00b001e9a3e1c388mr6972167oab.41.1700453933986; Sun, 19
 Nov 2023 20:18:53 -0800 (PST)
MIME-Version: 1.0
References: <20231118081334.1308242-1-masahiroy@kernel.org> <ZVp26K9b8Apuy3FD@fjasle.eu>
In-Reply-To: <ZVp26K9b8Apuy3FD@fjasle.eu>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 20 Nov 2023 13:18:17 +0900
X-Gmail-Original-Message-ID: <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
Message-ID: <CAK7LNATj65c0beTb5oXMDskiaFnxp1hoMOF0yG15pGv7cujNEg@mail.gmail.com>
Subject: Re: [PATCH] scripts: clean up IA-64 code
To: Nicolas Schier <nicolas@fjasle.eu>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231119_201858_437537_53842E65 
X-CRM114-Status: GOOD (  15.12  )
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

T24gTW9uLCBOb3YgMjAsIDIwMjMgYXQgNTo1OOKAr0FNIE5pY29sYXMgU2NoaWVyIDxuaWNvbGFz
QGZqYXNsZS5ldT4gd3JvdGU6Cj4KPiBPbiBTYXQsIE5vdiAxOCwgMjAyMyBhdCAwNToxMzozNFBN
ICswOTAwIE1hc2FoaXJvIFlhbWFkYSB3cm90ZToKPiA+IEEgbGl0dGxlIG1vcmUgamFuaXRvcmlh
bCB3b3JrIGFmdGVyIGNvbW1pdCBjZjhlODY1ODEwMGQgKCJhcmNoOiBSZW1vdmUKPiA+IEl0YW5p
dW0gKElBLTY0KSBhcmNoaXRlY3R1cmUiKS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBNYXNhaGly
byBZYW1hZGEgPG1hc2FoaXJveUBrZXJuZWwub3JnPgo+ID4gLS0tCj4gPgo+ID4gIHNjcmlwdHMv
Y2hlY2tzdGFjay5wbCAgICAgICAgfCAgMyAtLS0KPiA+ICBzY3JpcHRzL2dkYi9saW51eC90YXNr
cy5weSAgIHwgMTUgKysrLS0tLS0tLS0tLS0tCj4gPiAgc2NyaXB0cy9oZWFkLW9iamVjdC1saXN0
LnR4dCB8ICAxIC0KPiA+ICBzY3JpcHRzL2tjb25maWcvbWNvbmYuYyAgICAgIHwgIDIgKy0KPiA+
ICBzY3JpcHRzL2tjb25maWcvbmNvbmYuYyAgICAgIHwgIDIgKy0KPiA+ICBzY3JpcHRzL3BhY2th
Z2Uva2VybmVsLnNwZWMgIHwgIDYgLS0tLS0tCj4gPiAgc2NyaXB0cy9wYWNrYWdlL21rZGViaWFu
ICAgICB8ICAyICstCj4gPiAgc2NyaXB0cy9yZWNvcmRtY291bnQucGwgICAgICB8ICA3IC0tLS0t
LS0KPiA+ICBzY3JpcHRzL3h6X3dyYXAuc2ggICAgICAgICAgIHwgIDEgLQo+ID4gIDkgZmlsZXMg
Y2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKPiA+Cj4KPiBUaGFua3Ms
IGxvb2tzIGdvb2QgdG8gbWUuICBNaWdodCB5b3Ugd2FudCB0byBhbHNvIHJlbW92ZSByZXBsYWNl
IHRoZSBsYXN0Cj4gcmVmZXJlbmNlcyBpbiB0aGUga2J1aWxkIGZpbGVzPwo+Cj4gc2NyaXB0cy9y
ZWNvcmRtY291bnQuYyAgdXNlcyBjcHAgc3ltYm9sIEVNX0lBXzY0CgpUaGFua3MsIEkgd2lsbCBy
ZW1vdmUgaXQgdG9vLgoKPiBNYWtlZmlsZSAgICAgICAgICAgICAgICBjb250YWlucyB0d28gY29t
bWVudHMgd2l0aCBleGFtcGxlcyBuYW1pbmcgSUE2NAoKCldoaWNoIGxpbmU/ICBJIGNvdWxkIG5v
dCBzcG90IHRoZW0uCgoKPiBzY3JpcHRzL2NoZWNrc3RhY2sucGwgICBzdGlsbCBob2xkcyBjcmVk
aXRzIGZvciBpdHMgKG5vdyByZW1vdmVkKSBJQTY0IHBvcnQsCj4gICAgICAgICAgICAgICAgICAg
ICAgICAgYnV0IHRoYXQgbWlnaHQgaGF2ZSBiZWVuIGxlZnQgYnkgaW50ZW50aW9uCgoKSSBoZXNp
dGF0ZSB0byB0b3VjaCB0aGUgY3JlZGl0LiBTbywgdGhpcyBpcyBpbnRlbnRpb25hbC4KCgoKCj4K
PiBOZXZlcnRoZWxlc3M6Cj4KPiBSZXZpZXdlZC1ieTogTmljb2xhcyBTY2hpZXIgPG5pY29sYXNA
Zmphc2xlLmV1Pgo+Cj4gS2luZCByZWdhcmRzLAo+IE5pY29sYXMKCgoKLS0gCkJlc3QgUmVnYXJk
cwpNYXNhaGlybyBZYW1hZGEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
