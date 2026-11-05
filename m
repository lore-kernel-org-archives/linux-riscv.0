Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C24606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=spG8ymzo;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ZxhCutnj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MCT7jf6F6xBpY2yEI3ZpgSjXagmdme8JPA2sOdy5UJs=; b=spG8ymzoOF9whfEpjZ93Q0JD9u
	6x82rNbQ3s0+DfLAnfLaDYMSQMapog+OaTEPzxRh8XMXxUozxWAT2LCWFDfo9PV3r7IupxABEVGyt
	TZvZ3cPmus5IT/lkXFCHaghNtbN/HK6DRaPc/5NBrtwJUdxW2BYFJHZdCfr88BSfx+c14FGJUWzqO
	N56Znh5SuQfdgXhQnCbwjak6HB/eEG9xVgVPqkb1+nSdxvQF5Agj/8RwVTVAnE3/hLGut1w7OSc9p
	uKH5pFhqmciObo/MIHHGxJdSQ+h0gn+7wmZ/fTigItN1ujJ8kYbI1SBIeHYR6d81kyVbnp/ZVjcIV
	1dXUS8qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsri-000000089yu-36fQ;
	Thu, 05 Nov 2026 08:30:34 +0000
Received: from smtpbgjp3.qq.com ([54.92.39.34])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsrZ-000000089tQ-3ky5
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:30:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867371;
	bh=sPfx+l0EOFGsE8A6hxIkSb4d4vAjU6pgHNaF0pOo7Z4=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ZxhCutnjoHntZzlj0fXFopOOR2rih9iWwf2EAdkacwnYzHUh39MQwGtVK3fp/h+Nk
	 SVYQ8TUNAwQz+gPI3dybjJH7F+hgqljJyDQMoy2IOBtsM/sZnw+oCE4++9Ei8f9Vl6
	 GHUy51L2M60J47a3rf20jPSnpt6Ws8W311zVvm0s=
X-QQ-mid: esmtpgz10t1793867369ta4ea5eb8
X-QQ-Originating-IP: y4ts5EB/CBr+rDQhfQ9imstg/unhgR/i06rQiSt5Wgo=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:29:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 4689580742165798105
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] riscv: dts: spacemit: Add K3 CoM260 IFX TQ support
Date: Thu, 05 Nov 2026 08:29:25 +0000
Message-Id: <20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ7CIBBA0as0s3YSoGkNXsW4AGbU0QjKoDFpe
 ndRl2/x/wLKVVhhNyxQ+SUqJXfYzQDpHPKJUagbnHGzNXbC64jtgdQUY1AmLBlTubnZ4Lilibw
 PLvoIvb9XPsr7994f/tZnvHBq3yGs6weAGI53fQAAAA==
X-Change-ID: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=997;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=OxI2d1hddR39HnEUvBSLPcjUfPMFYF5rC1EItjvJdoo=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlv7NL+fbBqDL2519m+45ro7mNc92eJHFG15vbge/TTw
 uOj7e2fHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABPRyGf4nxee4L3jxv+EbqtL
 CdM15D5vCDHr4jFNWXpE7q2TKVM/ByPDhTNNRztl9IWMcmoeO0ybXLhK4HXwVZ/f9Zc3eDFeUnr
 FBwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NH+njjzUOij//b0bGVYJVQJ+uU2cstl81bQzNbpPFiIixN/RrU4LBLVX
	kKPfTimmFJImksZsT+vR1zCMA27CoHzJ5VYGyxBl3SDFiwNa5gOJTA80QriOY3PaG19PKGP
	AkX/xQmnd/Cn2NcBhzrjp9jN9USV71e8P0+2oXIVBhpDhlJUBboTqndA1oYo7yJjfMBi2VI
	0luzQgIs6CxeIbdXugKqxlGX4q0DjEjOTaxlsh9uuRye/AQ/Kt5l2rFAsnMyq3IavOT4WiJ
	EwGO+G/GEUYN9pzaPvB0e/spUslFWzb6E5lDuw3algodjGkf44UduD46/nCJfvXV0C+SSot
	xc04b8HNBXGk8unW0Kdn3noitUoyzNCGgARErG3uHRjc9ahzfnLihkdnS9dKDl8OdkkjFIi
	/a5jKEytHyNSBnrvFoFRzvWzEs0xxlIR+8/8VW4nwQFAuH/eBn9opuEuf6TLk8v2sz/1eqN
	hmXyh2xikj3P2NRAfH7LHy7fCrn9vJ66XB3c9RVeJLmSozpafNKbg4rE9y3jCNAHgk78jEj
	r+Hdb1Ib7EfB1hZHegOIefiXugg3ypxPMyGggIfWP9KmpD+oBqXV+kvXcakAfH6s+EN/Epg
	T1mBLCxHaSDEDMVHduBMrzTbWHaczcj1cDSwqc3S2kLkXVmdXuxhlsDoodm9oS5Za6dcx1e
	hRhIjHhks/U9DzOyv3DBfnlJYDifdOz++hOVQWQFAUpjn+//Kd64FZa8sX+GAYLftYc1R7I
	PrHrB/MY9l+RNu40SiwrI0rY9lvoMZk8lsJs+Wuw+Pszeh///qDemAWBekysHEh7h5m6xw+
	WdlguWipTWGgaAd4mBteLKof1CQMr5VHiyN2cPth92DybpSrUOyT1TpwJ8YPy7Wb+KyJMD5
	j8a7td+BC9/YBLIUU/T3ZP7LFxG9eyvhAXXnH6Ubev91LNB/SdNTm4eCruu6ZCIZrglVCiN
	DYJHkpOhW5lKGZ+gwl4lwEyAWJRg03H/FCBudHesEZNDSyoAJSoL3DGnnk/qmPsKszQVyUd
	ygoKyN02EmfexrdwKWOFTgRU/WWlDigrGNcvMiKcPCO/qNcAhpiJpN+O9e0QOogQvXlCxa6
	OLawXnFW3MTHvgfg0CIEpIx45NsHbRc1k0CBEo6CPsaMyAiWl4G9V2EJ4OepuCSO2ueRkHZ
	+XwFhwqtodOo+O9ep3JN8WqJ49K9GBZZitPi
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_003027_233492_9EFF5E68 
X-CRM114-Status: UNSURE (   5.36  )
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
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds device tree support for the K3 CoM260 IFX TQ board,
which combines the K3 CoM260 module with the IFX TQ carrier.

The board reuses the CoM260 module description for the UART console,
Ethernet, module EEPROM and PMIC, and describes the carrier's Ethernet
PHY LEDs. Unlike the IFX carrier, the IFX TQ carrier has no additional
EEPROM.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 CoM260 IFX TQ
      riscv: dts: spacemit: Add K3 CoM260 IFX TQ support

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-ifx-tq.dts  | 44 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
