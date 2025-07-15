Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E64BBC83F22
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlTkXhGLdeXmNX1ajJI7o7tHaQXPlBBp9TAum5nJzX0=; b=MUzD69xervKbqB
	cQKgafFQCfZmrV04rvqR1ILctiRZsls5jU6oKg/2ZD2P02K79ViaujQsVsG/sSlweKPdjycyTaMFj
	UTzqWvD8DmvmScDuaqidRTPeH0xxVaSRszxj72VWjbrk5Lpc1M5E4ZS8vnYV0O/g0z1edz8748KFL
	t3FbyBfaxbfPe+NrSGZXiaohBRCgX9qgnYIZqgBbRO2sunQNwEZbqyqh8xSYXALM/Ybt37lnWSJOb
	At8SHYRa8BILBJAFEJKAJjmxF47/kWpEZrRjvbdI6zzce7EOmMKBYQ/cb6h47JTDWSrLh9UZjRcDS
	kp9RAF+35boV8qQFVF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBs-0000000628d-3lLr;
	Tue, 15 Jul 2025 19:19:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjgz-00000005qWc-2cTw
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 17:43:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0590546A71
	for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 17:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF300C4CEF9
	for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 17:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752601428;
	bh=54VsIhKZIv/mNC4NrTI9DMJ7xO/jEt3cjbBcWJjARgg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=cJ/tFzTRQvVmZe4bXDNiYPtuqt/7L/tJESoX0k/L6gt+FYeldUsQj+/4OgvhhudJ2
	 a3Gz8r8S//vHl2Rawg9VD8KL8fop2h6lLT4IkLRJaTWynA3bf14gmE46MSUNREkv/Z
	 kySwX/bMmaD2nntB3vVVp7T7NXIFxYzX8QDI7+UkV3zHSCMx4vsffdRWwhH10dwQkQ
	 RC2u5GYUUG593bC6qBFvUpVlKnjLoxKVDZkjau1bWsDeFDybD96JFHHFCD/G9MJibh
	 HxSkK7BltDpfwwtZOmXvhpxm/Ay6oywwTMZw+61Pe3Yxr4rV9y+kQlMcwr2JYiD32R
	 XOPAPeaXMLe3w==
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ae0c4945c76so924344166b.3
        for <linux-riscv@lists.infradead.org>; Tue, 15 Jul 2025 10:43:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVY8OmvssQ2wJZB3dnvXQSPs+nR5no927HBsZzP4HkRsEs7tE6ZPSmD/So0so0dv4/W9HSylJsdwa7CfA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzB5/rLWQWUCoU6408bes7SCCx5aAWyS1jBs3v3yxh/aPSmAqAh
	FoUMMmTVZizX6rEHrKNy2oEzMa1e7QLkuY6vlVMmviJwzSiTViGXGqk8xE5XvcvF0Qon/ArbrMN
	2+JIdiUmxUj+vGAD0qWVL6WTmryIDYA==
X-Google-Smtp-Source: AGHT+IFSfJ329hc32n6pv+14gS0mt5gTgoFqsqGbemfhsisnZDnXEaldUJ2gRxLUkvPg+1tT8vixRzdxTK8k0xV9biU=
X-Received: by 2002:a17:906:730f:b0:ad8:9466:3348 with SMTP id
 a640c23a62f3a-ae9c9b0ce31mr42139766b.36.1752601427144; Tue, 15 Jul 2025
 10:43:47 -0700 (PDT)
MIME-Version: 1.0
References: <20250703021600.125550-1-inochiama@gmail.com> <20250703021600.125550-3-inochiama@gmail.com>
In-Reply-To: <20250703021600.125550-3-inochiama@gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 15 Jul 2025 12:43:35 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLKLKHj+vQJmZnaXRj3TmqR3ELjpBc27HRbTOOP9FD0hg@mail.gmail.com>
X-Gm-Features: Ac12FXz_neDQRbYET5mV11I82g2lSNlhGKsWNEzC8k-2DtgP7jZ-KwLmxIiQkME
Message-ID: <CAL_JsqLKLKHj+vQJmZnaXRj3TmqR3ELjpBc27HRbTOOP9FD0hg@mail.gmail.com>
Subject: Re: [PATCH 2/3] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Chen Wang <unicorn_wang@outlook.com>, Richard Cochran <richardcochran@gmail.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Yixun Lan <dlan@gentoo.org>, 
	Ze Huang <huangze@whut.edu.cn>, Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	Longbin Li <looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_104349_703691_5C9B0714 
X-CRM114-Status: GOOD (  13.45  )
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

