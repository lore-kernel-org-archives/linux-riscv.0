Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50349EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 20:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PM3Bps8tVByliczMRx9jNxBB9sgFjBd/twBZr2y/XGE=; b=vY5Nl0YSpu8bwM
	bty9YrkFgZup29nSD7bBddYczzy1sPhkcEunGhffis2nlRZ5BQXSZb8zjurlmWmRHueMDbsOWoz1l
	pqrEB/W20Viq/J3befibMQdXrrmRO4HN5rTcckT9IZC3TAez8u+46LnUCwsqn6I6MK3IsQ/hdMEQy
	tP5QvqJRVsZIgWBpzSTvKgx5dXxlxnIkJGnUpxbxAkEKHqoinLc1bYLrcX1EIvzAFmwD2i6lj/74z
	r3IBmk22V20QLkaXCycV0OeFOqxums9wMK1Vi65TPBkUOYAFlGhupKIzUnQQVGe7UxXqQ1MUa/imK
	oZLc30rdA0UA8hrYhR3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKPqR-007Epk-1C;
	Fri, 14 Jul 2023 20:56:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKPqO-007Eo1-2G
	for linux-riscv@lists.infradead.org;
	Fri, 14 Jul 2023 20:56:54 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq6-000842-LE; Fri, 14 Jul 2023 22:56:34 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq3-00EQSG-90; Fri, 14 Jul 2023 22:56:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qKPq2-004u3i-Cn; Fri, 14 Jul 2023 22:56:30 +0200
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-pwm@vger.kernel.org,
	kernel@pengutronix.de,
	linux-arm-kernel@lists.infradead.org,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Guenter Roeck <groeck@chromium.org>,
	chrome-platform@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 00/10] pwm: Constistenly name pwm_chip variables "chip"
Date: Fri, 14 Jul 2023 22:56:13 +0200
Message-Id: <20230714205623.2496590-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2799; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=V7W84rybwTdl40fJ1/AnlC1GGwwH+0UF4315YjbNZQU=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBksbZmu/FZ2fPKgYn+/w94O57gxudeeMLxEF38z Ka6/i36EPaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZLG2ZgAKCRCPgPtYfRL+ Tr4aB/4kqY/a6BiMImBSLY61OyPOnkuRIsinCl91rdovh7+kgX2bxm4NOx2HpmLCkpbLgvTTGfe pVoVy7stf8h8nsV1bDVdAvTTRwse8oJGC/KcNH/sHxM3suaq6DIGhGo1Nb32+md2vc1LlWLslH2 mszcZlFV4BmYbl1jQUVOQ8KxfllFgtJPyHa/nvdjgeu2YzuxgkbzF/M2GD5dVEhcFao9uRXgbBy JgeRdj3szzC/ywFnL+GeqYi7Zi0gJ+OPi6SPnmUpUbfh1BKgTJJbF7+vSqoiSXx5vHLr3j7azgv tTi4ObF/obQigO4ODWvuMSwUJ01I3X/+sHgjtV0FaFfolv/W
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_135652_740014_427BBE2A 
X-CRM114-Status: GOOD (  16.75  )
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

