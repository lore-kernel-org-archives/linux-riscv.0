Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 039F4C35274
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Dec 2023 20:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7ASWGXbPLcNQPBxXTTgx94qr4DTA2ybvP/84Vx7Aswk=; b=h27p/G9+JeGF0+
	gUObxZ4xai1J6JeOpzI3e1v1GuwMIKKbggzOV8vcUVxDDpoF3CME7wKL2ILCVW9IH19chb7WaAQc8
	HckJKfdbCV7PI7x0u+gfo+kKS1Y2Q5H23rez3pLKa2GsjXIDOk3/CP97QgYw9lL2nu0U3e+1GDvwF
	SPw2SmtP49WqinadYVapJRYA3LmvdtrEZd43oTFQNE2ocxeK6GfksQlqncKZJK8Nj8+3uGKfRLgDU
	6ZwWuj8iva+D+qvCBprZso/5BH1R/z/HwbmtXE6QwYARXNnpEQ0oWQld/4qqSt6/xGVxHx9ajgLjn
	z/WzVQ7lkqZ+KOKwm4CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKGZ-00C1X0-1m;
	Mon, 18 Dec 2023 20:31:07 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFKGU-00C1Ve-2Z;
	Mon, 18 Dec 2023 20:31:04 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-203aa9c19ceso242193fac.0;
        Mon, 18 Dec 2023 12:31:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702931461; x=1703536261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5tAlFGdRk7dsOpEqAvR+OuH9VoSVkSPM03m6WEM5ITU=;
        b=w4o1WTqHvQ5/Bzii5/0SZdCL6SPrXQJ/a1/mdJgjEBbJLOsia3TH0dTSI7PcmjMs8z
         E//DmSI3yolKYxd8ztWJ2PDPdWAis1Si8MCSwCayqBb0VVfMhbm50YjQdc8g3rphbztS
         C7g028yvIXHmrmwUwVBknRscdFS6OyruchMAxckqSYb3jFKS5QsycPafWVoLIU3rDEUi
         87whJpXiMXZaCglCprvn2UePc7yDhj93Zyl0y+LpNkQ3N+fI2eH2oADpb9Voyfmr3phZ
         WH1x+wTO72Ygb+R8LCSagdRkFyvYM0TD3nLbGbvrYoIPvXuXXPZp68+jJyUFO1lLBrbG
         KUPg==
X-Gm-Message-State: AOJu0Yy92QNzCr8EfbR9U0qptFk11oWLxzpmESQgc044VQoN757YQQdQ
	E00FlEnN8+v6LuqUbbEw6Nt33+y03YQS+YspY5I=
X-Google-Smtp-Source: AGHT+IH2/Xcl6oIvnSfLcxllKujvsfBDeafZqBXfGcoJ6ZYuhTDpjdkrOr2cBBTAZn748hcGAPQjloWIL3tDogLMDwE=
X-Received: by 2002:a05:6870:420d:b0:1fb:5d05:685e with SMTP id
 u13-20020a056870420d00b001fb5d05685emr31445963oac.2.1702931460922; Mon, 18
 Dec 2023 12:31:00 -0800 (PST)
MIME-Version: 1.0
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk> <E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
In-Reply-To: <E1rDOg7-00Dvjq-VZ@rmk-PC.armlinux.org.uk>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 18 Dec 2023 21:30:50 +0100
Message-ID: <CAJZ5v0je=-oVnSumZs=dzcyVuVUeVeTgO7yOnjGg1igyrS7EHQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 04/21] ACPI: processor: Register all CPUs from acpi_processor_get_info()
To: Russell King <rmk+kernel@armlinux.org.uk>
Cc: linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_123102_834195_EEC4ABBA 
X-CRM114-Status: GOOD (  26.62  )
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

