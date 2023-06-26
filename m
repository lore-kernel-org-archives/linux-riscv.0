Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 788C8EB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Jun 2023 03:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bBV/LGdX1ALITDOGXH3if5MS5bM4hPwMH0o4RUiSB/0=; b=XRtGzMqS+uKj2C
	qWW5rWEjgn9WD+yE4Moh3MbJQX319NvY1D8mRKbkIL9W1/a1wBrOXnO+cm3jLrG1vJzqzdiVyvf+F
	jxBAtvc6cPznVMZBdPZRzcmv6YrwW6JcN5p+6YEKGvplz691oCbj/pzerhaC8B74VBFFOUrlFapOu
	4Ms+BB3fd8L5ilr4ct1vMq+Al59k7WidrPMEL2x6wUjvUNBrVyvy3Pr7GkmVW1BPrx93hlZglbdze
	R0x//JYPj8CMV49R4MIvnNq2z/zmfc9MDqEwNOFYGJqNw9zeX8F0wmb+50EDTf9ry8k3XptCfWsfk
	QJU623NOCtpmlxJyfnAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcZ5-009Ck5-02;
	Mon, 26 Jun 2023 03:06:55 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDcZ1-009CjH-2Y
	for linux-riscv@lists.infradead.org;
	Mon, 26 Jun 2023 03:06:53 +0000
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b69f958ef3so8728251fa.1
        for <linux-riscv@lists.infradead.org>; Sun, 25 Jun 2023 20:06:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1687748808; x=1690340808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nD4rzl7wHSnevOLG2NiHgv978jXc76hQfIAH8/FPQhU=;
        b=btDaLufx7cp58A8p/Se0hLvmXRbldFAC3h0fs5y5ViaFsEm9zl2vEQUednCysWwZGo
         SqhBvfEO/YXxxy8knMOuaClpSZt5QwxtGoHOZ8OSiED+u1ubIbZnl8e5EpgYWfMP7/Ig
         8lyd6/nVSYly7K4eQyhBkYJ9cv85ahUznwbbhvr6fzrCgTDv+bQaW3jnRVQg4EOVfg3t
         F354rBk3bieDTMvToztoTN6/2Tajc8GnzD9pKzFIyATvbfEAe4wokzIVZUakERZratg1
         WXkReZMUyw+IGknhNu6NO2FamPSiKqspIERa0WDsCeIqIsC+jMFTRlCRwjYrOKxrM2nt
         weYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687748808; x=1690340808;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nD4rzl7wHSnevOLG2NiHgv978jXc76hQfIAH8/FPQhU=;
        b=BY8GmKQ09AKQiWGKJpnj+b70wUCjQnfLQJleBD4xXaUR+bmekT0LkVOnpAGln22srx
         puHenOJeMr7CZXd5mXm/Gir+hFHH0PdN62qURY3S8AmiaO6yvVsvIrKEretEM7ey91VJ
         EsRHrREwz2ckuomV5DzmMMVksKHkPyUMxGu/cmzPnoZK17GF14K3AntUMdBEfvq64LTs
         OTpyPEpHpZUrpPf4Lq+/PatofPOcS41FJ8cZ7hlLSYPqjxNGXxuFtE9udEx4lhwkfu3J
         TMum5+MvpqW0DRRi28Qo2u9C5jRqT88FLXQoRxJB2J01FlXGqSl8OhIrUxSw+39HBtGG
         yl3g==
X-Gm-Message-State: AC+VfDzBokJOfeZr8jSeECgb9RDtxq/mcjkGRwZWHKz0YeBL87cuwpX3
	3Dqlh1Kmy6CS9IumMWk3heZZ7j4fXpw1KAvhDseL8w==