d2hpbGUgd29ya2luZyBvbiBhbiBleHRlbnNpb24gZm9yIHRoZSBwd20gZnJhbWV3b3JrLCBJIG5v
dGljZWQgdGhhdCBzb21lCmRyaXZlcnMgYW5kIGV2ZW4gdGhlIGNvcmUgb25seSBuZWFybHkgY29u
c2lzdGVudGx5IG5hbWVkIGFsbCB2YXJpYWJsZXMKYW5kIHN0cnVjdCBtZW1iZXJzIGhvbGRpbmcg
YSBwb2ludGVyIHRvIGEgc3RydWN0IHB3bV9jaGlwICJjaGlwIjoKCiQgZ2l0IGdyZXAgLVBobyAn
c3RydWN0IHB3bV9jaGlwIFwqKlthLXowLTlfXSsoKm5sYTpbXChhLXowLTlfXSknIHY2LjUtcmMx
IHwgc29ydCB8IHVuaXEgLWMgfCBzb3J0IC1uCiAgICAgIDEgc3RydWN0IHB3bV9jaGlwICpwd20K
ICAgICAgMSBzdHJ1Y3QgcHdtX2NoaXAgcHdtCiAgICAgIDEgc3RydWN0IHB3bV9jaGlwIHB3bV9j
aGlwCiAgICAgIDIgc3RydWN0IHB3bV9jaGlwICpfY2hpcAogICAgICA0IHN0cnVjdCBwd21fY2hp
cCAqYwogICAgICA4IHN0cnVjdCBwd21fY2hpcCAqcGMKICAgICA1NyBzdHJ1Y3QgcHdtX2NoaXAg
Y2hpcAogICAgMzU4IHN0cnVjdCBwd21fY2hpcCAqY2hpcAoKV2l0aCB0aGlzIHNlcmllcyBhcHBs
aWVkIHRoZXNlIGFyZSBhbGwgY2FsbGVkICJjaGlwIiB3aXRoIG9uZSBleGNlcHRpb246ClRoZSBs
ZWQgZHJpdmVyIGRyaXZlcnMvbGVkcy9yZ2IvbGVkcy1xY29tLWxwZy5jIHVzZXMgInB3bSIuIE1h
eWJlCiJwd21jaGlwIiB3b3VsZCBiZSBhIGJldHRlciBuYW1lLCBidXQgSSdtIG5vdCBzdXJlIHRo
YXQgdXNpbmcgImNoaXAiIHdhcwphbiBpbXByb3ZlbWVudCB0aGVyZSBhcyB0aGlzIGlzbid0IGEg
cHVyZSBwd20gZHJpdmVyLiBJJ20gbm90IHRvdWNoaW5nCnRoYXQgb25lLgoKVGhlIGZpcnN0IG9m
ZmVuZGVycyBJIGZvdW5kIHdlcmUgdGhlIGNvcmUgYW5kIHRoZSBhdG1lbC1obGNkYyBkcml2ZXIu
CkFmdGVyIEkgZm91bmQgdGhlc2UgSSBvcHRpbWlzdGljYWxseSBhc3N1bWVkIHRoZXNlIHdlcmUg
dGhlIG9ubHkgb25lcwp3aXRoIHRoZSB1bnVzdWFsIG5hbWVzIGFuZCBzZW5kIHBhdGNoZXMgZm9y
IHRoZXNlIG91dCBpbmRpdmlkdWFsbHkKYmVmb3JlIGNoZWNraW5nIHN5c3RlbWF0aWNhbGx5LgoK
VGhlIGF0bWVsLWhsY2RjIHBhdGNoIGlzIGluY2x1ZGVkIGhlcmUgdW5jaGFuZ2VkLCB0aGUgY29y
ZSBwYXRjaCBub3cKYWxzbyBhZGFwdGVkIHRoZSBkZWNsYXJhdGlvbiBvZiB0aGUgY2hhbmdlZCBm
dW5jdGlvbnMgaW4gPGxpbnV4L3B3bS5oPi4KSSBtYXJrZWQgdGhlc2UgdHdvIGFzICJzdXBlcnNl
ZGVkIiBpbiBwYXRjaHdvcmsgYWxyZWFkeS4KCkFsbCBwYXRjaGVzIGluIHRoaXMgc2VyaWVzIGFy
ZSBwYWlyd2lzZSBpbmRlcGVuZGVudCBvZiBlYWNoIG90aGVyLiBJCmRvbid0IGtub3cgaWYgdGhl
IHN0YWdpbmcgcGF0Y2ggc2hvdWxkIGJldHRlciBnbyBpbiB2aWEgdGhlIGdyZXlidXMgdHJlZQpv
ciB2aWEgcHdtLiBCb3RoIGlzIHBvc3NpYmxlIHdpdGhvdXQgbmVlZGluZyBjb29yZGluYXRpb24u
CgpCZXN0IHJlZ2FyZHMKVXdlCgoKVXdlIEtsZWluZS1Lw7ZuaWcgKDEwKToKICBwd206IFVzZSBh
IGNvbnNpc3RlbnQgbmFtZSBmb3IgcHdtX2NoaXAgcG9pbnRlcnMgaW4gdGhlIGNvcmUKICBwd206
IGF0bWVsLWhsY2RjOiBVc2UgY29uc2lzdGVudCB2YXJpYWJsZSBuYW1pbmcKICBwd206IGJjbS1r
b25hOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCIKICBwd206IGNy
YzogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiCiAgcHdtOiBjcm9z
LWVjOiBDb25zaXN0ZW5seSBuYW1lIHB3bV9jaGlwIHZhcmlhYmxlcyAiY2hpcCIKICBwd206IGxw
Mzk0MzogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiCiAgcHdtOiBy
b2NrY2hpcDogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJsZXMgImNoaXAiCiAgcHdt
OiBzaWZpdmU6IENvbnNpc3Rlbmx5IG5hbWUgcHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIgogIHB3
bTogc2wyOGNwbGQ6IENvbnNpc3Rlbmx5IG5hbWUgcHdtX2NoaXAgdmFyaWFibGVzICJjaGlwIgog
IHN0YWdpbmc6IGdyZXlidXM6IHB3bTogQ29uc2lzdGVubHkgbmFtZSBwd21fY2hpcCB2YXJpYWJs
ZXMgImNoaXAiCgogZHJpdmVycy9wd20vY29yZS5jICAgICAgICAgICAgfCAyOCArKysrKysrLS0t
LS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1hdG1lbC1obGNkYy5jIHwgNjQgKysrKysrKysrKysrKysr
KystLS0tLS0tLS0tLS0tLS0tLS0KIGRyaXZlcnMvcHdtL3B3bS1iY20ta29uYS5jICAgIHwgIDQg
Ky0tCiBkcml2ZXJzL3B3bS9wd20tY3JjLmMgICAgICAgICB8ICA0ICstLQogZHJpdmVycy9wd20v
cHdtLWNyb3MtZWMuYyAgICAgfCAxMCArKystLS0KIGRyaXZlcnMvcHdtL3B3bS1scDM5NDMuYyAg
ICAgIHwgIDQgKy0tCiBkcml2ZXJzL3B3bS9wd20tcm9ja2NoaXAuYyAgICB8ICA0ICstLQogZHJp
dmVycy9wd20vcHdtLXNpZml2ZS5jICAgICAgfCAgNCArLS0KIGRyaXZlcnMvcHdtL3B3bS1zbDI4
Y3BsZC5jICAgIHwgMTAgKysrLS0tCiBkcml2ZXJzL3N0YWdpbmcvZ3JleWJ1cy9wd20uYyB8IDEy
ICsrKy0tLS0KIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgIHwgIDYgKystLQogMTEgZmls
ZXMgY2hhbmdlZCwgNzUgaW5zZXJ0aW9ucygrKSwgNzUgZGVsZXRpb25zKC0pCgpiYXNlLWNvbW1p
dDogMDZjMmFmYjg2MmY5ZGE4ZGM1ZWZhNGI2MDc2YTBlNDhjM2ZiYWFhNQotLSAKMi4zOS4yCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
