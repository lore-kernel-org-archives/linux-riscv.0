Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9BDDCE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vg29YioE3vPQXSfE79iov2iiDvQqd0jHMx29OibNALY=; b=j59hBgnBFATyII
	OdXSl3JWmqv2xkt7Xyv/Nu0i3p6rSCxdk+IyOfAW3SWoN8GhKOK8+CSTzfNRyI5enqwS7rg0rdGSE
	kkNxnwBvXNJkq5bVVym9pFVasTUcfGumouK9vtn+ZbEP+GcQ2aAuHPxSLhIYH/D6//fp4kW/35WMc
	1chU4otTXwcdTvPYirpfSlqR6gOQ+POR2LUr0mVJ1FokORLrOy2ocXUdrq1mS4yE/cCcFxtxbR+CG
	1Sp3L54qU1fOEKXZooc3Q/ZoduGJRDKWGirU0uZOrbXiucdurK12nMBEa01ir45cVTS61kP7zohZ9
	7YFrUQN4iQ/LYeXVylcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirtv-002AlB-0E;
	Wed, 20 Sep 2023 07:45:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirtr-002AkJ-2j
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:45:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id F0FB8CE19D5
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:45:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33269C43397
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695195928;
	bh=Cqn1BSH5uJ9UFmfiz+lI3Z6Y8WlRKov8M6GvwnSusx8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZH5TvVq4GRWBYtF8gqzpoEdrkMp88bh0+loNhly1YEpHTYnIc2tISMjgtjYjhWZDK
	 gmC4cFCro2rfi4LorOE7NEPba7vqn/T98CKUjjDFEweCspCw4fygzpvH8DzUPA1cpn
	 YOIUI6ddd4yWoIrp+vtb7pgBI9KUqxh7mBd+Pohn7Fz82AlG3mr50qg5YH/q0KCGg5
	 LBFdo+bd6S9ETqCMMpb2Z0NBFR8/N6TazJyO2F8udi20Ugkl87f57majNZCyN248WE
	 go5vlCA09Iz4rcoOU1Nn5yqVVOu4jmtcBiCHN6aFoL3I7QNcFBCIM37tYK+IOULUYW
	 Fvms0uJpXz4UA==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2bffa8578feso58301011fa.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:45:28 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywy9dmuDZUvUvlL/WBMqLT6IehYz1UAht+49Ly1cymKgQzEFoPY
	MkBXZqWjLprfA3to9A+NutLC7BsNzrC0OjrnDJ8=
X-Google-Smtp-Source: AGHT+IG6JH2f6GWH6UGZkLRmIfvUibe13MybdU9vWJevg2yLIo+A04ZzyShmljbSBOMPLRaIuGsPu24IY0wrnqr/JEs=
X-Received: by 2002:a05:651c:102c:b0:2bb:9847:d96e with SMTP id
 w12-20020a05651c102c00b002bb9847d96emr1350699ljm.9.1695195926393; Wed, 20 Sep
 2023 00:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <11eca9395bf730f41f142be2f8d26f527e36517b.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <11eca9395bf730f41f142be2f8d26f527e36517b.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:45:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQaXqWObZ+TQ=49WodHr0R9qEuuW_r5Tt65OTVDTdipZw@mail.gmail.com>
Message-ID: <CAJF2gTQaXqWObZ+TQ=49WodHr0R9qEuuW_r5Tt65OTVDTdipZw@mail.gmail.com>
Subject: Re: [PATCH v2 05/11] dt-bindings: interrupt-controller: Add SOPHGO's
 SG2042 PLIC
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004532_064697_301F6A3D 
X-CRM114-Status: GOOD (  12.77  )
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

T24gV2VkLCBTZXAgMjAsIDIwMjMgYXQgMjozOeKAr1BNIENoZW4gV2FuZyA8dW5pY29ybnh3QGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBBZGQgY29tcGF0aWJsZSBzdHJpbmcgZm9yIFNPUEhHTyBTRzIw
NDIgcGxpYy4KPgo+IEFja2VkLWJ5OiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1YW5nLnhpbmdAc29w
aGdvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHdhbmdjaGVuMjBAaXNjYXMuYWMu
Y24+Cj4gLS0tCj4gIC4uLi9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxp
Yy0xLjAuMC55YW1sICAgICAgICAgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspCj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2lu
dGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwgYi9Eb2N1bWVudGF0aW9u
L2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4w
LjAueWFtbAo+IGluZGV4IGRjMWYyOGU1NTI2Ni4uMTZmOWM0NzYwYzBmIDEwMDY0NAo+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9z
aWZpdmUscGxpYy0xLjAuMC55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEuMC4wLnlhbWwKPiBAQCAt
NjUsNiArNjUsNyBAQCBwcm9wZXJ0aWVzOgo+ICAgICAgICAtIGl0ZW1zOgo+ICAgICAgICAgICAg
LSBlbnVtOgo+ICAgICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjIwaS1kMS1wbGljCj4gKyAg
ICAgICAgICAgICAgLSBzb3BoZ28sc2cyMDQyLXBsaWMKPiAgICAgICAgICAgICAgICAtIHRoZWFk
LHRoMTUyMC1wbGljCj4gICAgICAgICAgICAtIGNvbnN0OiB0aGVhZCxjOTAwLXBsaWMKPiAgICAg
ICAgLSBpdGVtczoKPiAtLQo+IDIuMjUuMQo+ClJldmlld2VkLWJ5OiBHdW8gUmVuIDxndW9yZW5A
a2VybmVsLm9yZz4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBSZW4KCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
