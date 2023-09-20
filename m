Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7F2DCE79AB
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWE6oQbGWWfBMjgYBRiyPuQ4Z/7aAcnl2qm9DI/rfQI=; b=RKqfcd277opknk
	WJh/loLFmKKCa52MAS2JD7MJQdLrVUu8xdYdjt/slvKMzim5yalNoxurtMH2bUJ59cnKc/cVYr9D9
	/HkEIgnc6rMyhurZaBGW/FNMeYggANUXOReGSon8dO9f22XwSKLR9e29epOYX1RmBGV52BqeGq9c7
	z1OCaaI8Dx3Ja9XZwuzy1o6iSH82PtI20cXIFJF9F7HUMWrUSD9Nw/ppQdbED5dOZhAvQVkYa85Sb
	uVuPEM/2svHKB/1FphsfH0qs6TubzciLmHR1I8OV2GPUNF9EY4MXgsvdSuYcV5JfMqFyhroTlqlWu
	DTwbtsyVIPO8mR1aQ8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirsN-002AKE-0v;
	Wed, 20 Sep 2023 07:43:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirsK-002AJ3-11
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:43:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A949FCE19A1
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:43:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD71C433CD
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:43:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695195832;
	bh=wHmXgn83h8NuefG1j3vWq4VR1WzTwO3eqaG3oocDVB0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=gRgSZU6x3azX5ElS1nYcLxlZWZ7QSDkZsepTwRi+qF3TCSaQ+o1LcYUjQ5+k7gTJH
	 Gk/qpf7/LHUv6AdRbxH3YCVm8tnLYp/iKZultE8y0z5Gi30vHrpwZATUUJQ/bPvjLY
	 1ceHeMFLlmdCIw7lRAihr0RiTuQ64OFmYdMYOTlCBcifFlJuhzfVh0jvKghBzJWf7y
	 gJUBdmtQictjoL615hAx5KNZQqQ35BZNIp/fR38JcM7LtqI+DxQG4OSk0I4tkXNOPr
	 Kxo/7vmrd/IVfUQv/1cUFJHT5YHvEkOmHZT55ecFB1cM95LfycWRg7G7h9NaH4QIU/
	 Kpy+G2fH57lVA==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2bfb17435e4so105548881fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:43:52 -0700 (PDT)
X-Gm-Message-State: AOJu0Yy4warCykQfTUFQODdakD/c1KmHpOSJ8FAhur9txMqQpPnPC8Qh
	4jmgA16WaJ4sV0KEx1OiqYKYa5ZexfF2D8my7xo=
X-Google-Smtp-Source: AGHT+IFeyS4faWN5sjvWZz1M6kYCPecf5m3kGaQeSQ8YguuVePOuPu3fhfpHheT/C7M40FSL02w8GohuN7y0mMIsWuk=
X-Received: by 2002:a2e:9f4f:0:b0:2b9:f27f:e491 with SMTP id
 v15-20020a2e9f4f000000b002b9f27fe491mr1599633ljk.42.1695195830591; Wed, 20
 Sep 2023 00:43:50 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <c6aea83bb1df563b1f2a66c5f230c3861aed1e15.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:43:39 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQntuknORHf2QC5YHX1ZMSRz3b3e+fsE1uZ4AuchB94SA@mail.gmail.com>
