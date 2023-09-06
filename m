Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 746FACCF9E9
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Sep 2023 00:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LoQkv5SpxuZt3rMpe3Y6uHVxQpTMoje5wa03hD4LkBg=; b=a0agKDIawZdUWf
	h0ll0bow2tX0GxZl0ah0kRDW1/ravN7+DbQ5+bpP23LINNW8pRDsBVUjngaLKc1KyldH2FY/z6ADS
	c6eoBlQ88+WtNNghF4scATMDkiJgtcZ/Orefd/iF8aWfE39iE+EtaNSodtCqgf6Qg7H74MgG/kqsH
	mnRF292oNwNeZkYLcG4c6ipJveqYhWmA3ZQZkZseDbtT5GDCWiFEBH/9yiM0EaERWywz7mUrKFgDZ
	uLetgxrNqkTquXW11kHNuyl8f+8ZuGDcDpDC3WQKSTF/f2h0hxAd+LA2iEAqCuoGTi0yqRs264Lq5
	DjAbND2JzeJi7eP7Wp3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdglH-006ydq-0j;
	Wed, 06 Sep 2023 00:51:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdglD-006yct-1X;
	Wed, 06 Sep 2023 00:51:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id D7168B8181F;
	Wed,  6 Sep 2023 00:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92A3BC433C7;
	Wed,  6 Sep 2023 00:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1693961467;
	bh=LOkOYWgDpfMaKM7j4I5vUi6HfzRf1uXiYn5Gp+JhJpQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=L9WwUkhZH0udrang5lEoCi0RceXC8fGySw+ca+m9zeW98RbDllgO7iupNjB2o0B5B
	 aGiwGYr19AKbj/4TGCg9+HFGYnibln30VNAPU211UHAMwH0SOW+DkP7xTcVgWyOBpw
	 G585HAPi49WnN5OpHHFwEPxhSKclHdWMyuCmPG3WTxUrE4ZtnqbXsctIjWK/zuZwjv
	 M8M2eS7fOal4CftuhgWiR0hT9J/jWXPxnuhoQ9ltVNxaaZJJAtN7wF9OdzLaPBog23
	 5afycDar+wrubbKbG8Lk1GJCCvgVpoR0rGTYP/7RpCLST5W5uoudZPucw5CTPkP1+B
	 FyvZf4Tp1iH7Q==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5280ef23593so4077964a12.3;
        Tue, 05 Sep 2023 17:51:07 -0700 (PDT)
X-Gm-Message-State: AOJu0YwKN62zJxFgdG7Rz4cLGtnIFM+l4bpAbHZcVcpPMltepxeqOwmL
	cGYSlYbb9Nqs8BJtBrwMXeemb2uJO6dJ6YbMiJs=
X-Google-Smtp-Source: AGHT+IElTkbYyZUPYQR5VBzmrBOK5ldKYAEDs8YsLwAGbLGs88zIULj6n77vYmOOI8MWwsoyk9I/bmDTQ6RDTZ1WQsI=
X-Received: by 2002:aa7:d843:0:b0:51e:ed6:df38 with SMTP id
 f3-20020aa7d843000000b0051e0ed6df38mr950573eds.13.1693961465837; Tue, 05 Sep
 2023 17:51:05 -0700 (PDT)
MIME-Version: 1.0
References: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
In-Reply-To: <IA1PR20MB49534918FCA69399CE2E0C53BBE0A@IA1PR20MB4953.namprd20.prod.outlook.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 6 Sep 2023 08:50:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRTwk6P+PnJcyQKVKADOAjHGmFxkS=axqg58hWvyu=wwA@mail.gmail.com>
Message-ID: <CAJF2gTRTwk6P+PnJcyQKVKADOAjHGmFxkS=axqg58hWvyu=wwA@mail.gmail.com>
Subject: Re: [PATCH v4] riscv: dts: allwinner: d1: Add PMU event node
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Stuebner <heiko@sntech.de>, Wei Fu <wefu@redhat.com>, Pei Chen <cp0613@linux.alibaba.com>, 
	Wenhan Chen <chenwenhan.cwh@alibaba-inc.com>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_175111_845043_1C749D47 
X-CRM114-Status: GOOD (  21.85  )
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

