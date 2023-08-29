Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 059C9C83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K/GsFqCYGS/JOgj+OwET3+bwxUwTcudOcXvbYp1lRsA=; b=dAZKBlcw3Wx+qJ
	UKZ5DLMxGA4dGaGPM/XL/abWd2ueZ7wdskys4jfxJnAa7Dhqlk+ymjhn9Th87Q88l7fq7p5oPIs3Z
	oq10zejCuYkVHlHOl0GXToNVVlA5jraDbD5JmTmHQd/MXgLT0ZvWG16CgcoVeM4dZdXNqq60WecEt
	U9xBsq9oV22Y3Mz4nInQQlf6xUnHSAIZ9A5LU0+IqNe9PcSXOBzcI0qaCtnED2haKGiMG6/szbgCE
	d5lZLCoiR0B1qCDYNjXkSTMt3GGELPVEn2STP5AyakIBpZuYf/v0aiffa1Urzq71DX8zxtSwOhcdH
	9MtH6OL+n5VonwXjJTPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qavKv-00BAuo-1g;
	Tue, 29 Aug 2023 09:48:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qavKs-00BAuJ-26
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 09:48:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A45E160AC5
	for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 09:48:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 925B3C433CD
	for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 09:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693302512;
	bh=Ie5xcTYnrckxg5XqByJnbSDX/dunTFFUtMXUS58dsIE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YNT4xgy7zjQeED/xAJkzhazs0cVi0PZzFcHbcPyB3fNMMk/1T7eruJjHxw4onQC3l
	 7IOAaLRZ4tfKzwKPhexWoMsAR5QBxSXFu+nNcwdsH3hXvrvS681e7Y2fbV2H4VuuT8
	 fJQw4TmIGhM63/lnUyIx8+Rq3K3ftr+lF2EnXHEOWh351NGUhIMCatpu0h02jfgLVo
	 2IO2BlcU/qCdblDjMAuZ/h54bjVGRr6js2GXRRu2VPc8lr0JVDUtYkFnSKvgI1tfvv
	 GJqAB+GbdRakKJqu7l3DjEX5j9VzoCVR3L8E+4Ry95coZHjBekwS6Ot7zoTVRPhJbJ
	 uPPlvQ9Ah8LxA==
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-52a3aa99bcdso5870512a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Aug 2023 02:48:32 -0700 (PDT)
X-Gm-Message-State: AOJu0Yyn8UFp0O1Ji1dNpiDy9lnvPkaGMFd/IaghUbUD3K32rvONYfaI
	hiwIpRxgMRKSspydEAs4ONzUentx8o3dz7P1ZeY=
X-Google-Smtp-Source: AGHT+IGlVJEQGrdz0NMMhRYrrwdVqAz+hx4g2Fcuryt6QGy9sIKlI9nXA9wCpnaKjF5re6+FCHvT26gKZTR/GNPWOsw=
X-Received: by 2002:a05:6402:b29:b0:523:4a4e:3b57 with SMTP id
 bo9-20020a0564020b2900b005234a4e3b57mr21591777edb.13.1693302510808; Tue, 29
 Aug 2023 02:48:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230829083614.117748-1-namcaov@gmail.com>
In-Reply-To: <20230829083614.117748-1-namcaov@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 29 Aug 2023 17:48:19 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTdEY-H7QrVyY31Z5nCG0yqo4Zo9W1dBbGEzRqZdec55Q@mail.gmail.com>
Message-ID: <CAJF2gTTdEY-H7QrVyY31Z5nCG0yqo4Zo9W1dBbGEzRqZdec55Q@mail.gmail.com>
Subject: Re: [PATCH v2] riscv: provide riscv-specific is_trap_insn()
To: Nam Cao <namcaov@gmail.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bjorn@kernel.org, conor.dooley@microchip.com, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230829_024834_772542_A81B4FE7 
X-CRM114-Status: GOOD (  19.80  )
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

