Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BD10C001B0
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 21:11:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=52b3TMZSBv32WCgrWWMXesrCkLdRF5M2FPWOt3K/Mw8=; b=z7TkOdUBDhLZta
	YSadYWkuFw0MuE91PaQiUTm8RwdVU/fzJQWHrPvu26R/txGRWz1kUbwHMBJqUAHB+bWqx7K1/SnZW
	eNEwAc52QH0maMVN3vHyHxCAIUhJJs2O3gEkDWKQxD17LKxM2yufRG9sBCt2/ajQZ/fa2KMO3on5G
	Zel+yVuekgGmyoAwWXDodnUTWjGZQQ9V6p6MuZeVWv8oNR2//jZRKpiHZzSMFrvgMX5mqpLy0rT/A
	yCkeDvId9WxD/tP6O5FaqzpgEYWWakw7//9T+94bAyJFBr/b+lBUMtnv4iNVMfwV4f6dy3BUmqrD4
	LZozOgoa7JqmkokCDCig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQow-00BRpy-18;
	Mon, 03 Jul 2023 21:10:54 +0000
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGQot-00BRp4-0G
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 21:10:52 +0000
Received: by mail-io1-xd2c.google.com with SMTP id ca18e2360f4ac-78372b896d0so191962839f.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 14:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688418648; x=1691010648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzVkmEgU5WzK/Ygg1Ob57YCyS+9xMsLU8cmnnEEo+/M=;
        b=ggNSk/H1Gu+SWvUTcFKzi52A/Nuq5OjwcnWpXPbpm5zYS5lRO/GqinQIi6LRvFf5js
         9Ngg0qC9cVjdZcSTmjXDHFeUIRkRBls9EEhikCDCOxNawCsO8WILiqeW5+JB58sDyB69
         29LRRFms3nDEznT2wR6Zf6+jhz3o8/NAV1fnTnUP1aWW53+ZLN0abqkjojIHkP+CEOGw
         Ofe3cRV0hk0KI1mZrS2cIrcU4qQjvD3lLI+oahSb4kVllxLodasgApQgSGNK7iHTwW8i
         jJ1q3whXmgGphg/X6maRg+ZWZSWrDnijv2tJCTeyhSnK3xJQQ1PvBM97VTBWWBNDuU57
         x//A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688418648; x=1691010648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzVkmEgU5WzK/Ygg1Ob57YCyS+9xMsLU8cmnnEEo+/M=;
        b=G/0eKh0FvXYaZ5A+mXlk83S6U9pGvtHh1FcO0+M8gTVes3CwUpik7qtzT0b/s+ubS5
         CfjQ7L/BdyzpJyUeZzUoRZcZT1zGSgkegMGg/Q27514N8cwrtOzfqbgABhPjf/KEWp8y
         PeX62PS9dWLBc8fidbZ4nzyK7q6O3fNkwjBNdGO7PmznzlsOnQb+xNQ2Ui7jwprAx/Af
         ZZ9KbtTCp7yWV5IPqfTmmBCNHx8kGcU2kPXzWkuNu6qH1HYnpTjYc6VsKxLvvTJjrBZf
         GDD6RVDoYPlLYOjAtpyMsGM0RDNMgxrxvB5eA5la3yPzXmzPSCIsFFhjoxNVajwSNKMO
         2+QA==
X-Gm-Message-State: AC+VfDyLJ54fj6lCeCBwg6W8+ZzUW5P1W4bVwClEdi1X4hxy5/QHJRkd
	UCNjX3g6iWO8hi0CfbM/p28SipXcGTLmVv/37t0=
X-Google-Smtp-Source: ACHHUZ6FkDf1mZszo/F/op4b4PfzyWqxR/zwCVmySCW6VP4GNg/zqvWZRGF5OdMpO5oqXZ9qEIDoJKf1z4mgA7m5tJE=
X-Received: by 2002:a6b:f10d:0:b0:783:727b:7073 with SMTP id
 e13-20020a6bf10d000000b00783727b7073mr11630255iog.20.1688418648099; Mon, 03
 Jul 2023 14:10:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <OS0PR01MB592217C4028606B67B39C6858629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
 <CA+V-a8sXcHP2AYYLLONLLBDVctMb=fnU=D4+6hNoHGx5Dk2O3Q@mail.gmail.com> <OS0PR01MB592285AB361A6C25CEDC21F68629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592285AB361A6C25CEDC21F68629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Jul 2023 22:10:21 +0100
