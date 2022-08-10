Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F069CC19F2A
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Aug 2022 06:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jlsXChoiB3CkT+dtAS4QPVSMTZui8kVil1gVv8kemZg=; b=xAORfJnRVC2mu9
	32sPdA4BS95+KXJIMl5zGgkYq9SsG/4aPdOf1H69SQmtMK3U6AOtWbqPkzdxJdWKtQDbMhlvKrf3U
	+DatHgZAzTYDroOIz7VQuuJ0A7fSRvIe9ukKdDxBxRGWvhbyB9IKlw8cg2A1HGSarOoK+yus2c02C
	dszrcWjYHm5XH+OaXsC2rnzmQRgybV+QU7DGcWcDM9NHKko5q3/507u1ZPb8Hx++s4eAvcu13rj1v
	bivHG0ikN9Dp8gVGdvE9rBrOnfGRYZcqfyTExYNHQOIAFGfOCwSV+1sxNE3mIpo6X+p4ywfaLKPDe
	uDU1jJ/I8RXof6X+XKOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLf5P-009wpK-OR; Wed, 10 Aug 2022 06:20:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLf5J-009wmC-Q9
	for linux-riscv@lists.infradead.org; Wed, 10 Aug 2022 06:20:58 +0000
Received: by mail-pj1-x1031.google.com with SMTP id c19-20020a17090ae11300b001f2f94ed5c6so2656133pjz.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Aug 2022 23:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc;
        bh=xvyr+vvGLd/wlvWYL2c4uQ9NGlY2QCgG5WGZ6FuDBV0=;
        b=6/CkcuQMx8X0myXGfcbl64CvHAI0oRAC4PgwmxQfSgexiMpfG375Lwrix1jju27skf
         3AfPrj4gf0mxBEFjuKaxKjyOI9a4bSbUozp9S7ibblmQu5/p3/CcUMHIWESXxbXQ7zHv
         WhGqffmKzco1PWyh/pM9q5OU3vnx/fRxtv4n+ahrLpBhs5m1+LPHyP7hvGwschpgQ0Hs
         kTxHccwlLFSiM/7s/I9229U6yxhWantbSUVumOLDlMKHW6sbemj84561Rhed+O2898Zf
         8CQOg22Iqqa6flJxzBTVr6nc/5DdmfBtF3i1/vZJEUGv3cMxTS1eN2QI4RuGWb/MtJZl
         yAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc;
        bh=xvyr+vvGLd/wlvWYL2c4uQ9NGlY2QCgG5WGZ6FuDBV0=;
        b=hXOpwIAYyXPSqf85mQN8xZFIgkQ41szdcca+UUEePYxEt8eIZ7wHXaBEqioE5wao5v
         WDazu9SZuXmvlWJTTFUZe8+aU/yaw61hWl72GSukOKrYiuRJvXUFIz7lIHBPjCGPBj5i
         lCrZHNnq9o3Xh3Swp+gZVxfJmjVtYmGo6BWrO7jkJZEbIpiK8cydYzj6nVA62QWlCOEi
         pd2heUG47K5sHwobVmbsVji8Lv2MKqAI7YICazE2Bly2aMsddubE3l22RnutVr9D1yUZ
         U7a0+ygK6ldFiaHz2VhCma7jSjtNqhfQIS+6dkg++bXkfcIyM+6R7YJHZdRdxTKPLiLd
         +e3w==
X-Gm-Message-State: ACgBeo2gjQWxIMs3Ki/nFV0VMVPjyzaxhhcnh8B6cBs9LDe6ILUQi+Dk
	vejtufhR2KJ4LQvs3j3rttkpzA==
X-Google-Smtp-Source: AA6agR4u0xBgXsdboXxdOYbkE3/JpCM+jKMpLCC4PvsojTRuDC6vR9jZNH7dFwAx/OTU/JTmKPhprA==
X-Received: by 2002:a17:90b:4b91:b0:1f4:e116:8f1 with SMTP id lr17-20020a17090b4b9100b001f4e11608f1mr2117410pjb.121.1660112450878;
        Tue, 09 Aug 2022 23:20:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e4-20020aa79804000000b0052ffc9d4ceesm732713pfl.69.2022.08.09.23.20.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 23:20:50 -0700 (PDT)
Subject: [PATCH] RISC-V: defconfig: Remove CONFIG_SECURITY
Date: Tue,  9 Aug 2022 23:18:42 -0700
Message-Id: <20220810061842.13755-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, heinrich.schuchardt@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_232053_899646_655D202A 
X-CRM114-Status: GOOD (  12.48  )
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

