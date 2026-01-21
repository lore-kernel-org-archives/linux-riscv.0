Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDD0C44500
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ynxGXb9SetwEkAs/zL51vslf/TfCqIMu1vqpx0yUKfI=; b=vxHImNA8CENu8Q
	IZq2IC2bNe44u6UOb2WQXAKPf6yeNgr3kXKHyCa47Gdy4HqK+ls6BLkkNACcgWtLsfn6lnEv6uVSb
	iTyo/1vBfHw9AzHRWOavUclmMyH092hLfUIXZGI5QoRC2kVB1AiL6iixxRvEmTP+OgqTlnOSFKbR4
	cPIpNiduowvDbe156fEtWJt/GyInJIA39pyE2LS6EZQqYQen5juEdJHqE1NEVtEvrYvYN10QGbzVA
	PYmAW/8QtIEBg9SuALpMw7uiLZoa5rEZozI4sLGg5DvN22y3q4vr6pujveHd8EGxi7i6HRnuogQa1
	96/ytA23qRe+P+5khxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifs1-000000064wo-2d7g;
	Wed, 21 Jan 2026 21:36:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vifrz-000000064wO-2E7R
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 21:36:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 51EAB41A85;
	Wed, 21 Jan 2026 21:36:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D17C2C4CEF1;
	Wed, 21 Jan 2026 21:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769031366;
	bh=K5Kg79MYUEbLRwnoSUB/w8wal8aEH0LarYOxU+jEfoE=;
	h=From:Date:Subject:To:Cc:From;
	b=hZZD+HBLJCD6eTD2NDuhMQzEwyiYlnPhN2i6ODAq9tHQTRgXp0ainrQFSedzjOEdf
	 yyL4E4G+XZAWi1aD2oPheZJI3clEkG3KVPRDbBzGZkw/n6Htcjij+g/QT9bhqDXhe6
	 h2mUV5YzN1aWME2+OQ9Z36cBuEtKD7VuwQqMKPUg5Zl5nHfGzyFxcnZoUFnp1Shw01
	 L0ROORZYrrellJrzVNcUykc9Bmi1gRK3+5UbK03w7TUTdjZBP0d7ROm2GLgCfl+f7G
	 aR1G0p/AeKSrETRoz4HHnBs5c6AY7NWU2vChUQ/zQ6ExQCgyHcnCO9vfrLXwXhqmLG
	 iTPWnytsR9Kdw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 21 Jan 2026 14:36:00 -0700
Subject: [PATCH] riscv: Add intermediate cast to 'unsigned long' in
 __get_user_asm
MIME-Version: 1.0
Message-Id: <20260121-riscv-fix-int-to-pointer-cast-v1-1-b83eebe57c76@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDtg0iDiVUoXJo7tuEhkJpWCe
 PdOdfc+ePw7KAmTwtDsILSxcskGd2sgvcf8IuTJDL71Xeu8Q2FNG878Rc4Va8G12CDBNGrFPk7
 hHkLfzT6CNVYhu579x/OyfuJCqf6jcBw/GnzmlIEAAAA=
X-Change-ID: 20260121-riscv-fix-int-to-pointer-cast-8bd434486f2b
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, patches@lists.linux.dev, 
 kernel test robot <lkp@intel.com>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3284; i=nathan@kernel.org;
 h=from:subject:message-id; bh=K5Kg79MYUEbLRwnoSUB/w8wal8aEH0LarYOxU+jEfoE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJmFbkd+KZTGdgtwfreb3Prk2YX9R3346vIesDDcOH6WQ
 aAwUKq8o5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEwk3YHhn9XuctZFMYnS8gkz
 /p15KmrUfyvt2P7H2663G649+f54pxnD/2AFxmdrnbUZr/JM7uHxDPh+kaXy9o5Lahsa50eou2g
 f5QQA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_133607_615618_72890667 
X-CRM114-Status: GOOD (  13.97  )
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

After commit bdce162f2e57 ("riscv: Use 64-bit variable for output in
__get_user_asm"), there is a warning when building for 32-bit RISC-V:

  In file included from include/linux/uaccess.h:13,
                   from include/linux/sched/task.h:13,
                   from include/linux/sched/signal.h:9,
                   from include/linux/rcuwait.h:6,
                   from include/linux/mm.h:36,
                   from include/linux/migrate.h:5,
                   from mm/migrate.c:16:
  mm/migrate.c: In function 'do_pages_move':
  arch/riscv/include/asm/uaccess.h:115:15: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
    115 |         (x) = (__typeof__(x))__tmp;                             \
        |               ^
  arch/riscv/include/asm/uaccess.h:198:17: note: in expansion of macro '__get_user_asm'
    198 |                 __get_user_asm("lb", (x), __gu_ptr, label);     \
        |                 ^~~~~~~~~~~~~~
  arch/riscv/include/asm/uaccess.h:218:9: note: in expansion of macro '__get_user_nocheck'
    218 |         __get_user_nocheck(x, ptr, __gu_failed);                        \
        |         ^~~~~~~~~~~~~~~~~~
  arch/riscv/include/asm/uaccess.h:255:9: note: in expansion of macro '__get_user_error'
    255 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
        |         ^~~~~~~~~~~~~~~~
  arch/riscv/include/asm/uaccess.h:285:17: note: in expansion of macro '__get_user'
    285 |                 __get_user((x), __p) :                          \
        |                 ^~~~~~~~~~
  mm/migrate.c:2358:29: note: in expansion of macro 'get_user'
   2358 |                         if (get_user(p, pages + i))
        |                             ^~~~~~~~

Add an intermediate cast to 'unsigned long', which is guaranteed to be the same
width as a pointer, before the cast to the type of the output variable to clear
up the warning.

Fixes: bdce162f2e57 ("riscv: Use 64-bit variable for output in __get_user_asm")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601210526.OT45dlOZ-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Since the patch that causes the warning is at the top of the fixes
branch currently, this could be squashed into it with a link to this
submission but I sent it as a standalone change to allow application on
top if desired.
---
 arch/riscv/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index 53a643c0f6fe..11c9886c3b70 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -112,7 +112,7 @@ do {								\
 		_ASM_EXTABLE_UACCESS_ERR(1b, %l2, %0)		\
 		: "=&r" (__tmp)					\
 		: "m" (*(ptr)) : : label);			\
-	(x) = (__typeof__(x))__tmp;				\
+	(x) = (__typeof__(x))(unsigned long)__tmp;		\
 } while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_asm(insn, x, ptr, label)			\

---
base-commit: bdce162f2e57a969803e5e9375999a3e0546905f
change-id: 20260121-riscv-fix-int-to-pointer-cast-8bd434486f2b

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
