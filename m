Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFBD2CD1284
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Apr 2024 01:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tPmyB7I7rSpRb4wbqAHQLGMQxprnQ4Ks6vDx63Zt/vk=; b=Z8O6cubbqxQOxu
	kZAfgeANMZeDut/CDblQJRCTQUvv0YP8l4qmAZNrR0m2uv3CXSw7aQj7ouWlJI/Kyc+RST7hWNbZx
	dZQuI4/D29cJin9jf83UPg7pBb6wHBB+r6CFxLGBBVPahBd024AAovkGxXuKiHUFphBJg9GQBzVNn
	ulnAOpq24JhKImSZdxca69FVyXGvaRE/Ow2uK72oMEhiEuAjWZ9Dvz/JTUAT6W/Ru6HHvAWIRJYhG
	y/id1gVVGmwHfXm6PJpN47T/Zt9IBqaxX0U173bmKkWwyxA1rxkRfQePxNYLt/KJz0u8fu4t4JjCd
	cuRCTA/dFyPMA3mERC2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHLO-0000000BOFm-06vk;
	Sun, 07 Apr 2024 01:29:14 +0000
Received: from out203-205-251-27.mail.qq.com ([203.205.251.27])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtHLJ-0000000BOEr-10WA
	for linux-riscv@lists.infradead.org;
	Sun, 07 Apr 2024 01:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712453333; bh=R30DYWI2Oc1ki/vS0DoXCyKd6wlS7oxyHQ43veszfbo=;
	h=From:To:Cc:Subject:Date;
	b=AbPTHG8jdem4z2viS4uASBzXnzIZy1R9NgKJmgqVk6YmC/+jxuzUC5iTxg9etoHC0
	 DNtMgUcNHYCDIGugYlqvCB1Sy0tebQNhUNJvBXGAPA946IzzA03PkTY5hqTiLzVpMw
	 dPVPQ3L3lV+84lsGdLRvIu31mfD9jiIGVOk7uFqg=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszc5-0.qq.com (NewEsmtp) with SMTP
	id 730BB6C8; Sun, 07 Apr 2024 09:28:48 +0800
X-QQ-mid: xmsmtpt1712453328te74up2fa
Message-ID: <tencent_9F423E3DC13F6D5FC7415C89988490F04607@qq.com>
X-QQ-XMAILINFO: MmpliBmRb3iCDSzsEAV2QCToiDNrhLsue84whWs8W/siOmqi5xnNSYjdgmC4nG
	 a04IFwfzq+LnUPfaXyMaAOWO5B6j/kiBrtUJLZMBwx9j1fO931FucoybPhCHdw5/x4fQsp8j9GnL
	 vgvnNJ+Nktuj7j1chsr+ARVzAuhvQwv8YjskUUwQzpTIaLWtF+oYegNP/nuzLdKyQkKJ3PhIiP2W
	 LnF+qII/JCssrLVyoGOSdHkXiVxIl7e84HSduPXadVryJlmiFkrb7UnVSB8BdjsBRtCsYx+O+NN4
	 i16mBAP3/IC9043hD22E3OLIX7Gv3wXONpc6cq4UUykB6e/JNGgaP5ePZT9Iaz/mYrhTtUGWwC27
	 aKdfNwVfcVtJbr5KlTxW0qpR3sKEmWXukRj3jYfcVZqePdut14bTUBAZ/YUeuRkhsTQVDyjhaKyJ
	 u+RsnLgsQaZOncdVzhBIPtCVgADULo8IkKkN1t7FcmxmVIW+/aCacraiJENs/KHjprKrlDPgym5c
	 C9J6cV+dXCURrLLVPYjRFn4i678BBOlMvV2yh9vhVMcR+pH5B5d/Zzzz5MX9y92rQ4J8vJ4gfod2
	 SpHzQ+ol16/CEV1QF1Yv1MZQnd6IXEN0NZNh9uXGiEUqGZjnW3XBCqAai4qHNRlovQq6IF5w7CLY
	 hLmLKDVycQAt+7k/BEiVZA9ZGYpEx+eCAI65EJlWzL0y3AMy33plW9HyxljwKYhdMTmr2/S1E07H
	 Nm+iAlY7SsTQDQ2amzvebNFsAHKFNhKpB++JkpvU9NyNSmWSYUH2gsP9u/MDTOjAKV0eOcA2y0b7
	 tw3fy9m8GlkUdPpYl5ayfl14TTGsXSXcmZcIDxtnSeJopi1XLytQAA4e3OD/13JB8o6EDYBepWSb
	 VKkITFoyXgDCqR3+tcMJMjtkIyZOixCgidUWFKbmQxKxS5SjjZvsOKwp56Jr5MgeYZawiEW0sJGV
	 oPIwpsJmh2EyrlNfXoPBMsHR1uwIX7YhEJkfaNYHXxzQSGHqaSFcmZVAz1vJgTFcA5GfCsxocCEy
	 c0VE4cSQbeZvjRpAbnFSa+8aV9gmE=
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
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
Subject: [PATCH v8 0/6] riscv: add initial support for Canaan Kendryte K230
Date: Sun,  7 Apr 2024 09:28:37 +0800
X-OQ-MSGID: <20240407012837.2996164-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_182909_915083_57BDC52C 
X-CRM114-Status: GOOD (  13.80  )
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
