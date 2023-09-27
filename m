Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4231E810AC
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 08:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:References:
	In-Reply-To:Message-Id:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EHer/DZclqEx7xxv+tHRgnZs4wyK+JXdsxvMTtBnV2s=; b=vUwtsEk1ARW2qV
	5A8cRYhSiul4TICthuTF/5XTOITr8/fQpVIPYm+3jHSGLBJoFIUU3+06tfpkpQkiZfhbjx0ir47bO
	pHSo6f5OVD1clbvigcT5PDB1j4CbzQyfQizK6PwOIAq5dURlKkbxQ34Li0dj95nQXJqLHm5synvid
	x6X+9OcL6zDg+1QIso3QGfIOzdN0p4m7cOmTUcvMWSLREynA9+biSMfhZhbZFnWyBb0hL6PZTXxB5
	RkSHrLawuTHc+cActSWZ0/xPzsxSUM6rthewmkDIEBm5/DX9+efGwVfWfyoYrSId4Qi0CO/k5p3Xn
	jUyyMDkLt5VhNNgp0uJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQ9G-000N0B-2p;
	Wed, 27 Sep 2023 08:43:58 +0000
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlQ9B-000MyG-1r;
	Wed, 27 Sep 2023 08:43:55 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id AD2CB2B00190;
	Wed, 27 Sep 2023 04:43:40 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 27 Sep 2023 04:43:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1695804220; x=1695811420; bh=o7VjoUAbmEtRJA+8mE/ljFlKqx4X7034jZT
	pRVdZN6U=; b=ADzfipzn1H6nvZj6IPUSg2e6bCMhLYRmEs66usghC3Y3gx5303Q
	aTTmtJG0A0L9CHLezJhajL9yKQwYfnfAFiXMKhwusvHW50CG5uI5iEl7tt3E5O/c
	109Prl9v1WY5Dz5zbA1UlVJNeFc9OyrqpbnS2acBLHAax7mj4JSazShKhZ2AKtL5
	Kb+sO9zLKfRG70g6mMx2NTtBQwA5XqhQTr1ML37jliO1pEZ8oPvMjAfQWzjpeRwp
	P93tKMWDgbtYnrHOA50hnF/3YZr7ca8sSU/zKOdnxmfL7uNzchYn4fxuizIz9Uwo
	wSMlNWEE93us8pOvJ6bXAOtzDZ3Y1r8Dkqg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1695804220; x=1695811420; bh=o7VjoUAbmEtRJA+8mE/ljFlKqx4X7034jZT
	pRVdZN6U=; b=T05vfZWD4SeZP01Wx6kQneLrsFr8U69yAe1OGWDRowa7yugQwJ3
	94K12SDEFGNefEiYGYpscPNiz8fBtJOZO5fFMXK84Cq+DLpoiisAlVL+RurIMkNt
	Nb2Kj7pvRYINg5vwBm6juNHbkdHU+vbRdM25KS0/MoCFoR7dMv4jNuYUJK728O7n
	iuONNqsQxEpFoNEgNZeMqcSx2GySa1Mo1t3OXUYum79164XAx8pAzMB2VEr5DM4K
	l2fTK2Za9USzPDJVwoXHD61JS9bNxlIY3Zqu64JfZbZVGMo1Hh9jhGdTq1v3tyYS
	fgvfYIMPcx51AjviWxI9VX5zh0EwxD/MAaA==
X-ME-Sender: <xms:OusTZTxl4DMJTP59c2KJ3iAewQQWbzZvdalDvbWGKOLzv2EzLdBGuA>
    <xme:OusTZbQexVSnj58RtwR8RCEaMhCEDqGXO2BE_Mcdl6H_L2Irne_1ea8tvqBCQSDTq
    Rq5c7228oHf_xSqDlE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvjedrtddvgddtjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:OusTZdUi1I6Gdh1mDxeBlJHg-Yno8M5T2KHxAbUCNM4lr_pKsVlrxA>
    <xmx:OusTZdie3X4oFed4rWhvAe5IK10Jrbz1ltYCRBKW4lbI9_Q9epjx-A>
    <xmx:OusTZVB2dhx1vK4otJlVYTjXkXX07gEQS0rDAla7iUQqudzIuChogw>
    <xmx:POsTZXqlhNzvo9JMY5-8GSCqucFjQ1YuFjO0FqgTBEXKd9KEj2fANC8DefA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 30D92B60089; Wed, 27 Sep 2023 04:43:38 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-957-ga1ccdb4cff-fm-20230919.001-ga1ccdb4c
MIME-Version: 1.0
Message-Id: <1b2fddf8-c0a6-4afa-8ad0-f280dea1607f@app.fastmail.com>
In-Reply-To: <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
 <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
