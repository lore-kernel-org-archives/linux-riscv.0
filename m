Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CD42C27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 10:38:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuN9xqL4pd1UpHFmRSNK6vOqVu3LAUW09I6rW63E/lg=; b=wya3r+y58Ttd5N
	IUVZHMK4Noad550M0/YzUPX4uGx46pIqVyV6WY7gyqxpmxnppmauduRcw5zUjnazItqa6Yah9B0uR
	ag8TmeKi5wB+gRIVuA1QSA7aro1dTAtdKIMUAWPF/N9vGFZzJTslFIH1LT4cKW38WGuczR46061AQ
	sPpMDrAn4+Crb36z+ETysYC8sabCH+/hRld8dxHw4kp86FtaFkXwYynumh/cet/bHItKy1J/w8Raf
	exukI4/geU4/WQi9B6ArhJYt79kY/GXx4V6nU2HYg4y4A+NDs5m4CIq0k5xB10zl+rjhxk1pvwxB1
	k7n9vzPRG0E2d0+S3fVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWEY-0000000EP5T-31BF;
	Tue, 18 Jun 2024 10:38:39 +0000
Received: from mail-oa1-x35.google.com ([2001:4860:4864:20::35])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJWEN-0000000EOyI-3Ety
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 10:38:36 +0000
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-250ca14422aso2906862fac.0
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jun 2024 03:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1718707104; x=1719311904; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qq1vFxMrgUe3BHqjNbGzwCUUF1/CTlGHAYljkroSrGs=;
        b=Qs+CTvBmaxfvqpIcPCLM0/hGfU3N9Yy/jzDGDiMuQtMhbtuBCzmIUMnkBrt21/2q15
         o7AxGP0jwDRO7pD93hYUNzLpD/dCYWTVr0fX+ir6GPWFlL08altN6uDaox/2UBh4znsR
         as7SfX2KAdp7Oo3iisICL9X/68Z90IY7VtxBFmkJBkVKbOlHHPnqzxJUmgL7dCBIrsgm
         E+qTUHED6lIs+BQM/FeNk/B/D/q9viLDUW6pdQdcKMCmVbQgD+LagkNGqPTzIRBwcySD
         o52Lj06ecvq9Sl45fECegyQ7EN0RhRFH9+iCQuIR/tUmYVWLgKvEwEa17EMVEde1ND0Y
         98ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718707104; x=1719311904;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qq1vFxMrgUe3BHqjNbGzwCUUF1/CTlGHAYljkroSrGs=;
        b=QQxlWDqjOZhqHm6eqFLI3nXLE1mJ4xfP6xJ97NOxLHliA3uiOJjLmdYytER/cdpfFk
         U2D1IQY4FPMj24lDz+NWkvGM3pRybR2eGL9AMXTe4FRb9HPiTdp4GsJhW2kMtm3Njdsh
         NOZ4y2AwITHQmHMr6UI/vdn865AJK3qXYCHruc7xSPbkmDUpi07/tvssMF7vOh6hAbKj
         olHs3dy/n+DrnqQLbMfpPmOAKrdP1lteXtJG6SNJcPw0QxVhVfyJXh81rdNO/Dm9aowT
         EWvP+0qSJ7SmfTw2nCe+zdar7OaAhxs1eptMTxiKcBtncYgzv63rpTtxperFn4p26rfw
         mtHA==
X-Forwarded-Encrypted: i=1; AJvYcCWcBg8o2iIncZvJOhBSrQFkS8eVQTMtvrvBaMRNh5gGVh0XYh1pxCOfGjQNe259miMa6uG7d9iC/NCUmpKBMubS7zm7YTFbgpWHx+vJniX/
X-Gm-Message-State: AOJu0Yw9QkVkXxA1hOOqvD3PMokzZG1c+m9ZMqVgq2l99neqzL/DY2vh
	RXdriLI42zPKgmyh5hk2cM/wVE6nPr0voFf1kP/8EASkDP6nI/yHNUwwDb+9FY5VyPs+5Aaumz7
	rWkD+ECHJ+JqupEvz5WaGBhoy7+XKKs0wv57KFg==
