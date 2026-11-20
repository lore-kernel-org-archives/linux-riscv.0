Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACCDE60A2636
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:16:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DGVMuAvu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NaViVQLj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id
	:Date:Subject:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=HxjdJgW8SWrRrsDq3IiZq4q9pzu7Rw4uGs+oWMRxaiQ=; b=DGVMuAvuHkX7nSQNbtKBChk5Qm
	EKULDf39HeElL5h3IxyUWyaLdql7z/uqxL8rYXAQU2Ksl3q8kxBGhRPrEshbhrOuxg65vFAhairYJ
	VDaRLkfeZpUK02UwAV6VWoTMUSB8aifNldpC4EGRhC5AlVR0mc5C0Zy9NzlAbdo1fHyVA2qiyNJzF
	sVaqqhyTfSOM0CRHqXOaYnrtlqv4QQ0Lc2nVxSYtSyUydCr/rTz7pk5fg+VDzNFUqXksrAuDoRwMd
	7QFda8dvqRPI+CpZ4eWbIgg8feNfGzYHmI4unwkiGBDI//t0+r9lqE+25YAnBTdjr25XmXQHFJ0yi
	TxcZJE/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU69-0000000G2Bd-042Q;
	Fri, 20 Nov 2026 19:16:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU67-0000000G2Ay-33fJ
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 10BE945BA6;
	Fri, 20 Nov 2026 19:16:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202194;
	b=KfYqYngWB8yuf2b5mbaiE63LJ7h+MYhCJi20Y8sGvxKVA6Z/2NUNWwWxJOHYoONtPK1j
	 AZKwhaoHcH9J/Da4zU1MV/ESagxdjBIj4UKjjdn7bmCUv3ZOCoAy+YHAo9+PqNBWSX4Zg
	 m0d5w97Sa1vX03vAK2d1HImZZ+1qafgtRWdvixo2uJf5kWWc3w3WpeOCngbaOLuFMC7LB
	 dzrnrGupalRgi09UvgsC8CfEPNLR1rDgii4mjRs+EK9JN0jLw4oFuYzqIioCGgwKxppxy
	 cq8luU9YrttgX56cwN5XnDD28sF3WwsHjTrcs8dyCLuR3ZFeXijCSPuE5l2f7RvPxww==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202194;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=W8gTM2R68soDFlecUjgJafiNgdZI1Ob9edjEYulcI8U=;
	b=p0YBkR3BDy6XhMiVn3LljfbuFyb4lzq1qs29wgHKA5ycvxBO4nnqpVSuUwz36MgSPZch
	 MdyCE4K/bj1TAtIcfxkYZgHY+h+4XfFoWzKX+4cfzv2Hc68OCKcMySOX+b+0tubOvBeRx
	 sZNJr61PMRnOerzQcTYdGjFLtGh/yoRoA24DY7oMendRuR978VkFJPayOIIcEZJQn78F9
	 WIVrp2Cp3FjjLLS3sdTyhR1EbxICbihNLJ3+EITQ4wGBOWIdoRHj6zY6LBDce/oICvy5f
	 NpOZcAdka+w5IWqMWzol4KfTwI3TCp/c8QX8re3pwEVlK49shTyKiLW9Di1OlFqjvpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 719001F000C4;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202194;
	bh=W8gTM2R68soDFlecUjgJafiNgdZI1Ob9edjEYulcI8U=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=NaViVQLjbdwoFrIB31/thSFVtAo5QDSvnHMaEBBejSQbBJGXSUnnMGzHbTOrvWnVw
	 Y/u//TOj+BUv2HNdxymplj5tmQ0xVnxbrkcDkD98VEW/qDAnPSrkT9lFwI0Aj/ahby
	 y2CCWZ2ukptHsdvVPTOdyzES4PeqAQRLmohN3BUVheQAHJPtPl8ToDSKWGlhsKrYGh
	 FSVh3YtljN8Te7JU27z7Zfhao1YUVQi1BWmEYfmRMsPJKEw8Vh2RB1OIVx25SWuveb
	 /c1CSGz1NpTJA2PHbdUfdSiaan+UVr5Vlka7aeI9q+3ErrbBHMflnAZINcLxPeoRwk
	 7l27ZZ0roiB+A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E507E4B9BA;
	Fri, 20 Nov 2026 19:16:23 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH v4 00/13] riscv: add initial Zhihe A210 support using SCMI
 clocks and resets
