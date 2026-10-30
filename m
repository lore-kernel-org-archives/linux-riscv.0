Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A2B606A31A
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 07:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=aF4IJpET;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AJAJGwG/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=3x4wyD13C8dW+va/lt0P2PHU0Q6kpWLzqdjHI2UtysQ=; b=aF4IJpETqUmilAN/IZj0eFZLtw
	PHsgf4Hq6CL6iSl14fLKTc81ypkKZDKYU2i9YyTZL/JVOHTQGkhsJSGrmWOVes62InmBj84LvLzYG
	deNdOMITOCHFkzt8oEPlVhQDcZT0WWgAZLTFxk1Vf23vmTvtrEUTyutHkHFXDUuqIfWyEIBVpg7+k
	IpLK8ITSDM1CDbMgVLIjejMisXx3v5w1rb8PL7sF6iK+UGFFbm0NKmsgqbhLtFHe6NFoJH52HoV/p
	AEqMyApldypkstkveEPpdqHwVm7nnJfvU3nNg6rC8RBqZqa4JdqnAzJhbhoCm0YXoh/QfGufh4q1k
	OucYxufw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMh2d-0000000Azg2-2YKM;
	Fri, 30 Oct 2026 07:28:47 +0000
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMh2Y-0000000Azeb-1IY3
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 07:28:44 +0000
Received: by mail-yx1-xb12b.google.com with SMTP id 956f58d0204a3-677bc4704cbso328033d50.0
        for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2026 00:28:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793345320; cv=none;
        d=google.com; s=arc-20260327;
        b=RWwyPQR/ziHrXgd1JeUzPlGJn3h+WgCzAeXqf+e61Nb+Dnvief6338QXgNhKCFiGCP
         tfNOLbwGebiHz0CngszWSoCp/GF5eYO2zoZZdnDmrFM4ZWj4Ousr/CEO5xvneBEdewkg
         gCHnXV9htONU40uSv7U8FEK94e8f4y5hy86tsNwAV7qlKWF68zJocfL7CW27rAqrtBhr
         8B8VokSLvpMXIXxrsTfxcAHVLBi0sKwPw7gCLLOa/QosKnrmfsWaAaBjg9cUmidDI1n3
         SeNZeN3RAaCuVb10X2b5rULtN9U/2iQq1g1z3o5wSn7x3Ma2awQoUDNUSd4f0WT77GBZ
         Da+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        fh=leLCYNdMZSuQBmiejyMoBxsgHkWPMipdEFlr/OH2t9M=;
        b=sP++Jzsi/81tudmx1ZjbtqV4tkdKENzbxd7XBHQEL7FmAO8o1AqLnx8uV+qWerXBNg
         U0jErVXFfnVPB9CbqqK8JfRQpfaete2UXmEuz/JP2J7iLPqSYoECWcs0S6TiWemiTUY+
         Sn3rIP+3DgZexko/yGs2cxPYnofmWd9bV+TDs6f5aw+whtmnVmq9PvgPZy9gNTSUpfCy
         TU4ElaaW/ggeOsU8wkwyp02ky2e+3EA6hxOuUKGd1sOfYgdBtM6VnAHiayUyQmFtp3D5
         rtGXJOAd0XbA0oUUkt8522wcf5RGV2Fbxwjl8QiWlGhM2X3J3ENnwPN0BzwImsFWVPwD
         ou3g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793345320; x=1793950120; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=AJAJGwG/hA4GPoiC45/hKRN4s4LmdEJkNMZOjy1rh/6Wm/szYwpbi4QyyryFJ9QPmv
         E8sDDs79nLJ+/3pnAkACRZdajbqC5aBx+55dpavnDXXJwIXOvBNoAmjTfgyqVz+THVWF
         hs2FVXutuBpI/78Vg9N0BIEjoz+SOP1nrZTXA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793345320; x=1793950120;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7PxPIeRuNsvElsGXImQTEuL1CpgybTHblbxvuB0DOLI=;
        b=qcAkpG3uFg8Q+Bf7HJVT8FU7JeHxFjgFSVx5if/XKUmUD7nuhV0JoOtfURteFkF7Lj
         aO4DJ+RzFMFO0quinsu8p6v++WLT2Frzh7XOQWm7q3gaywDEAAjgJOejl0ElJyeiJ89w
         wAeLosQ/Ubhh1rvmUV8YVy30AAl4A5u16WUoSgkVvGwQco0+JoRZZ+Q8RoRxuzKqJWP6
         eY3CwDLVsvdhC3HzEEhJjjVp4ueCWCvqQXDNuWlAnOxtCHnXLzMGXEkio0COmgay+vEH
         U6cOzIdr/4bHkSY8QUoFdhqJi3pL5AyCoMexo9HB2uLj9UjUoJg6BkC+kRsJfhKXrlZY
         RIlQ==