T24gTW9uLCBBdWcgMjgsIDIwMjMgYXQgMTI6MjnigK9QTSBJbm9jaGkgQW1hb3RvIDxpbm9jaGlh
bWFAb3V0bG9vay5jb20+IHdyb3RlOgo+Cj4gRDEgaGFzIHNldmVyYWwgcG11IGV2ZW50cyBzdXBw
b3J0ZWQgYnkgb3BlbnNiaS4KPiBUaGVzZSBldmVudHMgY2FuIGJlIHVzZWQgYnkgcGVyZiBmb3Ig
cHJvZmlsaW5nLgo+Cj4gU2lnbmVkLW9mZi1ieTogSW5vY2hpIEFtYW90byA8aW5vY2hpYW1hQG91
dGxvb2suY29tPgo+IExpbms6IGh0dHBzOi8vZGwubGludXgtc3VueGkub3JnL0QxL1h1YW50aWVf
QzkwNl9SMVMwX1VzZXJfTWFudWFsLnBkZgo+IExpbms6IGh0dHBzOi8vZ2l0aHViLmNvbS9ULWhl
YWQtU2VtaS9vcGVuYzkwNi9ibG9iL21haW4vQzkwNl9SVExfRkFDVE9SWS9nZW5fcnRsL3BtdS9y
dGwvYXFfaHBjcF90b3AudiNMNjU3Cj4gLS0tCj4gY2hhbmdlZCBmcm9tIHYzOgo+IDEuIHJlbW92
ZSB3cm9uZyBldmVudCBtYXBwaW5nIG9mIDB4MDAwMGEKPiAyLiBhZGQgcmVmZXJlbmNlIHVybCBv
ZiBjOTA2IGV2ZW50cyBpbXBsZW1lbnRhdGlvbiAoRDEgb25seSBzdXBwb3J0IGV2ZW50cwo+IGRl
c2NyaWJlZCBpbiBSMVMwIHVzZXIgbWFudWFsLCBidXQgZXZlbnQgbWFwcGluZyBpcyB0aGUgc2Ft
ZSkKPgo+IGNoYW5nZWQgZnJvbSB2MjoKPiAxLiBtb3ZlIHBtdSBub2RlIGZyb20gL3NvYyB0byAv
IHRvIGF2b2lkIHdhcm5pbmdzIHdoZW4gY2hlY2tpbmcuCj4KPiBUaGUgbWVhbmluZyBvZiBULUhF
QUQgZXZlbnRzIGNhbiBiZSBmb3VuZCBpbiB0aGlzIHBlbmRpbmcgcGF0Y2g6Cj4gaHR0cHM6Ly9s
b3JlLmtlcm5lbC5vcmcvbGludXgtcGVyZi11c2Vycy9JQTFQUjIwTUI0OTUzREQ4MkQwMTE2RUMy
OTFDMjE3NzdCQkUyQUBJQTFQUjIwTUI0OTUzLm5hbXByZDIwLnByb2Qub3V0bG9vay5jb20KPgo+
IFRoZSBwYXRjaCBhYm92ZSBhbHNvIHByb3ZpZGVzIGEgZXhhbXBsZSB0aGF0IHNob3dzIGhvdyB0
byBzZXR1cAo+IGVudmlyb25tZW50IGFuZCB1c2UgcGVyZiB3aXRoIFQtSEVBRCBldmVudHMuCj4g
LS0tCj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bjIwaS1kMXMuZHRzaSB8IDM5
ICsrKysrKysrKysrKysrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKykK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFz
LmR0c2kgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPiBp
bmRleCA4Mjc1NjMwYWY5NzcuLjUzYTk4NGQ3OGUzZiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jv
b3QvZHRzL2FsbHdpbm5lci9zdW4yMGktZDFzLmR0c2kKPiBAQCAtNzMsNCArNzMsNDMgQEAgcGxp
YzogaW50ZXJydXB0LWNvbnRyb2xsZXJAMTAwMDAwMDAgewo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICNpbnRlcnJ1cHQtY2VsbHMgPSA8Mj47Cj4gICAgICAgICAgICAgICAgIH07Cj4gICAgICAg
ICB9Owo+ICsKPiArICAgICAgIHBtdSB7Cj4gKyAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAi
cmlzY3YscG11IjsKPiArICAgICAgICAgICAgICAgcmlzY3YsZXZlbnQtdG8tbWhwbWNvdW50ZXJz
ID0KPiArICAgICAgICAgICAgICAgICAgICAgICA8MHgwMDAwMyAweDAwMDAzIDB4MDAwMDAwMDg+
LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDA0IDB4MDAwMDQgMHgwMDAwMDAxMD4s
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgPDB4MDAwMDUgMHgwMDAwNSAweDAwMDAwMjAwPiwK
PiArICAgICAgICAgICAgICAgICAgICAgICA8MHgwMDAwNiAweDAwMDA2IDB4MDAwMDAxMDA+LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDEwMDAwIDB4MTAwMDAgMHgwMDAwNDAwMD4sCj4g
KyAgICAgICAgICAgICAgICAgICAgICAgPDB4MTAwMDEgMHgxMDAwMSAweDAwMDA4MDAwPiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICA8MHgxMDAwMiAweDEwMDAyIDB4MDAwMTAwMDA+LAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIDwweDEwMDAzIDB4MTAwMDMgMHgwMDAyMDAwMD4sCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgPDB4MTAwMTkgMHgxMDAxOSAweDAwMDAwMDQwPiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICA8MHgxMDAyMSAweDEwMDIxIDB4MDAwMDAwMjA+Owo+ICsgICAg
ICAgICAgICAgICByaXNjdixldmVudC10by1taHBtZXZlbnQgPQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIDwweDAwMDAzIDB4MDAwMDAwMDAgMHgwMDAwMDAwMT4sCj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgPDB4MDAwMDQgMHgwMDAwMDAwMCAweDAwMDAwMDAyPiwKPiArICAgICAgICAgICAg
ICAgICAgICAgICA8MHgwMDAwNSAweDAwMDAwMDAwIDB4MDAwMDAwMDc+LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIDwweDAwMDA2IDB4MDAwMDAwMDAgMHgwMDAwMDAwNj4sCj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgPDB4MTAwMDAgMHgwMDAwMDAwMCAweDAwMDAwMDBjPiwKPiArICAgICAg
ICAgICAgICAgICAgICAgICA8MHgxMDAwMSAweDAwMDAwMDAwIDB4MDAwMDAwMGQ+LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIDwweDEwMDAyIDB4MDAwMDAwMDAgMHgwMDAwMDAwZT4sCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgPDB4MTAwMDMgMHgwMDAwMDAwMCAweDAwMDAwMDBmPiwKPiAr
ICAgICAgICAgICAgICAgICAgICAgICA8MHgxMDAxOSAweDAwMDAwMDAwIDB4MDAwMDAwMDQ+LAo+
ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDEwMDIxIDB4MDAwMDAwMDAgMHgwMDAwMDAwMz47
Cj4gKyAgICAgICAgICAgICAgIHJpc2N2LHJhdy1ldmVudC10by1taHBtY291bnRlcnMgPQo+ICsg
ICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMDEgMHhmZmZmZmZmZiAw
eGZmZmZmZmZmIDB4MDAwMDAwMDg+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAw
MDAwIDB4MDAwMDAwMDIgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMDAwMTA+LAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMDMgMHhmZmZmZmZmZiAweGZm
ZmZmZmZmIDB4MDAwMDAwMjA+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAw
IDB4MDAwMDAwMDQgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMDAwNDA+LAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMDUgMHhmZmZmZmZmZiAweGZmZmZm
ZmZmIDB4MDAwMDAwODA+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4
MDAwMDAwMDYgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMDAxMDA+LAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMDcgMHhmZmZmZmZmZiAweGZmZmZmZmZm
IDB4MDAwMDAyMDA+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAw
MDAwMGIgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMDIwMDA+LAo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMGMgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4
MDAwMDQwMDA+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAw
MGQgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMDgwMDA+LAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMGUgMHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAw
MTAwMDA+LAo+ICsgICAgICAgICAgICAgICAgICAgICAgIDwweDAwMDAwMDAwIDB4MDAwMDAwMGYg
MHhmZmZmZmZmZiAweGZmZmZmZmZmIDB4MDAwMjAwMDA+Owo+ICsgICAgICAgfTsKPiAgfTsKPiAt
LQo+IDIuNDIuMAo+ClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0t
IApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0
cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGlu
Zm8vbGludXgtcmlzY3YK
