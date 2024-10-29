Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA04D5B16F
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Oct 2024 09:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HJTLHdVhlZ0AmKvYMNH9WFqAhbeZUbtQpnHyI+qOplE=; b=A3FaPBRCUyFOia
	RECPFt4IVqRotCsHHbm4BoNly/+0l5EDVyyu95BJfym7sMYEI4SKmKNj+IvVFvfy35DVC+p0YhhzG
	p3mDrTD9R8i5OYTDJZRjOUS/Bon3VLPuSNTHJZZq2E5xzfWmnJwsWdeWmOnmQLfJeqmRhyBrJvlIU
	59HfAIccxqXYcjPbCNXeoviN8EDVSweIBo5oVPSyc6ntxeYJqF8hpZ7tuFc0PhY/ufh1Meq6QTTS5
	Oc3F1ktvNI3/w9Lid8Fq5bkzxIh5H+RVCScsddmMkw7lpP4rLXOB9Zm1u822vlXLJjrt+ALoJ8dIP
	GChRcfpK+/9GfnJOP+Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iEt-0000000DpVp-0uzj;
	Tue, 29 Oct 2024 09:10:11 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5i8u-0000000DoVH-0pNn;
	Tue, 29 Oct 2024 09:04:02 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C68791BF204;
	Tue, 29 Oct 2024 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730192635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hpAfK6tyrvwMS8L2PbzrGqnbfuzjHJrlMvInkHIHnZI=;
	b=WkhI/DVqn/dDgEGXg5ze24s00SnuWWK8bmgYFAQaSQSgHS/3+b0O5sNNKTStjAxR/jf+4h
	0o6b25F5CM6hzS4ApkL7rjJteF/3WsvIXr9Is7v7RNPDr1hM6SgZtytzIUP4gZ5dtlEpLg
	COgrRCbWe5DTxWzSVRzksGVJyb597rnqQCl5AJLLhtHIb4htqmGNuaCLmKvnbildk9oQPe
	IqjYlYEsv6PJq4Tpe9bBIT7sk8n1gJbWFWN3kIUiX2Dd+Sk2UHidAD1P51iPnXfsSARzVl
	nu+FDRAug3FdoWJxDLz5FVgjrXmtG+m82/IUNQdOKDRvvPwaBoAqjYk9s9Gx2w==
Date: Tue, 29 Oct 2024 10:03:47 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Qiang Zhao
 <qiang.zhao@nxp.com>, Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Huisong Li <lihuisong@huawei.com>, Linus Walleij <linusw@kernel.org>, Imre
 Kaloz <kaloz@openwrt.org>, Karol Gugala <kgugala@antmicro.com>, Mateusz
 Holenko <mholenko@antmicro.com>, Gabriel Somlo <gsomlo@gmail.com>, Yinbo
 Zhu <zhuyinbo@loongson.cn>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor
 Dooley <conor.dooley@microchip.com>, Daire McNamara
 <daire.mcnamara@microchip.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Alim Akhtar <alim.akhtar@samsung.com>, Thierry Reding
 <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>,
 Nishanth Menon <nm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michal
 Simek <michal.simek@amd.com>, Andy Shevchenko
 <andriy.shevchenko@linux.intel.com>, Duje =?UTF-8?B?TWloYW5vdmnEhw==?=
 <duje.mihanovic@skole.hr>, Mark Brown <broonie@kernel.org>, David Wu
 <david.wu@rock-chips.com>, Jianqun Xu <jay.xu@rock-chips.com>, Jay
 Buddhabhatti <jay.buddhabhatti@amd.com>, Radhey Shyam Pandey
 <radhey.shyam.pandey@amd.com>, Izhar Ameer Shaikh
 <izhar.ameer.shaikh@amd.com>, Naman Trivedi Manojbhai
 <naman.trivedimanojbhai@amd.com>, linux-arm-kernel@lists.infradead.org,
 soc@lists.linux.dev, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] soc: Switch back to struct platform_driver::remove()
Message-ID: <20241029100347.542b56d4@bootlin.com>
In-Reply-To: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
References: <20241029074859.509587-2-u.kleine-koenig@baylibre.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: herve.codina@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_020400_531235_91EBEF61 
X-CRM114-Status: GOOD (  12.53  )
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

SGkgVXdlLAoKT24gVHVlLCAyOSBPY3QgMjAyNCAwODo0ODo1OCArMDEwMApVd2UgS2xlaW5lLUvD
tm5pZyA8dS5rbGVpbmUta29lbmlnQGJheWxpYnJlLmNvbT4gd3JvdGU6Cgo+IEFmdGVyIGNvbW1p
dCAwZWRiNTU1YTY1ZDEgKCJwbGF0Zm9ybTogTWFrZSBwbGF0Zm9ybV9kcml2ZXI6OnJlbW92ZSgp
Cj4gcmV0dXJuIHZvaWQiKSAucmVtb3ZlKCkgaXMgKGFnYWluKSB0aGUgcmlnaHQgY2FsbGJhY2sg
dG8gaW1wbGVtZW50IGZvcgo+IHBsYXRmb3JtIGRyaXZlcnMuCj4gCj4gQ29udmVydCBhbGwgcGxh
dGZvcm0gZHJpdmVycyBiZWxvdyBkcml2ZXJzL3NvYyB0byB1c2UgLnJlbW92ZSgpLCB3aXRoCj4g
dGhlIGV2ZW50dWFsIGdvYWwgdG8gZHJvcCBzdHJ1Y3QgcGxhdGZvcm1fZHJpdmVyOjpyZW1vdmVf
bmV3KCkuIEFzCj4gLnJlbW92ZSgpIGFuZCAucmVtb3ZlX25ldygpIGhhdmUgdGhlIHNhbWUgcHJv
dG90eXBlcywgY29udmVyc2lvbiBpcyBkb25lCj4gYnkganVzdCBjaGFuZ2luZyB0aGUgc3RydWN0
dXJlIG1lbWJlciBuYW1lIGluIHRoZSBkcml2ZXIgaW5pdGlhbGl6ZXIuCj4gCj4gT24gdGhlIHdh
eSBkbyBhIGZldyB3aGl0ZXNwYWNlIGNoYW5nZXMgdG8gbWFrZSBpbmRlbnRpb24gY29uc2lzdGVu
dC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29lbmln
QGJheWxpYnJlLmNvbT4KPiAtLS0KLi4uCj4gIGRyaXZlcnMvc29jL2ZzbC9xZS9xbWMuYyAgICAg
ICAgICAgICAgICAgICAgfCAyICstCj4gIGRyaXZlcnMvc29jL2ZzbC9xZS90c2EuYyAgICAgICAg
ICAgICAgICAgICAgfCAyICstCgpBY2tlZC1ieTogSGVydmUgQ29kaW5hIDxoZXJ2ZS5jb2RpbmFA
Ym9vdGxpbi5jb20+ICMgZm9yIGZzbC9xZS97cW1jLHRzYX0uYwoKQmVzdCByZWdhcmRzLApIZXJ2
w6kKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
