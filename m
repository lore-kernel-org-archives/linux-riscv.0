Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B93C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JSsP4AogzNqeyKTkVs6Qtna0uni84qUF14Y56Sijt00=; b=MXpXb/K3CV2JXH
	s+d+06fPupgCvw9x/qw4IiOX3Md5YMkGwE011HD7Y6bQGtZdtNsgZNv9nI4tNxYf+hwhpzKbmuQIP
	4nEXKdtx0EAnuOxx/D7ubhxE017f7afjaSvp63Yfdd1tv+TJ8SORllKK97II/jea89MCLetQzLkBn
	uibvQU9XpAx3YEBRlqrLkqq+C+Zlw3Z8OeaykadLrzHu0tougcGGVv3n9hvAwnft3wHsXc5rm+Pgo
	/xknjIkU0WMoOXLgeTEgvGba9bg94qHpSYeSWpiZ5kaec3aLuZ/nepIHzuKUbH5Md0fC/34z4Ql1A
	w8dUhUBNoM3/DKhLznoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErM-000000012kH-3kUq;
	Mon, 29 Apr 2024 00:27:08 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErJ-000000012iJ-16ei
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:27:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3605860BEC;
	Mon, 29 Apr 2024 00:27:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0400EC113CC;
	Mon, 29 Apr 2024 00:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350423;
	bh=oZ8CDJ87DHapEDR21yPFYKV3LrFmlIVzhWRzefmtllw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gU4+wnBv96PnwZz2h/SvbVTK+Nq4CqvZlNd6cD/GsXSVCVgIlW1IXlKf2X5hHvJ8M
	 EaFayKyzGoq97R0ktbsSFudPqoBP++50wtczy3pSoM1tJueoFLXaFigJppbrEeDbzA
	 9N9GIggPVnSWvDyyEXju6tnJazcM7p9PV6bXOM4sNWkUuSgKEoFc2Gk2HgiiVDXuWL
	 5LH9RmJU80qNNW8pZdFbM1+Un/QCA9V99GCTOdoIEkzA9Oi17s8ChyHEQ2hl2NRHef
	 GssFcRG3IeSEH4k6GxkxJm3frqLdioVxFYMlw3DVb02tCC7NCemi+QJK5rQu7TAvJh
	 IrjAZR4bx/G/w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 6/8] riscv: dts: starfive: visionfive 2: add "disable-wp" for tfcard
Date: Mon, 29 Apr 2024 08:13:15 +0800
Message-ID: <20240429001317.432-7-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172705_364367_FF66E25F 
X-CRM114-Status: UNSURE (   6.88  )
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

No physical write-protect line is present, so setting "disable-wp".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index b6030d63459d..e19f26628054 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -304,6 +304,7 @@ &mmc1 {
 	no-sdio;
 	no-mmc;
 	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
+	disable-wp;
 	cap-sd-highspeed;
 	post-power-on-delay-ms = <200>;
 	pinctrl-names = "default";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
