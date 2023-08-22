Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29769EE49A5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 23:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NKgflDsnPLzHCsPxAk1gljL7zAHJQdDbRr0YaOMAYiM=; b=D47L8qTcNH9Zs3
	1MEetegN9gxqXaT5MYHBQnBFoTCror9zyHWkXRvIpqfayYHlPdX56E4Oc9WWKSqiYX2LFHvMFZH7y
	lLeeZfAEv3rihm6wPq5FacSKux63TyLL7GjszzVcCwn6Th0C2C1pn0+iPLoRy7QAB5Rgpok5LcW8F
	PZTIPOhGGYnfq9wB/HmxKFxQi9BFGISsLZfJizSe+MB+NUBsi7XlioedQK+Xd5N6vIF0WHcEebuQZ
	XdJtmo24ViR3ExKTQ8vPUfVN04YwVTshqtXK34I1/BpADAI3hjZ9SDpEA4d65wzKDXB0ttUQ2HsIk
	sM1L8lNMzqnnHoWweN2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYaR9-00Gv8L-2Q;
	Tue, 22 Aug 2023 23:05:23 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYaR7-00Gv7M-0J;
	Tue, 22 Aug 2023 23:05:22 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9a1681fa868so599569766b.3;
        Tue, 22 Aug 2023 16:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692745517; x=1693350317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=;
        b=J3AHJmH5FH5EWYJY8LWPuAdZqR9BdWQ9dx2Mj9W8vbp91TJ1UXiMgOCaUxI2aniiPB
         f1leJ9g1sr121JreOI3n55cXPjQ7zA4o+tr/7Xj74XSjU5xhQVWLAfv65/vuYbr+kS+Q
         /ovh7L4fXD1jtqk7udukzQ4S+YSX4HiRJ6H32pFUdajFJgi8zouIDKUDCUd8weXZcFy5
         ZQdQmjTtG2icVUMVYzlmKfRIHEZx+3QyGoKxKz9zH+LFSEbggDHgyj35mT8loDz5Q5Ms
         keThPZVmZN3bIb4H+MsLBJ3MXYDN+EbaYcEO8+DwlnB7dfUrh5WDAO80g84MD1k1IB9r
         87Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692745517; x=1693350317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tl1tPAJsY+6HeQIjw/xN1e5yMc1WTSncxxsEvTVmB8M=;
        b=YcCDFnFZfBNfPUaL7uWKuZUJe37DTS7tPOLilGRyl7Hv+ny0KNbQZ6cq/4MPjP3dmA
         V4SiW51CA/4vNjVODxK6wAcoRLM0/vstggghDVv+xZi24aJhfwVZ+x65OwtHSK6WF1iS
         /kaQTCHa/okVEwkqNVMj/5DweVv4AVtfBAoGnrmRPZvwNjD9StEdvdG66WO6f448Qt+x
         Cq30SeKSlDrhdAi3U+/RJmWfn6RTESJrK+s6ytYXA+EXKzBG1eC2t/qK5gpOrn4hjJEm
         ZXMAJ4V5Oi0UmQlxRH52S6WcCf948odde9reJg/XFxASnHiEs65XsEsEUior4716u8Sh
         2SJQ==
X-Gm-Message-State: AOJu0YxQb2LGa6mHv8REA2ba388n6nNQRrGdJlLCpm+oKgMXfA3uIIwg
	Wn47WefzslsjGl1TDQYR71M+Dhbwo7+wV1Zs38E=
X-Google-Smtp-Source: AGHT+IGc4vnfO5SO2rv82RsYq+TW7/uByZDfWyswWgwX0GX8iv3xt75IkRdZmjAU5aKwi0tBJtJFC8zrCiSUE6S0eJg=
X-Received: by 2002:a17:906:535d:b0:98e:f13:e908 with SMTP id
 j29-20020a170906535d00b0098e0f13e908mr9494142ejo.60.1692745517251; Tue, 22
 Aug 2023 16:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230714174702.4059100-1-robh@kernel.org>
In-Reply-To: <20230714174702.4059100-1-robh@kernel.org>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Tue, 22 Aug 2023 18:05:06 -0500
Message-ID: <CABb+yY0ZEkU2fEoFcihDM0GPuNBkCJHYXfkq-+bLJY1xtbf5Jw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Explicitly include correct DT includes
To: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	NXP Linux Team <linux-imx@nxp.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Heiko Stuebner <heiko@sntech.de>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Chunyan Zhang <zhang.lyra@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Michal Simek <michal.simek@amd.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-tegra@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_160521_129863_9456FF8C 
X-CRM114-Status: GOOD (  11.48  )
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

T24gRnJpLCBKdWwgMTQsIDIwMjMgYXQgMTI6NDfigK9QTSBSb2IgSGVycmluZyA8cm9iaEBrZXJu
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
ZmYtYnk6IFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4KSSB0aG91Z2h0IEkgd2FzIHRv
IHBpY2sgdGhlIHBhdGNoLiBCdXQgSSBzZWUgeW91IGludGVuZCB0byBkbyBpdC4gTnAuCgpBY2tl
ZC1ieTogSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwuY29tPgoKdGhhbmtzCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBt
YWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
