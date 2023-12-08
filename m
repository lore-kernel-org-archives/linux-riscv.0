Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D20C10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 09:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=SwAEyhdz9ej/lqL3A/gKCpxxDrcT0vUf/Z0jRFNBLI0=; b=bVZScMUr1/KR/2WN2gD7ruRtLw
	6oJnJ3ZwrmXJKi5H3L1sXuOJnNa8c1Kuw3PpmFDQfGgqeacJjyQk3bKzGKUGfHWzin0rmh1utMtRA
	7h/vwqjmMlo9xVOza8VOgfz8Pv17vzH36ZrXUndYvREY1J8Zpx7n3rAC6WHUG81rwrLA8ElCJGYpF
	kko/L+wn7/8tpwqQUA1EGdVjVQAXVDsHIFk0MznZzCjKjb6Sz0wgLmTkNQhFQpq2NFkPUuwmm+xyx
	+6SkHG2j9ESX8gsY/eHVuF3WIA74347PYzTz6gd73n1ZVZGEtgT8So7ZPYx7MBY1r3XsIC90yj/MC
	KG0z0s9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXC9-00F8NI-0b;
	Fri, 08 Dec 2023 09:30:53 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXC4-00F8Jc-31
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 09:30:51 +0000
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 801943F62F
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 09:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702027843;
	bh=uWzbSmFUcTYjr7UGey/qNk1zTeB36hCsnrM5hCDtBEM=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=nBV7RK1ccXfWTVXWvfwYfCaZxmbxl65E303YfFL+as21vVS/rOWZXDipvAYPgCU+F
	 aaezZaNiLVO4jFErdX+LMSWy3gcCztzhZH3bYdIfcgmjtHpTuAykCu2zk2XqGgBCoK
	 GE4sosyZDJklwLzETRX+eIG3D9CJyR8uG197sFcVBDemDJzJKXtMx5n6pJ+gHs6116
	 mL53jT6Muevm5DR5D2PYBXV8sGsBdUyWLfRSjIg5SU3gwbiZXmA26eV4gg5zxvu+qx
	 uSiMzdr9P1bqsRiztT16MaeoDawoCVMyyKT3b52S8BguvHmptlQGBXiJpGnvKi743u
	 4JyKVuO4mVcTA==
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-42599db593fso15367991cf.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 01:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702027842; x=1702632642;
        h=content-transfer-encoding:cc:to:subject:message-id:date
         :mime-version:references:in-reply-to:from:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uWzbSmFUcTYjr7UGey/qNk1zTeB36hCsnrM5hCDtBEM=;
        b=r3gxFbV5U83GryPXeWtMO8NRS7Y1HVbAp7/gKf4jnjsfbfNNbJ6c1ZLCPDen+JinFE
         To8C6x2Ml70Q2iKK4cAhC5JTb4IZrcQsHqZOLQbPe6NMkPC2vH+sNOyE20nwS7vEDV/N
         yr9Tr+JhvnY7GSTL81gyzwOXxo2M/k6JhhEGyjNtp0828sgf65T9cUD7nsB9YzKG3Qma
         JA1t3IDXugOH4iJrXDWU0IaAYqY6Ol29AFCOWgbfq49L6j4NhlP3xyaFUh43rFJeO1wL
         rPj+IZGCR0IPy9+SIG+zRWI9mOFNSPFiS3Jpzf+lVlGS0ZoYaM178N5aSWhsR77EFFMo
         NP5A==
X-Gm-Message-State: AOJu0YxxyWuq0eCHNF4PCNAaXLZLyxv0zPB0wQ2wwrWISBEbTUHwE+pJ
	Jpb6CrKJ/N9EJ137h1+LOHBNf7iRQ2w56jsQRciFyCqKzfHKFeNH3poMI9pnYZ6gUtMEJgsdri9
	9uLGJDSruOYXIc6FZj1hc84J+io5fFhFkQRaoIgOjpG2qq3EEq3V9Xf+bzSXE5Q==
