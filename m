Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC9F1C433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jun 2022 07:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yypMD8WZfiqEijVC27syc4fhGqRuEDbLSgd58eqgaE=; b=GwK5Qn3680gaye
	MBPgfhzb9IkUayfjg3vdMPKejiDnjMeB7vEADU6ZE0rO/u+oPMAMevljMsysHlPPV5W7inl/pNzHd
	AmYSCG/cSFsoYB98bKCYz9l8pflfUCFkG751KYgeUY1ZKFwpYpm7XqJdsBeHibKzWomcJCWukluZm
	GF+QC6Y2gFbLU/F8RNEg9+Ox45tIjH/zgyHY5FUGUmHxLfwl8DCCYyRowBXg+MswZVFQqVx9jCa+b
	8W66iK361c+jm650OHiaVrc7umACLnQQGGlduInYIlJFhkFQZOBU3uWAGDoBop2qTHmAl81C1Zlxp
	gnPF+3w9QXqijcQIMCBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqQk-00Bk4O-8t; Wed, 08 Jun 2022 07:48:42 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyqQZ-00Bk1C-4t
	for linux-riscv@lists.infradead.org; Wed, 08 Jun 2022 07:48:33 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n124-20020a1c2782000000b003972dfca96cso10642368wmn.4
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jun 2022 00:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=lqY+yGTizo28KA0GxuLPPWRDIJPNvZCC8690vTojGfw=;
        b=rJKimGqxM9lPho0kjQMT0As4HYnbCFTaudyp28LP4beS819PzchOl4qBDzu6wfHVhD
         R/7b2ucXeGP3hrljf6RxhjU+dOHq80y2Xrs/EtV17nXhvc4FpovzQmOiD0QpDrrM02yq
         zUOTzwD4G9XGZA47M1e9Hbd75sPnAf4N7wPPYS++GeQfVxU+CtKoKijJKfKskGYmlk4w
         Iu10ozBkMGDF7dtHw0V5NsueqChUEhHQeEdvFoJ77kKZ9Vng3WEewmalzTwvhN2Iuasv
         hPRwlKg5YH3aI2k4LcgrjdAshwp8ifEcZMf3E5HJO2LFnhSlxfUbxdkpNSg4t5Y8aGSj
         UKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=lqY+yGTizo28KA0GxuLPPWRDIJPNvZCC8690vTojGfw=;
        b=hJ4qx+gdirbsaPJFE4iET6nU+cC6aOZxDfGF/eVpsSXxchn/QeoujKy5lXfM+87Ljx
         PnPVVEwciLiaupDFEzFby2LPGETrDUPlb/NrRZcsC/r6nalv7k3GalJf9XW3SNB5HNSJ
         4MACs8h9B5JKsYJs9wRLqa1txY+hcSjHq37+hVB0ZMrUkz7OO+L8Uczxy4zWA89bUWQ7
         qUbcPKeaWdhSpYwOA7EwM0WTDyZ+e8Iv5uQuxC09bQEWj/i0BUPkxhwqokoY+g8C4Lmk
         +CavhwvFbVr4m9NdvSOJsd/fP3upgPH+5KA5JbLr2VnpJKgU7TMGJ2Hj5MKzn7jO0vOv
         aHwg==
X-Gm-Message-State: AOAM530ynDlVMiXOpzFKpxH1d6PcHR9ehFjLoo+x8TeYv7j1uyQhzso+
	9Rvva2Io2VNQUV0IVM3FB9hSsA==
X-Google-Smtp-Source: ABdhPJzX8u/vF1uMO+f6IIT0LehkLZnmEeGwTIeTTQ25oBVz6rOOKXk8eZ2rx4zRGhav0uPYaI11Ew==
X-Received: by 2002:a05:600c:3ac9:b0:397:70f8:bd65 with SMTP id d9-20020a05600c3ac900b0039770f8bd65mr62494168wms.194.1654674508274;
        Wed, 08 Jun 2022 00:48:28 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id i8-20020a05600c354800b0039c6390730bsm1060766wmq.29.2022.06.08.00.48.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jun 2022 00:48:27 -0700 (PDT)
Date: Wed, 8 Jun 2022 08:48:25 +0100
From: Lee Jones <lee.jones@linaro.org>
To: Conor Dooley <mail@conchuod.ie>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Support Opensource <support.opensource@diasemi.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Steve Twiss <stwiss.opensource@diasemi.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Atul Khare <atulkhare@rivosinc.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v3 3/4] dt-bindings: mfd: convert da9063 to yaml
Message-ID: <YqBUSfyxsRpNdqob@google.com>
References: <20220606201343.514391-1-mail@conchuod.ie>
 <20220606201343.514391-4-mail@conchuod.ie>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220606201343.514391-4-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220608_004831_228186_2BAFA463 
X-CRM114-Status: GOOD (  10.43  )
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

T24gTW9uLCAwNiBKdW4gMjAyMiwgQ29ub3IgRG9vbGV5IHdyb3RlOgoKPiBGcm9tOiBDb25vciBE
b29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IAo+IENvbnZlcnQgdGhlIGR0IGJp
bmRpbmcgZm9yIHRoZSBkYTkwNjMvZGE5MDYzbCB0byB5YW1sLgo+IAo+IFJldmlld2VkLWJ5OiBS
b2IgSGVycmluZyA8cm9iaEBrZXJuZWwub3JnPgo+IFNpZ25lZC1vZmYtYnk6IENvbm9yIERvb2xl
eSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4gLS0tCj4gIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL21mZC9kYTkwNjMudHh0ICAgICAgICB8IDExNCAtLS0tLS0tLS0tLS0tLS0KPiAgLi4u
L2RldmljZXRyZWUvYmluZGluZ3MvbWZkL2RsZyxkYTkwNjMueWFtbCAgIHwgMTMyICsrKysrKysr
KysrKysrKysrKwo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy90cml2aWFsLWRldmljZXMueWFt
bCAgfCAgIDIgLQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgfCAgIDEgKwo+ICA0IGZpbGVzIGNoYW5nZWQsIDEzMyBpbnNlcnRpb25zKCspLCAxMTYgZGVs
ZXRpb25zKC0pCj4gIGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbWZkL2RhOTA2My50eHQKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvZGxnLGRhOTA2My55YW1sCgpBcHBsaWVkLCB0aGFu
a3MuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzmlq9dClByaW5jaXBhbCBUZWNobmljYWwgTGVhZCAt
IERldmVsb3BlciBTZXJ2aWNlcwpMaW5hcm8ub3JnIOKUgiBPcGVuIHNvdXJjZSBzb2Z0d2FyZSBm
b3IgQXJtIFNvQ3MKRm9sbG93IExpbmFybzogRmFjZWJvb2sgfCBUd2l0dGVyIHwgQmxvZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
