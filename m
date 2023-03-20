Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B713C7618E
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 00:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=06mfVLIVBewXArSUGygNuZFrL2PfSJdbK4E5AK+FifU=; b=Ls6vZ0FGXQM2cG
	Hm64J2X4Q2Cf1kXK206pAj9MNNt1BpbAnZSnDwkyqnVvgdGISXa2Xfxct37QNU9wuDIJJZ3iuYGrZ
	jIMshiwKGbHTURVsMMdR8g2fomzKY3SiCETtLQuFBjxtuOsDdXQgmkt+jhV6uCbVFTgVzSOl71CeB
	JNDdGmfJopMs7F0ZitE4l+e5Fa6JvmsKSwOBdQRxdfFjgCp9jBqwfd7RBO+su+eaNxFQCSf9M2UqY
	zABWFQuppUlEkKhC7r7ZNWas17Z69K9tyuXGpgObdiJML7hSpP8JXWqpTPxsdySNRa8FgTdQ9q7GI
	CmfQ75Q8EVqyvLyqAitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3ly-007npF-2w;
	Mon, 20 Mar 2023 00:53:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pe3lt-007nmI-2E;
	Mon, 20 Mar 2023 00:53:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 463711042;
	Sun, 19 Mar 2023 17:53:49 -0700 (PDT)
Received: from slackpad.fritz.box (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF9A53F885;
	Sun, 19 Mar 2023 17:53:02 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 1/4] dts: add riscv include prefix link
Date: Mon, 20 Mar 2023 00:52:46 +0000
Message-Id: <20230320005249.13403-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.35.7
In-Reply-To: <20230320005249.13403-1-andre.przywara@arm.com>
References: <20230320005249.13403-1-andre.przywara@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_175309_802469_0E63A8CF 
X-CRM114-Status: UNSURE (   8.96  )
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
Cc: devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, =?UTF-8?q?Andr=C3=A1s=20Szemz=C3=B6?= <szemzo.andras@gmail.com>, Belisko Marek <marek.belisko@gmail.com>, Fabien Poussin <fabien.poussin@gmail.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Allwinner D1/D1s SoCs (with a RISC-V core) use an (almost?) identical
die as their R528/T113-s siblings with ARM Cortex-A7 cores.

To allow sharing the basic SoC .dtsi files across those two
architectures as well, introduce a symlink to the RISC-V DT directory.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 scripts/dtc/include-prefixes/riscv | 1 +
 1 file changed, 1 insertion(+)
 create mode 120000 scripts/dtc/include-prefixes/riscv

diff --git a/scripts/dtc/include-prefixes/riscv b/scripts/dtc/include-prefixes/riscv
new file mode 120000
index 0000000000000..2025094189380
--- /dev/null
+++ b/scripts/dtc/include-prefixes/riscv
@@ -0,0 +1 @@
+../../../arch/riscv/boot/dts
\ No newline at end of file
-- 
2.35.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
