Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791F6E776E9
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Oct 2023 01:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFLj1tMTwv4bqOica2Mjj1bh6dz4esi7xvJcVCOL9Fo=; b=yP7VVuHLZiAV5b
	wSfYiMKWP4gx/pzmGlqk5j8Wx4CDbZZIXtTTBLnMdDWwiVGP95riHp1vYSZsvVDbDmV7muSww7whe
	lFEsxFQah1yx9JGTwPR/eDk/n8IqE0ec08q7JhMsxZOUuxEr2W/N4zMkIp228lhrQ6g0YwkrW2UaI
	vRQ7zuLNHHHkYW+rITIdX9orCyGXpAguv1OB26IkmE9t44zTHwaV9RyeBiPk5Be1lL8y5XUULPYEK
	vM1HlZ/gXgDjSyG6C5S2LQgChgZos+3mY4N6KkVHFwbIOfC3Pj+1LuzHmnsALUOi0I1YtEEFNV1UT
	2+QurKBtweXShab9jTzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnTrU-00Dbyb-26;
	Tue, 03 Oct 2023 01:06:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnTrQ-00Dbxz-2z;
	Tue, 03 Oct 2023 01:06:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 9053FB80D70;
	Tue,  3 Oct 2023 01:06:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99EB4C433C8;
	Tue,  3 Oct 2023 01:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696295161;
	bh=F4f0krFznweIk4taQ98VjdjNBbxdo6qbxD3mNrr0nSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qjo96mCWqTKW7xGjcbugvTHPxzMEDCajwcw1va4Y2FbcHxO3ZcGKJhTfC83106ARL
	 tU6n9aOW7ZWhDLjnQiboRRQ82EVD3td822hvni2XK2g9yNk3HSm2Ur7Z555ck5rG+o
	 12dhoHDmpsg6GbUi7vFsQpePSjmL7y7isIq5rL6cYanqyxddTPGOhvh9UX6i8cVIA7
	 ZNczfsHMS606tgeAt9grrKxT2FqCR0UULw6bIjRTIClFh9JhkLAVjJWQ9lZKETlzhR
	 YTYWmLkKqRpNbxBQIivk0G2e/6Y+0MGkQudKU03TMbdV9ij8lvPLibuVE8O1+k6oVB
	 UoMFwMLszD8rA==
From: Bjorn Andersson <andersson@kernel.org>
To: Joel Stanley <joel@jms.id.au>,
	Li Yang <leoyang.li@nxp.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Huisong Li <lihuisong@huawei.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Karol Gugala <kgugala@antmicro.com>,
	Mateusz Holenko <mholenko@antmicro.com>,
	Gabriel Somlo <gsomlo@gmail.com>,
	Yinbo Zhu <zhuyinbo@loongson.cn>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Gross <agross@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Shang XiaoJing <shangxiaojing@huawei.com>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Jeffery <andrew@aj.id.au>,
	linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Zev Weiss <zev@bewilderbeest.net>,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	zhang songyi <zhang.songyi@zte.com.cn>,
	Lubomir Rintel <lkundrak@v3.sk>,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Alim Akhtar <alim.akhtar@samsung.com>,
	linux-samsung-soc@vger.kernel.org,
	Nick Alcock <nick.alcock@oracle.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	linux-tegra@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Ruan Jinjie <ruanjinjie@huawei.com>,
	kernel@pengutronix.de
