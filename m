Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FBEC0502C
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 11:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zjg8IEJd5fJXjT8bpV7lTyvF73AtXGeJp5MaY4w5eXk=; b=nr5G8iFrpdpj0p
	f96rFtoyk8SddS9OEEnB68CxtJV2F4HFB0mQ6jNjbK+WJQy6Q+JFhgr4OHU0kPOqw+RuQdCwJQxVF
	CmFRnRQ34YJY80bJQ5I+3wWnuY7nIIi+8FKuLvVe8CLZpiyXTgChG9nQoLbVQxC6n5+VSTkTaQg+z
	QXPu6fnHw+TlKpv3IYALMUI/IzKP4exAmFrR/qYXyA3aEqgTTcGZ9SQNG9uec3LmdjaycU5xaeJ3t
	K+9WpthessHBkVNbM2daekDQ84fXPq7xqFafmc2mwhqLQgpqyBRhyhZWFlepSijmtXXTFM56s9uJV
	NjqYtjhkSJkgqdhL2xHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTi2R-00BFnn-7A; Thu, 01 Sep 2022 11:07:11 +0000
Received: from smtp-out1.suse.de ([2001:67c:2178:6::1c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTi2O-00BFmW-JP
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 11:07:10 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7DBAA22683;
	Thu,  1 Sep 2022 11:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1662030425; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6vjzxB4Ibfz0o69w/iYdHIKC07ztQav3fh9etcwaWjY=;
	b=ze76PvxNMXHs0p67rsZvuOtSORxr4tU2rpdVRqGyuAP81aKL8DmS/kGvKNsY6RY8uvnWMu
	YJoPGfnBY2vHOHtd+vLrjKQkqDKBQ6s6c3MM168LF39SqI1XTRvp1ujJuvNSOVrhO+kDLE
	XPXm6VJpwBx7mO6z7PLD50m3bzTrQ7c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1662030425;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6vjzxB4Ibfz0o69w/iYdHIKC07ztQav3fh9etcwaWjY=;
	b=HPG/QyiFf7fFFkcSakpYQGSHOUTV37lDISPLRMSlqVOde56PoUsDZ2lbHs8eXNjQts9vNy
	pkNd+ZRY+++hXaDQ==
Received: from localhost.localdomain (unknown [10.100.208.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A6C3B2C145;
	Thu,  1 Sep 2022 11:07:01 +0000 (UTC)
From: Jiri Slaby <jslaby@suse.cz>
To: gregkh@linuxfoundation.org
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-serial@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jiri Slaby <jslaby@suse.cz>,
	Tobias Klauser <tklauser@distanz.ch>,
	Richard Genoud <richard.genoud@gmail.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <f.fainelli@gmail.com>,
	bcm-kernel-feedback-list@broadcom.com,
	=?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	Kevin Cernekee <cernekee@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang7@gmail.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Patrice Chotard <patrice.chotard@foss.st.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] tty: TX helpers
Date: Thu,  1 Sep 2022 13:06:54 +0200
Message-Id: <20220901110657.3305-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_040708_823699_72EED740 
X-CRM114-Status: GOOD (  11.61  )
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

VGhpcyBzZXJpZXMgaW50cm9kdWNlcyBERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUiArCkRFRklO
RV9VQVJUX1BPUlRfVFhfSEVMUEVSX0xJTUlURUQgVFggaGVscGVycy4gU2VlIFBBVENIIDEvMyBm
b3IgdGhlCmRldGFpbHMuIENvbW1lbnRzIHdlbGNvbWUuCgpUaGVuIGl0IHN3aXRjaGVzIGRyaXZl
cnMgdG8gdXNlIHRoZW0uIEZpcnN0LCB0bwpERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUigpIGlu
IDIvMyBhbmQgdGhlbgpERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUl9MSU1JVEVEKCkgaW4gMy8z
LgoKVGhlIGRpZmZzdGF0IG9mIHBhdGNoZXMgMiszIGlzIGFzIGZvbGxvd3M6CiAyNiBmaWxlcyBj
aGFuZ2VkLCAxOTEgaW5zZXJ0aW9ucygrKSwgODIzIGRlbGV0aW9ucygtKQp3aGljaCBhcHBlYXJz
IHRvIGJlIG5pY2UuCgpDYzogVG9iaWFzIEtsYXVzZXIgPHRrbGF1c2VyQGRpc3RhbnouY2g+CkNj
OiBSaWNoYXJkIEdlbm91ZCA8cmljaGFyZC5nZW5vdWRAZ21haWwuY29tPgpDYzogTmljb2xhcyBG
ZXJyZSA8bmljb2xhcy5mZXJyZUBtaWNyb2NoaXAuY29tPgpDYzogQWxleGFuZHJlIEJlbGxvbmkg
PGFsZXhhbmRyZS5iZWxsb25pQGJvb3RsaW4uY29tPgpDYzogQ2xhdWRpdSBCZXpuZWEgPGNsYXVk
aXUuYmV6bmVhQG1pY3JvY2hpcC5jb20+CkNjOiBWbGFkaW1pciBaYXBvbHNraXkgPHZ6QG1sZWlh
LmNvbT4KQ2M6IExpdml1IER1ZGF1IDxsaXZpdS5kdWRhdUBhcm0uY29tPgpDYzogU3VkZWVwIEhv
bGxhIDxzdWRlZXAuaG9sbGFAYXJtLmNvbT4KQ2M6IExvcmVuem8gUGllcmFsaXNpIDxsb3Jlbnpv
LnBpZXJhbGlzaUBhcm0uY29tPgpDYzogU2hhd24gR3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPgpD
YzogU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4LmRlPgpDYzogUGVuZ3V0cm9uaXgg
S2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT4KQ2M6IEZhYmlvIEVzdGV2YW0gPGZl
c3RldmFtQGdtYWlsLmNvbT4KQ2M6IE5YUCBMaW51eCBUZWFtIDxsaW51eC1pbXhAbnhwLmNvbT4K
Q2M6ICJBbmRyZWFzIEbDpHJiZXIiIDxhZmFlcmJlckBzdXNlLmRlPgpDYzogTWFuaXZhbm5hbiBT
YWRoYXNpdmFtIDxtYW5pQGtlcm5lbC5vcmc+CkNjOiBSdXNzZWxsIEtpbmcgPGxpbnV4QGFybWxp
bnV4Lm9yZy51az4KQ2M6IEZsb3JpYW4gRmFpbmVsbGkgPGYuZmFpbmVsbGlAZ21haWwuY29tPgpD
YzogYmNtLWtlcm5lbC1mZWVkYmFjay1saXN0QGJyb2FkY29tLmNvbQpDYzogIlBhbGkgUm9ow6Fy
IiA8cGFsaUBrZXJuZWwub3JnPgpDYzogS2V2aW4gQ2VybmVrZWUgPGNlcm5la2VlQGdtYWlsLmNv
bT4KQ2M6IFBhbG1lciBEYWJiZWx0IDxwYWxtZXJAZGFiYmVsdC5jb20+CkNjOiBQYXVsIFdhbG1z
bGV5IDxwYXVsLndhbG1zbGV5QHNpZml2ZS5jb20+CkNjOiBPcnNvbiBaaGFpIDxvcnNvbnpoYWlA
Z21haWwuY29tPgpDYzogQmFvbGluIFdhbmcgPGJhb2xpbi53YW5nN0BnbWFpbC5jb20+CkNjOiBD
aHVueWFuIFpoYW5nIDx6aGFuZy5seXJhQGdtYWlsLmNvbT4KQ2M6IFBhdHJpY2UgQ2hvdGFyZCA8
cGF0cmljZS5jaG90YXJkQGZvc3Muc3QuY29tPgpDYzogbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwoKSmlyaSBTbGFieSAoMyk6CiAgdHR5OiBzZXJpYWw6IGludHJvZHVjZSB0cmFuc21p
dCBoZWxwZXIgZ2VuZXJhdG9ycwogIHR0eTogc2VyaWFsOiB1c2UgREVGSU5FX1VBUlRfUE9SVF9U
WF9IRUxQRVIoKQogIHR0eTogc2VyaWFsOiB1c2UgREVGSU5FX1VBUlRfUE9SVF9UWF9IRUxQRVJf
TElNSVRFRCgpCgogRG9jdW1lbnRhdGlvbi9kcml2ZXItYXBpL3NlcmlhbC9kcml2ZXIucnN0IHwg
IDMgKwogZHJpdmVycy90dHkvc2VyaWFsLzIxMjg1LmMgICAgICAgICAgICAgICAgIHwgMzMgKyst
LS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYWx0ZXJhX2p0YWd1YXJ0LmMgICAgICAgfCA0MiAr
KystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2FsdGVyYV91YXJ0LmMgICAgICAgICAgIHwg
MzcgKystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2FtYmEtcGwwMTAuYyAgICAgICAgICAg
IHwgMzcgKystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2FwYnVhcnQuYyAgICAgICAgICAg
ICAgIHwgMzYgKystLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYXRtZWxfc2VyaWFsLmMgICAg
ICAgICAgfCAyOSArKy0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2JjbTYzeHhfdWFydC5jICAg
ICAgICAgIHwgNDcgKysrLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvZnNsX2xwdWFydC5j
ICAgICAgICAgICAgfCAzOCArKystLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbGFudGlxLmMg
ICAgICAgICAgICAgICAgfCA0NCArKystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2xwYzMy
eHhfaHMuYyAgICAgICAgICAgIHwgMzggKystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL21j
Zi5jICAgICAgICAgICAgICAgICAgIHwgMjcgKystLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL21w
YzUyeHhfdWFydC5jICAgICAgICAgIHwgNDQgKy0tLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3Nlcmlh
bC9tcHMyLXVhcnQuYyAgICAgICAgICAgICB8IDI5ICstLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJp
YWwvbXV4LmMgICAgICAgICAgICAgICAgICAgfCA0NiArKysrLS0tLS0tLS0KIGRyaXZlcnMvdHR5
L3NlcmlhbC9tdmVidS11YXJ0LmMgICAgICAgICAgICB8IDQwICsrLS0tLS0tLS0KIGRyaXZlcnMv
dHR5L3NlcmlhbC9teHMtYXVhcnQuYyAgICAgICAgICAgICB8IDMxICsrLS0tLS0tCiBkcml2ZXJz
L3R0eS9zZXJpYWwvb21hcC1zZXJpYWwuYyAgICAgICAgICAgfCA0NyArKystLS0tLS0tLS0KIGRy
aXZlcnMvdHR5L3NlcmlhbC9vd2wtdWFydC5jICAgICAgICAgICAgICB8IDM1ICstLS0tLS0tLQog
ZHJpdmVycy90dHkvc2VyaWFsL3B4YS5jICAgICAgICAgICAgICAgICAgIHwgMzkgKysrLS0tLS0t
LQogZHJpdmVycy90dHkvc2VyaWFsL3JwMi5jICAgICAgICAgICAgICAgICAgIHwgMzYgKystLS0t
LS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc2ExMTAwLmMgICAgICAgICAgICAgICAgfCA0OSArKysr
Ky0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfdHh4OS5jICAgICAgICAgICB8IDM3
ICsrLS0tLS0tLS0KIGRyaXZlcnMvdHR5L3NlcmlhbC9zaWZpdmUuYyAgICAgICAgICAgICAgICB8
IDQ1ICsrLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3ByZF9zZXJpYWwuYyAgICAgICAg
ICAgfCAzOCArKy0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3QtYXNjLmMgICAgICAgICAg
ICAgICAgfCA1MCArKy0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvdnQ4NTAwX3Nlcmlh
bC5jICAgICAgICAgfCA0MCArKy0tLS0tLS0tCiBpbmNsdWRlL2xpbnV4L3NlcmlhbF9jb3JlLmgg
ICAgICAgICAgICAgICAgfCA4NiArKysrKysrKysrKysrKysrKysrKysrCiAyOCBmaWxlcyBjaGFu
Z2VkLCAyODAgaW5zZXJ0aW9ucygrKSwgODIzIGRlbGV0aW9ucygtKQoKLS0gCjIuMzcuMgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