Date: Sat, 21 Nov 2026 03:15:46 +0800
Message-Id: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22QzW7DIBCEX8XiXCL+AtinvkfVAyxLTVXbCThWq
 yjvXhxHiitVnEaaGb7ZKymYExbSNVeScUklTWMV6qUh0LvxA2kKVRPBhOZMGOoEZ7TAkCiCFDG
 AUNppUv2njDF937ve3jddLv4TYV4LVkefyjzln/tnC199//UunDJqVDhaQHv0wb6mAq4cHBxgJ
 GvzIp9ZzuQ+K2sWUXvJj5bV9zd727Ayni916byxPod2zaOy4uRha3QZehrwRFvt2tZL4QFcV+n
 3F9oHV5ZTGmHOX1RIywy3MkZtHxnvClKYhiHNXePQeyOMUkYrJplidbQAzZWxIdqonPGxhSAr+
 e0XDhLsCqsBAAA=
X-Change-ID: 20261027-a210-scmi-ec32fdc246a6
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=7129;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=lqQQZsmh7z/jLRUiU/fSX7fnG0u7E2nrCjbbcwK/kTE=;
 b=6/KX3D3WIGj1+W5J+xmneyfZ23Lu4iIj+nsvOXJudQ0ibpafNxwYfY7vXxjNP1O92twHAN2O7
 hxDWA3sDqi4CWkxj9aHpd93AXi7cAPIIiA1v7gi80nMy7z6wi2tt632
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This adds initial support for the Zhihe A210 SoC and the Melon Pi V1
and V2 boards.

The A210 has four C908V and four C920V2 cores, plus an E902 management
core. The E902 firmware handles clocks, resets, power, the PMIC and
CPU DVFS, so Linux uses SCMI for clocks and resets. The only new SCMI
piece is the mailbox to the E902. [1] explains why I picked SCMI over
RPMI.

The series adds the mailbox, the UARTs and their bindings and DTs. It
depends on the arm_scmi Kconfig patch [2] and the pin controller
series [3], both in linux-next. On v7.4-rc3 with the riscv defconfig,
a Melon Pi V2 boots to a shell on the serial console with all eight
CPUs online.

Conor asked about vendor firmware. Zhihe has agreed to use SCMI.
Optional native clock and reset drivers will be sent separately and
need no change to this series.

The E902 runs a Zephyr based SCMI server [4]. The rest of the boot
chain is coreboot [5], OpenSBI [6] and EDK2 [7][8]. The full Linux tree
with the other peripherals is at [9].

[1] https://lore.kernel.org/r/20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn
[2] https://lore.kernel.org/r/20261107-arm-scmi-arch-dep-v1-1-514872e8ede4@iscas.ac.cn
[3] https://lore.kernel.org/r/20261107-a210-pinctrl-v1-0-6ddedfb0b76b@iscas.ac.cn
[4] https://github.com/RevySR/zephyr/tree/xuantie/scmi-v3
[5] https://github.com/revyos/coreboot/tree/a210/scmi-v3
[6] https://github.com/revyos/opensbi/tree/a210/scmi-v3
[7] https://github.com/revyos/edk2/tree/a210/scmi-v3
[8] https://github.com/revyos/ruyiedk2/tree/a210/scmi-v3
[9] https://github.com/RevySR/linux/tree/a210/scmi-v4

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
Changes in v4:
- Rebase on v7.4-rc3.
- Drop the RFC prefix: Zhihe has agreed to use SCMI (Conor).
- Split off the arm_scmi patch (Michal) and the vendor prefix and pin
  controller patches (Conor) [2][3]. Both are in linux-next.
- Link to v3: https://patch.msgid.link/20261103-a210-scmi-v3-0-ee6b31580808@iscas.ac.cn

Changes in v3:
- Rebase on v7.4-rc1, and add zhihe,a210-uart to the list of DW APB
  UARTs with two resets.
- arm_scmi: drop the ARM dependency instead of adding RISCV (Michal).
  Build tested on x86_64 without OF, i386, loongarch64, ppc64le and
  riscv64 (Sudeep).
- Move the SCMI clock and reset IDs from dt-bindings to headers next
  to the DTS, as the firmware assigns them (Conor).
- mailbox binding: use fixed "local" and "remote" regions and add blank
  lines between properties (Conor). Drop the clocks, as the firmware
  keeps the mailboxes running, and call it a mailbox, not a doorbell.
- mailbox driver: don't request a shared interrupt.
- pinctrl: rename to pinctrl-zhihe-a210.c and PINCTRL_ZHIHE_A210, drop
  the 64BIT dependency and a forward declaration, comment the register
  layout and the ____ placeholder, and round drive strength up (Linus).
  Don't include mod_devicetable.h (Uwe).
- pinctrl: drop PERI3. It comes back with the SDIO controller, as pins
  and function, with the shared mux handled in the driver (Conor).
- pinctrl: use one function name per kind, like gpio, spi or pwm, and
  number them only where a pad can pick an instance, as for the UARTs
  (Conor).
