Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73ACC00140
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Aug 2022 13:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GmedoPXgB9HjSCyhG6YsF3GWruwiGUrX0tTRwFaHZIM=; b=sMxdYf1nqdLY/h
	nvULAg9vQ/ZYtZ3dwOZWRDrq36yRMmZRBSfXmgYRa7z31novPYGnuzR8fjsFCjCyFZGErx061pFxK
	tKZy+KWLYCXQ+O0EuPxWYLZ8LD89VfyNSSmP66TnIy6ghAQZAclun49mqVm/GyHnXolmhfWnl51D5
	IuPgeq3eQp7Xx5oJp4ukm4HU+cMOVnZbiHdtETjnolNFWnscDng6K9J7UhDTL6jHY8hMsW3q6H54U
	jKqmjZqsVlVIV4e1omAz3iKO5cr7vIiaTY2VL0Zrue4mCVmhfOGKNb4GPSgQVZ4zhht6qSrwWtROe
	v4C0wgkELJlZ11xmp76g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJxht-00FZ7A-CE; Fri, 05 Aug 2022 13:49:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJxhr-00FZ6I-3h
	for linux-riscv@lists.infradead.org; Fri, 05 Aug 2022 13:49:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1659707379; x=1691243379;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t5KjsovnLft0eC6PhANCf5G4JupnQ193gjR6obVUIxY=;
  b=FeTkDDj0tyc8auFPSnG60VEepy0xDffV/LQXZQZfHKIFSlAyeXaDXZ5n
   qlbhQd36LlXuYYJINxxZGilqM1c3U4rsTAVgU3mFfocYDuiRG7aF+zkf+
   xuXlymebodePkrTau2i/BcrbUvOON5x8u8zh2foN8e30c3z2N6MZ78RxM
   oVoGDkoM1HZHF+Wi6qMFMAjorqLpHi4UTtFhRke44IUEhI/6oXUkNiuxg
   v1HXHsDAUB1cscXzDutM8JHPUqP0rMJvz9WStwKgYVWLlEE95cFl1Hsr7
   srbKCHeMgxlFK3dJgTkbHuH55gLeU8Ri5uoyH0dbulYz3jh3pr29NSc2j
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,216,1654585200"; 
   d="scan'208";a="107754683"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Aug 2022 06:49:32 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 5 Aug 2022 06:49:25 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Fri, 5 Aug 2022 06:49:22 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mark Brown <broonie@kernel.org>, "Wolfram
 Sang" <wsa@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Jassi
 Brar" <jassisinghbrar@gmail.com>, Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson
	<olof@lixom.net>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>
Subject: [PATCH] MAINTAINERS: add PolarFire SoC dt bindings
Date: Fri, 5 Aug 2022 14:49:09 +0100
Message-ID: <20220805134908.749935-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_064939_279532_99A652F8 
X-CRM114-Status: UNSURE (   9.68  )
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

U28gZmFyIHdoZW4gSSBhZGRlZCBiaW5kaW5ncyBmb3IgdGhlIHBsYXRmb3JtIEkgbmV2ZXIgYWRk
ZWQgdGhlbSB0bwpvdXIgTUFJTlRBSU5FUlMgZW50cnkuIE5vIHRpbWUgbGlrZSB0aGUgcHJlc2Vu
dCB0byBpbXByb3ZlIHRoZSBjb3ZlcmFnZS4KClN1Z2dlc3RlZC1ieTogTWFyayBCcm93biA8YnJv
b25pZUBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xl
eUBtaWNyb2NoaXAuY29tPgotLS0KSSBoYXZlIGFub3RoZXIgbWFpbnRhaW5lcnMgY2hhbmdlIHF1
ZXVlZCwgSSdsbCBzZW5kIHRoaXMgdmlhIHNvYyBhbG9uZwp3aXRoIGl0IHVubGVzcyB0aGVyZSBh
cmUgYW55IG9iamVjdGlvbnMuCgpDQzogTWFyayBCcm93biA8YnJvb25pZUBrZXJuZWwub3JnPgpD
QzogV29sZnJhbSBTYW5nIDx3c2FAa2VybmVsLm9yZz4KQ0M6IFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNDOiBVd2UgS2xlaW5lLUvDtm5pZyA8dS5rbGVpbmUta29l
bmlnQHBlbmd1dHJvbml4LmRlPgpDQzogSmFzc2kgQnJhciA8amFzc2lzaW5naGJyYXJAZ21haWwu
Y29tPgpDQzogTGludXMgV2FsbGVpaiA8bGludXMud2FsbGVpakBsaW5hcm8ub3JnPgpDQzogQmFy
dG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5wbD4KQ0M6IFdvbGZnYW5nIEdyYW5kZWdnZXIg
PHdnQGdyYW5kZWdnZXIuY29tPgpDQzogTWFyYyBLbGVpbmUtQnVkZGUgPG1rbEBwZW5ndXRyb25p
eC5kZT4KQ0M6IEdyZWcgS3JvYWgtSGFydG1hbiA8Z3JlZ2toQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CkNDOiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgpDQzogT2xvZiBKb2hhbnNzb24gPG9s
b2ZAbGl4b20ubmV0PgpDQzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUu
Y29tPgpDQzogU3RlcGhlbiBCb3lkIDxzYm95ZEBrZXJuZWwub3JnPgotLS0KIE1BSU5UQUlORVJT
IHwgOSArKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTCmluZGV4IGNmNzkwNmVhYTVjYS4uMjk1OTQx
YjZhNDEzIDEwMDY0NAotLS0gYS9NQUlOVEFJTkVSUworKysgYi9NQUlOVEFJTkVSUwpAQCAtMTc1
MjUsNiArMTc1MjUsMTUgQEAgTToJQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KIE06CURhaXJlIE1jTmFtYXJhIDxkYWlyZS5tY25hbWFyYUBtaWNyb2NoaXAuY29tPgog
TDoJbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwogUzoJU3VwcG9ydGVkCitGOglEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvY2xvY2svbWljcm9jaGlwLG1wZnMueWFtbAor
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vbWljcm9jaGlwLG1wZnMt
Z3Bpby55YW1sCitGOglEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaTJjL21pY3Jv
Y2hpcCxjb3JlaTJjLnlhbWwKK0Y6CURvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9t
YWlsYm94L21pY3JvY2hpcCxtcGZzLW1haWxib3gueWFtbAorRjoJRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9jYW4vbWljcm9jaGlwLG1wZnMtY2FuLnlhbWwKK0Y6CURvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wd20vbWljcm9jaGlwLGNvcmVwd20ueWFtbAor
RjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvYy9taWNyb2NoaXAvbWljcm9j
aGlwLG1wZnMtc3lzLWNvbnRyb2xsZXIueWFtbAorRjoJRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL3NwaS9taWNyb2NoaXAsbXBmcy1zcGkueWFtbAorRjoJRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL3VzYi9taWNyb2NoaXAsbXBmcy1tdXNiLnlhbWwKIEY6CWFyY2gv
cmlzY3YvYm9vdC9kdHMvbWljcm9jaGlwLwogRjoJZHJpdmVycy9jaGFyL2h3X3JhbmRvbS9tcGZz
LXJuZy5jCiBGOglkcml2ZXJzL2Nsay9taWNyb2NoaXAvY2xrLW1wZnMuYwoKYmFzZS1jb21taXQ6
IDg5OTkyNmYyY2NiNDQ1M2M1MTk0M2Y2NzM4YTcxYjJjNWFkOThiNzEKLS0gCjIuMzYuMQoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2
IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
