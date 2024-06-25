Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8534CC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXLkLHIE7adAh1rWgR10LY054/a76fCYF8yDb/5IPCI=; b=HqE+OoJm4RqynU
	awLSrpcufSDsuQGXC8e/BwoWf+CRig/i3oMQgij8ylHDfcpakdCzS4OfvhiYlCZdOhBnSFpDqhbUB
	U/8uCBYlqqq/emqi1hDTasOk2AzIq+iRsv7Kcr2h0dS9A6UgyXDiCgsPkipyh1MCv8ijQvqvFMJO+
	I7jLNTqkDuQhnQ4olreX5VXiT0ORJBwg6zRFYt9jrEcZRsvHsbtBrl3U5F+59QgCfhHdnrrqdPc/g
	8/sCNHUOCtZrktXJ/TDccEf3KiAfLGz+kaGTziZ+e/Y8oIk7Xe3/x8qifZiKOCDiLHWiASRxvfjr2
	VyHGKuiXwtxMwbiKbASA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3DP-00000002MyM-27v0;
	Tue, 25 Jun 2024 10:15:55 +0000
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM3DN-00000002Mxd-0Q7u
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jun 2024 10:15:54 +0000
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6f8d0a00a35so4955755a34.2
        for <linux-riscv@lists.infradead.org>; Tue, 25 Jun 2024 03:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719310551; x=1719915351; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BktDRqnPMFELB/prBTikpiW5DTpaK+CgtgFHB2p1S0w=;
        b=jEEl50jt1QQS52YTiCJp/iuUr2hRO6zm9c4RPWqGtbkw4IJyCXFoKIuMGhtVrhgFJs
         4TG+dtifxiMZXHHv0t1a6+w7ZHuIV21WumXSs4tocUTz5NIMC5jJhk30UFxJhC4HYKkT
         EzZnobdnOv5lCPdxpDShqjV3DjH7HAppGG3lT8rPphFyqUFdeQ2Jt7gBEhFaJYesq3Av
         IEQ7Q2qvC4CcwxEZBmLC5W/obuw6c8sPkjZj53exdkBWtc0cCgfwiCYvYG1kxQTYsVZI
         peY1meTx6Wig6PLFYezCOBrHnH8DeGDIuc+tSKZUrYjGjh0f/A46Ey7zGQwIN240wb9V
         EtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719310551; x=1719915351;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BktDRqnPMFELB/prBTikpiW5DTpaK+CgtgFHB2p1S0w=;
        b=Hm1gpyRzJkDr9J9KBPewCgHa1CYSyjrZ1UEPcAt7YnVY2R4J8RtJUuAmQALGIaYpIe
         oz0Fjka4sdKs+I89Yv722Asu9LXbykCu0hUZBUER9Zvv3hXOxlSlvVnwLbpjkFRBXEYx
         XNrZ4u/oqEUa2P1wB6yigzWN/mI2YD/BSB67TIKyYmWrUt1uC2rYJ15LRrxPC2yX3Js7
         zJX1MyuMH+F519n4DnVgDh4FHs2u/25NRSdwCPv5PLQmcRKTW3fCL979CT3m4SuTh4gB
         jtq5bx4VLmpBCP0BP3vuK1GwzDdpR3DcVIqgdcwJboJtASKC/pH+NwlLyinqyTwA6nXM
         mgIw==
X-Forwarded-Encrypted: i=1; AJvYcCXoMeA4xPMeTsFQVyzi4vaKJZrpUbH6I5mXTa4bDQlLGHRpQVYGRyfmHUaIjiC7t5PYub9rGA9zLzI0A0asxWbQfyIHRLGVxwIal+aS4xhR
X-Gm-Message-State: AOJu0Yxzrc/q8wjBKlI+8b0neWCBNPNVaY6EFCI8nnwuaxvUv/jj530d
	gT+gGW5cYs+zuWSp2CketRgo3eU5jZpKeID3/qE3buhSTnxGpyLXTIv4GbI6P3NgW1cxfwOjKmQ
	PxefCtgzmh0089ZKaHBpn2ZcJ5EwxHwB9WUfKjg==