- pinctrl: use pm_sleep_ptr() instead of #ifdef CONFIG_PM_SLEEP, and
  don't use dev_err_probe() in resume.
- defconfig: drop SRAM, the SCMI mailbox transport and the SCMI reset
  driver. SCMI maps its shared memory itself, and the other two are
  enabled by default with SCMI. Shorten the NR_UARTS explanation.
- dts: use 0x1000 regions for uart0 and uart4, like the other UARTs.
- dts: describe the PLIC M-mode contexts with 11 instead of -1.
- Spell the vendor name Zhihe everywhere.
- Add Conor's acks.
- Link to v2 (sent as RFC): https://patch.msgid.link/20261027-a210-scmi-v1-0-74d58ce85bd8@iscas.ac.cn

Changes in v2 (sent as RFC):
- Replace the native clock and reset drivers with SCMI. Conor pointed
  out that the clock blocks were not modelled right, and the E902
  firmware uses those registers too.
- Add the AP to E902 mailbox driver as the SCMI transport, and allow
  arm_scmi transports on RISC-V.
- Add dt-bindings headers for the SCMI clock and reset IDs.
- Add zhihe,a210-uart with separate APB and serial resets (Philipp).
- pinctrl: take the pad resets from SCMI, explain the SDIO pad names
  and the shared SDIO mux bit, and order pin nodes as pins, function,
  then config (Conor).
- defconfig: explain why SERIAL_8250_NR_UARTS is 10 (Conor).
- Link to v1: https://patch.msgid.link/20261022-a210-init-v1-0-5e438f972d24@iscas.ac.cn

---
Han Gao (8):
      dt-bindings: mailbox: add Zhihe A210 AP to E902 mailbox
      mailbox: add Zhihe A210 AP to E902 mailbox driver
      dt-bindings: timer: add Zhihe A210 CLINT
      dt-bindings: serial: snps-dw-apb-uart: add Zhihe A210 UART
      riscv: dts: zhihe: add A210 module memory
      riscv: dts: zhihe: add Melon Pi V1 and V2
      riscv: defconfig: enable A210 support
      MAINTAINERS: add Zhihe A210

Zhiguo Zhu (5):
      riscv: add Zhihe A210 support
      dt-bindings: interrupt-controller: add Zhihe A210 PLIC
      dt-bindings: riscv: add Melon Pi V1 and V2
      riscv: dts: zhihe: add A210 core support
      riscv: dts: zhihe: add A210 UARTs

 .../interrupt-controller/sifive,plic-1.0.0.yaml    |   1 +
 .../bindings/mailbox/zhihe,a210-ap-mailbox.yaml    |  67 +++
 Documentation/devicetree/bindings/riscv/zhihe.yaml |  27 +
 .../bindings/serial/snps-dw-apb-uart.yaml          |   6 +-
 .../devicetree/bindings/timer/sifive,clint.yaml    |   1 +
 MAINTAINERS                                        |  12 +
 arch/riscv/Kconfig.socs                            |  10 +
 arch/riscv/boot/dts/Makefile                       |   1 +
 arch/riscv/boot/dts/zhihe/Makefile                 |   2 +
 arch/riscv/boot/dts/zhihe/a210-clock.h             |  15 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-common.dtsi |  55 ++
 arch/riscv/boot/dts/zhihe/a210-melonpi-v1.dts      |   9 +
 arch/riscv/boot/dts/zhihe/a210-melonpi-v2.dts      |   9 +
 arch/riscv/boot/dts/zhihe/a210-reset.h             |  13 +
 arch/riscv/boot/dts/zhihe/a210-som.dtsi            |  11 +
 arch/riscv/boot/dts/zhihe/a210.dtsi                | 593 +++++++++++++++++++++
 arch/riscv/configs/defconfig                       |   7 +
 drivers/mailbox/Kconfig                            |   9 +
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/mailbox-a210.c                     | 176 ++++++
 20 files changed, 1025 insertions(+), 1 deletion(-)
---
base-commit: aebb7274476403040d582c61478df8f4a7bf9cd3
change-id: 20261027-a210-scmi-ec32fdc246a6
prerequisite-change-id: 20261107-arm-scmi-arch-dep-96a99b32bcca:v1
prerequisite-patch-id: 981f1fd764edde0f9902e6becb276d211172265b
prerequisite-change-id: 20261107-a210-pinctrl-23807183ff68:v1
prerequisite-patch-id: dfda8df6ef73c046f82e5ef8e0c3067d297be8e9
prerequisite-patch-id: ac6f52bb69590d699edb945066f9f8834346ffcd
prerequisite-patch-id: 3dfa6ab6be440f78dceaf873a9e79782872e0265

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