X-Received: by 2002:a05:622a:1388:b0:423:843a:e311 with SMTP id o8-20020a05622a138800b00423843ae311mr796412qtk.23.1702027842545;
        Fri, 08 Dec 2023 01:30:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVz5DptoQUK6psikD/zbi59O4PuftvbVHfHg/GwVr0qVjhm+KBWqH8BPPsCW9KZBAp6elc0NFCr84CZmMit00=
X-Received: by 2002:a05:622a:1388:b0:423:843a:e311 with SMTP id
 o8-20020a05622a138800b00423843ae311mr796405qtk.23.1702027842336; Fri, 08 Dec
 2023 01:30:42 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 04:30:41 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <500a4f39531bd5fc61eb8ac0092e34d4b1ae2cc0.1701860672.git.u.kleine-koenig@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de> <500a4f39531bd5fc61eb8ac0092e34d4b1ae2cc0.1701860672.git.u.kleine-koenig@pengutronix.de>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 04:30:41 -0500
Message-ID: <CAJM55Z9sUTNKR5EGmPOio8Uh_1+wfs0-aiKcsngUKF24JcO-QA@mail.gmail.com>
Subject: Re: [PATCH v4 089/115] pwm: sifive: Make use of devm_pwmchip_alloc() function
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Thierry Reding <thierry.reding@gmail.com>
Cc: kernel@pengutronix.de, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_013049_404081_819DA63F 
X-CRM114-Status: GOOD (  20.07  )
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