X-Google-Smtp-Source: AGHT+IHdQg0dChXalsihdVM0gzMAZlwgRB+W6UlnBn8/daYZeHmLyMfFupx8YsHVo6AIVJIsqQvv/HsqJ6VBzCA/IqE=
X-Received: by 2002:a05:6870:d69c:b0:254:e4a0:4d9c with SMTP id
 586e51a60fabf-25cfcfa117amr8027802fac.58.1719310551082; Tue, 25 Jun 2024
 03:15:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com> <20240605-atrium-neuron-c2512b34d3da@spud>
 <CAK9=C2XH7-RdVpojX8GNW-WFTyChW=sTOWs8_kHgsjiFYwzg+g@mail.gmail.com> <20240621-10d503a9a2e7d54e67db102c@orel>
In-Reply-To: <20240621-10d503a9a2e7d54e67db102c@orel>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 25 Jun 2024 18:15:40 +0800
Message-ID: <CAMWQL2gGfpotAR_YmU05bciGV98r80PZ1GWDSk6A03YRxD8wug@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Andrew Jones <ajones@ventanamicro.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, alex@ghiti.fr, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_031553_181835_22FC3FB6 
X-CRM114-Status: GOOD (  38.25  )
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

SGkgQW51cC9BbmRyZXcvQWxleGFuZHJlLAoKVGhhbmtzIGEgbG90ISBTbyB0aGUgZGVzY3JpcHRp
b24gb2YgZHQtYmluZGluZyBvZiBTdmFkZSB3b3VsZCBiZToKClRoZSBzdGFuZGFyZCBTdmFkZSBz
dXBlcnZpc29yLWxldmVsIGV4dGVuc2lvbiBmb3IgU1ctbWFuYWdlZCBQVEUgQS9ECmJpdCB1cGRh
dGVzIGFzIHJhdGlmaWVkIGluIHRoZSAyMDI0MDIxMyB2ZXJzaW9uIG9mIHRoZSBwcml2aWxlZ2Vk
CklTQSBzcGVjaWZpY2F0aW9uLgoxKSBOZWl0aGVyIFN2YWRlIG5vciBTdmFkdSBwcmVzZW50IGlu
IERUID0+IEl0IGlzIHRlY2huaWNhbGx5CiAgICB1bmtub3duIHdoZXRoZXIgdGhlIHBsYXRmb3Jt
IHVzZXMgU3ZhZGUgb3IgU3ZhZHUuIFN1cGVydmlzb3IgbWF5CiAgICBhc3N1bWUgU3ZhZGUgdG8g
YmUgcHJlc2VudCBhbmQgZW5hYmxlZCBvciBpdCBjYW4gZGlzY292ZXIgYmFzZWQKICAgIG9uIG12
ZW5kb3JpZCwgbWFyY2hpZCwgYW5kIG1pbXBpZC4KMikgT25seSBTdmFkZSBwcmVzZW50IGluIERU
ID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUgU3ZhZGUKICAgIHRvIGJlIGFsd2F5cyBlbmFibGVk
LiAoT2J2aW91cykKMykgT25seSBTdmFkdSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVz
dCBhc3N1bWUgU3ZhZHUKICAgIHRvIGJlIGFsd2F5cyBlbmFibGVkLiAoT2J2aW91cykKNCkgQm90
aCBTdmFkZSBhbmQgU3ZhZHUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QKICAgIGFz
c3VtZSBTdmFkdSB0dXJuZWQtb2ZmIGF0IGJvb3QgdGltZS4gVG8gdXNlIFN2YWR1LCBzdXBlcnZp
c29yCiAgICBtdXN0IGV4cGxpY2l0bHkgZW5hYmxlIGl0IHVzaW5nIHRoZSBTQkkgRldGVCBleHRl
bnNpb24uCgpXb3VsZCB5b3UgbWluZCBwcm92aWRpbmcgYSBDby1kZXZlbG9wZWQtYnkgZm9yIHRo
aXMgcGF0Y2g/CgpSZWdhcmRzLApZb25nLVh1YW4KCgpPbiBGcmksIEp1biAyMSwgMjAyNCBhdCA0
OjMz4oCvUE0gQW5kcmV3IEpvbmVzIDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4K
PiBPbiBUaHUsIEp1biAyMCwgMjAyNCBhdCAxMTo1NTo0NEFNIEdNVCwgQW51cCBQYXRlbCB3cm90
ZToKPiA+IE9uIFdlZCwgSnVuIDUsIDIwMjQgYXQgMTA6MjXigK9QTSBDb25vciBEb29sZXkgPGNv
bm9yQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBXZWQsIEp1biAwNSwgMjAyNCBh
dCAwODoxNTowOFBNICswODAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+ID4gPiBBZGQgZW50
cmllcyBmb3IgdGhlIFN2YWRlIGFuZCBTdmFkdSBleHRlbnNpb25zIHRvIHRoZSByaXNjdixpc2Et
ZXh0ZW5zaW9ucwo+ID4gPiA+IHByb3BlcnR5Lgo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9mZi1i
eTogWW9uZy1YdWFuIFdhbmcgPHlvbmd4dWFuLndhbmdAc2lmaXZlLmNvbT4KPiA+ID4gPiAtLS0K
PiA+ID4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sIHwg
MzAgKysrKysrKysrKysrKysrKysrKwo+ID4gPiA+ICAxIGZpbGUgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKQo+ID4gPiA+Cj4gPiA+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiA+ID4gaW5kZXggNDY4YzY0
NjI0N2FhLi4xZTMwOTg4ODI2YjkgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2V4dGVuc2lvbnMueWFtbAo+ID4gPiA+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+
ID4gPiBAQCAtMTUzLDYgKzE1MywzNiBAQCBwcm9wZXJ0aWVzOgo+ID4gPiA+ICAgICAgICAgICAg
ICByYXRpZmllZCBhdCBjb21taXQgM2Y5ZWQzNCAoIkFkZCBhYmlsaXR5IHRvIG1hbnVhbGx5IHRy
aWdnZXIKPiA+ID4gPiAgICAgICAgICAgICAgd29ya2Zsb3cuICgjMikiKSBvZiByaXNjdi10aW1l
LWNvbXBhcmUuCj4gPiA+ID4KPiA+ID4gPiArICAgICAgICAtIGNvbnN0OiBzdmFkZQo+ID4gPiA+
ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+ID4gPiArICAgICAgICAgICAgVGhlIHN0YW5k
YXJkIFN2YWRlIHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciByYWlzaW5nIHBhZ2UtZmF1
bHQKPiA+ID4gPiArICAgICAgICAgICAgZXhjZXB0aW9ucyB3aGVuIFBURSBBL0QgYml0cyBuZWVk
IGJlIHNldCBhcyByYXRpZmllZCBpbiB0aGUgMjAyNDAyMTMKPiA+ID4gPiArICAgICAgICAgICAg
dmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZCBJU0Egc3BlY2lmaWNhdGlvbi4KPiA+ID4gPiArCj4g
PiA+ID4gKyAgICAgICAgICAgIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgY29udHJv
bCB0aGUgaGFyZHdhcmUgYmVoYXZpb3Igd2hlbgo+ID4gPiA+ICsgICAgICAgICAgICB0aGUgUFRF
IEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBUaGUgZGVmYXVsdCBiZWhhdmlvciBmb3IgdGhlIGZv
dXIKPiA+ID4gPiArICAgICAgICAgICAgcG9zc2libGUgY29tYmluYXRpb25zIG9mIHRoZXNlIGV4
dGVuc2lvbnMgaW4gdGhlIGRldmljZSB0cmVlIGFyZToKPiA+ID4gPiArICAgICAgICAgICAgMS4g
TmVpdGhlciBzdmFkZSBub3Igc3ZhZHUgaW4gRFQ6IGRlZmF1bHQgdG8gc3ZhZGUuCj4gPiA+Cj4g
PiA+IEkgdGhpbmsgdGhpcyBuZWVkcyB0byBiZSBleHBhbmRlZCBvbiwgYXMgdG8gd2h5IG5vdGhp
bmcgbWVhbnMgc3ZhZGUuCj4gPgo+ID4gQWN0dWFsbHkgaWYgYm90aCBTdmFkZSBhbmQgU3ZhZHUg
YXJlIG5vdCBwcmVzZW50IGluIERUIHRoZW4KPiA+IGl0IGlzIGxlZnQgdG8gdGhlIHBsYXRmb3Jt
IGFuZCBPcGVuU0JJIGRvZXMgbm90aGluZy4KPgo+IFRoaXMgaXMgYSBnb29kIHBvaW50LCBhbmQg
bWF5YmUgaXQncyB3b3J0aCBpbnRlZ3JhdGluZyBzb21ldGhpbmcgdGhhdAo+IHN0YXRlcyB0aGlz
IGNhc2UgaXMgdGVjaG5pY2FsbHkgdW5rbm93biBpbnRvIHRoZSBmaW5hbCB0ZXh0LiAoRXZlbiB0
aG91Z2gKPiBoaXN0b3JpY2FsbHkgdGhpcyBoYXMgYmVlbiBhc3N1bWVkIHRvIG1lYW4gc3ZhZGUu
KQo+Cj4gPgo+ID4gPgo+ID4gPiA+ICsgICAgICAgICAgICAyLiBPbmx5IHN2YWRlIGluIERUOiB1
c2Ugc3ZhZGUuCj4gPiA+Cj4gPiA+IFRoYXQncyBhIHN0YXRlbWVudCBvZiB0aGUgb2J2aW91cywg
cmlnaHQ/Cj4gPiA+Cj4gPiA+ID4gKyAgICAgICAgICAgIDMuIE9ubHkgc3ZhZHUgaW4gRFQ6IHVz
ZSBzdmFkdS4KPiA+ID4KPiA+ID4gVGhpcyBpcyBub3QgcmVsZXZhbnQgZm9yIFN2YWRlLgo+ID4g
Pgo+ID4gPiA+ICsgICAgICAgICAgICA0LiBCb3RoIHN2YWRlIGFuZCBzdmFkdSBpbiBEVDogZGVm
YXVsdCB0byBzdmFkZSAoTGludXggY2FuIHN3aXRjaCB0bwo+ID4gPiA+ICsgICAgICAgICAgICAg
ICBzdmFkdSBvbmNlIHRoZSBTQkkgRldGVCBleHRlbnNpb24gaXMgYXZhaWxhYmxlKS4KPiA+ID4K
PiA+ID4gIlRoZSBwcml2aWxlZ2UgbGV2ZWwgdG8gd2hpY2ggdGhpcyBkZXZpY2V0cmVlIGhhcyBi
ZWVuIHByb3ZpZGVkIGNhbiBzd2l0Y2ggdG8KPiA+ID4gU3ZhZHUgaWYgdGhlIFNCSSBGV0ZUIGV4
dGVuc2lvbiBpcyBhdmFpbGFibGUiLgo+ID4gPgo+ID4gPiA+ICsgICAgICAgIC0gY29uc3Q6IHN2
YWR1Cj4gPiA+ID4gKyAgICAgICAgICBkZXNjcmlwdGlvbjogfAo+ID4gPiA+ICsgICAgICAgICAg
ICBUaGUgc3RhbmRhcmQgU3ZhZHUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNpb24gZm9yIGhhcmR3
YXJlIHVwZGF0aW5nCj4gPiA+ID4gKyAgICAgICAgICAgIG9mIFBURSBBL0QgYml0cyBhcyByYXRp
ZmllZCBhdCBjb21taXQgYzFhYmNjZiAoIk1lcmdlIHB1bGwgcmVxdWVzdAo+ID4gPiA+ICsgICAg
ICAgICAgICAjMjUgZnJvbSB2ZWQtcml2b3MvcmF0aWZpZWQiKSBvZiByaXNjdi1zdmFkdS4KPiA+
ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAgIEJvdGggU3ZhZGUgYW5kIFN2YWR1IGV4dGVuc2lv
bnMgY29udHJvbCB0aGUgaGFyZHdhcmUgYmVoYXZpb3Igd2hlbgo+ID4gPiA+ICsgICAgICAgICAg
ICB0aGUgUFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBUaGUgZGVmYXVsdCBiZWhhdmlvciBm
b3IgdGhlIGZvdXIKPiA+ID4gPiArICAgICAgICAgICAgcG9zc2libGUgY29tYmluYXRpb25zIG9m
IHRoZXNlIGV4dGVuc2lvbnMgaW4gdGhlIGRldmljZSB0cmVlIGFyZToKPiA+ID4KPiA+ID4gQEFu
dXAvRHJldy9BbGV4LCBhcmUgd2UgbWlzc2luZyBzb21lIHdvcmRpbmcgaW4gaGVyZSBhYm91dCBp
dCBvbmx5IGJlaW5nCj4gPiA+IHZhbGlkIHRvIGhhdmUgU3ZhZHUgaW4gaXNvbGF0aW9uIGlmIHRo
ZSBwcm92aWRlciBvZiB0aGUgZGV2aWNldHJlZSBoYXMKPiA+ID4gYWN0dWFsbHkgdHVybmVkIG9u
IFN2YWR1PyBUaGUgYmluZGluZyBzYXlzICJ0aGUgZGVmYXVsdCBiZWhhdmlvdXIiLCBidXQKPiA+
ID4gaXQgaXMgbm90IHRoZSAiZGVmYXVsdCIgYmVoYXZpb3VyLCB0aGUgYmVoYXZpb3VyIGlzIGEg
bXVzdCBBRkFJQ1QuIElmCj4gPiA+IHlvdSBzZXQgU3ZhZHUgaW4gaXNvbGF0aW9uLCB5b3UgL211
c3QvIGhhdmUgdHVybmVkIGl0IG9uLiBJZiB5b3Ugc2V0Cj4gPiA+IFN2YWR1IGFuZCBTdmFkZSwg
eW91IG11c3QgaGF2ZSBTdmFkdSB0dXJuZWQgb2ZmPwo+ID4KPiA+IFllcywgdGhlIHdvcmRpbmcg
c2hvdWxkIGJlIG1vcmUgb2YgcmVxdWlyZW1lbnQgc3R5bGUgdXNpbmcKPiA+IG11c3Qgb3IgbWF5
Lgo+ID4KPiA+IEhvdyBhYm91dCB0aGlzID8KPgo+IEknbSBtb3N0bHkganVzdCArMSdpbmcgZXZl
cnl0aGluZyBiZWxvdywgYnV0IHdpdGggYSBtaW5vciB3b3JkaW5nIGNoYW5nZQo+IHN1Z2dlc3Rp
b24KPgo+ID4gMSkgQm90aCBTdmFkZSBhbmQgU3ZhZHUgbm90IHByZXNlbnQgaW4gRFQgPT4gU3Vw
ZXJ2aXNvciBtYXkKPgo+IE5laXRoZXIgU3ZhZGUgbm9yIFN2YWR1IHByZXNlbnQuLi4KPgo+ID4g
ICAgIGFzc3VtZSBTdmFkZSB0byBiZSBwcmVzZW50IGFuZCBlbmFibGVkIG9yIGl0IGNhbiBkaXNj
b3Zlcgo+ID4gICAgIGJhc2VkIG9uIG12ZW5kb3JpZCwgbWFyY2hpZCwgYW5kIG1pbXBpZC4KPiA+
IDIpIE9ubHkgU3ZhZGUgcHJlc2VudCBpbiBEVCA9PiBTdXBlcnZpc29yIG11c3QgYXNzdW1lIFN2
YWRlCj4gPiAgICAgdG8gYmUgYWx3YXlzIGVuYWJsZWQuIChPYnZpb3VzKQo+ID4gMykgT25seSBT
dmFkdSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdCBhc3N1bWUgU3ZhZHUKPiA+ICAg
ICB0byBiZSBhbHdheXMgZW5hYmxlZC4gKE9idmlvdXMpCj4gPiA0KSBCb3RoIFN2YWRlIGFuZCBT
dmFkdSBwcmVzZW50IGluIERUID0+IFN1cGVydmlzb3IgbXVzdAo+ID4gICAgIGFzc3VtZSBTdmFk
dSB0dXJuZWQtb2ZmIGF0IGJvb3QgdGltZS4gVG8gdXNlIFN2YWR1LCBzdXBlcnZpc29yCj4gPiAg
ICAgbXVzdCBleHBsaWNpdGx5IGVuYWJsZSBpdCB1c2luZyB0aGUgU0JJIEZXRlQgZXh0ZW5zaW9u
Lgo+ID4KPiA+IElNTywgdGhlICMyIGFuZCAjMyBhcmUgZGVmaW5pdGVseSBvYnZpb3VzIGJ1dCBz
dGlsbCB3b3J0aCBtZW50aW9uaW5nLgo+Cj4gVGhhbmtzLAo+IGRyZXcKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
