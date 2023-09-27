Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB6DBE7F150
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 02:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GM9viARaXO8UC4F58E8z4NJnjYa72H7KpJZ8HBlsbXg=; b=TibPmDN8pzpb6j
	iY2B45U2UbglB0XIWpFrEEBuM+3kBDM8knGQ4aWH8FNRggf7or7+EPnBTdE9IUD9tc3kKnTXl+gT0
	cpLz0qjZMhn/1TRyu36LN4Ul8xhj1wAVHdIgYN8FhphT9gZ7HftppWhkKlSO6MkprkNYkpwtxBK5+
	y9kgYECGfqhEt6+NTyXsdA7K5S/TW+T0yBle0tIP59/cBvTe4O9u5jRv6ZkVEFha+YE+myzNfiqmg
	3czmDpSt3p1UREf4OUm+mkp60A1CexF1IbgztbBXYz6F/VA6jI+8Z8y+OzzQTzrX260HpquAnVAwk
	2wQvvvGiorkmJkiZGQjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlKFk-00HMeK-1G;
	Wed, 27 Sep 2023 02:26:16 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlKFe-00HMdG-2Y;
	Wed, 27 Sep 2023 02:26:12 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-9b2a3fd5764so317396966b.3;
        Tue, 26 Sep 2023 19:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google; t=1695781568; x=1696386368; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=gxNT9P3iuK8sCQUOspybTmsLgZmvWNE5voHrn4h9Cb26EWVgCl7btXEOxt6dQHmRiN
         qO8G2OizGGTUMnXJQctCN4BD/Rd+QS4hgxIoMkbK0dRXPt8WrxxfUiE5Ifi+suaoYObp
         Y6HBK+bKoV+EqDoxQ6Djga6yApj9O9Eo4j2ZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695781568; x=1696386368;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=emIKXtRIs/yM2DWwZD9zMtoiHVTkPPbqlVWgbeCiXyc=;
        b=R22wmtGxurnR0LVVumIxv7Ehl8UO/z1DjnrJWjbnK4Zy5IAfflmVaZPsWfsNiI0Uor
         cP2rtNwTplfHj4mgZDI21jJFBw3X6BtqKglm1iHLMtMa/E67Bf4/mhpgvEpH7tcOmeHo
         7Hhyiff4bG8e97cybEpvO1Bvwgts34PCPBjCGCZpd7KWzZEf7EuOKxrRs4ze2XSjVaEs
         0eoVZvxXR/3tpgJziJAwr+F0mzZxPOSzCOFRaSVdwMrBGFEoG+Kaq//BUs1qS1B7Hhou
         IG9aIfDxrKFSbXSRGF4b/hKfLK1NAdlh3lCy0SCeO7etz71RCRIvtoUOkeXmeGlBxRDy
         yKbA==
X-Gm-Message-State: AOJu0YyMzhRiFwWX9jdd9+DOYIZzqdUmKFPa9aHTDZPsOJZZeu4UapCH
	HgmHXMrHHk15La/2gFW1k3a8S5fnfey7pNdaY1w=
X-Google-Smtp-Source: AGHT+IHCCOjXb8+6pc5O9HOXdlXxVDhFBKsFiifAI3BglZZL/BL8JlMYEB/1h28CGguKKA8HQFS3La5RDl0OFTUHTbc=
X-Received: by 2002:a17:906:9a:b0:9b2:9d6f:2949 with SMTP id
 26-20020a170906009a00b009b29d6f2949mr400624ejc.57.1695781568293; Tue, 26 Sep
 2023 19:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 27 Sep 2023 02:25:56 +0000
