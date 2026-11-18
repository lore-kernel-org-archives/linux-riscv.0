Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80A0606A320
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 13:45:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=LSNE/08n;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RxwDW1Jg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=5DqkdyTlZtg45aui0TMFF3DygKyp27uQ/Q2j9yF0lVw=; b=LSNE/08nDgoWq3VUH4BMWcAqs1
	t+3dviqHVr1T2QORLD96obVB1CfnrIRfhe/DAdNcquIlCIXrTvIw8DUZCTVjarczGaqZdAcEstIOP
	a3bJCt1HqRRiSOWCJNKkMkpT166M6C5YxT7ecZ0pySL02ezsB52n5GUVMCa1hhlVtL41qWfHidMXm
	+6R1rriqPTS23C2Djoyv50XaOPyDdy9c5FUaelcBxgRpOuKWIhCdhrCBuVSZeH9UtpYsaQ7jgGCJR
	ahRMy++b15IC8dgNoNB582cy0vgETiJqDZU7vkyPJ3rvjuAV1DHigbPnqlV7MpbqkTGCggM1V9+x4
	f3rKcrxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfyW-00000008zMw-33OL;
	Wed, 18 Nov 2026 13:45:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTfyR-00000008zLy-0h0R
	for linux-riscv@lists.infradead.org;
	Wed, 18 Nov 2026 13:45:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E775A4609A
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 13:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94D81F000C8
	for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 13:45:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795009518;
	bh=zbYI8uP1li72NzJh/wjWDJ72bmhe8G4M88p9Kdrkgp4=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=RxwDW1JguCDucDNsShayzwrpopd1ZL9Qf2ZCAagnmVvg0zW+stUUkU79tiVnQB/Zo
	 Pmp7J5O40OKniL5gftISQKy3xeMQgqfUbNtMIYx/OgRyH5+WyU2VySZ2IsBbRbmLyD
	 Lcv2pp9ib1bXBYNArl1iETwXLKN6wdgElDCYFpz/BMJc+rZuNQ37QytMx+d2WMCe0H
	 FOrOeLU8pFP47A4NCAla2ZZdXV5MbYDeQMlL1zoWCPwvU6TpWK/+ZlW3NnD/6hU3zj
	 TjvzFKfPvmXqp86SHZoCLdg9t9YdEaZ5DJG81/QUfM4q8+rzPhOD6DXr9sxVvO3l1m
	 hi3EWHj5PIRRg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ae417eb235so9180681fa.3
        for <linux-riscv@lists.infradead.org>; Wed, 18 Nov 2026 05:45:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFjOgCVM8X3cgrIi/Izc84RAPSv8xo/cYDdlGxcbJib5AAjqEnC2tewBRNcSE+alrzWrUJ6/yqwB2MJig==@lists.infradead.org
X-Gm-Message-State: APuU4Z9L9T0ohxt5lcVkP6SDwILGg8ms/Unv9KyQEDKB6kHOVU1rAOZc
	6wPZbOLDdYvpd38s/MuJBCkMesc4l3/z2zHlNhnaa82TMELRmNi8/WNSxSMUYdx4OZfZ0Qo1SNx
	Mr4JiEJzfJt104fGiN8eOmiWOwVc6jG8=
X-Received: by 2002:a05:651c:b27:b0:3ab:3b73:4560 with SMTP id
 38308e7fff4ca-3ae670b2ef1mr8658421fa.11.1795009516447; Wed, 18 Nov 2026
 05:45:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
