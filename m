Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DF49C77B73
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Apr 2023 10:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N6ORInZ/hULp3ee8sdwedOKyZEG3IfBHRVZ8u3pE/lE=; b=rjj5Lk9uCc8UTM
	5HI6y8gdG8y01QNRXnUbZF6hsv2fuYTbbkgK+YRmc6iDg1A5r/UuB/bREguK71FbXZ/YNbLpm31T3
	GBEc38GlUflLh3wuYiDiyIKcXw/6fB5EqjDbv6t3BhVwW+ZcedXvS4Lf3ZvDjOq6av+W1D8P1qr6p
	tN4bGBIgm2kEkuMvRzarHAVxwQH+oUAwRmfZlCHj/kmzeWpl5DZYW6LZN5xReuzPUIZ2NfyJPgY1+
	nphv3CeOi9g0oo/o4CNn9HL7neebzxOj1Y1jTECejxOPlt1qgi0lKWBiM5QVicnM+DcR+bL7bnN9g
	5s5crTTo8dp2uOrAP+qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRFb-007eFz-0u;
	Thu, 20 Apr 2023 10:10:51 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppRFY-007eFX-18
	for linux-riscv@lists.infradead.org;
	Thu, 20 Apr 2023 10:10:50 +0000
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 82E3E3F04B
	for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 10:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1681985443;
	bh=kOcmaafFB2AQEmvIg0cTjiZetG/rfnyXfpR41vhnI5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PY1M7GIrlsLGvyWOskxnDKZXhNS10eCxg+ZHMsMkPgx6gIn02K/E45Zu3LFfHtPgf
	 nCYmxSpaqZe/f6yY8Jx5rgEn7LaoSvQNMfwYlNttrWzRWFevmOWdYj311rF0JRDbAf
	 Bt5M7l+3Lop0VSFctYSmGk+2vB2UpaM79S0c3Jcg0Zu0kfK6to1ReWK9Z/Hc38TNlH
	 RMwU0piYJ84VnkqgCXy2ECgrHxq9RtXXEPFaDKMFsD4gRrymXXozVECf2S1wSYBBjm
	 U+DxKeXySGHs29Y/F8BPUg9XNcn7ijZhuDh9DLSoUChlthDGX4KfkgWbClH8VwhTUh
	 VjPq+fxWM3bUg==
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-74df5c5fd00so40696485a.3
        for <linux-riscv@lists.infradead.org>; Thu, 20 Apr 2023 03:10:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681985442; x=1684577442;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kOcmaafFB2AQEmvIg0cTjiZetG/rfnyXfpR41vhnI5I=;
        b=ahJtV6lCrGedYQOw19SJropW5FBXyI8VbM9SZKGl3x+kYaDXyiHRn5O5Bp9w1ewc2R
         0+8dKMvPagC/LU53pNqUHo7GSdE/coKraGqu6KkctTFUEfuGaghv/hpo7/r0me2Cf0Mw
         +QoqQt58gOHPBgcukM78YA3wkS7PMtvumdMZp1Xi26ZFPJAY7LFSoUrb0NW9vbXnyvHV
         jeXkWCfRuI1E82Pe5J80yn3ZG20+W0ITB/1drT/VQ2G1wGlLvDf7R1Fk5+QWfvggDazV
         UaxxRiKNmzytJ+QCGzsIZs7/I5MlZHZa+ZZ7iWItL3om01CPfwZRMONueomEDzza7gVT
         5USg==
X-Gm-Message-State: AAQBX9e9HAusHVWURjRSWek5sAtt60qMRY/XJOeeDpWGTUmgqHmPdjOc
	yorSKuK3wX8F+SIignwzscc04UdDM9Pep4tEKLyRi8ew6wvgaLA1S7cNgxZA63XZiFNu3n5x/pM
	wtcYDKRGH59c8RFr3xOfoCQy4QENMxgHJ9+suIIzEC8ysrId91IQNR7NdYyYrYg==
X-Received: by 2002:a05:622a:44d:b0:3ef:4100:cd0c with SMTP id o13-20020a05622a044d00b003ef4100cd0cmr852864qtx.63.1681985442649;
        Thu, 20 Apr 2023 03:10:42 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMhBcVKGhtjkBbRGE7xqTUZ0iLDLnmRAX/+0wM0CbmSLYXvwoQ82pVYVXHywu+lJ9/JwBn+E1eoJF7KfdCLQA=
X-Received: by 2002:a05:622a:44d:b0:3ef:4100:cd0c with SMTP id
 o13-20020a05622a044d00b003ef4100cd0cmr852847qtx.63.1681985442457; Thu, 20 Apr
 2023 03:10:42 -0700 (PDT)
MIME-Version: 1.0
References: <20230418202102.117658-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230418202102.117658-1-u.kleine-koenig@pengutronix.de>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 20 Apr 2023 12:10:26 +0200
Message-ID: <CAJM55Z9Vmbsx_egcDpEmk5mDurOvXaUFdGHxvbBR05CcaA8Wig@mail.gmail.com>
Subject: Re: [PATCH] pwm: sifive: Simplify using devm_clk_get_prepared()
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_031048_523844_12B4CEF6 
X-CRM114-Status: GOOD (  18.65  )
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

