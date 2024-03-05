Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 888F1C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BeegECuPx+LG71ssHaWAID9iYYuJ0IWSYL7nVPsZ7Cc=; b=vCvM9ZSVp8DiJO
	V14uTuTyEnL8WBU8aq1V+6gw1n0Y6fE6PJ/d0lljZRMjDG5VC6TC/n44MxfcU3biNIGihuCPZBzDf
	r8Gg6IyBAkWUUGioXK4zPC4jDmtnknj5ELHvI/wHZj6jlcG3XXc6BbwSg6xJudaSFQB/WOWLxnzfK
	qIuBACs8FE5EMlHrqhevxVNP7OqQUzjvUidC42SQG++01wQtcBtKQyUQ7X/dk/HKFwAdgNxNW3Qjd
	+yeeTdcM+J466GopsTAbJTFyDE0v5BT1DlBcu1HfbwmwZPXchDCCjmE9Jiz1BnDeKZsah2CzCdHQ8
	AmltLi86Vcu/q3pDs5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhabP-0000000F1qG-2B13;
	Tue, 05 Mar 2024 19:37:27 +0000
Received: from out203-205-221-155.mail.qq.com ([203.205.221.155])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhabM-0000000F1ou-18O1
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709667433; bh=xYAKlJMz8tHhX/SyBJ+u8i1ukaT80u/oUuBPwp95/WU=;
	h=From:To:Cc:Subject:Date;
	b=e9wo2dGSaNWPUjmsHmAKIZxBMRwMwKo64HlJcexDxQCtgevWlJCvM97413CDu04iS
	 oOpZ6AZZILPXg3B1UYuEnA1E0bXsajCBXOHI/Y+nFtTCjWHjI1AV6Yj3Na2Qa+SKRv
	 Sb35t18407gs5YTYP2RfJCex7b1xHLYrhsE7znzE=
Received: from cyy-pc.lan ([240e:379:2267:e200:bd8:e8f9:fb59:de48])
	by newxmesmtplogicsvrsza1-0.qq.com (NewEsmtp) with SMTP
	id 94902851; Wed, 06 Mar 2024 03:37:09 +0800
X-QQ-mid: xmsmtpt1709667429tgqpk2n0q
Message-ID: <tencent_587730262984A011834F42D0563BC6B10405@qq.com>
X-QQ-XMAILINFO: N/WmRbclY25GpsCj3Jk0kjwcDv7v3MKRfVs0UMJTow0ftTa8kEOsfezNzLxNMp
	 jvWOfRXPWhg8CyVlVBXl4fXZ5SyrLZUnWTNoCPvZ6E0GHTAYqjrMBzB78l5VUSo897LdD6A+Jatg
	 k+aTUjZXII0ycuflDIRBkCJCaT5GHFeDnSQ+vJjw/Hs9mSK1ZPjPgsrlmsgR0X3JKZXUqmkn4dJn
	 MvhEVKDC4Vv1eb5DsCX7YgrZnr5Q/XmSzP+tfJ3gMaqNSPOpdWZbRHNmzRNZNl1DyITxtMrLTuDF
	 nWQCYSWd+FefMoeKYYNwN5zsP6E1JqBIPKQtyIRVS0gdqIpFdk1KDDekw2bGART3loZCAtogIPLJ
	 gwnBuBFQ0dTtJfjDUd/a6gAfb7VLEWxVSZX2qH8LO3rqS2Vtd/eEA9F6Vz6EEh9d9xCuioxV3a+u
	 6caUI7bLhqiXz50PBmr2YZ5CHu61T4Kejy17Yj3/yTyOQrN+eupE6RifpNFxu1f7B3fvrdqt45/o
	 CCGyFgvpaxVa8ebi7RO+slM7+d8MI/KUcgjts7gNyfQdetJv4Hh5PPBHThotd66c1fGSUN7tjG23
	 EvcLFnbpWhQVc3iytUyuVExBiFfsk0xfd21ov/Zes1mcVWgUXkiTpEOldYigZzCRNnFHXMqTnkSK
	 vPKqmvF6jx9H5lPZVR0PyVydHXW2+DUevERFMoNE/iD50i3sQOQJOaIzhXIZN164VxSRp0m5L1bb
	 nZi4xPX9UtqQlxnwQmLo5kLhYy9HZ5ArsNpI4lnLz1Yi57aXUCXtfDoWhPDXFP3+7qGRT3L6Bnys
	 Q/a+fN0k+xDZ3SyimiPDerzeJYbAHpiJ0Hmeo3uG3UXRjh7fIwS8aRX6r3nH9ZZUKs1NX6CH94DT
	 OGwIH33RgdUcaxrVZe7J9Duwc7rqHtaoU9j2ozeUi/KRfrl8Wc8/uCsJ792pnrY/a9LGLBbifKEq
	 JscTYyKot+Ue7vhvNIBU1bzoSdksLPBraurjgYPubpuEB4rgwf4DBl25boXxjXSj1zqnknScTZ4I
	 IU7Yplol568zFPtL9xMCu5DssHykI=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v4 0/7] riscv: add initial support for Canaan Kendryte K230