In-Reply-To: <20261114-irqchip-cleanup-api-v1-1-4a9d598b0bdb@nxp.com>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Wed, 18 Nov 2026 21:45:03 +0800
X-Gmail-Original-Message-ID: <CAGb2v65uyYnE-sryit44oXBwstxkG7HRtYWip5nyuHeZ034TbQ@mail.gmail.com>
X-Gm-Features: AclHuK_Ko1utGgb-Cp6pja7wJidoLs_raftCWPKZ3OajYizpg1rSK6L9ElxDv8s
Message-ID: <CAGb2v65uyYnE-sryit44oXBwstxkG7HRtYWip5nyuHeZ034TbQ@mail.gmail.com>
Subject: Re: [PATCH] irqchip: Convert chained handlers to guard_chained_irq()
To: Peng Fan <peng.fan@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ryan Chen <ryan_chen@aspeedtech.com>, 
	Benjamin Herrenschmidt <benh@kernel.crashing.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Tan Siewert <tan.siewert@9elements.com>, Eddie James <eajames@linux.ibm.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Caleb James DeLisle <cjd@cjdns.fr>, 
	Marc Zyngier <maz@kernel.org>, Miodrag Dinic <miodrag.dinic@mips.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Herve Codina <herve.codina@bootlin.com>, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Vladimir Zapolskiy <vz@mleia.com>, 
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>, 
	Qin Jian <qinjian@cqplus1.com>, Changhuang Liang <changhuang.liang@starfivetech.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Anirudha Sarangi <anirudha.sarangi@amd.com>, 
	Tushar Nimkar <tushar.nimkar@amd.com>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org, 
	linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, imx@lists.linux.dev, loongarch@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-sunxi@lists.linux.dev, git@amd.com, linux-arm-msm@vger.kernel.org, 
	Peng Fan <peng.fan@nxp.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMTQsIDIwMjYgYXQgMTE6MDbigK9QTSBQZW5nIEZhbiA8cGVuZy5mYW5AbGlu
