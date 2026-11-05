Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7679606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=J51iDQFK;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=NjY6rKjx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ECv5QBauttBXRUMo322clRAlfiqbSol7KLkOnaxnKP4=; b=J51iDQFKeJyLfQEVujAnfmiTms
	XqNp9466li7shTkoQWjYzEQTgng9/q+gtxOMRcMQMkBWkay6SvapefxpIBet7gnSj6TWw3J7AGasr
	i2AcD7ACDu1K5iC6nEO2Goid01r/xgVMPnFMGNhh2zYP/0BC+5xp7p45gJS9vOTuFMaHcwax6R7d2
	+s4mqJwsPnYyk+IOfBiShjSdWuLduLjob218Cyb4NYNODXdLnpbaYuK32h/86OrY2VIbIPll5dgPf
	/SO1KXAvaF+Y/tby9LC+HxIxVUQ+JHkimKJCUlbktdvrSN8TUHtBG+q0ubQlhWX8boY3NJWd+0GFo
	pL0nj2DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsly-00000008964-2cLE;
	Thu, 05 Nov 2026 08:24:38 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOslt-0000000892k-27LK
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:24:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867033;
	bh=PMy26U+a8p6T/DZbXU09t/uUDgp8RhhSnvRaYUMUKHQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=NjY6rKjxaGur9PgHybhh7lSd0uVrCRtkziXRcOa8KpTYCkTWzkgIeUUdJUWbZ68ap
	 PPRtB+TAM25GPX4MpUh7hD837B+0P3dVgyzscbK9gF3szgfZeO44oWU4l/0OaJ/Upc
	 A/IDN0MCmyWfOk3GWqNd0Z9rOzN/Nr8oIYbfx0s4=
X-QQ-mid: esmtpsz10t1793867031t33177925
X-QQ-Originating-IP: S5npOyi7aINTfxWjzN8uAgHEA4v9Zxn+qFnXr53kbTw=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:23:48 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11420959379972091869
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/5] riscv: dts: spacemit: k3-com260: Describe SD card, SPI
 NOR and MAC
Date: Thu, 05 Nov 2026 08:23:45 +0000
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s+4kgLQxXsV0UWHUUQHDtMaEc
 PdizV+9zS8glJkETl2BTB8WTrFB9x24+xxvhOybwSgzaq0GfB7QpWBGhSH59UUoHmPKGGaH1pJ
 vaTscDbTDO9OVv/v9PP0t6+VBbvktodYN44gfFX8AAAA=
X-Change-ID: 20261105-k3-com260-module-sd-nor-mac-44edede14582
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1397;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=f8JEl3nwmhnXtGnW8XRJdFD/mPXqxg42zaRBQTXPx4o=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbIWnvTgvpOEbvNRl4l7OK8dTZ/zQEUlJO7Xwl9sVh
 QRxOROxjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgInML2L4n8jqofpLSHHf1Y+7
 A74cvuH5+qFuScwd9R3fDlhk7/v94y8jw+Ggh/M+SrqLpAZ6x+Vv0fHQPBj2dKL3QhHJkPu3bYo
 eswMA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NojR6Ao/DkEDqU2b6fuTKkTmHDlm0Tbs2M7YxujsZMOZZHussXiyYj3R
	+WqeYs96vuF6KID9CGnZ5zXN1NZbSi2y6FywaWrAYstTkQ5Ok2TxwH8+MKVNDVbD0Dis9vP
	IxgYnytfEBS7cYB73yEQPfhGUdJL1yE/HGIzJQ2Smd+oNWAnDqhYbzZHLFYCar3GUG8Zkli
	UZMwd6hafZZ4sW0wTskzcljlbm37rVjQ1RGOoq9yeZ7njsDp6NHFsrA5X3gSHB4m/+53E1t
	KwQBNK2799oaOLxq+xyY86HtFF+56k6kVxQfiuMAiveWySFWd3pE5bSUe/g0lVPPhI2iQx0
	9mEB5Y9MdS1cCiSZZB7Rf7EvaySoEHrvYCnu4vxsa6zMmIcJvBU3WyX++nPP5wCA1p+6vjl
	BPw2W+B7bjENlGr79xF1ct6jtSPQFt330D7mAjuRr2FioUj0/YEaUewvXkXUMjbANBRsuWL
	HSjtUCqJGvuB1ClU2gheSLcNrlSNfAcI8ddIQ6/oZ8QURkG4/P2qPXWsUU9a0k62lhKiLAz
	rYKmArs3aCVJUBanqupJJtMU3kydHP273VMHID7VZVhRqX701HF9AUR3VXnA/cQy4UcmdHb
	qURSKVQDhyFQW6X2NfJfJzMiEV8cmwmvWJQZGstF4uG0qOT/wz4+xuvY/YfxIUscPX6ZjFt
	N54M+j/8Q8WK6GeeJgURkjeW0CWSfA7eEXwIZmyuTLAcnQNfo/Ea1J+YHtulmq+Luwh2+6k
	//rLWEfq2EO+QwcI9KlzI2sxGMn6BrupotXWXJlLz/LITDDOX0QHBr4m2liYT5YTrD/rhvZ
	ePDWwq82WI29gD1jVvjGWlKa6RmyIXzckf9d/Yp48j9xYpd32XQT3jZ/PeikNq2+4RwSJqo
	ZmEtks7phlyrtjX2OxQYF5XGL5anWy21zkGRud+whfaZHgLR6PaKFi1z5BxoZ09D1MeOB43
	QSRQZD+DEcr4CAB507FiFkrT+L9+c4S2eUYH0SKR+3tUvaN0xKPiEGNqvRzEMntUnLyD+MD
	KPokLbg0aPJTo0QsBDnk/MOJaPF0n/esN0lGZ37uW/irQL4xnpLr6+57XZFh9pQKbkf5zjC
	4AukmzySxBCp5rtjIlSS5lKMkD1fIsz44II3H/oKIbY
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002434_393757_F1749BE8 
X-CRM114-Status: UNSURE (   6.97  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SD card slot and the SPI NOR flash of the K3 CoM260 module, and the
MAC address stored in its EEPROM, are part of the module, but they are
either described only in the IFX carrier device tree or not described
at all.

Fix the SD card power description, move the SD card slot into the
shared CoM260 device tree and describe the SPI NOR flash there. Enable
the AT24 EEPROM driver and the ONIE TLV layout in the RISC-V defconfig,
then let the module's Ethernet controller take its MAC address from the
module EEPROM. Every carrier using the module inherits these
descriptions.

---
Troy Mitchell (5):
      riscv: dts: spacemit: k3-com260-ifx: Drop wrong SD card vmmc-supply
      riscv: dts: spacemit: k3-com260: Move SD card to the module
      riscv: dts: spacemit: k3-com260: Add SPI NOR flash
      riscv: defconfig: Enable AT24 EEPROM and ONIE TLV layout
      riscv: dts: spacemit: k3-com260: Set Ethernet MAC from EEPROM

 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 18 ------
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 76 +++++++++++++++++++++++++-
 arch/riscv/configs/defconfig                   |  2 +
 3 files changed, 77 insertions(+), 19 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261105-k3-com260-module-sd-nor-mac-44edede14582

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
