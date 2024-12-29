Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A904AE7718B
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Dec 2024 13:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6rU+CFw38T59kwd4H7Xmec3ihOSOIwpLyaitpuAmCKU=; b=y5dKQNFedj9nSJ
	apSI4j/NfP5iQyFpEZoVmA7XUqhlh44NapjOWW2kRUHaXBOPDN8m08bdc05OjLqEkEoDxev7p5Wi6
	emJwVM6XUnx2aOySCUTkW/exBm/F10ic4GLCewGSupppnkwBvLZneGfbfmUcoKGHUsw9FVax7Dk1J
	YhMEmKNiF515XUPZrLdXnLaWPosQZg/7tXH4HeVOfNahWqd+pCyNYOsUDoYfNnF3d637VNKoTRDvU
	t9lyQUNXJkcnaCVbKrvcTAKsgv2rzkBG90ZD5RXG1fDVCMkL45lVwInND88tVFv4IswrHpWt5W55Y
	QSXaGUcKcKL5tIicHp6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRtEp-00000003QeB-3iR6;
	Sun, 29 Dec 2024 13:21:47 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRtEm-00000003Qdc-3AfM
	for linux-riscv@lists.infradead.org;
	Sun, 29 Dec 2024 13:21:46 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1735478499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n3827YCQ90OjtH1qeBS452G1wDsl09TQlhPgxUv/msb/8EjqUE/GQXB8lm95C71PLSjdrCtVQaCMjog7eIxevVAyGIPXwqjX29ku1889Crpcn0P9v5XCsAA12ONTIkNb9LsFXc0nqNTCUSPeQOyfDn1WYmCSEDuFTeNGHP+ZHhY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735478499; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AjIqxlfqfeaHFhz5gbRv+vJZKDqzBfyGpsdRttHWgcE=; 
	b=Vo+HChFcsVTmzvXCaMJHvWQUWiHjzfF1bqZ3KBPF7cvOFVnIm+39PiuIljvdXu6ZP2IaymJnsiPfygQmOp/CZYc2BhJkhZ9bEtgD/zVwQagkjZnwKqPd95tyzydFQlmoBOjSUJMd84gUbcTjTty2s0ppVfisL0cqDfzGVLO51AY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735478498;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=AjIqxlfqfeaHFhz5gbRv+vJZKDqzBfyGpsdRttHWgcE=;
	b=NmEuHmajTxltOE24eXb7tpkHYzq+kFk98TcH8k4IbzJuV4RrB3ZDzAdEoRtJSrf5
	VkLWZZXXjlm21nbcof9ldZat012ilkGDxJEavPs4f4xK6HRjN/V+/VM7bOEfjLxzpbl
	m5Bs7/Zm30xWWHjWTN0UE7XJb7RYidkcY9uNYBls=
Received: by mx.zohomail.com with SMTPS id 1735478497781153.95017233760746;
	Sun, 29 Dec 2024 05:21:37 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH 0/3] riscv: canaan: Add support for K230-Canmv clock
Date: Sun, 29 Dec 2024 21:21:07 +0800
Message-Id: <20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMNMcWcC/12Py07DMBBFfyXyGiO/7WTFfyAW9syYWG2aNgkRU
 OXfcVMWlFn5Wjpn5l7ZTFOhmXXNlU20lrmMpxrkU8Ogj6d34gVrZkooI5VwPBl+UFpwOB54q2z
 WOhM6UKwS54ly+dxtr2/3PNHlo0qX+yc7xwX6quwaJIwajFdZ1MkZjQBE9JAd6mRJocfoEW7eF
 GfiMA5DWbrGRyt9Spg1QmijimStEFXnPAWlc8gKtMvEbhf0ZV7G6Wuvt+r9hN8m/qHJqnl9JOl
 bK0Mg71++x34cYjk+1727ajV/cGkecVNxCaKF6JI2If7Dt237AbxTOjFqAQAA
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227acfe2c37fdb5bc123623805100004d44063a7931d60f4752c72f31742b2bc1c99a19a8032823e2:zu0801122778e3bd03f400f1243611e13200001f8e9179054b9ffcc99ccaeaf98d4de53664911df14cfd5745:rf0801122d927dee58506e4c5a4c8bda8c0000b9d71284fc34e593d5343c5cf16017752d93b38e423c030f0e79e6f90c4dc7:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_052144_857934_70921FEC 
X-CRM114-Status: UNSURE (   6.58  )
X-CRM114-Notice: Please train this message.
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

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC and 4 internal
PLLs, with the controller managing these sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/kendryte/k230_sdk/blob/main/src/little/linux/arch/riscv/boot/dts/kendryte/clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock initial support for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   41 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   27 +
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 1422 ++++++++++++++++++++
 include/dt-bindings/clock/k230-clk.h               |   49 +
 6 files changed, 1546 insertions(+)
---
base-commit: 7a517bbdf3dc89a2ae5500ded67e823f8f2c36fe
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
