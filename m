Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF51C83F11
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Aug 2023 10:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y4xAL17C3kxGB6hfK1L+aotFsbvEwEpGRYO7D0AcOuo=; b=eqvqJvy4YISCIp
	IpMV6QpbYQWA1mjbKvm7CCMLfWfo433JePSL4Pm0BTqQgr9vvpiKGhotOtjzR90gnHeQqlkDvGsuz
	V/TUz4QpoTzBEFQKLQ7VoK7imZ+MsVOqWlLJIVmO5AgRO1FZ8XtWBLK0bW6ogNCsSrth94xfpaHbv
	1td9DLRbV/H2+i1lY8Rzn3SpBWGgSUWgbrMUwkfQZuolglh6TJeVwM9qc7ytobT2hhSnPrHMFUoKF
	rLHptflKpLHkMcwykqEMzcXmmAR0b5YlNIFUK0Xs9oidvOOBV1XErnzGxTshgwaxU+l3ik+/egb/H
	CLBxwIyvYKlgBcKnIMCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCrC-007tZw-0d;
	Sun, 27 Aug 2023 10:18:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaCr9-007tXr-2B
	for linux-riscv@lists.infradead.org;
	Sun, 27 Aug 2023 10:18:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8AB8262BB4
	for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 10:18:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00F6BC433CA
	for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 10:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693131534;
	bh=PFIO5vLBBD+8A0zyM0b7mUY3zex5RZW+Gl+CUcxvcG0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NU+ZOvWVDtseXndW8WpjhAvTGlIHOz0fX6PK9NfX1OxndDj7gDAz8/1gWljOgBGAF
	 CQlSWJdWjno4h4oxVKqTAJ4frUPcJu7ojbJlhZkiS0J7bLElqg5CQLfg1t0NrgkMLd
	 a+Wkm9xcKFPfAMW+5ztwc5ozK0C+0xtdbngO1LI4zD9ltvfbzFscgdlhWsRNwPFzpH
	 cwsoIi2zYeV5GoalNhtGVwNy3Oq7W5BXcEjVsLRPra869LWn+iWbPd//VnpeBE5ZRp
	 /CRVArYGaNEUx9mNP9AMG4v/mzfiAh+wtQjdnnZDqtiWdIc8L2b1KRBENBqaIAA3Oq
	 htiRurm8BnLYQ==
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-500b3f7f336so971506e87.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Aug 2023 03:18:53 -0700 (PDT)
X-Gm-Message-State: AOJu0Yzuxkma5/ZeBTIiVJ33XidvRxISfehOnBBymwoFnG5GvDF1+yOB
	sNKwge8Xfdm669vDM8OtwGh4cJK6/jqtQSQjaFg=
X-Google-Smtp-Source: AGHT+IFv97vcQvxow4dQrpUTObNLTldjJHYJlxW3bULXJEHlJN/vR2IHG3vY43IgqTE36N1ohJXoUXiJFaD1GrgcxUE=
X-Received: by 2002:ac2:5f41:0:b0:4f8:72fd:ed95 with SMTP id
 1-20020ac25f41000000b004f872fded95mr13011795lfz.22.1693131531948; Sun, 27 Aug
 2023 03:18:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230827090813.1353-1-jszhang@kernel.org> <20230827090813.1353-3-jszhang@kernel.org>
