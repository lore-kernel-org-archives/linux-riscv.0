Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B425606A33F
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2026 08:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Gbi2/l3+;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=xB11US2y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=PwqWy7xP5rLNY4KV/hf5Y0PaOez0FNi21nLuV+8lF+E=; b=Gbi2/l3+tRkCmao27hYZgTaIFo
	ZvNMPOVkHZcZUwYG5Hg7gSZis0SNbCpvJtQc24fX8py66Pb6aqUafn8iCVMf7k27tMg7ME9hS+W5l
	feW5olEa4qxTQD4P+2BAzhffxEEqc/an0ygLaWaPf3KO5sinD7FxXkjZL3F9nBxjRXkfSFgXkHnl1
	GdJSkY+GUqJbhGdreF7ArE6o14JvHpaV7Mw8x2gFhjBbCzMIvGIMH6hJhAR7gH+TM5g4hdeMJYZ2h
	9DJOEKDlJGDC3IsizQYokBsi2eTxyE6xIm3VL56SXTVG42U63RizbbIVOBKEbt/PFl55r67X1ZCMK
	eHznzYhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEt8-00000004xTG-0n5V;
	Tue, 17 Nov 2026 08:50:02 +0000
Received: from smtpbgbr2.qq.com ([54.207.22.56])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTEt4-00000004xQ5-1cat
	for linux-riscv@lists.infradead.org;
	Tue, 17 Nov 2026 08:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1794905339;
	bh=zWyRURPu1OxrVx0wsF9VEbECiyatmSf1CoESfSh8E/k=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=xB11US2ydHROwhf488ftOpPL6fPT1gipHiGjGNG2chOEPzup/y/hKfCDKa7I2q+xj
	 A3cpkmLA8+/iK6NX2bSI7TxyGZC9fvECqOiVwyeX2FI5ZJRP95AHbIe5OPUvoi3UL/
	 O3H80I8UuuRxJUzcWzKH3FpPlJf2f6gJ7+t8rl6o=
X-QQ-mid: zesmtpsz2t1794905337t89f735b3
X-QQ-Originating-IP: R99N8wcVkiTH8aE42GHQGH77icoKGm0a84h5ayh/DHc=
Received: from = ( [183.48.247.191])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 17 Nov 2026 16:48:54 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 195453335041648402
EX-QQ-RecipientCnt: 15
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v2 0/2] riscv: dts: spacemit: Add K3 CoM260 TQ support
Date: Tue, 17 Nov 2026 08:48:50 +0000
Message-Id: <20261117-k3-tq-dts-based-on-com260-v2-0-68b337bd8938@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32Nyw6CMBQFf4V07SVtEQiu/A/Doo+rVKXFthAM4
 d8tsHc5yZwzCwnoDQZyyRbicTLBOJuAnzKiOmEfCEYnJpzyilFWwquA+AEdA0gRUIOzoFzPKwp
 FrUvdNILLRpK0Hzzezbx/39qDwyifqOJ2uBmdCdH57x6f2OYdHUb/dSYGFISgsq7ZWaCm17ex4
 5yHQSjsTcyTR9p1XX8R4ild3QAAAA==
