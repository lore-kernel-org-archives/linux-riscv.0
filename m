Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A59CD1284
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 17:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sRjln73GQwZXS9BSL7/i+UI4gcLTfGi/vO+oFpXq+o4=; b=Z9Vv2rUCmPsKe5
	gPUOwYG+WI1ZZqDPCqsqqS5xMU9m9IMrJQxADMkgjnDPi/BRxNWsHNtSXcQtVQPmsTqs3Ho61GMCs
	XjcoDS89TUVuiU9zJ9psVRnJpGPbQz335CrEXlVM1i+yjdLZlxHH/2i/5atGvSMs7bupF0vph+uaH
	lMB+pXTvTnKbaKNcj5TILRNX4AB4bdWVjlP4pYx58lIrKd0ypq9X3vkW6M1U5PjLclSNei9oD12aS
	1qloYjjPpmWLaNqtAQKeyEB3acFVunOqsdI4GMSRY3Fi/AouGkjES3YeJXqGfJXPvK5iWESHW2KFt
	qeKY52XHgkqbrL25vxSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA39-0000000AlFV-1eWb;
	Sat, 06 Apr 2024 17:41:55 +0000
Received: from out162-62-57-210.mail.qq.com ([162.62.57.210])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtA35-0000000AlDP-2SyI
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 17:41:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1712425297; bh=k2XCyj2HtiyDsP/ZIm+qg3j+A+CGArLiMKptqsaRcss=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OPp0GO/OSrZ7+0kQO1aEqmi1f12V1lFUGXRexsOnIpxrv32qS9M1eAHZc/XB3+Rdz
	 tXI8pDp0GR1pbvyHZzCMDJlGdz5bJg8UqoM+H1Y72tuRbBS//cT2QaF9rManBQxnRp
	 9gfs4uOIfvg00b1V0dV2rRSI0Ar77FMpMaicSHp8=
Received: from cyy-pc.lan ([240e:379:225a:6d00:f878:7a6f:5832:7f4d])
	by newxmesmtplogicsvrszb6-0.qq.com (NewEsmtp) with SMTP
	id A56026E1; Sun, 07 Apr 2024 01:41:22 +0800
X-QQ-mid: xmsmtpt1712425295teaf0a4d1
Message-ID: <tencent_48162E47CC48084A233A5FA8208436A52306@qq.com>
X-QQ-XMAILINFO: N6qfSVgljG6XqlxMj7skvbga+PGj6Zo7gFDhnlKWcn/iwwH6S1Lz4gP2RmyHIa
	 35PLtiHfvZAvsW4Kfkc63oO14qE/Lh2S3w99Ck8ETqlntcQmzrB3FpkkXiNj8Wm5qp5bMzINIreb
	 uJ4XTPHJlLxpAaIIvv4UuP+E1LGeWbFSIfZHDx3n9PYo1L+/Ssmq4jC9HH6whtPg71raZF3lu6pY
	 GLAQZmH64Prhckrj4Ef53pAH0YfHjpOyaRfp0wNTSxdTrz4aV8Z4cLMW93imfYl2w/5A63c0+VRN
	 3AqrLyQIO49fmUiTrYFGGziFbq6OJhSMPNEMXlRv9gKSea10ay6TcbZwIxsmuTHSd1+UQj4YVGbc
	 YU2vu1zBtkvlB6ufn1GKRC8HFbpi+lTv/iweY4+C3duJ/AFGHXjZnwR7ttB5PVJOFv2lOGwRmmDn
	 cKrIMwUV+EYQZ+kSF8mB6BT4hQ7wFpWTTzFt/BgAS0JLOlaa3O7cJ4EjoZXquGYzWTfriRfexluP
	 Kz9CF1WHVPsvJO20bFJJGjOs91Q5bQjD91gV2Dv8jqTn9y7+uQScFhwDSjo1E7COdg04w39Ui25T
	 9lH5ll26IAVOmrShVNdE2ClpShbNkikSCPa/6KAMToUP03MB045ZrR52ir2gkM11RhC36RC+KKuP
	 0y12avuwTfH8fmuD2jwnsFVFkgcLBinzB3MiRNJolOOC22pirxy+3o/btk+0dlNsWWg7IobLiKEa
	 SPyRHYtySpiWhnVNXELPBT3ZJdMAMlqQjuW+6Y6tfW1EYrMzLTsYXaR3GajuQerhj7hWzAQkQrbC
	 ynWcEZaxW/oSqCu7nuOjACVUJGFg/ExhOtL2ZfB8xQNyuQkKTQpruXwhKoAQ4B0pwHUIS1u6IS25
	 NzTs89PsTB7nA/v7bWwruuMO+JopFLVWZGVaadhBexCA7GueWNk3VRm3YMdLCBXN3xbhJ7XLr7KE
	 GrgLYXY4FEl+hAvtCZIkTYz/65k6i2BEdg+yB0b/5BoLRQMLAeJqOeJnS+TQc8nIxbc4956w6d4U
	 yLse9YDl189DI3zV7Ji9WUOIRSjZy0E1syTOsrJx3iHlDOCp7x
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Yangyu Chen <cyy@cyyself.name>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v7 6/6] riscv: config: enable ARCH_CANAAN in defconfig
Date: Sun,  7 Apr 2024 01:41:16 +0800
X-OQ-MSGID: <20240406174116.2945552-6-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
References: <tencent_F6392EE11AC6A485C43406F1BD09C268DB0A@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_104152_247982_7C394639 
X-CRM114-Status: UNSURE (   6.96  )
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

Since K230 has been supported, allow ARCH_CANAAN to be selected to build dt
and drivers for it in defconfig.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index fc0ec2ee13bc..27bea8296b9d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -33,6 +33,7 @@ CONFIG_SOC_STARFIVE=y
 CONFIG_ARCH_SUNXI=y
 CONFIG_ARCH_THEAD=y
 CONFIG_SOC_VIRT=y
+CONFIG_ARCH_CANAAN=y
 CONFIG_SMP=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_PM=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
