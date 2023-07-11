Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3948AEB64DD
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 18:10:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jLrdiNuw8SR3qmLfyiNyFokWgP+n4zSmHyEM5ik+4Uw=; b=xRzIDRpnB6V0ay
	jZBScE/F0Pd+gMWifRs/SvL3lNbDyTigd+TqZg4oHBiKrtDYMFjNRsdImk+Z4rwAjXw43vnOKdLP6
	gVyycqfbksP6N6DbmQyep/L4GlOiXzgG8s1MZwrIl4YBmTbBVRQrM+msE4ShiAxSo+Y0Kbw6tFwwT
	pkpkkE6yvbfZsayK1voSSu6URePh+HoxXP5ZMY+pQEaT7yarK/ae33ZFDhdWqWmnAKlAerwU6rlyc
	mqXeF0xHjcofnPxpLg+TZX52ai2FOuQOCdhOqoRi/x42BqRqmr2IzPNW4TAtQe/kMdaS4UDam9Ccv
	PQCBgEpqdi1fYE+0InZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHog-00FcqL-1G;
	Tue, 11 Jul 2023 18:10:26 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJHob-00FcoZ-2s;
	Tue, 11 Jul 2023 18:10:23 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3fbd33a57b6so74255245e9.2;
        Tue, 11 Jul 2023 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689099020; x=1691691020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DN7SKT5YDMsR3KLZsulL1k2cEGxGqiu83tf4hiEqzbU=;
        b=im/1f6USttl0PouwJHsl8oeTUnxojJWtSZG491nIXLs46KPt7ROCw91xJTOyHfWwU/
         Xclj03qDL2nnO631QYUGdOC+5GIfuOU1v6j2zYAwY9lNkR0htj0Y4Lo+Bt57c/w8uWOE
         GNARBXdLwJLhXUGgqwCHpFF+IYttDDQnh3gNX/8n9G1A/g1sfzEfTaupsnvTFUO/gnrs
         65JSUrxGcUCbjsehFA61GacHlNKz79Sdc9lpnUJDJF61O3+8d6wG3DqTU8M0Bq6Rs+z8
         Ue+3xNlzmqNoUg/2yeM26G8NwZExCqhmNl3Ei0hYkoBUGbthIYtCVdUH4i3K50vcpyw6
         oqVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689099020; x=1691691020;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DN7SKT5YDMsR3KLZsulL1k2cEGxGqiu83tf4hiEqzbU=;
        b=ZVabxA7VBG3YfTgtAUitLctt178XeJtet8igiPO6SH9+B5mM/yVEtbljbgRyTM6Nby
         RS/fD94Fapqy7y4lbqqwfNO7CoAiTgEvhy1DtcIBCZroTrVSIuhkFykZ77QFesv6V2Dx
         LNN8O/apSMFFFPutCo6VRZU3TTAAH94berPRt2B0pyEqZF/LtFYTY79M+8tsQyo4q+Jf
         J8zW+jXL7fYxzcUwRfFjHIi1XRBOPNwqjK4otUX27C6URvbZ2VSX+7uw4Ym91seizPUW
         sc4dJZUKTdpqFZ/vG7wluM9hRo+E8aTC7fJL132nm/BZR+M7vwqDOl2x30BhAb+StkMl
         SvVw==
X-Gm-Message-State: ABy/qLY4eBx/hHCpdSIICDIb+TIUgy9B0a5KC+O5QN4ZmNAKhSO777ir
	RpHJVyh9RtSnibOaMNa73zY=
X-Google-Smtp-Source: APBJJlF2BZKCrWmEhTh/350w2TFfo/9EYgx+QZBOKTKsh9nhH1eoZObr6KPDzwISpk3jEX8ZvMVbGA==
X-Received: by 2002:a7b:ca47:0:b0:3fc:855:db42 with SMTP id m7-20020a7bca47000000b003fc0855db42mr12672343wml.34.1689099019465;
        Tue, 11 Jul 2023 11:10:19 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id o5-20020a1c7505000000b003fbd9e390e1sm13613422wmc.47.2023.07.11.11.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 11:10:18 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
 Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: privatesub2@gmail.com, linux-kernel@vger.kernel.org,
 thierry.reding@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, wens@csie.org,
 samuel@sholland.org, Paul Walmsley <paul.walmsley@sifive.com>,
 aou@eecs.berkeley.edu, p.zabel@pengutronix.de,
 cristian.ciocaltea@collabora.com, Greg KH <gregkh@linuxfoundation.org>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Tue, 11 Jul 2023 20:10:16 +0200
Message-ID: <2287998.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230706202057.k6rfwfhe3msfkrc4@pengutronix.de>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
 <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
 <20230706202057.k6rfwfhe3msfkrc4@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_111021_930499_CABDFE4B 
X-CRM114-Status: GOOD (  21.71  )
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

