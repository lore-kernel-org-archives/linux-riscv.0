Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA01C77B7A
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Jun 2023 13:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQsQCejtIzcuNexTjAlVz9dGHjp6LNB0YFeGc089oUE=; b=wsJqwTxVyfJIf+
	krQx5y8lJCV0rcpp9kqt0KDWiStr3XCCZ4Ki+ESCHqTGXw3BDsbtZXYT0jnt4IOW071Dj8oqsjplb
	XbH2tNSCjKFJ4qQyVDm9P5a+29+OvDp60IknBi+ANE5VoHoT1gn5X0blHgp/KYUs6dH2r9pDGNkww
	/BDm0TPc3VIEKP/v2FTicICwuqLG6TIFdyJo3QKw1tekGGxXbwJriCERm6lIsq5Y2A83wQOpoTgVS
	pnxuBa/aG0ShIJeNlL9+yG+RkA2vldphwFxVNlAAI7WLiNYKBmUg8yXQQ3HjZ9PzGxExhQG0lQy0Y
	vppj7t8lIdZu5Ny3DvRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q54Rg-006x8R-1a;
	Fri, 02 Jun 2023 13:03:56 +0000
Received: from mail-qv1-xf2c.google.com ([2607:f8b0:4864:20::f2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q54Re-006x7v-1B
	for linux-riscv@lists.infradead.org;
	Fri, 02 Jun 2023 13:03:55 +0000
Received: by mail-qv1-xf2c.google.com with SMTP id 6a1803df08f44-626157a186bso19320336d6.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Jun 2023 06:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685711032; x=1688303032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bwu3a5TiDNk8aQX2qZ7oGL61sBeYU4YgJcuj8qXhAP4=;
        b=AUtqBJyZ0q5NPj4CuiDNzoMzkp06YVY+KXCw5P/LEFgqo3bvtjU6wcdT7Kq/bJ00fj
         ekdccBJyWK2YzgUG7gaIPL+N4PS/WXGy2QeKn5PHijfRsko0ofEI8CMTURVlVWKxmkye
         kdW8vINpOKSOJanVCdeVHNNfwMQqwEj4w5/4lntGFRbYJNIve1fLkT6rpmIDOv23VQxL
         lQTb/wkp8kOH/XIhV0Eb5vkyxLtyiyAnBd+zh3ASH3S3Xmi7JRKG4FPZZhLnBFLI89XV
         OOlQcvBm+Ri3hEfok4py9SD/ch5NIKxHTLItTJhZRlcFSNgdUaQj3q4ZdW0K2tAqeTZr
         OY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711032; x=1688303032;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bwu3a5TiDNk8aQX2qZ7oGL61sBeYU4YgJcuj8qXhAP4=;
        b=JQhuJhFJPy1dV7idC7+ECzBABaseO9pL6DkHJGSKkPRerYwuLjFJz/sRApew/PLW4L
         /or9QVTngLpFL/q82FP0H5bBfc/wVZO++zcGK8pSkJcEyfdr/aNBQj0ztyw0jpo7eh7o
         1VAEyiLQKq/rLFEPH6u3my+hFbuQ968oXkDA30ydgam/P6GeSBct1K5XDVyHPUjXYAko
         VA+89db7esl85/paHdViJe227tGiVNqtlYhYhpYecVyci67yHy3+txouhkWOyG0e2haB
         s6YECSX/Mq0No7xyA/c1JO6Nnn6YNTaRlrV+BHw1wMb6jHc7iyUUuMtJySF8u5E3HHBZ
         tZfQ==
X-Gm-Message-State: AC+VfDwB5pdWY85YxQkAaxr00/spGgTkTM8KnFMyjmBPLb9tVGS5CS8K
	VHBnGtzPwrlExbwTdTymIeZjAYO5QO+zOKNozKg=
X-Google-Smtp-Source: ACHHUZ5oNkE2+uMJq9lvZUWNrIS3tlbtY4VxLBOJs7jzLpJ3o43croYk9Ip3WhUy+unyiGCQgAx5CbQb186fLGTd1yc=
X-Received: by 2002:a05:6214:240b:b0:623:9a08:4edd with SMTP id
 fv11-20020a056214240b00b006239a084eddmr6420585qvb.25.1685711031776; Fri, 02
 Jun 2023 06:03:51 -0700 (PDT)
MIME-Version: 1.0
References: <20230602072755.7314-1-jiasheng@iscas.ac.cn>
In-Reply-To: <20230602072755.7314-1-jiasheng@iscas.ac.cn>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Fri, 2 Jun 2023 16:03:15 +0300
Message-ID: <CAHp75VfSU-xXWPmwjCKsxc_WcFdZmJuYBO1nd230SeLe7D+b-g@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: sifive: Add missing check for platform_get_irq
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, linux-gpio@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_060354_407533_BC4BF0D2 
X-CRM114-Status: GOOD (  18.84  )
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

T24gRnJpLCBKdW4gMiwgMjAyMyBhdCAxMDoyOOKAr0FNIEppYXNoZW5nIEppYW5nIDxqaWFzaGVu
Z0Bpc2Nhcy5hYy5jbj4gd3JvdGU6Cj4KPiBBZGQgdGhlIG1pc3NpbmcgY2hlY2sgZm9yIHBsYXRm
b3JtX2dldF9pcnEgYW5kIHJldHVybiBlcnJvciBjb2RlCj4gaWYgaXQgZmFpbHMuCgpUaGUgdGVt
cGxhdGUgZm9yIGZ1bmN0aW9uIHJlZmVyZW5jZXMgaXMgZnVuYygpLgpPdGhlcndpc2UgbG9va3Mg
ZmluZSB0byBtZQpSZXZpZXdlZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29A
Z21haWwuY29tPgoKPiBTaWduZWQtb2ZmLWJ5OiBKaWFzaGVuZyBKaWFuZyA8amlhc2hlbmdAaXNj
YXMuYWMuY24+Cj4gLS0tCj4gQ2hhbmdlbG9nOgo+Cj4gdjEgLT4gdjI6Cj4KPiAxLiBSZXR1cm4g
ImNoaXAtPmlycV9udW1iZXJbaV0iIGluc3RlYWQgb2YgIi1FTk9ERVYiLgo+IC0tLQo+ICBkcml2
ZXJzL2dwaW8vZ3Bpby1zaWZpdmUuYyB8IDUgKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3Bpby9n
cGlvLXNpZml2ZS5jIGIvZHJpdmVycy9ncGlvL2dwaW8tc2lmaXZlLmMKPiBpbmRleCA5ODkzOWNk
NGE3MWUuLjcyNDUwMDBmYjA0OSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwaW8vZ3Bpby1zaWZp
dmUuYwo+ICsrKyBiL2RyaXZlcnMvZ3Bpby9ncGlvLXNpZml2ZS5jCj4gQEAgLTIyMSw4ICsyMjEs
MTEgQEAgc3RhdGljIGludCBzaWZpdmVfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVOT0RFVjsKPiAgICAgICAgIH0KPgo+
IC0gICAgICAgZm9yIChpID0gMDsgaSA8IG5ncGlvOyBpKyspCj4gKyAgICAgICBmb3IgKGkgPSAw
OyBpIDwgbmdwaW87IGkrKykgewo+ICAgICAgICAgICAgICAgICBjaGlwLT5pcnFfbnVtYmVyW2ld
ID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCBpKTsKPiArICAgICAgICAgICAgICAgaWYgKGNoaXAt
PmlycV9udW1iZXJbaV0gPCAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBjaGlw
LT5pcnFfbnVtYmVyW2ldOwo+ICsgICAgICAgfQo+Cj4gICAgICAgICByZXQgPSBiZ3Bpb19pbml0
KCZjaGlwLT5nYywgZGV2LCA0LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICBjaGlwLT5iYXNl
ICsgU0lGSVZFX0dQSU9fSU5QVVRfVkFMLAo+IC0tCj4gMi4yNS4xCj4KCgotLQpXaXRoIEJlc3Qg
UmVnYXJkcywKQW5keSBTaGV2Y2hlbmtvCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
