Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2107C02182
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jan 2025 10:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5GlykYt5BmixomS+J2pF31khEYXvrn+AdbR8Vw65pQA=; b=a23qo97W809FH6
	MIrTw+yiXamYDgMUHcAGBkDLKa8LwnpLOyqoUmZFudgRX89cRXHOu/q9bBhuXwVg2WFDIJ+EQ7YoV
	HDliNVwsMoDIvpEGGpNZLliVhcUjYQKrHI0eqTCIIj8/kMy1zNDpCP09WgphMZI+2cTsI3yMDNdc/
	w7wdJD0QRjcLRxUkN0l5rRiXbU7wYqugGPcRb2iYx8oMiiivzEfukj6MoauPL0wBYmq6bkzXSlXK2
	3MZFcnwEASMvv44nIKuckJiWSY3i0ioyg865SSl9YMAOW3s2TAN57EYXaFd+y4C5gqtpFH7MAWdle
	MkE+jpU8O7XrvRTPmU8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taXYZ-00000009sAq-3ZYv;
	Wed, 22 Jan 2025 10:01:55 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taXTM-00000009rOy-3jqQ
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jan 2025 09:56:34 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1737539790; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UE7jcF2fQcu4jgRTFlXtWzmag44c3YNzwJ+1NTDGouZP7Vune2mBuvKG4IExub3qrw6I/eQtpKscb9wLZfKvivrscK9b4CfnEMwHyU6JGPktrZpMYEtdAqfA4/9e5CzupmfrUJB0bFBDZoXi852bLTERMbDXeRhdMHuBlm4v2a0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1737539790; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=p+D6wi74FwpSWk9Lp1ZOmorWX1OSVZVlzhaeyMgcJb8=; 
	b=JckvrPe/p1kJa0N/rSzkFuUuBBLrW0aIo8/TsT7/ewCL6EdAMLD0eacsBrASNeEW9NZ2/Y6KrvX6X2GqaMsthYW/+2Kop24RZjf9tsG9tNopX39M0fVVGAotIxydxua8x8P1XcQxaIgvJsJ2+q63RUMJ5D8dOVooF+9XosZqtyk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1737539790;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=p+D6wi74FwpSWk9Lp1ZOmorWX1OSVZVlzhaeyMgcJb8=;
	b=a7xfvnauxI7BLLF9Zzfoxs39jZxgXHju0UV6GGR46zMITjUmL/HBLQLxga/CJFuF
	okWt4lO1EeJt0c2AESEixBqmbJX47/T54tlc8rh5a0OPDuMeSid0UNka2X2h8ZPbk5x
	Eo0s2cR9BfkIy0TmKoPQcMk2qMuqfS7EcLKymXw8=
Received: by mx.zohomail.com with SMTPS id 1737539787445648.1380220280148;
	Wed, 22 Jan 2025 01:56:27 -0800 (PST)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v3 0/3] riscv: canaan: Add support for K230-Canmv clock
Date: Wed, 22 Jan 2025 17:55:54 +0800
Message-Id: <20250122-b4-k230-clk-v3-0-bff755ac9cfc@zohomail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKrAkGcC/23PTW7DIBAF4KtYrEsFAxg7q96j6mJghhrlx4ntW
 m2j3L3EaaW4CisG6XvMO4uRh8yj2FRnMfCcx9wfymCeKhE7PLyzzFRmAQqsBlXLYOUWjJJxt5U
 tuGRMYqojiCKOA6f8uaS9vt3mgU8fJXS6PYojTrErkZuKmNBE6yGpclIiqyIR+ZhqMsExkCf0F
 K+5AUeWsd/v87SpPDrtQ6BkKDYtArJzSpW42nMDJjUJoqkTi+sGXR6nfvha6s1mWeG3iV81mY0
 sl6B963TTsPcv333X7zHvnsu/S9Rs77i2a24L11G1EetgbIMPuL7j0K65LhxAY6tLB8X0gMMfd
 0qrZs3hyn0wCiGig//8crn8AC1O4t3oAQAA
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
Feedback-ID: rr080112272655f399bdfb06f697025a9400007ebbc27c8137e54e8244f37a3b2e2fa953ef406e654243698a:zu08011227b09711424aeca21637fc607500005cecc874c3f5cb847f5787458ac109a2a28fd4d66ef5d7c13a:rf0801122d20920e79d8d5358c21f852e60000293e3ea288f3bed5f29597ebd5ecc4ced25d3cb9fe80eeed59b00f61a0881e:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_015633_037067_D85EF687 
X-CRM114-Status: UNSURE (   8.45  )
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
Changes in v3:
- Reorder the defination and declaration in drivers code.
- Reorder the properties in dts node.
- Replace global variable `k230_sysclk` with dynamic memory allocation.
- Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
- Use dev_err_probe for error handling.
- Remove unused includes.
- Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com

Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock initial support for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   43 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   32 +
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 1378 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |   49 +
 6 files changed, 1509 insertions(+)
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
