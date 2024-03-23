Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C79FCD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fWFSCdOTEJ4LvMfgpbySR6NyZ+UCA6cgClS9RqkjW/Q=; b=hs6ba/sYo77QxH
	u98ay/SaTny5kVB/+Z4S5N4Co/QOHgxKBE4oO07KXIPZs4EX92ME9ij/VF31MDmjsITxVIG3oOyOr
	UnYIGoriCbwF5SfVMbvraGI91Qo1AjPkiyz3lWe+HcDXWgCIesAs3ZzFBTbeNthsynzf6x+Frn9sz
	8FAX04QSld0KzFEtuM7SiViP8V4zHe/6+RGsbzmai/q24wByxSnzBFXk48//jInGkmMC5Er1Cmo+L
	pFNYd1Px0tTl6eJJWWdHfjq1fROhn/+kPPbgAbtiPxAuuARccKdpF+Q2Xgsbyh/1UnPOgKByIAZaq
	5/DAaOCbyBFrE6nUEjWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0DT-0000000AKFe-1bUc;
	Sat, 23 Mar 2024 12:11:15 +0000
Received: from out203-205-221-164.mail.qq.com ([203.205.221.164])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0DO-0000000AKEJ-2b4k
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:11:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195844; bh=FXV/7ms+3t0/0kPfleO6oqzdUTF8q8JeIeMsgZdvycQ=;
	h=From:To:Cc:Subject:Date;
	b=yd9dj6rRDj/LLNqKI9oGr7tfBjAgGez0/fpb7AKECizcAgAQNfzeZ+w/9tLVekH4D
	 YCi2KyNpL4yscY46TcB3YGbIhjLBDIhcgGXnDsSM5tU32ptlqH2kt/6H7koTRi1DgY
	 fZ4xQUn+9ewOf8o81/RPopYz7v/leooS5ki1aAHE=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza10-0.qq.com (NewEsmtp) with SMTP
	id 29B94C26; Sat, 23 Mar 2024 20:10:27 +0800
X-QQ-mid: xmsmtpt1711195827thrvb5b58
Message-ID: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
X-QQ-XMAILINFO: OQ59tfF64tJLcVZEXNL6UKJCRP6DHmqNBwAbU7DzvlZsg0jBqqRaEo1a73jhJm
	 Vh0+GpXnv94y64GUeH5S+fE/Ps19L9WbiN9ZmXTXotRyo2XLcy/EQKsTlJBDshdlxmk4pmT+i70G
	 3HosWAV2ZIeXLr5ALg+vLiO+j3RUhuItIlsUiMcAK5N0xfpfTJ5LSKVAr7M49GeFf9fymOKgsk64
	 sK5+srDS91yIJ4R4+QujU1guaQBu7MuVXVHh7qHRpp+Q5ku4KfMsRvkaF71F9ONeBcXsLCImI402
	 mqtkIpylN8HdSzcwLctKhNYZ61m/YJR264ZDCQyy4sxNX9XN6BUEftw2M6S1W9FroNg4/ucAmNvN
	 /Pszszfjb2/snKHFsAVysatXYGVQnHB5uxrWrsbbRkRsX08pbtGBT7e/qG7bAn5/qXQUBwd1QEWH
	 qaKiCZW731/G2/Xqu5K0+5jTMNK5dgwm0YWpxfCTYc39Lfzo/tf/dfWF9uDfDJ7sKZq4BB/H9YRK
	 mJhYmEycgRABuR9xYd9qyvEzNJzpWrGmI35vvsJPVVoFUjybS+2+yid/YN0H4d17VVGpB9nvH6ES
	 S8IPJiQdWKp3oy5hEIFrsq34usTmHNogPQbmwVOQMEcIy4+OR1WijG1T1YIIfy0do328CpSzSEMY
	 YFXPbpG265qTzUCekSfDntNMpV5rCpE9jeLzJyiqlcJXj72pW0/b3c+aJC9QHOuuMweGjBt+8UhQ
	 GzPdj36D0ittQNv0ux4ZhC0Et0RF7ofenLujMVGfIDYfjczIXK3uto07gEVKlYY4xe+EdLuXlkZQ
	 C8obnGdoLtKrnnnmVII4Er0RxxoGrZZk9i4IjN4tAhqDL0R+wtLbfvAPRt2mM4Z06Q2alTad4cEY
	 qL1D4LvB1CoFOLJMCkKrwwcvU0afxtkEkl+C2y8fh03VNV9A+Kg5WFRuIykSWBQvh+z1Nkw7RpE3
	 tzUBgj04844rp8o0KENCsG5YyRA9vETpl8Gn6/8AknawQfz41E2Z0d5bSBH6Car5+kFpVkkzE=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
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
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v6 00/11] riscv: add initial support for Canaan Kendryte K230
Date: Sat, 23 Mar 2024 20:09:42 +0800
X-OQ-MSGID: <20240323120942.1728629-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051111_208526_C737F230 
X-CRM114-Status: GOOD (  13.34  )
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

Changes since v5:
- Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210 SoCs
- Modify existing K210 drivers depends on SOC_CANAAN_K210 symbol
- Reword dts commit message
- Modify dts to use Full 512MB memory
- Rebase to linux mainline master

Changes since v4:
- Reword commit message on dts that the B-ext version of c908 is 1.0 rather
  than 1.0-rc1

v4: https://lore.kernel.org/linux-riscv/tencent_587730262984A011834F42D0563BC6B10405@qq.com/

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

Yangyu Chen (11):
  dt-bindings: riscv: Add T-HEAD C908 compatible
  dt-bindings: add Canaan K230 boards compatible strings
  dt-bindings: timer: Add Canaan K230 CLINT
  dt-bindings: interrupt-controller: Add Canaan K230 PLIC
  riscv: Kconfig.socs: Split ARCH_CANAAN and SOC_CANAAN_K210
  soc: canaan: Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210
  clk: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
  pinctrl: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
  reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
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

base-commit: 8e938e39866920ddc266898e6ae1fffc5c8f51aa
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
