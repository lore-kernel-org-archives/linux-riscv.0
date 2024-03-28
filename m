Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37B75CD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 19:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=McVe74QSvdi6DP077MBNpGc+iTC3Ggv2WbsZOwSopqM=; b=STAU+JNfY8XENs
	M/pEXdLr+Qf9CkvF7TKrawbl/7urw2R1dYdWoZOkwBqNJZ1WZhRCHlek/SdRFXAfsx6wMqLlh0+Yg
	h8jrUYnVjoVilKXC7j2lmN38xhTsYgEMQrBuXrG+8Bbh+QFemjIGlIzWWaNmJdZ+9ZSHVifEZCn7/
	KFGWtBhBvMiA4yzVUkR35hlF8uT+rDJ2yeX/vfip89q0w08IsmcENMaiw9FexA/WrOcWXfBcVHgq9
	n6NVeuMIoAM5CxZikkxNbC3wYmxA0mEGWnJ0XVcHU45220S181tCIwDDfeKop1rJqzAjnu/wsXqvt
	pODeJcpzdYL45vPYXUmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvLL-0000000FMWI-0FPN;
	Thu, 28 Mar 2024 19:23:19 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpvLF-0000000FMUi-0O0n;
	Thu, 28 Mar 2024 19:23:15 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-6e707210ab9so57441a34.2;
        Thu, 28 Mar 2024 12:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711653790; x=1712258590; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=e9pVkHb/ttN6YKzxLWmnXcW1FKBONoeclefZMwrEm7PGQsgY/mj3YyTTbsMkw0WFYX
         +CyZYyXCfdl8ipPiolxD6DjVKeDjne+mR1UWKlG29hwQM2CRxjKWcOejXrrzhMhAtqZB
         +tmdORPo8G8Y0j6d74GLMaXKxXZW7wWmk8rnWLMq0BvIuycapuRlOMvHZUC+r8eo7YPs
         lS57QSrqxHP/CZqDTssHi1sxAhUqkTlPg5c+XkQDVXjo9Dy9Jnj4TstTKSkivVFiFgrW
         4CXEhiELuPcRnGZPRLN3wHkPQ5Livucs/YkNct0umuB0THkFgkSPe9syzRLdCoBu0KaD
         csHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711653790; x=1712258590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=KGkrxlSTa2IRIdFJ0lwsD5qO401Xe0IHERfxAi/0aiTVQhQT7P5u91p10gv7dKVXmG
         Iu2/5V9Sw9GuhHQ/wD89AJmH+pAjI2lwNws2VmpeDTq0FUcEY5uNHLNkqW71omObrIQk
         d690vRCS2cJcSU0v4RxodJoIj/lm/quqXMW8lR2dOFnuaWP57Js/jp8rXvifmRDrx8e0
         qffhUpc9ITpR9e0i+pUTgO5eZx1Reqt4qhsDlsnN6IFtI5Z2qjVP9Efonsv06Oz5nkfj
         GnmkFh179X7J0xANibRH/CYYq4FyLV6QL5u7qVXq7CkUSS3opqnhzHPnXDPZHI2KqCxW
         XYxw==
X-Forwarded-Encrypted: i=1; AJvYcCVs51q53CI8oNKlY8u1Pft7C8s62f5fQRqDEeiWkphwfxGsDRH4bAMgfP/slVZ/4m/SsIHh252VE0841TxHnONcQiolS3wZYsdRLSW7qO/p46fwLTx7VjzfOoxN6ePTpx0ntui5M3WBPPeNqyAik9SLMFm/9GuyFMB69izE2f5vf/lQMHKGeXBjBfMAm/arJxk990KnD55MialUpJjoPnVZfM7OLx++PnAy9BG1IKQl7YSI+3unrpEn9CdFWEPn7u7smaAWN1PBBPo+VKbjMb1nyHkVZxTT8u05A3kTl1zH1Bt4
X-Gm-Message-State: AOJu0YzdSPtZmL01d04KOTGaR4ioygURKAMRTY0oaYKtifDMcYWbjMYQ
	KtxRCUnSKmSw5MTXxkl4TBL9Jgys8RJBzr9+YQig2qi4FbTadTM=