Message-ID: <CA+V-a8tkZ8vbMPqReQ+CixQgHZWBXxzmNdjv1EL9skgaf+Mmvw@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_141051_145256_5F5E9D38 
X-CRM114-Status: GOOD (  33.22  )
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

SGkgQmlqdSwKCk9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgMzoxM+KAr1BNIEJpanUgRGFzIDxiaWp1
LmRhcy5qekBicC5yZW5lc2FzLmNvbT4gd3JvdGU6Cj4KPiBIaSBQcmFiaGFrYXIsCj4KPiA+IC0t
LS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBMYWQsIFByYWJoYWthciA8cHJhYmhh
a2FyLmNzZW5nZ0BnbWFpbC5jb20+Cj4gPiBTZW50OiBNb25kYXksIEp1bHkgMywgMjAyMyAxOjQz
IFBNCj4gPiBUbzogQmlqdSBEYXMgPGJpanUuZGFzLmp6QGJwLnJlbmVzYXMuY29tPgo+ID4gQ2M6
IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+OyBNYWdudXMgRGFt
bQo+ID4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT47IFJvYiBIZXJyaW5nIDxyb2JoK2R0QGtlcm5l
bC5vcmc+OyBLcnp5c3p0b2YKPiA+IEtvemxvd3NraSA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBs
aW5hcm8ub3JnPjsgTGludXMgV2FsbGVpago+ID4gPGxpbnVzLndhbGxlaWpAbGluYXJvLm9yZz47
IGxpbnV4LXJlbmVzYXMtc29jQHZnZXIua2VybmVsLm9yZzsKPiA+IGRldmljZXRyZWVAdmdlci5r
ZXJuZWwub3JnOyBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnOyBsaW51eC0KPiA+IGtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBQcmFiaGFr
YXIgTWFoYWRldgo+ID4gTGFkIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5j
b20+Cj4gPiBTdWJqZWN0OiBSZTogW1JGQyBQQVRDSCAxLzRdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6
ZzJsOiBJbmNsdWRlIHBpbm1hcCBpbgo+ID4gUlpHMkxfR1BJT19QT1JUX1BBQ0soKSBtYWNybwo+
ID4KPiA+IEhpIEJpanUsCj4gPgo+ID4gVGhhbmsgeW91IGZvciB0aGUgcmV2aWV3Lgo+ID4KPiA+
IE9uIE1vbiwgSnVsIDMsIDIwMjMgYXQgMTI6NDLigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpA
YnAucmVuZXNhcy5jb20+Cj4gPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgUHJhYmhha2FyLAo+ID4g
Pgo+ID4gPiBUaGFua3MgZm9yIHRoZSBwYXRjaC4KPiA+ID4KPiA+ID4gPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQo+ID4gPiA+IEZyb206IFByYWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0Bn
bWFpbC5jb20+Cj4gPiA+ID4gU2VudDogRnJpZGF5LCBKdW5lIDMwLCAyMDIzIDE6MDUgUE0KPiA+
ID4gPiBUbzogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydCtyZW5lc2FzQGdsaWRlci5iZT47IE1h
Z251cyBEYW1tCj4gPiA+ID4gPG1hZ251cy5kYW1tQGdtYWlsLmNvbT4KPiA+ID4gPiBDYzogUm9i
IEhlcnJpbmcgPHJvYmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kKPiA+ID4g
PiA8a3J6eXN6dG9mLmtvemxvd3NraStkdEBsaW5hcm8ub3JnPjsgTGludXMgV2FsbGVpago+ID4g
PiA+IDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+OyBsaW51eC1yZW5lc2FzLXNvY0B2Z2VyLmtl
cm5lbC5vcmc7Cj4gPiA+ID4gZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxpbnV4LQo+ID4gPiA+IGtlcm5lbEB2Z2VyLmtlcm5lbC5v
cmc7IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOyBCaWp1IERhcwo+ID4gPiA+IDxiaWp1LmRh
cy5qekBicC5yZW5lc2FzLmNvbT47IFByYWJoYWthcgo+ID4gPiA+IDxwcmFiaGFrYXIuY3Nlbmdn
QGdtYWlsLmNvbT47IFByYWJoYWthciBNYWhhZGV2IExhZAo+ID4gPiA+IDxwcmFiaGFrYXIubWFo
YWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4gPiA+ID4gU3ViamVjdDogW1JGQyBQQVRDSCAx
LzRdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBJbmNsdWRlIHBpbm1hcCBpbgo+ID4gPiA+IFJa
RzJMX0dQSU9fUE9SVF9QQUNLKCkgbWFjcm8KPiA+ID4gPgo+ID4gPiA+IEZyb206IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gPgo+
ID4gPiA+IEN1cnJlbnRseSB3ZSBhc3N1bWUgYWxsIHRoZSBwb3J0IHBpbnMgYXJlIHNlcXVlbnRp
YWwgaWUgYWx3YXlzIFBYXzAKPiA+ID4gPiB0byBQWF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24g
UlovRml2ZSBTb0Mgd2UgaGF2ZSBhZGRpdGlvbmFsIHBpbnMKPiA+ID4gPiBQMTlfMSB0bwo+ID4g
PiA+IFAyOF81IHdoaWNoIGhhdmUgaG9sZXMgaW4gdGhlbSwgZm9yIGV4YW1wbGUgb25seSBvbmUg
cGluIG9uIHBvcnQxOQo+ID4gPiA+IGlzIGF2YWlsYWJsZSBhbmQgdGhhdCBpcyBQMTlfMSBhbmQg
bm90IFAxOV8wLgo+ID4gPiA+Cj4gPiA+ID4gU28gdG8gaGFuZGxlIHN1Y2ggY2FzZXMgaW5jbHVk
ZSBwaW5tYXAgZm9yIGVhY2ggcG9ydCB3aGljaCB3b3VsZAo+ID4gPiA+IGluZGljYXRlIHRoZSBw
aW4gYXZhaWxhYmlsaXR5IG9uIGVhY2ggcG9ydC4gV2l0aCB0aGlzIHdlIGFsc28gZ2V0Cj4gPiA+
ID4gYWRkaXRpb25hbCBwaW4gdmFsaWRhdGlvbiwgZm9yIGV4YW1wbGUgb24gdGhlIFJaL0cyTCBT
T0MgUDAgaGFzIHR3bwo+ID4gPiA+IHBpbnMKPiA+ID4gPiBQMF8xIGFuZCBQMF8wIGJ1dCB3aXRo
IERUL1NZU0ZTIGNvdWxkIHVzZSB0aGUgUDBfMi1QMF83Lgo+ID4gPiA+Cj4gPiA+ID4gV2hpbGUg
YXQgaXQsIHVwZGF0ZSByemcybF92YWxpZGF0ZV9ncGlvX3BpbigpIHRvIHVzZSB0aGUgcG9ydCBw
aW5tYXAKPiA+ID4gPiB0byB2YWxpZGF0ZSB0aGUgZ3BpbyBwaW4uCj4gPiA+ID4KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBMYWQgUHJhYmhha2FyCj4gPiA+ID4gPHByYWJoYWthci5tYWhhZGV2LWxh
ZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+ID4gPiAtLS0KPiA+ID4gPiAgZHJpdmVycy9waW5jdHJs
L3JlbmVzYXMvcGluY3RybC1yemcybC5jIHwgMTY3Cj4gPiA+ID4gKysrKysrKysrKysrLS0tLS0t
LS0tLS0tCj4gPiA+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4NiBpbnNlcnRpb25zKCspLCA4MSBkZWxl
dGlvbnMoLSkKPiA+ID4gPgo+ID4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3BpbmN0cmwvcmVu
ZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+ID4gPiBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3Bp
bmN0cmwtcnpnMmwuYwo+ID4gPiA+IGluZGV4IDk1MTFkOTIwNTY1ZS4uYTBjMmU1ODVlNzY1IDEw
MDY0NAo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwu
Ywo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYwo+
ID4gPiA+IEBAIC02NywxMCArNjcsMTIgQEAKPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBQSU5fQ0ZHX0ZJTENMS1NFTCkKPiA+ID4gPgo+ID4gPiA+ICAvKgo+
ID4gPiA+IC0gKiBuIGluZGljYXRlcyBudW1iZXIgb2YgcGlucyBpbiB0aGUgcG9ydCwgYSBpcyB0
aGUgcmVnaXN0ZXIgaW5kZXgKPiA+ID4gPiAtICogYW5kIGYgaXMgcGluIGNvbmZpZ3VyYXRpb24g
Y2FwYWJpbGl0aWVzIHN1cHBvcnRlZC4KPiA+ID4gPiArICogbSBpbmRpY2F0ZXMgdGhlIGJpdG1h
cCBvZiBzdXBwb3J0ZWQgcGlucywgbiBpbmRpY2F0ZXMgbnVtYmVyCj4gPiA+ID4gKyAqIG9mIHBp
bnMgaW4gdGhlIHBvcnQsIGEgaXMgdGhlIHJlZ2lzdGVyIGluZGV4IGFuZCBmIGlzIHBpbgo+ID4g
PiA+ICsgKiBjb25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiA+ID4gICAq
Lwo+ID4gPiA+IC0jZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLKG4sIGEsIGYpICAgICAgICAo
KChuKSA8PCAyOCkgfCAoKGEpIDw8Cj4gPiAyMCkgfAo+ID4gPiA+IChmKSkKPiA+ID4gPiArI2Rl
ZmluZSBSWkcyTF9HUElPX1BPUlRfUEFDSyhtLCBuLCBhLCBmKSAgICAgKChVTChtKSA8PCAzMikg
fAo+ID4gKFVMKG4pIDw8IDI4KQo+ID4gPiA+IHwgKChhKSA8PCAyMCkgfCAoZikpCj4gPiA+Cj4g
PiA+IEkgZ3Vlc3MsIHlvdSBjYW4gc3RpbGwgYWNoaWV2ZSBSWkcyTF9HUElPX1BPUlRfUEFDSyhu
LCBhLCBmKSB3aXRoCj4gPiA+ICgoVUwoUElOTUFQKG4pKSA8PCAzMikgfCAoVUwobikgPDwgMjgp
IHwgKChhKSA8PCAyMCkgfCAoZikpCj4gPiA+Cj4gPiA+ICNkZWZpbmUgUElOTUFQKG4pIEdFTk1B
U0sobiwwKSA/PyBUaGVuIHlvdSBkb24ndCBuZWVkIHRvIG1vZGlmeQo+ID4gcnpnMmxfZ3Bpb19j
b25maWdzLgo+ID4gPgo+ID4gR29vZCBwb2ludCwgYnV0IHRoaXMgd291bGQgd29yayBpZiBwb3J0
IHBpbnMgZGlkbid0IGhhdmUgYW55IGhvbGVzLgo+ID4gRm9yIGV4YW1wbGUgb24gUlovRml2ZSBw
b3J0IFAxOSB3ZSBoYXZlIFAxOV8xIHBpbiBvbmx5IGFuZCBQMTlfMCBpcyBub3QKPiA+IGF2YWls
YWJsZSAoYW5kIHNpbWlsYXJseSBmb3IgcG9ydCBQMjUgd2UgaGF2ZSBQMjVfMSkuCj4KPiBNYXli
ZSBpbnRyb2R1Y2UgYSBoZWxwZXIgbWFjcm8gdG8gYWRkcmVzcyB0aGlzIGNhc2UuCj4KPiAjZGVm
aW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLX1dJVEhfSE9MRVMobSwgbiwgYSwgZikgZm9yIHRoZXNl
IDIgY2FzZXMKPgo+IGFuZCB1c2UgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikgZm9yIHRo
ZSBvbmUgd2l0aG91dCBob2xlcy4KPgpBZ3JlZWQgd2lsbCBkby4KCkNoZWVycywKUHJhYmhha2Fy
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1y
aXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
