Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B3B6C67861
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 17:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WKiAm5JaN21hSvAwL9yWs/0JzspZNMo293+7o5SoWt4=; b=2sw09oTZpPV4Ol
	2py6qUjo/tOPA0SOefHz4qQFe71yXVj3SDb+fXawjc3RCl+B83f69auntefcDXaajuIjSeKXh/z0i
	zAbH5xG+rdnBDH4OGctBQ8sezuzxTQnVhta9N2ZzpzTDpIUMbSVGE0aOPJttqqroBJAl+AGXp8PKW
	pgO900iwKhGF/cGBKyXK2VNfKN4T69P/Xv7dZ80+fEJev9U+qM2JMVoPrU7NursKC/5RZ6P1w0DUs
	GUpIi8vqtByziqwmjpl8HIXxtwX7SJy8UXHDF64M7cFtnLXWkXldhEtN9Zqn0s85ICa4KyCAsrURJ
	KfWSuCdSP3qLfgWLP4SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA1b-0000000Al0K-2pa6;
	Sat, 06 Apr 2024 17:40:19 +0000
Received: from out203-205-251-73.mail.qq.com ([203.205.251.73])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA1W-0000000AkzB-2R7q
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 17:40:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712425205; bh=3/X8lHuqA0b9WQcGvTnUTxb1j5H1yHy9VZi0aHbyfbI=;
	h=From:To:Cc:Subject:Date;
	b=g6k7Mdy6psEXmPQ8Sr90HRkoCRghjA7JRMxB5XWZIhm/c96kooiAB42Aqs7Kl1vm0
	 yOa849ScHeJ7kRfjsov/RpuwhfKj8Y5D0ELUwxK3uapxn6ntXYx7xvQie1le9qLUYe
	 sQ0oEWJM4D72cvSyvDocbRxYLlmqa7rFZezDmgYU=
Received: from cyy-pc.lan ([183.252.3.222])
	by newxmesmtplogicsvrszc5-2.qq.com (NewEsmtp) with SMTP
	id 9FB85EA7; Sun, 07 Apr 2024 01:39:59 +0800
X-QQ-mid: xmsmtpt1712425199t2mmm38w6
Message-ID: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
X-QQ-XMAILINFO: OCYbvBDBNb9r22zziWmT76u1LAi3vSdr1QbNDlXtseepYWug2wtoNjvxr/YhZW
	 9S0Jl5OFRCnhSnnKjvUUhp5+n8e30xK0htKgFxFPbCdOqOaSa5kSHIFfU/KGwzEYOrZ0b4CPw4+l
	 Z9nbP7WiyDw84COBLNw94COObVbMJhnuFmvc5/jKtUhu66SKWbCjWfppva50mQdPHNdvSA8Q8u4V
	 G2ZrsVxouHsdIbQNhiIzR0xE86SfZgjDVrCirN9jIVieGDGhn7aWagvIdx6bysFg7hA5XksgfLqw
	 GCP8nFAvYgcyRejqVPA5OE7/RbFDNxxyaNrQyvUP41/pyj38n2gSVtgT+VDeNjKBiEqrsKf/IzK0
	 u4paoBy/OjfYX+og6/z01pRrwlDRkY91oAa5vYyd6JGNpJGRMcWKLTuPlWv3KssApo3uGYW57IDk
	 MNrfT1dxLiaakEhHTnupLQsXjPuYl4AYGYxexQTicKDzp4v7KrTRFRYLUmmmpakrZX2ecdh+y4wc
	 elc7jRF+xsRw5MZjfmnSooFH0TQKTUkRYOdMhAObx+2zEMPVlP4EqLNSrBYI34F8qjEHuOcbUQqK
	 eSsrMHIZBHN+r2x7/MRsyCcfatDyQpXizZrBb7qhDQ7s5JCPIFUeOkCXoQxtBhV/+JhkRcgIMOXz
	 JwHjGbMEs+XdWkoE7YT68HGUAuzWLX5EiSr8gHQX8WKGeqijU8FlJlygit4ebgOBVHctoPJ+LwZu
	 lKT8TdQvD89tNlurKHEkxIxyO9lrQ0/iv9Hq7d4p7otCcfXpY2QsY5h0ZxeBk4GPD01M2yFFxBUT
	 LwY5xFlMxr677BsVseqhY8htclsS4CcZTiPRuIyZBLqRHADmLDDj7tdvqjbi+jrk5hncjX0SYU0I
	 f543a3RlYH6CF37Aowv5tA02rkOQQxhsqkcT5g6UhmofD214oaA6tdlb+UdLDwHLzILcpMg/qPu4
	 T8f1RRlB1nyNrgTJMYRCa3hcdcFwHEUgZcvsY1L7MhJlo07P7lFarug5q/LBj4k1lENawVKCo=
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v7 0/6] riscv: add initial support for Canaan Kendryte K230
Date: Sun,  7 Apr 2024 01:39:24 +0800
X-OQ-MSGID: <20240406173924.2944558-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_104015_327608_8884A58F 
X-CRM114-Status: GOOD (  13.48  )
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
 arch/riscv/boot/dts/canaan/k230.dtsi          | 140 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 9 files changed, 201 insertions(+), 1 deletion(-)
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
