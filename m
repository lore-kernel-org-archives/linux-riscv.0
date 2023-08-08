Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA85C04A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 15:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fZDJBu0O/BCe3LCIU5kPjgnoF6mXqX2zhM7WoIjVZ/Q=; b=iulE7XC0lG8ycB
	QDlBkWL1HAoPs/8P+3fn+K2p/cL7p8KRzx/yra0pAI3wWEVDDqpuFnZWCQyGRFq4offQf2/pGw73C
	HitLqjIrwr2RHIjkgtA6Z70p/yxsUHVH37lsv+p5W9oXzaKGhpM40d8D4K/46Q483d9UvX5/zEU66
	F6nthEIpbx6JkSCd81W+lbXpj/9Egt++I1sxr0BvrQj6u6zQlSY+P6PMnkIgMWc7kpd8NPT2cfeXG
	NI6wTITIvltE/n9RuS5EHCtmpdBMOfQnq/mVcAxmSbSfvysjxKOCzMXnzjMdFgZofRF2vmmSNBYDV
	4lSZ+uXq8XxoH/XurdvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOYl-002oKM-0D;
	Tue, 08 Aug 2023 15:23:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTOYi-002oJO-14
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 15:23:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0D31625B4
	for <linux-riscv@lists.infradead.org>; Tue,  8 Aug 2023 15:23:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360D3C433C9
	for <linux-riscv@lists.infradead.org>; Tue,  8 Aug 2023 15:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691508223;
	bh=p/gZrLJWIq9rjBprunm92rcmzahKLeL9mAVdQI8fVVo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Qy1+8nyJUvB/EfBRGU/WqIuoJPDI/GX+NItsoVvhZHjuGZEA9FNTIkvUV7wzcp/vO
	 TFiNMnr0oRvIZ+0b7CjviOqqavXvwjKOdxq4YZeMIwV/koBj/VnjyOF+3TqNTALbeo
	 khBdOOBovJ8wU9T/ByaDAqeiOEIzgqwj+HazzzSAVaIg1f7diMd02T/Tm6HL0uM5D7
	 G4g+cx4pQY84gklxi+GtRgwkx+G8OQGkSxqGhu2Xrkhz1zflarGAWb3zmpmAsMsruZ
	 YizxvcUov6ok56EnIdohnSBOUNyinKRwwx5o1/md6QfsVQoqHm7FNWAx2tbJCHzqbb
	 GBlhxdRN1uQnA==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5223fbd54c6so8250272a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 08:23:43 -0700 (PDT)
X-Gm-Message-State: AOJu0Yxa8ejWdDco0H0XdCF2lIwkbi6qzAJmaCj2BNNuj6CfR/bYwnS7
	sccLCP7p/hRz0swRLsPiuuzCjX637B0J1XGbyFo=
X-Google-Smtp-Source: AGHT+IFokLhJzs0xQ2NHVRIO9yXYHKzsfvqWkhy1RiVlRicnei4YhMS57h/OcLGJhZHDLuqZXniZJtcKEiLEmfB9g90=
X-Received: by 2002:aa7:c542:0:b0:521:8d64:df1c with SMTP id
 s2-20020aa7c542000000b005218d64df1cmr156003edr.0.1691508221350; Tue, 08 Aug
 2023 08:23:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230724182129.843687-1-dfustini@baylibre.com> <ZM9tUFddbRUglwfG@xhacker>
In-Reply-To: <ZM9tUFddbRUglwfG@xhacker>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 8 Aug 2023 23:23:30 +0800
X-Gmail-Original-Message-ID: <CAJF2gTT4pyAT5xpSAuOJ801WSk=xouv=uC0PSpHKqB3D=GxHsg@mail.gmail.com>
Message-ID: <CAJF2gTT4pyAT5xpSAuOJ801WSk=xouv=uC0PSpHKqB3D=GxHsg@mail.gmail.com>
Subject: Re: [PATCH] riscv: dts: change TH1520 files to dual license
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_082344_458292_CBD65170 
X-CRM114-Status: GOOD (  21.41  )
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

