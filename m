Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D34B8E81DFF
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 14:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jB/GCGUokw2cJe1Ea2APz4zt29J4OK4FP83pW8oLs4E=; b=aDDkeceZ8pBuFG
	O04q3cKdfs2CouXdXDqc4OkxZQmcHq310LRZ+u5j4NyYzE4vmzfQ4x1uqQOgUfMJZqZWX9FEbWQcG
	pK0e749yM1oEL/nKTiUbHTrl0COjgSmwBUMd/CFyBCKuIIflsqcDcrm4kn2fZ2DGpjzVhSJwQ6YNN
	h8df2lhROaZ4jtA3Z9VGbshQIBnAXLsucyTU5BNyIUTNKBUFiBcdkKNDXaHA08w5GfMK4/JXgiIqw
	mx5rq+Pj7/zQ3VhwCcb6infgir4VrB3y1i6d/9NcNZCYJSQOkOIfy+XsQ9OTOzQt2zEBetpD379fM
	oeh7Il8F1I7mMRknbpRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoljm-005yVa-34;
	Fri, 06 Oct 2023 14:23:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoljk-005yTi-2S
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 14:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F95160C15;
	Fri,  6 Oct 2023 14:23:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F4CDC433C7;
	Fri,  6 Oct 2023 14:23:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696602203;
	bh=XBqQ4iHvesdBU73kOzoPty/h5/FDyNYsclRZqIaRyyE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AKkOpWXzz6eDbdbOCxP0fPboHebR5GKzL84RUoH28JCCfL9ANd85mDFRXZIKqrvi1
	 gGbyRnzd8t42VE1W/iTQw0c1u7fH/cq/hOvAZGACduPfPfD7g3e+pb/zVPTIZih9Kf
	 PqDzgjUvnDR0p3fvyCY5yfLDei7G3EqDpbYwx2bA3Z7KhtPVoRJ92ruLhy6ruStkKo
	 O8NkM9S+3cDnilgrqo0PnQOHFu/svL2zOreAQG5Z7nbOuLZMO7FSwOBqB/RkrE6bqC
	 N4pZFHXAwNl4s4+BUsuYvv5t2xnurWBJtsQxrhcbZrLLXLOQ3Tb5hCf96Ea/+hvrU4
	 t7ftKtUkOvnVQ==
From: Conor Dooley <conor@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>
Subject: Re: [PATCH v2 0/5] Add Milk-V Duo board support
Date: Fri,  6 Oct 2023 15:21:44 +0100
Message-Id: <20231006-petal-conjoined-4c3afb0c5a0f@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231006121449.721-1-jszhang@kernel.org>
References: <20231006121449.721-1-jszhang@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1002; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=6ahMtWbaNULcWlwY37kB+Ja+SZGh9Mj1DK1OOUAhQp0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKkK4t9+zVTpO9B56JryVolrMkb2kbsXruS2/5t/60VMv PPPsJsLOkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRQ/KMDNelk6f+uMzfmOZ7 quzQZb9nxf817l4y37yXt8Fwf3xAyRxGhg/qhdeZDSz3au97537jDXOEMM9y8Rs5cVd0qrQ85N/ c5QUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_072328_865337_78F42746 
X-CRM114-Status: UNSURE (   9.30  )
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

From: Conor Dooley <conor.dooley@microchip.com>

On Fri, 06 Oct 2023 20:14:44 +0800, Jisheng Zhang wrote:
> Milk-V Duo[1] board is an embedded development platform based on the
> CV1800B[2] chip. Add minimal device tree files for the development board.
> Currently, now it's supported to boot to a basic shell.
> 
> NOTE: this series is based on the SG2042 upstream series[3] for the vendor
> prefix and ARCH_SOPHGO option.
> 
> [...]

These look grand to me, so I have applied them on a temp. basis to a
"sophgo" branch. I'll merge it in for real to the riscv-dt-for-next if
my changes to the prereq series for the sg2042 are acceptable to their
authors.

[1/5] dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
      https://git.kernel.org/conor/c/101276d77e84
[2/5] dt-bindings: timer: Add SOPHGO CV1800B clint
      https://git.kernel.org/conor/c/a3a24243b83b
[3/5] dt-bindings: riscv: Add Milk-V Duo board compatibles
      https://git.kernel.org/conor/c/533874200f8c
[4/5] riscv: dts: sophgo: add initial CV1800B SoC device tree
      https://git.kernel.org/conor/c/4e31e0e61845
[5/5] riscv: dts: sophgo: add Milk-V Duo board device tree
      https://git.kernel.org/conor/c/0edd1de88d35

Thanks,
Conor.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
