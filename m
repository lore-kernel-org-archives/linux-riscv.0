Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69119C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:44:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3255C20821
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 20:44:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cXCjsuTm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gTiKLKvk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3255C20821
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qapk32hzrh5KHsTnVHDgwS8Gx4SWQhzKO1918rSCbjM=; b=cXCjsuTmCxmvZj
	etazVH6y+KTZEORm5BfwseC99an0cw9t+XmXCm8oTmfb9EYK7Vo/uBiNd5G6ZweX1Pan3zf2u5V0M
	3mpTWg//hzI8oYVe1vcDPgr0pgDrkJT/rDr5V479zcdUTIiW197vF6WjdbaPiEoLKeOXPWD+b+CaX
	TNE7Rlqw0WJMvOZVpeqAnB0SWxpkOjcl2xOlWdANRbzphdrv3weaJMIm1ieOw3LdWMRT7mIeiQN7s
	+ekd9GAOYj0xamfwJGunUJzsp1wH3N48OULjPlM8CE5KiQxmP+NQ7DRwfjlTbqhOEv+GEoYwATJ0B
	hYoxmEDCrmloem+68ySg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWSPZ-0007Fn-CG; Mon, 10 Dec 2018 20:44:17 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWSPT-0006xz-Vk
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 20:44:14 +0000
Received: by mail-wm1-x343.google.com with SMTP id a18so48740wmj.1
 for <linux-riscv@lists.infradead.org>; Mon, 10 Dec 2018 12:44:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4yAr4oLQB3CnpwnJps09lyoZ5diio3yMi3xmhatAbW4=;
 b=gTiKLKvkzXivXuWasgWojKRJZSxhAhyx8VCi4o6LjXsV2dwBHeWcNsciYpGEiMynOX
 M0Z/EAzR6mvTjCHnOkeOqf7cE9+7Rt02fah7bHN+OL4h162k/JMVceP/gPNXbNtumABx
 Gnzkwf+SlT9jFqEeLAjTrj7FmJs77raUKNuTgU1dp1l9ZmTTtcxutkE2vZfR4nOWd5WM
 aq9Ru14tKAm7Nsl8+1NUp1x3Ctf9btQW3oLY0jaoDLolHVUupoRw0Sz4J9TxMMnCDWC9
 IJcHVRExtbXpE3bUvgmOq/7IVAyVtYG+KJ3mdB5NgKDvoU3cqSTPngq6dHRqFD3hNK5+
 fUpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4yAr4oLQB3CnpwnJps09lyoZ5diio3yMi3xmhatAbW4=;
 b=Zwi1lu2aQ6Pu0thvXSsdTRRNF9ud+8mVS3ZVo8iDgRFRmYUURbrP5zFr40VbQgzEt5
 /TOaRHMG7AhbrXY9q0VqKVX6HZMQeGC5XyXxAV4hJou5BkCTXQ7aPJFx4ml1UoUcNDAn
 97He/RhDBE5WNVK/uNiiinGNMC4R2kFZQmXlv2sSLexsc7OCyhQF/zyvEX9PbodNLsi4
 nJ9zMvlI9nqce4N3Gc+0ZHqgfzM8EdaBHcCLNV5R3aDXUKJEDI7vH2+eMRWLd1kp4iEh
 y3H5UCDqo3I4EqLq+pqpM5NLpk/Rp5G6ZPwXVUdB4SJDy2KeIfqDp5/GOdmJVnakGHkZ
 SCEQ==
X-Gm-Message-State: AA+aEWZ6Ee8XUuWtfqaVeik4ksfkZaZ46qETGVbZE+bOgklMC/gN8NOr
 AfNu1NYTR3H/igzvhhc3uaE=
X-Google-Smtp-Source: AFSGD/XPUWDnMACC9jq9Dh2gzm1bEw6wpaTVQaySzt8qMCXNKHAPx3yMNOqDlAEcsEhCwfr2zyZ4xw==
X-Received: by 2002:a1c:ad45:: with SMTP id w66mr11850114wme.60.1544474641654; 
 Mon, 10 Dec 2018 12:44:01 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id b131sm26985wma.21.2018.12.10.12.44.00
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 10 Dec 2018 12:44:01 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: define NR_syscalls in unistd.h
Date: Mon, 10 Dec 2018 21:43:54 +0100
Message-Id: <20181210204355.3483-2-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181210204355.3483-1-david.abdurachmanov@gmail.com>
References: <20181210204355.3483-1-david.abdurachmanov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181210_124412_660613_A4CF0D51 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This macro is used by kernel/trace/{trace.h,trace_syscalls.c} if we
have CONFIG_FTRACE_SYSCALLS enabled.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Fixes: b78002b395b4 ("riscv: add HAVE_SYSCALL_TRACEPOINTS to Kconfig")
---
 arch/riscv/include/asm/unistd.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index fef96f117b4d..073ee80fdf74 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -19,3 +19,5 @@
 #define __ARCH_WANT_SYS_CLONE
 
 #include <uapi/asm/unistd.h>
+
+#define NR_syscalls (__NR_syscalls)
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