X-Forwarded-Encrypted: i=1; AKwUvBySYtjzt/d/cP4Ubr1thFVGxb3IUCcQQuiwkoWE+VodKKcsfrjuOrOOAmLVyhYQI2qj1jlo2ukf+IySdQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYIWREHotTlh4SeMHd3Q0ESpf81CpJhVKAHAnQt67JcIBSawHmet
	oyWr3o8OGqVLjVf5pwGV5RzRIQRRmLn2TFuS3D2W2a/z1NAv6rh9amkMwlZ8vjOrBRQj6hxK0j1
	bDeNmZLwwiLCG3VirtjnNHSpYLNtfFT0fOg2vQsAP
X-Gm-Gg: AYBFou2Z+DG+kjdqHbgCqi3NOtlJWa0rFLlYGltUl0Z3vw32FtUM/iiwJwd+mYXWGDa
	9Z96XP8plUdgeudAPJqu7dFgChssDM1CexS9Ctgw9Xurx+6OM2h4lLf8PVLApKEVznYuVpNQ7DF
	WF5nhEEQwmTXh/kS3oKzL+WmYWXNxwJpkH/kqu1mSAu38d3/rJ1HmLJTlYTyTDVN2S62rVooh6T
	LyqyrFt8vlbQ9tYzIOr44dMBseMFOzJXH2l6v0DeeFACGzaJqdAeKs8fsIWRl+ZYhz+xLqZgrm1
	G4FHLzC2XfolSzRkOJBeTZOUB3uQ3IHQhFS3BQM9VV4FOFdL+3XMrhe+7nZ4d6YbBB1h+96Lnf7
	Kxj3Q8xptlBvRWoO0X3N1MfxNtvs+O655BEJjsGt4xl+mkTjn1mvUxMNgT5xd061Sqa8=
X-Received: by 2002:a53:ac8a:0:b0:679:9afd:c0c7 with SMTP id
 956f58d0204a3-67ba508d24fmr864212d50.126.1793345320085; Fri, 30 Oct 2026
 00:28:40 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261014082037.1774672-1-wenst@chromium.org> <20261014082037.1774672-3-wenst@chromium.org>
 <7020a7a6-332e-4fd0-a659-d82eb768614c@linaro.org> <CAGXv+5G1kgyumbj7wGf6rPFbg3spSO0zYmEkn-hZT4qUdJbytA@mail.gmail.com>
 <03375a31-0ac6-47a4-b0dc-6327080e1622@linaro.org> <b4c0761b-34f2-42ad-97e7-ab34ae776281@oss.qualcomm.com>
 <8d4d3ec2-3c97-4a46-97f8-048fdf81b853@linaro.org> <CAGXv+5G_ig=k-eH8Cp0ES70WxTHcBS2TVj9VmHaG9caROiAuQQ@mail.gmail.com>
 <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