T24gV2VkLCBEZWMgMTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5l
bEBhcm1saW51eC5vcmcudWs+IHdyb3RlOgo+Cj4gRnJvbTogSmFtZXMgTW9yc2UgPGphbWVzLm1v
cnNlQGFybS5jb20+Cj4KPiBUbyBhbGxvdyBBQ1BJIHRvIHNraXAgdGhlIGNhbGwgdG8gYXJjaF9y
ZWdpc3Rlcl9jcHUoKSB3aGVuIHRoZSBfU1RBCj4gdmFsdWUgaW5kaWNhdGVzIHRoZSBDUFUgY2Fu
J3QgYmUgYnJvdWdodCBvbmxpbmUgcmlnaHQgbm93LCBtb3ZlIHRoZQo+IGFyY2hfcmVnaXN0ZXJf
Y3B1KCkgY2FsbCBpbnRvIGFjcGlfcHJvY2Vzc29yX2dldF9pbmZvKCkuCgpUaGlzIGtpbmQgb2Yg
bG9va3MgYmFja3dhcmRzIHRvIG1lIGFuZCBoYXMgYSBwb3RlbnRpYWwgdG8gYmVjb21lCnN1cGVy
LWNvbmZ1c2luZy4KCkkgd291bGQgaW5zdGVhZCBhZGQgYSB3YXkgZm9yIHRoZSBnZW5lcmljIGNv
ZGUgdG8gYXNrIHRoZSBwbGF0Zm9ybQpmaXJtd2FyZSB3aGV0aGVyIG9yIG5vdCB0aGUgZ2l2ZW4g
Q1BVIGlzIGVuYWJsZWQgYW5kIHNvIGl0IGNhbiBiZQpyZWdpc3RlcmVkLgoKPiBTeXN0ZW1zIGNh
biBzdGlsbCBiZSBib290ZWQgd2l0aCAnYWNwaT1vZmYnLCBvciBub3QgaW5jbHVkZSBhbgo+IEFD
UEkgZGVzY3JpcHRpb24gYXQgYWxsLiBGb3IgdGhlc2UsIHRoZSBDUFVzIGNvbnRpbnVlIHRvIGJl
Cj4gcmVnaXN0ZXJlZCBieSBjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWMoKS4KPgo+IFRoaXMgbW92
ZXMgdGhlIENQVSByZWdpc3RlciBsb2dpYyBiYWNrIHRvIGEgc3Vic3lzX2luaXRjYWxsKCksCj4g
d2hpbGUgdGhlIG1lbW9yeSBub2RlcyB3aWxsIGhhdmUgYmVlbiByZWdpc3RlcmVkIGVhcmxpZXIu
CgpJc24ndCB0aGlzIHNvbWV3aGF0IHJpc2t5PwoKPiBTaWduZWQtb2ZmLWJ5OiBKYW1lcyBNb3Jz
ZSA8amFtZXMubW9yc2VAYXJtLmNvbT4KPiBSZXZpZXdlZC1ieTogR2F2aW4gU2hhbiA8Z3NoYW5A
cmVkaGF0LmNvbT4KPiBUZXN0ZWQtYnk6IE1pZ3VlbCBMdWlzIDxtaWd1ZWwubHVpc0BvcmFjbGUu
Y29tPgo+IFRlc3RlZC1ieTogVmlzaG51IFBhamp1cmkgPHZpc2hudUBvcy5hbXBlcmVjb21wdXRp
bmcuY29tPgo+IFRlc3RlZC1ieTogSmlhbnlvbmcgV3UgPGppYW55b25nLnd1QGFybS5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogUnVzc2VsbCBLaW5nIChPcmFjbGUpIDxybWsra2VybmVsQGFybWxpbnV4
Lm9yZy51az4KPiAtLS0KPiBDaGFuZ2VzIHNpbmNlIFJGQyB2MjoKPiAgKiBGaXh1cCBjb21tZW50
IGluIGFjcGlfcHJvY2Vzc29yX2dldF9pbmZvKCkgKEdhdmluIFNoYW4pCj4gICogQWRkIGNvbW1l
bnQgaW4gY3B1X2Rldl9yZWdpc3Rlcl9nZW5lcmljKCkgKEdhdmluIFNoYW4pCj4gLS0tCj4gIGRy
aXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jIHwgMTIgKysrKysrKysrKysrCj4gIGRyaXZlcnMv
YmFzZS9jcHUuYyAgICAgICAgICAgIHwgIDYgKysrKystCj4gIDIgZmlsZXMgY2hhbmdlZCwgMTcg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvYWNw
aS9hY3BpX3Byb2Nlc3Nvci5jIGIvZHJpdmVycy9hY3BpL2FjcGlfcHJvY2Vzc29yLmMKPiBpbmRl
eCAwNTExZjJiYzEwYmMuLmU3ZWQ0NzMwY2JiZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2FjcGkv
YWNwaV9wcm9jZXNzb3IuYwo+ICsrKyBiL2RyaXZlcnMvYWNwaS9hY3BpX3Byb2Nlc3Nvci5jCj4g
QEAgLTMxNCw2ICszMTQsMTggQEAgc3RhdGljIGludCBhY3BpX3Byb2Nlc3Nvcl9nZXRfaW5mbyhz
dHJ1Y3QgYWNwaV9kZXZpY2UgKmRldmljZSkKPiAgICAgICAgICAgICAgICAgICAgICAgICBjcHVm
cmVxX2FkZF9kZXZpY2UoImFjcGktY3B1ZnJlcSIpOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICAv
Kgo+ICsgICAgICAgICogUmVnaXN0ZXIgQ1BVcyB0aGF0IGFyZSBwcmVzZW50LiBnZXRfY3B1X2Rl
dmljZSgpIGlzIHVzZWQgdG8gc2tpcAo+ICsgICAgICAgICogZHVwbGljYXRlIENQVSBkZXNjcmlw
dGlvbnMgZnJvbSBmaXJtd2FyZS4KPiArICAgICAgICAqLwo+ICsgICAgICAgaWYgKCFpbnZhbGlk
X2xvZ2ljYWxfY3B1aWQocHItPmlkKSAmJiBjcHVfcHJlc2VudChwci0+aWQpICYmCj4gKyAgICAg
ICAgICAgIWdldF9jcHVfZGV2aWNlKHByLT5pZCkpIHsKPiArICAgICAgICAgICAgICAgaW50IHJl
dCA9IGFyY2hfcmVnaXN0ZXJfY3B1KHByLT5pZCk7Cj4gKwo+ICsgICAgICAgICAgICAgICBpZiAo
cmV0KQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gKyAgICAgICB9Cj4g
Kwo+ICAgICAgICAgLyoKPiAgICAgICAgICAqICBFeHRyYSBQcm9jZXNzb3Igb2JqZWN0cyBtYXkg
YmUgZW51bWVyYXRlZCBvbiBNUCBzeXN0ZW1zIHdpdGgKPiAgICAgICAgICAqICBsZXNzIHRoYW4g
dGhlIG1heCAjIG9mIENQVXMuIFRoZXkgc2hvdWxkIGJlIGlnbm9yZWQgX2lmZgo+IGRpZmYgLS1n
aXQgYS9kcml2ZXJzL2Jhc2UvY3B1LmMgYi9kcml2ZXJzL2Jhc2UvY3B1LmMKPiBpbmRleCA0N2Rl
MGYxNDBiYTYuLjEzZDA1MmJmMTNmNCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2Jhc2UvY3B1LmMK
PiArKysgYi9kcml2ZXJzL2Jhc2UvY3B1LmMKPiBAQCAtNTUzLDcgKzU1MywxMSBAQCBzdGF0aWMg
dm9pZCBfX2luaXQgY3B1X2Rldl9yZWdpc3Rlcl9nZW5lcmljKHZvaWQpCj4gIHsKPiAgICAgICAg
IGludCBpLCByZXQ7Cj4KPiAtICAgICAgIGlmICghSVNfRU5BQkxFRChDT05GSUdfR0VORVJJQ19D
UFVfREVWSUNFUykpCj4gKyAgICAgICAvKgo+ICsgICAgICAgICogV2hlbiBBQ1BJIGlzIGVuYWJs
ZWQsIENQVXMgYXJlIHJlZ2lzdGVyZWQgdmlhCj4gKyAgICAgICAgKiBhY3BpX3Byb2Nlc3Nvcl9n
ZXRfaW5mbygpLgo+ICsgICAgICAgICovCj4gKyAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklH
X0dFTkVSSUNfQ1BVX0RFVklDRVMpIHx8ICFhY3BpX2Rpc2FibGVkKQo+ICAgICAgICAgICAgICAg
ICByZXR1cm47Cj4KPiAgICAgICAgIGZvcl9lYWNoX3ByZXNlbnRfY3B1KGkpIHsKPiAtLQo+IDIu
MzAuMgo+Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
