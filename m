Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A114606A31B
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 08:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NfpZ1KMr;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=Ejh5VaEX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=jGOBMINt4NzGVm6dFraKp+VMdikijkmK6qSPuFTZ8P4=; b=NfpZ1KMrkARur+6PW+UTzvr7NL
	0wJfcRdINllIJ2UU3WDssHznYd+WUjX2qIdVlHFzNH8l0oDMp947K9DyC4TwGPXk7s8Jr/ThlRkl/
	R1ekWyUg4wjnsROdG6Eh/U1jY1o217Zd7mk1oXkxFcyJuNPMiqS3UTwFt3c6k7loXh59BGETOCc9K
	y46XqslupOa8qN4Z5/g3ntzUpDa4aF9FZ7H5fDH+XQI0PlO0+HwJ7wep0QvJtiYtWKONNyOpcNwUH
	dmOXxsZglDKrEPPHioQXqddQKNTFJXrGTvdzdBhbc+P+s50vBh9L5bP8Vh5PnvY4pvE5o5/cf4zdm
	5w3xeWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsmC-000000089Ad-3Dnk;
	Thu, 05 Nov 2026 08:24:52 +0000
Received: from smtpbgau1.qq.com ([54.206.16.166])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOsm9-0000000895y-3Ily
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 08:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793867049;
	bh=ZJ249AtmwSuCZsIIsSDb7ydrGHQ516oqgxihKKAwghE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Ejh5VaEXKo5X4pSwhBx9obfWqL9P31aPI11Z8vPwOdWDgIiPSdsj3O838TVlycE5B
	 XmRRJtlJdAtKa6BKmya+EloOym8zhBTupABRfpjIpzD90kKp096C2c0/OHvMEp0z0l
	 1UolzRd2jDfeRZ450u+TtKE8e2f3ptcHHdH/36aA=
X-QQ-mid: zesmtpgz4t1793867048tf3e3ee76
X-QQ-Originating-IP: iZG4yoHhf8J3fsBiHX52Fhia9VgMbLyclOKJK/7Bw84=
Received: from = ( [58.254.68.27])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 05 Nov 2026 16:24:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18264579372122570667
EX-QQ-RecipientCnt: 13
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 05 Nov 2026 08:23:49 +0000
Subject: [PATCH 4/5] riscv: defconfig: Enable AT24 EEPROM and ONIE TLV
 layout
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261105-k3-com260-module-sd-nor-mac-v1-4-138b39d74602@linux.spacemit.com>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=8xFU6VvJImZA2MbPgp1OYJlmNmjSbxKEyOFL+rbF1NI=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFlvbEVuXHzh/eF4jYeN3aEbZnN2z9+6e9PPOymRP2vaG
 PT2uMTP7ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZiI4haG/05XCvXD2T1Ul5Q9
 ZPI917/yvnvX3r+HIwzj7vE837fK/BDD/9wTnzqnVZ+9/0n551w3g9eL7l/r4elw/z+lwnNfgdX
 /CG4A
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NK5b7h72e0qHl3uo/lwlGSe/y7aqnuFmDUyskkHSIR26qdR9u2VgCNAR
	/RFEDxyUrLxeJsNq6UldRxwFEbSUqqPf/7ZgmDATtSt5J1v/sZeQNG0uICBS6N1kkr8oGk7
	YfAasXFGWH3+ZV3AzUTC8hfsOMQK26sPnTB8tyBkO/ie6qyENF24CiX0qhSPBDjsag/T1bD
	emw43IrOicCIubcLWxrlGFpq0pktNEY4aZ4xH59wzpIJlIn7dWHI2Eh20Sdjk5oMM0vyT2R
	d8RYu/n+9+LOfmCuEeq4F3VXE4t0EsnxpHWnQESbvniknM7M2haFycMdepWXU/RJ0Im57mU
	zPrnxE6EtIak7hFZuwG2M8uXzeF1yStWKNN6t8IXjLyM7ckurkiBpWA7YX5I+ps8UODCR0D
	2za0o60YBMReEdhyikEhfTGnT8yyCfTjB+Lf1vOkowb0gJIBJKS4V3AlbeOxIqfk0CvhLT0
	G3AfVoC0FAab1FTdlyWcRcY85ETw7YOXr1q02dDO9J2ba2EN2dtuKcsza42yOaPjp25Sn5S
	0dpdVfJA6zBGz7h26JlQ+9VoD4VEV6ltJjqC1NjZZujaDrU13H7crJ6UdKOcmTObStelgG/
	WRSakW2kQKUBGAxw4toWzTGyJ2MkkNTf6Iz0pV+I4Cu/GAHJD+smS8/ws5yzoUddxL2uSPt
	cxigfQsHBAzdQ/VxipXJ4DhMdk63K3DjP68ML0E37CNBIQuC1YeuCHx10JJwvfrntK2j3Nr
	l70dL1Ktn1PP++RrGfVlF0V28DkTMZ86/ZpctsA40+ujK7VjfN1Af7Rxj7b2Dhw2mMWPl+A
	aLEBhj+Zl+v0j/BTOqYHaAiJwuWSxpUjx2nVAHmWjFtyzSIGfj3iATFGwQbK+OiwEON2+k4
	ORibv+wX1kt7swD2O4qCJJIlcht/txrWmPZUL1QtF3jtqrMsCg9OrjCU9D10EsIN0M4yoD+
	ofg6iqPTFH5e5cjfI+sB+0ZRrYcXIpCjXkZRN35jcxNFQhcbCXA/2MJ8Zic8aGlQ+T30N7f
	GvY0kqyCkxsB04XDbHfdo6y34pMgmJMPbXPhfYIEf6tc9BOLNBLgFrRBKqsAQwSOhnffJAv
	q2KuoBtUylKO5clsdQsjPz1fCXM/GCZ5ta7Ni9jqLuQckEI8clAmbgrfY0gg8pLJbXvj3LK
	cM8c
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_002450_282196_16FAD404 
X-CRM114-Status: UNSURE (   8.18  )
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

The OrangePi RV2 and R2S device trees take the Ethernet MAC address from
the ONIE TLV data in an AT24 EEPROM, and the K3 CoM260 module stores its
MAC address the same way. Without the EEPROM driver and the ONIE TLV
layout, the MAC address lookup keeps returning -EPROBE_DEFER and the
Ethernet controller never probes unless the bootloader passes a MAC
address in the device tree.

Enable both drivers as built-in so the MAC address is available as soon
as the Ethernet driver probes, including for network root file systems.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 04ae305d5511..a76f801d8eed 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -276,6 +276,8 @@ CONFIG_PHY_STARFIVE_JH7110_DPHY_RX=m
 CONFIG_PHY_STARFIVE_JH7110_PCIE=m
 CONFIG_PHY_STARFIVE_JH7110_USB=m
 CONFIG_LIBNVDIMM=y
+CONFIG_NVMEM_LAYOUT_ONIE_TLV=y
+CONFIG_EEPROM_AT24=y
 CONFIG_NVMEM_SUNXI_SID=y
 CONFIG_EXT4_FS=y
 CONFIG_EXT4_FS_POSIX_ACL=y

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
