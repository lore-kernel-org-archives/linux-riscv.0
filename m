Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E4BCD11C2
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 16:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LBqvNLeJhO+L/cZ+UNb0YXNKRAIOEEqVBc+N30gMdVg=; b=F0ds2h7XP1HvOx
	Yawfp8tgCoiUp/S9b7VC75PVlcvnCiBwSZ37im+YA9YZANEEyTWOY+/mZtn4cL12+tfikLY3Yy3kn
	Rlv+68EFk0AiVL2H73UeHdny80AweitYeZLAEEv3mluVTmiCSi9UgUtm1sd31wgJNAWhS4lAdmR6N
	uD8ofuBxYc5Vrk7cXrzsbZR/KUgFE2ku1eUV/PO6iaMJHUtI2nmlYXx5JIm+D/mMNfoQaaVlRrr0z
	TBn95UabnBObdRTt2y/xO8JWKaBYz7Mp/BN4Fe6rpPGriNW2q4F5u78yE2Ew/BaZq2EacBX7diLN4
	sZG+ugqRdclp2uxxqx6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVSb-0000000D1oK-35CW;
	Sun, 07 Apr 2024 16:33:37 +0000
Received: from out162-62-57-252.mail.qq.com ([162.62.57.252])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtVSX-0000000D1nW-1LiM
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 16:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712507602; bh=8u+cV9KILSoHh+LKeRuUnoqayiOf2plCmWOJHizy47E=;
	h=From:To:Cc:Subject:Date;
	b=TedochOc3K0btwX6G5JlWLxFxHHnQx/nkfdHiF3Dl5mDGNShi4jKk1ntv/uBK7FvK
	 FrcOPH0bPYwH5A7pk5rzYcN5Id61aQLRlSBGx7cx1HiokiL5/m6Lo1KfVndCv0itAn
	 0bfYc/TNcqupPEbneZ2C6PBNUHv6wZSsVL6+2csc=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszc5-1.qq.com (NewEsmtp) with SMTP
	id 6CE08642; Mon, 08 Apr 2024 00:27:14 +0800
X-QQ-mid: xmsmtpt1712507234t2l6iwczm
Message-ID: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
X-QQ-XMAILINFO: Md8NwmqZYy3fDy3ETQuYENYYYUvQVOi8ulHLChbgsiQjywXmCazVr5/wXMezX+
	 ZIVZ16anZUcYC/VT70cPfByk7LRdQrl/vE+RS1n6EHK6BzHzEwAlgEGPX2O4Oru6AYE5DxkOzccZ
	 WhQUeYfjlUzLFMqjVXGddS2YnSK6tjYOrQs+AQsPbs4fX3gIvMxvcj+daf6tEjYlapEQGjJgcigQ
	 SSyRojB4O+yOu9xseyY7QvM83OWr+e6ajLPNx6WxEyAjkJdXyFOJJ6Deo/Cbb75PL8lPVgoUnpid
	 pFjpr6TlyLTkzwb4eSvQJZfoqiMnSGnjIKeAJu+6OxM1kQh3MlqhLwi1fGW87mZ3/AfmBNt5RJQa
	 r1n2f9C9GjxK5/J0eX0cIAtC6XN8cFysZSzkYphgZywYxCwNj0ERDKImGw3BvzLS+438eUGtyver
	 WQqoENcCJZwSScCYhF042MQN+KxHSdUpRDWUaax3AcTatqqWjVgMxSNv/qWpiqpi7I6QjZCNechE
	 f7zEbKqVpBwLJSVPwC8hi/JPbxeAGEYEATAKj8B15rv2/AgJYqar0gWRS5bXXVguQhAw/IvCcQ3y
	 HRk2JoJ+QsFteUvqf80NmcJlgmiHLhuHxu6x8p7AFdq8WOEdMuuNKsOsdvJE5SBff7I7SiYiIApU
	 Av2xwZFWZeEDcM7h+fPnQIKTQqrHQtCPWlyQqbsaqjtsfh5oW5IKvYjCFcc6Ekg5O/BuMw3s++zq
	 9NAhMKDpAf4mi6b4LkZl7eMDiDi0wmjiaaPoJleVJeVc7rsie637zIHg3Bks+/+PBWXEDuTaO7bo
	 UfRiQZ1n6l39Yw9q2qGxYgpQa5O1p8KQtXwWqIq5KiDkHH15OGfgAbeZiGPfTl1ElXLtxRszNvkL
	 vCIKqohNonf6XbHomSmwwZn4nXPyVQiiYaAR9Zo34La2sIdO7TlaL3HMFJC/rR2B7DczRiSU6Xo8
	 CBbc7hkffK8fF63m6v0BA+rdtw32uTiSxzTQt0iT2RHzPb2jhb+57POjfkq9Y2RHzYaRjH4Qe63t
	 JKTyDuCA==
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH RESEND v8 0/6] riscv: add initial support for Canaan Kendryte K230
Date: Mon,  8 Apr 2024 00:26:58 +0800
X-OQ-MSGID: <20240407162658.3199215-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_093334_002740_58764DBA 
X-CRM114-Status: GOOD (  14.12  )
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

Changes in resend v8:
- Add missing cc to lkml and linux-dt list and correct Krzysztof's address
- No change in content

v8: https://lore.kernel.org/linux-riscv/tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com/

Changes since v7:
- Add missing riscv,cbop-block-size and riscv,cboz-block-size in dts

v7: https://lore.kernel.org/linux-riscv/tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com/

Changes since v6:
- Split SOC_CANAAN clean up to a separate patch [4]
- Add zicbop and zicboz in dts
- Rebase to riscv-dt-for-next branch

v6: https://lore.kernel.org/linux-riscv/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/

Changes since v5:
- Deprecate SOC_CANAAN and use SOC_CANAAN_K210 for K210 SoCs
- Modify existing K210 drivers depends on SOC_CANAAN_K210 symbol
- Reword dts commit message
- Modify dts to use Full 512MB memory
- Rebase to linux mainline master

v5: https://lore.kernel.org/linux-riscv/tencent_FC10B3C630BE27412FED2547245CBE18D807@qq.com/

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

[1] https://github.com/kendryte/k230_sdk
[2] https://github.com/cyyself/opensbi/tree/k230
[3] https://gist.github.com/cyyself/b9445f38cc3ba1094924bd41c9086176
[4] https://lore.kernel.org/linux-riscv/tencent_2E60E33C1F88A090B6B3A332AE528C6B8806@qq.com/

Yangyu Chen (6):
  dt-bindings: riscv: Add T-HEAD C908 compatible
  dt-bindings: add Canaan K230 boards compatible strings
  dt-bindings: timer: Add Canaan K230 CLINT
  dt-bindings: interrupt-controller: Add Canaan K230 PLIC
  riscv: dts: add initial canmv-k230 and k230-evb dts
  riscv: config: enable ARCH_CANAAN in defconfig

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/canaan.yaml     |   8 +-
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/canaan/Makefile           |   2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts     |  24 +++
 arch/riscv/boot/dts/canaan/k230-evb.dts       |  24 +++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 142 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 9 files changed, 203 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi

base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
