Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C600C7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=47L4FIoRzqqMRo9u6efDTGNX/RELygkXlaiEPD7LF6s=; b=ZumkpYLKP83nIi
	eZx6YZ+uAixdozDcsHPqXmg6Ta2UdTqD61/FE0Z+2SP3z9V+LE7ue/qJO6sqPdS3MTfHfVhtPgXAs
	6IH6MzeOazFJpIMogD69vWs0ET4NqMynNoNcIt2rHB4Ok/wQ10usgWN4H8geZWP8nJlziOPiHYstH
	IxHWyBkAk1imOf6hv2VanWw5p8AIICxwwwK9gDhG6uPdY8jpPeBYCGRMPZjbRl6+/ImY7MnL/3LGV
	IPVvLVxLcxmWL/uVPcKJOJ9J17ltdHOZlnmOfV9R+t7UIfoEghkQnfvrAGBBfVEsfdusCb3NaPZTd
	lTnjSUf3G+S/kBHagw+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFD9-00HYym-1B;
	Sun, 14 May 2023 17:08:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFD7-00HYwV-0C
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9FDA360EFB;
	Sun, 14 May 2023 17:08:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 967D3C433EF;
	Sun, 14 May 2023 17:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084120;
	bh=Y38ByHJH7UauSxGlzX9LVYgXc2kOZJd7HsQTY6MaJRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T9eKUXa4t1eEQkTEKJLjaaHjCuoTExJKNPWr0JGfrhvfYkAQ5Ebanaq7Ppb8ByUpa
	 TME4SSfsTheQVELjlsvbnowHJAdeZMbKNuszQi5lM1WfIRqbgUc5Qx1LgjFGR7emLE
	 FYl1XqEn6ozNKScBpvAJ6IOVE7qg/QsaI3Y1S4ra0aI/LQASUd+0/ZSI7JcvHqct3+
	 aaf+qKYU0H7xlsE960QTx4Y8dGg15dPQPyG3fZmmtsKI8oKrd0JURdIfLY9U6JFemQ
	 Xmdo7ZLvvJdYtNjjMGyzxoa6QvxlELNxtSbSVbPoLv0NRQ1pN/ob/MWswoMzsaUPML
	 hb20TRqyvDgtA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 10/10] riscv: defconfig: enable BOUFFALOLAB SoC
Date: Mon, 15 May 2023 00:56:51 +0800
Message-Id: <20230514165651.2199-11-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100841_134649_875BDAA8 
X-CRM114-Status: GOOD (  11.13  )
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

Enable BOUFFALOLAB soc config in defconfig to allow the default
upstream kernel to boot on Sipeed M1s Dock board.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index d98d6e90b2b8..e8d77b55ce86 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,6 +26,7 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
+CONFIG_ARCH_BOUFFALOLAB=y
 CONFIG_ARCH_RENESAS=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