Message-ID: <CACPK8XeROYz_XaB3TvUhdXm7Vm8fjC8yU+mfvA58=_FiDrBy-g@mail.gmail.com>
Subject: Re: [PATCH 00/40] soc: Convert to platform remove callback returning void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Li Yang <leoyang.li@nxp.com>, Herve Codina <herve.codina@bootlin.com>, 
	Qiang Zhao <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>, 
	Huisong Li <lihuisong@huawei.com>, Krzysztof Halasa <khalasa@piap.pl>, 
	Karol Gugala <kgugala@antmicro.com>, Mateusz Holenko <mholenko@antmicro.com>, 
	Gabriel Somlo <gsomlo@gmail.com>, Yinbo Zhu <zhuyinbo@loongson.cn>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Gross <agross@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sumit Gupta <sumitg@nvidia.com>, 
	Shang XiaoJing <shangxiaojing@huawei.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Rob Herring <robh@kernel.org>, Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Andrew Jeffery <andrew@aj.id.au>, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Zev Weiss <zev@bewilderbeest.net>, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, linux-riscv@lists.infradead.org, 
	zhang songyi <zhang.songyi@zte.com.cn>, Lubomir Rintel <lkundrak@v3.sk>, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, Alim Akhtar <alim.akhtar@samsung.com>, 
	linux-samsung-soc@vger.kernel.org, Nick Alcock <nick.alcock@oracle.com>, 
	Yang Yingliang <yangyingliang@huawei.com>, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org, Ruan Jinjie <ruanjinjie@huawei.com>, kernel@pengutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230926_192610_853426_BC5BB905 
X-CRM114-Status: GOOD (  13.58  )
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

T24gTW9uLCAyNSBTZXB0IDIwMjMgYXQgMDk6NTUsIFV3ZSBLbGVpbmUtS8O2bmlnCjx1LmtsZWlu
ZS1rb2VuaWdAcGVuZ3V0cm9uaXguZGU+IHdyb3RlOgo+Cj4gSGVsbG8sCj4KPiB0aGlzIHNlcmll
cyBjb252ZXJ0cyBhbGwgcGxhdGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3NvYyB0byB1c2UK
PiAucmVtb3ZlX25ldygpLiBUaGUgbW90aXZhdGlvbiBpcyB0byBnZXQgcmlkIG9mIGFuIGludGVn
ZXIgcmV0dXJuIGNvZGUKPiB0aGF0IGlzIChtb3N0bHkpIGlnbm9yZWQgYnkgdGhlIHBsYXRmb3Jt
IGRyaXZlciBjb3JlIGFuZCBlcnJvciBwcm9uZSBvbgo+IHRoZSBkcml2ZXIgc2lkZS4KPgo+IFNl
ZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3ZpZGUgYSByZW1vdmUgY2FsbGJh
Y2sgdGhhdAo+IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0ZW5kZWQgZXhwbGFuYXRpb24g
YW5kIHRoZSBldmVudHVhbCBnb2FsLgo+Cj4gQXMgdGhlcmUgaXMgbm8gc2luZ2xlIG1haW50YWlu
ZXIgdGVhbSBmb3IgZHJpdmVycy9zb2MsIEkgc3VnZ2VzdCB0aGUKPiBpbmRpdmlkdWFsIG1haW50
YWluZXJzIHRvIHBpY2sgdXAgInRoZWlyIiBwYXRjaGVzLgoKSSdkIGJlIGhhcHB5IGlmIEFybmQg
bWVyZ2VkIHRoZSBsb3QgYXQgb25jZS4gQXJuZCwgd2hhdCBkbyB5b3UgdGhpbms/CgpJZiB0aGF0
IHdpbGwgYmUgdG9vIG1lc3N5IHRoZW4gSSB1bmRlcnN0YW5kLiBJIGhhdmUgcXVldWVkIHRoZSBh
c3BlZWQKb25lcyBsb2NhbGx5IGFuZCB3aWxsIHB1c2ggdGhhdCBvdXQgaWYgd2UgZGVjaWRlIHRo
YXQncyB0aGUgYmVzdCB3YXkKdG8gZ28uCgpUaGFua3MgZm9yIGRvaW5nIHRoaXMgY2xlYW51cCBV
d2UuCgpDaGVlcnMsCgpKb2VsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
