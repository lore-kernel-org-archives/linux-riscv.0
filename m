Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7A68C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=quoPwBldRaKfC9e9vzo1Og3F9fWf4LVLKYCE6Xfl0Dc=; b=IveF7HbjtwIIfI
	Szcz+RDV3Qt19siKzvul09OdDIK/RKuXb+wbuUYMOdI09JyhfDTR1jgYITj7fXFmm2fWwl2fMxBHe
	HfGFjuBpTkZ0oC49DYaULuW7Z9Nw8F+cT3w4KLTtMtQffFVO3+sZH0Zuw07rHOufXjx6tqjaPEkXG
	spp3PxsS554woUYG6SpEV2FgJWvjdVxRU7nAklwpviTsM9gQU5nznwiUAL8OtOgSNeOWTu0fKL7xp
	TM6OgIV9MtYSHCECgAABbx+bx7dnxLDZMVjTHCchU+JAfI+2hHt7xm/RnGHycxfzs7LRlXJP1LZ8B
	pSB0IjxsIIPtN/H2ctqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OxS-00HOTX-O2; Wed, 30 Nov 2022 15:25:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0OvO-00HNH3-3t
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 15:23:04 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0OuS-00009r-WF; Wed, 30 Nov 2022 16:22:05 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0OuI-001LdM-Fl; Wed, 30 Nov 2022 16:21:55 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1p0OuI-001VqY-Bk; Wed, 30 Nov 2022 16:21:54 +0100
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Douglas Anderson <dianders@chromium.org>,
	Pavel Machek <pavel@ucw.cz>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Michael Walle <michael@walle.cc>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Hammer Hsieh <hammerh0314@gmail.com>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	Sean Anderson <sean.anderson@seco.com>,
	Michal Simek <michal.simek@xilinx.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Stephen Boyd <swboyd@chromium.org>,
	Matthias Kaehlcke <mka@chromium.org>,
	Satya Priya <quic_c_skakit@quicinc.com>,
	linux-pwm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/11] pwm: Allow .get_state to fail
Date: Wed, 30 Nov 2022 16:21:37 +0100
Message-Id: <20221130152148.2769768-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4201; i=u.kleine-koenig@pengutronix.de; h=from:subject; bh=OJndCEVt3aO3P0WDGIcSb4svVqFYr4L7BRkc05e7KK8=; b=owEBbQGS/pANAwAKAcH8FHityuwJAcsmYgBjh3TeeKE42zO/dADA8GIRueUo9ayiBLrzlu5BRvEE w4nESiyJATMEAAEKAB0WIQR+cioWkBis/z50pAvB/BR4rcrsCQUCY4d03gAKCRDB/BR4rcrsCSMiB/ 9P92eEh5i/ykm3IhBfm7shzbMkb/wG7nDkc+vvv70Z73UbyxFvKLzsJ+xK5VXqTCLlo8DUkfo9BJPh gr8T1RvP6HUtOELqCuQE6ruqv9wlN28AYIytMCoO+QvOqLdbM84LW89W1fK1B6ImECmggYrGw60CXE f7Rv+b9z4cETy+dLsOSVyQ0zsix7/7HyoqlinRbwr3R1SJewjSjU++PJ6H8LCe6DcYMwdJkpBaC2Ol hVLwWlo1eF82Cow8M5bd0+XSEZXpG5oFaf6CebgL+JYlfUHRWLzOpJpq6RAXCmfilUqisk0cROhhop q2OYuXh1amqkiMJYz8hRni9/YulIOt
X-Developer-Key: i=u.kleine-koenig@pengutronix.de; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_072302_354140_677559EF 
X-CRM114-Status: GOOD (  19.01  )
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

