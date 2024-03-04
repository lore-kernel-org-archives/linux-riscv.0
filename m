Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E0FC48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 21:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Date:Subject:Cc:To:From:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m1AY26oSUImu4JPeN5CZ07uEXENPJGdX6iXIRsN5t1o=; b=YKmlup84/HppHf
	Aa0oOz/I5LNlLV+URnNI6O4pWQU9jVKZ2g6/k49Rod0DVgfqFV0h0acnB/6lwMMVSaMI9z4OQsCU4
	ERNkSqdgymrDMTDBsr2q+N4GjPHGHn798F78qFKFhWqvKz0uG3tOtV4YE2Zem/x79wtCXbCmYoP2V
	qCJh94UWVGUJpmZzZPLDB6Jqy3jYIdRd4+wlLTOjJDeswCdocbYLSyEhtB4MDxECGlPNXPJu5sS3p
	dmNPYQHZQdGcwOcq8UOdFVyqGCStcT/gZnol9HN9ufQ+cICYyfoDiqoR/wvPgvoQPjTOkFngZ1ZH/
	glae7hjoBXtc2v3smGLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFUQ-0000000AhHN-3FQV;
	Mon, 04 Mar 2024 21:04:50 +0000
Received: from out203-205-221-191.mail.qq.com ([203.205.221.191])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhFUM-0000000AhEr-2mla
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 21:04:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1709586276; bh=GFMJlJjTlI/YnjqaRDuRJEvR/O/AOIAkbGZdzMRZ1v0=;
	h=From:To:Cc:Subject:Date;
	b=Y9XH6vec7VecGyC+qUpR5WS7gAphXv1mDq3MeWyze30OlEeSV8lRbv/FJXi7aeghm
	 LJf+8yHAkIe2DkLhFUdPiqWfYZRP7wPbFi++duJj8Gf/9esBp0Bz5s2+HUJ6O4JEuY
	 KpbueOpbM9pEB81kn7QrNGNXrVRjepSGsaqA9reo=
Received: from cyy-pc.lan ([240e:379:2240:e500:994d:62ab:74a6:932b])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id 11F9664F; Tue, 05 Mar 2024 05:04:31 +0800
X-QQ-mid: xmsmtpt1709586271t3nxb2zjd
Message-ID: <tencent_BB2364BBF1812F4E304F7BDDD11E57356605@qq.com>
X-QQ-XMAILINFO: OOnbKU/qCQQlTfJAqINLSh0d4KoIoE+5EG42uJPeTXDuDxpVHH4R5nzqxk1Ct5
	 NW7LDGxcpXuOVjHMhG8ahYOt/uaDlZzhmWYtv+/b2580LFjJJ9xS4+lr6KmiiYri0Bke+VWzYxhy
	 sPqdPDEcfzc341a9H4kUVehG5L0/ociq/P2j+GnN8gkPhcxzkbpQgbo7NxDP2kGPLeAwA8bPWwVV
	 p6fJVOv1KFwUc7WukryBd07MbPSMEwNrTEGbvLr07Z1CQjk5aJZ7Gri89VxKv0X2jxXJJpZA3kV/
	 s54fnlvwjfare/3qqfxBkGS4oRU+yekg3anKR8VdvdE5S+A7y/GX+AXDvLwB9TpsKZ9zg8uHQ/QW
	 /Ii7c6QOKtY03P+NoPalujMCajnQsLk9PermHgKU+F6WiY3U+aeyt09OST52VALFAGXLnZfinU3a
	 z1w8wh5pk6ZFQyqEIt0qI8n6PWpTNj+JZVYyi74e8rL/G2GcWeeZO4bAJekU9m+K22E94hDKbNDZ
	 v4KwIiiMfHmFhn0uggiLcnMvv4aY2a/9ScF3K7PI6AkyQJaunwaUjX33EQAgvTOipfgw5dU8rKCP
	 v+ox8MaJnn5eguzT+ikx7RbczyZxXdvIOsmX4o33pke+xFK0PF4hv/7VXvA43t1wHp+gHFtBioro
	 LawTYZXJeGy3qcef21pbQVQBqHBL/XaDoAa/6XFw9lDi2Ejw1pOjuBS8kA9eRVlJoeCQUo2lE0/7
	 w2xsFCzoyvB0YRmk+leqY29Fw7UQFkAtiQrSsLJeJduZqkvvztOCk295T+SGpDROGFrVHjxKf2Bx
	 4gtlcVpwz1fnPEKnAHhSVMatX3MSMHF0Q80Py6nhArxU3B1fynNJkMUx9pCgHs0eKP71Bhfij/p4
	 ODic4vcVBJyH2IEnrtVudlPX4TzFPiz4g9A5gNU/f84w2kWws5JkLc5hcFG4d1rZ9jSJ8Lcp5WsG
	 U0BewuP0ZT/Jvl0LzYg+byRNH6ZF5NL31PjksCgaY7pLEPyJLrbtSuFUAPpAQh20oGvGu0U2/cWW
	 zF1OhNdhXalt1jbpHt
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
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
Subject: [PATCH v3 0/7] riscv: add initial support for Canaan Kendryte K230
Date: Tue,  5 Mar 2024 05:03:21 +0800
X-OQ-MSGID: <20240304210321.777296-1-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_130447_121229_0FF785B6 
X-CRM114-Status: GOOD (  11.22  )
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
  riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for K230
  riscv: dts: add initial canmv-k230 and k230-evb dts
  riscv: config: enable SOC_CANAAN in defconfig

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/canaan.yaml     |   8 +-
 .../devicetree/bindings/riscv/cpus.yaml       |   1 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/Kconfig.socs                       |   5 +-
 arch/riscv/boot/dts/canaan/Makefile           |   2 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts     |  24 +++
 arch/riscv/boot/dts/canaan/k230-evb.dts       |  24 +++
 arch/riscv/boot/dts/canaan/k230.dtsi          | 140 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 10 files changed, 203 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/boot/dts/canaan/k230-canmv.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230-evb.dts
 create mode 100644 arch/riscv/boot/dts/canaan/k230.dtsi

base-commit: 45e0b0fd6dc574101825ac2738b890da024e4cda
prerequisite-patch-id: 2374c56c0032e616e45854d2bc2bb1073996313d

Dependencies: https://lore.kernel.org/linux-riscv/tencent_88FEE0A2C5E0852436A2F1A1087E6803380A@qq.com/
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