Message-ID: <CAJF2gTQntuknORHf2QC5YHX1ZMSRz3b3e+fsE1uZ4AuchB94SA@mail.gmail.com>
Subject: Re: [PATCH v2 03/11] dt-bindings: riscv: add sophgo sg2042 bindings
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004356_691720_84804808 
X-CRM114-Status: GOOD (  16.55  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjozOOKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgRFQgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciB0aGUg
U29waGdvIFNHMjA0MiBTb2MgWzFdIGFuZCB0aGUKPiBNaWxrLVYgUGlvbmVlciBib2FyZCBbMl0u
Cj4KPiBbMV06IGh0dHBzOi8vZW4uc29waGdvLmNvbS9wcm9kdWN0L2ludHJvZHVjZS9zZzIwNDIu
aHRtbAo+IFsyXTogaHR0cHM6Ly9taWxrdi5pby9waW9uZWVyCj4KPiBBY2tlZC1ieTogQ2hhbyBX
ZWkgPGNoYW8ud2VpQHNvcGhnby5jb20+Cj4gQWNrZWQtYnk6IFhpYW9ndWFuZyBYaW5nIDx4aWFv
Z3VhbmcueGluZ0Bzb3BoZ28uY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZyA8d2FuZ2No
ZW4yMEBpc2Nhcy5hYy5jbj4KPiAtLS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
c29waGdvLnlhbWwgICAgIHwgMjggKysrKysrKysrKysrKysrKysrKwo+ICBNQUlOVEFJTkVSUyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgNyArKysrKwo+ICAyIGZpbGVzIGNo
YW5nZWQsIDM1IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zb3BoZ28ueWFtbAo+Cj4gZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zb3BoZ28ueWFtbCBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9zb3BoZ28ueWFtbAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAwMDAwLi44MjQ2OGFlOTE1ZGIKPiAtLS0g
L2Rldi9udWxsCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L3NvcGhnby55YW1sCj4gQEAgLTAsMCArMSwyOCBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlm
aWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+
ICskaWQ6IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL3Jpc2N2L3NvcGhnby55YW1sIwo+
ICskc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMK
PiArCj4gK3RpdGxlOiBTb3BoZ28gU29DLWJhc2VkIGJvYXJkcwo+ICsKPiArbWFpbnRhaW5lcnM6
Cj4gKyAgLSBDaGFvIFdlaSA8Y2hhby53ZWlAc29waGdvLmNvbT4KPiArICAtIFhpYW9ndWFuZyBY
aW5nIDx4aWFvZ3VhbmcueGluZ0Bzb3BoZ28uY29tPgo+ICsKPiArZGVzY3JpcHRpb246Cj4gKyAg
U29waGdvIFNvQy1iYXNlZCBib2FyZHMKPiArCj4gK3Byb3BlcnRpZXM6Cj4gKyAgJG5vZGVuYW1l
Ogo+ICsgICAgY29uc3Q6ICcvJwo+ICsgIGNvbXBhdGlibGU6Cj4gKyAgICBvbmVPZjoKPiArICAg
ICAgLSBpdGVtczoKPiArICAgICAgICAgIC0gZW51bToKPiArICAgICAgICAgICAgICAtIG1pbGt2
LHBpb25lZXIKPiArICAgICAgICAgIC0gY29uc3Q6IHNvcGhnbyxzZzIwNDIKPiArCj4gK2FkZGl0
aW9uYWxQcm9wZXJ0aWVzOiB0cnVlCj4gKwo+ICsuLi4KPiBkaWZmIC0tZ2l0IGEvTUFJTlRBSU5F
UlMgYi9NQUlOVEFJTkVSUwo+IGluZGV4IDkwZjEzMjgxZDI5Ny4uYjc0ZDUwNTAwM2UyIDEwMDY0
NAo+IC0tLSBhL01BSU5UQUlORVJTCj4gKysrIGIvTUFJTlRBSU5FUlMKPiBAQCAtMjAwNjMsNiAr
MjAwNjMsMTMgQEAgRjogICAgIGRyaXZlcnMvY2hhci9zb255cGkuYwo+ICBGOiAgICAgZHJpdmVy
cy9wbGF0Zm9ybS94ODYvc29ueS1sYXB0b3AuYwo+ICBGOiAgICAgaW5jbHVkZS9saW51eC9zb255
LWxhcHRvcC5oCj4KPiArU09QSEdPIERFVklDRVRSRUVTCj4gK006ICAgICBYaWFvZ3VhbmcgWGlu
ZyA8eGlhb2d1YW5nLnhpbmdAc29waGdvLmNvbT4KPiArTTogICAgIENoYW8gV2VpIDxjaGFvLndl
aUBzb3BoZ28uY29tPgo+ICtTOiAgICAgTWFpbnRhaW5lZAo+ICtGOiAgICAgRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L3NvcGhnby55YW1sCj4gK0Y6ICAgICBhcmNoL3Jp
c2N2L2Jvb3QvZHRzL3NvcGhnby8KPiArCj4gIFNPVU5ECj4gIE06ICAgICBKYXJvc2xhdiBLeXNl
bGEgPHBlcmV4QHBlcmV4LmN6Pgo+ICBNOiAgICAgVGFrYXNoaSBJd2FpIDx0aXdhaUBzdXNlLmNv
bT4KPiAtLQo+IDIuMjUuMQo+CkxHVE0KClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5Aa2Vy
bmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
