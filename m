Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE607C4452A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 14:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dn96DXX/pBQRzIh1OqkYugNkXXkA9iS003TPJSCGmsA=; b=V/GHE84Z6GHhHq
	FZpjN4/+vfBj/a9lg1/vnQ8cGFHssZ3foXasdEqpYcH28y0Ga4huOY2kgwPkDaY9H63hIQ05Vv/+M
	+RktCKIhVzAEAFse7pXKXpeg5ucTiBfNBGNir97X7PVI5WfeHSJvo8Ab7Gc0Wykm4thcBUZw0jY6A
	GMYMKFYq91veZ3RCimuiV5sqkVN3vqNt2KSKuFigr1BJLbqRaLrrrpOJ2zeml3zhJdjmFwzo2GbMg
	bu3LsSFSO+MdyIexZse7uU+TsyFf/gPaPHU/rjU3in47zJpHXPlO0rEQT41dwkfUx+uHn0Gs+Pt1O
	3EspfQ0rwyzJnNgieJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpNe-000000072ey-1FZn;
	Mon, 20 Jul 2026 14:54:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpNc-000000072eG-217P
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 14:54:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32C0B45008
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 14:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CB01F0155E
	for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 14:54:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784559244;
	bh=q88Fl0V/0lAk/+TEzcTUp/7qPfUq146zXnUT1jSEMMg=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=IYxPWK1rXxXdN5Fa0G5McnH/9BE30oH78m16049eaWAiGZ8KFbBDN/sHiRVE1A7Zv
	 eFRGTduevMm6chvQmkSybIEz2N24pDqIi6vN29/+4Ja9MOALWqfDeAhRIHhc/SARFc
	 WH4OIKCLUdaQZ5Kp724oR1HLazIfLgCtnIAki7qvaiZpwMv9uVyuvZtDBobdpVH/41
	 /mg3Q8+PKK5dbkke3ea7NtAkjnECokiBTTKva0nHE20cTX2FLTLulBNtLoxTzYJzsi
	 7qwK0tduSA9PqHlWZ/gxQ/0Cw9ujsL3VIWdBRdUmH2k2EOQrwPL0jm3F5nLJ0vjxeI
	 9W36YSXCxjo4w==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39c86ce9e29so65550901fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Jul 2026 07:54:03 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RprAErHleCvVl7B241o/xqzeZtfrNDOKEFtSH22O0gxghrq+4uivPtC5wtn/ZrPiQKYvZEr6OzmNsJ32g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw1phVKmCDsfTzfGHwTFCqBhxKYzoJdhKXQCny4dECf7QQlJOQO
	QoMIk2A4M0tachAcvVEjjzee5OaOoB6/zQ5oLSrCcy578IfU/KY/AAQG3p9RHJILfN3u9eTa2XU
	DddeiEBDygdM4ErNXIe6KMgN0QbYHAhU=
X-Received: by 2002:a2e:a902:0:b0:39a:fd6e:cac6 with SMTP id
 38308e7fff4ca-39eb2891a7emr29265181fa.25.1784559242360; Mon, 20 Jul 2026
 07:54:02 -0700 (PDT)
MIME-Version: 1.0
References: <20260716025215.33592-1-panchuang@vivo.com>
In-Reply-To: <20260716025215.33592-1-panchuang@vivo.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Mon, 20 Jul 2026 22:53:49 +0800
X-Gmail-Original-Message-ID: <CAGb2v658wUKEph0RaKmZQkOGZSpJTBx6YRW4uNg4-ijRmEqWZw@mail.gmail.com>
X-Gm-Features: AUfX_myDUKvf94v6L6ujyRnopyyEs37-MefKzA-7jWlx7IViNmraOkkn3GoqGCQ
Message-ID: <CAGb2v658wUKEph0RaKmZQkOGZSpJTBx6YRW4uNg4-ijRmEqWZw@mail.gmail.com>
Subject: Re: [PATCH] mailbox: Remove redundant dev_err()/dev_err_probe()
To: Pan Chuang <panchuang@vivo.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Tushar Khandelwal <Tushar.Khandelwal@arm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, =?UTF-8?B?TWFyZWsgQmVow7pu?= <kabel@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
	Manivannan Sadhasivam <mani@kernel.org>, Orson Zhai <orsonzhai@gmail.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:MAILBOX API" <linux-kernel@vger.kernel.org>, 
	"moderated list:MAILBOX ARM MHUv3" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:BROADCOM BCM2711/BCM2835 ARM ARCHITECTURE" <linux-rpi-kernel@lists.infradead.org>, 
	"open list:RISC-V MICROCHIP SUPPORT" <linux-riscv@lists.infradead.org>, 
	"open list:QUALCOMM CPUCP MAILBOX DRIVER" <linux-arm-msm@vger.kernel.org>, 
	"moderated list:ARM/STM32 ARCHITECTURE" <linux-stm32@st-md-mailman.stormreply.com>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVGh1LCBKdWwgMTYsIDIwMjYgYXQgMTA6NTLigK9BTSBQYW4gQ2h1YW5nIDxwYW5jaHVhbmdA
