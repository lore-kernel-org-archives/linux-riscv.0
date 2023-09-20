Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53F8ACE79A9
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 00:12:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amYtAhASYswjT4shJOZV9ESSwBxzn1s9l6lnIjSRBUg=; b=sor7k1mnl+rcHY
	8SOu05GSxmGZCxeORZrAN4Nyz3WtsDTpmg/lGp7jyqftLvo0WNtFMb9vwKmUtnDvzT8cJHnSTzJno
	FbwIuzlEfdSOX6l4599yko4JUde0pHNIvlPsP1gkyXqR+On65X5+vo16PUHv2sd5DCd3C7JKFlfan
	aPM3OxAmJoDiui1NrG31zEGKiCBQyXlcDYz5JHFwzXIWMhvc+lrJ5nHpJthWP8DzkkQ4arPL+iSPE
	d/tkVhyNOZnG8cX8QDUh6NrM8kN41ZnnCjRa+B+1qxNoYWOABlQwPBA/TSlGTGpwZt/RQTrpc69pX
	LLqaPE+e3B51sFNim3VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qikpF-001V9B-0l;
	Wed, 20 Sep 2023 00:12:17 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qikpC-001V8Q-09
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 00:12:15 +0000
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c00df105f8so43179181fa.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 17:12:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google; t=1695168730; x=1695773530; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1CviEhhoBlZKiA8T16gFI1fJMTl09yzCTO8KzCGSqRk=;
        b=N9k4O8oYPqD0Yp9M68YnIQxwKN66dSlTFvuEgcoxmmIC+nhfw1GVUdlQakbEFx8HyL
         kMCCXS6omd2/aj0py/2G/2MoYElDHBEZX+1bOSKMPqKMQS/JCYG32NvOGRXJ/ZhWZ8DT
         AN6peaC+ds7lezP/mUgWFlI0ybdoe46kr9i8w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695168730; x=1695773530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1CviEhhoBlZKiA8T16gFI1fJMTl09yzCTO8KzCGSqRk=;
        b=HPh51K2mg20sqjXwYZ4+/WwvgKROc+bpaehiCcADtf3HdEdGdUwYWxfUZUZEdVfDsP
         hNs4by0lGB4ujuKYacHTnCNK5wR3xXXrPuU9Vjs26Yhldk5LlsFUIlLBXDhjYIMSNKvH
         9Ost+NpWHrcnX/GcE81SkquyxPMnqM/m+Oh5YrUum6jQ+irHHtsN5u664/vqSL8UTCJV
         vu2NTr3Z6fj98yaI1T3YWB31Wu9HnfFS3GCDqLHVgWA0ApwTKTXEwUowcK7qnXcr2auD
         Xq6ktprluaqXqz/IQuos3pc9DNI++2JoHIYS56uYN8reznq/ItePabK5jW9YIY3hj1j+
         FfzA==
X-Gm-Message-State: AOJu0YyI7c8rvYh9VyDccepi5drREz4XvLfCuGM9c3OFe8+Q/kYotocN
	oW1O5k2qnmmlsskhAWxsWdIlOQ++qNA2e8OpPhJE
X-Google-Smtp-Source: AGHT+IE8zP3BzZusNhL+aAwkiDwCmIGdHT4wX12zJCKO252ijdL/DxCfHuNz/3MG+5CSLu9l+w9+0x7JLX8hmpsYVXk=
X-Received: by 2002:a05:6512:3ca6:b0:501:c1d4:cf68 with SMTP id
 h38-20020a0565123ca600b00501c1d4cf68mr1309878lfv.15.1695168729533; Tue, 19
 Sep 2023 17:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230912174928.528414-1-apatel@ventanamicro.com> <20230912174928.528414-2-apatel@ventanamicro.com>
In-Reply-To: <20230912174928.528414-2-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Tue, 19 Sep 2023 17:11:58 -0700
Message-ID: <CAOnJCU+0iUR+ziwkPnEykoS+Ym8zkG-Afs_XyyCSD4fi8wjP6w@mail.gmail.com>
Subject: Re: [PATCH v8 01/16] RISC-V: Don't fail in riscv_of_parent_hartid()
 for disabled HARTs