In-Reply-To: <8ceba969-91d2-4b43-81d0-b26e7139664b@oss.qualcomm.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 30 Oct 2026 15:28:28 +0800
X-Gm-Features: AclHuK87PpF6mvOIXqHCbuY1WKimiNRH2tQGnceMsfo-UR5TI782gxdvYJm286Q
Message-ID: <CAGXv+5GFogx_kS=N1t8-SFTp+HyxLtoHzhnL6t8Zn0GBiqMoKw@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: usb: snps,dwc3: Fix downstream port numbering
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Felipe Balbi <balbi@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Sven Peter <sven@kernel.org>, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Billy Tsai <billy_tsai@aspeedtech.com>, Michal Simek <michal.simek@amd.com>, 
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Peter Griffin <peter.griffin@linaro.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Heiko Stuebner <heiko@sntech.de>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Troy Mitchell <troy.mitchell@linux.spacemit.com>, Minda Chen <minda.chen@starfivetech.com>, 
	Shyam Pandey <radhey.shyam.pandey@amd.com>, Wei Yang <yangwei1@eswincomputing.com>, 
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>, Hang Cao <caohang@eswincomputing.com>, 
	Li Jun <jun.li@nxp.com>, Peng Fan <peng.fan@nxp.com>, Roy Luo <royluo@google.com>, 
	Yang Xiwen <forbidden405@foxmail.com>, 
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>, 
	Robert Marko <robert.marko@sartura.hr>, Xu Yang <xu.yang_2@nxp.com>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Stanley Chang <stanley_chang@realtek.com>, 
	Ze Huang <huang.ze@linux.dev>, Aswath Govindraju <a-govindraju@ti.com>, 
	Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
	asahi@lists.linux.dev, linux-aspeed@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, Mathias Nyman <mathias.nyman@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_002842_415738_1968F7D8 
