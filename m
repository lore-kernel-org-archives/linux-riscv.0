Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97C77C00A5A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jan 2023 16:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PTashnVMW0nYfIlADkpOZRhd4C0zat1Z4Bd8N7Z102U=; b=CYMm98I2Bl/6F7
	i4BDrHQ8+DWeEbaishe3Kq7t0Ee8oBY90X596plMtLnE61/l9IvGhaTQXQb89gNOU/2ZLkt1CqvEi
	FGdGTU9jtZoKYVlaYuiwp3X716BhzWyB2sQASOq33YK0cu3sBFUlfxiD2miMHN+Jl4BnI3ALuMZqJ
	Tf4csC4zrywDTM4YLQOBSuhRtEF99vpy8Z+V4h5o5huARjP4NrGgjUGSGryav+Y6yN+XvotEzaHub
	mwIc54c2RAtwaQHsbQa4zBimim3YiHKHHQUZ4LKKBRJn9t8Q/PLEjm22R+i8qpjV4sRzBXoj7yxbC
	WRi1zZo5HWIyN4Gk8QFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXPB-005png-PY; Thu, 19 Jan 2023 16:04:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIXP6-005pl3-Ru
	for linux-riscv@lists.infradead.org; Thu, 19 Jan 2023 16:04:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3828061CB7;
	Thu, 19 Jan 2023 16:04:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C585C433F0;
	Thu, 19 Jan 2023 16:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674144279;
	bh=J6NfBaiAHaZuC3c1U8Q2mwYoiCAI9Bs41guM1DxDgPc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rGvlB0CvLLTbE3PEOLaWlAM8hyCbtspLIpmMAXkQE65qKeOs1S5YQ6tFOIDNNMTzm
	 +mfaKlbigHE/gP4UIVpLKkUE8RGRAFTkwiUgY7UbGhAwFnghvwDYSxA3c8c+df+tEU
	 +TXbI3TJkWdTzjtp+4PwcoQY1uuf+slEpGzFUMAiEhuex7y9DTZRa3elnetXCqZEcg
	 J6QyYJbwP7Ni+xJqI5I5SWy/e+hvTRPVgwtDMy3tasF8/13mclwc4BQKJhm/3nNxXs
	 bV1G5T1YvVXfIcg3yoatppjIV7UlRoU3+cbjKK09/GhIkXKDRLZhxjqvpxAcSI/CyH
	 gPkwFYrYYBfMA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Kees Cook <keescook@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] riscv: lds: define RUNTIME_DISCARD_EXIT
Date: Thu, 19 Jan 2023 23:54:13 +0800
Message-Id: <20230119155417.2600-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230119155417.2600-1-jszhang@kernel.org>
References: <20230119155417.2600-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_080440_974984_7FDC6EA6 
X-CRM114-Status: GOOD (  11.16  )
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

riscv discards .exit.* sections at run-time but doesn't define
RUNTIME_DISCARD_EXIT. However, the .exit.* sections are still allocated
and kept even if the generic DISCARDS would discard the sections due
to missing RUNTIME_DISCARD_EXIT, because the DISCARD sits at the end of
the linker script. Add the missing RUNTIME_DISCARD_EXIT define so that
it still works if we move DISCARD up or even at the beginning of the
linker script.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
---
 arch/riscv/kernel/vmlinux.lds.S | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/vmlinux.lds.S b/arch/riscv/kernel/vmlinux.lds.S
index 4e6c88aa4d87..07c19f2a288c 100644
--- a/arch/riscv/kernel/vmlinux.lds.S
+++ b/arch/riscv/kernel/vmlinux.lds.S
@@ -5,6 +5,7 @@
  */
 
 #define RO_EXCEPTION_TABLE_ALIGN	4
+#define RUNTIME_DISCARD_EXIT
 
 #ifdef CONFIG_XIP_KERNEL
 #include "vmlinux-xip.lds.S"
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
