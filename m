Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6F6EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jul 2023 12:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HpcNNGU9glQggwed2CXzAeFbcl/8Z6x12+q7zT9hXlA=; b=kbZRBac8tbTDaZ
	HJ90bFtW+Udkbed4U/W7PssFWm6ZuK/cLDvzNMrN1H+B5TQSD1nSS5W7bdDguua9E/7jwSLX+HdqH
	gpE4UXMhQ86E6Q9ZdHQS8e6/F9O3XfBayYQ7NxV5PYKQTU1aAeFRVvw+mMho9dvIe2GA8FOf2UkUX
	bjgmgig4jOr+sekL9ZCjjfR+kAI8VtxigYYEH8NuXum9Iufgx1m7CKvXw9/zyxdCDZoURHUNYiU7Z
	9uZ/BRwKvEKxP8/558s1kSy0gL5Vu8MVw4zmRyNJdlFZlcor4DC0Zx4+4frtHUPF9d2vzUeDAHQUM
	kRyXB7YItOwG2f0Pru8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIu2-00AW0s-2k;
	Mon, 03 Jul 2023 12:43:38 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGItz-00AVze-0q
	for linux-riscv@lists.infradead.org;
	Mon, 03 Jul 2023 12:43:36 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-7835bad99fbso150922839f.1
        for <linux-riscv@lists.infradead.org>; Mon, 03 Jul 2023 05:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688388212; x=1690980212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZcEoocC19pvVvckXEfOwPq0UrW7yuRC8cKDF3dCYEz4=;
        b=Xknf2hwH10pOXp2JSYKV5VMG25V29YwSCtAF1bztkGfwW1rGJHKDMcWVI7c1RRZJtz
         wdtoI40NHgRDbD0DvHw/0gUjHO4pnAdQRAeMWEByAK+mqgBCTExDYRuuisz4c6LcH7Cu
         lbefqBP2iBDZRZM6GhsVbEahUoSxwXYqWi0i1JQiaDvEpo6NgDzET3zJpDesMnb9lcu8
         S2q1OYub0sdyeWS65VHBzhH6gIgGynBzeCJ1WwVCfzFyFItirpwAAAcfu41D8PGbVEyF
         UbeXgx3xtNy+8lD8iBLNS9HwmTP3xMrvFva1f1h3lfDYQyj0Gh7/4jsJablMW5y0+HtK
         X0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688388212; x=1690980212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZcEoocC19pvVvckXEfOwPq0UrW7yuRC8cKDF3dCYEz4=;
        b=WOi5w4U+JReNtTt1LFqAJq6dym55dduBNg7fWjywDdfyTOv+4dooxzCeZu3EK67brc
         B6O/fGPY/oYufgR6E/cVVlI+3O4W15bKEEirLUIlDXxEwwgzIV9PaGZ1SvDoCMyuSVhu
         CusoAML/S2Tbyn9mVmewUrjuAa0cPj7UKAZleAFj8gL8HgfopE9eFnN4uT5lELsDi9tj
         f84qBJlrtGDAAPpCTIiJNSovFNzkFjrAbWWKdrkMRFsGfPp0S/i6W28lISd1BBOL91kO
         lD4+byCYN768e6J8hxMVkrKdVAUQ5wa5/YoBILCBTxiLdoYqxn9Um9ZcgfMFNH1+yXrf
         8UAQ==
X-Gm-Message-State: AC+VfDzkXKTit64B+89Pj6pB08ZeC96LaoxJoFIWIH/3bDzqNbziqQs/
	diU3qEpAyyj1NKsWF3gkeFQ0+04OpuNT3YTPtlw=
X-Google-Smtp-Source: ACHHUZ5Zk75GyTJn8VfVPthaCVH4awdI5bmJizAK7v91XelWS1kU8rpKLdAAWEQH3wcA/yiXqvhxLSQ+BwE8f0ktwnw=
X-Received: by 2002:a6b:7a02:0:b0:785:d017:c16f with SMTP id
 h2-20020a6b7a02000000b00785d017c16fmr11368650iom.14.1688388212208; Mon, 03
 Jul 2023 05:43:32 -0700 (PDT)