X-Google-Smtp-Source: AGHT+IH2vZAzENDjSgV/6akmRJ7c2RZBHzcy/7oyoiwK4Myt+lBo2Y7nfaUbFeJ8Be+9iC0edhHwfsXFlrWYewHshLA=
X-Received: by 2002:a05:6870:b4a2:b0:254:88ea:6d90 with SMTP id
 586e51a60fabf-2584285855cmr13792436fac.2.1718707104411; Tue, 18 Jun 2024
 03:38:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-3-yongxuan.wang@sifive.com> <20240605-atrium-neuron-c2512b34d3da@spud>
In-Reply-To: <20240605-atrium-neuron-c2512b34d3da@spud>
From: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Date: Tue, 18 Jun 2024 18:38:13 +0800
Message-ID: <CAMWQL2gQpHPD=bPenjD+=NP47k8n26+6KP05zogxUtsD6zY6GQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: riscv: Add Svade and Svadu Entries
To: Conor Dooley <conor@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, apatel@ventanamicro.com, 
	alex@ghiti.fr, ajones@ventanamicro.com, greentime.hu@sifive.com, 
	vincent.chen@sifive.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_033829_528801_9B2E8799 
X-CRM114-Status: GOOD (  26.41  )
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

T24gVGh1LCBKdW4gNiwgMjAyNCBhdCAxMjo1NeKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBXZWQsIEp1biAwNSwgMjAyNCBhdCAwODoxNTowOFBNICsw
ODAwLCBZb25nLVh1YW4gV2FuZyB3cm90ZToKPiA+IEFkZCBlbnRyaWVzIGZvciB0aGUgU3ZhZGUg
YW5kIFN2YWR1IGV4dGVuc2lvbnMgdG8gdGhlIHJpc2N2LGlzYS1leHRlbnNpb25zCj4gPiBwcm9w
ZXJ0eS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZb25nLVh1YW4gV2FuZyA8eW9uZ3h1YW4ud2Fu
Z0BzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
ZXh0ZW5zaW9ucy55YW1sIHwgMzAgKysrKysrKysrKysrKysrKysrKwo+ID4gIDEgZmlsZSBjaGFu
Z2VkLCAzMCBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24v
ZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvZXh0ZW5zaW9ucy55YW1sCj4gPiBpbmRleCA0Njhj
NjQ2MjQ3YWEuLjFlMzA5ODg4MjZiOSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+ICsrKyBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9leHRlbnNpb25zLnlhbWwKPiA+IEBAIC0x
NTMsNiArMTUzLDM2IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgcmF0aWZpZWQgYXQg
Y29tbWl0IDNmOWVkMzQgKCJBZGQgYWJpbGl0eSB0byBtYW51YWxseSB0cmlnZ2VyCj4gPiAgICAg
ICAgICAgICAgd29ya2Zsb3cuICgjMikiKSBvZiByaXNjdi10aW1lLWNvbXBhcmUuCj4gPgo+ID4g
KyAgICAgICAgLSBjb25zdDogc3ZhZGUKPiA+ICsgICAgICAgICAgZGVzY3JpcHRpb246IHwKPiA+
ICsgICAgICAgICAgICBUaGUgc3RhbmRhcmQgU3ZhZGUgc3VwZXJ2aXNvci1sZXZlbCBleHRlbnNp
b24gZm9yIHJhaXNpbmcgcGFnZS1mYXVsdAo+ID4gKyAgICAgICAgICAgIGV4Y2VwdGlvbnMgd2hl
biBQVEUgQS9EIGJpdHMgbmVlZCBiZSBzZXQgYXMgcmF0aWZpZWQgaW4gdGhlIDIwMjQwMjEzCj4g
PiArICAgICAgICAgICAgdmVyc2lvbiBvZiB0aGUgcHJpdmlsZWdlZCBJU0Egc3BlY2lmaWNhdGlv
bi4KPiA+ICsKPiA+ICsgICAgICAgICAgICBCb3RoIFN2YWRlIGFuZCBTdmFkdSBleHRlbnNpb25z
IGNvbnRyb2wgdGhlIGhhcmR3YXJlIGJlaGF2aW9yIHdoZW4KPiA+ICsgICAgICAgICAgICB0aGUg
UFRFIEEvRCBiaXRzIG5lZWQgdG8gYmUgc2V0LiBUaGUgZGVmYXVsdCBiZWhhdmlvciBmb3IgdGhl
IGZvdXIKPiA+ICsgICAgICAgICAgICBwb3NzaWJsZSBjb21iaW5hdGlvbnMgb2YgdGhlc2UgZXh0
ZW5zaW9ucyBpbiB0aGUgZGV2aWNlIHRyZWUgYXJlOgo+ID4gKyAgICAgICAgICAgIDEuIE5laXRo
ZXIgc3ZhZGUgbm9yIHN2YWR1IGluIERUOiBkZWZhdWx0IHRvIHN2YWRlLgo+Cj4gSSB0aGluayB0
aGlzIG5lZWRzIHRvIGJlIGV4cGFuZGVkIG9uLCBhcyB0byB3aHkgbm90aGluZyBtZWFucyBzdmFk
ZS4KPgo+ID4gKyAgICAgICAgICAgIDIuIE9ubHkgc3ZhZGUgaW4gRFQ6IHVzZSBzdmFkZS4KPgo+
IFRoYXQncyBhIHN0YXRlbWVudCBvZiB0aGUgb2J2aW91cywgcmlnaHQ/Cj4KPiA+ICsgICAgICAg
ICAgICAzLiBPbmx5IHN2YWR1IGluIERUOiB1c2Ugc3ZhZHUuCj4KPiBUaGlzIGlzIG5vdCByZWxl
dmFudCBmb3IgU3ZhZGUuCj4KPiA+ICsgICAgICAgICAgICA0LiBCb3RoIHN2YWRlIGFuZCBzdmFk
dSBpbiBEVDogZGVmYXVsdCB0byBzdmFkZSAoTGludXggY2FuIHN3aXRjaCB0bwo+ID4gKyAgICAg
ICAgICAgICAgIHN2YWR1IG9uY2UgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUp
Lgo+Cj4gIlRoZSBwcml2aWxlZ2UgbGV2ZWwgdG8gd2hpY2ggdGhpcyBkZXZpY2V0cmVlIGhhcyBi
ZWVuIHByb3ZpZGVkIGNhbiBzd2l0Y2ggdG8KPiBTdmFkdSBpZiB0aGUgU0JJIEZXRlQgZXh0ZW5z
aW9uIGlzIGF2YWlsYWJsZSIuCj4KPiA+ICsgICAgICAgIC0gY29uc3Q6IHN2YWR1Cj4gPiArICAg
ICAgICAgIGRlc2NyaXB0aW9uOiB8Cj4gPiArICAgICAgICAgICAgVGhlIHN0YW5kYXJkIFN2YWR1
IHN1cGVydmlzb3ItbGV2ZWwgZXh0ZW5zaW9uIGZvciBoYXJkd2FyZSB1cGRhdGluZwo+ID4gKyAg
ICAgICAgICAgIG9mIFBURSBBL0QgYml0cyBhcyByYXRpZmllZCBhdCBjb21taXQgYzFhYmNjZiAo
Ik1lcmdlIHB1bGwgcmVxdWVzdAo+ID4gKyAgICAgICAgICAgICMyNSBmcm9tIHZlZC1yaXZvcy9y
YXRpZmllZCIpIG9mIHJpc2N2LXN2YWR1Lgo+ID4gKwo+ID4gKyAgICAgICAgICAgIEJvdGggU3Zh
ZGUgYW5kIFN2YWR1IGV4dGVuc2lvbnMgY29udHJvbCB0aGUgaGFyZHdhcmUgYmVoYXZpb3Igd2hl
bgo+ID4gKyAgICAgICAgICAgIHRoZSBQVEUgQS9EIGJpdHMgbmVlZCB0byBiZSBzZXQuIFRoZSBk
ZWZhdWx0IGJlaGF2aW9yIGZvciB0aGUgZm91cgo+ID4gKyAgICAgICAgICAgIHBvc3NpYmxlIGNv
bWJpbmF0aW9ucyBvZiB0aGVzZSBleHRlbnNpb25zIGluIHRoZSBkZXZpY2UgdHJlZSBhcmU6Cj4K
PiBAQW51cC9EcmV3L0FsZXgsIGFyZSB3ZSBtaXNzaW5nIHNvbWUgd29yZGluZyBpbiBoZXJlIGFi
b3V0IGl0IG9ubHkgYmVpbmcKPiB2YWxpZCB0byBoYXZlIFN2YWR1IGluIGlzb2xhdGlvbiBpZiB0
aGUgcHJvdmlkZXIgb2YgdGhlIGRldmljZXRyZWUgaGFzCj4gYWN0dWFsbHkgdHVybmVkIG9uIFN2
YWR1PyBUaGUgYmluZGluZyBzYXlzICJ0aGUgZGVmYXVsdCBiZWhhdmlvdXIiLCBidXQKPiBpdCBp
cyBub3QgdGhlICJkZWZhdWx0IiBiZWhhdmlvdXIsIHRoZSBiZWhhdmlvdXIgaXMgYSBtdXN0IEFG
QUlDVC4gSWYKPiB5b3Ugc2V0IFN2YWR1IGluIGlzb2xhdGlvbiwgeW91IC9tdXN0LyBoYXZlIHR1
cm5lZCBpdCBvbi4gSWYgeW91IHNldAo+IFN2YWR1IGFuZCBTdmFkZSwgeW91IG11c3QgaGF2ZSBT
dmFkdSB0dXJuZWQgb2ZmPwo+Cj4gPiArICAgICAgICAgICAgMS4gTmVpdGhlciBzdmFkZSBub3Ig
c3ZhZHUgaW4gRFQ6IGRlZmF1bHQgdG8gc3ZhZGUuCj4gPiArICAgICAgICAgICAgMi4gT25seSBz
dmFkZSBpbiBEVDogdXNlIHN2YWRlLgo+Cj4gVGhlc2UgdHdvIGFyZSBub3QgcmVsZXZhbnQgdG8g
U3ZhZHUsIEknZCBsZWF2ZSB0aGVtIG91dC4KPgo+ID4gKyAgICAgICAgICAgIDMuIE9ubHkgc3Zh
ZHUgaW4gRFQ6IHVzZSBzdmFkdS4KPgo+IEFnYWluLCBzdGF0ZW1lbnQgb2YgdGhlIG9idmlvdXM/
Cj4KPiA+ICsgICAgICAgICAgICA0LiBCb3RoIHN2YWRlIGFuZCBzdmFkdSBpbiBEVDogZGVmYXVs
dCB0byBzdmFkZSAoTGludXggY2FuIHN3aXRjaCB0bwo+ID4gKyAgICAgICAgICAgICAgIHN2YWR1
IG9uY2UgdGhlIFNCSSBGV0ZUIGV4dGVuc2lvbiBpcyBhdmFpbGFibGUpLgo+Cj4gU2FtZSBoZXJl
IGFzIGluIHRoZSBTdmFkZSBlbnRyeS4KPgo+IFRoYW5rcywKPiBDb25vci4KPgoKSGkgQ29ub3Is
CgpJIHdpbGwgdXBkYXRlIHRoZSBkZXNjcmlwdGlvbi4gVGhhbmsgeW91IQoKUmVnYXJkcywKWW9u
Zy1YdWFuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwps
aW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpo
dHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
