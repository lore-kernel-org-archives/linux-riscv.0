Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18C9CCF9F8
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 08:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2hz6bMvC1tRN3HEdKSSkBoiprN2Sy36DZvfauan8Lw=; b=ZP2Zv+o5SRb5C4
	bn73tQVCRaQjqVWfX7YEeBK762119qJvpOBcgWucnqEF9Hknx/jc9nYhc2TVuQz6j+TJN3n/UUOqZ
	7ciBUpGiAZKcrfZYw5OQxKHh2n4yyxbc7gksO7nbbA/a5SFTq6M8Hu22pFuEJBRiCrCR4c30IaRbR
	+OPnEHWpKyPiwpP2ohc4vBPKa/RvKkDT7pSzeEdwFZisbnPh4F0psU4sVF68wrt3QfbkbiXO9NGwu
	7oftydHa36YuX+z24VQRbWxU0TxIRR85NigqJHm49ezpru7bo5LX1VHTi53uyPPntLcwJ31nypi8f
	DP17elA3LDuYtrgfGmww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENsE-00000003gGN-47D3;
	Thu, 30 Oct 2025 08:19:11 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vENsC-00000003gFq-1GLV
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 08:19:09 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-57992ba129eso972670e87.3
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 01:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761812346; x=1762417146; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZSc3Yfohy0GneZpcaYTXUsRgt/OPg+2FZgItitcnEM=;
        b=MWSqc7S6RydQDDK3+M4OjZKxweK4o3iwMwl1OSJeVnYb2cw/Cdh/VYumT0JAaK/qva
         pLQ333tTMPkOa8mmV7u+BTKfoYH7slJzH8ZVF/U1SkmTj7e6PbzIPHGlFair5sc0PsNs
         X17rXZZZlSYfA4kULKxnNM4rjT1CXhA52OxVa0K/EjZiWWNFvkDswiVizp7pRq/pzYxA
         7iRc1D+On7k5mw7+1Ih/+/v48geA0pqTvBAI2nsQ8RCMNRG+6FCOHxJMWdXBZPaLgxe6
         UTIQDy0nRkjxsAVmjFahPtJ+ob+VBN3yDg82v8cn+vEHr9fYek+L9E9m04l5BEjAyOEx
         mAqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761812346; x=1762417146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZSc3Yfohy0GneZpcaYTXUsRgt/OPg+2FZgItitcnEM=;
        b=eJ2/I6wDBStFZdlLfHbH4vRwHxs2uWkbnThsr0HqyEJg9sAOBWoamyo8goIKCcpK7A
         bSQVCKBBh5NiplUXunXuPfcgotV7rX2OpFGb3gh4qZdlRBk0Rj/zvT7Mmm22Bme/FwdU
         RqNjLei78jY5TOwph0GhkKAKoEHPRXFO4I59Xilu85Dcuo0SwLy6mBl6QZmUFJawkBvG
         54vdkug7PV2t4qXonhkj6T8xRCYcaL452qgzN8Tbuioye4tImPT/guUT8eXJCpzs2pJl
         CBlsFY1ZWkbaWfPPlpPtMYV4llIuI4fc9Sd+2fxQVf5xDSYaSJR8eCZCvfKBN/ZAWoK5
         BcSA==
X-Forwarded-Encrypted: i=1; AJvYcCW/YEyH9YYuwiOLwtXMO9+KYx5uTabvJ8bfAboOGekLazGNXdyG0jpyBNYp9pVtyoq7tmm/DwNxY8ypaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyV6fWV9lw4siGs/MBHM+oKvMZfp4MvKTDDV7/R2uQh0fdkSEjV
	8s2fev9ukMXlfiuyABTbTdVrhwS/TMUIlzay5JSlvCNX2yr17V+qq3j86PaxVWCZUeBEPMeFAIo
	+WaCZ67kfpp502rYwtomC+/zuFXUM0ivztzJFFQqeWA==
X-Gm-Gg: ASbGncs4TIr8wt7HuQA4DUr+uzc46/hvBe78SDA2SJNjmUgKJZcG/YkOOx7AgwiLTRq
	iYmcA++lfhET2SL3+wFTBdJrEPDHPNO3IMk8FL52nRjUnRl93KoxgVfNhKpWzqVnxbO3plbbOQD
	myfH6Xo9bKwT+/+FbM+o/goZAJSyESbBFnCuiT/7GGW2Rp3mG6iWN/+XDZ9Jjibv3PVNcp1cMMB
	qCHgbInF8XHGunPvKm3n9ER8wTZPtSPIlpivkC0RyeOuhuOsQDxtTcwFMD1
