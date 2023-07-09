Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA610EB64DD
	for <linux-riscv@archiver.kernel.org>; Sun,  9 Jul 2023 17:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zme/OhLddpj7Oe11TkIGFsR94JG3isPUVYygcruzXOY=; b=IWDchfcGFDS+Gy
	5ZbqAgVeVCrYUZ6yQDrLD3ztnHdIQSydWXbxpsD9IG3D97WJqOwDV67F8HZ9Z8zGKGushcsL93M9I
	XHoxoeBJl2/xwSSqcnQnVG8PKdJJdMGfLBMDCARLciHc56ZXSfrIIy82OG+Eo2fpo1qoNo3yFORGr
	JLAucuVp+oCJuqdea6c8t/OBSqCllNnFYMlMZlIY77CSiWnyypkdFWiHWrkD5tpjQCBmbwYqQZo+f
	vbmdVH2bHCSLeYKxamaOKXunSuWPQHuCl21oPUqQF/aLTEE3jFf0nFmKIlJT+MA/gH6IhOoZMo7pM
	mG06gcaymMhSFs23gSQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qIY6s-009UKl-11;
	Sun, 09 Jul 2023 17:22:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qIY6p-009UJO-0x
	for linux-riscv@lists.infradead.org;
	Sun, 09 Jul 2023 17:22:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8AB860B80;
	Sun,  9 Jul 2023 17:22:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8E73C433C8;
	Sun,  9 Jul 2023 17:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688923326;
	bh=vZxIGTzVbwcqJEpX1J2uB8CrfifoX/MNcXdkuR8ow00=;
	h=From:To:Cc:Subject:Date:From;
	b=JkH3fUUUPHirWS/4X6it5XAu38JodUVCorxx1HowQl5sD9liWtwcdWQ3ojCkBkL0r
	 LV4Pr4GE4JFf54njCfxSvdetzRRn3njV3UHphD0f9XESXFG3UclpqtgLgCRu4RtON+
	 fG0Dt1Ab95uAvJb8NgpZiYQBcASkSuwAD9LQDbd9iyjBSNkZfIb1g+6ZS4HBPLWC6P
	 FIS0OVVFiSm3VmGi5Bh/EPSoIMIERbxpVYOSgLKfxVQerCNZWKaG9ujHu80EwcHXuX
	 8j4srxtX7O+GHye7yqMcwN2Obt9jXj4DKhCRXn9D+zz43ZDTLWmDs0ReEPji9B6sOw
	 w6k7o4iGl0wgw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Randy Dunlap <rdunlap@infradead.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: mm: fix truncates issue on RV32
Date: Mon, 10 Jul 2023 01:10:36 +0800
Message-Id: <20230709171036.1906-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230709_102207_394337_CFE24844 
X-CRM114-Status: GOOD (  11.96  )
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

lkp reports below sparse warning when building for RV32:
arch/riscv/mm/init.c:1204:48: sparse: warning: cast truncates bits from
constant value (100000000 becomes 0)

IMO, the reason we didn't see this truncates bug in real world is "0"
means MEMBLOCK_ALLOC_ACCESSIBLE in memblock and there's no RV32 HW
with more than 4GB memory.

Fix it anyway to make sparse happy.

Fixes: decf89f86ecd ("riscv: try to allocate crashkern region from 32bit addressible memory")
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306080034.SLiCiOMn-lkp@intel.com/
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 70fb31960b63..9ce504737d18 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1346,7 +1346,7 @@ static void __init reserve_crashkernel(void)
 	 */
 	crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
 					       search_start,
-					       min(search_end, (unsigned long) SZ_4G));
+					       min(search_end, (unsigned long)(SZ_4G - 1)));
 	if (crash_base == 0) {
 		/* Try again without restricting region to 32bit addressible memory */
 		crash_base = memblock_phys_alloc_range(crash_size, PMD_SIZE,
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