X-Google-Smtp-Source: AGHT+IEOtLqqAjjYrlHQS8qBEVcSrjCNrCoEQoC8julgRSnyZQ6WZe0wbYQEX2ZQYcLWJzzUoCRR0w==
X-Received: by 2002:a9d:7754:0:b0:6e6:6ea1:9820 with SMTP id t20-20020a9d7754000000b006e66ea19820mr191312otl.14.1711653790323;
        Thu, 28 Mar 2024 12:23:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id n9-20020a9d64c9000000b006e6c9a56591sm344956otl.19.2024.03.28.12.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:23:09 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id A60B1180011;
	Thu, 28 Mar 2024 19:23:08 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:23:07 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Cc: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org,
	tj@kernel.org, keescook@chromium.org, vkoul@kernel.org,
	marcan@marcan.st, sven@svenpeter.dev, florian.fainelli@broadcom.com,
	rjui@broadcom.com, sbranden@broadcom.com, paul@crapouillou.net,
	Eugeniy.Paltsev@synopsys.com, manivannan.sadhasivam@linaro.org,
	vireshk@kernel.org, Frank.Li@nxp.com, leoyang.li@nxp.com,
	zw@zh-kernel.org, wangzhou1@hisilicon.com, haijie1@huawei.com,
	shawnguo@kernel.org, s.hauer@pengutronix.de, sean.wang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	afaerber@suse.de, logang@deltatee.com, daniel@zonque.org,
	haojian.zhuang@gmail.com, robert.jarzmik@free.fr,
	andersson@kernel.org, konrad.dybcio@linaro.org, orsonzhai@gmail.com,
	baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
	patrice.chotard@foss.st.com, linus.walleij@linaro.org,
	wens@csie.org, jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com,
	kys@microsoft.com, haiyangz@microsoft.com, wei.liu@kernel.org,
	decui@microsoft.com, jassisinghbrar@gmail.com, mchehab@kernel.org,
	maintainers@bluecherrydvr.com, aubin.constans@microchip.com,
	ulf.hansson@linaro.org, manuel.lauss@gmail.com,
	mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com, oakad@yahoo.com,
	hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
	brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
	duncan.sands@free.fr, stern@rowland.harvard.edu, oneukum@suse.com,
	openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-s390@vger.kernel.org,
	netdev@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgXDmx1HvujsMYAR@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_122313_270384_69D156FA 