X-Google-Smtp-Source: AGHT+IFpU5SfD5f6aYsrY94jW2ThyTJxMXRujbccn17De50s7ThAJI6lRpfdtUVW5umqLgWUYZ7hiZL74+1ScUCScAU=
X-Received: by 2002:a05:6512:3989:b0:590:9a11:9c2f with SMTP id
 2adb3069b0e04-59412c4d006mr1997751e87.50.1761812346100; Thu, 30 Oct 2025
 01:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20251029-isolation-shield-b66aea79a9a4@spud>
In-Reply-To: <20251029-isolation-shield-b66aea79a9a4@spud>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 30 Oct 2025 09:18:55 +0100
X-Gm-Features: AWmQ_bl-lBgjTxJAyqBuCSaVQyLLToyI0K2Q3rw5bzF0J-trmHFQhxiymB76HMM
Message-ID: <CACRpkdaEwa_HMTQ9gOyKh+i+gU1oAqGrPwV7VKF3+W58BMbNZA@mail.gmail.com>
Subject: Re: [PATCH v1] pinctrl: mpfs-iomux0: fix compile-time constant
 warning for LLVM prior to 17
To: Conor Dooley <conor@kernel.org>
Cc: linux-gpio@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
	Nathan Chancellor <nathan@kernel.org>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_011908_348530_68085F7A 
X-CRM114-Status: GOOD (  10.81  )
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

T24gV2VkLCBPY3QgMjksIDIwMjUgYXQgNDozMOKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cgo+IEZyb206IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3Jv
Y2hpcC5jb20+Cj4KPiBXaXRoIExMVk0gcHJpb3IgdG8gMTcuMC4wOgo+Cj4gZHJpdmVycy9waW5j
dHJsL3BpbmN0cmwtbXBmcy1pb211eDAuYzo4OToyOiBlcnJvcjogaW5pdGlhbGl6ZXIgZWxlbWVu
dCBpcyBub3QgYSBjb21waWxlLXRpbWUgY29uc3RhbnQKPiAgICAgICAgIE1QRlNfSU9NVVgwX0dS
T1VQKHNwaTApLAo+ICAgICAgICAgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KPiBkcml2ZXJzL3Bp
bmN0cmwvcGluY3RybC1tcGZzLWlvbXV4MC5jOjc5OjEwOiBub3RlOiBleHBhbmRlZCBmcm9tIG1h
Y3JvICdNUEZTX0lPTVVYMF9HUk9VUCcKPiAgICAgICAgIC5tYXNrID0gQklUKG1wZnNfaW9tdXgw
XyMjX25hbWUjI19waW5zWzBdKSwgICAgIFwKPiAgICAgICAgICAgICAgICAgXn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgo+IGluY2x1ZGUvdmRzby9iaXRzLmg6NzoxOTogbm90ZTog
ZXhwYW5kZWQgZnJvbSBtYWNybyAnQklUJwo+IFwjZGVmaW5lIEJJVChucikgICAgICAgICAgICAg
ICAgIChVTCgxKSA8PCAobnIpKQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+
fn5+fn5+fn5+fn5+Cj4KPiBUaGlzIGlzIGEgY29uc3RhbnQsIGJ1dCBMTFZNIHByaW9yIHRvIGEg
Y2hhbmdlIGZyb20gTmljayB0byBtYXRjaCB0aGUKPiBnY2MgYmVoYXZpb3VyIGRpZCBub3QgYWxs
b3cgdGhpcy4gVGhlIG1hY3JvIGlzbid0IHJlYWxseSBhbGwgdGhhdCBtdWNoCj4gb2YgYW4gaWRp
b3QtcHJvb2ZpbmcsIGp1c3QgY2hhbmdlIGl0IHRvIHRoZSBzYW1lIHNvcnQgdGhhdCdzIGluIHRo
ZQo+IGdwaW8yIGRyaXZlciwgd2hlcmUgYSBzZWNvbmQgYXJndW1lbnQgcHJvdmlkZXMgdGhlIG1h
c2svc2V0dGluZy4KPgo+IFJlcG9ydGVkLWJ5OiBOYXRoYW4gQ2hhbmNlbGxvciA8bmF0aGFuQGtl
cm5lbC5vcmc+Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL0NsYW5nQnVpbHRMaW51eC9saW51
eC9pc3N1ZXMvMjE0MAo+IEZpeGVzOiA0NjM5NzI3NGRhMjIgKCJwaW5jdHJsOiBhZGQgcG9sYXJm
aXJlIHNvYyBpb211eDAgcGlubXV4IGRyaXZlciIpCj4gU2lnbmVkLW9mZi1ieTogQ29ub3IgRG9v
bGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KClBhdGNoIGFwcGxpZWQhCgpZb3VycywK
TGludXMgV2FsbGVpagoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVh
ZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgo=
