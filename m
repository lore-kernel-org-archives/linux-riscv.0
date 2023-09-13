Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0261CA5535
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 10:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k9QiU7mCNnF5BMx3elantRI2uLvK7TKwstD3x4e87HY=; b=OLJhY5jjvXyzzi
	5L08Qg5oAxOCjvszhV9I3RRne6I4kNlQgqACXq5ExUKvIuN2jxwDwsD23ysyZ3d3g611ISLned/7m
	ANXHZLBPHKNzyIyofCUS3RBVMfSiI7fzBpLzZhEZ1T4iHWChDzsdcH9Os7HkD7jfJnRw2tnxGgRAp
	C3pPpBKxCgsKxkrtTUmbwA9EpOGpNcR2STRVPxX1/XRXiLtIAYeFJzzX2FtH9hVVHYidOpbanq0Xh
	W44+B4AK8m0JoEbm6lav9Ycn5j8PQtSC8VC33dne1FE7pHZ567qHsof8kmIJuazJY6oe4l7+Ebx3b
	hsaQLcnFjBytR2LhTHnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgMuF-005Nym-2d;
	Wed, 13 Sep 2023 10:15:35 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgLuJ-005FbK-14;
	Wed, 13 Sep 2023 09:11:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 66A04B82257;
	Wed, 13 Sep 2023 09:11:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6B92C433B8;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694596290;
	bh=RibUDN9R+mVe2Lz6B7/1/Dio8c9tfQM7q2jS6jar4RM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PRyNez8Os2r73tRnPuMkOsNStqVtl6GUBe6Dtb4wua2O3Z2WQDaETz0xSqQNi0+ZV
	 k2J0Xhph6ulihlVMPwEtUV2BhzROmRMIgvZhoiby/ePvz1kzvaOq8PGLsXVJIjYS2c
	 EiE6iQYMTpD1X1viQDoQEQvVUz5uB9EZIQw5DF2iYLn2CFh+6K6qJqyXAmpkeEU/dh
	 gzJX1VlKpU12g3dzx78JvFg99ONL1+sghX3CBQ2fQN2kaRBTHw4Q/yzIWAilVs06EX
	 uEUVoRY60WHnICf2u7H/R3oV7Sqnk+gSe27Xv/CilA2UYLUBl3yPoUjspuVD7WsiHI
	 x6nRiaIdPIfow==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADEC5CA5518;
	Wed, 13 Sep 2023 09:11:30 +0000 (UTC)
From: Joel Granados via B4 Relay <devnull+j.granados.samsung.com@kernel.org>
Date: Wed, 13 Sep 2023 11:10:57 +0200
Subject: [PATCH v2 3/8] arch/x86: Remove now superfluous sentinel elem from
 ctl_table arrays
MIME-Version: 1.0
Message-Id: <20230913-jag-sysctl_remove_empty_elem_arch-v2-3-d1bd13a29bae@samsung.com>
References: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
In-Reply-To: <20230913-jag-sysctl_remove_empty_elem_arch-v2-0-d1bd13a29bae@samsung.com>
To: Luis Chamberlain <mcgrof@kernel.org>, willy@infradead.org, 
 josh@joshtriplett.org, Kees Cook <keescook@chromium.org>, 
 Iurii Zaikin <yzaikin@google.com>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, Guo Ren <guoren@kernel.org>, 
 Alexey Gladkov <legion@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, linux-s390@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
 linux-ia64@vger.kernel.org, linux-csky@vger.kernel.org, 
 Joel Granados <j.granados@samsung.com>, Ingo Molnar <mingo@kernel.org>
