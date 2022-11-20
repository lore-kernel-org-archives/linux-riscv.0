Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B57F5C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Nov 2022 08:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apjqCb2B1Dx0osMeqzXlP5v0M1y7FYIsqTIr/8Q62Jo=; b=HHEWjtJLt9oyJI
	p6DZC1KJTFdLRqhqDx8Jhxf/i8vH30lIhU6fw9/JVYpvazQW9qLdFSJ4Xdm0bYhr1DkYwRZeXOJ9B
	M2DNykyosdqpcLWewxE8V3CM4ZwC1HcTejybpai5xWde3/+5+DwgmPAtMQRaKjoZilbH58FTTvQSD
	NKU4TxSExmMRawup/VOo2fwLPjzZ4a0XpWyjERQEQ5hygMKTN/6FMKAFXfr1jx2+Xv//dCh2HwLVA
	N7SrZkYAmXEJ/oEGYml+6hdzjj4AUhnvR7daWOK6mfv5VUp168l7m8ZZi/1TQH2bK4p77xgUmc3QJ
	oiGjvFk7i470vqjfeVWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjf-0031MS-Kc; Sun, 20 Nov 2022 08:31:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1owfjZ-0031IC-Su
	for linux-riscv@lists.infradead.org; Sun, 20 Nov 2022 08:31:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 468F360BFB;
	Sun, 20 Nov 2022 08:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D33AC4347C;
	Sun, 20 Nov 2022 08:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668933084;
	bh=grijmqoHTJYjCp5qjuNh40Hgwmae/3KEnER8TAO+wRQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jIJE47kOURni8xZ8dkY8MaIKIn77gfMCCqh1SJ8f+4Yta7naxGF/D77W4tFSISNyh
	 yo1kRBCeGTwv5t+A4uOpoabv3fxQARGXiTMOqG2vmfqcYdbvot2iVtpRtVZ7vpw8HP
	 Bk5qrApDdSrVWVGALcTSK5ROn6VDht/OHfmMj6EOlMvFfuBuqStoBREy3UQsHe4zLG
	 yoSIjcp9qVPuTrWPi3TjYM6YPHHPTGkEpVyxyXzqy2bsd2UG/3vcvYvmXkBqGHKFvn
	 zEsPegRHpANNadLeRv2yVhf+UVKgmKM2gn9SQCCZvSXbW5VRpkgBrh44zxDoqg+9AT
	 dt7iV4a6SeRYw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-serial@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 7/7] MAINTAINERS: add myself as Bouffalolab SoC entry maintainer
Date: Sun, 20 Nov 2022 16:21:14 +0800
Message-Id: <20221120082114.3030-8-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221120082114.3030-1-jszhang@kernel.org>
References: <20221120082114.3030-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221120_003125_997649_E0289553 
X-CRM114-Status: UNSURE (   8.53  )
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

I want to maintain this Bouffalolab riscv SoC entry from now on.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 92451834b940..3564b27d7da4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17738,6 +17738,12 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V BOUFFALOLAB SOC SUPPORT
+M:	Jisheng Zhang <jszhang@kernel.org>
+L:	linux-riscv@lists.infradead.org
+S:	Maintained
+F:	arch/riscv/boot/dts/bouffalolab/
+
 RISC-V MICROCHIP FPGA SUPPORT
 M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
