Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29099C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tmwMInHGEIfux7Mf5j4y2U7Ozg1K3cBShC1Wm7zf/s=; b=dzqrSiMFwMOzEr
	U9aH6QatjAm0toFwZXQ6WE9sAME9J3tTHQp8iOrILlC9mvDbIUmeje/Q+gokA3Qiysfd6MEuBDL4H
	n0EzbDIl7121+R6EVcDBd78aLOM2BVeHCi8rHsyjrKdIuu3A4VcswHWNvpQbSHxr3dJqeOAVq7vlQ
	MCM5cLHtJyQDIB00wgkEq43JuqS3l0d2LOSu364de2Dz9edRL1oOtVIrFlJvq/Q3aBYIXOFXHuuY9
	d/ufCI0WGp5g15zjIxvkwq6vArcJ0rL4asDKryI6FY0kkMnbNWhRPMrAlMTZJjH1kou+UHBYagzKz
	tqM98F26jpQlByBCFSqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfSDe-00BE2N-Cf; Fri, 15 Apr 2022 20:07:02 +0000
Received: from helcar.hmeau.com ([216.24.177.18] helo=fornost.hmeau.com)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfHSk-009K2I-7P
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 08:37:56 +0000
Received: from gwarestrin.arnor.me.apana.org.au ([192.168.103.7])
 by fornost.hmeau.com with smtp (Exim 4.94.2 #2 (Debian))
 id 1nfHSc-003EWI-VJ; Fri, 15 Apr 2022 18:37:48 +1000
Received: by gwarestrin.arnor.me.apana.org.au (sSMTP sendmail emulation);
 Fri, 15 Apr 2022 16:37:47 +0800
Date: Fri, 15 Apr 2022 16:37:47 +0800
From: Herbert Xu <herbert@gondor.apana.org.au>
To: conor.dooley@microchip.com
Cc: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: hwrng: mpfs - Enable COMPILE_TEST
Message-ID: <Ylku27J41IMmMe7x@gondor.apana.org.au>
References: <20220408100911.1638478-1-conor.dooley@microchip.com>
 <20220408100911.1638478-2-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220408100911.1638478-2-conor.dooley@microchip.com>
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_013754_301811_4EC4F4A5 
X-CRM114-Status: UNSURE (   5.56  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Fri, 15 Apr 2022 13:07:01 -0700
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

The dependency on HW_RANDOM is redundant so this patch removes it.
As this driver seems to cross-compile just fine we could also enable
COMPILE_TEST.

Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>

diff --git a/drivers/char/hw_random/Kconfig b/drivers/char/hw_random/Kconfig
index 18aa97974b8b..dad084c0ecee 100644
--- a/drivers/char/hw_random/Kconfig
+++ b/drivers/char/hw_random/Kconfig
@@ -387,7 +387,7 @@ config HW_RANDOM_PIC32
 
 config HW_RANDOM_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC Random Number Generator support"
-	depends on HW_RANDOM && POLARFIRE_SOC_SYS_CTRL
+	depends on POLARFIRE_SOC_SYS_CTRL || COMPILE_TEST
 	help
 	  This driver provides kernel-side support for the Random Number
 	  Generator hardware found on PolarFire SoC (MPFS).
-- 
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