Subject: Re: (subset) [PATCH 00/40] soc: Convert to platform remove callback returning void
Date: Mon,  2 Oct 2023 18:10:02 -0700
Message-ID: <169629539848.1944895.16954663145011378401.b4-ty@kernel.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
References: <20230925095532.1984344-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_180605_286795_3DCBD78A 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Ck9uIE1vbiwgMjUgU2VwIDIwMjMgMTE6NTQ6NTEgKzAyMDAsIFV3ZSBLbGVpbmUtS8O2bmlnIHdy
b3RlOgo+IHRoaXMgc2VyaWVzIGNvbnZlcnRzIGFsbCBwbGF0Zm9ybSBkcml2ZXJzIGJlbG93IGRy
aXZlcnMvc29jIHRvIHVzZQo+IC5yZW1vdmVfbmV3KCkuIFRoZSBtb3RpdmF0aW9uIGlzIHRvIGdl
dCByaWQgb2YgYW4gaW50ZWdlciByZXR1cm4gY29kZQo+IHRoYXQgaXMgKG1vc3RseSkgaWdub3Jl
ZCBieSB0aGUgcGxhdGZvcm0gZHJpdmVyIGNvcmUgYW5kIGVycm9yIHByb25lIG9uCj4gdGhlIGRy
aXZlciBzaWRlLgo+IAo+IFNlZSBjb21taXQgNWM1YTc2ODBlNjdiICgicGxhdGZvcm06IFByb3Zp
ZGUgYSByZW1vdmUgY2FsbGJhY2sgdGhhdAo+IHJldHVybnMgbm8gdmFsdWUiKSBmb3IgYW4gZXh0
ZW5kZWQgZXhwbGFuYXRpb24gYW5kIHRoZSBldmVudHVhbCBnb2FsLgo+IAo+IFsuLi5dCgpBcHBs
aWVkLCB0aGFua3MhCgpbMTgvNDBdIHNvYy9xY29tOiBpY2MtYndtb246IENvbnZlcnQgdG8gcGxh
dGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiBkZDcx
NGM1NjhlZDRlNmY3OTAxN2JlNDUwNzdkZTcxZTk5MDhhZjAzClsxOS80MF0gc29jL3Fjb206IGxs
Y2MtcWNvbTogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0dXJuaW5nIHZv
aWQKICAgICAgICBjb21taXQ6IGQ4NWE5ZDE4YTU4MTU2ZmM4YjVhYjE4NWUwMGUwNzhhZGFhZWVm
ZGUKWzIwLzQwXSBzb2MvcWNvbTogb2NtZW06IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNh
bGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiAwYjc0MmM0OThiY2Q3ZDIxNTUw
MWIxMGZlOWRmNzJhMTYyMzc3MzVhClsyMS80MF0gc29jL3Fjb206IHBtaWNfZ2xpbms6IENvbnZl
cnQgdG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29t
bWl0OiA0YjMzNzNlNDJkYzJjYWEzNDM5NGFjMDkwYzhjNzBiZWQ0OWJhZGQ2ClsyMi80MF0gc29j
L3Fjb206IHFjb21fYW9zczogQ29udmVydCB0byBwbGF0Zm9ybSByZW1vdmUgY2FsbGJhY2sgcmV0
dXJuaW5nIHZvaWQKICAgICAgICBjb21taXQ6IGZmYmU4NGE1MTRmODYzYTQ2YTg1YzFlNDdiMmI2
ZDkzMGIxYjQ2M2UKWzIzLzQwXSBzb2MvcWNvbTogcWNvbV9nc2JpOiBDb252ZXJ0IHRvIHBsYXRm
b3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogNTdiMzE3
MjliZDJjNzJiMDBkNDAwMTA2ZTE4ZGI5MWU5ZDk1ZDNjMwpbMjQvNDBdIHNvYy9xY29tOiBxY29t
X3N0YXRzOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9p
ZAogICAgICAgIGNvbW1pdDogYTQ3ZmY5MGJmMmY5M2NlNGNhOTk4NTg5NDhhNzRhMGMxMGEyYmM0
NQpbMjUvNDBdIHNvYy9xY29tOiBybXRmc19tZW06IENvbnZlcnQgdG8gcGxhdGZvcm0gcmVtb3Zl
IGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0OiA3YzkzZGE1YjhiNjlkNGU0
ZTcyNzBjMzNiYTMyMDZhZjQzOTMwZTFkClsyNi80MF0gc29jL3Fjb206IHNtZW06IENvbnZlcnQg
dG8gcGxhdGZvcm0gcmVtb3ZlIGNhbGxiYWNrIHJldHVybmluZyB2b2lkCiAgICAgICAgY29tbWl0
OiA0YjhkZWU5YTM0ZDUxYTYxZjYwYWRkOTk2ZmFlNmE3MTQwYTIwYWU1ClsyNy80MF0gc29jL3Fj
b206IHNtcDJwOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcg
dm9pZAogICAgICAgIGNvbW1pdDogMWNkOTY2YzJkYzE5NjU0ZWQwOGM4NDNlNWM5MzNkYjhjMTM0
OTYzNgpbMjgvNDBdIHNvYy9xY29tOiBzbXNtOiBDb252ZXJ0IHRvIHBsYXRmb3JtIHJlbW92ZSBj
YWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1pdDogYmRkN2NjNjJjZjY5ZmU5ODk1
NTc0NDVkNjVkNmM4Y2IyZjk1NjUxOApbMjkvNDBdIHNvYy9xY29tOiBzb2NpbmZvOiBDb252ZXJ0
IHRvIHBsYXRmb3JtIHJlbW92ZSBjYWxsYmFjayByZXR1cm5pbmcgdm9pZAogICAgICAgIGNvbW1p
dDogYzA5ODlmN2QxMjY0YjJiMTg4NTM0NWEyOGEzMmZkNWUxZTYxZjljNwoKQmVzdCByZWdhcmRz
LAotLSAKQmpvcm4gQW5kZXJzc29uIDxhbmRlcnNzb25Aa2VybmVsLm9yZz4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
