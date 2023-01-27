Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC7DC54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 22:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1PCqqG4Xrvw/mJweWRVmy6XToaF9tn59RQ7PzdBeFRQ=; b=CqWxFhuh4lclkv
	p+kIE+XnOSOBRymGtwH0sPkwcMauENMS+XCbsQgsEk/7D0fW/XVyBg4qrpLxcNJg2NIFU6gdlvGzz
	XelylYjQ4SkCwf71dpAhhp3U4bmC6BGQL7BjXi6gMU8M884jveEU+r6RDQa3AgCOZvWGAuiFxim2t
	tIK1BVUIWtABdRVcuo5cHJseBZAZTt1x1mkMViNmh9rwIbHUfgu4f/0qT5a/mwqpP9sBm/Cg9cgpj
	xMwSaiIkv3bye5VmAwbLmeXz9u4F4hq7V1uuj0OylHn7mS0Tk+5/dta8CuE+TOkx0H7fm+2wzBb0U
	A7ZkNke9kBVqdXq84RzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLX2k-00GgKY-9y; Fri, 27 Jan 2023 22:17:58 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLX2U-00GgEG-T1; Fri, 27 Jan 2023 22:17:44 +0000
Received: by mail-ej1-x62c.google.com with SMTP id bk15so17354179ejb.9;
        Fri, 27 Jan 2023 14:17:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YaeS+1CpC8eMdmggdR+qBf5UZX/S+Ov1sK2rOHC/Hig=;
        b=eNJ84I8xpfXVY3tEEPztbJBDNsYDQqKEds6DPvBGsslPh8on31fBOoL4lPhfjA6udM
         s/riFkZF7ezUWo4t14NATMbH3KZxKfkS/1nRKLA2QjqmiwLLOV2uxWa4p+2uFgRpQOnv
         r5AJl7L9KenB7vFwzS0jLuP/NC4MXdZQ9V18IN/0aRXEksroLfcWPe2Obs9JvkQmD0hx
         TIzfIKC84DDzmLCQDx6trXmTVUWglZik8t3VcA1uN+gpCDsyBFJJ0xUAD112vulwN2Ts
         50juQir25a3MR4FumuDgfyy2rE3FmCqGgh+5KwGK3JRhfgiQuy4FGJcPH/GpeafyOg2f
         nKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YaeS+1CpC8eMdmggdR+qBf5UZX/S+Ov1sK2rOHC/Hig=;
        b=4lIBqTk4Whd/CmB4SSJm+kX4XsI6NRspcpmEtku6IMFuLDQGabLXCnbacwuRx6JwjT
         WOlRouAeVXFZClefP+aNBV72beYGekNEGGmvlLuTnTPtUI9knT/LWI86HSqguMq7P1be
         DwckebmqYfg1YxX/RxLHAzneTxAelOeIdAN2oq3YLiYCNTvbImnMEkdKMMMJLQJB/EwF
         EP0s0RRNr8Ly0w4djTOP1iRWE9gTl4TmMEHJIiCLL60T4s/O2NZW3vYkoJTeXkz+KnMQ
         Icp0f4/MZ0hPtXTtcVgTdbT7W84wyBODA8Re5oBUUYah5cXbtcPiLH+mIzNhuEgak51G
         JOHA==
X-Gm-Message-State: AO0yUKUPZlVJzL6GHzzIovmbEvRqvncXItFdRsZfWjFRGno+r/jvDFDg
	+JlOAR5Orit4TNIySUMGzPE=
X-Google-Smtp-Source: AK7set9vJE70AagHNR0eFpYKeWUME1+H0riWJ/S8+/woOfeO/PElcAF45e8LlpKKRJq3Nev1K+B7Tg==
X-Received: by 2002:a17:906:9144:b0:878:7eb7:3488 with SMTP id y4-20020a170906914400b008787eb73488mr5843739ejw.21.1674857856018;
        Fri, 27 Jan 2023 14:17:36 -0800 (PST)
