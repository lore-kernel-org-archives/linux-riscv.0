Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDA8C47089
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Nov 2022 13:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EyA/Ds9YGMatCytaP+O3IJ4VBY8BR4thzkHXhz3tXnc=; b=4rSqhqaKlp8VNN
	LLLrTA9w9ymzipScFlHWfGn5jDZF+RY+xZVwCSaKqKAsKdG3H3Pk7PbFJdshtT0632N9Nq23ibnQc
	K94UPZHvLTCsTalrL1rLs+1uGzl8s1kIl+81yliTrzfaQwHJ+PicX9UhCeJQEjw94dq8J9m9INy9t
	sSP6PybK7MZWrGBdOW+3/yAYLmNkcMUcL6yYfEWL/7e706W8DJ3ZncdeR+SGmrxoa2qIotOzRuvo+
	J4dQEYX1+REAzt4bkNvEYsoDWvo1KxfwdWuUWVPEU1H/0ZzVGWmdTmgddXPZz1FQpKQgaO/l1UHcP
	/8xYP1gdqVxmjfnqxGPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoN-00BQ1i-Px; Sun, 27 Nov 2022 13:35:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozHoL-00BPyR-8R
	for linux-riscv@lists.infradead.org; Sun, 27 Nov 2022 13:35:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AEA9F60DCF;
	Sun, 27 Nov 2022 13:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45E54C43149;
	Sun, 27 Nov 2022 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669556108;
	bh=WY2HK68xmDUjRE/FprHRGRMX/MQ7yprY9uH/Mc9QD0U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IL9tRkrEJkfPG91CZkJ7uLIYnU9L/HjkrxQLfTceisGhzG2SDOx2xfcLYjD2YUNTO
	 Rf2jbKSbxwmQJ5oCMQeorhqlsxxownbgLSgTmxwsAgXg2fKsUx7YEQJYIyulRTnEei
	 xBT3zHMsHUnl2AiCboocns2U16xRrj0lnmpI/fXy3AfvUP2Acg/k4iDQ/yoTOMHIiy
	 kRSh7qMSUWww0SLigqFCVDjcb377PNCUbh1ugkjzMv6TFHNoM6JwjbEgPxyRzctwQZ
	 gcMIFGpHudSy9JsApjgUxaIF/ieZHuAGFpVIcz0QKDA4ApnXwWbZpgt7FSsfWlBQ4U
	 0yd1H7v1+pu5A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Rob Herring <robh+dt@kernel.org>,
	Conor Dooley <conor@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v2 9/9] riscv: defconfig: enable BOUFFALOLAB SoC
Date: Sun, 27 Nov 2022 21:24:48 +0800
Message-Id: <20221127132448.4034-10-jszhang@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221127132448.4034-1-jszhang@kernel.org>
References: <20221127132448.4034-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_053509_357209_E37C0D5B 
X-CRM114-Status: GOOD (  10.19  )
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
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 05fd5fcf24f9..27b3d59c7d90 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -25,6 +25,7 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
+CONFIG_SOC_BOUFFALOLAB=y
 CONFIG_SOC_MICROCHIP_POLARFIRE=y
 CONFIG_SOC_SIFIVE=y
 CONFIG_SOC_STARFIVE=y
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