Date: Wed, 27 Sep 2023 10:43:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Joel Stanley" <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: "Leo Li" <leoyang.li@nxp.com>, "Herve Codina" <herve.codina@bootlin.com>,
 "Qiang Zhao" <qiang.zhao@nxp.com>,
 "Hitomi Hasegawa" <hasegawa-hitomi@fujitsu.com>,
 "Huisong Li" <lihuisong@huawei.com>,
 "Krzysztof Halasa" <khalasa@piap.pl>,
 "Karol Gugala" <kgugala@antmicro.com>,
 "Mateusz Holenko" <mholenko@antmicro.com>,
 "Gabriel Somlo" <gsomlo@gmail.com>, "Yinbo Zhu" <zhuyinbo@loongson.cn>,
 "Matthias Brugger" <matthias.bgg@gmail.com>,
 "Conor.Dooley" <conor.dooley@microchip.com>,
 "Daire McNamara" <daire.mcnamara@microchip.com>,
 "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>,
 "Andy Gross" <agross@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konrad.dybcio@linaro.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Thierry Reding" <thierry.reding@gmail.com>,
 "Jon Hunter" <jonathanh@nvidia.com>, "Sumit Gupta" <sumitg@nvidia.com>,
 "Shang XiaoJing" <shangxiaojing@huawei.com>,
 "Muhammad Usama Anjum" <usama.anjum@collabora.com>,
 "Rob Herring" <robh@kernel.org>, "Nishanth Menon" <nm@ti.com>,
 "Santosh Shilimkar" <ssantosh@kernel.org>,
 "Michal Simek" <michal.simek@amd.com>,
 "Andrew Jeffery" <andrew@aj.id.au>, linux-arm-kernel@lists.infradead.org,
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Zev Weiss" <zev@bewilderbeest.net>, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev,
 "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org,
 "zhang.songyi" <zhang.songyi@zte.com.cn>,
 "Lubomir Rintel" <lkundrak@v3.sk>, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 "Alim Akhtar" <alim.akhtar@samsung.com>,
 linux-samsung-soc@vger.kernel.org,
 "Nick Alcock" <nick.alcock@oracle.com>,
 "Yang Yingliang" <yangyingliang@huawei.com>, linux-tegra@vger.kernel.org,
 linux-pm@vger.kernel.org, "Ruan Jinjie" <ruanjinjie@huawei.com>,
 "Pengutronix Kernel Team" <kernel@pengutronix.de>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning void
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_014354_115267_8BB88597 
X-CRM114-Status: GOOD (  15.22  )
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

T24gV2VkLCBTZXAgMjcsIDIwMjMsIGF0IDA0OjI1LCBKb2VsIFN0YW5sZXkgd3JvdGU6Cj4gT24g
TW9uLCAyNSBTZXB0IDIwMjMgYXQgMDk6NTUsIFV3ZSBLbGVpbmUtS8O2bmlnIDx1LmtsZWluZS1r
b2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Pgo+PiB0aGlzIHNlcmllcyBjb252ZXJ0cyBh
bGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3NvYyB0byB1c2UKPj4gLnJlbW92ZV9u
ZXcoKS4gVGhlIG1vdGl2YXRpb24gaXMgdG8gZ2V0IHJpZCBvZiBhbiBpbnRlZ2VyIHJldHVybiBj
b2RlCj4+IHRoYXQgaXMgKG1vc3RseSkgaWdub3JlZCBieSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNv
cmUgYW5kIGVycm9yIHByb25lIG9uCj4+IHRoZSBkcml2ZXIgc2lkZS4KPj4KPj4gU2VlIGNvbW1p
dCA1YzVhNzY4MGU2N2IgKCJwbGF0Zm9ybTogUHJvdmlkZSBhIHJlbW92ZSBjYWxsYmFjayB0aGF0
Cj4+IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRo
ZSBldmVudHVhbCBnb2FsLgo+Pgo+PiBBcyB0aGVyZSBpcyBubyBzaW5nbGUgbWFpbnRhaW5lciB0
ZWFtIGZvciBkcml2ZXJzL3NvYywgSSBzdWdnZXN0IHRoZQo+PiBpbmRpdmlkdWFsIG1haW50YWlu
ZXJzIHRvIHBpY2sgdXAgInRoZWlyIiBwYXRjaGVzLgo+Cj4gSSdkIGJlIGhhcHB5IGlmIEFybmQg
bWVyZ2VkIHRoZSBsb3QgYXQgb25jZS4gQXJuZCwgd2hhdCBkbyB5b3UgdGhpbms/Cj4KPiBJZiB0
aGF0IHdpbGwgYmUgdG9vIG1lc3N5IHRoZW4gSSB1bmRlcnN0YW5kLiBJIGhhdmUgcXVldWVkIHRo
ZSBhc3BlZWQKPiBvbmVzIGxvY2FsbHkgYW5kIHdpbGwgcHVzaCB0aGF0IG91dCBpZiB3ZSBkZWNp
ZGUgdGhhdCdzIHRoZSBiZXN0IHdheQo+IHRvIGdvLgoKVGhlIG1haW4gZG93bnNpZGUgb2YgbWVy
Z2luZyBpdCBhbGwgYXQgb25jZSB0aHJvdWdoIHRoZSBzb2MgdHJlZQppcyB0aGF0IHRoZXJlIG1h
eSBiZSBwYXRjaGVzIHRoYXQgY29uZmxpY3Qgd2l0aCBvdGhlciB3b3JrIGdvaW5nIG9uCmluIGlu
ZGl2aWR1YWwgZHJpdmVycy4KCldoYXQgSSdkIHN1Z2dlc3QgZG9pbmcgaGVyZSBpczoKCi0gaGF2
ZSBwbGF0Zm9ybSBtYWludGFpbmVycyBwaWNrIHVwIHBhdGNoZXMgZm9yIHRoZWlyIGRyaXZlcnMK
ICBpZiB0aGF0IGlzIHRoZWlyIHByZWZlcmVuY2UgZm9yIGFueSByZWFzb24KCi0gZ2V0IGEgcHVs
bCByZXF1ZXN0IGZyb20gVXdlIGZvciB0aGUgc29jIHRyZWUgZm9yIGFueXRoaW5nIHRoYXQgaGFz
CiAgbm90IGJlZW4gcGlja2VkIHVwIGluIG9uZSBvciB0d28gd2Vla3MgZnJvbSBub3cKCiAgICAg
IEFybmQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
