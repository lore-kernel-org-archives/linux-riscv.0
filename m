Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D64BEC3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 03:12:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3XBrin6xu+Bi61HEvYFAu9vOrtjO9y75PBJCRdeCl4c=; b=H7+1Oe8gGlmqpX
	m/DURzjFr8oUVHUi1kMyrniPYvzzLR/R7eedo5WOisaYXSaa48KsnOjgVtO/+j13HPjDC61JfQoLN
	Ojz783Qqc4ARGW3ch3JxWbDjGyjuQAQDhMEfK3RX2Gn+pw47qt0fQc3/iqI/QldiGe3SvOWUXm0Sj
	JDCb4V0qCBroFxeo1pO2xV0ABMrOfZ1nbxklx/jlVaHNIqPgJsVwM30KvxlKi72ijw9B5Kyuc9Orp
	ntSi9vwNhe85uA0P4idIq/l5ugmsCNFclaBBcQoJv11/bQEp5J4SOhC+ggSMYYWHA9q/85NvXRWPN
	SsN70P1cI9qcicswWHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjTS-00000008AzN-3wNp;
	Mon, 22 Jul 2024 03:12:31 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVjTQ-00000008AyI-0Oix
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 03:12:30 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-260e6dfc701so2164153fac.3
        for <linux-riscv@lists.infradead.org>; Sun, 21 Jul 2024 20:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1721617947; x=1722222747; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1VlY9vQIqtUAagLIYX96hyqfTP17OmaFXQAiweqEIno=;
        b=jBBqgI0IcYLqivIwolssiNojEMQAY0oDL9H1bpg3TplnZqu4+fLDickThk8Xo4iD4s
         LHU4c32Lp9hZ6/U1/mqu3+NU8DGffQEyDCm44mzG0YyT30/K/OnNKIlPLpF4KaSLTEbN
         zaoHNYccDegOYz00vJKwR2meym6wfsusFWYFUKmPDlAWTku8CIEZX/TZuc3eAfGZh0PV
         R5yQ21/pROrtk2GLfEKhIRwnRGqp3sGruJJTqbdPQmqGalmEezYHQtxtgIFfnf2DStJ5
         cIMiqXRqOxHTVCKUoPAvp6HAm0xoQUH0wnIkR0CQVK28AEh4KtNo9NQ69GpMiIMRdxML
         gc4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721617947; x=1722222747;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1VlY9vQIqtUAagLIYX96hyqfTP17OmaFXQAiweqEIno=;
        b=kKG8j3nGKXJbvUTGUwnQfGx2vwjWTiV00A1IeDQrznFDvrR50s27oSDHc1VNBf18T+
         AgSq60iLiQUtOrnhoriH+iAfQ9cQZzqz5KYu9ze/3LEIrLPU/JApJdD0UJlxI1NZFyWG
         feSul32gg3tIeqo83D2QUxxP5ZSzRGDjlPsznbhXJTwDSg8Bl2iWrNlnbfstGUIHu362
         3XkgyqbXv+gWu0iX/IBN65PM6LvYR5Zb7LBl4+Gnktk/UHvSiubh0s9b8EkiouIy+9XX
         g/Zv70NMDj8yYyxFSXiWvGAvRZ5SrsHu+enlDMgzfQty+5v5zdVCV0N/2RasSAJ8bnlR
         u66w==
X-Forwarded-Encrypted: i=1; AJvYcCV3qMhrSnnF3yyhouQD3EiImVyXPEVTnfiPPfHmYvY7Cwoaf8luwS3FfO/Qj3QkLYstRSjfqfsbhoTRjW7sjR1UAfsx1RELZ2uHQkcLwSkr
X-Gm-Message-State: AOJu0YwVxqBkajOiNqraGVlgibkauncG7i3qOg8b1dBB4R8bwbhLf8vb
	47SCbF+2/cqql+c8NmiYr7t3dWNyrzsyV/pOFFp9SDHArz1Ljs5u800Fc8wkTnoiTWKKDPrl1CL
	pQTTk4rZvcPnMwwFpkiG/HSW2P8dMV1QrJfiaAA==
X-Google-Smtp-Source: AGHT+IEmKL8qSE6nD4oaItm05/DMOLtviaNKjqxaDNvzE1H6a0xYKUtsnk11YNWmPChOacgnhT/rbuXKZJXBxgJfnCY=
X-Received: by 2002:a05:6870:a450:b0:260:fd4c:6506 with SMTP id
 586e51a60fabf-2638df29e12mr5587831fac.19.1721617946842; Sun, 21 Jul 2024
 20:12:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240718020935.12803-1-cuiyunhui@bytedance.com> <20240719-92015016b960e7153e97b39d@orel>
