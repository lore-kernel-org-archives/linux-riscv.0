Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7074C001E0
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Aug 2023 15:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5BbFdIIxUKX8ifknJE+PQ3+CoTIiV/UZdswbYOZvIw=; b=FLzveDRGUMHdl0
	fN7iS3AwxuJgViMQv7C50/af69HdSkvxzSlw8jMh9kY46ReeRbudcBHVptmI6gBpBx3kfwJxAjRNJ
	ffvXWaTbShJWEBiiUTYIMPuS88TiVXUO5AkpSKMQnOgJFRfe2XjitvYr99AS+FQpkBWqmBFF5V77+
	uLlgkqgLbBDSysaDCBI8phpmWGcV8JuevuRox4Mf1m2bQ3bjg+rV4Qtrl1oAt82Z3UcttcMTh/WkK
	77XNANHfhN6o4epYibBRgawERHxH3mSTe1liZvr4Popdhf8lqIr+SXo680XmH3bqvbEmyNSGdHOAR
	E25i7UpoPPH9LfwMJdZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIua-004YOL-1H;
	Wed, 16 Aug 2023 15:58:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWIuX-004YNQ-2E
	for linux-riscv@lists.infradead.org;
	Wed, 16 Aug 2023 15:58:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 311CC64A27;
	Wed, 16 Aug 2023 15:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0244FC433C8;
	Wed, 16 Aug 2023 15:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692201496;
	bh=yI3jO41F7I/D3o6O2gOqgEinRf/cP8uzb58UxsDvrsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lOcjP2EXCONRBcqrbt5zkrB422WqcWN4nFbUcpq1VSIrMSUqz/I+eOOLH51KG4mUP
	 /oR92BYvYXlmHEB9etc0pB1mRX/y2xTv1f2qEFEC4n0Gp7pci+mKwh0+oumUO+8AqU
	 19i3pVPE4pHViUJpU/y4Geoo7v5Xvwx/UzBrmw1JoghVf/mnfSEM8GkZQ16jCz/OxT
	 rd32ztPE31TzWNp1fPQQZ7/+tzmn0f8iRvJwebRBjnNEvCxev0kB5uV4i/Unzb3rzJ
	 qzvHIsZQmPwqyFw54c6PuLhwxSluXo0SLZWczAAqyZ501d7u3/5zvTHQbzY3qryRuO
	 D84MQ9hFjdAfg==
Date: Wed, 16 Aug 2023 23:46:30 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Guo Ren <guoren@kernel.org>
Cc: Drew Fustini <dfustini@baylibre.com>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: change TH1520 files to dual license
Message-ID: <ZNzvVuJ9fW8xTCTN@xhacker>
References: <20230724182129.843687-1-dfustini@baylibre.com>
 <ZM9tUFddbRUglwfG@xhacker>
 <CAJF2gTT4pyAT5xpSAuOJ801WSk=xouv=uC0PSpHKqB3D=GxHsg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJF2gTT4pyAT5xpSAuOJ801WSk=xouv=uC0PSpHKqB3D=GxHsg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_085817_820672_C2A13CC8 
X-CRM114-Status: GOOD (  22.80  )
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

