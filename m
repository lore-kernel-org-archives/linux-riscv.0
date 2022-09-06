Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9ADEECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 10:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oF7IQ1eYIMO7uJeYhPlJ+KoAgNzPVzxBgG4IVPID88w=; b=hhwIzrL9r4d9JW
	3lSA/Ymxa6pc4YVfF9lSrOC2RaNG/oGZdd2ZcgbivqTKfkylbbBuhP7Oy9N4VZrQtfeOIRH38N/GY
	7EBh/6YpiOm+TnvXISPBLXXF1iyiIz0pBxyPcUQbjqx2VaVzXnBOOkh5EOfI/QC/GsyKB8zy9n0Ei
	h9wcncyqQNxRe5ef9rj6+AV/4w1CkU2i82RhYnW37Q4fElKoNQxo4L1KK5xXRHFIXhPe/WVZ4IQXM
	CL/fk1e9+01Kqn5qNmW0EVg+Nn6GOZdKf+uEfIvtAMoEQoEprywCuXukfxOe86L6y4eLZPsUWpSKN
	slG7v/gIPFHaEx0wE1gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVW8P-00CaZB-CR; Tue, 06 Sep 2022 10:48:49 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVW7w-00CaH0-N0
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 10:48:24 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 8E7951F9BC;
	Tue,  6 Sep 2022 10:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1662461291; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q3rkXIagMmmA69aWcds1BM5RGdYgpYHt9G+1K9Bag0Y=;
	b=z2hW9YJjVsEZuFUGGaJpT6YCB5+9ddQ0vw9X3t7zqXq92Nz3wVEjvckg9K/zDvcqw+EC9w
	8jLSx9ftLtXvz0U3vuKs9bkTfI6pslJ5y+bcD8Gvu3QTuL10L73IG2RXe290hWnVo/J4yg
	F7aYT6ljOK3YunyYmsrtT+VO0dqMAzc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1662461291;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=q3rkXIagMmmA69aWcds1BM5RGdYgpYHt9G+1K9Bag0Y=;
	b=alY8JjNRmhYSNjggnEtvcyU219S6dGl4LGO4N6cOKf3MQ1eUOaNJdYtHQ5JeceWWkeURId
	6dH6wqNnTzozJTAw==
