Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A3C7EE25
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 13:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DTpDSOYyyfpH6Uf35EeuCU04+HPfDK4yF2S0sKhhtzo=; b=Uij6F5qezFsaME
	kGfUXRm0s3Yl3L1iQu6J5P+6oHvEBGj8Vth4JpdPhU8scCws2e5wC0Z+IQYJqvYFkn4M6WHmj6PJv
	+l9UnewLGY6rGWhHCaQX0FVNjY977IfNR8HjMmi3JybdTXaQpaGsB3Ap/NYospK8nHaVZZLzFXfvQ
	OA0odjTj4Wkp+GD5DXn5lZK+ntNJbkIwx40vQjotM6Gt1L+9ZRfaximu5/C0CwaaxZmqDXU74qMAX
	1WNQAsGWJOYGetSRMK0Y9v71smCvU5kl0ExGFNE9rBpRoZjPA3EuXEBK58PzsiGhwC8XP8Nu+NJ9G
	KiQU4UgH2l9VjRUV0MOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6sv5-0062FB-0I;
	Wed, 07 Jun 2023 13:09:47 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6sv1-0062Bq-0h
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 13:09:44 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f6da07ff00so74028455e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 07 Jun 2023 06:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jrtc27.com; s=gmail.jrtc27.user; t=1686143379; x=1688735379;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rnMyzOk/vTKWlLvg7he0gtZ2J/frXqKetJaHL/fDdnk=;
        b=H0VOkUH6kFiFRhSSWjrvom6LWeHzTSED2VI5HUYUNPRl3GSZCeNaJGycMsblRsW78r
         RCy/urUE8RI81gri6nKuhQbc2gyg0bRJw2L/nWKhTY2BPLy013V8ASmnM4OCXT820UvI
         GwS8ukXlG6X0KJVAspARMB9ZXjMaeyLGMcwZ2Nujzr6+15iEKVFm8Gkqm3heOCVnUUKH
         BCuAg9gqUaFD9/Lqx2LYByNp3gHt7ny6xszNq5/tlAd89XEUZoBA5n+etUkiM7fbgeMi
         vCXF63ONggfFfyH+DsMT3SjAOQnTfLMHGT+ohduYU/hYCT9GOjep8iUrpFNxp6F2fFWW
         To3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686143379; x=1688735379;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rnMyzOk/vTKWlLvg7he0gtZ2J/frXqKetJaHL/fDdnk=;
        b=CzclFaD6GDOuBtRvN19xxZrTioPzKJGMBqlWx1ggZLHtX8FrwaALL+RAM2AupcVprp
         dD9pg+cCsIfngMy4X5jWQsk9axyx5yKAYdP3i7ygdEOsDnXIZob/cgEEK8MG1RVDFX+b
         bi3ZauCIvDgfSJwcmTGcn7wYwN3+meS7MBtGKfkvI0geQrz27gY/5OGv5IWsDCbLN0Kb
         7Rg0gZZRkxwK2t8SSNsoEz8KLtmkepdugJPMFr93+M1SC6W2uJYWlCxhG8Q+Qxk+8RnZ
         XwVz7i8t2MpurlYIE3q+VbCw0lhBRXa8xgN6k4pms3z/vdC0EQtOugCjl3SLfaqo3TV+
         Xi/w==
X-Gm-Message-State: AC+VfDwzx3vx/OdcnGb0M+9lS8umi4VJVbEq/jrbM1Ss9k1RExbOCt9a
	vAY7HIbVl9XYrblAVoJ3+R8pOA==
X-Google-Smtp-Source: ACHHUZ5Kxfe6zUKRliJXHJzL98zZQOfit49/YUSl3Eqmnm+9qVN4eSDGNJ3xfiznZgTmdSxzHwclbA==
X-Received: by 2002:a7b:c457:0:b0:3f6:f2b2:15c9 with SMTP id l23-20020a7bc457000000b003f6f2b215c9mr5057736wmi.37.1686143379440;
        Wed, 07 Jun 2023 06:09:39 -0700 (PDT)