MIME-Version: 1.0
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230630120433.49529-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <OS0PR01MB592217C4028606B67B39C6858629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
In-Reply-To: <OS0PR01MB592217C4028606B67B39C6858629A@OS0PR01MB5922.jpnprd01.prod.outlook.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 3 Jul 2023 13:43:06 +0100
Message-ID: <CA+V-a8sXcHP2AYYLLONLLBDVctMb=fnU=D4+6hNoHGx5Dk2O3Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230703_054335_302474_1C2BA381 
X-CRM114-Status: GOOD (  27.06  )
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

SGkgQmlqdSwKClRoYW5rIHlvdSBmb3IgdGhlIHJldmlldy4KCk9uIE1vbiwgSnVsIDMsIDIwMjMg
YXQgMTI6NDLigK9QTSBCaWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3Rl
Ogo+Cj4gSGkgUHJhYmhha2FyLAo+Cj4gVGhhbmtzIGZvciB0aGUgcGF0Y2guCj4KPiA+IC0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tCj4gPiBGcm9tOiBQcmFiaGFrYXIgPHByYWJoYWthci5jc2Vu
Z2dAZ21haWwuY29tPgo+ID4gU2VudDogRnJpZGF5LCBKdW5lIDMwLCAyMDIzIDE6MDUgUE0KPiA+
IFRvOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0K3JlbmVzYXNAZ2xpZGVyLmJlPjsgTWFnbnVz
IERhbW0KPiA+IDxtYWdudXMuZGFtbUBnbWFpbC5jb20+Cj4gPiBDYzogUm9iIEhlcnJpbmcgPHJv
YmgrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3psb3dza2kKPiA+IDxrcnp5c3p0b2Yua296
bG93c2tpK2R0QGxpbmFyby5vcmc+OyBMaW51cyBXYWxsZWlqCj4gPiA8bGludXMud2FsbGVpakBs
aW5hcm8ub3JnPjsgbGludXgtcmVuZXNhcy1zb2NAdmdlci5rZXJuZWwub3JnOwo+ID4gZGV2aWNl
dHJlZUB2Z2VyLmtlcm5lbC5vcmc7IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmc7IGxp
bnV4LQo+ID4ga2VybmVsQHZnZXIua2VybmVsLm9yZzsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5v
cmc7IEJpanUgRGFzCj4gPiA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+OyBQcmFiaGFrYXIg
PHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPjsKPiA+IFByYWJoYWthciBNYWhhZGV2IExhZCA8
cHJhYmhha2FyLm1haGFkZXYtbGFkLnJqQGJwLnJlbmVzYXMuY29tPgo+ID4gU3ViamVjdDogW1JG
QyBQQVRDSCAxLzRdIHBpbmN0cmw6IHJlbmVzYXM6IHJ6ZzJsOiBJbmNsdWRlIHBpbm1hcCBpbgo+
ID4gUlpHMkxfR1BJT19QT1JUX1BBQ0soKSBtYWNybwo+ID4KPiA+IEZyb206IExhZCBQcmFiaGFr
YXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiBDdXJy
ZW50bHkgd2UgYXNzdW1lIGFsbCB0aGUgcG9ydCBwaW5zIGFyZSBzZXF1ZW50aWFsIGllIGFsd2F5
cyBQWF8wIHRvCj4gPiBQWF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24gUlovRml2ZSBTb0Mgd2Ug
aGF2ZSBhZGRpdGlvbmFsIHBpbnMgUDE5XzEgdG8KPiA+IFAyOF81IHdoaWNoIGhhdmUgaG9sZXMg
aW4gdGhlbSwgZm9yIGV4YW1wbGUgb25seSBvbmUgcGluIG9uIHBvcnQxOSBpcwo+ID4gYXZhaWxh
YmxlIGFuZCB0aGF0IGlzIFAxOV8xIGFuZCBub3QgUDE5XzAuCj4gPgo+ID4gU28gdG8gaGFuZGxl
IHN1Y2ggY2FzZXMgaW5jbHVkZSBwaW5tYXAgZm9yIGVhY2ggcG9ydCB3aGljaCB3b3VsZAo+ID4g
aW5kaWNhdGUgdGhlIHBpbiBhdmFpbGFiaWxpdHkgb24gZWFjaCBwb3J0LiBXaXRoIHRoaXMgd2Ug
YWxzbyBnZXQKPiA+IGFkZGl0aW9uYWwgcGluIHZhbGlkYXRpb24sIGZvciBleGFtcGxlIG9uIHRo
ZSBSWi9HMkwgU09DIFAwIGhhcyB0d28gcGlucwo+ID4gUDBfMSBhbmQgUDBfMCBidXQgd2l0aCBE
VC9TWVNGUyBjb3VsZCB1c2UgdGhlIFAwXzItUDBfNy4KPiA+Cj4gPiBXaGlsZSBhdCBpdCwgdXBk
YXRlIHJ6ZzJsX3ZhbGlkYXRlX2dwaW9fcGluKCkgdG8gdXNlIHRoZSBwb3J0IHBpbm1hcCB0bwo+
ID4gdmFsaWRhdGUgdGhlIGdwaW8gcGluLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFi
aGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+IC0tLQo+
ID4gIGRyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwtcnpnMmwuYyB8IDE2NyArKysrKysr
KysrKystLS0tLS0tLS0tLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODYgaW5zZXJ0aW9ucygrKSwg
ODEgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9yZW5l
c2FzL3BpbmN0cmwtcnpnMmwuYwo+ID4gYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJs
LXJ6ZzJsLmMKPiA+IGluZGV4IDk1MTFkOTIwNTY1ZS4uYTBjMmU1ODVlNzY1IDEwMDY0NAo+ID4g
LS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4gPiArKysgYi9k
cml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+IEBAIC02NywxMCArNjcs
MTIgQEAKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFBJTl9DRkdf
RklMQ0xLU0VMKQo+ID4KPiA+ICAvKgo+ID4gLSAqIG4gaW5kaWNhdGVzIG51bWJlciBvZiBwaW5z
IGluIHRoZSBwb3J0LCBhIGlzIHRoZSByZWdpc3RlciBpbmRleAo+ID4gLSAqIGFuZCBmIGlzIHBp
biBjb25maWd1cmF0aW9uIGNhcGFiaWxpdGllcyBzdXBwb3J0ZWQuCj4gPiArICogbSBpbmRpY2F0
ZXMgdGhlIGJpdG1hcCBvZiBzdXBwb3J0ZWQgcGlucywgbiBpbmRpY2F0ZXMgbnVtYmVyCj4gPiAr
ICogb2YgcGlucyBpbiB0aGUgcG9ydCwgYSBpcyB0aGUgcmVnaXN0ZXIgaW5kZXggYW5kIGYgaXMg
cGluCj4gPiArICogY29uZmlndXJhdGlvbiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ID4gICAq
Lwo+ID4gLSNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikgICAgICAgICgoKG4p
IDw8IDI4KSB8ICgoYSkgPDwgMjApIHwKPiA+IChmKSkKPiA+ICsjZGVmaW5lIFJaRzJMX0dQSU9f
UE9SVF9QQUNLKG0sIG4sIGEsIGYpICAgICAoKFVMKG0pIDw8IDMyKSB8IChVTChuKSA8PCAyOCkK
PiA+IHwgKChhKSA8PCAyMCkgfCAoZikpCj4KPiBJIGd1ZXNzLCB5b3UgY2FuIHN0aWxsIGFjaGll
dmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwgZikgd2l0aAo+ICgoVUwoUElOTUFQKG4pKSA8
PCAzMikgfCAoVUwobikgPDwgMjgpIHwgKChhKSA8PCAyMCkgfCAoZikpCj4KPiAjZGVmaW5lIFBJ
Tk1BUChuKSBHRU5NQVNLKG4sMCkgPz8gVGhlbiB5b3UgZG9uJ3QgbmVlZCB0byBtb2RpZnkgcnpn
MmxfZ3Bpb19jb25maWdzLgo+Ckdvb2QgcG9pbnQsIGJ1dCB0aGlzIHdvdWxkIHdvcmsgaWYgcG9y
dCBwaW5zIGRpZG4ndCBoYXZlIGFueSBob2xlcy4KRm9yIGV4YW1wbGUgb24gUlovRml2ZSBwb3J0
IFAxOSB3ZSBoYXZlIFAxOV8xIHBpbiBvbmx5IGFuZCBQMTlfMCBpcwpub3QgYXZhaWxhYmxlIChh
bmQgc2ltaWxhcmx5IGZvciBwb3J0IFAyNSB3ZSBoYXZlIFAyNV8xKS4KCkNoZWVycywKUHJhYmhh
a2FyCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