T24gVHVlLCBBdWcgMDgsIDIwMjMgYXQgMTE6MjM6MzBQTSArMDgwMCwgR3VvIFJlbiB3cm90ZToK
PiBPbiBTdW4sIEF1ZyA2LCAyMDIzIGF0IDY6MDPigK9QTSBKaXNoZW5nIFpoYW5nIDxqc3poYW5n
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IE9uIE1vbiwgSnVsIDI0LCAyMDIzIGF0IDExOjIx
OjI5QU0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+ID4gTW9kaWZ5IHRoZSBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllciBmb3IgZHVhbCBsaWNlbnNlIG9mIEdQTC0yLjAgT1IgTUlULgo+ID4g
Pgo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBEcmV3IEZ1c3RpbmkgPGRmdXN0aW5pQGJheWxpYnJlLmNv
bT4KCkFja2VkLWJ5OiBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5vcmc+Cgo+ID4gPiAt
LS0KPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUt
NGEuZHRzaSB8IDIgKy0KPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxp
Y2hlZS1waS00YS5kdHMgICAgICB8IDIgKy0KPiA+ID4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvdGhl
YWQvdGgxNTIwLmR0c2kgICAgICAgICAgICAgICAgICB8IDIgKy0KPiA+ID4gIDMgZmlsZXMgY2hh
bmdlZCwgMyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ID4gPgo+ID4gPiBKaXNoZW5n
IFpoYW5nIGFuZCBHdW8gUmVuIC0gSSB0aG91Z2h0IEkgd291bGQgcG9zdCB0aGlzIHBhdGNoIGJh
c2VkIG9uCj4gPiA+IHRoZSBkaXNjdXNzaW9uIGluIHRoZSB0aHJlYWQgYWJvdXQgdGhlIEJlYWds
ZVYgQWhlYWQgcGF0Y2hlcy4KPiA+Cj4gPiBJIG5lZWQgR3VvJ3MgYWNrIHRvIHRoaXMgcGF0Y2gu
IEhpIEd1byBSZW4sIGFyZSB5b3UgT0sgd2l0aCB0aGlzIHBhdGNoPwo+IEknbSBva2F5IHdpdGgg
dGhlIGR1YWwgbGljZW5zZS4KPiBBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+
Cj4gCj4gPgo+ID4gVGhhbmtzCj4gPgo+ID4gPgo+ID4gPiBNZXNzYWdlLUlEOgo+ID4gPiAyMDIz
MDcyMi11cHN0cmVhbS1iZWFnbGV2LWFoZWFkLWR0cy12MS0wLWNjZGE1MTEzNTdmNEBiYXlsaWJy
ZS5jb20KPiA+ID4KPiA+ID4gVGhhbmtzLAo+ID4gPiBEcmV3Cj4gPiA+Cj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0
c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0
c2kKPiA+ID4gaW5kZXggNGIwMjQ5YWM3MTBmLi5hODAyYWIxMTA0MjkgMTAwNjQ0Cj4gPiA+IC0t
LSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRz
aQo+ID4gPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtbW9k
dWxlLTRhLmR0c2kKPiA+ID4gQEAgLTEsNCArMSw0IEBACj4gPiA+IC0vLyBTUERYLUxpY2Vuc2Ut
SWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IChH
UEwtMi4wIE9SIE1JVCkKPiA+ID4gIC8qCj4gPiA+ICAgKiBDb3B5cmlnaHQgKEMpIDIwMjMgSmlz
aGVuZyBaaGFuZyA8anN6aGFuZ0BrZXJuZWwub3JnPgo+ID4gPiAgICovCj4gPiA+IGRpZmYgLS1n
aXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzIGIv
YXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gPiBp
bmRleCBhMTI0OGIyZWUzYTMuLjlhMzg4NGE3M2UxMyAxMDA2NDQKPiA+ID4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gPiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtcGktNGEuZHRzCj4gPiA+IEBA
IC0xLDQgKzEsNCBAQAo+ID4gPiAtLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAK
PiA+ID4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBNSVQpCj4gPiA+
ICAvKgo+ID4gPiAgICogQ29weXJpZ2h0IChDKSAyMDIzIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4KPiA+ID4gICAqLwo+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290
L2R0cy90aGVhZC90aDE1MjAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIw
LmR0c2kKPiA+ID4gaW5kZXggNTZhNzMxMzRiNDllLi5jZTcwODE4M2I2ZjYgMTAwNjQ0Cj4gPiA+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiA+ID4gKysrIGIv
YXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+ID4gPiBAQCAtMSw0ICsxLDQg
QEAKPiA+ID4gLS8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wCj4gPiA+ICsvLyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgTUlUKQo+ID4gPiAgLyoKPiA+ID4g
ICAqIENvcHlyaWdodCAoQykgMjAyMSBBbGliYWJhIEdyb3VwIEhvbGRpbmcgTGltaXRlZC4KPiA+
ID4gICAqIENvcHlyaWdodCAoQykgMjAyMyBKaXNoZW5nIFpoYW5nIDxqc3poYW5nQGtlcm5lbC5v
cmc+Cj4gPiA+IC0tCj4gPiA+IDIuMzQuMQo+ID4gPgo+IAo+IAo+IAo+IC0tIAo+IEJlc3QgUmVn
YXJkcwo+ICBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
