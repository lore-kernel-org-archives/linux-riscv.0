Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C2C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KVIHrL//MW/ed82BR6r3QrU9ccb1vbh2YlLnbJQQ1ts=; b=tqxtluqegKKzr8
	/4+edJtuFrbmN3C9LRS98Zd8ufSWAiMhbMou8GI+gHNGb9DDZUdymCY9kE98j3oJVecAHhKXzPOXl
	XN9dhJsQfa34Zg8SFsjiBuatXI1VLFHxrSwhJ8wPeHnfLaWbo/AfPbYzxgH0ZRDA9YHgFdPc15ZQD
	F5G6gUJ1yC5asnf1PJBFSukLkMSxUXJ3mq4w+/wbhKXJeNDAGsmD6SiG34KhloVCBEbRXXtiDb0W7
	YIF6hBnkAaS2mrR6bIwaM1QRUFE2/zQUUolZoO/aHVdTHVan3NCIhH/IXYAT0N0yS+LREzrD4o811
	ngWLTORYA61nY3igWXyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuLQ-004AH9-1h;
	Mon, 24 Jul 2023 12:07:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuLO-004AFw-0C
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 12:07:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C4AC2610A7
	for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 12:07:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C78CC433C9
	for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 12:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690200436;
	bh=mUzc4Ur1XvYCglWORhoouHVsGfP5Zuo7LALNOIroXA8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=nD+C2LDdhcXj+EtTw57POQ+IRCZqZyhOq0jbissoR4ryS62oI6EG7Mz9vZAQLBQMI
	 sFWQfJh8Jkwhk/GaFvnHlTLw6MaOnHniHuBAR8HhUO6rlxqMzXxV38ZWbd/Adwt0bL
	 sy+tT0k1wTEWcgl1RtFYyur4szZLlHaYTE8IWzOhnWywNL09/3jIGE5/qGnWlQL4La
	 xZeUrKGqpXg2WELoQ43FjBTl0RjZCz6NIpoYiFRGGlasaVaG8NRU+gKiTT6RD3v0jj
	 ov1kEP0NNpSzVsuR8mWZbK4nvv6kq17AMWKLt1zt0ntCHT40JwUOkoxGbgnW/hOmDj
	 Q50yENGLj/umw==
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-99b9161b94aso176767966b.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 05:07:16 -0700 (PDT)
X-Gm-Message-State: ABy/qLYBRkvahsDbUK1Jm7rF+3gLBJ0KAK1ntFI2bXkipAX+LfYo128q
	SYoQs02xZKQYfVjH+JyzH0gMcCH4we4wtUKn4+s=
X-Google-Smtp-Source: APBJJlEyloc5DakAYqh6G8yHellhKgyr+9w2ynhQc6zoeQUHTTaspueWL6G8z+BSg5VtR0UUv51nNMHOKZoM0BoQTTg=
X-Received: by 2002:a17:906:3193:b0:994:5592:ba61 with SMTP id
 19-20020a170906319300b009945592ba61mr10340385ejy.0.1690200434376; Mon, 24 Jul
 2023 05:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-1-ccda511357f4@baylibre.com>
 <20230723-savor-trolling-e35ed4a7a751@spud> <ZL1jlacHj7sgNg8M@x1>
 <ZL3Eenj4lGZDhZTM@xhacker> <20230724-census-party-0a50d1563075@wendy>
In-Reply-To: <20230724-census-party-0a50d1563075@wendy>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 24 Jul 2023 20:07:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQrdM2+u=ek_dCYZHVAgJHvzpCknZ14xRR=s_yCFRJcTQ@mail.gmail.com>
Message-ID: <CAJF2gTQrdM2+u=ek_dCYZHVAgJHvzpCknZ14xRR=s_yCFRJcTQ@mail.gmail.com>
Subject: Re: [PATCH 1/3] riscv: dts: thead: add BeagleV Ahead board device tree
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Drew Fustini <dfustini@baylibre.com>, 
	Conor Dooley <conor@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_050718_215873_EF396BD4 
X-CRM114-Status: GOOD (  22.25  )
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