X-Google-Smtp-Source: ACHHUZ5SJIsRasQJlGe1qGG6AGfTPj5v1Fyn2OBo8PDT4ECRnP81aOb/XVz50aecRQdy9Ytkj2s7lCyEZM8af7lVZaU=
X-Received: by 2002:a2e:8805:0:b0:2b6:a23d:57c8 with SMTP id
 x5-20020a2e8805000000b002b6a23d57c8mr416874ljh.14.1687748808365; Sun, 25 Jun
 2023 20:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230616063210.19063-1-eric.lin@sifive.com> <20230616063210.19063-4-eric.lin@sifive.com>
 <20230616-renovate-country-12b9873b4494@wendy>
In-Reply-To: <20230616-renovate-country-12b9873b4494@wendy>
From: Eric Lin <eric.lin@sifive.com>
Date: Mon, 26 Jun 2023 11:06:36 +0800
Message-ID: <CAPqJEFrK8JPLjVEzLqr77kEx+KfYSQ_Fqh2hGXaA+BSL6pWwQw@mail.gmail.com>
Subject: Re: [PATCH 3/3] dt-bindings: riscv: sifive: Add SiFive Private L2
 cache controller
To: Conor Dooley <conor.dooley@microchip.com>
Cc: conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu, 
	maz@kernel.org, chenhuacai@kernel.org, baolu.lu@linux.intel.com, 
	will@kernel.org, kan.liang@linux.intel.com, nnac123@linux.ibm.com, 
	pierre.gondois@arm.com, jgross@suse.com, chao.gao@intel.com, 
	maobibo@loongson.cn, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com, 
	Zong Li <zong.li@sifive.com>, Nick Hu <nick.hu@sifive.com>, 
	Greentime Hu <greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_200651_833266_6F3EE399 
X-CRM114-Status: GOOD (  23.01  )
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

