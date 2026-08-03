Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5CCCC55184
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 08:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ok5qHBRilfKWxMdfKwSQlKabiZPc+UlQgZhddzbacco=; b=rF3Vvm9R43TUWt
	y35qsr7YoiQ4b+El+z1xqqrO7IZIYHtt9ft+9EctuItydG2mnMqS3eZ7ptvwS9w6i69W6cF/rTyyu
	lPjb68SQ7x8fDA+EOF+M8nonqmrsGearzKxtNMLMC0GRcPbsGPTG5ER0H1xZTZwws+UDfIo3twjKo
	/nfxzKb0NbRDt0kfPtxhBUeoFrv1CaeB1t8hy5PKXukBpXFrVYvFCWom6cItWwyKCwVP43yIfabar
	xNKH+ghsetTLLJc13V/Jy+5x5mK2g+p2xZrQb6Kj5zMuCr31w/StsVQ8K//Ll3vC9BczempSDYiY0
	c0BKaWOks410KshQkVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnlS-0000000GaJW-0CUt;
	Mon, 03 Aug 2026 08:11:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnlQ-0000000GaJQ-0VXM
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 08:11:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2086560A62
	for <linux-riscv@lists.infradead.org>; Mon,  3 Aug 2026 08:11:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B757E1F0155A
	for <linux-riscv@lists.infradead.org>; Mon,  3 Aug 2026 08:11:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785744670;
	bh=1b9nrSK95yZpqNOCATuK8srF+lYk8+rYEDNNrA4wHQM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HFYLMkDhLfR+H8zUyTNVXWLpekoG8c30DS3FrIo8lG8X14QGybtCiwO87YJVh7A6H
	 5KpHSzeoDcgSoTN4r480+DY2wL018G4/mgmU4tTyaq2kCvKuzZhviuOo+eCHDNagEM
	 jo1p05dV7zCX6Wdrx0XsFJnmSTJ+WzoTXuQmE8lu5w0SDDNPWoet+gViBvHDtLUT8J
	 usQJyrrD5u0q2LSsH8UgSCQy0mXNJxeJX34Zd+1YfDgbVuUGnEGlKuPgCw83VEjqcc
	 NKhUdOPYboTSPT99O2BQfaOxsWBqKvycfPOsyyCRpE0Q5Mz8H3+HHIY1A9M7b17joB
	 K1tbwcjsUgamQ==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-39c8dbf4ef0so28517541fa.2
        for <linux-riscv@lists.infradead.org>; Mon, 03 Aug 2026 01:11:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RodkaIc4Pd2MVNmuHFDxW2IIOKLGZcMj1htMS7gPx4hhEkJ06Oe2BOqwgWq2bSxA9hxK8jov4kk93jpiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzR6fIFwsYYO9R/FnumPVvXuYHpwqm8bukpTsxnsPHztyKbM6O1
	vJnwvhSP7ABqM+ywdwS7mRUA6e49tTgkNIxnO4JidVSaXzRujbn2BgM1C41g8iDqkPF8O1Wot9J
	HZO/9iL4/EQyrEvXfgNEGx/wChjl1rB8=
X-Received: by 2002:a05:651c:150a:b0:39f:a2be:bc3f with SMTP id
 38308e7fff4ca-39fa2bec180mr4076081fa.16.1785744669449; Mon, 03 Aug 2026
 01:11:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com>
 <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com> <ZQ2PR01MB121089A3224D22A573A0875BF2C92@ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQ2PR01MB121089A3224D22A573A0875BF2C92@ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 3 Aug 2026 10:10:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLn_vdk2VxupDRErNfqFNZbf7pimCrfnziRPTmDPm7toVw@mail.gmail.com>
X-Gm-Features: AUfX_myhWBOKTrh0pDXm3mErdt-aRaWUKZYTBMjotcYIiFbhzYYWetsahaD6aWE
Message-ID: <CAD++jLn_vdk2VxupDRErNfqFNZbf7pimCrfnziRPTmDPm7toVw@mail.gmail.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
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