T24gVHVlLCAxOCBBcHIgMjAyMyBhdCAyMjoyMywgVXdlIEtsZWluZS1Lw7ZuaWcKPHUua2xlaW5l
LWtvZW5pZ0BwZW5ndXRyb25peC5kZT4gd3JvdGU6Cj4KPiBJbnN0ZWFkIG9mIHByZXBhcmluZyB0
aGUgY2xrIGFmdGVyIGl0IHdhcyByZXF1ZXN0ZWQgYW5kIHVucHJlcGFyaW5nIGluCj4gLnByb2Jl
KCkncyBlcnJvciBwYXRoIGFuZCAucmVtb3ZlKCksIHVzZSBkZXZtX2Nsa19nZXRfcHJlcGFyZWQo
KSB3aGljaAo+IGNvcGVzIGZvciB1bnByZXBhcmluZyBhdXRvbWF0aWNhbGx5Lgo+Cj4gU2lnbmVk
LW9mZi1ieTogVXdlIEtsZWluZS1Lw7ZuaWcgPHUua2xlaW5lLWtvZW5pZ0BwZW5ndXRyb25peC5k
ZT4KCkxvb2tzIGdvb2QgdG8gbWUsIHRoYW5rcy4KUmV2aWV3ZWQtYnk6IEVtaWwgUmVubmVyIEJl
cnRoaW5nIDxlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgoKPiAtLS0KPiAgZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jIHwgNyArKy0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9wd20v
cHdtLXNpZml2ZS5jIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gaW5kZXggNWIwNTc0ZjYz
NWY2Li5hZTQ5ZDY3YWIyYjEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5j
Cj4gKysrIGIvZHJpdmVycy9wd20vcHdtLXNpZml2ZS5jCj4gQEAgLTI0NCwxMiArMjQ0LDEyIEBA
IHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+ICAgICAgICAgaWYgKElTX0VSUihkZGF0YS0+cmVncykpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiBQVFJfRVJSKGRkYXRhLT5yZWdzKTsKPgo+IC0gICAgICAgZGRhdGEtPmNsayA9IGRldm1f
Y2xrX2dldChkZXYsIE5VTEwpOwo+ICsgICAgICAgZGRhdGEtPmNsayA9IGRldm1fY2xrX2dldF9w
cmVwYXJlZChkZXYsIE5VTEwpOwo+ICAgICAgICAgaWYgKElTX0VSUihkZGF0YS0+Y2xrKSkKPiAg
ICAgICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBQVFJfRVJSKGRkYXRhLT5j
bGspLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAiVW5hYmxlIHRvIGZp
bmQgY29udHJvbGxlciBjbG9ja1xuIik7Cj4KPiAtICAgICAgIHJldCA9IGNsa19wcmVwYXJlX2Vu
YWJsZShkZGF0YS0+Y2xrKTsKPiArICAgICAgIHJldCA9IGNsa19lbmFibGUoZGRhdGEtPmNsayk7
Cj4gICAgICAgICBpZiAocmV0KSB7Cj4gICAgICAgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFp
bGVkIHRvIGVuYWJsZSBjbG9jayBmb3IgcHdtOiAlZFxuIiwgcmV0KTsKPiAgICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiBAQCAtMzA4LDcgKzMwOCw2IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2
ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ICAgICAgICAgICAgICAgICBj
bGtfZGlzYWJsZShkZGF0YS0+Y2xrKTsKPiAgICAgICAgICAgICAgICAgLS1lbmFibGVkX2Nsa3M7
Cj4gICAgICAgICB9Cj4gLSAgICAgICBjbGtfdW5wcmVwYXJlKGRkYXRhLT5jbGspOwo+Cj4gICAg
ICAgICByZXR1cm4gcmV0Owo+ICB9Cj4gQEAgLTMyNyw4ICszMjYsNiBAQCBzdGF0aWMgdm9pZCBw
d21fc2lmaXZlX3JlbW92ZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpkZXYpCj4gICAgICAgICAg
ICAgICAgIGlmIChwd20tPnN0YXRlLmVuYWJsZWQpCj4gICAgICAgICAgICAgICAgICAgICAgICAg
Y2xrX2Rpc2FibGUoZGRhdGEtPmNsayk7Cj4gICAgICAgICB9Cj4gLQo+IC0gICAgICAgY2xrX3Vu
cHJlcGFyZShkZGF0YS0+Y2xrKTsKPiAgfQo+Cj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2
aWNlX2lkIHB3bV9zaWZpdmVfb2ZfbWF0Y2hbXSA9IHsKPgo+IGJhc2UtY29tbWl0OiAyNDdlZTZj
NzgwNDA2NTEzYzYwMzFhN2Y0ZWE0MWYxNjQ4YjAzMjk1Cj4gLS0KPiAyLjM5LjIKPgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