SGkgQ29ub3IsCgpPbiBGcmksIEp1biAxNiwgMjAyMyBhdCA2OjEy4oCvUE0gQ29ub3IgRG9vbGV5
IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBIZXkgRXJpYywKPgo+IE9u
IEZyaSwgSnVuIDE2LCAyMDIzIGF0IDAyOjMyOjEwUE0gKzA4MDAsIEVyaWMgTGluIHdyb3RlOgo+
ID4gVGhpcyBhZGQgWUFNTCBEVCBiaW5kaW5nIGRvY3VtZW50YXRpb24gZm9yIFNpRml2ZSBQcml2
YXRlIEwyCj4gPiBjYWNoZSBjb250cm9sbGVyCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRXJpYyBM
aW4gPGVyaWMubGluQHNpZml2ZS5jb20+Cj4gPiBSZXZpZXdlZC1ieTogWm9uZyBMaSA8em9uZy5s
aUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNv
bT4KPgo+IEZpcnN0bHksIGJpbmRpbmdzIG5lZWQgdG8gY29tZSBiZWZvcmUgdGhlIGRyaXZlciB1
c2luZyB0aGVtLgo+CgpPSywgSSdsbCBmaXggaXQgaW4gdjIuCgo+ID4gLS0tCj4gPiAgLi4uL2Jp
bmRpbmdzL3Jpc2N2L3NpZml2ZSxwTDJDYWNoZTAueWFtbCAgICAgIHwgODEgKysrKysrKysrKysr
KysrKysrKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA4MSBpbnNlcnRpb25zKCspCj4gPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zaWZp
dmUscEwyQ2FjaGUwLnlhbWwKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NpZml2ZSxwTDJDYWNoZTAueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zaWZpdmUscEwyQ2FjaGUwLnlhbWwKPiA+IG5l
dyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPiBpbmRleCAwMDAwMDAwMDAwMDAuLmI1ZDhkNGEzOWRkZQo+
ID4gLS0tIC9kZXYvbnVsbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL3Jpc2N2L3NpZml2ZSxwTDJDYWNoZTAueWFtbAo+Cj4gQ2FjaGUgYmluZGluZ3MgaGF2ZSBt
b3ZlZCB0byBkZXZpY2V0cmVlL2JpbmRpbmdzL2NhY2hlLgo+Cj4gPiBAQCAtMCwwICsxLDgxIEBA
Cj4gPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNl
KQo+ID4gKyMgQ29weXJpZ2h0IChDKSAyMDIzIFNpRml2ZSwgSW5jLgo+ID4gKyVZQU1MIDEuMgo+
ID4gKy0tLQo+ID4gKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvcmlzY3Yvc2lm
aXZlLHBMMkNhY2hlMC55YW1sIwo+ID4gKyRzY2hlbWE6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9t
ZXRhLXNjaGVtYXMvY29yZS55YW1sIwo+ID4gKwo+ID4gK3RpdGxlOiBTaUZpdmUgUHJpdmF0ZSBM
MiBDYWNoZSBDb250cm9sbGVyCj4gPiArCj4gPiArbWFpbnRhaW5lcnM6Cj4gPiArICAtIEdyZWVu
dGltZSBIdSAgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+ID4gKyAgLSBFcmljIExpbiAgICAg
IDxlcmljLmxpbkBzaWZpdmUuY29tPgo+Cj4gRHJvcCB0aGUgYWxpZ25tZW50IGhlcmUgcGxlYXNl
Lgo+CgpPSywgSSdsbCBmaXggaXQgaW4gdjIuCgo+ID4gKwo+ID4gK2Rlc2NyaXB0aW9uOgo+ID4g
KyAgVGhlIFNpRml2ZSBQcml2YXRlIEwyIENhY2hlIENvbnRyb2xsZXIgaXMgcGVyIGhhcnQgYW5k
IGNvbW11bmljYXRlcyB3aXRoIGJvdGggdGhlIHVwc3RyZWFtCj4gPiArICBMMSBjYWNoZXMgYW5k
IGRvd25zdHJlYW0gTDMgY2FjaGUgb3IgbWVtb3J5LCBlbmFibGluZyBhIGhpZ2gtcGVyZm9ybWFu
Y2UgY2FjaGUgc3Vic3lzdGVtLgo+ID4gKyAgQWxsIHRoZSBwcm9wZXJ0aWVzIGluIGVQQVBSL0Rl
dmljZVRyZWUgc3BlY2lmaWNhdGlvbiBhcHBsaWVzIGZvciB0aGlzIHBsYXRmb3JtLgo+Cj4gUGxl
YXNlIHdyYXAgYmVmb3JlIDgwIGNoYXJhY3RlcnMuCj4KCk9LLCBJJ2xsIGZpeCBpdCBpbiB2Mi4K
Cj4gPiArCj4gPiArYWxsT2Y6Cj4gPiArICAtICRyZWY6IC9zY2hlbWFzL2NhY2hlLWNvbnRyb2xs
ZXIueWFtbCMKPiA+ICsKPiA+ICtzZWxlY3Q6Cj4gPiArICBwcm9wZXJ0aWVzOgo+ID4gKyAgICBj
b21wYXRpYmxlOgo+ID4gKyAgICAgIGNvbnRhaW5zOgo+ID4gKyAgICAgICAgZW51bToKPiA+ICsg
ICAgICAgICAgLSBzaWZpdmUscEwyQ2FjaGUwCj4gPiArICAgICAgICAgIC0gc2lmaXZlLHBMMkNh
Y2hlMQo+Cj4gV2h5IGlzIHRoaXMgc2VsZWN0OiByZXF1aXJlZD8KPgpPSywgSSdsbCBmaXggaXQg
aW4gdjIuCgo+ID4gKyAgcmVxdWlyZWQ6Cj4gPiArICAgIC0gY29tcGF0aWJsZQo+ID4gKwo+ID4g
K3Byb3BlcnRpZXM6Cj4gPiArICBjb21wYXRpYmxlOgo+ID4gKyAgICBpdGVtczoKPiA+ICsgICAg
ICAtIGVudW06Cj4gPiArICAgICAgICAgIC0gc2lmaXZlLHBMMkNhY2hlMAo+ID4gKyAgICAgICAg
ICAtIHNpZml2ZSxwTDJDYWNoZTEKPgo+IFdoYXQgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGVzZT8gKGFuZCBkcm9wIHRoZSBjYXBzIHBsZWFzZSkKClRoZSBwTDJDYWNoZTEgaGFzIG1pbm9y
IGNoYW5nZXMgaW4gaGFyZHdhcmUsIGJ1dCBpdCBjYW4gdXNlIHRoZSBzYW1lCnBsMiBjYWNoZSBk
cml2ZXIuCk9LLCBJJ2xsIGRyb3AgdGhlIGNhcHMgaW4gdjIuCgo+Cj4gU2hvdWxkIHRoaXMgYWxz
byBub3QgZmFsbCBiYWNrIHRvICJjYWNoZSI/Cj4KWWVzLCAgSSdsbCBmaXggaXQgaW4gdjIuCgo+
ID4gKwo+ID4gKyAgY2FjaGUtYmxvY2stc2l6ZToKPiA+ICsgICAgY29uc3Q6IDY0Cj4gPiArCj4g
PiArICBjYWNoZS1sZXZlbDoKPiA+ICsgICAgY29uc3Q6IDIKPiA+ICsKPiA+ICsgIGNhY2hlLXNl
dHM6Cj4gPiArICAgIGNvbnN0OiA1MTIKPiA+ICsKPiA+ICsgIGNhY2hlLXNpemU6Cj4gPiArICAg
IGNvbnN0OiAyNjIxNDQKPiA+ICsKPiA+ICsgIGNhY2hlLXVuaWZpZWQ6IHRydWUKPiA+ICsKPiA+
ICsgIHJlZzoKPiA+ICsgICAgbWF4SXRlbXM6IDEKPiA+ICsKPiA+ICsgIG5leHQtbGV2ZWwtY2Fj
aGU6IHRydWUKPiA+ICsKPiA+ICthZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiA+ICsKPiA+
ICtyZXF1aXJlZDoKPiA+ICsgIC0gY29tcGF0aWJsZQo+ID4gKyAgLSBjYWNoZS1ibG9jay1zaXpl
Cj4gPiArICAtIGNhY2hlLWxldmVsCj4gPiArICAtIGNhY2hlLXNldHMKPiA+ICsgIC0gY2FjaGUt
c2l6ZQo+ID4gKyAgLSBjYWNoZS11bmlmaWVkCj4gPiArICAtIHJlZwo+ID4gKwo+ID4gK2V4YW1w
bGVzOgo+ID4gKyAgLSB8Cj4gPiArICAgIHBsMkAxMDEwNDAwMCB7Cj4KPiBjYWNoZS1jb250cm9s
bGVyQAo+CgpPSywgSSdsbCBmaXggaXQgaW4gdjIuClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCkJl
c3QgUmVnYXJkcywKRXJpYyBMaW4uCgo+IENoZWVycywKPiBDb25vci4KPgo+ID4gKyAgICAgICAg
Y29tcGF0aWJsZSA9ICJzaWZpdmUscEwyQ2FjaGUwIjsKPiA+ICsgICAgICAgIGNhY2hlLWJsb2Nr
LXNpemUgPSA8NjQ+Owo+ID4gKyAgICAgICAgY2FjaGUtbGV2ZWwgPSA8Mj47Cj4gPiArICAgICAg
ICBjYWNoZS1zZXRzID0gPDUxMj47Cj4gPiArICAgICAgICBjYWNoZS1zaXplID0gPDI2MjE0ND47
Cj4gPiArICAgICAgICBjYWNoZS11bmlmaWVkOwo+ID4gKyAgICAgICAgcmVnID0gPDB4MTAxMDQw
MDAgMHg0MDAwPjsKPiA+ICsgICAgICAgIG5leHQtbGV2ZWwtY2FjaGUgPSA8Jkw0PjsKPiA+ICsg
ICAgfTsKPiA+IC0tCj4gPiAyLjQwLjEKPiA+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZA
bGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL2xpbnV4LXJpc2N2Cg==