T24gVGh1LCBKdWwgMzAsIDIwMjYgYXQgMTI6NTjigK9QTSBDaGFuZ2h1YW5nIExpYW5nCjxjaGFu
Z2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOgoKPiA+IElmIGEgcGluIGNvbnRy
b2xsZXIgYmFjay1lbmQgaXMgdXNlZCwgdGhlIEdQSU8gY29udHJvbGxlciBvciBoYXJkd2FyZQo+
ID4gZGVzY3JpcHRpb24gbmVlZHMgdG8gcHJvdmlkZSAiR1BJTyByYW5nZXMiIG1hcHBpbmcgdGhl
IEdQSU8gbGluZSBvZmZzZXRzIHRvCj4gPiBwaW4gbnVtYmVycyBvbiB0aGUgcGluIGNvbnRyb2xs
ZXIgc28gdGhleSBjYW4gcHJvcGVybHkgY3Jvc3MtcmVmZXJlbmNlIGVhY2gKPiA+IG90aGVyLiIK
Pgo+IEkgdHJpZWQgdGhpcyBjaGFuZ2UsIGJ1dCBpdCBkb2Vzbid0IHdvcmsuIEluIG15IG5ldyB2
ZXJzaW9uLCB0aGUgR1BJTyBkaXJlY3Rpb24gaXMgc2V0Cj4gdmlhIHRoZSBgc3RydWN0IHBpbm11
eF9vcHMgLmdwaW9fc2V0X2RpcmVjdGlvbmAgY2FsbGJhY2ssIHdoaWNoIGlzIGV4ZWN1dGVkIGFm
dGVyCj4gYG11dGV4X2xvY2soJnBjdGxkZXYtPm11dGV4KTtgLiBJIG5lZWQgdG8gY29uZmlndXJl
IHNvbWUgcGluY29uZiBzZXR0aW5ncyB3aGlsZQo+IHNldHRpbmcgdGhlIEdQSU8gZGlyZWN0aW9u
IGluc2lkZSBgLmdwaW9fc2V0X2RpcmVjdGlvbmAsIGZvciBleGFtcGxlOgo+Cj4gICAgIGNvbmZp
ZyA9IHBpbmNvbmZfdG9fY29uZmlnX3BhY2tlZChQSU5fQ09ORklHX0lOUFVUX0VOQUJMRSwgMCk7
Cj4gICAgIHJldCA9IHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnKGdjLCBncGlvLCBjb25maWcpOwo+
Cj4gSG93ZXZlciwgYHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnYCB3aWxsIGFnYWluIGFjcXVpcmUg
dGhlIGxvY2sgd2l0aAo+IGBtdXRleF9sb2NrKCZwY3RsZGV2LT5tdXRleCk7YC4KPgo+IFNvIHRo
aXMgYXBwcm9hY2ggbWF5IG5vIGxvbmdlciB3b3JrPwoKSSBjYW4ndCBzZWUgYWxsIHlvdXIgY29k
ZSBzbyBJIGRvbid0IGtub3cgZXhhY3RseSB3aHkgdGhpcyBoYXBwZW5zLCBidXQKbm9taW5hbGx5
IHlvdSBpbXBsZW1lbnQgdGhlIEdQSU8gaGVscGVyczoKCnN0cnVjdCBwaW5tdXhfb3BzIHsKKC4u
LikKICAgICAgICBpbnQgKCpncGlvX3JlcXVlc3RfZW5hYmxlKSAoc3RydWN0IHBpbmN0cmxfZGV2
ICpwY3RsZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGlu
Y3RybF9ncGlvX3JhbmdlICpyYW5nZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgdW5zaWduZWQgaW50IG9mZnNldCk7CiAgICAgICAgdm9pZCAoKmdwaW9fZGlzYWJsZV9mcmVl
KSAoc3RydWN0IHBpbmN0cmxfZGV2ICpwY3RsZGV2LAogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIHN0cnVjdCBwaW5jdHJsX2dwaW9fcmFuZ2UgKnJhbmdlLAogICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQpOwogICAgICAgIGludCAo
KmdwaW9fc2V0X2RpcmVjdGlvbikgKHN0cnVjdCBwaW5jdHJsX2RldiAqcGN0bGRldiwKICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGluY3RybF9ncGlvX3JhbmdlICpy
YW5nZSwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgb2Zm
c2V0LAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJvb2wgaW5wdXQpOwoKVGhl
biBvbiB0aGUgR1BJTyBzaWRlOgoKc3RhdGljIGludCBteV9ncGlvX2RpcmVjdGlvbl9pbnB1dChz
dHJ1Y3QgZ3Bpb19jaGlwICpjaGlwLCB1bnNpZ25lZCBpbnQgb2Zmc2V0KQp7CiAgICAgICAgcmV0
dXJuIHBpbmN0cmxfZ3Bpb19kaXJlY3Rpb25faW5wdXQoY2hpcCwgb2Zmc2V0KTsKfQoKc3RhdGlj
IGludCBteV9ncGlvX2RpcmVjdGlvbl9vdXRwdXQoc3RydWN0IGdwaW9fY2hpcCAqY2hpcCwgdW5z
aWduZWQgaW50IG9mZnNldCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aW50IHZhbHVlKQp7CiAgICAgICAgaW50IHJldDsKCiAgICAgICAgcmV0ID0gbXlfZ3Bpb19zZXQo
Y2hpcCwgb2Zmc2V0LCB2YWx1ZSk7CiAgICAgICAgaWYgKHJldCkKICAgICAgICAgICAgICAgIHJl
dHVybiByZXQ7CgogICAgICAgIHJldHVybiBwaW5jdHJsX2dwaW9fZGlyZWN0aW9uX291dHB1dChj
aGlwLCBvZmZzZXQpOwp9CgpzdGF0aWMgY29uc3Qgc3RydWN0IGdwaW9fY2hpcCBteV9ncGlvX2No
aXAgPSB7CiAgICAgICAgLmRpcmVjdGlvbl9pbnB1dCA9IG15X2dwaW9fZGlyZWN0aW9uX2lucHV0
LAogICAgICAgIC5kaXJlY3Rpb25fb3V0cHV0ID0gbXlfZ3Bpb19kaXJlY3Rpb25fb3V0cHV0LAog
ICAgICAgIC5zZXRfY29uZmlnID0gZ3Bpb2NoaXBfZ2VuZXJpY19jb25maWcsCn07CgpBbmQgdGhl
c2Ugd2lsbCBjYWxsIGludG8gdGhlIHBpbiBjb250cm9sbGVyIGJhY2tlbmQgZm9yIHlvdSwgc28g
eW91IGRvIG5vdApuZWVkIHRvIHNldCB0aGlzIHlvdXJzZWxmPwoKWW91cnMsCkxpbnVzIFdhbGxl
aWoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
