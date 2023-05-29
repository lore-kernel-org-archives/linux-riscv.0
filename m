Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C18C7C7EE23
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 19:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OUK0xedM4ZSHjxc+e/EWLbF4BFTsAJ0qzBBYcXddEiU=; b=dO8iCAhe2t7ZuB
	ipERhopaH4cUuAamBDyuN0vLmrQSLJXOMup/qITrEK9hGcuo+RABupxKkp+1OUcm+ZNoMLGRzgHD+
	bhBuwT2kSnPIzKS6CQ6IDDBgXxrUz/wcHOztzIuHCi9MwMQzqFEqktMldNOZhvi5XXnkHUo0c23sr
	LFh0+rGU65uQK6Ynyci+sXxijaG05g44V/vGJXK5PrvDcud8Z9PWC76nETLzOhuqSZeygh7NFA123
	9pY/6JQwAo4LVG/A1uRlGgUjtsHmcXKZUOuQiXsBwt+YoohMLnVU+nsArQNo0FH0DskBUPM4d9vDF
	6u6Dattb7BskM1t/00sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3itO-00BYL4-02;
	Mon, 29 May 2023 19:50:58 +0000
Received: from bg4.exmail.qq.com ([43.155.65.254])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3itK-00BYJ0-0y
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 19:50:55 +0000
X-QQ-mid: bizesmtp83t1685389840t1ldvvpj
Received: from linux-lab-host.localdomain ( [119.123.130.80])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 30 May 2023 03:50:39 +0800 (CST)
X-QQ-SSF: 01200000000000D0V000000A0000000
X-QQ-FEAT: dKvkn8qoLrFfEd304t1Xl83vvHzcvnC5EbPGl6s3cJET+n5LM1YDkRuZaPpId
	hp3bJ7KbDOlPLie0wL+QhZCmS6Ym5I3VeBvkxj/bRb7MTlDa33drXsOjI66pujE8j+7fncI
	L6Fnw0neLjbdK/6pgleFNIAbeK+rx1MA282jNwz6q+2YZuvTDOoBUf7/B8xqBW6Dp09Wb7f
	ism+NRTnMMJSNVs2lNPqesZMBxOJtK74ASsYMXd7AcpK5Hk3+rPgSmwIA3ip8LF7iOG9w92
	OlkSZ79gWfXHiVBWBtuYYBw+EqMK32qFP8x0dcMKGHEqR5eYUDKrGKxOzVNRmgHxiASOB30
	XPiK6fv7mSwkQeCgPpPSdu8qQiUeTDy2D5zRv+KIP5aJ4AFOm3hh77HWm7UxQ==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 18400951668219620669
From: Zhangjin Wu <falcon@tinylab.org>
To: w@1wt.eu
Cc: arnd@arndb.de,
	falcon@tinylab.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	thomas@t-8ch.de
Subject: [PATCH v2 04/13] tools/nolibc: add missing nanoseconds support for __NR_statx
Date: Tue, 30 May 2023 03:50:34 +0800
Message-Id: <4cd637be248b5bfad6f2a01b82a9fb6f3fe4c6fa.1685387484.git.falcon@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1685387484.git.falcon@tinylab.org>
References: <cover.1685387484.git.falcon@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz3a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_125054_639806_B272F75D 
X-CRM114-Status: UNSURE (   9.19  )
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

Commit a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
added nanoseconds for stat() but missed the statx case, this adds it.

The stx_atime, stx_mtime, stx_ctime are in type of 'struct
statx_timestamp', which is incompatible with 'struct timespec', should
convert explicitly.

    /* include/uapi/linux/stat.h */

    struct statx_timestamp {
    	__s64	tv_sec;
    	__u32	tv_nsec;
    	__s32	__reserved;
    };

    /* include/uapi/linux/time_types.h */
    struct __kernel_timespec {
    	__kernel_time64_t       tv_sec;                 /* seconds */
    	long long               tv_nsec;                /* nanoseconds */
    };

    /* tools/include/nolibc/types.h */
    #define timespec __kernel_timespec

Without this patch, the stat_timestamps test case would fail on rv32.

Fixes: a89c937d781a ("tools/nolibc: support nanoseconds in stat()")
Signed-off-by: Zhangjin Wu <falcon@tinylab.org>
---
 tools/include/nolibc/sys.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 154194056962..98cfa2f6d021 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -1175,9 +1175,9 @@ int sys_stat(const char *path, struct stat *buf)
 	buf->st_size    = statx.stx_size;
 	buf->st_blksize = statx.stx_blksize;
 	buf->st_blocks  = statx.stx_blocks;
-	buf->st_atime   = statx.stx_atime.tv_sec;
-	buf->st_mtime   = statx.stx_mtime.tv_sec;
-	buf->st_ctime   = statx.stx_ctime.tv_sec;
+	buf->st_atim    = (struct timespec){ .tv_sec = statx.stx_atime.tv_sec, .tv_nsec = statx.stx_atime.tv_nsec };
+	buf->st_mtim    = (struct timespec){ .tv_sec = statx.stx_mtime.tv_sec, .tv_nsec = statx.stx_mtime.tv_nsec };
+	buf->st_ctim    = (struct timespec){ .tv_sec = statx.stx_ctime.tv_sec, .tv_nsec = statx.stx_ctime.tv_nsec };
 	return ret;
 }
 #else
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
