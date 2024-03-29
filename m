Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2ADDCD11DD
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 10:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n7BVarddtofp3dHeqDp49OZkswrFCV8BUoeIuYfeYzc=; b=XNxPszDrVSBfko
	2BABq9Zxno0AZOp+izx2hFlZV6sCfAYte0SWNvWv0i83a+rkgaRPzxrj6tuOoeYAmA6ddVmupJyEI
	p6nF32cIJCayLiJEEY3vo2fdANedM0zOp2XCI/D4Vh+U6p74YcnL9zP+xpPq4nj2hL7diEE8FiPfG
	yQxEPPRtXGbnZVjx+UUB6mhBy4LuaomJ4cz1+pTZAPa7dcSGNkhiP6YzBKBpbHAJ+TRcxHPJG2zlu
	prcjsuCAwTupAcqgJQrKUwWbw64NWt1FdK7kHw1xfwtlLTLqrugj9tGQVtXfq5dwI5SlJ9zx9A6R+
	D5+ry62eUgrpzER9qniA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9UD-000000002p3-3Fj1;
	Fri, 29 Mar 2024 10:29:25 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq9U8-000000002mJ-1fps
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 10:29:21 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-515a97846b5so1929486e87.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1711708159; x=1712312959; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K1xMjM+6aRGQ0ojnpGkzeXSIPQCNkcUYgWEAekM4AZs=;
        b=FP3LKV+gWdwlS2riXxUSil9CXPQAjWbl500VFXSIijJD6etELhVUB5lcyQhYQW1Hhv
         ViYhspAIr97A4Zm3Ov44fVWRkHwBBPqvKFiLtmDhBHTO0uF2hy55Zkb44MqF1jX9/Pxq
         x1gTvYkMdXjLUT52pwQBR4/3bG+bzQKhgStI0Tz9WzEu9fiKXd1vPvQr737FQjsu0p7R
         i1BZynkf5kMIwmvx5paHH8RLYtFLyKGASZom8vK/FbbcNZiW9LY+3VmQVn4JXJwVvlEU
         41MGbSl5ZfJcw+hQpC+EP83M4J6Yo+9MaCVikJI3OoU/otYda7qfnwSEkqx+f8XSC5hn
         U6yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711708159; x=1712312959;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K1xMjM+6aRGQ0ojnpGkzeXSIPQCNkcUYgWEAekM4AZs=;
        b=fzDZ6111PgfIzv84zQPgp3BUtUHNnaWxP1rHeIzq5NsjtrGU9uj5F8PPtYDbhEoCYm
         a70DhHgxpoXMrKFoMhEkkK1I0Ja2QFsbfobqlWgPXWKNba9kqF201rFHMA1Dv4Uw67Qs
         gb2qPutkAGrmAF3uCgXY8Ho168NyniiKGzAVV6Tz/U50Hj7CW3Oj/Q0YEoMrKHy53+QA
         NCsXd+5PW0I0Q9SXDbfuBPEH8iad6qT9uYZwJlMaJHzRE0GU0HjwLnP1Uoj4VWdQxt6g
         HFp3YcZDxJI2+aZnT5q0kwxdhaqDS0qXWFZMMNtRuiDJVCUu64M7A35+/2CYZjT+99Uu
         RW8A==
X-Gm-Message-State: AOJu0YxA5LXvzJgEEx2zMUsrflf+TBsEilsM6AenpgZBYix19CwSPuU8
	SeB+rHenn38106ZnHVS9GabvuCmUyl0Hp2Ok/RRaU7R6oCVtny4eiNN5GTc9cgtCWbrF7jt+6aR
	BR4p+VlMBXOXZxWRZNykGtVFiU3bgyqdJ1bgLoA==
X-Google-Smtp-Source: AGHT+IFf1CNNBqLUzGwlQt3plBwsiRGnRlRofcvJpqCa5fkmx12mwCxpLy9gpfToW29g1IssLHz467H64sFTESJvcbo=
X-Received: by 2002:a19:a408:0:b0:515:ad80:566e with SMTP id
 q8-20020a19a408000000b00515ad80566emr1308393lfc.27.1711708158926; Fri, 29 Mar
 2024 03:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327-parkway-dodgy-f0fe1fa20892@spud> <20240327-overrate-overuse-1e32abccd001@spud>
In-Reply-To: <20240327-overrate-overuse-1e32abccd001@spud>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 29 Mar 2024 11:29:08 +0100
Message-ID: <CAMRc=Mdkxh_Soc6Uy5vYrh5Svdc=hBBRwdAoGbU04V=We=YWZQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] dt-bindings: gpio: mpfs: allow gpio-line-names
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Jamie Gibbons <jamie.gibbons@microchip.com>, 
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_032920_461309_467AE3D5 
X-CRM114-Status: GOOD (  12.34  )
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

T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMToyNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBGcm9tOiBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJib25zQG1p
Y3JvY2hpcC5jb20+Cj4KPiBUaGUgQmVhZ2xlViBGaXJlIGRldmljZXRyZWUgd2lsbCBtYWtlIHVz
ZSBvZiBncGlvLWxpbmUtbmFtZXMsIGFsbG93IGl0Cj4gaW4gdGhlIGJpbmRpbmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBKYW1pZSBHaWJib25zIDxqYW1pZS5naWJib25zQG1pY3JvY2hpcC5jb20+Cj4g
U2lnbmVkLW9mZi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4K
PiAtLS0KPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vbWljcm9jaGlw
LG1wZnMtZ3Bpby55YW1sIHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL21p
Y3JvY2hpcCxtcGZzLWdwaW8ueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL21pY3JvY2hpcCxtcGZzLWdwaW8ueWFtbAo+IGluZGV4IDY4ODRkYWNiMjg2NS4uZDYx
NTY5YjNmMTViIDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9ncGlvL21pY3JvY2hpcCxtcGZzLWdwaW8ueWFtbAo+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9ncGlvL21pY3JvY2hpcCxtcGZzLWdwaW8ueWFtbAo+IEBAIC00NCw2
ICs0NCw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICBkZWZhdWx0OiAzMgo+Cj4gICAgZ3Bpby1jb250
cm9sbGVyOiB0cnVlCj4gKyAgZ3Bpby1saW5lLW5hbWVzOiB0cnVlCj4KPiAgcGF0dGVyblByb3Bl
cnRpZXM6Cj4gICAgIl4uKy1ob2coLVswLTldKyk/JCI6Cj4gLS0KPiAyLjQzLjAKPgoKQXBwbGll
ZCwgdGhhbmtzIQoKQmFydAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
