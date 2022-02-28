Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A878C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 15:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WnoSzI5Lf3armQE1CW4e7XHzSrUALhG/nj8ivomH0SM=; b=xvAkKA1bKpHLql
	wQcx9+svoY5mgQv1WghR6GyG0W7hpuhGinBKSTYerSmPyvK0yKhU97mc5Ko/ZnOG+FqFkdItlq/nV
	m6kcXp167XACyMVgXtVxM1jruL4j8l7SJDHbmCqQAgaQJ0L0PEAKcRqcruV6ord9G6u7YDdtgfREy
	udYxeARIe5Jcgia8tKEipPwBcePjf1m6uXRnzpNpy6urhIWyoSTUg67JpUEhqbQCKUSb8eaO9+Py5
	ihvlKUFC5i1OX5IyZpkfVzhEQAc5saCyPfSwGpWSRhOrsFySEnm56GMb7Ur6ljtIscCHSc70nNE57
	tAnpis2bWq9uOCThjl+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOhvd-00D9PB-On; Mon, 28 Feb 2022 15:27:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOhvW-00D9Na-PJ
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 15:27:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2F8E060FE1;
 Mon, 28 Feb 2022 15:27:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0D7C340E7;
 Mon, 28 Feb 2022 15:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646062024;
 bh=kFhWjGGPF0HOMSD41o5huv2osoCwgvTkZ3Q334nGLzY=;
 h=From:To:Cc:Subject:Date:From;
 b=gn3F5ZL+dou8lTgfyLNm181boVHfFi+CTyIt/fDJtEMsk00674yLi6uEWrBRqz2EC
 rWdAi7n5FTg5oOA/k3VIZ/FlW7A9FsC0Hf99O+46B82BI5g4xxsoSl6nSB3UL+Q7ia
 TkoyE+Ne4nSdi+OzagxH6CAJ3cSXWx9Ug3cX5aZJhEjH1ygv6VyHlWzW/msM5wEkAt
 sn8nU/Qo2ndeTO79tMwOXgX0+xOfNWSK0B+Arpx15XZEebqLlXuVVekSt4AmbqipmY
 4kSMGfpqhTyXW/rrhhsI4eJ02lyEfBPwO+k1gty5GZx8XHK3aCBpwaRhrAIkJLu5Qv
 386CwB06NKMfQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Lewis Hanly <lewis.hanly@microchip.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Arnd Bergmann <arnd@arndb.de>, kernel test robot <lkp@intel.com>,
 Jassi Brar <jaswinder.singh@linaro.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: [PATCH] SoC: polarfire: fix build warning
Date: Mon, 28 Feb 2022 16:26:52 +0100
Message-Id: <20220228152658.3367506-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_072706_886759_E38A3B70 
X-CRM114-Status: GOOD (  10.44  )
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

From: Arnd Bergmann <arnd@arndb.de>

The newly added driver causes a build warning because of a missing
prototype:

drivers/soc/microchip/mpfs-sys-controller.c:76:6: warning: no previous prototype for function 'mpfs_sys_controller_put' [-Wmissing-prototypes]

Link: https://lore.kernel.org/llvm/202202260947.F5T1YNao-lkp@intel.com/
Reported-by: kernel test robot <lkp@intel.com>
Fixes: d0054a470c33 ("soc: add microchip polarfire soc system controller")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
I've applied this to the arm/drivers branch as a fixup

 include/soc/microchip/mpfs.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/soc/microchip/mpfs.h b/include/soc/microchip/mpfs.h
index 6466515262bd..969b5239521e 100644
--- a/include/soc/microchip/mpfs.h
+++ b/include/soc/microchip/mpfs.h
@@ -38,6 +38,8 @@ int mpfs_blocking_transaction(struct mpfs_sys_controller *mpfs_client, struct mp
 
 struct mpfs_sys_controller *mpfs_sys_controller_get(struct device *dev);
 
+void mpfs_sys_controller_put(void *data);
+
 #endif /* if IS_ENABLED(CONFIG_POLARFIRE_SOC_SYS_CTRL) */
 
 #endif /* __SOC_MPFS_H__ */
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