To: Anup Patel <apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_171214_353216_C648EA5F 
X-CRM114-Status: GOOD (  20.82  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBTZXAgMTIsIDIwMjMgYXQgMTA6NTDigK9BTSBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVu
dGFuYW1pY3JvLmNvbT4gd3JvdGU6Cj4KPiBUaGUgcmlzY3Zfb2ZfcHJvY2Vzc29yX2hhcnRpZCgp
IHVzZWQgYnkgcmlzY3Zfb2ZfcGFyZW50X2hhcnRpZCgpIGZhaWxzCj4gZm9yIEhBUlRzIGRpc2Fi
bGVkIGluIHRoZSBEVC4gVGhpcyByZXN1bHRzIGluIHRoZSBmb2xsb3dpbmcgd2FybmluZwo+IHRo
cm93biBieSB0aGUgUklTQy1WIElOVEMgZHJpdmVyIGZvciB0aGUgRS1jb3JlIG9uIFNpRml2ZSBi
b2FyZHM6Cj4KPiBbICAgIDAuMDAwMDAwXSByaXNjdi1pbnRjOiB1bmFibGUgdG8gZmluZCBoYXJ0
IGlkIGZvciAvY3B1cy9jcHVAMC9pbnRlcnJ1cHQtY29udHJvbGxlcgo+Cj4gVGhlIHJpc2N2X29m
X3BhcmVudF9oYXJ0aWQoKSBpcyBvbmx5IGV4cGVjdGVkIHRvIHJlYWQgdGhlIGhhcnRpZCBmcm9t
Cj4gdGhlIERUIHNvIHdlIHNob3VsZCBkaXJlY3RseSBjYWxsIG9mX2dldF9jcHVfaHdpZCgpIGlu
c3RlYWQgb2YgY2FsbGluZwo+IHJpc2N2X29mX3Byb2Nlc3Nvcl9oYXJ0aWQoKS4KPgo+IEZpeGVz
OiBhZDYzNWU3MjNlMTcgKCJyaXNjdjogY3B1OiBBZGQgNjRiaXQgaGFydGlkIHN1cHBvcnQgb24g
UlY2NCIpCj4gU2lnbmVkLW9mZi1ieTogQW51cCBQYXRlbCA8YXBhdGVsQHZlbnRhbmFtaWNyby5j
b20+Cj4gLS0tCj4gIGFyY2gvcmlzY3Yva2VybmVsL2NwdS5jIHwgMTEgKysrKysrLS0tLS0KPiAg
MSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPgo+IGRpZmYg
LS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NwdS5j
Cj4gaW5kZXggYzE3ZGFjYjExNDFjLi4xNTdhY2U4YjI2MmMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9y
aXNjdi9rZXJuZWwvY3B1LmMKPiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9jcHUuYwo+IEBAIC0x
MjUsMTMgKzEyNSwxNCBAQCBpbnQgX19pbml0IHJpc2N2X2Vhcmx5X29mX3Byb2Nlc3Nvcl9oYXJ0
aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBsbwo+ICAgKi8KPiAgaW50IHJp
c2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBs
b25nICpoYXJ0aWQpCj4gIHsKPiAtICAgICAgIGludCByYzsKPiAtCj4gICAgICAgICBmb3IgKDsg
bm9kZTsgbm9kZSA9IG5vZGUtPnBhcmVudCkgewo+ICAgICAgICAgICAgICAgICBpZiAob2ZfZGV2
aWNlX2lzX2NvbXBhdGlibGUobm9kZSwgInJpc2N2IikpIHsKPiAtICAgICAgICAgICAgICAgICAg
ICAgICByYyA9IHJpc2N2X29mX3Byb2Nlc3Nvcl9oYXJ0aWQobm9kZSwgaGFydGlkKTsKPiAtICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoIXJjKQo+IC0gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgKmhhcnRpZCA9ICh1bnNp
Z25lZCBsb25nKW9mX2dldF9jcHVfaHdpZChub2RlLCAwKTsKPiArICAgICAgICAgICAgICAgICAg
ICAgICBpZiAoKmhhcnRpZCA9PSB+MFVMKSB7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBwcl93YXJuKCJGb3VuZCBDUFUgd2l0aG91dCBoYXJ0IElEXG4iKTsKPiArICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIH0KPiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiAgICAgICAgICAg
ICAgICAgfQo+ICAgICAgICAgfQo+Cj4gLS0KPiAyLjM0LjEKPgoKTEdUTS4KClJldmlld2VkLWJ5
OiBBdGlzaCBQYXRyYSA8YXRpc2hwQHJpdm9zaW5jLmNvbT4KCi0tIApSZWdhcmRzLApBdGlzaAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
