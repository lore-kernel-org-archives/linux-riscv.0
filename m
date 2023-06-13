Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A9BEEB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 14:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQncCRDYeP/dWOxKd+LPki2nXz57m01URBJTFey9VS4=; b=ugvGgpXfZX5DVL
	WqTF132Qn2oCFWsbd57RjHQCZucvHcCF+Nnlfckq6pLSstar5oMBuRLojOkUVsWC9CdbJNukKcykD
	MNoy3K+O6Y0OuVazdLb04NZEa0ri7tFCBHoq+VUjtXlKe8yOyGHzityUH/GSIBvDJlLkmuw8pdMgM
	sDBn5lxMVeyHcmm2G9ahbm8UI5Lj438o67exJ6rcTkn9MzVZcyRMZ4UUVsprQYe9Hg0xibNLAK+3q
	1aHhpu8Ge0WOVit8hv+tQXHRFNjqZgqKLx7sh2pt3sBXPNt3jRDTsySnW3PSeDocnIXk1AJduSA2o
	utvUd70Ao+sICNjmueQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q94vD-008Ixa-1j;
	Tue, 13 Jun 2023 14:22:59 +0000
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q94v8-008IwK-32
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 14:22:58 +0000
Received: by mail-ua1-x92c.google.com with SMTP id a1e0cc1a2514c-784f7f7deddso431899241.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 07:22:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20221208.gappssmtp.com; s=20221208; t=1686666173; x=1689258173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1gWIF6WfXGGLV7wV95q+Bs7ONpfkMQ74yIFAAdWgckU=;
        b=a/BBVjmaMQ4W6Uh57UzU2yX7l6o8M8VmaUrobFylrp2Lj1e8Zk4i1JsD2rhJGFOGj7
         LxDaeAiMscWxru8mlDYV+lxikYRK9FwFcFn8f+TTir+jo+Qie32VNdKSUx8pDD+ZKUb8
         dN9/VheT2T5upyliDSFeUcOABFpv242h0NutbQBIyyfuyYPSvqSpQgxvPcMU6lWLbkL9
         gBJ9VH0NT1H8dBe5UP+rm7EakoA5vVCJ1Xf5GshvGP3rnuzEPcWtoKxMkwvpNOtmvYMR
         oosmUI7srWEIx77rEfNqbHTwIl6ltzIjWmI1kK4Yj7PZAgT01zkcszpmUt76ZeuVqzr7
         qY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686666173; x=1689258173;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1gWIF6WfXGGLV7wV95q+Bs7ONpfkMQ74yIFAAdWgckU=;
        b=bYmy0DPU9bB0OesAFDtxTJj3YNhc58tCxzcPC2mKUmEwvdsg+v/Pcpaz0Gl0dImLSv
         +STd9IpbW6lTbnN1wcII3DI8p2Yri0WArzf6qxXs4jijd2q+JTk3Yr07o6VseJDSgoXV
         9YCy5irR1gfEzxv/XQy9InCTVifo8znIHMBOgz13lSVltUqgI7pelWU+IavNE8sWR9RL
         pGM75SsIxY5IQk4kzuilIE5i3LghOxbJ55N6BEBkYhF0braTHixkIpxK7OaA03eJ/Get
         DN3Dt8nCKiSgZlNeuMQWOF3fZs4aic/R96NvO1c/O+X0CglrjsmONT43usB1bOi8s03H
         wwDQ==
X-Gm-Message-State: AC+VfDzodn35tzBZAzShCtHm5YIvmeldh+v07GUqYwhNsFNCtE9lQ1Eg
	l9yjzZL1e802cFKkE30vvyp8BazLpbCjTgjf9AVQOA==
X-Google-Smtp-Source: ACHHUZ5vP+V+IYfx+6K3RQdpyB8TtZRAxKeKOoDh1dO34vqqR5jmKqETRZ2YfFdpKic4CFmIUYOgjxbDQldWhsZkLD8=
X-Received: by 2002:a05:6102:408:b0:430:e0:ac2e with SMTP id
 d8-20020a056102040800b0043000e0ac2emr5618052vsq.15.1686666172953; Tue, 13 Jun
 2023 07:22:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230606031159.38246-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230606031159.38246-1-jiasheng@iscas.ac.cn>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 13 Jun 2023 16:22:42 +0200