Received: from jernej-laptop.localnet (82-149-19-102.dynamic.telemach.net. [82.149.19.102])
        by smtp.gmail.com with ESMTPSA id e11-20020a1709062c0b00b0087bd629e9e4sm1513905ejh.179.2023.01.27.14.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 14:17:35 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Samuel Holland <samuel@sholland.org>,
 Andre Przywara <andre.przywara@arm.com>, Conor Dooley <conor@kernel.org>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject:  Re: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add power controller node
Date: Fri, 27 Jan 2023 23:17:34 +0100
Message-ID: <4773605.GXAFRqVoOG@jernej-laptop>
In-Reply-To: <20230126063419.15971-4-samuel@sholland.org>
References:  <20230126063419.15971-1-samuel@sholland.org>
 <20230126063419.15971-4-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_141742_979393_A32B4455 
X-CRM114-Status: GOOD (  12.59  )
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

RG5lIMSNZXRydGVrLCAyNi4gamFudWFyIDIwMjMgb2IgMDc6MzQ6MTkgQ0VUIGplIFNhbXVlbCBI
b2xsYW5kIG5hcGlzYWwoYSk6Cj4gVGhlIEFsbHdpbm5lciBEMSBmYW1pbHkgb2YgU29DcyBjb250
YWluIGEgUFBVIHBvd2VyIGRvbWFpbiBjb250cm9sbGVyCj4gc2VwYXJhdGUgZnJvbSB0aGUgUFJD
TS4gSXQgY2FuIHBvd2VyIGRvd24gdGhlIHZpZGVvIGVuZ2luZSBhbmQgRFNQLCBhbmQKPiBpdCBj
b250YWlucyBzcGVjaWFsIGxvZ2ljIGZvciBoYXJkd2FyZS1hc3Npc3RlZCBDUFUgaWRsZS4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4KCkFj
a2VkLWJ5OiBKZXJuZWogU2tyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPgoKQmVzdCBy
ZWdhcmRzLApKZXJuZWoKCj4gLS0tCj4gCj4gQ2hhbmdlcyBpbiB2MjoKPiAgLSBJbmNsdWRlIGEg
cGF0Y2ggYWRkaW5nIHRoZSBkZXZpY2UgdHJlZSBub2RlCj4gCj4gIGFyY2gvcmlzY3YvYm9vdC9k
dHMvYWxsd2lubmVyL3N1bnhpLWQxcy10MTEzLmR0c2kgfCA4ICsrKysrKysrCj4gIDEgZmlsZSBj
aGFuZ2VkLCA4IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290
L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaQo+IGIvYXJjaC9yaXNjdi9ib290L2R0
cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMuZHRzaSBpbmRleAo+IDM3MjM2MTJiMWZkOC4uNmZh
ZGNlZTc4MDBmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvYWxsd2lubmVyL3N1
bnhpLWQxcy10MTEzLmR0c2kKPiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL2FsbHdpbm5lci9z
dW54aS1kMXMtdDExMy5kdHNpCj4gQEAgLTc5OSw2ICs3OTksMTQgQEAgdGNvbl90djBfb3V0X3Rj
b25fdG9wX2hkbWk6IGVuZHBvaW50IHsKPiAgCQkJfTsKPiAgCQl9Owo+IAo+ICsJCXBwdTogcG93
ZXItY29udHJvbGxlckA3MDAxMDAwIHsKPiArCQkJY29tcGF0aWJsZSA9ICJhbGx3aW5uZXIsc3Vu
MjBpLWQxLXBwdSI7Cj4gKwkJCXJlZyA9IDwweDcwMDEwMDAgMHgxMDAwPjsKPiArCQkJY2xvY2tz
ID0gPCZyX2NjdSBDTEtfQlVTX1JfUFBVPjsKPiArCQkJcmVzZXRzID0gPCZyX2NjdSBSU1RfQlVT
X1JfUFBVPjsKPiArCQkJI3Bvd2VyLWRvbWFpbi1jZWxscyA9IDwxPjsKPiArCQl9Owo+ICsKPiAg
CQlyX2NjdTogY2xvY2stY29udHJvbGxlckA3MDEwMDAwIHsKPiAgCQkJY29tcGF0aWJsZSA9ICJh
bGx3aW5uZXIsc3VuMjBpLWQxLXItY2N1IjsKPiAgCQkJcmVnID0gPDB4NzAxMDAwMCAweDQwMD47
CgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
