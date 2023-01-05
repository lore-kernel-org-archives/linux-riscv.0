Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40FF5C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 22:33:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U8pYwztY4cUPALyYXE+Wu7dc5kO/+MOXlj/h2gojixc=; b=1bGYgJObJl1fsn
	EmTRMpJlTf8M+OqnhcDLvz/mXlY/8laCMyCuoNctMbvMPYEsmpXckrtYqIaA5Er9OWrTSBO2y3O25
	9sqkm9ez+qlc5IoEJhgZrGOFmnfZAuQW1IlrOTC69U/M3849hHGzWaETjpn/FrOaSdOc76QXKqgXc
	+H6m26taFtpjL3aAvczGPEw0DK7XJQJddXmXurm/ZsTYw9DflFpydmM2YSngfhx4wOeUqsNuMBpT5
	V6F9OFzDj3hA2g8HLZPdZzSlcPCnjDPUlhqdXiKPrF9F8vof+YZCmfNTgxe1QKqyUKJMY9JLCv/T4
	9hRZoa1J/HP0uGzTHydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDYnL-00FdOb-G9; Thu, 05 Jan 2023 22:33:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDVHh-00DokL-8s; Thu, 05 Jan 2023 18:48:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=FU9BexSvyi2rD+vcAVXhDiB0sHcYopPemd1xbDcQCCM=; b=pe1Ebf5dPNldNGSLN4ZTlyzW3t
	XguXGnAs5sFYt4CXQ9ferUVm/Og0Zs45bs4ad0mfZ6QRVSY9ygBlXj5RAyRC1yowEpSuP/3inQL2l
	hRs9pSTwBFoIMZ1UKJCSwUkqdgOAZvfBR9B0cLk8a3hnFOfZYjCNt1PLf5kGrlQlfiaEk9rE/xkDk
	zAqhzlJ1IinSJ9N67Ms8T21bRyPKgXX+OzXhCeWy5G5FKZgroxjOghiq6qXIhXyF3rEiEmBE1L3o9
	U0ePHzqktF2g74hhpVu2YeI/OdbIEtvAyc+nPf2gMFlJukURwC9EoUA+GG6ooXVV52qrd8ah4GmZ0
	qfoNyG8Q==;
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pDT0A-001Tqt-17;
	Thu, 05 Jan 2023 16:22:00 +0000
Received: by mail-ej1-x62e.google.com with SMTP id fc4so91123127ejc.12;
        Thu, 05 Jan 2023 08:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FU9BexSvyi2rD+vcAVXhDiB0sHcYopPemd1xbDcQCCM=;
        b=ZzmV1s9fsOiFn3LejpZMBW4u+pf0+ZsDVki4sSrDBfhDl+80zywTBkT2FEzzYYPBi8
         JmEKj/3Qtjl+IaRZADQxPPtnnv2nKTIrrFX2o2FHjpaitSARP8JPauqYKgrkHW1UvnDo
         c4f/TcKWlNL8MZgrKbZIB6+uzR7o51Romu8B8t0kqV685+x5Mh6USO9dHK+mR+2yHTS4
         SdXlYi99kkgubU0p0EGJppw545xOeurgrgnbHVfnJNVnrp/RMu67JcDiQF+Fy3dOHG+t
         Z1aQSAVwxxQiIVCyKOJiFkr6Xb6WAWvptnENqrE0UMtxZt/wJoSGIWImm4TGLjKgLw97
         fyFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FU9BexSvyi2rD+vcAVXhDiB0sHcYopPemd1xbDcQCCM=;
        b=Rq7+HVoaoQOANuRunmGTwAzc0yMgjxnYe5RO7CE4ae/tdrLH5bbzbGBt/hehka2UL2
         nsAN7gDBI3ymBw89zwlwAYwjgEXhJ3Bt59PYIivdffJ5kcMBkjsVC6JsonTLnd3scWsd
         MUoJYApeegyy/xarNd7CjH6CerqYhE2bKpy1NsynVMrEzC1qxcP/BnjKDOyEZ2IYyFcP
         VF/YetqABlSlVLXhiqeyz8g96dCbijWw64fsAcj2Q2DuJjSMVLnVKLpYA7h0I8SIqHnz
         Yayc/P6VhX3NuTvGYUiw2GTCed3phR102+BvO4+JMApitYh+3Sosu0r0GS7pKY8V8Krf
         1Odw==
X-Gm-Message-State: AFqh2koWgAUlHOD9v9U7deF3Sn6naUVOxrHhmy4wyq+dWp9aNzXeRtdc
	0SyAGVEsA93yqbwTmTJ9Zzo=
X-Google-Smtp-Source: AMrXdXsD2peymLRAR8nXx7rxyHoJqIkfQ1+TstQthZ56mRCZ9BQTT+slxB9DzT9NnHO//D+Rg/RyuA==
X-Received: by 2002:a17:906:b108:b0:843:a9fe:f115 with SMTP id u8-20020a170906b10800b00843a9fef115mr46900892ejy.32.1672935722636;
        Thu, 05 Jan 2023 08:22:02 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id r18-20020a170906549200b007c0b28b85c5sm16503224ejo.138.2023.01.05.08.21.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jan 2023 08:22:01 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Maxime Ripard <mripard@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 4/4] riscv: dts: allwinner: d1: Add video engine node
Date: Thu, 05 Jan 2023 17:21:58 +0100
Message-ID: <4767366.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <3b6ec431-70ac-cf68-6f46-9dc0affb1e68@sholland.org>
References:  <20221231164628.19688-1-samuel@sholland.org> <Y7aiZdjI8L5h1Ca3@aptenodytes>
 <3b6ec431-70ac-cf68-6f46-9dc0affb1e68@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_162158_441080_D5E977EB 