VXdlIEtsZWluZS1Lw7ZuaWcgd3JvdGU6Cj4gVGhpcyBwcmVwYXJlcyB0aGUgcHdtLXNpZml2ZSBk
cml2ZXIgdG8gZnVydGhlciBjaGFuZ2VzIG9mIHRoZSBwd20gY29yZQo+IG91dGxpbmVkIGluIHRo
ZSBjb21taXQgaW50cm9kdWNpbmcgZGV2bV9wd21jaGlwX2FsbG9jKCkuIFRoZXJlIGlzIG5vCj4g
aW50ZW5kZWQgc2VtYW50aWNhbCBjaGFuZ2UgYW5kIHRoZSBkcml2ZXIgc2hvdWxkIGJlaGF2ZSBh
cyBiZWZvcmUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUt
a29lbmlnQHBlbmd1dHJvbml4LmRlPgo+IC0tLQo+ICBkcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMg
fCAyOCArKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAxNCBp
bnNlcnRpb25zKCspLCAxNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3B3
bS9wd20tc2lmaXZlLmMgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiBpbmRleCBjMWI0MTI5
MDVkOWUuLmNmM2ZjZmZlN2IzYSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3B3bS9wd20tc2lmaXZl
LmMKPiArKysgYi9kcml2ZXJzL3B3bS9wd20tc2lmaXZlLmMKPiBAQCAtNDEsNyArNDEsNyBAQAo+
ICAjZGVmaW5lIFBXTV9TSUZJVkVfREVGQVVMVF9QRVJJT0QJMTAwMDAwMDAKPgo+ICBzdHJ1Y3Qg
cHdtX3NpZml2ZV9kZGF0YSB7Cj4gLQlzdHJ1Y3QgcHdtX2NoaXAJY2hpcDsKPiArCXN0cnVjdCBw
d21fY2hpcCAqY2hpcDsKCkluIHBhdGNoIDQzIHlvdSBkbyBkZGF0YSA9ICh2b2lkICopY2hpcCAr
IHNpemVvZigqY2hpcCkuIFNob3VsZG4ndCB3ZQpiZSBhYmxlIHRvIGdldAp0aGUgY2hpcCBwb2lu
dGVyIGZyb20gZGRhdGEgdXNpbmcgY2hpcCA9ICh2b2lkICopZGRhdGEgLSBzaXplb2YoKmNoaXAp
PwoKPiAgCXN0cnVjdCBtdXRleCBsb2NrOyAvKiBsb2NrIHRvIHByb3RlY3QgdXNlcl9jb3VudCBh
bmQgYXBwcm94X3BlcmlvZCAqLwo+ICAJc3RydWN0IG5vdGlmaWVyX2Jsb2NrIG5vdGlmaWVyOwo+
ICAJc3RydWN0IGNsayAqY2xrOwo+IEBAIC01NCw3ICs1NCw3IEBAIHN0cnVjdCBwd21fc2lmaXZl
X2RkYXRhIHsKPiAgc3RhdGljIGlubGluZQo+ICBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSAqcHdt
X3NpZml2ZV9jaGlwX3RvX2RkYXRhKHN0cnVjdCBwd21fY2hpcCAqY2hpcCkKPiAgewo+IC0JcmV0
dXJuIGNvbnRhaW5lcl9vZihjaGlwLCBzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSwgY2hpcCk7Cj4g
KwlyZXR1cm4gcHdtY2hpcF9nZXRfZHJ2ZGF0YShjaGlwKTsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQg
cHdtX3NpZml2ZV9yZXF1ZXN0KHN0cnVjdCBwd21fY2hpcCAqY2hpcCwgc3RydWN0IHB3bV9kZXZp
Y2UgKnB3bSkKPiBAQCAtMTAyLDcgKzEwMiw3IEBAIHN0YXRpYyB2b2lkIHB3bV9zaWZpdmVfdXBk
YXRlX2Nsb2NrKHN0cnVjdCBwd21fc2lmaXZlX2RkYXRhICpkZGF0YSwKPiAgCS8qIEFzIHNjYWxl
IDw9IDE1IHRoZSBzaGlmdCBvcGVyYXRpb24gY2Fubm90IG92ZXJmbG93LiAqLwo+ICAJbnVtID0g
KHVuc2lnbmVkIGxvbmcgbG9uZylOU0VDX1BFUl9TRUMgPDwgKFBXTV9TSUZJVkVfQ01QV0lEVEgg
KyBzY2FsZSk7Cj4gIAlkZGF0YS0+cmVhbF9wZXJpb2QgPSBkaXY2NF91bChudW0sIHJhdGUpOwo+
IC0JZGV2X2RiZyhwd21jaGlwX3BhcmVudCgmZGRhdGEtPmNoaXApLAo+ICsJZGV2X2RiZyhwd21j
aGlwX3BhcmVudChkZGF0YS0+Y2hpcCksCj4gIAkJIk5ldyByZWFsX3BlcmlvZCA9ICV1IG5zXG4i
LCBkZGF0YS0+cmVhbF9wZXJpb2QpOwo+ICB9Cj4KPiBAQCAtMjMwLDE1ICsyMzAsMTQgQEAgc3Rh
dGljIGludCBwd21fc2lmaXZlX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4g
IAl1MzIgdmFsOwo+ICAJdW5zaWduZWQgaW50IGVuYWJsZWRfcHdtcyA9IDAsIGVuYWJsZWRfY2xr
cyA9IDE7Cj4KPiAtCWRkYXRhID0gZGV2bV9remFsbG9jKGRldiwgc2l6ZW9mKCpkZGF0YSksIEdG
UF9LRVJORUwpOwo+IC0JaWYgKCFkZGF0YSkKPiAtCQlyZXR1cm4gLUVOT01FTTsKPiArCWNoaXAg
PSBkZXZtX3B3bWNoaXBfYWxsb2MoZGV2LCA0LCBzaXplb2YoKmRkYXRhKSk7Cj4gKwlpZiAoSVNf
RVJSKGNoaXApKQo+ICsJCXJldHVybiBQVFJfRVJSKGNoaXApOwo+ICsJZGRhdGEgPSBwd21fc2lm
aXZlX2NoaXBfdG9fZGRhdGEoY2hpcCk7Cj4gKwlkZGF0YS0+Y2hpcCA9IGNoaXA7Cj4KPiAgCW11
dGV4X2luaXQoJmRkYXRhLT5sb2NrKTsKPiAtCWNoaXAgPSAmZGRhdGEtPmNoaXA7Cj4gLQljaGlw
LT5kZXYgPSBkZXY7Cj4gIAljaGlwLT5vcHMgPSAmcHdtX3NpZml2ZV9vcHM7Cj4gLQljaGlwLT5u
cHdtID0gNDsKPgo+ICAJZGRhdGEtPnJlZ3MgPSBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3Vy
Y2UocGRldiwgMCk7Cj4gIAlpZiAoSVNfRVJSKGRkYXRhLT5yZWdzKSkKPiBAQCAtMjk2LDcgKzI5
NSw3IEBAIHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ICAJCWdvdG8gdW5yZWdpc3Rlcl9jbGs7Cj4gIAl9Cj4KPiAtCXBsYXRmb3JtX3Nl
dF9kcnZkYXRhKHBkZXYsIGRkYXRhKTsKPiArCXBsYXRmb3JtX3NldF9kcnZkYXRhKHBkZXYsIGNo
aXApOwo+ICAJZGV2X2RiZyhkZXYsICJTaUZpdmUgUFdNIGNoaXAgcmVnaXN0ZXJlZCAlZCBQV01z
XG4iLCBjaGlwLT5ucHdtKTsKPgo+ICAJcmV0dXJuIDA7Cj4gQEAgLTMxNCwxNSArMzEzLDE2IEBA
IHN0YXRpYyBpbnQgcHdtX3NpZml2ZV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2
KQo+Cj4gIHN0YXRpYyB2b2lkIHB3bV9zaWZpdmVfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZp
Y2UgKmRldikKPiAgewo+IC0Jc3RydWN0IHB3bV9zaWZpdmVfZGRhdGEgKmRkYXRhID0gcGxhdGZv
cm1fZ2V0X2RydmRhdGEoZGV2KTsKPiArCXN0cnVjdCBwd21fY2hpcCAqY2hpcCA9IHBsYXRmb3Jt
X2dldF9kcnZkYXRhKGRldik7Cj4gKwlzdHJ1Y3QgcHdtX3NpZml2ZV9kZGF0YSAqZGRhdGEgPSBw
d21fc2lmaXZlX2NoaXBfdG9fZGRhdGEoY2hpcCk7Cj4gIAlzdHJ1Y3QgcHdtX2RldmljZSAqcHdt
Owo+ICAJaW50IGNoOwo+Cj4gLQlwd21jaGlwX3JlbW92ZSgmZGRhdGEtPmNoaXApOwo+ICsJcHdt
Y2hpcF9yZW1vdmUoY2hpcCk7Cj4gIAljbGtfbm90aWZpZXJfdW5yZWdpc3RlcihkZGF0YS0+Y2xr
LCAmZGRhdGEtPm5vdGlmaWVyKTsKPgo+IC0JZm9yIChjaCA9IDA7IGNoIDwgZGRhdGEtPmNoaXAu
bnB3bTsgY2grKykgewo+IC0JCXB3bSA9ICZkZGF0YS0+Y2hpcC5wd21zW2NoXTsKPiArCWZvciAo
Y2ggPSAwOyBjaCA8IGNoaXAtPm5wd207IGNoKyspIHsKPiArCQlwd20gPSAmY2hpcC0+cHdtc1tj
aF07Cj4gIAkJaWYgKHB3bS0+c3RhdGUuZW5hYmxlZCkKPiAgCQkJY2xrX2Rpc2FibGUoZGRhdGEt
PmNsayk7Cj4gIAl9Cj4gLS0KPiAyLjQyLjAKPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKPiBsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
