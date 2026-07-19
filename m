Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E141C4450A
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 09:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=60882D1sQjnJ5vNOj+a3UHHgKxW7rQwbx2RBbgDrS9s=; b=2vwZr7fp2xs0e1
	6vW0sfLjeup3aoAeKdQQHzCJHpGe19f/4cl0aMbBWP5J32wTQc4oQDs0AdYXM47bSxRfXGDEqG6IB
	VTtnyiFqNFJELFKf0YiOjUL9XSzPDLf7VZtcm454bQWQpGeKWNT+Pce39XFNNog+9s0FRd87C0qlm
	viXDFBkdyAJFWXKo5NYqWnvowBn1bw4D8vXuQGduMIo1Yb2t/7Iyv6WdK/Fja7cvYELsWBzoqJjZb
	tGvf54Hh+RkUKPnE/BfeOWvgMvUn+zGqkelWNIleCJeQEdPnSYAfvAlihudNmitXBMBG3TpYA+A5t
	na0+AAYl/mZ3peBcKQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNrj-00000004spj-0ksU;
	Sun, 19 Jul 2026 09:31:19 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlNrg-00000004soO-0KiA
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 09:31:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=MR
	1em4uw38DdLU279Tm9E4dNiS95LkceEmY7y3H4yaA=; b=cvNWvo2+HHlc8/5vsF
	UFqnRKBSg6KvqdT4Apkl93UR9ddCNjqdRoTI+G7yyiXnOcwfdi9nPGTTIS3TLJeF
	2YNJZ925PShUT3gZzKsn1rbyuAwAeoEdHum5HpjhKNqtLV16RAjQGbhwWTsuizgs
	liRKAqr97GaDR7J09E0H+jdxE=
Received: from Ubuntu.. (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgCnTyswmVxqbA0SIA--.60699S3;
	Sun, 19 Jul 2026 17:30:25 +0800 (CST)
From: Xiaofeng Yuan <xiaofengmian@163.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] riscv: mm: make EXECMEM_KPROBES writable without CONFIG_STRICT_MODULE_RWX
Date: Sun, 19 Jul 2026 09:30:23 +0000
Message-ID: <20260719093024.33351-2-xiaofengmian@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260719093024.33351-1-xiaofengmian@163.com>
References: <20260719093024.33351-1-xiaofengmian@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PygvCgCnTyswmVxqbA0SIA--.60699S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Xw43Cw1DJF43uF15XrWrZrb_yoW8JrWxpr
	ZrCr45uFZ3Wr4Yy39ruw48ur4DAanIya17tw1jkry3t3yjyr90qrn8Xr17Xry8WF4Uua1x
	ZFn3uryfCayjka7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07Uuv35UUUUU=
X-Originating-IP: [39.187.244.72]
X-CM-SenderInfo: p0ld0w5hqjzxldq6il2tof0z/xtbDAREkJ2pcmTH-EAAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_023116_514174_91FBC3A1 
X-CRM114-Status: UNSURE (   9.62  )
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

When CONFIG_STRICT_MODULE_RWX is not set, execmem cannot create
temporary writable mappings for read-only executable pages. In this
case, the execmem ranges must already have writable permissions.

Currently EXECMEM_KPROBES unconditionally uses PAGE_KERNEL_READ_EXEC,
which causes kprobe instruction slot writes to trigger page faults
on systems where CONFIG_STRICT_MODULE_RWX is not enabled.

Fix this by using PAGE_KERNEL_EXEC when CONFIG_STRICT_MODULE_RWX
is not available.

Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>
---
v2: use CONFIG_STRICT_MODULE_RWX instead of CONFIG_ARCH_HAS_EXECMEM_ROX (per Nam Cao's review)


 arch/riscv/mm/init.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 5b1b3c88b4..c3367ff35b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1457,7 +1457,9 @@ struct execmem_info __init *execmem_arch_setup(void)
 			[EXECMEM_KPROBES] = {
 				.start	= VMALLOC_START,
 				.end	= VMALLOC_END,
-				.pgprot	= PAGE_KERNEL_READ_EXEC,
+				.pgprot	= IS_ENABLED(CONFIG_STRICT_MODULE_RWX) ?
+			  PAGE_KERNEL_READ_EXEC :
+			  PAGE_KERNEL_EXEC,
 				.alignment = 1,
 			},
 			[EXECMEM_BPF] = {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
