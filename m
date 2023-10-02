Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C869DE784AD
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 14:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K9tPHpWeXVrlcMXCFm9vzKnagy9w/6SpA3AXdnUS04E=; b=Nzq9novPWCtpFq
	3X6tz7d7tsT3z1lBUJABv4wu2H1xEOkj02iBoQFTzZnEZ1ttfTP7v9KTpq4W9dguiwemytem8sCYp
	lyUUhQB2TXAdO69XzshYofDbf1WYmJPFaslC5gbA1vD1BYt3v9e+4WOUB/qL3YBWeALQTJm6zu+iH
	6HoZJQKQId1rwSepp77J2woS7FooRJd1kbp08mOMflak2H/f/Rs6xwF8FIk26Xhe0QjwhmZ1wJD3H
	9BMTHQcVF/84nZhPqTX2bfZ2bNRArXMaRgZReZj3wgVanwf1+64cD+MNsorRQ1NeJnFDYJcF3L9TR
	g3fD97BXLuYqEGvLzPRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJh5-00CrLn-2K;
	Mon, 02 Oct 2023 14:14:43 +0000
Received: from fllv0015.ext.ti.com ([198.47.19.141])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnJh2-00CrJv-09;
	Mon, 02 Oct 2023 14:14:41 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 392EDi1r029079;
	Mon, 2 Oct 2023 09:13:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1696256024;
	bh=9xwbB9UUJNHYGsvOL2OWasF1jedaAyNp2p7Cekqs654=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=By/tIsGE+iOxh5Xc+vk8G7bJIcgKrRMlPYXZHcFUKin/3+STUwGcSbwHAlEJAygAg
	 cYX4zyPPw/iOWY5DN75uQdDwGYBXfP8SBN+kqJyxUMDBGrYpXulQ+jDabJRfTmMu9G
	 DJaTDmzj2DXwuD/TrpxGcgigx7G0iwH+ZRX59CSI=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 392EDiPN020538
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 2 Oct 2023 09:13:44 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 2
 Oct 2023 09:13:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 2 Oct 2023 09:13:44 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 392EDhKD007764;
	Mon, 2 Oct 2023 09:13:44 -0500
From: Nishanth Menon <nm@ti.com>
To: Joel Stanley <joel@jms.id.au>, Li Yang <leoyang.li@nxp.com>,
        Herve Codina
	<herve.codina@bootlin.com>,
        Qiang Zhao <qiang.zhao@nxp.com>,
        Hitomi Hasegawa
	<hasegawa-hitomi@fujitsu.com>,
        Huisong Li <lihuisong@huawei.com>, Krzysztof
 Halasa <khalasa@piap.pl>,
        Karol Gugala <kgugala@antmicro.com>,
        Mateusz
 Holenko <mholenko@antmicro.com>,
        Gabriel Somlo <gsomlo@gmail.com>, Yinbo Zhu
	<zhuyinbo@loongson.cn>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Conor
 Dooley <conor.dooley@microchip.com>,
        Daire McNamara
	<daire.mcnamara@microchip.com>,
        Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn
 Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sumit Gupta <sumitg@nvidia.com>,
        Shang XiaoJing <shangxiaojing@huawei.com>,
        Muhammad Usama Anjum
	<usama.anjum@collabora.com>,
        Rob Herring <robh@kernel.org>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Michal Simek <michal.simek@amd.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Nishanth Menon <nm@ti.com>, Andrew Jeffery <andrew@aj.id.au>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Zev Weiss
	<zev@bewilderbeest.net>,
        <linuxppc-dev@lists.ozlabs.org>, <loongarch@lists.linux.dev>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        <linux-mediatek@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>,
        zhang songyi <zhang.songyi@zte.com.cn>,
        Lubomir Rintel <lkundrak@v3.sk>, <linux-arm-msm@vger.kernel.org>,
        <linux-rockchip@lists.infradead.org>,
        Alim
 Akhtar <alim.akhtar@samsung.com>,
        <linux-samsung-soc@vger.kernel.org>,
        Nick
 Alcock <nick.alcock@oracle.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        <linux-tegra@vger.kernel.org>, <linux-pm@vger.kernel.org>,
        Ruan Jinjie
	<ruanjinjie@huawei.com>, <kernel@pengutronix.de>
Subject: Re: (subset) [PATCH 00/40] soc: Convert to platform remove callback returning void
Date: Mon, 2 Oct 2023 09:13:43 -0500
Message-ID: <169625598637.2878306.1181893226380989815.b4-ty@ti.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_071440_172992_A7DB0118 
X-CRM114-Status: GOOD (  15.18  )
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