dXguZGV2PiB3cm90ZToKPgo+IEZyb206IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+Cj4g
VXNlIHRoZSBzY29wZS1iYXNlZCBndWFyZF9jaGFpbmVkX2lycSgpIGhlbHBlciBpbiBhbGwgY2hh
aW5lZCBoYW5kbGVycwo+IHVuZGVyIGRyaXZlcnMvaXJxY2hpcC8gc28gdGhhdCBjaGFpbmVkX2ly
cV9leGl0KCkgaXMgYWx3YXlzIGludm9rZWQgd2hlbgo+IHRoZSBoYW5kbGVyIHJldHVybnMuIEhh
bmRsZXJzIHRoYXQgZHVwbGljYXRlZCB0aGUgZXhpdCBjYWxsIG9uIGFuIGVycm9yCj4gcGF0aCBv
ciBqdW1wZWQgdG8gYSBjb21tb24gZXhpdCBsYWJlbCBzaW1wbHkgcmV0dXJuIG5vdyBhbmQgcmVs
eSBvbiB0aGUKPiBndWFyZC4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPgo+IFNpZ25lZC1v
ZmYtYnk6IFBlbmcgRmFuIDxwZW5nLmZhbkBueHAuY29tPgo+IC0tLQo+IFdpdGggWzFdIG5vdyBt
ZXJnZWQgaW4gaXJxL2RyaXZlcnMsIGNvbnZlcnQgdGhlIGNoYWluZWQgSVJRIGhhbmRsZXJzIGlu
Cj4gZHJpdmVycy9pcnFjaGlwLyB0byB1c2UgZ3VhcmRfY2hhaW5lZF9pcnEoKS4gVGhpcyByZW1v
dmVzIHRoZSBleHBsaWNpdAo+IGNoYWluZWRfaXJxX2V4aXQoKSBjYWxscyBhbmQgdGhlIGdvdG9z
IHRoYXQgb25seSBleGlzdGVkIHRvIHJlYWNoIHRoZW0sCj4gcmVkdWNpbmcgYm9pbGVycGxhdGUu
Cj4KPiBJIHVzZSBhIHNjcmlwdCB0byBkbyB0aGUgam9iLCBhbmQgYWZ0ZXIgdGhhdCwgZG8gbWFu
bnVhbCBjaGVja2luZy4KPgo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KPgo+IFsxXSBodHRwczov
L2xvcmUua2VybmVsLm9yZy9hbGwvMTc5NDE3NDU4MzIzLjIwOTM5NDIuMTQzMzAxOTc2MDk4NDE4
OTY1OTgudGlwLWJvdDJAdGlwLWJvdDIvI3QKPiAtLS0KPiAgZHJpdmVycy9pcnFjaGlwL2V4eW5v
cy1jb21iaW5lci5jICAgICAgICAgIHwgNyArKy0tLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEt
YWNsaW50LXNzd2kuYyAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWFy
bWFkYS0zNzAteHAuYyAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1hc3Bl
ZWQtaTJjLWljLmMgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtYXNwZWVk
LXNjdS1pYy5jICAgICAgICB8IDggKystLS0tLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1hc3Qy
NzAwLWludGMxLmMgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtYXRoNzkt
bWlzYy5jICAgICAgICAgICB8IDUgKy0tLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1iY20yODM2
LmMgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtYmNtNjM0NS1s
MS5jICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWJjbTcwMzgtbDEu
YyAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1iY203MTIwLWwyLmMg
ICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtYnJjbXN0Yi1sMi5jICAg
ICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWR3LWFwYi1pY3RsLmMgICAg
ICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1lY29uZXQtZW43NTEyMjEuYyAg
ICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ2ljLmMgICAgICAgICAgICAgICAg
ICB8IDYgKystLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtZ29sZGZpc2gtcGljLmMgICAgICAg
ICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWlkdDMyNDN4LmMgICAgICAgICAgICAg
fCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1pbXgtaW50bXV4LmMgICAgICAgICAgIHwg
NCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtaW14LWlycXN0ZWVyLmMgICAgICAgICB8IDcg
KystLS0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWlteC1tdS1tc2kuYyAgICAgICAgICAgfCAz
ICstLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLWluZ2VuaWMtdGN1LmMgICAgICAgICAgfCA0ICst
LS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1sYW45NjZ4LW9pYy5jICAgICAgICAgIHwgMyArLS0K
PiAgZHJpdmVycy9pcnFjaGlwL2lycS1sb29uZ2FyY2gtYXZlYy5jICAgICAgIHwgNCArLS0tCj4g
IGRyaXZlcnMvaXJxY2hpcC9pcnEtbG9vbmdzb24tZWlvaW50Yy5jICAgICB8IDQgKy0tLQo+ICBk
cml2ZXJzL2lycWNoaXAvaXJxLWxvb25nc29uLWh0cGljLmMgICAgICAgfCAzICstLQo+ICBkcml2
ZXJzL2lycWNoaXAvaXJxLWxvb25nc29uLWh0dmVjLmMgICAgICAgfCA0ICstLS0KPiAgZHJpdmVy
cy9pcnFjaGlwL2lycS1sb29uZ3Nvbi1saW9pbnRjLmMgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMv
aXJxY2hpcC9pcnEtbG9vbmdzb24tcGNoLWxwYy5jICAgICB8IDMgKy0tCj4gIGRyaXZlcnMvaXJx
Y2hpcC9pcnEtbHBjMzJ4eC5jICAgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNo
aXAvaXJxLWxzLXNjZmctbXNpLmMgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlw
L2lycS1sczF4LmMgICAgICAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9p
cnEtbW1wLmMgICAgICAgICAgICAgICAgICB8IDcgKystLS0tLQo+ICBkcml2ZXJzL2lycWNoaXAv
aXJxLW1zY2Mtb2NlbG90LmMgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2ly
cS1tdmVidS1waWMuYyAgICAgICAgICAgIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEt
bXZlYnUtc2VpLmMgICAgICAgICAgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXBy
dXNzLWludGMuYyAgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1yZWFs
dGVrLXJ0bC5jICAgICAgICAgIHwgNyArKy0tLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtcmlz
Y3YtYXBsaWMtZGlyZWN0LmMgICB8IDQgKy0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXJpc2N2
LWltc2ljLWVhcmx5LmMgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zaWZpdmUt
cGxpYy5jICAgICAgICAgIHwgOCArKy0tLS0tLQo+ICBkcml2ZXJzL2lycWNoaXAvaXJxLXNwNzAy
MS1pbnRjLmMgICAgICAgICAgfCA0ICstLS0KPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zdGFyZml2
ZS1qaGIxMDAtaW50Yy5jIHwgNCArLS0tCj4gIGRyaXZlcnMvaXJxY2hpcC9pcnEtc3RtMzItZXh0
aS5jICAgICAgICAgICB8IDQgKy0tLQoKPiAgZHJpdmVycy9pcnFjaGlwL2lycS1zdW54aS1ubWku
YyAgICAgICAgICAgIHwgMyArLS0KCkFja2VkLWJ5OiBDaGVuLVl1IFRzYWkgPHdlbnNAa2VybmVs
Lm9yZz4gIyBzdW54aS1ubWkKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