Received: from smtpclient.apple ([131.111.5.246])
        by smtp.gmail.com with ESMTPSA id k9-20020adfe8c9000000b0030644bdefd8sm15284117wrn.52.2023.06.07.06.09.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 07 Jun 2023 06:09:38 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.500.231\))
Subject: Re: [PATCH -fixes] riscv: Check the virtual alignment before choosing
 a map size
From: Jessica Clarke <jrtc27@jrtc27.com>
In-Reply-To: <20230607125851.63370-1-alexghiti@rivosinc.com>
Date: Wed, 7 Jun 2023 14:09:28 +0100
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Jones <ajones@ventanamicro.com>,
 Rob Herring <robh@kernel.org>,
 Anup Patel <anup@brainfault.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Song Shuai <songshuaishuai@tinylab.org>
Message-Id: <E8ECB3E5-8DDA-443A-AD00-D337708DBE4C@jrtc27.com>
References: <20230607125851.63370-1-alexghiti@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
X-Mailer: Apple Mail (2.3731.500.231)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_060943_296726_04B52E70 
X-CRM114-Status: GOOD (  19.86  )
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

T24gNyBKdW4gMjAyMywgYXQgMTM6NTgsIEFsZXhhbmRyZSBHaGl0aSA8YWxleGdoaXRpQHJpdm9z
aW5jLmNvbT4gd3JvdGU6Cj4gCj4gV2UgdXNlZCB0byBvbmx5IGNoZWNrIHRoZSBhbGlnbm1lbnQg
b2YgdGhlIHBoeXNpY2FsIGFkZHJlc3MgdG8gZGVjaWRlCj4gd2hpY2ggbWFwcGluZyB3b3VsZCBm
aXQgZm9yIGEgY2VydGFpbiByZWdpb24gb2YgdGhlIGxpbmVhciBtYXBwaW5nLCBidXQKPiBpdCBp
cyBub3QgZW5vdWdoIHNpbmNlIHRoZSB2aXJ0dWFsIGFkZHJlc3MgbXVzdCBhbHNvIGJlIGFsaWdu
ZWQsIHNvIGNoZWNrCj4gdGhhdCB0b28uCj4gCj4gRml4ZXM6IDMzMzUwNjhmODcyMSAoInJpc2N2
OiBVc2UgUFVEL1A0RC9QR0QgcGFnZXMgZm9yIHRoZSBsaW5lYXIgbWFwcGluZyIpCj4gUmVwb3J0
ZWQtYnk6IFNvbmcgU2h1YWkgPHNvbmdzaHVhaXNodWFpQHRpbnlsYWIub3JnPgo+IExpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXJpc2N2L3RlbmNlbnRfN0MzQjU4MEI0N0MxQjE3
QzE2NDg4RUMxQHFxLmNvbS8KPiBTaWduZWQtb2ZmLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhn
aGl0aUByaXZvc2luYy5jb20+Cj4gLS0tCj4gYXJjaC9yaXNjdi9tbS9pbml0LmMgfCAxMyArKysr
KysrLS0tLS0tCj4gMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9pbml0LmMgYi9hcmNoL3Jpc2N2L21t
L2luaXQuYwo+IGluZGV4IGQ0MmVhMzFjN2RlMC4uNTE0M2VlZjRjMDc0IDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gKysrIGIvYXJjaC9yaXNjdi9tbS9pbml0LmMKPiBAQCAt
NjYwLDE4ICs2NjAsMTkgQEAgdm9pZCBfX2luaXQgY3JlYXRlX3BnZF9tYXBwaW5nKHBnZF90ICpw
Z2RwLAo+IGNyZWF0ZV9wZ2RfbmV4dF9tYXBwaW5nKG5leHRwLCB2YSwgcGEsIHN6LCBwcm90KTsK
PiB9Cj4gCj4gLXN0YXRpYyB1aW50cHRyX3QgX19pbml0IGJlc3RfbWFwX3NpemUocGh5c19hZGRy
X3QgYmFzZSwgcGh5c19hZGRyX3Qgc2l6ZSkKPiArc3RhdGljIHVpbnRwdHJfdCBfX2luaXQgYmVz
dF9tYXBfc2l6ZShwaHlzX2FkZHJfdCBwYSwgdWludHB0cl90IHZhLAoKV2h5IG9uIGVhcnRoIGlz
IHRoaXMgcmV0dXJuaW5nIHVpbnRwdHJfdD8gSXTigJlzIGEgc2l6ZSBub3QgYSBwb2ludGVyLgoK
SmVzcwoKPiArICAgICAgcGh5c19hZGRyX3Qgc2l6ZSkKPiB7Cj4gLSBpZiAoIShiYXNlICYgKFBH
RElSX1NJWkUgLSAxKSkgJiYgc2l6ZSA+PSBQR0RJUl9TSVpFKQo+ICsgaWYgKCEocGEgJiAoUEdE
SVJfU0laRSAtIDEpKSAmJiAhKHZhICYgKFBHRElSX1NJWkUgLSAxKSkgJiYgc2l6ZSA+PSBQR0RJ
Ul9TSVpFKQo+IHJldHVybiBQR0RJUl9TSVpFOwo+IAo+IC0gaWYgKCEoYmFzZSAmIChQNERfU0la
RSAtIDEpKSAmJiBzaXplID49IFA0RF9TSVpFKQo+ICsgaWYgKCEocGEgJiAoUDREX1NJWkUgLSAx
KSkgJiYgISh2YSAmIChQNERfU0laRSAtIDEpKSAmJiBzaXplID49IFA0RF9TSVpFKQo+IHJldHVy
biBQNERfU0laRTsKPiAKPiAtIGlmICghKGJhc2UgJiAoUFVEX1NJWkUgLSAxKSkgJiYgc2l6ZSA+
PSBQVURfU0laRSkKPiArIGlmICghKHBhICYgKFBVRF9TSVpFIC0gMSkpICYmICEodmEgJiAoUFVE
X1NJWkUgLSAxKSkgJiYgc2l6ZSA+PSBQVURfU0laRSkKPiByZXR1cm4gUFVEX1NJWkU7Cj4gCj4g
LSBpZiAoIShiYXNlICYgKFBNRF9TSVpFIC0gMSkpICYmIHNpemUgPj0gUE1EX1NJWkUpCj4gKyBp
ZiAoIShwYSAmIChQTURfU0laRSAtIDEpKSAmJiAhKHZhICYgKFBNRF9TSVpFIC0gMSkpICYmIHNp
emUgPj0gUE1EX1NJWkUpCj4gcmV0dXJuIFBNRF9TSVpFOwo+IAo+IHJldHVybiBQQUdFX1NJWkU7
Cj4gQEAgLTExNzcsNyArMTE3OCw3IEBAIHN0YXRpYyB2b2lkIF9faW5pdCBjcmVhdGVfbGluZWFy
X21hcHBpbmdfcmFuZ2UocGh5c19hZGRyX3Qgc3RhcnQsCj4gZm9yIChwYSA9IHN0YXJ0OyBwYSA8
IGVuZDsgcGEgKz0gbWFwX3NpemUpIHsKPiB2YSA9ICh1aW50cHRyX3QpX192YShwYSk7Cj4gbWFw
X3NpemUgPSBmaXhlZF9tYXBfc2l6ZSA/IGZpeGVkX21hcF9zaXplIDoKPiAtICAgIGJlc3RfbWFw
X3NpemUocGEsIGVuZCAtIHBhKTsKPiArICAgIGJlc3RfbWFwX3NpemUocGEsIHZhLCBlbmQgLSBw
YSk7Cj4gCj4gY3JlYXRlX3BnZF9tYXBwaW5nKHN3YXBwZXJfcGdfZGlyLCB2YSwgcGEsIG1hcF9z
aXplLAo+ICAgcGdwcm90X2Zyb21fdmEodmEpKTsKPiAtLSAKPiAyLjM5LjIKPiAKPiAKPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdAo+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKPiBodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2CgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