X-Change-ID: 20261015-k3-tq-dts-based-on-com260-37d5d99a2b9b
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Guodong Xu <docular.xu@gmail.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2089;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=cKNI6p0a2FU5oVIDwqYsIH8y/2k6zgLXOKucQO4l7mY=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFl/RL7tV15x5p3kxRs7M1/zzyuLvRLnc0rVnSNEMiHJ0
 L21NntHRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwETSBRl+Mv6c3C5UknuDvfT8
 uaLQJ+/PmCVPtVxzPqgh7P/es/aJ9xgZenaLx6bWKC9qWC74sd4w/1jXk+ITgitE9/FUsqwKtbH
 gAwA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NdC04oDZj+f2IKe70051Ci0qG8BpBvvmKMTPIcLphf+rKCAnRa8LGcV6
	2rfenz2kMIu8qYQqNs/Y5Lx8NTLqxKJqYrFCQOIrylCFYhi1Br2P89GjLP41VEuB3PyOeT0
	Zu+op8rk73g8slqjCSz4ohMoJ+Mb8Na6xJjzk7mqfXm0ex93CeYyq7mJh92V7OeZMNSg8oR
	FAo0qN69JBg/FPTNz4uWZZVYKav1m7RBDdxcq32s2B/FEZrCTG/5+e12A0wlo+Y9nOiHpKk
	J15NuyUDiIJhwrM8JcWX8d/pxtdfX+FMSbOoz+SkHKS0FP3tzjHkfVf0OCbjrVTmmiIR/uL
	S8akvAYhJxZmaGWvzHw6/nwODSpH09MazC42W/urFEGNtvfWZKraLyR2xCx/uFgqeieEY4W
	RC76mp6+GGNnSDnjq3BJV7qgkQk8poCZ5KXfCUird2I6RhReCqOSGF3VqX/tdRCQJ9TPh/X
	ts7czFfXYw7TOtplknTDWBuBR5JdG6/v+xJ9zc2+a+5qHBIOq79qLV+/yq6Q2Wa951ogMLg
	6feSs3h2bYvQ8wLWWRmRBCf+ecVyTtmJyPH2yko0sHiDTAH/lgb9WkGaukueeqf90NoEzWF
	0SYXu9bsLya3APxKY8tKqYySAegchq7OaCExn/xUle5/Nfc6Hv3eitP+845txW+2Ev+6Y2f
	hyEIssWhiUvTT4WrNzowFHa7kvbEt6ecPWIORwWKHfil7r/uiu9j4du21P5D67QHrQIlUxF
	L+awozUX+AKD8P6FcLb+zZ6X0cCmPNxOkheEXkMY2Din03aJ6CBRSbwGscBsEgfrZj6KZ+m
	uwmzR6VnQtfNBml8bGLnCwX/zWqCwzXc22JPyEqLHkzw1g/FAMnOeRm2JHC4vACEkOIkcHE
	8riNmPE77/y0Cx/dkcmQnp+thCJSDumSOUgZ5cJzR/Jvc5LFIO6WriDfG1zVh/LmQrHbqRk
	kn5Y/YcjItwYJnCXl0BRAUjwms82filJYHUi2B0zAwr26coD39H2pNPHUteyJ/IXmYR8cmB
	3kDfoIHL27Q5w+6oFbNZuXIEtZvr5YMJd9cOGfgifTUoK+gjje6bHq+2lz50B7TUM8H3jof
	gu3D6eYJ9uUocJC/ziN+B710t1ayWMO1Gant+ug0flUuRzGJjUIHrg3vyryZDJ5mFsYrvMm
	2oVULVvDfWaE3eI=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_004959_246939_91AD2332 
X-CRM114-Status: GOOD (  11.44  )
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

This series adds device tree support for the K3 CoM260 TQ board, a
K3 CoM260 module on the TQ carrier board.

The board uses the CoM260 module description for the UART console,
Ethernet, module EEPROM and PMIC, and describes the carrier's Ethernet
PHY LEDs.

The TQ carrier board comes with one of two power schemes for the CPU
clusters. Both are the same hardware otherwise, and the system currently
relies on the bootloader to set up the power scheme, so a single
compatible and device tree cover both variants. Once the regulators are
supported, the power schemes can be described as overlays applied to
this device tree at build time.

---
Changes in v2:
- Rename the board to K3 CoM260 TQ, which covers both the TQ and the
  IFX TQ power schemes.
- Use a single compatible for both power schemes of the TQ carrier.
- Link to v1: https://patch.msgid.link/20261105-k3-tq-dts-based-on-com260-v1-0-aa0b7714aed0@linux.spacemit.com

To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
To: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Guodong Xu <docular.xu@gmail.com>
To: Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Troy Mitchell (2):
      dt-bindings: riscv: spacemit: Add K3 CoM260 TQ
      riscv: dts: spacemit: Add K3 CoM260 TQ support

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k3-com260-tq.dts      | 44 ++++++++++++++++++++++
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
