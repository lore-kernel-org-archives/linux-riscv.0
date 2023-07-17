Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4197FEB64DC
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 17:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dq5C9MpV+5UNQ6Iz9ZNVSmhNR8Vqup9Si/IEErA/0Js=; b=1yIDyAbvMmOFaW
	FEXyonvLg3WJYIq6sQKt7Imo4iPdnBU28eeUCpNvqjPCIRkKI8O7w9pS3FhAgngvSJJqjNk/VUFtg
	2Ppm23yCBhjSdrTuyVr2SMWqx3e/0lmuP46Ed6wLi+x5Gsyu9nL41PC/QQAWML+oWshMWpNX3VJ4w
	Czp8alkteXVIaAnndYlVqA+dxpbTLvJNaEimOXPXoSA+VCbz/n+5r9ueu3OAbe53pEtHWS0IJW+J/
	mK2+GvXualgMZuPtw79S/ykTNQ+Nzdsp9aHrxsk1b7flXcs24jSZWruU2G7dGUY9VGieso+AAkW8x
	hNiD5pMyixhaw185BX8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLSFy-004iFu-16;
	Mon, 17 Jul 2023 17:43:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLSFu-004iEb-1J;
	Mon, 17 Jul 2023 17:43:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA7E5611AD;
	Mon, 17 Jul 2023 17:43:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE49C433CA;
	Mon, 17 Jul 2023 17:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689615809;
	bh=WlylA38NBSrHdK1P/Qx5cdKzB17My2bbP8A4hWmtbl8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=pCB0qRPm4TViuI8Fg0XfDsRLg2cStX3yi85bE2aX9JM2STvXpFJBkZv01TMRONP0v
	 4BCch5u4Cfxc2q10XF7X8MlYlb8ZrEcmfwNbb6YHXoQY5gQfT+RaoaDjA6FvE1eHjM
	 3v6jimLbsNHKi9Zfa5tpw4Qtn2ufZU3HZ5UK6k1Kc0wXQeqgPxgdOMDAMlvQaNHzn8
	 Z9nrQ9fiOU63aNaOwpzQarIRbUBxsSACl0XHcxEIqNv8Tzec0OZENO5QJUjxlzB7dE
	 CNvQd17kBAqxdZ+5e44s4eiNJhYtgPj4XwQfWrMAVKzXwptm7yM7tvd4Fvk/wJOtao
	 Yn09Vf//WxeFg==
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-51e99584a82so6438875a12.1;
        Mon, 17 Jul 2023 10:43:29 -0700 (PDT)
X-Gm-Message-State: ABy/qLanIUWaClD6XVcweioRPWnEp/LK/tPiPElk5P5s6EiVIO2Q1hbE
	3EIEVwPdoHIWuiNbTgkO64ai0sR/NMIe5c7jWw==
X-Google-Smtp-Source: APBJJlGV73zzxjpVsO/f3440v/5dveoUtTcIX0eLkgnTaVgBrap1rMmgbikswqUTIe4Df1/8A6Rrn+UvYZaRh77UJxY=
X-Received: by 2002:a2e:9c91:0:b0:2b7:4169:fcf5 with SMTP id
 x17-20020a2e9c91000000b002b74169fcf5mr11677042lji.37.1689615786908; Mon, 17
 Jul 2023 10:43:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230714175027.4065135-1-robh@kernel.org>
In-Reply-To: <20230714175027.4065135-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 17 Jul 2023 11:42:54 -0600
X-Gmail-Original-Message-ID: <CAL_JsqLxL2Mpsi=idA0KkDWNhCZfP3Nw4c79d5CfkjVWnUsqyg@mail.gmail.com>
Message-ID: <CAL_JsqLxL2Mpsi=idA0KkDWNhCZfP3Nw4c79d5CfkjVWnUsqyg@mail.gmail.com>
Subject: Re: [PATCH] usb: Explicitly include correct DT includes
To: Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>, 
	Roger Quadros <rogerq@kernel.org>, Aswath Govindraju <a-govindraju@ti.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Minas Harutyunyan <hminas@synopsys.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Li Yang <leoyang.li@nxp.com>, Daniel Mack <daniel@zonque.org>, 
	Haojian Zhuang <haojian.zhuang@gmail.com>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Herve Codina <herve.codina@bootlin.com>, Michal Simek <michal.simek@amd.com>, 
	Alan Stern <stern@rowland.harvard.edu>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@microchip.com>, Mathias Nyman <mathias.nyman@intel.com>, 
	Richard Leitner <richard.leitner@linux.dev>, Chunfeng Yun <chunfeng.yun@mediatek.com>, 
	Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Guenter Roeck <linux@roeck-us.net>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mediatek@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_104330_519563_538409ED 