In-Reply-To: <20230827090813.1353-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 27 Aug 2023 06:18:40 -0400
X-Gmail-Original-Message-ID: <CAJF2gTS1P-1PhWM6qLowbAPm8N0iPyq+88+2=SunCdAY07fe1g@mail.gmail.com>
Message-ID: <CAJF2gTS1P-1PhWM6qLowbAPm8N0iPyq+88+2=SunCdAY07fe1g@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] riscv: errata: prefix T-Head mnemonics with th.
To: Jisheng Zhang <jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_031855_820027_CFE607C6 
X-CRM114-Status: GOOD (  16.05  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gU3VuLCBBdWcgMjcsIDIwMjMgYXQgNToyMOKAr0FNIEppc2hlbmcgWmhhbmcgPGpzemhhbmdA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBJY2Vub3d5IFpoZW5nIDx1d3VAaWNlbm93eS5t
ZT4KPgo+IFQtSGVhZCBub3cgbWFpbnRhaW5zIHNvbWUgc3BlY2lmaWNhdGlvbiBmb3IgdGhlaXIg
ZXh0ZW5kZWQgaW5zdHJ1Y3Rpb25zCj4gYXQgWzFdLCBpbiB3aGljaCBhbGwgaW5zdHJ1Y3Rpb25z
IGFyZSBwcmVmaXhlZCAidGguIi4KPgo+IEZvbGxvdyB0aGlzIHByYWN0aWNlIGluIHRoZSBrZXJu
ZWwgY29tbWVudHMuCj4KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvdGhl
YWQtZXh0ZW5zaW9uLXNwZWMgWzFdCj4gU2lnbmVkLW9mZi1ieTogSWNlbm93eSBaaGVuZyA8dXd1
QGljZW5vd3kubWU+Cj4gLS0tCj4gIGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vZXJyYXRhX2xpc3Qu
aCB8IDE0ICsrKysrKystLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
cnJhdGFfbGlzdC5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gaW5k
ZXggZmVhYjMzNGRkODMyLi45OGVjYWIwNTNkZDIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9p
bmNsdWRlL2FzbS9lcnJhdGFfbGlzdC5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9l
cnJhdGFfbGlzdC5oCj4gQEAgLTkwLDI1ICs5MCwyNSBAQCBhc20gdm9sYXRpbGUoQUxURVJOQVRJ
VkUoICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiAgI2VuZGlm
Cj4KPiAgLyoKPiAtICogZGNhY2hlLmlwYSByczEgKGludmFsaWRhdGUsIHBoeXNpY2FsIGFkZHJl
c3MpCj4gKyAqIHRoLmRjYWNoZS5pcGEgcnMxIChpbnZhbGlkYXRlLCBwaHlzaWNhbCBhZGRyZXNz
KQo+ICAgKiB8IDMxIC0gMjUgfCAyNCAtIDIwIHwgMTkgLSAxNSB8IDE0IC0gMTIgfCAxMSAtIDcg
fCA2IC0gMCB8Cj4gICAqICAgMDAwMDAwMSAgICAwMTAxMCAgICAgIHJzMSAgICAgICAwMDAgICAg
ICAwMDAwMCAgMDAwMTAxMQo+IC0gKiBkYWNoZS5pdmEgcnMxIChpbnZhbGlkYSwgdmlydHVhbCBh
ZGRyZXNzKQo+ICsgKiB0aC5kYWNoZS5pdmEgcnMxIChpbnZhbGlkYSwgdmlydHVhbCBhZGRyZXNz
KQo+ICAgKiAgIDAwMDAwMDEgICAgMDAxMTAgICAgICByczEgICAgICAgMDAwICAgICAgMDAwMDAg
IDAwMDEwMTEKPiAgICoKPiAtICogZGNhY2hlLmNwYSByczEgKGNsZWFuLCBwaHlzaWNhbCBhZGRy
ZXNzKQo+ICsgKiB0aC5kY2FjaGUuY3BhIHJzMSAoY2xlYW4sIHBoeXNpY2FsIGFkZHJlc3MpCj4g
ICAqIHwgMzEgLSAyNSB8IDI0IC0gMjAgfCAxOSAtIDE1IHwgMTQgLSAxMiB8IDExIC0gNyB8IDYg
LSAwIHwKPiAgICogICAwMDAwMDAxICAgIDAxMDAxICAgICAgcnMxICAgICAgIDAwMCAgICAgIDAw
MDAwICAwMDAxMDExCj4gLSAqIGRjYWNoZS5jdmEgcnMxIChjbGVhbiwgdmlydHVhbCBhZGRyZXNz
KQo+ICsgKiB0aC5kY2FjaGUuY3ZhIHJzMSAoY2xlYW4sIHZpcnR1YWwgYWRkcmVzcykKPiAgICog
ICAwMDAwMDAxICAgIDAwMTAxICAgICAgcnMxICAgICAgIDAwMCAgICAgIDAwMDAwICAwMDAxMDEx
Cj4gICAqCj4gLSAqIGRjYWNoZS5jaXBhIHJzMSAoY2xlYW4gdGhlbiBpbnZhbGlkYXRlLCBwaHlz
aWNhbCBhZGRyZXNzKQo+ICsgKiB0aC5kY2FjaGUuY2lwYSByczEgKGNsZWFuIHRoZW4gaW52YWxp
ZGF0ZSwgcGh5c2ljYWwgYWRkcmVzcykKPiAgICogfCAzMSAtIDI1IHwgMjQgLSAyMCB8IDE5IC0g
MTUgfCAxNCAtIDEyIHwgMTEgLSA3IHwgNiAtIDAgfAo+ICAgKiAgIDAwMDAwMDEgICAgMDEwMTEg
ICAgICByczEgICAgICAgMDAwICAgICAgMDAwMDAgIDAwMDEwMTEKPiAtICogZGNhY2hlLmNpdmEg
cnMxICguLi4gdmlydHVhbCBhZGRyZXNzKQo+ICsgKiB0aC5kY2FjaGUuY2l2YSByczEgKC4uLiB2
aXJ0dWFsIGFkZHJlc3MpCj4gICAqICAgMDAwMDAwMSAgICAwMDExMSAgICAgIHJzMSAgICAgICAw
MDAgICAgICAwMDAwMCAgMDAwMTAxMQo+ICAgKgo+IC0gKiBzeW5jLnMgKG1ha2Ugc3VyZSBhbGwg
Y2FjaGUgb3BlcmF0aW9ucyBmaW5pc2hlZCkKPiArICogdGguc3luYy5zIChtYWtlIHN1cmUgYWxs
IGNhY2hlIG9wZXJhdGlvbnMgZmluaXNoZWQpClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KCj4gICAqIHwgMzEgLSAyNSB8IDI0IC0gMjAgfCAxOSAtIDE1IHwgMTQgLSAx
MiB8IDExIC0gNyB8IDYgLSAwIHwKPiAgICogICAwMDAwMDAwICAgIDExMDAxICAgICAwMDAwMCAg
ICAgIDAwMCAgICAgIDAwMDAwICAwMDAxMDExCj4gICAqLwo+IC0tCj4gMi40MC4xCj4KCgotLQpC
ZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