RG5lIMSNZXRydGVrLCAwNi4ganVsaWogMjAyMyBvYiAyMjoyMDo1NyBDRVNUIGplIFV3ZSBLbGVp
bmUtS8O2bmlnIG5hcGlzYWwoYSk6Cj4gSGVsbG8sCj4gCj4gT24gVGh1LCBKdWwgMDYsIDIwMjMg
YXQgMTA6MDg6NDdBTSAtMDcwMCwgUGFsbWVyIERhYmJlbHQgd3JvdGU6Cj4gPiBPbiBUdWUsIDI3
IEp1biAyMDIzIDAxOjIzOjIzIFBEVCAoLTA3MDApLCBwcml2YXRlc3ViMkBnbWFpbC5jb20gd3Jv
dGU6Cj4gPiA+IEhpLAo+ID4gPiAKPiA+ID4gVGhpcyBzZXJpZXMgYWRkcyBzdXBwb3J0IGZvciBQ
V00gY29udHJvbGxlciBvbiBuZXcKPiA+ID4gQWxsd2lubmVyJ3MgU29Dcywgc3VjaCBhcyBEMSwg
VDExM3MgYW5kIFIzMjkuIFRoZSBpbXBsZW1lbnRlZCBkcml2ZXIKPiA+ID4gcHJvdmlkZXMgYmFz
aWMgZnVuY3Rpb25hbGl0eSBmb3IgY29udHJvbCBQV00gY2hhbm5lbHMuCj4gPiA+IAo+ID4gPiB2
MjoKPiA+ID4gIC0gZml4IGR0LWJpbmRpbmdzCj4gPiA+ICAtIGZpeCBhIHJlbWFyayBpbiB0aGUg
ZHJpdmVyCj4gPiA+IAo+ID4gPiB2MzoKPiA+ID4gIC0gZml4IGR0LWJpbmRpbmdzCj4gPiA+ICAt
IGZpeCBzdW54aS1kMXMtdDExMy5kdHNpCj4gPiA+IAo+ID4gPiBBbGVrc2FuZHIgU2h1YmluICgz
KToKPiA+ID4gICBkdC1iaW5kaW5nczogcHdtOiBBZGQgYmluZGluZyBmb3IgQWxsd2lubmVyIEQx
L1QxMTMtUzMvUjMyOSBQV00KPiA+ID4gICAKPiA+ID4gICAgIGNvbnRyb2xsZXIKPiA+ID4gICAK
PiA+ID4gICBwd206IEFkZCBBbGx3aW5uZXIncyBEMS9UMTEzLVMzL1IzMjkgU29DcyBQV00gc3Vw
cG9ydAo+ID4gPiAgIHJpc2N2OiBkdHM6IGFsbHdpbm5lcjogZDE6IEFkZCBwd20gbm9kZQo+ID4g
PiAgCj4gPiA+ICAuLi4vYmluZGluZ3MvcHdtL2FsbHdpbm5lcixzdW4yMGktcHdtLnlhbWwgICAg
fCAgODYgKysrKysKPiA+ID4gIC4uLi9ib290L2R0cy9hbGx3aW5uZXIvc3VueGktZDFzLXQxMTMu
ZHRzaSAgICB8ICAxMSArCj4gPiA+ICBkcml2ZXJzL3B3bS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfCAgMTAgKwo+ID4gPiAgZHJpdmVycy9wd20vTWFrZWZpbGUgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsKPiA+ID4gIGRyaXZlcnMvcHdtL3B3bS1zdW4yMGkuYyAg
ICAgICAgICAgICAgICAgICAgICB8IDMyMiArKysrKysrKysrKysrKysrKysKPiA+ID4gIDUgZmls
ZXMgY2hhbmdlZCwgNDMwIGluc2VydGlvbnMoKykKPiA+ID4gIGNyZWF0ZSBtb2RlIDEwMDY0NAo+
ID4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hbGx3aW5uZXIsc3Vu
MjBpLXB3bS55YW1sIGNyZWF0ZQo+ID4gPiAgbW9kZSAxMDA2NDQgZHJpdmVycy9wd20vcHdtLXN1
bjIwaS5jCj4gPiAKPiA+IEFja2VkLWJ5OiBQYWxtZXIgRGFiYmVsdCA8cGFsbWVyQHJpdm9zaW5j
LmNvbT4KPiA+IAo+ID4gSSdtIG5vdCBzdXJlIGlmIHRoaXMgZW5kZWQgdXAgc29tZXdoZXJlLCBi
dXQgSSdtIGFzc3VtaW5nIGl0J3Mgbm90IGFpbWVkCj4gPiBhdAo+ID4gbXkgdHJlZS4gIExNSyBp
ZiB5b3UgZ3V5cyB3YW50IG1lIHRvIHBpY2sgaXQgdXAsIEknbSBkcm9wcGluZyBpdCBmcm9tCj4g
PiBwYXRjaHdvcmsuCj4gCj4gQXQgbGVhc3QgcGF0Y2ggIzIgc2hvdWxkIGdvIHZpYSB0aGUgcHdt
IHRyZWUuIEl0J3Mgb24gbXkgbGlzdCB0byByZXZpZXcuCgpSZXN0IHdpbGwgZ28gdGhyb3VnaCBz
dW54aSB0cmVlLCBhbHRob3VnaCBEVCBiaW5kaW5ncyBwYXRjaGVzIGFyZSB1c3VhbGx5IApwaWNr
ZWQgdG9nZXRoZXIgd2l0aCBkcml2ZXIgcGF0Y2hlcy4gSSdtIGZpbmUgZWl0aGVyIHdheS4KCkJl
c3QgcmVnYXJkcywKSmVybmVqCgoKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