Message-ID: <CAMRc=McoDu4jsy4pWnu=T1+q_FfnYa8bfqWb39ZZXM_YmaGpXw@mail.gmail.com>
Subject: Re: [PATCH v3] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: andy.shevchenko@gmail.com, oe-kbuild-all@lists.linux.dev, 
	linus.walleij@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_072255_205855_A2927AB4 
X-CRM114-Status: GOOD (  20.20  )
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

T24gVHVlLCBKdW4gNiwgMjAyMyBhdCA1OjEy4oCvQU0gSmlhc2hlbmcgSmlhbmcgPGppYXNoZW5n
QGlzY2FzLmFjLmNuPiB3cm90ZToKPgo+IEFkZCB0aGUgbWlzc2luZyBjaGVjayBmb3IgcGxhdGZv
cm1fZ2V0X2lycSgpIGFuZCByZXR1cm4gZXJyb3IgY29kZQo+IGlmIGl0IGZhaWxzLgo+IFRoZSBy
ZXR1cm5lZCBlcnJvciBjb2RlIHdpbGwgYmUgZGVhbGVkIHdpdGggaW4KPiBidWlsdGluX3BsYXRm
b3JtX2RyaXZlcihzaWZpdmVfZ3Bpb19kcml2ZXIpIGFuZCB0aGUgZHJpdmVyIHdpbGwgbm90Cj4g
YmUgcmVnaXN0ZXJlZC4KPgo+IEZpeGVzOiBmNTJkNmQ4YjQzZTUgKCJncGlvOiBzaWZpdmU6IFRv
IGdldCBncGlvIGlycSBvZmZzZXQgZnJvbSBkZXZpY2UgdHJlZSBkYXRhIikKPiBTaWduZWQtb2Zm
LWJ5OiBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdAaXNjYXMuYWMuY24+Cj4gLS0tCj4gQ2hhbmdl
bG9nOgo+Cj4gdjIgLT4gdjM6Cj4KPiAxLiBDaGVjayBiZWZvcmUgYXNzaWduaW5nIHZhbHVlcy4K
Pgo+IHYxIC0+IHYyOgo+Cj4gMS4gUmV0dXJuICJnaXJxLT5wYXJlbnRzWzBdIiBpbnN0ZWFkIG9m
ICItRU5PREVWIi4KPiAtLS0KPiAgZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgfCA4ICsrKysr
Ky0tCj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4K
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMgYi9kcml2ZXJzL2dwaW8v
Z3Bpby1zaWZpdmUuYwo+IGluZGV4IDk4OTM5Y2Q0YTcxZS4uNzQ1ZTVmNjcyNTRlIDEwMDY0NAo+
IC0tLSBhL2RyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jCj4gKysrIGIvZHJpdmVycy9ncGlvL2dw
aW8tc2lmaXZlLmMKPiBAQCAtMjIxLDggKzIyMSwxMiBAQCBzdGF0aWMgaW50IHNpZml2ZV9ncGlv
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRU5PREVWOwo+ICAgICAgICAgfQo+Cj4gLSAgICAgICBmb3IgKGkgPSAwOyBpIDwgbmdw
aW87IGkrKykKPiAtICAgICAgICAgICAgICAgY2hpcC0+aXJxX251bWJlcltpXSA9IHBsYXRmb3Jt
X2dldF9pcnEocGRldiwgaSk7Cj4gKyAgICAgICBmb3IgKGkgPSAwOyBpIDwgbmdwaW87IGkrKykg
ewo+ICsgICAgICAgICAgICAgICByZXQgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIGkpOwo+ICsg
ICAgICAgICAgICAgICBpZiAocmV0IDwgMCkKPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1
cm4gcmV0Owo+ICsgICAgICAgICAgICAgICBjaGlwLT5pcnFfbnVtYmVyW2ldID0gcmV0Owo+ICsg
ICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBiZ3Bpb19pbml0KCZjaGlwLT5nYywgZGV2LCA0LAo+
ICAgICAgICAgICAgICAgICAgICAgICAgICBjaGlwLT5iYXNlICsgU0lGSVZFX0dQSU9fSU5QVVRf
VkFMLAo+IC0tCj4gMi4yNS4xCj4KCkFwcGxpZWQsIHRoYW5rcyEKCkJhcnQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