X-Mailer: b4 0.13-dev-86aa5
X-Developer-Signature: v=1; a=openpgp-sha256; l=1714;
 i=j.granados@samsung.com; h=from:subject:message-id;
 bh=/mE3FCrO8N9N5ocA17o8WorvC+93ienB9ASm3953JX0=;
 b=owEB7QES/pANAwAKAbqXzVK3lkFPAcsmYgBlAXy+P6IyIJVAiVruEBhUNPQKqpELjF18dzfN2
 Sau5oc9p9+JAbMEAAEKAB0WIQSuRwlXJeYxJc7LJ5C6l81St5ZBTwUCZQF8vgAKCRC6l81St5ZB
 TzOGC/wKtjbMwVyYSrKGZCdpsS8BeR6Sb+Sw1O/9MDzjfyeDErxvdriTX+K97uSfafn9EC9VkE4
 3+Dp5zJgbrSjxpxaY2pQf/y4ZqY0JxZ0XcLRBRaXvXHA4u/m2ZyMGMCFwXPcQ0TxgJJaeL7z1M2
 e0gVVu0zh/JY3KgtFwL3m+F2xqoPO5vSfr0CQMtxeGtoCRzB7GaeJOZKfjaNfg9MTQ9pd97hzBv
 IUrCdqoOJomMpsFaPQH7XD/nTx/PznAIXJTILEYG3Q5+bJd8wNgyEu2FJqYY5PJrl4XgVS1lxo1
 kU6vP6K1K5MEB4/41nrGXYIbQaG5xcCKIJ6aaIe5MI7VPHkPALZYq34tMa04Rb6q1qZlNVGmgln
 zZrnVgpFSoN7JFJig1ruKLb7yTIGrMX/dyYqV4XGkG5Tf7fyvC4WTycYJB590I/V2P9s9jSr8xv
 9FPq+RexsVQK5qYHFtthR/GrgPD5lrwWhuEzkCp0GM7f7Kh9f4hEAmQ+CxP14FEa65FCw=
X-Developer-Key: i=j.granados@samsung.com; a=openpgp;
 fpr=F1F8E46D30F0F6C4A45FF4465895FAAC338C6E77
X-Endpoint-Received: by B4 Relay for j.granados@samsung.com/default with auth_id=70
X-Original-From: Joel Granados <j.granados@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_021135_678402_8E26AF37 
X-CRM114-Status: GOOD (  15.60  )
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
Reply-To: j.granados@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Joel Granados <j.granados@samsung.com>

This commit comes at the tail end of a greater effort to remove the
empty elements at the end of the ctl_table arrays (sentinels) which
will reduce the overall build time size of the kernel and run time
memory bloat by ~64 bytes per sentinel (further information Link :
https://lore.kernel.org/all/ZO5Yx5JFogGi%2FcBo@bombadil.infradead.org/)

Remove sentinel element from sld_sysctl and itmt_kern_table. This
removal is safe because register_sysctl_init and register_sysctl
implicitly use the array size in addition to checking for the sentinel.

Reviewed-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com> # for x86
Signed-off-by: Joel Granados <j.granados@samsung.com>
---
 arch/x86/kernel/cpu/intel.c | 3 +--
 arch/x86/kernel/itmt.c      | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kernel/cpu/intel.c b/arch/x86/kernel/cpu/intel.c
index be4045628fd3..e63391b82624 100644
--- a/arch/x86/kernel/cpu/intel.c
+++ b/arch/x86/kernel/cpu/intel.c
@@ -1015,8 +1015,7 @@ static struct ctl_table sld_sysctls[] = {
 		.proc_handler	= proc_douintvec_minmax,
 		.extra1         = SYSCTL_ZERO,
 		.extra2         = SYSCTL_ONE,
-	},
-	{}
+	}
 };
 
 static int __init sld_mitigate_sysctl_init(void)
diff --git a/arch/x86/kernel/itmt.c b/arch/x86/kernel/itmt.c
index ee4fe8cdb857..5f2ccff38297 100644
--- a/arch/x86/kernel/itmt.c
+++ b/arch/x86/kernel/itmt.c
@@ -73,8 +73,7 @@ static struct ctl_table itmt_kern_table[] = {
 		.proc_handler	= sched_itmt_update_handler,
 		.extra1		= SYSCTL_ZERO,
 		.extra2		= SYSCTL_ONE,
-	},
-	{}
+	}
 };
 
 static struct ctl_table_header *itmt_sysctl_header;

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
