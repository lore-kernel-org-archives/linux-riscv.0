Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DD8FC001DB
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCwfFyw2A1LvJ6wxK+wakCXZXLBgrpeGEY8oFLof+9Y=; b=1lDp0/4rfIAJW9
	g3wMRzUnydknf9BXLIm5BjWyocIs0zfO2nXOHnc0YYelM8PS0qEjsgKLWEv5HMFPY2P/fW/hxRMEa
	+wrUHaMJZfB/cURcG978WZG16AAFjH4wPjqRVi1n/XgpJY/ON65NE60kSd1dVZGli76rznwRzpusU
	RGFmK6pCXg0WDRBEdokHES746e9h7kB5G8Z5LSOpCEnuwIFfWV7NjjDLrkyObJCk7/ip16W0s+hhE
	GtUQsYkfQgmsrd04DyA2xT5SxcMfaq49g9F9u0fm1ZV+/m1V9Dawwpa5rytjNa8Qv4AOnzq/rWENn
	oPrynfKazqKB168MZ0QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSupQ-00GNYH-1Z;
	Mon, 07 Aug 2023 07:39:00 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSupN-00GNXs-1n
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 07:38:59 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-523225dd110so3513959a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 00:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691393936; x=1691998736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nKlDQ+6KryCA/4iw0V7tSUE5pap9UHCwwXY0QJsX+QA=;
        b=dTVTs7P80fSB4+OYv2fhGZLdlgPMGGgfF6PXZX24Hen2Mv8Gr2UGEHnfDxW3B4hEb5
         p6AsxViAd5gnBiUD/06S4HXpI4ouwFqnaeb8oEsZdoh0imDj4yHWmjigdDnFLXOhUa7U
         b0CMkCZUp0OzBZyFYDsT4U6IAQgwHB3fbOjkzCmRYtjfZzjstK+lCrNl0AEGjsVl+ae6
         sYa+u/mgqhlVKjcovTHpPZoyOzuQN3BRdep9LxuhM71YPOHUPBgzUiHX7GLvhC+Rzq2z
         bZmO8+nsMKSv83G3IqJzC24zBxQvM0Fz3hHiNkzmaQiQniGmFkdxcvgUxuDVGE2gCEnI
         39UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691393936; x=1691998736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nKlDQ+6KryCA/4iw0V7tSUE5pap9UHCwwXY0QJsX+QA=;
        b=X/jToLfKSuWSXc2XxXjMXl1mHw61K44sVPgRx9G4weEENaF/qnml4QRTTQuEJebSsB
         usBLU5G92itMVgM5zzBNkR4FuNuwQgbO8wdUNapoXrkcco37gDZeYh0UFOlcFunFkbtF
         dZdMbPjxBh0+72V5qNA4I6YwnwbVL8JzdjwKLlgnVQQR9eoQvPZGCM144JO0ryaMKJ9+
         ZbQEXane/tr2JAYpyuRMhD3Vi78hC/BJCIbcUmCpJ7jm8cj1Gxm1Nj+ZgOHjfLnZ12YM
         XvQnH1kpZqkJuFfrUbjLheMLnPNXasM1xCC7dYtNYac0Y/u2KVpINMeQG3nlB/QEcaeX
         Rlnw==
X-Gm-Message-State: AOJu0YxzUOXwo88U3HhOCODAZbbrAskfekaErny/knKPs8yBVAGEEMus
	p23DOlTke5i7PIxIY/sMhf4=
X-Google-Smtp-Source: AGHT+IHYGcnDyV/Muvy86Soo94JJb+xzGrEkQtOMDdzz0rNl5dBhCgGm8XGGc/NPrqAwmxP6+t2xeg==
X-Received: by 2002:a17:906:74d1:b0:99b:d1cb:5add with SMTP id z17-20020a17090674d100b0099bd1cb5addmr7546617ejl.35.1691393935645;
        Mon, 07 Aug 2023 00:38:55 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r16-20020a170906a21000b00988b8ff849csm4782399ejy.108.2023.08.07.00.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 00:38:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-can@vger.kernel.org, Marc Kleine-Budde <mkl@pengutronix.de>
Cc: John Watts <contact@jookia.org>, kernel@pengutronix.de,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, Marc Kleine-Budde <mkl@pengutronix.de>
Subject: Re: [PATCH] Revert "riscv: dts: allwinner: d1: Add CAN controller nodes"
Date: Mon, 07 Aug 2023 09:38:54 +0200
Message-ID: <2644763.X9hSmTKtgW@jernej-laptop>
In-Reply-To: <20230807-riscv-allwinner-d1-revert-can-controller-nodes-v1-1-eb3f70b435d9@pengutronix.de>
References: <20230807-riscv-allwinner-d1-revert-can-controller-nodes-v1-1-eb3f70b435d9@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_003857_617746_E321698B 
X-CRM114-Status: GOOD (  10.42  )
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

