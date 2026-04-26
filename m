Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B30B5FF8861
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Apr 2026 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nUi4Yb/jpD9J6LzMutUJUpw172Zlk9mnRIgcQcOXCeQ=; b=NdL3TQ3LQ8cipd
	KtU/dxnR/HB63VBfUw8iH0+znAZFNO84+jPrOBeHEiLMwgTQTLf/wraTPklDBMnz0PLb2NmC02ju/
	NJ+Jn0lyUzwd1xUTcyg4meKlgrIQyXtz6Ycn+SxlpMhSAr+HbMlVarxvSN6rddgW8oiDyQE1NMt86
	PCYZfh9fw8O66Il7anZFpzVNy7N5CGJJDBpZLlIMDglAZ8KWLvRd+5+LXsjVadYtwLMpdqvXZQzu2
	oK4CQav0ncY3JiBPfe+CTfFdqDWzAJBcYczUMa8WVjG3Qksowf1azcOk9L47Ou842TlIm7nRvS6zN
	3poRrL5hv9FwHRBflZ2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGoJN-0000000FA9p-3sBU;
	Sun, 26 Apr 2026 01:29:29 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGoJL-0000000FA9S-27Gp
	for linux-riscv@lists.infradead.org;
	Sun, 26 Apr 2026 01:29:28 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so4074596b3a.3
        for <linux-riscv@lists.infradead.org>; Sat, 25 Apr 2026 18:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777166966; x=1777771766; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uJGLD2afkf4vXSL7zjJVSaxtWx0uvNk68f2WZ5vGOk4=;
        b=G2QWptaWk/aVm0NJF1hzHgU4/j+LqY1NvqqXvXkCCbESMzEMDSK8E011I8MXzDUbsX
         0cfwJBMWQ0ZM14Ro3cz394xOuSw0IX5MP2gb0Ls37lJZ4dXsW9BKgeE3FxFdbysOISzP
         lxhk5rCRfrC9qLXksK3Q7rcNEy855Vn+lGLdveFr96k7fqxH6fwqsYs21TscywzpKSTx
         ATFjXaOceLVguXLgYXZ5TcMFX42XK6Fz27y2QQENVo+7TxUxIAfYnIPMdQrhvQLhDmfr
         w92bgIJnRy84MCR02CI8X4E03287Rf3G09bgRCseG4KHUo4mwnfIP9MnW2IiI4nSWMwQ
         yqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777166966; x=1777771766;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uJGLD2afkf4vXSL7zjJVSaxtWx0uvNk68f2WZ5vGOk4=;
        b=tWpVA6n+JZgE7scKMNsE0kB76X8oQIemfzfgi6qgFybOA+UTAk1HdRHRL19987ZJwT
         sowf+8pA9JPni6yBZnanlVOiKAh7T7xeddIizxkSRT/beY16tOUsV0s2JVvjRQ9HmJCV
         K6zvLCHGalY9wTs8uHQuOQq0uG5k5cDloLxKFaCribDS0uJUn6g7I+PtfOfRTw8eFQ1z
         NeJ0hp/fF8Ad6Ij02sV/pnUwfGFcX/8TVYrnc35GlR6Ll67XeJPPjAlUKi4Q5d63KeIo
         TqSwVB5JeX7XcLXjcmLD1mgGyOGE2LLXnXUXPWbY3gK2xcPlvanGn6fTIzLBO8/zEzgO
         3Xzw==
X-Forwarded-Encrypted: i=1; AFNElJ/uQgbcc1E/95nAQqdk8KwxLcZi+FNeV8BUCOMGBo89xEymAf+EEKHWl8sJLqnZQ+b2hULg8UV1EotJ/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvxokxcGQnsN4D/IJsCW0ayxyz3d1UDkEpAI59KNNB0l9zjG1l
	uXn27QzJLd+CPehorx1gPvdLUAIZURMnei4J8VDDFobYhywRfpnnLsL+
X-Gm-Gg: AeBDievbEBSLBmem0eiStEVqtkFp9wmGMUpDKj0+tX7HwJ8kUqxSGtXLZ4PAaWMFykM
	VvWeu9v0+tRaQFN4A6lg1+yoc/3NmoMNDYDzVgLNiEfLhVwhmcMT2Ftw+MD8GDGYPeY/PxNsgob
	QME5hI4b+mQaB65aTd4sr2V7ktWP/oY8UeIB2yafzQRtu4xS7off5UsZCrwDOBY6KDkWzBGA7OQ
	CIqlrCgjI4CfJJFbrS1TSrft4NjEhQ0Px+plJWokO42p4qpZG/ACrEaOc0dWtAUs6ZjKU04BsMf
	PhUOVzXjv84Bfb54gmCkQjefGGS1eBz2P2mkkuyt9wqsKvLCCKQbQiBKbWrKM7zBYFY+zeH/7xd
	LOoGR42UVmnQXlSvdWmm/nocqBH8OPeVPcp9+rcgsfnLZ0RMw1lToyAZalQBpuMqoaKsu99+Z9B
	/JPrU2MqZYSZkc4a1vW5Yzp/AuSoc9bhjpEw==
X-Received: by 2002:a05:6a00:e08:b0:82f:28da:ec7 with SMTP id d2e1a72fcca58-82f8c8befddmr36874800b3a.27.1777166966192;
        Sat, 25 Apr 2026 18:29:26 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm31048541b3a.47.2026.04.25.18.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 18:29:25 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v5] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Sun, 26 Apr 2026 09:29:20 +0800
Message-ID: <20260426012921.673953-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_182927_578686_58B72475 
X-CRM114-Status: GOOD (  13.83  )
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

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

This dts introduces an ABI break that changes the compatiable without
adding a fallback. However, this change make no change as the previous
compatiable provides broken DMA chain for other devices, which make
the DMA function unavailable. And apply this patch without adding the
driver does not change the fact of broken DMA function.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---

Change from v4:
- https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
1. drop patch 1 and patch 2 as they are merged
2. Add ABI break statement and clarification for this patch.

Change from v3:
- https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
1. rebase to v7.0-rc1
2. patch 1: Apply Conor's tag
3. patch 2: Apply Frank's tag

Change from v2:
- https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"

Change from v1:
- https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8446b4dfe1a1 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};

 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