SGVsbG8sCgpJIGZvcmdvdCBhYm91dCB0aGlzIHNlcmllcyBhbmQgd2FzIHJlbWVtYmVyZWQgd2hl
biBJIHRhbGtlZCB0byBDb25vcgpEb29sZXkgYWJvdXQgaG93IC5nZXRfc3RhdGUoKSBzaG91bGQg
YmVoYXZlIGluIGFuIGVycm9yIGNhc2UuCgpDb21wYXJlZCB0byAoaW1wbGljaXQpIHYxLCBzZW50
IHdpdGggTWVzc2FnZS1JZDogMjAyMjA5MTYxNTE1MDYuMjk4NDg4LTEtdS5rbGVpbmUta29lbmln
QHBlbmd1dHJvbml4LmRlCkkgY2hhbmdlZDoKCiAtIFBhdGNoICMxIHdoaWNoIGRvZXMgdGhlIHBy
b3RvdHlwZSBjaGFuZ2Ugbm93IGp1c3QgYWRkcyAicmV0dXJuIDAiIHRvCiAgIGFsbCBpbXBsZW1l
bnRhdGlvbnMgYW5kIHNvIGdldHMgc2ltcGxlciBhbmQgZG9lc24ndCBjaGFuZ2UgYmVoYXZpb3Vy
LgogICBUaGUgYWRhcHRpb25zIHRvIHRoZSBkaWZmZXJlbnQgLmdldF9zdGF0ZSgpIGltcGxlbWVu
dGF0aW9ucyBhcmUgc3BsaXQKICAgb3V0IGludG8gaW5kaXZpZHVhbCBwYXRjaGVzIHRvIGVhc2Ug
cmV2aWV3LgogLSBPbmUgbWlub3IgaW5jb25zaXN0ZW5jeSBmaXhlZCBpbiAicHdtOiBIYW5kbGUg
LmdldF9zdGF0ZSgpIGZhaWx1cmVzIgogICB0aGF0IEkgbm90aWNlZCB3aGlsZSBsb29raW5nIGlu
dG8gdGhpcyBwYXRjaC4KIC0gSSBza2lwcGVkIGNoYW5naW5nIHN1bjRpLmMgYXMgSSBkb24ndCBr
bm93IGhvdyB0byBoYW5kbGUgdGhlIGVycm9yCiAgIHRoZXJlLiBTb21lb25lIG1pZ2h0IHdhbnQg
dG8gaGF2ZSBhIGxvb2suIChUaGF0J3Mgbm90IGlkZWFsLCBidXQgaXQncwogICBub3Qgd29yc2Ug
dGhhbiB0aGUgc2FtZSBpc3N1ZSBiZWZvcmUgdGhpcyBzZXJpZXMuKQoKSW4gdjEgVGhpZXJyeSBo
YWQgdGhlIGNvbmNlcm46Cgp8IFRoYXQgcmFpc2VzIHRoZSBxdWVzdGlvbiBhYm91dCB3aGF0IHRv
IGRvIGluIHRoZXNlIGNhc2VzLiBJZiB3ZSByZXR1cm4KfCBhbiBlcnJvciwgdGhhdCBjb3VsZCBw
b3RlbnRpYWxseSB0aHJvdyBvZmYgY29uc3VtZXJzLiBTbyBwZXJoYXBzIHRoZQp8IGNsb3Nlc3Qg
d291bGQgYmUgdG8gcmV0dXJuIGEgZGlzYWJsZWQgUFdNPyBPciBwZXJoYXBzIGl0J2QgYmUgdXAg
dG8gdGhlCnwgY29uc3VtZXIgdG8gcHJvdmlkZSBzb21lIGZhbGxiYWNrIGNvbmZpZ3VyYXRpb24g
Zm9yIGludmFsaWRseSBjb25maWd1cmVkCnwgb3IgdW5jb25maWd1cmVkIFBXTXMuCgouZ2V0X3N0
YXRlKCkgaXMgb25seSBjYWxsZWQgaW4gcHdtX2RldmljZV9yZXF1ZXN0IG9uIGEgcHdtX3N0YXRl
IHRoYXQgYQpjb25zdW1lciBtaWdodCBzZWUuIEJlZm9yZSBteSBzZXJpZXMgYSBjb25zdW1lciBt
aWdodCBoYXZlIHNlZW4gYQpwYXJ0aWFsIG1vZGlmaWVkIHB3bV9zdGF0ZSAoYmVjYXVzZSAuZ2V0
X3N0YXRlKCkgbWlnaHQgaGF2ZSBtb2RpZmllZAoucGVyaW9kLCB0aGVuIHN0dW1ibGVkIGFuZCBy
ZXR1cm5lZCBzaWxlbnRseSkuIFRoZSBsYXN0IHBhdGNoIGVuc3VyZXMKdGhhdCB0aGlzIHBhcnRp
YWwgbW9kaWZpY2F0aW9uIGlzbid0IGdpdmVuIG91dCB0byB0aGUgY29uc3VtZXIuIEluc3RlYWQK
dGhleSBub3cgc2VlIHRoZSBzYW1lIGFzIGlmIC5nZXRfc3RhdGUgd2Fzbid0IGltcGxlbWVudGVk
IGF0IGFsbC4KCkJlc3QgcmVnYXJkcwpVd2UKClV3ZSBLbGVpbmUtS8O2bmlnICgxMSk6CiAgcHdt
OiBNYWtlIC5nZXRfc3RhdGUoKSBjYWxsYmFjayByZXR1cm4gYW4gZXJyb3IgY29kZQogIHB3bS90
cmFjaW5nOiBBbHNvIHJlY29yZCB0cmFjZSBldmVudHMgZm9yIGZhaWxlZCBBUEkgY2FsbHMKICBk
cm0vYnJpZGdlOiB0aS1zbjY1ZHNpODY6IFByb3BhZ2F0ZSBlcnJvcnMgaW4gLmdldF9zdGF0ZSgp
IHRvIHRoZQogICAgY2FsbGVyCiAgbGVkczogcWNvbS1scGc6IFByb3BhZ2F0ZSBlcnJvcnMgaW4g
LmdldF9zdGF0ZSgpIHRvIHRoZSBjYWxsZXIKICBwd206IGNyYzogUHJvcGFnYXRlIGVycm9ycyBp
biAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgogIHB3bTogY3Jvcy1lYzogUHJvcGFnYXRlIGVy
cm9ycyBpbiAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgogIHB3bTogaW14Mjc6IFByb3BhZ2F0
ZSBlcnJvcnMgaW4gLmdldF9zdGF0ZSgpIHRvIHRoZSBjYWxsZXIKICBwd206IG10ay1kaXNwOiBQ
cm9wYWdhdGUgZXJyb3JzIGluIC5nZXRfc3RhdGUoKSB0byB0aGUgY2FsbGVyCiAgcHdtOiByb2Nr
Y2hpcDogUHJvcGFnYXRlIGVycm9ycyBpbiAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgogIHB3
bTogc3ByZDogUHJvcGFnYXRlIGVycm9ycyBpbiAuZ2V0X3N0YXRlKCkgdG8gdGhlIGNhbGxlcgog
IHB3bTogSGFuZGxlIC5nZXRfc3RhdGUoKSBmYWlsdXJlcwoKIGRyaXZlcnMvZ3Bpby9ncGlvLW12
ZWJ1LmMgICAgICAgICAgICAgfCAgOSArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
dGktc242NWRzaTg2LmMgfCAxNCArKysrKysrKy0tLS0tLQogZHJpdmVycy9sZWRzL3JnYi9sZWRz
LXFjb20tbHBnLmMgICAgICB8IDE0ICsrKysrKysrLS0tLS0tCiBkcml2ZXJzL3B3bS9jb3JlLmMg
ICAgICAgICAgICAgICAgICAgIHwgMjggKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCiBkcml2
ZXJzL3B3bS9wd20tYXRtZWwuYyAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL3B3
bS9wd20tYmNtLWlwcm9jLmMgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdtL3B3
bS1jcmMuYyAgICAgICAgICAgICAgICAgfCAxMCArKysrKystLS0tCiBkcml2ZXJzL3B3bS9wd20t
Y3Jvcy1lYy5jICAgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdtL3B3bS1kd2Mu
YyAgICAgICAgICAgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvcHdtL3B3bS1oaWJ2dC5jICAg
ICAgICAgICAgICAgfCAgNiArKysrLS0KIGRyaXZlcnMvcHdtL3B3bS1pbXgtdHBtLmMgICAgICAg
ICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9wd20vcHdtLWlteDI3LmMgICAgICAgICAgICAg
ICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL3B3bS9wd20taW50ZWwtbGdtLmMgICAgICAgICAgIHwg
IDYgKysrKy0tCiBkcml2ZXJzL3B3bS9wd20taXFzNjIwYS5jICAgICAgICAgICAgIHwgIDYgKysr
Ky0tCiBkcml2ZXJzL3B3bS9wd20ta2VlbWJheS5jICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBk
cml2ZXJzL3B3bS9wd20tbHBzcy5jICAgICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJz
L3B3bS9wd20tbWVzb24uYyAgICAgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdt
L3B3bS1tdGstZGlzcC5jICAgICAgICAgICAgfCAxMiArKysrKysrLS0tLS0KIGRyaXZlcnMvcHdt
L3B3bS1wY2E5Njg1LmMgICAgICAgICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9wd20vcHdt
LXJhc3BiZXJyeXBpLXBvZS5jICAgICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL3B3bS9wd20tcm9j
a2NoaXAuYyAgICAgICAgICAgIHwgMTIgKysrKysrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tc2lm
aXZlLmMgICAgICAgICAgICAgIHwgIDYgKysrKy0tCiBkcml2ZXJzL3B3bS9wd20tc2wyOGNwbGQu
YyAgICAgICAgICAgIHwgIDggKysrKystLS0KIGRyaXZlcnMvcHdtL3B3bS1zcHJkLmMgICAgICAg
ICAgICAgICAgfCAgOCArKysrKy0tLQogZHJpdmVycy9wd20vcHdtLXN0bTMyLWxwLmMgICAgICAg
ICAgICB8ICA4ICsrKysrLS0tCiBkcml2ZXJzL3B3bS9wd20tc3VuNGkuYyAgICAgICAgICAgICAg
IHwgMTIgKysrKysrKy0tLS0tCiBkcml2ZXJzL3B3bS9wd20tc3VucGx1cy5jICAgICAgICAgICAg
IHwgIDYgKysrKy0tCiBkcml2ZXJzL3B3bS9wd20tdmlzY29udGkuYyAgICAgICAgICAgIHwgIDYg
KysrKy0tCiBkcml2ZXJzL3B3bS9wd20teGlsaW54LmMgICAgICAgICAgICAgIHwgIDggKysrKyst
LS0KIGluY2x1ZGUvbGludXgvcHdtLmggICAgICAgICAgICAgICAgICAgfCAgNCArKy0tCiBpbmNs
dWRlL3RyYWNlL2V2ZW50cy9wd20uaCAgICAgICAgICAgIHwgMjAgKysrKysrKysrLS0tLS0tLS0t
LQogMzEgZmlsZXMgY2hhbmdlZCwgMTc0IGluc2VydGlvbnMoKyksIDEwOSBkZWxldGlvbnMoLSkK
CgpiYXNlLWNvbW1pdDogNTAzMTU5NDVkMTc4ZWViZWM0ZThlMmM1MGMyNjU3NjdkZGI5MjZlYgot
LSAKMi4zOC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