RG5lIHBvbmVkZWxqZWssIDA3LiBhdmd1c3QgMjAyMyBvYiAwOToyODo1MCBDRVNUIGplIE1hcmMg
S2xlaW5lLUJ1ZGRlIApuYXBpc2FsKGEpOgo+IEl0IHR1cm5lZCBvdXQgdGhlIGR0c2kgY2hhbmdl
cyB3ZXJlIG5vdCBxdWl0ZSByZWFkeSwgcmV2ZXJ0IHRoZW0gZm9yCj4gbm93Lgo+IAo+IFRoaXMg
cmV2ZXJ0cyBjb21taXQgNmVhMWFkODg4ZjU5MDA5NTNhMjE4NTNlNzA5ZmE0OTlmZGZjYjMxNy4K
PiAKPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjY5MDc2NC5tdlhVREk4QzBl
QGplcm5lai1sYXB0b3AKPiBTdWdnZXN0ZWQtYnk6IEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNr
cmFiZWNAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IE1hcmMgS2xlaW5lLUJ1ZGRlIDxta2xA
cGVuZ3V0cm9uaXguZGU+CgpSZXZpZXdlZC1ieTogSmVybmVqIFNrcmFiZWMgPGplcm5lai5za3Jh
YmVjQGdtYWlsLmNvbT4KCkJlc3QgcmVnYXJkcywKSmVybmVqCgo+IC0tLQo+ICBhcmNoL3Jpc2N2
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpIHwgMzAKPiAtLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLSAxIGZpbGUgY2hhbmdlZCwgMzAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAt
LWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kK
PiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgaW5k
ZXgKPiA0MDg2YzBjYzBmOWQuLjFiYjFlNWNhZTYwMiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2Jvb3QvZHRzL2FsbHdpbm5lci9zdW54aS1kMXMtdDExMy5kdHNpCj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+IEBAIC0xMzEsMTggKzEz
MSw2IEBAIHVhcnQzX3BiX3BpbnM6IHVhcnQzLXBiLXBpbnMgewo+ICAJCQkJcGlucyA9ICJQQjYi
LCAiUEI3IjsKPiAgCQkJCWZ1bmN0aW9uID0gInVhcnQzIjsKPiAgCQkJfTsKPiAtCj4gLQkJCS9v
bWl0LWlmLW5vLXJlZi8KPiAtCQkJY2FuMF9waW5zOiBjYW4wLXBpbnMgewo+IC0JCQkJcGlucyA9
ICJQQjIiLCAiUEIzIjsKPiAtCQkJCWZ1bmN0aW9uID0gImNhbjAiOwo+IC0JCQl9Owo+IC0KPiAt
CQkJL29taXQtaWYtbm8tcmVmLwo+IC0JCQljYW4xX3BpbnM6IGNhbjEtcGlucyB7Cj4gLQkJCQlw
aW5zID0gIlBCNCIsICJQQjUiOwo+IC0JCQkJZnVuY3Rpb24gPSAiY2FuMSI7Cj4gLQkJCX07Cj4g
IAkJfTsKPiAKPiAgCQljY3U6IGNsb2NrLWNvbnRyb2xsZXJAMjAwMTAwMCB7Cj4gQEAgLTg5MSwy
MyArODc5LDUgQEAgcnRjOiBydGNANzA5MDAwMCB7Cj4gIAkJCWNsb2NrLW5hbWVzID0gImJ1cyIs
ICJob3NjIiwgImFoYiI7Cj4gIAkJCSNjbG9jay1jZWxscyA9IDwxPjsKPiAgCQl9Owo+IC0KPiAt
CQljYW4wOiBjYW5AMjUwNDAwMCB7Cj4gLQkJCWNvbXBhdGlibGUgPSAiYWxsd2lubmVyLHN1bjIw
aS1kMS1jYW4iOwo+IC0JCQlyZWcgPSA8MHgwMjUwNDAwMCAweDQwMD47Cj4gLQkJCWludGVycnVw
dHMgPSA8U09DX1BFUklQSEVSQUxfSVJRKDIxKSAKSVJRX1RZUEVfTEVWRUxfSElHSD47Cj4gLQkJ
CWNsb2NrcyA9IDwmY2N1IENMS19CVVNfQ0FOMD47Cj4gLQkJCXJlc2V0cyA9IDwmY2N1IFJTVF9C
VVNfQ0FOMD47Cj4gLQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gLQkJfTsKPiAtCj4gLQkJY2Fu
MTogY2FuQDI1MDQ0MDAgewo+IC0JCQljb21wYXRpYmxlID0gImFsbHdpbm5lcixzdW4yMGktZDEt
Y2FuIjsKPiAtCQkJcmVnID0gPDB4MDI1MDQ0MDAgMHg0MDA+Owo+IC0JCQlpbnRlcnJ1cHRzID0g
PFNPQ19QRVJJUEhFUkFMX0lSUSgyMikgCklSUV9UWVBFX0xFVkVMX0hJR0g+Owo+IC0JCQljbG9j
a3MgPSA8JmNjdSBDTEtfQlVTX0NBTjE+Owo+IC0JCQlyZXNldHMgPSA8JmNjdSBSU1RfQlVTX0NB
TjE+Owo+IC0JCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+IC0JCX07Cj4gIAl9Owo+ICB9Owo+IAo+
IC0tLQo+IGJhc2UtY29tbWl0OiBjMzVlOTI3Y2JlMDlkMzhiMmQ3MjE4M2JiMjE1OTAxMTgzOTI3
YzY4Cj4gY2hhbmdlLWlkOgo+IDIwMjMwODA3LXJpc2N2LWFsbHdpbm5lci1kMS1yZXZlcnQtY2Fu
LWNvbnRyb2xsZXItbm9kZXMtNjVmNjJlMDQ2MTljCj4gCj4gQmVzdCByZWdhcmRzLAoKCgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