A handful of security-related entries were added to defconfig in
ba6cfef057e1 ("riscv: enable Docker requirements in defconfig"), and
while they weren't triggering any issues in that actual commit they are
tripping up kasan after the merge.  Remove them, so we get back to a
working defconfig.

Fixes: 4d1044fcb996 ("Merge tag 'riscv-for-linus-5.20-mw0' of git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
I'm not entirely sure what's going on here: just cherry-picking that
defconfig onto the merge base of ea0c39260d0c ("Merge tag '9p-for-5.20'
of https://github.com/martinetd/linux") start triggering kasan failures
along the lines of

[    2.497182] Unable to handle kernel paging request at virtual address ffebfffefffef000
[    2.498067] Oops [#1]
[    2.498304] Modules linked in:
[    2.498703] CPU: 3 PID: 88 Comm: mount Not tainted 5.19.0-14658-g318ec69153ba #16
[    2.499169] Hardware name: riscv-virtio,qemu (DT)
[    2.499581] epc : kasan_check_range+0x116/0x14c
[    2.500812]  ra : memset+0x1e/0x4c
[    2.501092] epc : ffffffff8025c7da ra : ffffffff8025ceba sp : ff6000008307fa60
[    2.501451]  gp : ffffffff81d6d100 tp : ff60000082fd3c00 t0 : ff6000008307fb30
[    2.501802]  t1 : ffebfffefffef000 t2 : 0000000000000000 s0 : ff6000008307fa90
[    2.502153]  s1 : 0000000000000004 a0 : 0000000000000010 a1 : 0000000000000004
[    2.502493]  a2 : 0000000000000001 a3 : ffffffff801f3022 a4 : ff5ffffffff78000
[    2.502842]  a5 : ffebfffefffef000 a6 : ffebfffefffef001 a7 : ff5ffffffff78003
[    2.503197]  s2 : ff5ffffffff78000 s3 : 0000000000000000 s4 : ffffffff8159de88
[    2.503545]  s5 : ff600001f7de99c0 s6 : ffffffff81d6e640 s7 : ffffffff81d78060
[    2.503913]  s8 : ff60000080ffad38 s9 : ff5ffffffff78000 s10: 0000000000000008
[    2.504465]  s11: 0000000000000010 t3 : 0000000000000000 t4 : ffebfffefffef000
[    2.504860]  t5 : ffebfffefffef001 t6 : 0000000000000002
[    2.505142] status: 0000000000000120 badaddr: ffebfffefffef000 cause: 000000000000000d
[    2.505570] [<ffffffff801f3022>] pcpu_alloc+0x454/0x7d4
[    2.505925] [<ffffffff801f33ce>] __alloc_percpu+0x14/0x1c
[    2.506227] [<ffffffff800901bc>] __percpu_init_rwsem+0x1a/0x98
[    2.506546] [<ffffffff8027f018>] alloc_super+0xfc/0x3da
[    2.506837] [<ffffffff8027fefc>] sget_fc+0x90/0x2c4
[    2.507116] [<ffffffff802808a2>] get_tree_nodev+0x24/0xa4
[    2.507410] [<ffffffff801e2564>] shmem_get_tree+0x14/0x1c
[    2.507705] [<ffffffff8027e840>] vfs_get_tree+0x3a/0x11a
[    2.508009] [<ffffffff802b2b54>] path_mount+0x2f4/0xbd6
[    2.508784] [<ffffffff802b3b2c>] sys_mount+0x1ae/0x26c
[    2.509099] [<ffffffff80003b10>] ret_from_syscall+0x0/0x2
[    2.509787] ---[ end trace 0000000000000000 ]---

they're only showing up on the QEMU virt "-smp 8" (not "-smp 4").  I'm
pretty confident there's some other bug lurking here and we've just
happened to uncover it, and while I hate to drop parts of the config
it's just too much of a headache to have a broken defconfig whih kasan
enabled.
---
 arch/riscv/configs/defconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..3ae79af77806 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -179,10 +179,6 @@ CONFIG_ROOT_NFS=y
 CONFIG_9P_FS=y
 CONFIG_NLS_CODEPAGE_437=y
 CONFIG_NLS_ISO8859_1=m
-CONFIG_SECURITY=y
-CONFIG_SECURITY_SELINUX=y
-CONFIG_SECURITY_APPARMOR=y
-CONFIG_DEFAULT_SECURITY_DAC=y
 CONFIG_CRYPTO_USER_API_HASH=y
 CONFIG_CRYPTO_DEV_VIRTIO=y
 CONFIG_PRINTK_TIME=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