T24gV2VkLCBKdWwgMiwgMjAyNSBhdCA5OjE24oCvUE0gSW5vY2hpIEFtYW90byA8aW5vY2hpYW1h
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgRFQgZGV2aWNlIG5vZGUgb2YgbWRpbyBtdWx0aXBs
ZXhlciBkZXZpY2UgZm9yIGN2MTh4eCBTb0MuCgpUaGlzIGFkZHMgYSBkdGJzX2NoZWNrIHdhcm5p
bmc6CgptZGlvQDMwMDk4MDAgKG1kaW8tbXV4LW1taW9yZWcpOiBtZGlvQDgwOnJlZzowOjA6IDEy
OCBpcyBncmVhdGVyIHRoYW4KdGhlIG1heGltdW0gb2YgMzEKCj4KPiBTaWduZWQtb2ZmLWJ5OiBJ
bm9jaGkgQW1hb3RvIDxpbm9jaGlhbWFAZ21haWwuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2Jv
b3QvZHRzL3NvcGhnby9jdjE4MHguZHRzaSB8IDI5ICsrKysrKysrKysrKysrKysrKysrKysrKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAyOSBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3NvcGhnby9jdjE4MHguZHRzaQo+IGluZGV4IDdlZWNjNjdmODk2ZS4uM2E4MmNjNDBlYTFhIDEw
MDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc29waGdvL2N2MTgweC5kdHNpCj4gKysr
IGIvYXJjaC9yaXNjdi9ib290L2R0cy9zb3BoZ28vY3YxODB4LmR0c2kKPiBAQCAtMzEsNiArMzEs
MzMgQEAgcnN0OiByZXNldC1jb250cm9sbGVyQDMwMDMwMDAgewo+ICAgICAgICAgICAgICAgICAg
ICAgICAgICNyZXNldC1jZWxscyA9IDwxPjsKPiAgICAgICAgICAgICAgICAgfTsKPgo+ICsgICAg
ICAgICAgICAgICBtZGlvOiBtZGlvQDMwMDk4MDAgewoKVGhlIG5vZGVuYW1lIGlzIHdyb25nIGhl
cmUgYmVjYXVzZSB0aGlzIGlzIG5vdCBhbiBNRElPIGJ1cy4gSXQgaXMgYQptdXguIFNvICJtZGlv
LW11eEAuLi4iIGZvciB0aGUgbm9kZSBuYW1lLgoKPiArICAgICAgICAgICAgICAgICAgICAgICBj
b21wYXRpYmxlID0gIm1kaW8tbXV4LW1taW9yZWciLCAibWRpby1tdXgiOwo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHJlZyA9IDwweDMwMDk4MDAgMHg0PjsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAjc2l6
ZS1jZWxscyA9IDwwPjsKPiArICAgICAgICAgICAgICAgICAgICAgICBtZGlvLXBhcmVudC1idXMg
PSA8JmdtYWMwX21kaW8+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIG11eC1tYXNrID0gPDB4
ODA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwo+
ICsgICAgICAgICAgICAgICAgICAgICAgIGludGVybmFsX21kaW86IG1kaW9AMCB7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxscyA9IDwxPjsKPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDA+Owo+ICsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGludGVybmFsX2VwaHk6IHBoeUAwIHsKPiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJldGhlcm5ldC1waHktaWVlZTgwMi4z
LWMyMiI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwx
PjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgfTsKPiArCj4gKyAgICAgICAgICAgICAgICAgICAgICAgZXh0ZXJuYWxfbWRpbzog
bWRpb0A4MCB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAjYWRkcmVzcy1jZWxs
cyA9IDwxPjsKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0g
PDA+Owo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmVnID0gPDB4ODA+Owo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIH07Cj4gKyAgICAgICAgICAgICAgIH07Cj4gKwo+ICAgICAg
ICAgICAgICAgICBncGlvMDogZ3Bpb0AzMDIwMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAg
ICBjb21wYXRpYmxlID0gInNucHMsZHctYXBiLWdwaW8iOwo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHJlZyA9IDwweDMwMjAwMDAgMHgxMDAwPjsKPiBAQCAtMTk2LDYgKzIyMyw4IEBAIGdtYWMw
OiBldGhlcm5ldEA0MDcwMDAwIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjbG9jay1uYW1l
cyA9ICJzdG1tYWNldGgiLCAicHRwX3JlZiI7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgaW50
ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9JUlEoMTUpIElSUV9UWVBFX0xFVkVMX0hJR0g+Owo+
ICAgICAgICAgICAgICAgICAgICAgICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiOwo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHBoeS1oYW5kbGUgPSA8JmludGVybmFsX2VwaHk+Owo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIHBoeS1tb2RlID0gImludGVybmFsIjsKPiAgICAgICAgICAg
ICAgICAgICAgICAgICByZXNldHMgPSA8JnJzdCBSU1RfRVRIMD47Cj4gICAgICAgICAgICAgICAg
ICAgICAgICAgcmVzZXQtbmFtZXMgPSAic3RtbWFjZXRoIjsKPiAgICAgICAgICAgICAgICAgICAg
ICAgICByeC1maWZvLWRlcHRoID0gPDgxOTI+Owo+IC0tCj4gMi41MC4wCj4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
