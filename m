Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDAD3C7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y0hordrSOrnG1BECaAqMvzLbDhhe1a750AnnXd+8SIY=; b=UR66NNi7V/BH7o
	WFbH9Xd9f+Xk0ZaoCxGIxJI0PNp118q5oyLwGbfdoaXu+u9cTt7ZvCHVLe9vqY2wO/S/GBT+oE3XV
	ZNid1LqT0OZIat6riHLzSyBT03vZYmrzOjfqeZmMnj9pbuzo93rcPRDGJBtAnO0bUpeWNZBoSOy7F
	fhyHg6bEUPtOQ+W444920MS9Chrb/x3hGm9tNc0jXZFQjYUPWiuUTcN2758OP3keN51quKYHUdl0p
	CHWN1ALkUJu3LV0C/9t51lCc6XCW+3aAUpSZz7ED4WxT+Ixqbgiie/0O7z6KZbr8Xq4Tjb83k8FY/
	1DcKScEvnwilPhjsNFQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioW-00Dt7S-0Y;
	Thu, 18 May 2023 18:57:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzioT-00Dt5w-2z
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:57:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7588E651B0;
	Thu, 18 May 2023 18:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE1CDC4339B;
	Thu, 18 May 2023 18:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436240;
	bh=+8gBhUykoZM8TrvHxezwEoqx6vcc9txPAEKaZGcJ4uo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZfU52L68DqN1YEclN4xauwvlvDjt1TExLclICt6uv1q20JIejrXEOSecNLjbfZqz7
	 JJQ+6OMTx6RM13fMAta6Iuy5IdDry0ywDr6F6d59rPIKbgFmHvXHVvFT1OxXgXEoHX
	 nkIDH5iXcHMbI2hhQg9j+8iNBjOpS4tBHXxm66FjoMCKw0liH8kyALT0X62UFJ3wFE
	 VWpEA7TfQb79Vae3ejwi0fhTTCiooz2bgyEbWKar20iS3LJu6dvxWvavBUys/djyFi
	 8CpqtjNAOU1D1zoTmrNPTCt2hOWang2hhmG/IYk4q8gMfeTpksG/mXoNvxHUrh9qS9
	 QZZns6KoH2r9A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 9/9] riscv: defconfig: enable T-HEAD SoC
Date: Fri, 19 May 2023 02:45:41 +0800
Message-Id: <20230518184541.2627-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230518184541.2627-1-jszhang@kernel.org>
References: <20230518184541.2627-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115722_008638_D988FCF1 
X-CRM114-Status: GOOD (  10.33  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Enable T-HEAD SoC config in defconfig to allow the default
upstream kernel to boot on Sipeed Lichee Pi 4A board.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..109e4b5b003c 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,6 +27,7 @@ CONFIG_EXPERT=y
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_ARCH_RENESAS=y
+CONFIG_ARCH_THEAD=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
