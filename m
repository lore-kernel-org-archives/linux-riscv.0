Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9F7C77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  2 May 2023 03:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iBp0gDF3o+gL0+OpraFmwMHWW5Nz1pkXoQ86LOysIcs=; b=0CeyElPKTrg6gs
	QRJ4Z4z57ibWNMLCu09wyEKHS6vg92alWwXd9FkN4rv0vYh2e0Xg5pxRXdB4Yc0m0MYibOZvs7fgj
	pEHUp0IL+38pI9IFHeohOf7m9yJ4oiPWw1eLLb1Lc5fixUZt/bP2HkNmA7Zv+L9XlcoAZPS9my1ER
	714eUnbN3mF6dhVQOe27HPMJDqnIu0KlI6/L4I2hEayQ2zo+pz8czUXgMn330rl+Cj5loXJvOirCd
	KZ809F3CKpi7F664vChOVa9TKr0ezs9oqNoNYpMZMpY8ynjek5neHQ8ScrDrApB25JJWe4CEytmYT
	tUKikpp1YHzZTGmYl+rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ptgU8-00HXx9-2k;
	Tue, 02 May 2023 03:15:24 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ptc3B-00H60S-1w
	for linux-riscv@lists.infradead.org;
	Mon, 01 May 2023 22:31:20 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aad55244b7so20903945ad.2
        for <linux-riscv@lists.infradead.org>; Mon, 01 May 2023 15:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1682980274; x=1685572274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WXm/tgLzEaGj3Rix4J06OEcQf8M6HZHHr5wrveDhLac=;
        b=uNXCtmG/W7IV7s7yocLEoqJ5vT3qk98iE/mn+Dk93JGanuKtaW0aod4T8YX31U4wNq
         +Myrxt7knt7un883vWifP6rREGDFsgvqpffOIjB/AOEVOPmy5Zo13mNnjVAb9PyQATnU
         nzrHAgLUZbzvqP+IdBy01oX9POttMlVo29Y27VpAosE8THHu/zh0OXJSPHHcjkBh68wV
         T0i8P5TIj9lp3DUW4aOVVXU0IrAh6fL4/u8QHej/jS4MOkpDNlRnIv4Xglc8pnFNt78e
         WNgJMtI7hFoLN7lYwSVGquexypVwcC09VWVwRL38ZV+zuQNsGzBRDoDyZX6MjR3alnwy
         aYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682980274; x=1685572274;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WXm/tgLzEaGj3Rix4J06OEcQf8M6HZHHr5wrveDhLac=;
        b=H1T/YjwXWpGXYBeEO76bZBYVXAgmeV9YvJYnUB48oZb/eWfMt6Fdw+FJovSoJ3X0mW
         9UZV6HZ573QgecGibbLd2N7MnqzIatdBsvOhBuEghcxMc1BaosKhi0u8nilsJm+CmGTT
         zMmc94XZNDTVSOe3CaLa9dUmNNSdU8wp2iOmoTSQxekOO6pXrOof/mSX/mkBFCpIh9cM
         rTtKz+tSJ9+/7VEriDKngUU1aaGc350bbadMKq8k1JGgY+hWQ5npv2FbyLKP/zOCcwqc
         BLX6pwrLdqBSj+I4gxFmVCPPMZmeKs0ASV5h5PSPl+dJ8HukAjkMA8NYcRGi5I5WxIZJ
         blzg==
X-Gm-Message-State: AC+VfDxR61QOJDRCnfVbNobNSygwz0Qy/DRjvtHBFJVijrDxuv9wOnUs
	CC5/tB0i9QBN8nzoIJSM5zBpcQ==
X-Google-Smtp-Source: ACHHUZ6GKYuz2C56X0924d80f0Z5C9wNPfa99LOemIVyrLAlyLrwed+fO0GCuZjxamVBvL7g4ws92w==
X-Received: by 2002:a17:902:7085:b0:19c:f476:4793 with SMTP id z5-20020a170902708500b0019cf4764793mr14157336plk.51.1682980274025;
        Mon, 01 May 2023 15:31:14 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:fbcf:c418:4edd:c5dd])
        by smtp.gmail.com with ESMTPSA id y2-20020a17090322c200b001aad714400asm4563977plg.229.2023.05.01.15.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 May 2023 15:31:13 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Liao Chang <liaochang1@huawei.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Drew Fustini <dfustini@baylibre.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	kernel test robot <lkp@intel.com>,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH] riscv: compat_syscall_table: Fixup compile warning
Date: Mon,  1 May 2023 15:33:54 -0700
Message-Id: <20230501223353.2833899-1-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230501_153117_882112_00039202 
X-CRM114-Status: GOOD (  11.11  )
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

From: Guo Ren <guoren@linux.alibaba.com>

../arch/riscv/kernel/compat_syscall_table.c:12:41: warning: initialized
field overwritten [-Woverride-init]
   12 | #define __SYSCALL(nr, call)      [nr] = (call),
      |                                         ^
../include/uapi/asm-generic/unistd.h:567:1: note: in expansion of macro
'__SYSCALL'
  567 | __SYSCALL(__NR_semget, sys_semget)

Fixes: 59c10c52f573 ("riscv: compat: syscall: Add compat_sys_call_table implementation")
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reported-by: kernel test robot <lkp@intel.com>
Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
This fix was in the v9 of "riscv: Add GENERIC_ENTRY support and related
features" [1] but was dropped in v10 [2] with the prospect that it would
be submitted separately. That seems to have not happened so I am
submitting it now. I want to silence the riscv warnings when using W=1.
With this patch applied to riscv/for-next, I no longer see any warnings
for riscv.

[1] https://lore.kernel.org/linux-riscv/20221130034059.826599-4-guoren@kernel.org/
[2] https://lore.kernel.org/lkml/20230222033021.983168-1-guoren@kernel.org/

 arch/riscv/kernel/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 0fee73a20c87..c2ff6440767c 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -9,6 +9,7 @@ CFLAGS_REMOVE_patch.o	= $(CC_FLAGS_FTRACE)
 CFLAGS_REMOVE_sbi.o	= $(CC_FLAGS_FTRACE)
 endif
 CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
+CFLAGS_compat_syscall_table.o += $(call cc-option,-Wno-override-init,)
 
 ifdef CONFIG_KEXEC
 AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