X-CRM114-Status: GOOD (  28.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBPY3QgMjEsIDIwMjYgYXQgNTo0NOKAr1BNIEtvbnJhZCBEeWJjaW8KPGtvbnJhZC5k
eWJjaW9Ab3NzLnF1YWxjb21tLmNvbT4gd3JvdGU6Cj4KPiBPbiAxMC8xNS8yNiAxMTowMCBBTSwg
Q2hlbi1ZdSBUc2FpIHdyb3RlOgo+ID4gKENjLWVkIE1hdGhpYXMsIHRoZSB4SENJIGRyaXZlciBt
YWludGFpbmVyIGluIGNhc2UgSSBtaXN1bmRlcnN0b29kIHhIQ0kuKQo+ID4KPiA+IE9uIFRodSwg
T2N0IDE1LCAyMDI2IGF0IDQ6NDTigK9QTSBOZWlsIEFybXN0cm9uZwo+ID4gPG5laWwuYXJtc3Ry
b25nQGxpbmFyby5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMTAvMTQvMjYgMTg6MzYsIEtvbnJh
ZCBEeWJjaW8gd3JvdGU6Cj4gPj4+IE9uIDEwLzE0LzI2IDExOjQ0IEFNLCBOZWlsIEFybXN0cm9u
ZyB3cm90ZToKPiA+Pj4+IE9uIDEwLzE0LzI2IDExOjI5LCBDaGVuLVl1IFRzYWkgd3JvdGU6Cj4g
Pj4+Pj4gT24gV2VkLCBPY3QgMTQsIDIwMjYgYXQgNToyOOKAr1BNIE5laWwgQXJtc3Ryb25nCj4g
Pj4+Pj4gPG5laWwuYXJtc3Ryb25nQGxpbmFyby5vcmc+IHdyb3RlOgo+Cj4gWy4uLl0KPgo+Cj4g
Pj4gSG93IGFib3V0IHRoZSBVU0I0LCBkb2VzIGl0IHVzZSB0aGUgVVNCMy4wIHBvcnQgPwo+ID4K
PiA+IEknbSBub3QgZmFtaWxpYXIgd2l0aCBVU0I0LiBBIHF1aWNrIHNlYXJjaCBzYXlzIHRoYXQg
aXQgY2FuIHR1bm5lbAo+ID4gVVNCIDMueCwgRFAsIGFuZCBQQ0llLCBhbmQgaXQgZG9lc24ndCBo
YXZlIGl0cyBvd24gVVNCIEhDSSBkZWZpbmVkLgo+ID4KPiA+IFNvIEknbSB0aGlua2luZyB0aGUg
VVNCNCBjb250cm9sbGVyIHdvdWxkIGJlIG1vcmUgbGlrZSBhIG5leHVzIG5vZGUKPiA+IG9yIG11
bHRpcGxleGluZyBub2RlLCBvciBwZXJoYXBzIGxpa2UgYSBVU0IgQyBjb25uZWN0b3IuIEl0IGhh
cyBpbnB1dAo+ID4gcG9ydHMgZm9yIGFsbCB0aGUgcHJvdG9jb2xzIGl0IGNhbiB0dW5uZWwsIGNv
bm5lY3RlZCB0byB0aGVpciByZXNwZWN0aXZlCj4gPiBjb250cm9sbGVycyAoWEhDSSwgRFAsIFBD
SWUpLiBUaGUgYmluZGluZyBwcm9iYWJseSB3b3VsZCBiZSB2ZXJ5IG1lc3N5Cj4gPiBpZiBvbmUg
Y29udHJvbGxlciBzdXBwb3J0ZWQgbXVsdGlwbGUgb3V0Z29pbmcgcG9ydHMsIGFzIGVhY2ggZG93
bnN0cmVhbQo+ID4gcG9ydCBoYXMgYSAzLXRvLTEgcmVsYXRpb25zaGlwIHdpdGggaXRzIHJlc3Bl
Y3RpdmUgdXBzdHJlYW0gcHJvdG9jb2wKPiA+IGludGVyZmFjZXMuCj4KPiBZZWFoIHRoYXQgaXMg
bW9yZSBvciBsZXNzIGl0Lgo+Cj4gVGhlcmUgbmVlZHMgdG8gYmUgYSBjb25uZWN0aW9uIGJldHdl
ZW4gdGhlIFVTQjQgcm91dGVyIGFuZCB0aGUgbmF0aXZlCj4gKFVTQjMgKnBvcnQqLCBub3QgaHVi
IHwgUENJZSAqcG9ydCosIG5vdCBSQyB8IERQVFgpIHByb3RvY29sIGFkYXB0ZXIKPiB3aGVyZSB0
aGUgdHVubmVsZWQgcGFja2V0cyBlbmQgdXAgYXQgdG8gY3JlYXRlIGEgUE0gZGV2bGluayBiZXR3
ZWVuIGl0Cj4gYW5kIHRoZSBVU0I0IHJvdXRlci4KPgo+IEFDUEkgZG9lcyB0aGF0IGJ5IGFkZGlu
ZyBhIGB1c2I0LWhvc3QtaW50ZXJmYWNlID0gJnJlZmVyZW5jZV90b19yb3V0ZXJgCj4gcHJvcGVy
dHksIGZvciBEVCB0aGF0J3Mgc3RpbGwgdW5kZWNpZGVkOgo+Cj4gaHR0cHM6Ly9naXRodWIuY29t
L2RldmljZXRyZWUtb3JnL2R0LXNjaGVtYS9wdWxsLzE5Ngo+Cj4gQXMgZmFyIGFzIHRoZSBRdWFs
Y29tbSBpbXBsZW1lbnRhdGlvbiBnb2VzLCBJIHdhcyBob3Bpbmcgd2UgY291bGQKPiBnbyBmb3J3
YXJkIHdpdGggYmFzZTEgbnVtYmVyaW5nIGFzIHRoZSBEV0MzIGlzIGFuIFhIQ0kgY29udHJvbGxl
cjoKPgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4LXVzYi8yMDI2MDkyOS10b3BpYy1k
d2MzX3R1bm5lbGluZ19zdGF0ZS12NC0wLTYzZTI5NjM0NmQ1N0Bvc3MucXVhbGNvbW0uY29tLwoK
SSBkb24ndCBoYXZlIERXQzMgbWFudWFscywgYnV0IGFzc3VtaW5nIGl0cyBpbnRlcm5hbCBudW1i
ZXJpbmcgZm9sbG93cwp0aGF0IG9mIFhIQ0ksIHlvdSBjYW4ndCBqdXN0IHVzZSAidWRldi0+cG9y
dG51bSAtIDEiIGluIHBhdGNoIDQuIFRoYXQKaXMgdGhlIGxvZ2ljYWwgcG9ydCBudW1iZXIgb24g
dGhlIHJvb3QgaHViLgoKSW5zdGVhZCB5b3UgbmVlZAoKICAgIHJhd19wb3J0ID0gdXNiX2hjZF9m
aW5kX3Jhd19wb3J0X251bWJlcihidXNfdG9faGNkKGh1Yi0+YnVzKSwgcG9ydDEpOwoKdG8gZ2V0
IHRoZSAxLWJhc2VkIHBvcnQgbnVtYmVyIGZvciBYSENJLgoKCkNoZW5ZdQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBs
aXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