Received: from localhost.localdomain (unknown [10.100.208.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id DF9E12C141;
	Tue,  6 Sep 2022 10:48:08 +0000 (UTC)
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
Subject: [PATCH v3 0/4] tty: TX helpers
Date: Tue,  6 Sep 2022 12:48:01 +0200
Message-Id: <20220906104805.23211-1-jslaby@suse.cz>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_034821_725504_A10766E0 
X-CRM114-Status: GOOD (  11.06  )
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
RV9VQVJUX1BPUlRfVFhfSEVMUEVSX0xJTUlURUQgVFggaGVscGVycy4gU2VlIFBBVENIIDIvNCBm
b3IgdGhlCmRldGFpbHMuIENvbW1lbnRzIHdlbGNvbWUuCgpUaGVuIGl0IHN3aXRjaGVzIGRyaXZl
cnMgdG8gdXNlIHRoZW0uIEZpcnN0LCB0bwpERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUigpIGlu
IDMvNCBhbmQgdGhlbgpERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUl9MSU1JVEVEKCkgaW4gNC80
LgoKVGhlIGRpZmZzdGF0IG9mIHBhdGNoZXMgMys0IGlzIGFzIGZvbGxvd3M6CiAyNiBmaWxlcyBj
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
ZWFkLm9yZwoKSmlyaSBTbGFieSAoNCk6CiAgdHR5OiBzZXJpYWw6IG1vdmUgYW5kIGNsZWFudXAg
dnQ4NTAwX3R4X2VtcHR5KCkKICB0dHk6IHNlcmlhbDogaW50cm9kdWNlIHRyYW5zbWl0IGhlbHBl
ciBnZW5lcmF0b3JzCiAgdHR5OiBzZXJpYWw6IHVzZSBERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBF
UigpCiAgdHR5OiBzZXJpYWw6IHVzZSBERUZJTkVfVUFSVF9QT1JUX1RYX0hFTFBFUl9MSU1JVEVE
KCkKCiBEb2N1bWVudGF0aW9uL2RyaXZlci1hcGkvc2VyaWFsL2RyaXZlci5yc3QgfCAgMyArCiBk
cml2ZXJzL3R0eS9zZXJpYWwvMjEyODUuYyAgICAgICAgICAgICAgICAgfCAzMyArKy0tLS0tLS0K
IGRyaXZlcnMvdHR5L3NlcmlhbC9hbHRlcmFfanRhZ3VhcnQuYyAgICAgICB8IDQyICsrKy0tLS0t
LS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYWx0ZXJhX3VhcnQuYyAgICAgICAgICAgfCAzNyArKy0t
LS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYW1iYS1wbDAxMC5jICAgICAgICAgICAgfCAzNyAr
Ky0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYXBidWFydC5jICAgICAgICAgICAgICAgfCAz
NiArKy0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvYXRtZWxfc2VyaWFsLmMgICAgICAgICAg
fCAyOSArKy0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2JjbTYzeHhfdWFydC5jICAgICAgICAg
IHwgNDcgKysrLS0tLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2ZzbF9scHVhcnQuYyAgICAg
ICAgICAgIHwgMzggKysrLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL2xhbnRpcS5jICAgICAg
ICAgICAgICAgIHwgNDQgKysrKy0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbHBjMzJ4eF9o
cy5jICAgICAgICAgICAgfCAzOCArKy0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvbWNmLmMg
ICAgICAgICAgICAgICAgICAgfCAyNyArKy0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL21wYzUy
eHhfdWFydC5jICAgICAgICAgIHwgNDMgKy0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwv
bXBzMi11YXJ0LmMgICAgICAgICAgICAgfCAyOSArLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFs
L211eC5jICAgICAgICAgICAgICAgICAgIHwgNDYgKysrKy0tLS0tLS0tCiBkcml2ZXJzL3R0eS9z
ZXJpYWwvbXZlYnUtdWFydC5jICAgICAgICAgICAgfCA0MCArKy0tLS0tLS0tLQogZHJpdmVycy90
dHkvc2VyaWFsL214cy1hdWFydC5jICAgICAgICAgICAgIHwgMzEgKystLS0tLS0tCiBkcml2ZXJz
L3R0eS9zZXJpYWwvb21hcC1zZXJpYWwuYyAgICAgICAgICAgfCA0NyArKysrLS0tLS0tLS0tCiBk
cml2ZXJzL3R0eS9zZXJpYWwvb3dsLXVhcnQuYyAgICAgICAgICAgICAgfCAzNSArLS0tLS0tLS0t
CiBkcml2ZXJzL3R0eS9zZXJpYWwvcHhhLmMgICAgICAgICAgICAgICAgICAgfCAzOSArKystLS0t
LS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3JwMi5jICAgICAgICAgICAgICAgICAgIHwgMzYgKyst
LS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NhMTEwMC5jICAgICAgICAgICAgICAgIHwgNDkg
KysrKystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NlcmlhbF90eHg5LmMgICAgICAgICAg
IHwgMzcgKystLS0tLS0tLQogZHJpdmVycy90dHkvc2VyaWFsL3NpZml2ZS5jICAgICAgICAgICAg
ICAgIHwgNDUgKystLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3ByZF9zZXJpYWwuYyAg
ICAgICAgICAgfCAzOCArKy0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvc3QtYXNjLmMgICAg
ICAgICAgICAgICAgfCA1MCArKy0tLS0tLS0tLS0tCiBkcml2ZXJzL3R0eS9zZXJpYWwvdnQ4NTAw
X3NlcmlhbC5jICAgICAgICAgfCA0MCArKy0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9zZXJpYWxf
Y29yZS5oICAgICAgICAgICAgICAgIHwgODEgKysrKysrKysrKysrKysrKysrKysrKwogMjggZmls
ZXMgY2hhbmdlZCwgMjc1IGluc2VydGlvbnMoKyksIDgyMiBkZWxldGlvbnMoLSkKCi0tIAoyLjM3
LjMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
