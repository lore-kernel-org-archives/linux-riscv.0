Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB772C4708E
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 21:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nmjlU9BkyPZ3EuQ+Jmee1tx9FiLQqGYDqravAaZ2FJI=; b=qLq0gJSqbH4A1a
	KzbubZeukU36xyAtNoEcMxPwFN8+8W92RYdIXhKJphygciMtd1diCYxd+n63oweHmWx06dMDwCPZM
	s5m9OENE6E1f49kLQBOsTKwUNUoe3zKOVP+cQQekw0SWnnOeSXozdrSRdrUxcw8t6GFmGMuR1omPZ
	s/b0Dc2OeVkDlF2r+QZxAwPPTb40oCTQ8myvb7s79nAu+SWEQZhmM3wfXZ9SM8sGVkNBn4sHNCd+p
	IRZZ4Qb9uZfxkG7LL5aICu+0Ipt59815bs0wY4ry1IYu7YdJx893VyiQnqJerDeUVw/9JXOEjcDys
	iOEHuD8ShFxdggEuzoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoTP-004y6h-KQ; Tue, 03 Jan 2023 21:05:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCoST-004xaY-UN
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 21:04:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 714D76151C;
	Tue,  3 Jan 2023 21:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADADDC433F0;
	Tue,  3 Jan 2023 21:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672779868;
	bh=QSwhmc0AtnN+kg4QEPChJJlwqa5GiZOtsjO1T4tiafU=;
	h=From:To:List-Id:Cc:Subject:Date:In-Reply-To:References:From;
	b=gahn5TXp0pv4DADwXee6Mn+jsEOVYGhnzhvjpsra92mG3INiwY1WpAmFmlQujmQgx
	 dwJ4x0Zq3xsP0dxq6pQoIK7G3EYzi0tb525LaNoDs+Ukxde/PugsXMRSAEb9JDUGA8
	 EkuYeL2/yBlFO8QM5dUAZ1CoyfXQamVmNv4EhItxTC3Zy3SyxN7f9jXOQb3DvyhvJT
	 +y9Qayp/RfPJtI4TZ+h8gsRmIm+twuKu7HuGXDnujLzgWsIgZcvjpqOjo8Ocr52Q1o
	 EkPo5ZZrRQPzTL8QYqzH7G5JdVC0yoUyb70M5zs1FCt2XI7ZibUV0nHfCBYQ35xxUz
	 h5xL3I5wlMZFA==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org,
	arnd@arndb.de,
	palmer@dabbelt.com,
	prabhakar.csengg@gmail.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	ajones@ventanamicro.com,
	aou@eecs.berkeley.edu,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	biju.das.jz@bp.renesas.com,
	devicetree@vger.kernel.org,
	geert@linux-m68k.org,
	guoren@kernel.org,
	hch@infradead.org,
	heiko@sntech.de,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	magnus.damm@gmail.com,
	nathan@kernel.org,
	paul.walmsley@sifive.com,
	philipp.tomsich@vrull.eu,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	robh+dt@kernel.org,
	samuel@sholland.org,
	soc@kernel.org
Subject: [RFC v5.1 2/9] riscv: asm: vendorid_list: Add Andes Technology to the vendors list
Date: Tue,  3 Jan 2023 21:03:54 +0000
Message-Id: <20230103210400.3500626-3-conor@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <Y62nOqzyuUKqYDpq@spud>
References: <Y62nOqzyuUKqYDpq@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=786; i=conor.dooley@microchip.com; h=from:subject; bh=Osu6oqnweQTcBtWUqRBfzd67X6PnKxWx7JZhKp2CLGI=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMlbZljM3J3wZI23c0fvxVt/3Xz+p6/+FiJb931jSsBejlWP 560+01HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJdGYzMjQtPv2679FSl/WSy18sKF aQLSq3P2Sxa6uFalkLn+qnaeqMDNc4xE5pSqiv2Jf1otuxTuL0bKPHEVmJfGXLta5VfmA15wYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_130430_500407_5902088C 
X-CRM114-Status: UNSURE (   8.71  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add Andes Technology to the vendors list.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index cb89af3f0704..e55407ace0c3 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -5,6 +5,7 @@
 #ifndef ASM_VENDOR_LIST_H
 #define ASM_VENDOR_LIST_H
 
+#define ANDESTECH_VENDOR_ID	0x31e
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
