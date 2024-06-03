Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1416AC25B75
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Jun 2024 17:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Cc:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kc65/I642wJqRae/koi6+hf7UwqZbuBtI6djEcAKpWg=; b=vJrKvsFtAHgtzX
	gr9Is3pi6YIu3uXhegSilw/seVkRQUr2Six21dM2itqGTx+ijk2EFGOje00u22MzYHUaHPz8SaXgb
	Ur9INaN7Ot6ql854RT1Xha21XzSPWAMzb3hOnml1VO9Kl7HO0qVF0ZL35gkyLvQKeLyheV/EWuIJ1
	bixS6yb2OLC82oeFTK/3g9ZaIurv0e9LU/MVop87qO/m0nGbw+6mi4NYeizCYzzH7f9dQU8GrHgEZ
	Hl0+2ig9spfkmAk+7uwZZlUOE2wA6Z7JfuvYj6s0k7X0Pp+2YwK4+glUpc8cok74cYWv/fFRrX2cY
	QgqdVm3pQckDCsJjDbuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBQx-0000000HV13-3dRw;
	Mon, 03 Jun 2024 17:25:23 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEBQs-0000000HUyd-0mYR;
	Mon, 03 Jun 2024 17:25:19 +0000
Received: from smtpclient.apple (d66-183-91-182.bchsia.telus.net [66.183.91.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4684920681D5;
	Mon,  3 Jun 2024 10:25:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4684920681D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717435514;
	bh=4DfOU8aQl0aDoujS+l1W8I9cPbB9Sd5aNNyJFDGp/QQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=arwB9k2cp5qmOpH04JZQJkpaQ68dKr6NHq6/nWjIeKTEglSLJZbHneTkxRo0iYye3
	 dopPLk66Mp6Cqqtct/3LWOtVyWSXCVY5VMtnmDbdTLbXrzM1H6t1A8KCeQ5Sp+gzGS
	 Acr7rY4qAUIDkO+vSD/92kHIH7AgZovgYBJ1BnFc=
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
From: Allen Pais <apais@linux.microsoft.com>
In-Reply-To: <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
Date: Mon, 3 Jun 2024 10:25:02 -0700
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Tejun Heo <tj@kernel.org>,
 Kees Cook <keescook@chromium.org>,
 Vinod Koul <vkoul@kernel.org>,
 marcan@marcan.st,
 sven@svenpeter.dev,
 florian.fainelli@broadcom.com,
 Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Eugeniy.Paltsev@synopsys.com,
 manivannan.sadhasivam@linaro.org,
 Viresh Kumar <vireshk@kernel.org>,
 Frank.Li@nxp.com,
 Leo Li <leoyang.li@nxp.com>,
 zw@zh-kernel.org,
 Zhou Wang <wangzhou1@hisilicon.com>,
 haijie1@huawei.com,
 Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 angelogioacchino.delregno@collabora.com,
 =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 Daniel Mack <daniel@zonque.org>,
 Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>,
 andersson@kernel.org,
 konrad.dybcio@linaro.org,
 Orson Zhai <orsonzhai@gmail.com>,
 baolin.wang@linux.alibaba.com,
 Lyra Zhang <zhang.lyra@gmail.com>,
 Patrice CHOTARD <patrice.chotard@foss.st.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Chen-Yu Tsai <wens@csie.org>,
 =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>,
 peter.ujfalusi@gmail.com,
 kys@microsoft.com,
 haiyangz@microsoft.com,
 wei.liu@kernel.org,
 decui@microsoft.com,
 jassisinghbrar@gmail.com,
 mchehab@kernel.org,
 maintainers@bluecherrydvr.com,
 ulf.hansson@linaro.org,
 manuel.lauss@gmail.com,
 mirq-linux@rere.qmqm.pl,
 jh80.chung@samsung.com,
 oakad@yahoo.com,
 hayashi.kunihiko@socionext.com,
 mhiramat@kernel.org,
 brucechang@via.com.tw,
 HaraldWelte@viatech.com,
 pierre@ossman.eu,
 duncan.sands@free.fr,
 stern@rowland.harvard.edu,
 oneukum@suse.com,
 openipmi-developer@lists.sourceforge.net,
 dmaengine@vger.kernel.org,
 asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org,
 imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org,
 linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org,
 linux-hyperv@vger.kernel.org,
 linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org,
 linux-mmc@vger.kernel.org,
 linux-omap@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org,
 linux-s390@vger.kernel.org,
 netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
Message-Id: <61F36002-C765-410C-8EF9-203593C269FF@linux.microsoft.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
 <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
To: Aubin Constans <aubin.constans@microchip.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_102518_422582_F7353A57 
X-CRM114-Status: GOOD (  13.80  )
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

Cgo+IE9uIEp1biAzLCAyMDI0LCBhdCA1OjM44oCvQU0sIEF1YmluIENvbnN0YW5zIDxhdWJpbi5j
b25zdGFuc0BtaWNyb2NoaXAuY29tPiB3cm90ZToKPiAKPiBPbiAyNy8wMy8yMDI0IDE3OjAzLCBB
bGxlbiBQYWlzIHdyb3RlOgo+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9y
IG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4g
VGhlIG9ubHkgZ2VuZXJpYyBpbnRlcmZhY2UgdG8gZXhlY3V0ZSBhc3luY2hyb25vdXNseSBpbiB0
aGUgQkggY29udGV4dCBpcwo+PiB0YXNrbGV0OyBob3dldmVyLCBpdCdzIG1hcmtlZCBkZXByZWNh
dGVkIGFuZCBoYXMgc29tZSBkZXNpZ24gZmxhd3MuIFRvCj4+IHJlcGxhY2UgdGFza2xldHMsIEJI
IHdvcmtxdWV1ZSBzdXBwb3J0IHdhcyByZWNlbnRseSBhZGRlZC4gQSBCSCB3b3JrcXVldWUKPj4g
YmVoYXZlcyBzaW1pbGFybHkgdG8gcmVndWxhciB3b3JrcXVldWVzIGV4Y2VwdCB0aGF0IHRoZSBx
dWV1ZWQgd29yayBpdGVtcwo+PiBhcmUgZXhlY3V0ZWQgaW4gdGhlIEJIIGNvbnRleHQuCj4+IFRo
aXMgcGF0Y2ggY29udmVydHMgZHJpdmVycy9pbmZpbmliYW5kLyogZnJvbSB0YXNrbGV0IHRvIEJI
IHdvcmtxdWV1ZS4KPj4gQmFzZWQgb24gdGhlIHdvcmsgZG9uZSBieSBUZWp1biBIZW8gPHRqQGtl
cm5lbC5vcmc+Cj4+IEJyYW5jaDogaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4
L2tlcm5lbC9naXQvdGovd3EuZ2l0IGZvci02LjEwCj4+IFNpZ25lZC1vZmYtYnk6IEFsbGVuIFBh
aXMgPGFsbGVuLmxrbWxAZ21haWwuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvbW1jL2hvc3QvYXRt
ZWwtbWNpLmMgICAgICAgICAgICAgICAgICB8IDM1ICsrKystLS0tLQo+IFsuLi5dCj4gCj4gRm9y
IGF0bWVsLW1jaSwganVkZ2luZyBmcm9tIGEgZmV3IHNpbXBsZSB0ZXN0cywgcGVyZm9ybWFuY2Ug
aXMgcHJlc2VydmVkLgo+IEUuZy4gd3JpdGluZyB0byBhIFNEIENhcmQgb24gdGhlIFNBTUE1RDMt
WHBsYWluZWQgYm9hcmQ6Cj4gdGltZSBkZCBpZj0vZGV2L3plcm8gb2Y9L29wdC9fZGVsX21lIGJz
PTRrIGNvdW50PTY0awo+IAo+ICAgICBCYXNlIDYuOS4wIDogMC4wN3VzZXIgNS4wNXN5c3RlbSAw
OjE4LjkyZWxhcHNlZCAyNyVDUFUKPiAgUGF0Y2hlZCA2LjkuMCs6IDAuMTJ1c2VyIDQuOTJzeXN0
ZW0gMDoxOC43NmVsYXBzZWQgMjYlQ1BVCj4gCj4gSG93ZXZlciwgcGxlYXNlIHJlc29sdmUgd2hh
dCBjaGVja3BhdGNoIGlzIGNvbXBsYWluaW5nIGFib3V0Ogo+IHNjcmlwdHMvY2hlY2twYXRjaC5w
bCAtLXN0cmljdCBQQVRDSC05LTktbW1jLUNvbnZlcnQtZnJvbS10YXNrbGV0LXRvLUJILXdvcmtx
dWV1ZS5tYm94Cj4gCj4gIFdBUk5JTkc6IHBsZWFzZSwgbm8gc3BhY2UgYmVmb3JlIHRhYnMKPiAg
IzcyOiBGSUxFOiBkcml2ZXJzL21tYy9ob3N0L2F0bWVsLW1jaS5jOjM2NzoKPiAgK15Jc3RydWN0
IHdvcmtfc3RydWN0IF5Jd29yazskCj4gCj4gU2FtZSBhcyBkaXNjdXNzaW9ucyBvbiB0aGUgVVNC
IHBhdGNoWzFdIGFuZCBvdGhlcnMgaW4gdGhpcyBzZXJpZXMsIEkgYW0gYWxzbyBpbiBmYXZvdXIg
b2YgIndvcmtxdWV1ZSIgb3Igc2ltaWxhciBpbiB0aGUgY29tbWVudHMsIHJhdGhlciB0aGFuIGp1
c3QgIndvcmsiLgoKIFdpbGwgc2VuZCBvdXQgYSBuZXcgdmVyc2lvbi4KClRoYW5rIHlvdSB2ZXJ5
IG11Y2ggZm9yIHRlc3RpbmcgYW5kIHByb3ZpZGluZyB5b3VyIHJldmlldy4KCi0gQWxsZW4KCj4g
Cj4gQXBhcnQgZnJvbSB0aGF0Ogo+IFRlc3RlZC1ieTogQXViaW4gQ29uc3RhbnMgPGF1YmluLmNv
bnN0YW5zQG1pY3JvY2hpcC5jb20+Cj4gQWNrZWQtYnk6IEF1YmluIENvbnN0YW5zIDxhdWJpbi5j
b25zdGFuc0BtaWNyb2NoaXAuY29tPgo+IAo+IFRoYW5rcy4KPiAKPiBbMV06IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LW1tYy9DQU9NZFdTTGlwUGZtM09aVHBqWno0dUY0TStFXzhRQW9U
ZU1jS0JYYXdMbmtUUXg2SmdAbWFpbC5nbWFpbC5jb20vCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4
LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
