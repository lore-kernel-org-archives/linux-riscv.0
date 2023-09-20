Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB8E7CE79AE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 07:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rqtgWB3jCecLepz6dtqGCpCfHcKYm4Qizor+fJ+ZuSk=; b=hnsNkuic8ysUY8
	OIro8BO+XuAQw3G61x9mNUl4Bh+Ozq3Bljz9fW/C/vjzu8ourCAoMOuRQ/5MGhCmqNxAX9+EU8/JA
	Nygh7kgnHtXZ7ugik5atWw/yqWJ1M1d1S49+I7w3xM7hQGoZ8Aaca2Yn6IDbE8Rt3BQpSBsauJ6u6
	eNoyvMtd0C4JQKP71AEG05YEFI7cixZoyGytN1pAlgGgenMBxig4psxOVsnvtxlR7NLwXn8P1yOTp
	RIjxD9VUHQQSPwEkhY8dzAvSBSU1L31yt06p3MA2k6EVV/1T+5ZfD3nTjruVdlAAkHyMTxtwEYS49
	ZECJjdMrxMvfUgroDyEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qirtI-002AbV-1a;
	Wed, 20 Sep 2023 07:44:56 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qirtG-002AaU-18
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 07:44:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DDEC561A15
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:44:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9982FC433C9
	for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695195893;
	bh=CUy5nbKHvNNWzc7wvrdjNqIowVr8juKuzhQtXQtY0E8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VjVwMSo2BFQ4ZN94kcvqgFKI2LLphwE9j/2TCMlsGmkNvlE3NnRIx1RkWehvHIYMW
	 eKyxHvjiqjBBx6r4pk2N/maUiUyz9ETQs32ahwv6sDIG1holAZ9kQGnEXM6T6r/xIH
	 UPaJc9yJTP/2XNq/Y7MibBwp1oUEIzWa+/kIAAbtdAGJKrfdVU/dR9UqbK9VBDsLAX
	 R1AG8VTwr0woMnc8S8SdQjpoxPFOzt52xzObAn7usRq8bGZnafNQm822jcxEm9Ig1f
	 zUncMMPOE5VA0PCQvv4Dih/istjfmBiyQlsr3pnbjtC7lTtEKgYp0epV9DEhRs6tDS
	 ITF2nWd/UULbA==
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-9ada609bb62so838618466b.2
        for <linux-riscv@lists.infradead.org>; Wed, 20 Sep 2023 00:44:53 -0700 (PDT)
X-Gm-Message-State: AOJu0Ywr0UHl7aYxLhJxnqZRSdzsUazd5LQGbj56iJe8VR+ohpIsnsUC
	+mmwj6V4VhzqPZUp7znXTrPQTRQUfxkkd2/j1Fc=
X-Google-Smtp-Source: AGHT+IF2n/KDXrUAYLrBICpVZHiK7Hkrk5C0+YyZ+GUHHWrlPX11eVtSbZh+/iRJVkdhpD139PNbaZUBqWCbIdzdLL4=
X-Received: by 2002:a17:906:300e:b0:9a1:bebc:8282 with SMTP id
 14-20020a170906300e00b009a1bebc8282mr1435848ejz.32.1695195891933; Wed, 20 Sep
 2023 00:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1695189879.git.wangchen20@iscas.ac.cn> <c5061fbe8ef9c4971cd45de7b5d8408dc1b848b4.1695189879.git.wangchen20@iscas.ac.cn>
In-Reply-To: <c5061fbe8ef9c4971cd45de7b5d8408dc1b848b4.1695189879.git.wangchen20@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 20 Sep 2023 15:44:40 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTfpG=Hy9bhPjLVVvSt-t=Hgu2GFm_V8-VRLuaCmSpv0g@mail.gmail.com>
Message-ID: <CAJF2gTTfpG=Hy9bhPjLVVvSt-t=Hgu2GFm_V8-VRLuaCmSpv0g@mail.gmail.com>
Subject: Re: [PATCH v2 04/11] dt-bindings: riscv: Add T-HEAD C920 compatibles
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, conor@kernel.org, 
	devicetree@vger.kernel.org, emil.renner.berthing@canonical.com, 
	jszhang@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, robh+dt@kernel.org, 
	xiaoguang.xing@sophgo.com, Chen Wang <wangchen20@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230920_004454_434306_9622E7A9 
X-CRM114-Status: GOOD (  14.03  )
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
YWlsLmNvbT4gd3JvdGU6Cj4KPiBUaGUgQzkyMCBpcyBSSVNDLVYgQ1BVIGNvcmVzIGZyb20gVC1I
RUFEIFNlbWljb25kdWN0b3IuCj4gTm90YWJseSwgdGhlIEM5MjAgY29yZSBpcyB1c2VkIGluIHRo
ZSBTT1BIR08gU0cyMDQyIFNvQy4KPgo+IEFja2VkLWJ5OiBYaWFvZ3VhbmcgWGluZyA8eGlhb2d1
YW5nLnhpbmdAc29waGdvLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBDaGVuIFdhbmcgPHdhbmdjaGVu
MjBAaXNjYXMuYWMuY24+Cj4gLS0tCj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9yaXNjdi9jcHVzLnlhbWwgfCAxICsKPiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCsp
Cj4KPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVz
LnlhbWwKPiBpbmRleCAzOGMwYjUyMTM3MzYuLjE4NWEwMTkxYmFkNiAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3YvY3B1cy55YW1sCj4gKysrIGIv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMueWFtbAo+IEBAIC00
Nyw2ICs0Nyw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgICAgICAgLSBzaWZpdmUsdTc0LW1j
Cj4gICAgICAgICAgICAgICAgLSB0aGVhZCxjOTA2Cj4gICAgICAgICAgICAgICAgLSB0aGVhZCxj
OTEwCj4gKyAgICAgICAgICAgICAgLSB0aGVhZCxjOTIwClJldmlld2VkLWJ5OiBHdW8gUmVuIDxn
dW9yZW5Aa2VybmVsLm9yZz4KCj4gICAgICAgICAgICAtIGNvbnN0OiByaXNjdgo+ICAgICAgICAt
IGl0ZW1zOgo+ICAgICAgICAgICAgLSBlbnVtOgo+IC0tCj4gMi4yNS4xCj4KCgotLSAKQmVzdCBS
ZWdhcmRzCiBHdW8gUmVuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
