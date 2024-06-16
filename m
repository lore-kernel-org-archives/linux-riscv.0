Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1A4C27C53
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jun 2024 17:21:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmmZm1/3e0zlYKZBWKkiLra0xD4R21yB2j3oT9fCeVg=; b=TmQUvlWj5KLzq0
	CwOGNpsGQKOYJ+S2UAEFSmhpSh2ym/73wsHThp0V4bFnCG8bK09/OW8PjSaGMTIqgDnkot+iKtOCC
	42eIjTZr/szx4BEj5dZ3gpVGKjObEDTyscTuKPNLd48RBpbCqxpx4+2Tu2dluNIxKFY6nMQI4jBsD
	VS7fZQZ9wKpOE+Ic1iTestkang5Evz3qn8zPCagPO28YRe9ndbaO0B+UCr0fSYCfWvcgaRhIyo5cu
	Bzy79jeBGdlRzmxpx7eOFJ14+anF3kn+tr+Kfr9Nyh7XPzNnBrDSGP96ONNB/1oodqOmXgaVh4d4/
	DKmxqgiTrKLxe4f7EFOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZD-00000007xz1-2nqG;
	Sun, 16 Jun 2024 17:21:23 +0000
Received: from out203-205-221-153.mail.qq.com ([203.205.221.153])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sItZ9-00000007xuk-25Lm
	for linux-riscv@lists.infradead.org;
	Sun, 16 Jun 2024 17:21:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1718558477; bh=QCxFDA+QkmRBdRZGcgiXjLaq5q8XoSrYlBKMg+3T/tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Iit9X6T2bKxYEpeFcO3tI+WAkGeOojf894aXxpO04r8MEwx+xRSg+q3xwZ3nF0aUF
	 //xHzEp4u2Y/eKd/rwnJRKDS/tWQebHOOU2mCPXIF5P15U2sQQ4ND5CHLs8kSpB9B1
	 hOlQTCkEGHlzEGr8W+ynRhpxSUZ5pQ1pmLA6g+nY=
Received: from cyy-pc.lan ([240e:379:2260:ed00:cd33:e8cf:d8f9:bed3])
	by newxmesmtplogicsvrszb9-0.qq.com (NewEsmtp) with SMTP
	id 5452D659; Mon, 17 Jun 2024 01:21:05 +0800
X-QQ-mid: xmsmtpt1718558474tw3g8141s
Message-ID: <tencent_D935633C42BE1A7BF8C80553B5571C737009@qq.com>
X-QQ-XMAILINFO: N7h1OCCDntujUM20gunPaMcd/E5Hoffduj40fBOeInfA6d5A0WXm0tEpRLsn2D
	 BWt7my34ZTNK8obOUYW+eMtpsNku+daCR5Q8keEw+GHHbSD6rq6niajZKKDfsXgtjVZK44h4ihGD
	 QMFqH8JpurMvrcGbEkstGyif1jIOkYArFn22QWwmn43BzBeqHKn2AwEIb9Gv/twpmi0KtJt7o/6q
	 c9rSjZa4Q97WadsSHrrYgTAY63rN2OcEYWfqHPft5GAYInndADaG98GT9hOUUJTLNgkZWbdzOBr2
	 TlxlVDTx1c4UzME3v+I+WgXYcem3bRfdIbZpYR4jw+PDFnETplOhPcrEUsX4bMK3wXhyjcp1dMY9
	 sDeHmHBvff+TBJrLtGfWkDlOzNJ6dAJbXd/I32yLYBTa7GMKk1gFsa5dVYg0VTEEhQbIorkPPybV
	 LeDBJ259SNksnfUm5nXqJ8aFYcFPSvYnlBYkpB5KkALKfzW9kFPi5ajSx3qTXfRxCaumE9k7dwEC
	 wGh2noUFnhGW+FOZMsB5OUDBQ7e1ZikV6DEKystoTLfnyZqHx5H9zg/njg3m8OPliOPng1bWHMDk
	 dYsMsouKyWPIJX+CVfir1AYH5P2VekOQZcgH08ib/TnfpxesbsU/far3rZegdqJF4ws1x47Xlz3I
	 Gav/9GrJSB2EYXhlYcJZf0mFOxrNK6DeVLXg5dKkcl2GByr0njy/ByJ4CxmgYfnjvovPRm+VugcH
	 1L3GxWaGLK3fkTKgP7JA7mhUHkDa9u7o4m7v8D/2fzIfIAv3eNHIcO3rDrD7x4kqlpWdktMfYBjc
	 kNmMHC71OPp1WGjHbtU9C3aiDvEM64JhiY4PPfujQ1QpiAqXQ9jm/jJZ6I0ZDlD4HK1HzsNa32F5
	 98ylvL+itHufcQYJIaRNTPgYA0qa0fnVMnVD3XAk9BffQZr2Pr4s6cIxRNFZQXXvNNK4GsGlBhKz
	 sds5Q4XsVena05XgLEXXlmKR5PAJbu689nvEhQ3Ie6Ls6bmsPq2ykCcaZv8MGm0yutGFEVan5ors
	 oMAQsgYA7aHuuiaOQ/iLFNGz21WuVKkTNDgae8NwTj6N+JEtlHppnkF0Z4j8t4asewsAwA7YjaGp
	 LxriID
X-QQ-XMRINFO: OWPUhxQsoeAVDbp3OJHYyFg=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v1 6/9] riscv: add SpacemiT SOC family Kconfig support
Date: Mon, 17 Jun 2024 01:20:51 +0800
X-OQ-MSGID: <20240616172054.3074948-6-cyy@cyyself.name>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240616_102119_948207_AB22F027 
X-CRM114-Status: UNSURE (   7.63  )
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

The first SoC in the SpacemiT series is K1, which contains 8 RISC-V
cores with RISC-V Vector v1.0 support.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 arch/riscv/Kconfig.socs | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f51bb24bc84c..8a5775586845 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -24,6 +24,11 @@ config ARCH_SOPHGO
 	help
 	  This enables support for Sophgo SoC platform hardware.
 
+config ARCH_SPACEMIT
+	bool "Sophgo SoCs"
+	help
+	  This enables support for SpacemiT SoC platform hardware.
+
 config ARCH_STARFIVE
 	def_bool SOC_STARFIVE
 
-- 
2.45.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
