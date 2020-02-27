Return-Path: <SRS0=0+L8=4P=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B973EC3F2C2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 21:35:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E23924677
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 27 Feb 2020 21:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AUwTnjtT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="uXZzIxo8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E23924677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:To:From:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3j2hvJMpq/q8KaX+62obi9xX+88RkfLzjLfHwZgX5Y4=; b=AUwTnjtTc6V3UrbxL3S3TDrf0
	jkMmU26ZzzhDIh7xRjVohqrGBoqtM3ajFnKXyHCDLp8GUOLxOvHvOaL7ugw8A5U51thQ3lm32HyXH
	vMFDaNT+htQwoIEj3ApLagtzcvS0PqAkxAjn6zPHmtMXe+qy5XVHIVKuTfj42Eb09T6TnkBNsJVn4
	6Q4iUgcNOKo41YoL/o7P6FM+cn8jZmp0vLxSj+h7ve7HDCZDtvevs9RAwONunwBxgOxTnnD2CfmIG
	NAYe7S3igrN/mteErQm8N7pZxeuQ0Vr8eda+7n+fKKVdjBFK+yWZm+601jccFnQwEDBg3n4NhAdsc
	zEcDh1gbA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j7Qoy-0007lZ-I0; Thu, 27 Feb 2020 21:35:52 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j7Qow-0007hS-E5
 for linux-riscv@lists.infradead.org; Thu, 27 Feb 2020 21:35:51 +0000
Received: by mail-pl1-x641.google.com with SMTP id u3so324771plr.9
 for <linux-riscv@lists.infradead.org>; Thu, 27 Feb 2020 13:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=3j2hvJMpq/q8KaX+62obi9xX+88RkfLzjLfHwZgX5Y4=;
 b=uXZzIxo89Z4LxTDa6mxgsSUY1VE3WEALGEbe6IW2oRxdnpOM5JB2tvy2SP9CnMMUL3
 L39qPT+dFrfWx4Q1a/A4M3+5ImvJVTf0eQJpVkrG2NQ9lxUgp456wM3JJq22FPbv1jfL
 lu2jOnckNAVd6oInp4DW6NhzKhkbk9VpswMcMBXa6JVawd7QdddHzwCgQmR6VVQ2TVFu
 ++h6qKA35rg2IYcw0MA2bXgdP5O6qiOCqnbl1nD1NWdyCC7gonRCQ7OpuoBXxZwr5UWM
 MLOccK5Mh+C6S8SJiPa3HoUZ6Jvdisx15xTzm7ekYyj9YOsFF8EM4p6H+yEkIojmPcVm
 d6HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=3j2hvJMpq/q8KaX+62obi9xX+88RkfLzjLfHwZgX5Y4=;
 b=OV5iJkberaNYBBGMx5eMxKiqXHTm9Rj5e/2GIpRcAugCfSx5kGpBaqw7Wno/YUTdJt
 OwkuzR92MTWnArxxEAXorytlqMLr05KSZJKcoMWV2EstrrCxbvxfw/jTaaST7/qZ+hTs
 /lX2RWi7sbD5P72F+4Rv0vQ1HQYjPWfO2rakEM0rEoxg5X6328cwjDtY4XB2bDgxQCTp
 J7feCJgbXpoYhV+U395WfOpYd2im+F/qlXzoopYQZY6/NiFrFVhnarL8fL6Z45doN/3z
 IsliEnywfWRPvkY+8wrXmA8yXJQ1REqiJG3jQD0up+km+W9NB8P2vcpoS6o7ZInlJDHz
 VtHw==
X-Gm-Message-State: APjAAAVrlK+VCwmT8rgfHiqWg/mB1lv78wD+kanGLGuvfNlEXETh5QyS
 uP0Nr6sMMufo7PKMBLKD3HnFPw==
X-Google-Smtp-Source: APXvYqwFdyfYW/BOsbTXa99Ah8PH7ILIGEXzCbznhwADcIu4uLZidf2EfB1n6jarymqXJi839ZaLdQ==
X-Received: by 2002:a17:902:8b89:: with SMTP id
 ay9mr740609plb.309.1582839346217; 
 Thu, 27 Feb 2020 13:35:46 -0800 (PST)
Received: from localhost ([2620:0:1000:2514:23a5:d584:6a92:3e3c])
 by smtp.gmail.com with ESMTPSA id p21sm8047800pfn.103.2020.02.27.13.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 13:35:45 -0800 (PST)
Subject: [PATCH 3/3] RISC-V: Stop using LOCAL for the uaccess fixups
Date: Thu, 27 Feb 2020 13:34:50 -0800
Message-Id: <20200227213450.87194-4-palmer@dabbelt.com>
X-Mailer: git-send-email 2.25.1.481.gfbce0eb801-goog
In-Reply-To: <20200227213450.87194-1-palmer@dabbelt.com>
References: <20200227213450.87194-1-palmer@dabbelt.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200227_133550_487690_DDE9FF70 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: clang-built-linux@googlegroups.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, kernel-team@android.com
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

LLVM's integrated assembler doesn't support the LOCAL directive, which we're
using when generating our uaccess fixup tables.  Luckily the table fragment is
small enough that there's only one internal symbol, so using a relative symbol
reference doesn't really complicate anything.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/lib/uaccess.S | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index f29d2ba2c0a6..40bf130073e8 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -5,12 +5,11 @@
 
 	.altmacro
 	.macro fixup op reg addr lbl
-	LOCAL _epc
-_epc:
+100:
 	\op \reg, \addr
 	.section __ex_table,"a"
 	.balign RISCV_SZPTR
-	RISCV_PTR _epc, \lbl
+	RISCV_PTR 100b, \lbl
 	.previous
 	.endm
 
-- 
2.25.1.481.gfbce0eb801-goog