In-Reply-To: <20240719-92015016b960e7153e97b39d@orel>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Mon, 22 Jul 2024 11:12:16 +0800
Message-ID: <CAEEQ3wnbJSOhXkvfBPMJ0+CvDJ_o1Fa_uFCd3dReMPXDgZG+JQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] riscv/mm/fault: add show_pte() before die()
To: Andrew Jones <ajones@ventanamicro.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, akpm@linux-foundation.org, surenb@google.com, 
	peterx@redhat.com, alexghiti@rivosinc.com, willy@infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240721_201228_179324_E78F41E3 
X-CRM114-Status: GOOD (  21.94  )
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

SGkgZHJldywKCk9uIEZyaSwgSnVsIDE5LCAyMDI0IGF0IDEwOjMz4oCvUE0gQW5kcmV3IEpvbmVz
IDxham9uZXNAdmVudGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBPbiBUaHUsIEp1bCAxOCwgMjAy
NCBhdCAxMDowOTozNUFNIEdNVCwgWXVuaHVpIEN1aSB3cm90ZToKPiA+IFdoZW4gdGhlIGtlcm5l
bCBkaXNwbGF5cyAiVW5hYmxlIHRvIGhhbmRsZSBrZXJuZWwgcGFnaW5nIHJlcXVlc3QgYXQKPiA+
IHZpcnR1YWwgYWRkcmVzcyIsIHdlIHdvdWxkIGxpa2UgdG8gY29uZmlybSB0aGUgc3RhdHVzIG9m
IHRoZSB2aXJ0dWFsCj4gPiBhZGRyZXNzIGluIHRoZSBwYWdlIHRhYmxlLiBTbyBhZGQgc2hvd19w
dGUoKSBiZWZvcmUgZGllKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWXVuaHVpIEN1aSA8Y3Vp
eXVuaHVpQGJ5dGVkYW5jZS5jb20+Cj4gPiAtLS0KPiA+ICBhcmNoL3Jpc2N2L21tL2ZhdWx0LmMg
fCA0NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9y
aXNjdi9tbS9mYXVsdC5jIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gPiBpbmRleCA5MGQ0YmEz
NmQxZDAuLmRmZTNjZTM4ZTE2YiAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZmF1bHQu
Ywo+ID4gKysrIGIvYXJjaC9yaXNjdi9tbS9mYXVsdC5jCj4gPiBAQCAtMjIsNiArMjIsNTIgQEAK
PiA+Cj4gPiAgI2luY2x1ZGUgIi4uL2tlcm5lbC9oZWFkLmgiCj4gPgo+ID4gK3N0YXRpYyB2b2lk
IHNob3dfcHRlKHVuc2lnbmVkIGxvbmcgYWRkcikKPiA+ICt7Cj4gPiArICAgICBwZ2RfdCAqcGdk
cCwgcGdkOwo+ID4gKyAgICAgcDRkX3QgKnA0ZHAsIHA0ZDsKPiA+ICsgICAgIHB1ZF90ICpwdWRw
LCBwdWQ7Cj4gPiArICAgICBwbWRfdCAqcG1kcCwgcG1kOwo+ID4gKyAgICAgcHRlX3QgKnB0ZXAs
IHB0ZTsKPiA+ICsgICAgIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tID0gY3VycmVudC0+bW07Cj4gPiAr
Cj4gPiArICAgICBpZiAoIW1tKQo+ID4gKyAgICAgICAgICAgICBtbSA9ICZpbml0X21tOwo+Cj4g
YXJtNjQgc2hvd19wdGUgc3RhcnRzIHdpdGggYSBzdW1tYXJ5IGxpbmUgd2hlcmUgdGhlIHBndGFi
bGUgdHlwZSAoc3dhcHBlcgo+IHZzLiB1c2VyKSwgbnVtYmVyIG9mIFZBIGJpdHMsIGFuZCBwaHlz
aWNhbCBhZGRyZXNzIG9mIHRoZSBwZ2QgYXJlCj4gZGlzcGxheWVkLiBTaG91bGQgd2UgYWRkIHRo
YXQgdG9vPwpPYWt577yMIEkgd2lsbCBhZGQgaXQgaW4gdjIuCgo+Cj4gVGhhbmtzLAo+IGRyZXcK
Pgo+ID4gKyAgICAgcGdkcCA9IHBnZF9vZmZzZXQobW0sIGFkZHIpOwo+ID4gKyAgICAgcGdkID0g
UkVBRF9PTkNFKCpwZ2RwKTsKPiA+ICsgICAgIHByX2FsZXJ0KCJbJTAxNmx4XSBwZ2Q9JTAxNmx4
IiwgYWRkciwgcGdkX3ZhbChwZ2QpKTsKPiA+ICsgICAgIGlmIChwZ2Rfbm9uZShwZ2QpIHx8IHBn
ZF9iYWQocGdkKSkKPiA+ICsgICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArCj4gPiArICAgICBw
NGRwID0gcDRkX29mZnNldChwZ2RwLCBhZGRyKTsKPiA+ICsgICAgIHA0ZCA9IFJFQURfT05DRSgq
cDRkcCk7Cj4gPiArICAgICBwcl9jb250KCIsIHA0ZD0lMDE2bHgiLCBwNGRfdmFsKHA0ZCkpOwo+
ID4gKyAgICAgaWYgKHA0ZF9ub25lKHA0ZCkgfHwgcDRkX2JhZChwNGQpKQo+ID4gKyAgICAgICAg
ICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgIHB1ZHAgPSBwdWRfb2Zmc2V0KHA0ZHAsIGFk
ZHIpOwo+ID4gKyAgICAgcHVkID0gUkVBRF9PTkNFKCpwdWRwKTsKPiA+ICsgICAgIHByX2NvbnQo
IiwgcHVkPSUwMTZseCIsIHB1ZF92YWwocHVkKSk7Cj4gPiArICAgICBpZiAocHVkX25vbmUocHVk
KSB8fCBwdWRfYmFkKHB1ZCkpCj4gPiArICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKwo+ID4g
KyAgICAgcG1kcCA9IHBtZF9vZmZzZXQocHVkcCwgYWRkcik7Cj4gPiArICAgICBwbWQgPSBSRUFE
X09OQ0UoKnBtZHApOwo+ID4gKyAgICAgcHJfY29udCgiLCBwbWQ9JTAxNmx4IiwgcG1kX3ZhbChw
bWQpKTsKPiA+ICsgICAgIGlmIChwbWRfbm9uZShwbWQpIHx8IHBtZF9iYWQocG1kKSkKPiA+ICsg
ICAgICAgICAgICAgZ290byBvdXQ7Cj4gPiArCj4gPiArICAgICBwdGVwID0gcHRlX29mZnNldF9t
YXAocG1kcCwgYWRkcik7Cj4gPiArICAgICBpZiAoIXB0ZXApCj4gPiArICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ID4gKwo+ID4gKyAgICAgcHRlID0gUkVBRF9PTkNFKCpwdGVwKTsKPiA+ICsgICAg
IHByX2NvbnQoIiwgcHRlPSUwMTZseCIsIHB0ZV92YWwocHRlKSk7Cj4gPiArICAgICBwdGVfdW5t
YXAocHRlcCk7Cj4gPiArb3V0Ogo+ID4gKyAgICAgcHJfY29udCgiXG4iKTsKPiA+ICt9Cj4gPiAr
Cj4gPiAgc3RhdGljIHZvaWQgZGllX2tlcm5lbF9mYXVsdChjb25zdCBjaGFyICptc2csIHVuc2ln
bmVkIGxvbmcgYWRkciwKPiA+ICAgICAgICAgICAgICAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
PiAgewo+ID4gQEAgLTMxLDYgKzc3LDcgQEAgc3RhdGljIHZvaWQgZGllX2tlcm5lbF9mYXVsdChj
b25zdCBjaGFyICptc2csIHVuc2lnbmVkIGxvbmcgYWRkciwKPiA+ICAgICAgICAgICAgICAgYWRk
cik7Cj4gPgo+ID4gICAgICAgYnVzdF9zcGlubG9ja3MoMCk7Cj4gPiArICAgICBzaG93X3B0ZShh
ZGRyKTsKPiA+ICAgICAgIGRpZShyZWdzLCAiT29wcyIpOwo+ID4gICAgICAgbWFrZV90YXNrX2Rl
YWQoU0lHS0lMTCk7Cj4gPiAgfQo+ID4gLS0KPiA+IDIuMzkuMgo+ID4KPiA+Cj4gPiBfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0Cj4gPiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4gPiBodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgpUaGFu
a3PvvIwKWXVuaHVpCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
