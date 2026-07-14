Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CDCC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 22:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a5w+yNHveOfStIhGD4owZL/FdUyyxVJzP37DF4kWBm4=; b=tdp3iejFNdVUkR
	OTZJtGS1UsNWDUEfUQN8cB7kB8XxcGPicyTUXA5retcx/+3NAzTfOL9mveAOMlFgMCrHp2BXpb65a
	5j+LzSJtMFWY15FthCR0/SS2C1zBdekfllgF/6AvOrsIr/MPwlGpZZV9vjsIkdNzf1Ea98JKYO0V8
	agGvfKuaQWKEw43mL14EFomCqX8p+MI0r3AciYaWNd+MSlhdNYE5Yc/Kvlg/bo438nFTYcRguiuPg
	qICBUwQft4KVPB3k5kF7zh6sbeQYP9K0na4D0yWsrdZ2In1m8R46ov0LR+gQuLPMeS9onCmaBVepg
	u/4Y1+bQs7/cE3zTTxeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlOH-0000000DOAY-2D6B;
	Tue, 14 Jul 2026 22:14:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjlOG-0000000DOA9-0Z1p
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 22:14:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6796E406D8
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DB041F00ADB
	for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 22:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784067251;
	bh=BLIsbd3rIu0q440Nh2W6RF4EH0NXixw4UPs/AFN2KRU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FaKgu+vB2YYShsFe2M1JXkalONH4g3PsMIU7elO6lSWiO9dMoJwlqx4j8W/8cPjYg
	 x+t2lVWhdjNNhMEYK4ngb8iqlT1Kj+JEQ/eCDilp9c4RWCuPiwkFuxCiatLqDGF5SL
	 2MOtduM7IRUQnPl2+LwD636S9a16tBhEDpCJaBLWK3zViZ4djKjamY+ToFzDEE/FFy
	 VAGAvB9TamK+/1fem6UcIodLpkiMqFiO/QyajNcoQu6P2ak6ssvHffzC3O7E81K1WG
	 GApTL//Y4RCUu/ta84KBQWM8VeimHtoQaOyZ/XPxfPQxb/EJi3FtHkRTc8dzmjVhZ3
	 7HsXS5GEem7zw==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c15ba3a2b4bso554588066b.1
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 15:14:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqSdUbz5e5nHldhCZZUoY4RD2rw8EmFSAFVF4oM2qO60cUHuC0vixmqprtOON9tdfcL2m+0SznYxo0Lqg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyDocDWi+uTyLPR9/hjnB2E+Gv/lyedUkMlG5k8BFHdCAncmgEu
	rIMsgQ+Y974Yp+E0AfVnhTcCBjNxwXhVOfYnJ74mkjmPpjuk8YlNS6HlERxICNuW8NCGlTQQB1t
	PZFm6hGsqhhBJDjutofJJRknlkZMWXA==
X-Received: by 2002:a17:907:97ca:b0:c12:73fd:a6cd with SMTP id
 a640c23a62f3a-c1661928df9mr370952366b.52.1784067249841; Tue, 14 Jul 2026
 15:14:09 -0700 (PDT)
MIME-Version: 1.0
References: <20260714-add-coresight-nodes-for-shikra-v1-0-b1cf85962455@oss.qualcomm.com>
 <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
In-Reply-To: <20260714-add-coresight-nodes-for-shikra-v1-2-b1cf85962455@oss.qualcomm.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 14 Jul 2026 17:13:58 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
X-Gm-Features: AUfX_myV2MEj_WnNpL4PNdWyXrVcH3TfBaO-6JJmtqnBFQREW3AFA5aOuTd8Dkw
Message-ID: <CAL_JsqLqbSrQKnnj2=57d-hFFeQ4xsDigLzmD-LHfufm=Mpp-Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: qcom: shikra: Add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
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

T24gTW9uLCBKdWwgMTMsIDIwMjYgYXQgODo1OOKAr1BNIEppZSBHYW4gPGppZS5nYW5Ab3NzLnF1
YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBBZGQgRFQgbm9kZXMgZm9yIHRoZSBDb3JlU2lnaHQgZGVi
dWcgYW5kIHRyYWNlIHN1YnN5c3RlbSBvbiBRdWFsY29tbQo+IFNoaWtyYSBTb0MuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKaWUgR2FuIDxqaWUuZ2FuQG9zcy5xdWFsY29tbS5jb20+Cj4gLS0tCj4gIGFy
Y2gvYXJtNjQvYm9vdC9kdHMvcWNvbS9zaGlrcmEuZHRzaSB8IDEyOTggKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAxIGZpbGUgY2hhbmdlZCwgMTI5OCBpbnNlcnRpb25zKCsp
CgpOQUsKCkZpeCB0aGUgc2FzaGlrbyBpc3N1ZS4KClJvYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