T24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgNjozOOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3IuZG9v
bGV5QG1pY3JvY2hpcC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBKdWwgMjQsIDIwMjMgYXQgMDg6
MjM6MjJBTSArMDgwMCwgSmlzaGVuZyBaaGFuZyB3cm90ZToKPiA+IE9uIFN1biwgSnVsIDIzLCAy
MDIzIGF0IDEwOjI5OjU3QU0gLTA3MDAsIERyZXcgRnVzdGluaSB3cm90ZToKPiA+ID4gT24gU3Vu
LCBKdWwgMjMsIDIwMjMgYXQgMTE6MzI6MTdBTSArMDEwMCwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+
ID4gPiA+IE9uIFNhdCwgSnVsIDIyLCAyMDIzIGF0IDAyOjU1OjM5UE0gLTA3MDAsIERyZXcgRnVz
dGluaSB3cm90ZToKPiA+ID4gPgo+ID4gPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy90
aGVhZC90aDE1MjAtYmVhZ2xldi1haGVhZC5kdHMKPiA+ID4gPiA+IEBAIC0wLDAgKzEsNjEgQEAK
PiA+ID4gPiA+ICsvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4gPiA+Cj4g
PiA+ID4gSG1tLCBzaG91bGQgdGhpcyBub3QgYmUgZHVhbCBsaWNlbnNlZD8KPiA+ID4gPiBJIG5v
dGljZSB0aGUgb3RoZXIgdGgxNTIwIHN0dWZmIGlzbid0IGVpdGhlci4uCj4gPiA+Cj4gPiA+IEdv
b2QgcG9pbnQsIEknbGwgcmVzdWJtaXQgd2l0aCBhIGR1YWwgbGljZW5zZS4KPiA+ID4KPiA+ID4g
SmlzaGVuZzogYXJlIHlvdSBva2F5IHdpdGggdGhlIG90aGVyIGFyY2gvcmlzY3YvYm9vdC9kdHMv
dGhlYWQgZmlsZXMKPiA+ID4gY2hhbmdpbmcgdG8gYSBkdWFsIGxpY2Vuc2U/Cj4gPgo+ID4gV2hl
biBjb29raW5nIHRoZSBpbml0aWFsIHBhdGNoLCBJIHdyb3RlIHRoZSBscGk0YSBkdHMgZmlsZXMg
ZnJvbQo+ID4gc2NyYXRjaCBiYXNlZCBvbiBzaXBlZWQgb3BlbmVkIHNjaCBmaWxlLCBhbmQgY3Vy
cmVudGx5IG9ubHkgSSBtYWRlCj4gPiBjb250cmlidXRpb25zIHRvIHRoZW0sIHNvIGl0J3MgZWFz
eSB0byBtYWtlIHRoZSBscGk0YSBkdHMgZmlsZXMKPiA+IGR1YWwgbGljZW5zZS4KPiA+Cj4gPiBI
b3dldmVyLCB3aGVuIGNvbnN0cnVjdGluZyB0aGUgdGgxNTIwLmR0c2ksIEkgcmVmZXJlZCB0aGUg
VC1IRUFEJ3MKPiA+IG9wZW5zb3VyY2VkIHlvY3RvIHJlcG8oaW4gZmFjdCwgdGhhdCdzIHRoZSBv
bmx5IHNvdXJjZWNvZGUvZG9jIEkgaGF2ZQo+ID4gYXQgdGhhdCB0aW1lKSwgYW5kIHRoZSBsaWNl
bnNlIHRoZXJlIGlzIEdQTC0yLjAuIFRoYXQncwo+ID4gYWxzbyB0aGUgcmVhc29uIHdoeSBjb3B5
cmlnaHQgb2YgQWxpYmFiYSBHcm91cCBIb2xkaW5nIExpbWl0ZWQgaXMKPiA+IGFkZGVkIHRvIHRo
MTUyMC5kdHNpLiBJJ20gbm90IHN1cmUgaG93IHRvIG1ha2UgdGgxNTIwLmR0c2kgZHVhbAo+ID4g
bGljZW5zZS4gQXQgbGVhc3QsIHRoaXMgbmVlZHMgaGVscCBmcm9tIEd1byBSZW4uIEFueSBzdWdn
ZXN0aW9uIGlzCj4gPiBhcHByZWNpYXRlZC4KPgo+IEkgdGhpbmsgR3VvIFJlbiBBY2tpbmcgdGhl
IGNoYW5nZSBzaG91bGQgYmUgc3VmZmljaWVudC4gSXQnZCBiZSBnb29kIHRvCj4gaGF2ZSB0aGVt
IGR1YWwgbGljZW5zZWQgdG8gbWFrZSBpdCBlYXNpZXIgZm9yIG90aGVyIHByb2plY3RzIHRvIGlu
Y2x1ZGUKPiB0aGUgZHRzIGZpbGVzIGZyb20gTGludXguIEFsbW9zdCBhbGwgb2Ygd2hhdCB3ZSBo
YXZlIGF0IHRoZSBtb21lbnQgaXMKPiBkdWFsIGxpY2Vuc2VkLCBvdGhlciB0aGFuIHRoZSBDYW5h
YW4gc3R1ZmYgJiBzb21lIGJvYXJkIGR0cyBmaWxlcyBJIGdvdAo+IGZyb20gY3VzdG9tZXJzIHRo
YXQgd2VyZSBvbmx5IEdQTGVkLgpZZXMsIGR1YWwgbGljZW5zZSBpcyBva2F5IGZvciB1cy4KCgoK
LS0gCkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