Date: Wed,  6 Mar 2024 03:36:08 +0800
X-OQ-MSGID: <20240305193608.1084130-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_113724_648663_F64C9AE4 
X-CRM114-Status: GOOD (  11.70  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add initial
support for it to allow more people to participate in building drivers
to mainline for it.

This kernel has been tested upon factory SDK [1] with
k230_evb_only_linux_defconfig and patched mainline opensbi [2] to skip
locked pmp and successfully booted to busybox on initrd with this log [3].

[1] https://github.com/kendryte/k230_sdk
[2] https://github.com/cyyself/opensbi/tree/k230
[3] https://gist.github.com/cyyself/b9445f38cc3ba1094924bd41c9086176

Changes since v3:
- Refactor Kconfig.soc which uses ARCH_CANAAN for regular Canaan SoCs and
  rename SOC_CANAAN to SOC_CANAAN_K210 for K210 in patch [5/7]
- Sort dt-binding stings on Cannan SoCs in alphanumerical order

v3: https://lore.kernel.org/linux-riscv/tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com/

Changes since v2:
- Add MIT License to dts file
- Sort dt-binding stings in alphanumerical order
- Sort filename in dts Makefile in alphanumerical order
- Rename canmv-k230.dts to k230-canmv.dts

v2: https://lore.kernel.org/linux-riscv/tencent_64A9B4B31C2D70D5633042461AC9F80C0509@qq.com/

Changes since v1:
- Patch dt-bindings in clint and plic
- Use enum in K230 compatible dt bindings
- Fix dts to pass `make dtbs_check`
- Add more details in commit message

v1: https://lore.kernel.org/linux-riscv/tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com/

Yangyu Chen (7):
  dt-bindings: riscv: Add T-HEAD C908 compatible
  dt-bindings: add Canaan K230 boards compatible strings
  dt-bindings: timer: Add Canaan K230 CLINT
  dt-bindings: interrupt-controller: Add Canaan K230 PLIC
  riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
  riscv: dts: add initial canmv-k230 and k230-evb dts
  riscv: config: enable ARCH_CANAAN in defconfig

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/canaan.yaml     |   8 +-
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/Kconfig.socs                       |   8 +-
 arch/riscv/Makefile                           |   2 +-
 arch/riscv/boot/dts/canaan/Makefile           |   2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts     |  24 +++
 arch/riscv/boot/dts/canaan/k230-evb.dts       |  24 +++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 140 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 arch/riscv/configs/nommu_k210_defconfig       |   3 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |   3 +-
 drivers/clk/Kconfig                           |   4 +-
 drivers/pinctrl/Kconfig                       |   4 +-
 drivers/reset/Kconfig                         |   4 +-
 drivers/soc/Makefile                          |   2 +-
 drivers/soc/canaan/Kconfig                    |   4 +-
 18 files changed, 220 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
