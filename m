Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 648A8C3ABB2
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2024 06:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CWUlYgwXtG7B+i+ny0GL/t3x3bUB2oYNxXcK4Yu8ksc=; b=RIoAZlC/siu52L
	geFFOp/Gwjq57R/NHaouio9sw5/BuozgBxiT1dJs6QjQt7EYO9g5tBtqw5xnTw14X7WYLMint9Oz9
	2C21C2zhJSd5pV8hZZtskscShrDW91MjwxtHeK8zn2DX8uJR23bZbQQ4ZYjYJl/2QegUNU0xHYGLL
	zpwjPTc856vP5ktGgjpmzvEMyqEOhpyAfl9rx3U5+sU30Lj8Bp4aCP9S7p7k+t9eQLBh+yUhTZrf/
	EKmQZEgTdwYYHUa29+HuvJ80B5/KupT5Xt2wfmnNNz8PQDqOEl6DNgkqjHD63teT/6Whi/UccDiSH
	gFQzBafCOEf81szGcs3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5Jx-00000003CIW-0yvJ;
	Mon, 16 Sep 2024 06:34:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5Jv-00000003CI5-3rez
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Sep 2024 06:34:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1Tm0XDtxf0Yguf+xgj8TAvMZ8SsZAM4lNoTmcDL2Y8o=; b=j4Vh5YqcCu9wKN4lCbP1rGLgz3
	XXepMla4V3IZ6Pz3KWsA/sZ9X43UDpaerFkaVQSdfFKYlQ+UDikixMwWuOMPD39ztifoWIg9X899P
	ZI4AJF39g0nG/P/GndeVgXGBQnyiZGc1SpO6vCtDcdZyuZJ3G/zw2R2KcoQIb5VM5N3+3g1SwKzHg
	mv387eC08OQC2UR6Wm7BntX00sd6MpAoWmd64urlZjHHWIrWJ1KkrctAtB4TRhGTkjMdIZVbK8bj6
	LJ92tXdnCvj3Dts6YZM43ZF+75Iyqm5vteQF8v3Ht2eONHE5mTvf/Y373DrUhLpVXuOAB7cQMuBUM
	MVryj+Sg==;
Received: from m16.mail.163.com ([117.135.210.5])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sq5Jp-00000000LvA-14B3
	for linux-riscv@lists.infradead.org;
	Mon, 16 Sep 2024 06:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=1Tm0X
	Dtxf0Yguf+xgj8TAvMZ8SsZAM4lNoTmcDL2Y8o=; b=li4f2R9ru9FkjQp7ed2RR
	XPY4x0DaY6TMZXOQAbHUHX9X5dgWsiRWHdtzTDT66XUyej/FlB8uhJkoRUpTZphr
	v/tzr9HgTYw75PDqfABy+F1flIZgum2HpXHz2y1QJ391BCyl84bInttvK8HjR3lh
	8ojhu7jWZWRcidj/1GoDPs=
Received: from jean.localdomain (unknown [27.18.168.209])
	by gzga-smtp-mta-g3-0 (Coremail) with SMTP id _____wDnL2pT0edm2LOeAw--.31222S2;
	Mon, 16 Sep 2024 14:33:56 +0800 (CST)
From: Ze Huang <18771902331@163.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ze Huang <18771902331@163.com>,
	Yangyu Chen <cyy@cyyself.name>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RESEND PATCH 0/3] Add initial support for Canaan Kendryte K230 pinctrl
Date: Mon, 16 Sep 2024 14:30:21 +0800
Message-ID: <20240916063021.311721-1-18771902331@163.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDnL2pT0edm2LOeAw--.31222S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFyUGw1fKF4xZr47uw43trb_yoW8Kr4fpa
	y3CFZ8CrnxJrsay3ySya1q9ryay3Z7Ar1Yg3WYkr9rJF43Z34DJwn3Kr47ZrZ8Gr45ZrWY
	vrs5Jryxur47Z3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piL0ePUUUUU=
X-Originating-IP: [27.18.168.209]
X-CM-SenderInfo: zpryllqrzqjjitr6il2tof0z/1tbiNxdcomXAnRk5IgAAsk
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_073442_488714_21D99992 
X-CRM114-Status: GOOD (  11.76  )
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

Resend the patches to the same thread and fix incorrect patch ID.

This patch series introduces support for the pinctrl driver of the Canaan
K230 SoC. The K230 SoC features 64 IO pins, each of which can be configured
for up to five different functions.

The controller manages the entire pin configuration and multiplexing
through a single register, which control features such as schmitt trigger,
drive strength, bias pull-up/down, input/output enable, power source, and
mux mode.

The changes have been tested on the K230 development board.

The pin function definition can be found here [1], and most of the DTS data
was converted from the vendor's code [2].

Link: https://developer.canaan-creative.com/k230/dev/_downloads/a53655a81951bc8a440ae647be286e75/K230_PINOUT_V1.1_20230321.xlsx [1]
Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/uboot/arch/riscv/dts/k230_canmv.dts [2]

Ze Huang (3):
  dt-bindings: pinctrl: Add support for canaan,k230 SoC
  pinctrl: canaan: Add support for k230 SoC
  riscv: dts: canaan: Add k230's pinctrl node

 .../bindings/pinctrl/canaan,k230-pinctrl.yaml | 128 ++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi  | 316 ++++++++
 arch/riscv/boot/dts/canaan/k230-pinctrl.h     |  18 +
 arch/riscv/boot/dts/canaan/k230.dtsi          |   2 +
 drivers/pinctrl/Kconfig                       |  10 +
 drivers/pinctrl/Makefile                      |   1 +
 drivers/pinctrl/pinctrl-k230.c                | 674 ++++++++++++++++++
 7 files changed, 1149 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/canaan,k230-pinctrl.yaml
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.dtsi
 create mode 100644 arch/riscv/boot/dts/canaan/k230-pinctrl.h
 create mode 100644 drivers/pinctrl/pinctrl-k230.c

base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
prerequisite-patch-id: 2401703b57448c9ea2c3dc7650b4502491a28944
prerequisite-patch-id: 50ccf1104191cdf22f9077880d3dc781b190a3c8
prerequisite-patch-id: f8b983b301d0c14f1448b9e4c321262a509e061e
prerequisite-patch-id: ced4a01ccd8ddab2fd308d543ddf47bd1641518a
prerequisite-patch-id: c2144cf468c57b856830a61615ba6ba501e8ec58
prerequisite-patch-id: 704efc6e76814e1877748959d7319d558c8386c1
-- 
2.46.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
