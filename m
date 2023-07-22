Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B7AEC0015E
	for <linux-riscv@archiver.kernel.org>; Sat, 22 Jul 2023 23:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O1WGlpj4V6QmFF9acsPChdUtTxIRej5NRjBZae8rNcM=; b=oxeF6YJ2w9da7Q
	xvyyVVDRu+XYQPXQxRJpiN/1+BsuseJUxisJxpM2ptp8w4CA9a7pWVI/xzrc0eeM2TxPYUCLjCs06
	nOID5zbNyePGI+jQ5KhLbXHZsbn+1OOw4aNJlOsHlJXWf25wSpnN2N2uYavaGpryL6AzmTHbArOkC
	Jqx/l4zVwsV7b1Nju6FYw4uqSQ98ZMQt5uRmqIbTYLziDfevwH+y42qBTKRzA2A+bDkYm6EREPdIQ
	XptE4dIqvRMgyh1NMdbT22ZLVmSEMVYtAnda1uPAZT4IJOdQGistDhSwMpMyCn4HWlwEIjVny3Ob2
	QD+lkqx7kV3t1A7VDf8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNLbh-00HS3G-1V;
	Sat, 22 Jul 2023 23:01:49 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNLbb-00HS1i-30
	for linux-riscv@lists.infradead.org;
	Sat, 22 Jul 2023 23:01:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A2A54609AD
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B45C433CA
	for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 23:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690066902;
	bh=f5fJ5pt4NPXx34Hb37BM+d9wtJCqjXyDFsIKLF1ji4M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ktzByZSHZKMnUFFHYr9Kda8gzWkeIJllN3e4aoc4Ms7oFfuy1TiF9k9Way7zxbLNO
	 k8qWagPd5Aq8OgFMRjlEWQ9SWARNokLqZ8TrqazVSg/JECY5AhlrmZXmn6NXi+dpSn
	 GIZbhcorwh2wABAVj5PysI4rN/L5y1skFqT8wRModTdSI3t7EKMQ6fQaTHuiWmUT7e
	 SbgHEX90zPUqNjYkRjwZguV/zh47m6/4mNKu9AG+bpJ828yFPOGrM35MWjdn+39cKs
	 OC8xtIjqhFK531Phret/ENXQcTwzyvc1MPt5YpTF4eE8m0xx89qqU5GMWnFuPstACD
	 cIp3iokwQx4Tw==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-991da766865so519445466b.0
        for <linux-riscv@lists.infradead.org>; Sat, 22 Jul 2023 16:01:41 -0700 (PDT)
X-Gm-Message-State: ABy/qLZJuPqn28cNM4WbpZP45C11MG3/gPU7wbkYLh40+zJg4SUbHGtD
	lb/IQxerxsmfZutvt8oVdjL51eb4lxuRMZWE+8E=
X-Google-Smtp-Source: APBJJlF26FPEiQllO/7cbxZ7b0mlUSpKebzJvhSee6tgA9QZyHuDxj84+S630hPdYKUJ6Jbtr2VvSneKxurZON2Of18=
X-Received: by 2002:a17:906:649a:b0:993:d616:7ca9 with SMTP id
 e26-20020a170906649a00b00993d6167ca9mr6057799ejm.23.1690066900315; Sat, 22
 Jul 2023 16:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <20230722-upstream-beaglev-ahead-dts-v1-0-ccda511357f4@baylibre.com>
 <20230722-upstream-beaglev-ahead-dts-v1-3-ccda511357f4@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v1-3-ccda511357f4@baylibre.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 23 Jul 2023 07:01:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQ4pdFruCgfwT=pkXEoLN91cC6S2op6RyiBmGm_Vw2xMw@mail.gmail.com>
Message-ID: <CAJF2gTQ4pdFruCgfwT=pkXEoLN91cC6S2op6RyiBmGm_Vw2xMw@mail.gmail.com>
Subject: Re: [PATCH 3/3] MAINTAINERS: add reviewer for T-Head RISC-V SoC support
To: Drew Fustini <dfustini@baylibre.com>
Cc: Jisheng Zhang <jszhang@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
	Jason Kridner <jkridner@beagleboard.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230722_160144_036772_312339D2 
X-CRM114-Status: GOOD (  14.42  )
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

QWNrZWQtYnk6IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPgoKT24gU3VuLCBKdWwgMjMsIDIw
MjMgYXQgNTo1NuKAr0FNIERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlAYmF5bGlicmUuY29tPiB3cm90
ZToKPgo+IEkgd2lsbCBtYWludGFpbiBzdXBwb3J0IGZvciB0aGUgVEgxNTIwLWJhc2VkIEJlYWds
ZVYgQWhlYWQgYm9hcmQgc28KPiBhZGRpbmcgbXlzZWxmIGFzIGEgcmV2aWV3ZXIgZm9yIFQtSGVh
ZCBTb0MgcGF0Y2hlcy4KPgo+IFNpZ25lZC1vZmYtYnk6IERyZXcgRnVzdGluaSA8ZGZ1c3RpbmlA
YmF5bGlicmUuY29tPgo+IC0tLQo+ICBNQUlOVEFJTkVSUyB8IDEgKwo+ICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKPgo+IGRpZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlO
RVJTCj4gaW5kZXggZDUxNjI5NTk3OGE0Li5lYWVjMzMzM2YyZWQgMTAwNjQ0Cj4gLS0tIGEvTUFJ
TlRBSU5FUlMKPiArKysgYi9NQUlOVEFJTkVSUwo+IEBAIC0xODMyNiw2ICsxODMyNiw3IEBAIFJJ
U0MtViBUSEVBRCBTb0MgU1VQUE9SVAo+ICBNOiAgICAgSmlzaGVuZyBaaGFuZyA8anN6aGFuZ0Br
ZXJuZWwub3JnPgo+ICBNOiAgICAgR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5vcmc+Cj4gIE06ICAg
ICBGdSBXZWkgPHdlZnVAcmVkaGF0LmNvbT4KPiArUjogICAgIERyZXcgRnVzdGluaSA8ZGZ1c3Rp
bmlAYmF5bGlicmUuY29tPgo+ICBMOiAgICAgbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
Zwo+ICBTOiAgICAgTWFpbnRhaW5lZAo+ICBGOiAgICAgYXJjaC9yaXNjdi9ib290L2R0cy90aGVh
ZC8KPgo+IC0tCj4gMi4zNC4xCj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWls
aW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5m
cmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
