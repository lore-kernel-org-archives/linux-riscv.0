Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB1F606A31B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 06:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BnueSzlN;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=ToyicpK/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=f80gFqphZUlHuIfgGh3YOgchhMDSjRMCOP+4gWTwNNg=; b=BnueSzlNPQezoRfc0vd2SxHGbd
	i5GGnDhHkClT3VsQAmt5IwrfevfFUWD6PgcMi/QZRArrMADczWJsVHCWsHKpH0rcI4c/VHVVL8bYU
	9XUEwbvEU/P5EoVdprzZO9812IR8eZO1winjfmrTecLh4tyMst7rgkYWPEIH9CmoAg3t+GJVDM3n3
	Wnb+duJeRBLfagUJf1qieL+VUoBa2fn09SzHIIiph0uZSCD6zGQKy2wNbKT+nLvRXgjjekBWxqxw/
	+fpODJfAzOujQEwm6pIAhKQIzLqFgtgKDFAgiHitg6D4n5fXxZrmhxfJfIgm1LARuZ3Mll0VC+XX7
	WuZZpCZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUOh-00000004P7i-1AVW;
	Wed, 04 Nov 2026 06:22:59 +0000
Received: from smtpbgbr1.qq.com ([54.207.19.206])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOUOd-00000004P6I-1kp9
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 06:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793773321;
	bh=3e7+Hhln6FlsUG4lOrO8gQQ4QR4kAprqaH3c6bbIIdo=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=ToyicpK/guk3tEy+bJgHjdB1GDC+doZ5C2iq99BFjXO5uJEeHAW2/ta+w1BslHPoZ
	 VZfvmm++b73fWFH4ioiyO3UXAPsyeBV/yZic8ut7Ts9IW2DuJtkUjFLSBoGdnuS/Fz
	 6DRREo414zlZBcE3ulMBtZHGgLyyPTfhS38HKdIg=
X-QQ-mid: esmtpsz21t1793773319t077b6b8f
X-QQ-Originating-IP: UbTdAw6IsnjA8fB7/tidvUEPpAu5a2tQesr5FK86Hv0=
Received: from = ( [183.48.245.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 04 Nov 2026 14:21:56 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 14544746940952886182
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/2] spacemit: k3: Add support for BS01DCMA board
Date: Wed, 04 Nov 2026 06:21:49 +0000
Message-Id: <20261104-k3-bs01dcma-v1-0-794025247e4a@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrA0kMaTgVcSFjqMdxSgZW4Tg3
 Rvr8i3+TyAUmQTqIkGkLwtvIcOUBeC7CxMpHrLBauuN0U4tlepFmwHXTjn/Gsl6dN4i5GKPNPL
 5vzXtY/n0M+FxL+C6fiSwbdZvAAAA
X-Change-ID: 20261104-k3-bs01dcma-467fe26c462c
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=806;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=R+ytypgJjwtCuLK4OPXu2LlirewZmyB9gvazMxLCYrk=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmvzrNc+tZwb/O74n81zy1OOT6ZuJuZvTQm/5W2/hTu5
 2vmxu207ihlYRDjYpAVU2TpfsCzrcAnyrZAoNAXZg4rE8gQBi5OAZjIvfMM/7SmPJh1736hT+7/
 C+HprtZF8ayPY56kOeQv2/37IK9U5W5GhluJc5bq6EzRPbTMRuZ3yNJve02Ng9QtHV85dRSHTO9
 dzgUA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NM+HyBNiu6fq7Tr6EgpFWBvLxZmGjXG0kbzXva01l+3RrrtPSxRTIHvS
	GqCNeVImgo3NeYS0h/A4bb/rzIWkmDNRjfozpBiD4UCn4oicYJv124x2iZl19q+v9Ug+LZD
	Ae8ZrjPCkDyva+E4R1jWr2WWcwmFPsbzwJWZ4ZwANEP+GJPv86KhBQKLWfe4/bKr2AKoNF+
	88k8yl42VhuLQkbvIVizJnsJ0k5huDqd7EdsU2GOXst5gfTx9gvnEs9sQi/klpEi2EguSq2
	dK8iH5W6qdyJvls/llNlCd93vVEuBDAGhFJu/8GFoU19aMPxwPcdzL9CZbCRuyEPEusQdvR
	fottSQ0Sr6jMK6a1yaUwW2JYL/OJu/E259PCH6qfxAycl6QQe6U2CY2tluu3LYxgfC0sK0G
	RMc/NQ7h4HEaMBbf0SW8U6u3x2d8o/9HxCvTTqZMFkj7DivjXU8r03zSmNIv7NGeQ//dI7W
	psgIH3ItMqDyS5aZhczC6phH8EtrdEVFeLXn7P5LSbsO3MgwmDdNGNsNZv6MT0OoopBxrJH
	eUkiYW/fk4wo6N7S9hYkoRH1Rn7DV1LTsVBNmAxrT+Cqp1su9LvWvujUyKcy5pyTSIsHJxs
	eJYrPMBwlXCuPnaWHN1c7bk9LAYT2/5lAA6DafDtAT8CkwhQ5XS+/5u4tmo18DdgDRsR3CE
	P8ECqY75mWgrpBckjSLussF3su/nzlEyuDaRBUGISeJGyoeR3zviLI7bu9liReXFZWoMlZ0
	+gFuSmXDnt4113rxwtKYltZxwKJTwyoBMJItZkyuv9suZOL8d9Qg8v9Z60CIBcnZizODfvU
	RDhIosIMvumVIb6P1eysSXeTkVB2teHQsojZgvgTbA5QElZZO1Uaaf0WoBfkjycyjVfwpUJ
	zQnobBcvYhMCtIXc7UHHfUchtX40n+OPd2PLU/sikmsE8I1wiRnNWegnxzDruo2DeXgg0v8
	8f8+yzarWsbcLGO3b22uRxXj4k78eEH62NK6gmF578oVghxxaZCPGjGGj340aLeUHxxKlyI
	U0W7a8NGb4g/kb64KUJ/+/VhZQ8C3MCf1p4gtJvlFpKL5faf4KkbIVy/lRNMkkHsMLbaCty
	PcO7Y/+2GK6
X-QQ-XMRINFO: NI4Ajvh11aEjEMj13RCX7UuhPEoou2bs1g==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_222256_259258_757868F1 
X-CRM114-Status: UNSURE (   5.81  )
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

This patch series adds initial support for the SpacemiT K3 BS01DCMA
board, which is equipped with a K3 SoC, 16 GiB of LPDDR5 memory, a P1
PMIC, an EEPROM and QSPI NOR flash.

Enable support for the serial console, EEPROM, PMIC and QSPI NOR flash.

---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 BS01DCMA
      riscv: dts: spacemit: Add K3 BS01DCMA support

 .../devicetree/bindings/riscv/spacemit.yaml        |   1 +
 arch/riscv/boot/dts/spacemit/Makefile              |   1 +
 arch/riscv/boot/dts/spacemit/k3-bs01dcma.dts       | 266 +++++++++++++++++++++
 3 files changed, 268 insertions(+)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261104-k3-bs01dcma-467fe26c462c

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