VGh4IGZvciB0aGUgZml4LgoKUmV2aWV3ZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3Jn
PgoKT24gVHVlLCBBdWcgMjksIDIwMjMgYXQgNDozN+KAr1BNIE5hbSBDYW8gPG5hbWNhb3ZAZ21h
aWwuY29tPiB3cm90ZToKPgo+IHVwcm9iZXMgZXhwZWN0cyBpc190cmFwX2luc24oKSB0byByZXR1
cm4gdHJ1ZSBmb3IgYW55IHRyYXAgaW5zdHJ1Y3Rpb25zLAo+IG5vdCBqdXN0IHRoZSBvbmUgdXNl
ZCBmb3IgaW5zdGFsbGluZyB1cHJvYmUuIFRoZSBjdXJyZW50IGRlZmF1bHQKPiBpbXBsZW1lbnRh
dGlvbiBvbmx5IHJldHVybnMgdHJ1ZSBmb3IgMTYtYml0IGMuZWJyZWFrIGlmIEMgZXh0ZW5zaW9u
IGlzCj4gZW5hYmxlZC4gVGhpcyBjYW4gY29uZnVzZSB1cHJvYmVzIGlmIGEgMzItYml0IGVicmVh
ayBnZW5lcmF0ZXMgYSB0cmFwCj4gZXhjZXB0aW9uIGZyb20gdXNlcnNwYWNlOiB1cHJvYmVzIGFz
a3MgaXNfdHJhcF9pbnNuKCkgd2hvIHNheXMgdGhlcmUgaXMgbm8KPiB0cmFwLCBzbyB1cHJvYmVz
IGFzc3VtZSBhIHByb2JlIHdhcyB0aGVyZSBiZWZvcmUgYnV0IGhhcyBiZWVuIHJlbW92ZWQsIGFu
ZAo+IHJldHVybiB0byB0aGUgdHJhcCBpbnN0cnVjdGlvbi4gVGhpcyBjYXVzZXMgYW4gaW5maW5p
dGUgbG9vcCBvZiBlbnRlcmluZwo+IGFuZCBleGl0aW5nIHRyYXAgaGFuZGxlci4KPgo+IEluc3Rl
YWQgb2YgdXNpbmcgdGhlIGRlZmF1bHQgaW1wbGVtZW50YXRpb24sIGltcGxlbWVudCB0aGlzIGZ1
bmN0aW9uCj4gc3BlZmljaWFsbHkgZm9yIHJpc2N2IHdpdGggY2hlY2tzIGZvciBib3RoIGVicmVh
ayBhbmQgYy5lYnJlYWsuCj4KPiBGaXhlczogNzQ3ODQwODFhYWM4ICgicmlzY3Y6IEFkZCB1cHJv
YmVzIHN1cHBvcnRlZCIpCj4gU2lnbmVkLW9mZi1ieTogTmFtIENhbyA8bmFtY2FvdkBnbWFpbC5j
b20+Cj4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0t
Cj4gdjI6IHJlbW92ZSAjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9DIChHdW8gUmVuKQo+Cj4gIGFy
Y2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMgfCA2ICsrKysrKwo+ICAxIGZpbGUgY2hh
bmdlZCwgNiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL3Vwcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy91cHJvYmVzLmMKPiBp
bmRleCAxOTRmMTY2YjJjYzQuLjRiM2RjOGJlYWY3NyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L3Vwcm9iZXMuYwo+IEBAIC0zLDYgKzMsNyBAQAo+ICAjaW5jbHVkZSA8bGludXgvaGlnaG1lbS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgvcHRyYWNlLmg+Cj4gICNpbmNsdWRlIDxsaW51eC91cHJvYmVz
Lmg+Cj4gKyNpbmNsdWRlIDxhc20vaW5zbi5oPgo+Cj4gICNpbmNsdWRlICJkZWNvZGUtaW5zbi5o
Igo+Cj4gQEAgLTE3LDYgKzE4LDExIEBAIGJvb2wgaXNfc3dicF9pbnNuKHVwcm9iZV9vcGNvZGVf
dCAqaW5zbikKPiAgI2VuZGlmCj4gIH0KPgo+ICtib29sIGlzX3RyYXBfaW5zbih1cHJvYmVfb3Bj
b2RlX3QgKmluc24pCj4gK3sKPiArICAgICAgIHJldHVybiByaXNjdl9pbnNuX2lzX2VicmVhaygq
aW5zbikgfHwgcmlzY3ZfaW5zbl9pc19jX2VicmVhaygqaW5zbik7Cj4gK30KPiArCj4gIHVuc2ln
bmVkIGxvbmcgdXByb2JlX2dldF9zd2JwX2FkZHIoc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4gIHsK
PiAgICAgICAgIHJldHVybiBpbnN0cnVjdGlvbl9wb2ludGVyKHJlZ3MpOwo+IC0tCj4gMi4zNC4x
Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