X-CRM114-Status: GOOD (  36.58  )
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
Reply-To: minyard@acm.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBNYXIgMjgsIDIwMjQgYXQgMTA6NTI6MTZBTSAtMDcwMCwgQWxsZW4gd3JvdGU6Cj4g
T24gV2VkLCBNYXIgMjcsIDIwMjQgYXQgMTE6MDXigK9BTSBDb3JleSBNaW55YXJkIDxtaW55YXJk
QGFjbS5vcmc+IHdyb3RlOgo+ID4KPiA+IEkgYmVsaWV2ZSB0aGF0IHdvcmsgcXVldWVzIGl0ZW1z
IGFyZSBleGVjdXRlIHNpbmdsZS10aHJlYWRlZCBmb3IgYSB3b3JrCj4gPiBxdWV1ZSwgc28gdGhp
cyBzaG91bGQgYmUgZ29vZC4gIEkgbmVlZCB0byB0ZXN0IHRoaXMsIHRob3VnaC4gIEl0IG1heSBi
ZQo+ID4gdGhhdCBhbiBJUE1JIGRldmljZSBjYW4gaGF2ZSBpdHMgb3duIHdvcmsgcXVldWU7IGl0
IG1heSBub3QgYmUgaW1wb3J0YW50Cj4gPiB0byBydW4gaXQgaW4gYmggY29udGV4dC4KPiAKPiAg
IEZhaXIgcG9pbnQuIENvdWxkIHlvdSBwbGVhc2UgbGV0IG1lIGtub3cgb25jZSB5b3UgaGF2ZSBo
YWQgYSBjaGFuY2UgdG8gdGVzdAo+IHRoZXNlIGNoYW5nZXMuIE1lYW53aGlsZSwgSSB3aWxsIHdv
cmsgb24gUkZDIHdoZXJlaW4gSVBNSSB3aWxsIGhhdmUgaXRzIG93bgo+IHdvcmtxdWV1ZS4KPiAK
PiAgVGhhbmtzIGZvciB0YWtpbmcgdGltZSBvdXQgdG8gcmV2aWV3LgoKQWZ0ZXIgbG9va2luZyBh
bmQgdGhpbmtpbmcgYWJvdXQgaXQgYSBiaXQsIGEgQkggY29udGV4dCBpcyBzdGlsbApwcm9iYWJs
eSB0aGUgYmVzdCBmb3IgdGhpcy4KCkkgaGF2ZSB0ZXN0ZWQgdGhpcyBwYXRjaCB1bmRlciBsb2Fk
IGFuZCB2YXJpb3VzIHNjZW5hcmlvcyBhbmQgaXQgc2VlbXMKdG8gd29yayBvay4gIFNvOgoKVGVz
dGVkLWJ5OiBDb3JleSBNaW55YXJkIDxjbWlueWFyZEBtdmlzdGEuY29tPgpBY2tlZC1ieTogQ29y
ZXkgTWlueWFyZCA8Y21pbnlhcmRAbXZpc3RhLmNvbT4KCk9yIEkgY2FuIHRha2UgdGhpcyBpbnRv
IG15IHRyZWUuCgotY29yZXkKCj4gCj4gLSBBbGxlbgo+IAo+ID4KPiA+IC1jb3JleQo+ID4KPiA+
ID4KPiA+ID4gQmFzZWQgb24gdGhlIHdvcmsgZG9uZSBieSBUZWp1biBIZW8gPHRqQGtlcm5lbC5v
cmc+Cj4gPiA+IEJyYW5jaDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tl
cm5lbC9naXQvdGovd3EuZ2l0IGZvci02MTAKPiA+ID4KPiA+ID4gU2lnbmVkLW9mZi1ieTogQWxs
ZW4gUGFpcyA8YWxsZW4ubGttbEBnbWFpbC5jb20+Cj4gPiA+IC0tLQo+ID4gPiAgZHJpdmVycy9j
aGFyL2lwbWkvaXBtaV9tc2doYW5kbGVyLmMgfCAzMCArKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLQo+ID4gPiAgMSBmaWxlIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQo+ID4gPgo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jaGFyL2lwbWkvaXBtaV9tc2do
YW5kbGVyLmMgYi9kcml2ZXJzL2NoYXIvaXBtaS9pcG1pX21zZ2hhbmRsZXIuYwo+ID4gPiBpbmRl
eCBiMGVlZGM0NTk1YjMuLmZjZTJhMmRiZGM4MiAxMDA2NDQKPiA+ID4gLS0tIGEvZHJpdmVycy9j
aGFyL2lwbWkvaXBtaV9tc2doYW5kbGVyLmMKPiA+ID4gKysrIGIvZHJpdmVycy9jaGFyL2lwbWkv
aXBtaV9tc2doYW5kbGVyLmMKPiA+ID4gQEAgLTM2LDEyICszNiwxMyBAQAo+ID4gPiAgI2luY2x1
ZGUgPGxpbnV4L25vc3BlYy5oPgo+ID4gPiAgI2luY2x1ZGUgPGxpbnV4L3ZtYWxsb2MuaD4KPiA+
ID4gICNpbmNsdWRlIDxsaW51eC9kZWxheS5oPgo+ID4gPiArI2luY2x1ZGUgPGxpbnV4L3dvcmtx
dWV1ZS5oPgo+ID4gPgo+ID4gPiAgI2RlZmluZSBJUE1JX0RSSVZFUl9WRVJTSU9OICIzOS4yIgo+
ID4gPgo+ID4gPiAgc3RhdGljIHN0cnVjdCBpcG1pX3JlY3ZfbXNnICppcG1pX2FsbG9jX3JlY3Zf
bXNnKHZvaWQpOwo+ID4gPiAgc3RhdGljIGludCBpcG1pX2luaXRfbXNnaGFuZGxlcih2b2lkKTsK
PiA+ID4gLXN0YXRpYyB2b2lkIHNtaV9yZWN2X3Rhc2tsZXQoc3RydWN0IHRhc2tsZXRfc3RydWN0
ICp0KTsKPiA+ID4gK3N0YXRpYyB2b2lkIHNtaV9yZWN2X3dvcmsoc3RydWN0IHdvcmtfc3RydWN0
ICp0KTsKPiA+ID4gIHN0YXRpYyB2b2lkIGhhbmRsZV9uZXdfcmVjdl9tc2dzKHN0cnVjdCBpcG1p
X3NtaSAqaW50Zik7Cj4gPiA+ICBzdGF0aWMgdm9pZCBuZWVkX3dhaXRlcihzdHJ1Y3QgaXBtaV9z
bWkgKmludGYpOwo+ID4gPiAgc3RhdGljIGludCBoYW5kbGVfb25lX3JlY3ZfbXNnKHN0cnVjdCBp
cG1pX3NtaSAqaW50ZiwKPiA+ID4gQEAgLTQ5OCwxMyArNDk5LDEzIEBAIHN0cnVjdCBpcG1pX3Nt
aSB7Cj4gPiA+ICAgICAgIC8qCj4gPiA+ICAgICAgICAqIE1lc3NhZ2VzIHF1ZXVlZCBmb3IgZGVs
aXZlcnkuICBJZiBkZWxpdmVyeSBmYWlscyAob3V0IG9mIG1lbW9yeQo+ID4gPiAgICAgICAgKiBm
b3IgaW5zdGFuY2UpLCBUaGV5IHdpbGwgc3RheSBpbiBoZXJlIHRvIGJlIHByb2Nlc3NlZCBsYXRl
ciBpbiBhCj4gPiA+IC0gICAgICAqIHBlcmlvZGljIHRpbWVyIGludGVycnVwdC4gIFRoZSB0YXNr
bGV0IGlzIGZvciBoYW5kbGluZyByZWNlaXZlZAo+ID4gPiArICAgICAgKiBwZXJpb2RpYyB0aW1l
ciBpbnRlcnJ1cHQuICBUaGUgd29yayBpcyBmb3IgaGFuZGxpbmcgcmVjZWl2ZWQKPiA+ID4gICAg
ICAgICogbWVzc2FnZXMgZGlyZWN0bHkgZnJvbSB0aGUgaGFuZGxlci4KPiA+ID4gICAgICAgICov
Cj4gPiA+ICAgICAgIHNwaW5sb2NrX3QgICAgICAgd2FpdGluZ19yY3ZfbXNnc19sb2NrOwo+ID4g
PiAgICAgICBzdHJ1Y3QgbGlzdF9oZWFkIHdhaXRpbmdfcmN2X21zZ3M7Cj4gPiA+ICAgICAgIGF0
b21pY190ICAgICAgICAgd2F0Y2hkb2dfcHJldGltZW91dHNfdG9fZGVsaXZlcjsKPiA+ID4gLSAg
ICAgc3RydWN0IHRhc2tsZXRfc3RydWN0IHJlY3ZfdGFza2xldDsKPiA+ID4gKyAgICAgc3RydWN0
IHdvcmtfc3RydWN0IHJlY3Zfd29yazsKPiA+ID4KPiA+ID4gICAgICAgc3BpbmxvY2tfdCAgICAg
ICAgICAgICB4bWl0X21zZ3NfbG9jazsKPiA+ID4gICAgICAgc3RydWN0IGxpc3RfaGVhZCAgICAg
ICB4bWl0X21zZ3M7Cj4gPiA+IEBAIC03MDQsNyArNzA1LDcgQEAgc3RhdGljIHZvaWQgY2xlYW5f
dXBfaW50ZXJmYWNlX2RhdGEoc3RydWN0IGlwbWlfc21pICppbnRmKQo+ID4gPiAgICAgICBzdHJ1
Y3QgY21kX3JjdnIgICpyY3ZyLCAqcmN2cjI7Cj4gPiA+ICAgICAgIHN0cnVjdCBsaXN0X2hlYWQg
bGlzdDsKPiA+ID4KPiA+ID4gLSAgICAgdGFza2xldF9raWxsKCZpbnRmLT5yZWN2X3Rhc2tsZXQp
Owo+ID4gPiArICAgICBjYW5jZWxfd29ya19zeW5jKCZpbnRmLT5yZWN2X3dvcmspOwo+ID4gPgo+
ID4gPiAgICAgICBmcmVlX3NtaV9tc2dfbGlzdCgmaW50Zi0+d2FpdGluZ19yY3ZfbXNncyk7Cj4g
PiA+ICAgICAgIGZyZWVfcmVjdl9tc2dfbGlzdCgmaW50Zi0+d2FpdGluZ19ldmVudHMpOwo+ID4g
PiBAQCAtMTMxOSw3ICsxMzIwLDcgQEAgc3RhdGljIHZvaWQgZnJlZV91c2VyKHN0cnVjdCBrcmVm
ICpyZWYpCj4gPiA+ICB7Cj4gPiA+ICAgICAgIHN0cnVjdCBpcG1pX3VzZXIgKnVzZXIgPSBjb250
YWluZXJfb2YocmVmLCBzdHJ1Y3QgaXBtaV91c2VyLCByZWZjb3VudCk7Cj4gPiA+Cj4gPiA+IC0g
ICAgIC8qIFNSQ1UgY2xlYW51cCBtdXN0IGhhcHBlbiBpbiB0YXNrIGNvbnRleHQuICovCj4gPiA+
ICsgICAgIC8qIFNSQ1UgY2xlYW51cCBtdXN0IGhhcHBlbiBpbiB3b3JrIGNvbnRleHQuICovCj4g
PiA+ICAgICAgIHF1ZXVlX3dvcmsocmVtb3ZlX3dvcmtfd3EsICZ1c2VyLT5yZW1vdmVfd29yayk7
Cj4gPiA+ICB9Cj4gPiA+Cj4gPiA+IEBAIC0zNjA1LDggKzM2MDYsNyBAQCBpbnQgaXBtaV9hZGRf
c21pKHN0cnVjdCBtb2R1bGUgICAgICAgICAqb3duZXIsCj4gPiA+ICAgICAgIGludGYtPmN1cnJf
c2VxID0gMDsKPiA+ID4gICAgICAgc3Bpbl9sb2NrX2luaXQoJmludGYtPndhaXRpbmdfcmN2X21z
Z3NfbG9jayk7Cj4gPiA+ICAgICAgIElOSVRfTElTVF9IRUFEKCZpbnRmLT53YWl0aW5nX3Jjdl9t
c2dzKTsKPiA+ID4gLSAgICAgdGFza2xldF9zZXR1cCgmaW50Zi0+cmVjdl90YXNrbGV0LAo+ID4g
PiAtICAgICAgICAgICAgICAgICAgc21pX3JlY3ZfdGFza2xldCk7Cj4gPiA+ICsgICAgIElOSVRf
V09SSygmaW50Zi0+cmVjdl93b3JrLCBzbWlfcmVjdl93b3JrKTsKPiA+ID4gICAgICAgYXRvbWlj
X3NldCgmaW50Zi0+d2F0Y2hkb2dfcHJldGltZW91dHNfdG9fZGVsaXZlciwgMCk7Cj4gPiA+ICAg
ICAgIHNwaW5fbG9ja19pbml0KCZpbnRmLT54bWl0X21zZ3NfbG9jayk7Cj4gPiA+ICAgICAgIElO
SVRfTElTVF9IRUFEKCZpbnRmLT54bWl0X21zZ3MpOwo+ID4gPiBAQCAtNDc3OSw3ICs0Nzc5LDcg
QEAgc3RhdGljIHZvaWQgaGFuZGxlX25ld19yZWN2X21zZ3Moc3RydWN0IGlwbWlfc21pICppbnRm
KQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICogVG8gcHJlc2VydmUgbWVzc2FnZSBvcmRl
ciwgcXVpdCBpZiB3ZQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICogY2FuJ3QgaGFuZGxl
IGEgbWVzc2FnZS4gIEFkZCB0aGUgbWVzc2FnZQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICogYmFjayBhdCB0aGUgaGVhZCwgdGhpcyBpcyBzYWZlIGJlY2F1c2UgdGhpcwo+ID4gPiAtICAg
ICAgICAgICAgICAgICAgICAgICogdGFza2xldCBpcyB0aGUgb25seSB0aGluZyB0aGF0IHB1bGxz
IHRoZQo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICogd29yayBpcyB0aGUgb25seSB0aGlu
ZyB0aGF0IHB1bGxzIHRoZQo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICogbWVzc2FnZXMu
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgKi8KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGxpc3RfYWRkKCZzbWlfbXNnLT5saW5rLCAmaW50Zi0+d2FpdGluZ19yY3ZfbXNncyk7Cj4g
PiA+IEBAIC00ODEyLDEwICs0ODEyLDEwIEBAIHN0YXRpYyB2b2lkIGhhbmRsZV9uZXdfcmVjdl9t
c2dzKHN0cnVjdCBpcG1pX3NtaSAqaW50ZikKPiA+ID4gICAgICAgfQo+ID4gPiAgfQo+ID4gPgo+
ID4gPiAtc3RhdGljIHZvaWQgc21pX3JlY3ZfdGFza2xldChzdHJ1Y3QgdGFza2xldF9zdHJ1Y3Qg
KnQpCj4gPiA+ICtzdGF0aWMgdm9pZCBzbWlfcmVjdl93b3JrKHN0cnVjdCB3b3JrX3N0cnVjdCAq
dCkKPiA+ID4gIHsKPiA+ID4gICAgICAgdW5zaWduZWQgbG9uZyBmbGFncyA9IDA7IC8qIGtlZXAg
dXMgd2FybmluZy1mcmVlLiAqLwo+ID4gPiAtICAgICBzdHJ1Y3QgaXBtaV9zbWkgKmludGYgPSBm
cm9tX3Rhc2tsZXQoaW50ZiwgdCwgcmVjdl90YXNrbGV0KTsKPiA+ID4gKyAgICAgc3RydWN0IGlw
bWlfc21pICppbnRmID0gZnJvbV93b3JrKGludGYsIHQsIHJlY3Zfd29yayk7Cj4gPiA+ICAgICAg
IGludCBydW5fdG9fY29tcGxldGlvbiA9IGludGYtPnJ1bl90b19jb21wbGV0aW9uOwo+ID4gPiAg
ICAgICBzdHJ1Y3QgaXBtaV9zbWlfbXNnICpuZXdtc2cgPSBOVUxMOwo+ID4gPgo+ID4gPiBAQCAt
NDg2Niw3ICs0ODY2LDcgQEAgdm9pZCBpcG1pX3NtaV9tc2dfcmVjZWl2ZWQoc3RydWN0IGlwbWlf
c21pICppbnRmLAo+ID4gPgo+ID4gPiAgICAgICAvKgo+ID4gPiAgICAgICAgKiBUbyBwcmVzZXJ2
ZSBtZXNzYWdlIG9yZGVyLCB3ZSBrZWVwIGEgcXVldWUgYW5kIGRlbGl2ZXIgZnJvbQo+ID4gPiAt
ICAgICAgKiBhIHRhc2tsZXQuCj4gPiA+ICsgICAgICAqIGEgd29yay4KPiA+ID4gICAgICAgICov
Cj4gPiA+ICAgICAgIGlmICghcnVuX3RvX2NvbXBsZXRpb24pCj4gPiA+ICAgICAgICAgICAgICAg
c3Bpbl9sb2NrX2lycXNhdmUoJmludGYtPndhaXRpbmdfcmN2X21zZ3NfbG9jaywgZmxhZ3MpOwo+
ID4gPiBAQCAtNDg4Nyw5ICs0ODg3LDkgQEAgdm9pZCBpcG1pX3NtaV9tc2dfcmVjZWl2ZWQoc3Ry
dWN0IGlwbWlfc21pICppbnRmLAo+ID4gPiAgICAgICAgICAgICAgIHNwaW5fdW5sb2NrX2lycXJl
c3RvcmUoJmludGYtPnhtaXRfbXNnc19sb2NrLCBmbGFncyk7Cj4gPiA+Cj4gPiA+ICAgICAgIGlm
IChydW5fdG9fY29tcGxldGlvbikKPiA+ID4gLSAgICAgICAgICAgICBzbWlfcmVjdl90YXNrbGV0
KCZpbnRmLT5yZWN2X3Rhc2tsZXQpOwo+ID4gPiArICAgICAgICAgICAgIHNtaV9yZWN2X3dvcmso
JmludGYtPnJlY3Zfd29yayk7Cj4gPiA+ICAgICAgIGVsc2UKPiA+ID4gLSAgICAgICAgICAgICB0
YXNrbGV0X3NjaGVkdWxlKCZpbnRmLT5yZWN2X3Rhc2tsZXQpOwo+ID4gPiArICAgICAgICAgICAg
IHF1ZXVlX3dvcmsoc3lzdGVtX2JoX3dxLCAmaW50Zi0+cmVjdl93b3JrKTsKPiA+ID4gIH0KPiA+
ID4gIEVYUE9SVF9TWU1CT0woaXBtaV9zbWlfbXNnX3JlY2VpdmVkKTsKPiA+ID4KPiA+ID4gQEAg
LTQ4OTksNyArNDg5OSw3IEBAIHZvaWQgaXBtaV9zbWlfd2F0Y2hkb2dfcHJldGltZW91dChzdHJ1
Y3QgaXBtaV9zbWkgKmludGYpCj4gPiA+ICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPgo+ID4g
PiAgICAgICBhdG9taWNfc2V0KCZpbnRmLT53YXRjaGRvZ19wcmV0aW1lb3V0c190b19kZWxpdmVy
LCAxKTsKPiA+ID4gLSAgICAgdGFza2xldF9zY2hlZHVsZSgmaW50Zi0+cmVjdl90YXNrbGV0KTsK
PiA+ID4gKyAgICAgcXVldWVfd29yayhzeXN0ZW1fYmhfd3EsICZpbnRmLT5yZWN2X3dvcmspOwo+
ID4gPiAgfQo+ID4gPiAgRVhQT1JUX1NZTUJPTChpcG1pX3NtaV93YXRjaGRvZ19wcmV0aW1lb3V0
KTsKPiA+ID4KPiA+ID4gQEAgLTUwNjgsNyArNTA2OCw3IEBAIHN0YXRpYyBib29sIGlwbWlfdGlt
ZW91dF9oYW5kbGVyKHN0cnVjdCBpcG1pX3NtaSAqaW50ZiwKPiA+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZsYWdzKTsKPiA+ID4gICAgICAgfQo+ID4gPgo+ID4gPiAt
ICAgICB0YXNrbGV0X3NjaGVkdWxlKCZpbnRmLT5yZWN2X3Rhc2tsZXQpOwo+ID4gPiArICAgICBx
dWV1ZV93b3JrKHN5c3RlbV9iaF93cSwgJmludGYtPnJlY3Zfd29yayk7Cj4gPiA+Cj4gPiA+ICAg
ICAgIHJldHVybiBuZWVkX3RpbWVyOwo+ID4gPiAgfQo+ID4gPiAtLQo+ID4gPiAyLjE3LjEKPiA+
ID4KPiA+ID4KPiA+Cj4gCj4gCj4gLS0gCj4gICAgICAgIC0gQWxsZW4KPiAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