dml2by5jb20+IHdyb3RlOgo+Cj4gU2luY2UgY29tbWl0IDU1YjQ4ZTIzZjVjNCAoImdlbmlycS9k
ZXZyZXM6IEFkZCBlcnJvciBoYW5kbGluZyBpbgo+IGRldm1fcmVxdWVzdF8qX2lycSgpIiksIGRl
dm1fcmVxdWVzdF9pcnEoKSBhbmQgZGV2bV9yZXF1ZXN0X3RocmVhZGVkX2lycSgpCj4gYXV0b21h
dGljYWxseSBsb2cgZGV0YWlsZWQgZXJyb3IgbWVzc2FnZXMgb24gZmFpbHVyZS4gUmVtb3ZlIHRo
ZQo+IG5vdy1yZWR1bmRhbnQgZHJpdmVyLXNwZWNpZmljIGRldl9lcnIoKSBhbmQgZGV2X2Vycl9w
cm9iZSgpIGNhbGxzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGFuIENodWFuZyA8cGFuY2h1YW5nQHZp
dm8uY29tPgo+IC0tLQo+ICBkcml2ZXJzL21haWxib3gvYXJtX21odV9kYi5jICAgICAgICAgICAg
ICAgfCAgMSAtCj4gIGRyaXZlcnMvbWFpbGJveC9hcm1fbWh1djIuYyAgICAgICAgICAgICAgICB8
ICA5ICsrLS0tLS0tLQo+ICBkcml2ZXJzL21haWxib3gvYXJtX21odXYzLmMgICAgICAgICAgICAg
ICAgfCAgNSArKy0tLQo+ICBkcml2ZXJzL21haWxib3gvYXJtYWRhLTM3eHgtcnd0bS1tYWlsYm94
LmMgfCAgNCArLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9iY20tcGRjLW1haWxib3guYyAgICAgICAg
ICB8ICA1ICstLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9iY20yODM1LW1haWxib3guYyAgICAgICAg
ICB8ICA1ICstLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9iY203NDExMC1tYWlsYm94LmMgICAgICAg
ICB8ICAyICstCj4gIGRyaXZlcnMvbWFpbGJveC9jdjE4MDAtbWFpbGJveC5jICAgICAgICAgICB8
ICAyICstCj4gIGRyaXZlcnMvbWFpbGJveC9oaTYyMjAtbWFpbGJveC5jICAgICAgICAgICB8ICA1
ICstLS0tCj4gIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LW1wZnMuYyAgICAgICAgICAgICB8ICAy
IC0tCj4gIGRyaXZlcnMvbWFpbGJveC9tYWlsYm94LXN0aS5jICAgICAgICAgICAgICB8ICA0ICst
LS0KPiAgZHJpdmVycy9tYWlsYm94L3Fjb20tY3B1Y3AtbWJveC5jICAgICAgICAgIHwgIDIgKy0K
PiAgZHJpdmVycy9tYWlsYm94L3Fjb20taXBjYy5jICAgICAgICAgICAgICAgIHwgIDQgKy0tLQo+
ICBkcml2ZXJzL21haWxib3gvc3ByZC1tYWlsYm94LmMgICAgICAgICAgICAgfCAxMiArKystLS0t
LS0tLS0KPiAgZHJpdmVycy9tYWlsYm94L3N0bTMyLWlwY2MuYyAgICAgICAgICAgICAgIHwgIDQg
Ky0tLQoKCj4gIGRyaXZlcnMvbWFpbGJveC9zdW42aS1tc2dib3guYyAgICAgICAgICAgICB8ICA0
ICstLS0KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVsLm9yZz4gIyBzdW42aQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