X-CRM114-Status: GOOD (  14.95  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTE6NTDigK9BTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IFRoZSBEVCBvZl9kZXZpY2UuaCBhbmQgb2ZfcGxhdGZvcm0uaCBk
YXRlIGJhY2sgdG8gdGhlIHNlcGFyYXRlCj4gb2ZfcGxhdGZvcm1fYnVzX3R5cGUgYmVmb3JlIGl0
IGFzIG1lcmdlZCBpbnRvIHRoZSByZWd1bGFyIHBsYXRmb3JtIGJ1cy4KPiBBcyBwYXJ0IG9mIHRo
YXQgbWVyZ2UgcHJlcHBpbmcgQXJtIERUIHN1cHBvcnQgMTMgeWVhcnMgYWdvLCB0aGV5Cj4gInRl
bXBvcmFyaWx5IiBpbmNsdWRlIGVhY2ggb3RoZXIuIFRoZXkgYWxzbyBpbmNsdWRlIHBsYXRmb3Jt
X2RldmljZS5oCj4gYW5kIG9mLmguIEFzIGEgcmVzdWx0LCB0aGVyZSdzIGEgcHJldHR5IG11Y2gg
cmFuZG9tIG1peCBvZiB0aG9zZSBpbmNsdWRlCj4gZmlsZXMgdXNlZCB0aHJvdWdob3V0IHRoZSB0
cmVlLiBJbiBvcmRlciB0byBkZXRhbmdsZSB0aGVzZSBoZWFkZXJzIGFuZAo+IHJlcGxhY2UgdGhl
IGltcGxpY2l0IGluY2x1ZGVzIHdpdGggc3RydWN0IGRlY2xhcmF0aW9ucywgdXNlcnMgbmVlZCB0
bwo+IGV4cGxpY2l0bHkgaW5jbHVkZSB0aGUgY29ycmVjdCBpbmNsdWRlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gLS0tCgpbLi4uXQoKPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy91c2IvaG9zdC9mc2wtbXBoLWRyLW9mLmMgYi9kcml2ZXJzL3VzYi9o
b3N0L2ZzbC1tcGgtZHItb2YuYwo+IGluZGV4IGE5ODc3ZjI1NjlmNC4uMjU3NGJjY2MxNTFiIDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvdXNiL2hvc3QvZnNsLW1waC1kci1vZi5jCj4gKysrIGIvZHJp
dmVycy91c2IvaG9zdC9mc2wtbXBoLWRyLW9mLmMKPiBAQCAtMTAsMTAgKzEwLDEyIEBACj4gICNp
bmNsdWRlIDxsaW51eC9mc2xfZGV2aWNlcy5oPgo+ICAjaW5jbHVkZSA8bGludXgvZXJyLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9pby5oPgo+IC0jaW5jbHVkZSA8bGludXgvb2ZfcGxhdGZvcm0uaD4K
PiArI2luY2x1ZGUgPGxpbnV4L29mLmg+Cj4gKyNpbmNsdWRlIDxsaW51eC9vZl9kZXZpY2UuaD4K
PiAgI2luY2x1ZGUgPGxpbnV4L2Nsay5oPgo+ICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+Cj4g
ICNpbmNsdWRlIDxsaW51eC9kbWEtbWFwcGluZy5oPgo+ICsjaW5jbHVkZSA8bGludXgvb2YuaD4K
CkRvdWJsZSBpbmNsdWRlIG9mIG9mLmggaGVyZS4gdjIgY29taW5nLgoKUm9iCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