SGkgVXdlIEtsZWluZS1Lw7ZuaWcsCgpPbiBNb24sIDI1IFNlcCAyMDIzIDExOjU0OjUxICswMjAw
LCBVd2UgS2xlaW5lLUvDtm5pZyB3cm90ZToKPiB0aGlzIHNlcmllcyBjb252ZXJ0cyBhbGwgcGxh
dGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3NvYyB0byB1c2UKPiAucmVtb3ZlX25ldygpLiBU
aGUgbW90aXZhdGlvbiBpcyB0byBnZXQgcmlkIG9mIGFuIGludGVnZXIgcmV0dXJuIGNvZGUKPiB0
aGF0IGlzIChtb3N0bHkpIGlnbm9yZWQgYnkgdGhlIHBsYXRmb3JtIGRyaXZlciBjb3JlIGFuZCBl
cnJvciBwcm9uZSBvbgo+IHRoZSBkcml2ZXIgc2lkZS4KPiAKPiBTZWUgY29tbWl0IDVjNWE3Njgw
ZTY3YiAoInBsYXRmb3JtOiBQcm92aWRlIGEgcmVtb3ZlIGNhbGxiYWNrIHRoYXQKPiByZXR1cm5z
IG5vIHZhbHVlIikgZm9yIGFuIGV4dGVuZGVkIGV4cGxhbmF0aW9uIGFuZCB0aGUgZXZlbnR1YWwg
Z29hbC4KPiAKPiBbLi4uXQoKSSBoYXZlIGFwcGxpZWQgdGhlIGZvbGxvd2luZyB0byBicmFuY2gg
dGktZHJpdmVycy1zb2MtbmV4dCBvbiBbMV0uClRoYW5rIHlvdSEKClszMy80MF0gc29jL3RpOiBr
My1yaW5nYWNjOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogICAgICAgIGNvbW1pdDogZjM0YjkwMmM1YmE2Nzg0MTkwMmNkN2YwZTI0ZTY0YmI4MmY2
OWNiNApbMzQvNDBdIHNvYy90aToga25hdl9kbWE6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiAzYWY0ZWM3YzdkZDM5YTJj
NDYxOGY2NTM2YjJlN2I3M2ExOWJlMTY5ClszNS80MF0gc29jL3RpOiBrbmF2X3Ftc3NfcXVldWU6
IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAg
ICAgY29tbWl0OiBhZjk3MTYwYTBjNWYxOTA4YzZmMjgzMDAyM2ZiOTNiYWFjNDQ1MWQzClszNi80
MF0gc29jL3RpOiBwbTMzeHg6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJl
dHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiA5ZWI5NTBlOWZmZmM1MzM3YmZlMTc5OGNmODlj
ZTRkOTdhNGYxMjIxClszNy80MF0gc29jL3RpOiBwcnVzczogQ29udmVydCB0byBwbGF0Zm9ybSBy
ZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZvaWQKICAgICAgICBjb21taXQ6IGQxODNiMjBkMzQw
YjdjMDk4ZjQ0Y2I1YzAyZjRjZWQwMWNmZDBiMTYKWzM4LzQwXSBzb2MvdGk6IHNtYXJ0cmVmbGV4
OiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAg
ICAgIGNvbW1pdDogYmEwM2FhYjliZmI0YzlkNDU2NDE5ZGEzODkxMzc1ZDQ1YzZiZmUxNQpbMzkv
NDBdIHNvYy90aTogd2t1cF9tM19pcGM6IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxi
YWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiA4MmU4M2NiNTFjODdiNWJmM2FiODNm
N2M3YjE1MGMxOTQwMDA1NmMyCgpBbGwgYmVpbmcgd2VsbCB0aGlzIG1lYW5zIHRoYXQgaXQgd2ls
bCBiZSBpbnRlZ3JhdGVkIGludG8gdGhlIGxpbnV4LW5leHQKdHJlZSAodXN1YWxseSBzb21ldGlt
ZSBpbiB0aGUgbmV4dCAyNCBob3VycykgYW5kIHNlbnQgdXAgdGhlIGNoYWluIGR1cmluZwp0aGUg
bmV4dCBtZXJnZSB3aW5kb3cgKG9yIHNvb25lciBpZiBpdCBpcyBhIHJlbGV2YW50IGJ1ZyBmaXgp
LCBob3dldmVyIGlmCnByb2JsZW1zIGFyZSBkaXNjb3ZlcmVkIHRoZW4gdGhlIHBhdGNoIG1heSBi
ZSBkcm9wcGVkIG9yIHJldmVydGVkLgoKWW91IG1heSBnZXQgZnVydGhlciBlLW1haWxzIHJlc3Vs
dGluZyBmcm9tIGF1dG9tYXRlZCBvciBtYW51YWwgdGVzdGluZwphbmQgcmV2aWV3IG9mIHRoZSB0
cmVlLCBwbGVhc2UgZW5nYWdlIHdpdGggcGVvcGxlIHJlcG9ydGluZyBwcm9ibGVtcyBhbmQKc2Vu
ZCBmb2xsb3d1cCBwYXRjaGVzIGFkZHJlc3NpbmcgYW55IGlzc3VlcyB0aGF0IGFyZSByZXBvcnRl
ZCBpZiBuZWVkZWQuCgpJZiBhbnkgdXBkYXRlcyBhcmUgcmVxdWlyZWQgb3IgeW91IGFyZSBzdWJt
aXR0aW5nIGZ1cnRoZXIgY2hhbmdlcyB0aGV5CnNob3VsZCBiZSBzZW50IGFzIGluY3JlbWVudGFs
IHVwZGF0ZXMgYWdhaW5zdCBjdXJyZW50IGdpdCwgZXhpc3RpbmcKcGF0Y2hlcyB3aWxsIG5vdCBi
ZSByZXBsYWNlZC4KClBsZWFzZSBhZGQgYW55IHJlbGV2YW50IGxpc3RzIGFuZCBtYWludGFpbmVy
cyB0byB0aGUgQ0NzIHdoZW4gcmVwbHlpbmcKdG8gdGhpcyBtYWlsLgoKWzFdIGh0dHBzOi8vZ2l0
Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3RpL2xpbnV4LmdpdAotLSAKUmVn
YXJkcywKTmlzaGFudGggTWVub24KS2V5ICgweEREQjU4NDlEMTczNjI0OUQpIC8gRmluZ2VycHJp
bnQ6IEY4QTIgODY5MyA1NEVCIDgyMzIgMTdBMyAgMUEzNCBEREI1IDg0OUQgMTczNiAyNDlECgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
