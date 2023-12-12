Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E544FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 13:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yit9SGWyg9SmRhTvNHxvs6rZHvB49Atg+iRyONpYFqk=; b=F0KRnlfb7d3Use
	9Zdbyp1yu8ic2xCxR7qduKVJ55pevGpms09DuGb+fPeCxGshdQ7zaVnkhpLIwbvffX5UWey1ABnsf
	YXB1Tg3AMN+AkTb7p4uTjZtdtzGeDzSJLiCPrxxlnM1ejxdaUke726KKYdYD/zsm0LIehsQ6UQ8f2
	bJWFo4mEldIpLGwfZi3s4hfc1kqosrXIeKLHGMCtal8e1QZO+/9a8rkn9yOm7FtII47UZNkNVtHky
	cJnNcg+56cIV6AYnN3Ck1x9HEuOAKcWFdlKMOjT5XRGpksUmN378brjLZaIyubs1bw4wmt9K+OqTN
	d13PRyvNGFG4uZmrKiGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2P2-00BkKF-2p;
	Tue, 12 Dec 2023 13:02:24 +0000
Received: from fzi-msx-e-02.fzi.de ([141.21.8.250])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2Oz-00BkHx-1w
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 13:02:23 +0000
From: Frederik Haxel <haxel@fzi.de>
To: 
CC: Vitaly Wool <vitaly.wool@konsulko.com>, Frederik Haxel <haxel@fzi.de>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu
	<andy.chiu@sifive.com>, Heiko Stuebner <heiko@sntech.de>, Greentime Hu
	<greentime.hu@sifive.com>, Conor Dooley <conor.dooley@microchip.com>, "Sami
 Tolvanen" <samitolvanen@google.com>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?=
	<cleger@rivosinc.com>, Nam Cao <namcaov@gmail.com>, Guo Ren
	<guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Andrew Jones
	<ajones@ventanamicro.com>, =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=
	<bjorn@rivosinc.com>, Baoquan He <bhe@redhat.com>, Chen Jiahao
	<chenjiahao16@huawei.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] riscv: Fixed wrong register in XIP_FIXUP_FLASH_OFFSET macro
Date: Tue, 12 Dec 2023 14:01:13 +0100
Message-ID: <20231212130116.848530-3-haxel@fzi.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231212130116.848530-1-haxel@fzi.de>
References: <20231212130116.848530-1-haxel@fzi.de>
MIME-Version: 1.0
X-Originating-IP: [141.21.46.139]
X-ClientProxiedBy: fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45) To
 fzi-msx-05.fzi.de (2001:67c:2acc:8:141:21:17:45)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_050221_639681_DA4BACF2 
X-CRM114-Status: UNSURE (   7.94  )
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

During the refactoring, a bug was introduced in the rarly used
XIP_FIXUP_FLASH_OFFSET macro.

Fixes: bee7fbc38579 ("RISC-V CPU Idle Support")
Fixes: e7681beba992 ("RISC-V: Split out the XIP fixups into their own file")

Signed-off-by: Frederik Haxel <haxel@fzi.de>
---
 arch/riscv/include/asm/xip_fixup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/xip_fixup.h b/arch/riscv/include/asm/xip_fixup.h
index d4ffc3c37649..b65bf6306f69 100644
--- a/arch/riscv/include/asm/xip_fixup.h
+++ b/arch/riscv/include/asm/xip_fixup.h
@@ -13,7 +13,7 @@
         add \reg, \reg, t0
 .endm
 .macro XIP_FIXUP_FLASH_OFFSET reg
-	la t1, __data_loc
+	la t0, __data_loc
 	REG_L t1, _xip_phys_offset
 	sub \reg, \reg, t1
 	add \reg, \reg, t0
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