X-CRM114-Status: GOOD (  19.85  )
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

RG5lIMSNZXRydGVrLCAwNS4gamFudWFyIDIwMjMgb2IgMTU6Mzg6MzYgQ0VUIGplIFNhbXVlbCBI
b2xsYW5kIG5hcGlzYWwoYSk6Cj4gSGkgUGF1bCwKPiAKPiBPbiAxLzUvMjMgMDQ6MTEsIFBhdWwg
S29jaWFsa293c2tpIHdyb3RlOgo+ID4gT24gU2F0IDMxIERlYyAyMiwgMTA6NDYsIFNhbXVlbCBI
b2xsYW5kIHdyb3RlOgo+ID4+IEQxIGNvbnRhaW5zIGEgdmlkZW8gZW5naW5lIHdoaWNoIGlzIHN1
cHBvcnRlZCBieSB0aGUgQ2VkcnVzIGRyaXZlci4KPiA+IAo+ID4gRG9lcyBpdCB3b3JrICJvdXRz
aWRlIHRoZSBib3giIHdpdGhvdXQgcG93ZXIgZG9tYWluIG1hbmFnZW1lbnQ/Cj4gPiBJZiBub3Qs
IGl0IG1pZ2h0IGJlIGEgYml0IGNvbmZ1c2luZyB0byBhZGQgdGhlIG5vZGUgYXQgdGhpcyBwb2lu
dC4KPiAKPiBZZXMsIGl0IGRvZXMuIEFsbCBvZiB0aGUgcG93ZXIgZG9tYWlucyBhcmUgZW5hYmxl
ZCBieSBkZWZhdWx0LiBIb3dldmVyLAo+IGlmIHRoZSBQUFUgc2VyaWVzIGlzIG1lcmdlZCBmaXJz
dCwgSSB3aWxsIHJlc3BpbiB0aGlzIHRvIGluY2x1ZGUgdGhlCj4gcG93ZXItZG9tYWlucyBwcm9w
ZXJ0eSBmcm9tIHRoZSBiZWdpbm5pbmcuCgpJIHdvdWxkIHJhdGhlciBzZWUgdGhhdCBtZXJnZWQg
YmVmb3JlIGFuZCBoYXZpbmcgY29tcGxldGUgbm9kZSByaWdodCBhd2F5LgoKSSd2ZSBiZWVuIGF3
YXksIGJ1dCBJJ2xsIG1lcmdlIGV2ZXJ5dGhpbmcgdGhhdCdzIHJlYWR5IGZvciBzdW54aSB0cmVl
IHVudGlsIAplbmQgb2YgdGhlIHdlZWtlbmQuCgpCZXN0IHJlZ2FyZHMsCkplcm5lagoKPiAKPiBS
ZWdhcmRzLAo+IFNhbXVlbAo+IAo+ID4+IFNpZ25lZC1vZmYtYnk6IFNhbXVlbCBIb2xsYW5kIDxz
YW11ZWxAc2hvbGxhbmQub3JnPgo+ID4+IC0tLQo+ID4+IAo+ID4+ICBhcmNoL3Jpc2N2L2Jvb3Qv
ZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpIHwgMTEgKysrKysrKysrKysKPiA+PiAg
MSBmaWxlIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKykKPiA+PiAKPiA+PiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+ID4+IGIv
YXJjaC9yaXNjdi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBpbmRleAo+
ID4+IGRmZjM2M2EzYzkzNC4uNGJkMzc0Mjc5MTU1IDEwMDY0NAo+ID4+IC0tLSBhL2FyY2gvcmlz
Y3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kKPiA+PiArKysgYi9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gPj4gQEAgLTM0
LDYgKzM0LDE3IEBAIHNvYyB7Cj4gPj4gCj4gPj4gIAkJI2FkZHJlc3MtY2VsbHMgPSA8MT47Cj4g
Pj4gIAkJI3NpemUtY2VsbHMgPSA8MT47Cj4gPj4gCj4gPj4gKwkJdmU6IHZpZGVvLWNvZGVjQDFj
MGUwMDAgewo+ID4+ICsJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGktZDEtdmlkZW8t
CmVuZ2luZSI7Cj4gPj4gKwkJCXJlZyA9IDwweDFjMGUwMDAgMHgyMDAwPjsKPiA+PiArCQkJaW50
ZXJydXB0cyA9IDxTT0NfUEVSSVBIRVJBTF9JUlEoNjYpIApJUlFfVFlQRV9MRVZFTF9ISUdIPjsK
PiA+PiArCQkJY2xvY2tzID0gPCZjY3UgQ0xLX0JVU19WRT4sCj4gPj4gKwkJCQkgPCZjY3UgQ0xL
X1ZFPiwKPiA+PiArCQkJCSA8JmNjdSBDTEtfTUJVU19WRT47Cj4gPj4gKwkJCWNsb2NrLW5hbWVz
ID0gImFoYiIsICJtb2QiLCAicmFtIjsKPiA+PiArCQkJcmVzZXRzID0gPCZjY3UgUlNUX0JVU19W
RT47Cj4gPj4gKwkJfTsKPiA+PiArCj4gPj4gCj4gPj4gIAkJcGlvOiBwaW5jdHJsQDIwMDAwMDAg
ewo+ID4+ICAJCQo+ID4+ICAJCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGktZDEtcGlu
Y3RybCI7Cj4gPj4gIAkJCXJlZyA9IDwweDIwMDAwMDAgMHg4MDA+OwoKCgoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