T24gU3VuLCBBdWcgNiwgMjAyMyBhdCA2OjAz4oCvUE0gSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDExOjIxOjI5QU0g
LTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+IE1vZGlmeSB0aGUgU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXIgZm9yIGR1YWwgbGljZW5zZSBvZiBHUEwtMi4wIE9SIE1JVC4KPiA+Cj4gPiBTaWdu
ZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQGJheWxpYnJlLmNvbT4KPiA+IC0tLQo+
ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRz
aSB8IDIgKy0KPiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGkt
NGEuZHRzICAgICAgfCAyICstCj4gPiAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAu
ZHRzaSAgICAgICAgICAgICAgICAgIHwgMiArLQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4KPiA+IEppc2hlbmcgWmhhbmcgYW5kIEd1byBS
ZW4gLSBJIHRob3VnaHQgSSB3b3VsZCBwb3N0IHRoaXMgcGF0Y2ggYmFzZWQgb24KPiA+IHRoZSBk
aXNjdXNzaW9uIGluIHRoZSB0aHJlYWQgYWJvdXQgdGhlIEJlYWdsZVYgQWhlYWQgcGF0Y2hlcy4K
Pgo+IEkgbmVlZCBHdW8ncyBhY2sgdG8gdGhpcyBwYXRjaC4gSGkgR3VvIFJlbiwgYXJlIHlvdSBP
SyB3aXRoIHRoaXMgcGF0Y2g/CkknbSBva2F5IHdpdGggdGhlIGR1YWwgbGljZW5zZS4KQWNrZWQt
Ynk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKPgo+IFRoYW5rcwo+Cj4gPgo+ID4gTWVz
c2FnZS1JRDoKPiA+IDIwMjMwNzIyLXVwc3RyZWFtLWJlYWdsZXYtYWhlYWQtZHRzLXYxLTAtY2Nk
YTUxMTM1N2Y0QGJheWxpYnJlLmNvbQo+ID4KPiA+IFRoYW5rcywKPiA+IERyZXcKPiA+Cj4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLW1vZHVs
ZS00YS5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLW1vZHVs
ZS00YS5kdHNpCj4gPiBpbmRleCA0YjAyNDlhYzcxMGYuLmE4MDJhYjExMDQyOSAxMDA2NDQKPiA+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEu
ZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLW1v
ZHVsZS00YS5kdHNpCj4gPiBAQCAtMSw0ICsxLDQgQEAKPiA+IC0vLyBTUERYLUxpY2Vuc2UtSWRl
bnRpZmllcjogR1BMLTIuMAo+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIu
MCBPUiBNSVQpCj4gPiAgLyoKPiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlzaGVuZyBaaGFu
ZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gICAqLwo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4gPiBpbmRleCBhMTI0OGIyZWUz
YTMuLjlhMzg4NGE3M2UxMyAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhl
YWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMv
dGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiA+IEBAIC0xLDQgKzEsNCBAQAo+ID4gLS8v
IFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlk
ZW50aWZpZXI6IChHUEwtMi4wIE9SIE1JVCkKPiA+ICAvKgo+ID4gICAqIENvcHlyaWdodCAoQykg
MjAyMyBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cj4gPiAgICovCj4gPiBkaWZm
IC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiA+IGluZGV4IDU2YTczMTM0YjQ5ZS4uY2U3
MDgxODNiNmY2IDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1
MjAuZHRzaQo+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+
ID4gQEAgLTEsNCArMSw0IEBACj4gPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0y
LjAKPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ID4g
IC8qCj4gPiAgICogQ29weXJpZ2h0IChDKSAyMDIxIEFsaWJhYmEgR3JvdXAgSG9sZGluZyBMaW1p
dGVkLgo+ID4gICAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtl
cm5lbC5vcmc+Cj4gPiAtLQo+ID4gMi4zNC4xCj4gPgoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8g
UmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
