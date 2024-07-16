Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D00CC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 20:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RTWGhk/mJN4Z3rU3q0lEH/Sfgyy3Qcje3Ohtdxjp6dg=; b=hmL9vcndRvJV2T
	PIt+cXKcx+/bEHTsfELq6QZoKJsYbpD5SXh/J9UfWtIF+DkzZxDTcMLLk9HP4oygRrUSWjpxqIzfm
	Sm7FZEUUatfeh8W6mC1tvHPoTnoRhbKZ7ktFxoHDqu9QmyxoLt+5j0piILEX8a+z7YkvM4Gd9oHaE
	K9Cu4hNf6wV3ByCCeA8okIH7M/fodDjH6tXZEq0TzXOzBvHJxC2BVpp4aKlEX6ruVOjjBXkM6MYly
	ZIs1dPvuZuCl0/pmZlZSgr5JufRnIQ9nfmVCd/N6++wdKNnqcAJd2bKb0dU7tGuo20Vg7SoMPQ/Tx
	cJjhXmYAcmYknGyIuuOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sToyr-0000000BhT6-2gZ6;
	Tue, 16 Jul 2024 20:41:01 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sToyo-0000000BhSY-2BOc
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 20:41:00 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-52e9c55febcso7793031e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1721162456; x=1721767256; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YMdxg3WCwHw04RHmhTv9jlPPA04o7My1YPASt49ZqeQ=;
        b=cLbZmg8ww2M9RvwqB0uD9xUv4eLwfPdpSR+BmPqEfzEN0iGPnuKO/JcF0H7ppxXJH/
         oxud6oxyokOVgchPE1ONSMnzIDXXn4Wml54SwWdljPqlAqx6SlYY39a+0pJjQmQsD9ZB
         /DU7wYXmViQi6zAaYOajHr7A3SoqMKuZDXcGvqGY+CpK7zLwAsw0ohAL2mTs/QHZ63uB
         tS6iGiiXHBoG7Y93htjNSMavk1FmyYzyrhwXvHaEdvfOy+FMESFAPpKo8JI7gAcfydyf
         bjKoFc195eBEjDZB8pM0M1LLZPv1WK2EtJ2qWhCTD5NPX9rxVa0HYSJ8DQ7gjKqTbSta
         xFcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721162456; x=1721767256;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YMdxg3WCwHw04RHmhTv9jlPPA04o7My1YPASt49ZqeQ=;
        b=Ew+fdy91a8ixvkdlT0w5Ms1U201e9PaH+bNAEAQgG7pLrTgPPJ77hEwq/Eva7ni2t6
         0gijh+jGQbO1KipkxOiyIMfZDRpRaO6cd7lKcxZ8gmSkU2sURbdKat0TVl/uPx5g548N
         46cyF69uYDgkYtiPnsoh9yV+bb58Kkcn0l/foGQGKEwBJ+0y65eU2xUGZTQGrtRS6zkJ
         +zjL/fqk5UqNaQPdzuPkQAj1yAZTqDo1vUbE+9nzIBAzYmqbzD/yydjD0Wgg88RW8ZYE
         gW5Ea712LNlZElrN2eui7yz6eUSX22jDuyWavZM7xfuoomT/4dNzSHN7P1hDx+KjaYQu
         cxew==
X-Gm-Message-State: AOJu0YzTJdtaXcMRN/wF5/IxuJAgbm1EAB/TebXKmtvqMMYrW5yawQAi
	n2YspgqxwKL9OeQJP+Mr77ec+5GYeDmCf7eL7P+veCetLBByGiI=
X-Google-Smtp-Source: AGHT+IGOSCmfEE2w313/uxtqARZUa2eopmYvj2gIVS9Exg7eTgrFdKFNUJQS4TG2vJz6Kz9djUKE1g==
X-Received: by 2002:a05:6512:224e:b0:52c:d90d:77aa with SMTP id 2adb3069b0e04-52edf034b88mr2113388e87.61.1721162456118;
        Tue, 16 Jul 2024 13:40:56 -0700 (PDT)
Received: from localhost (ip-005-147-049-029.um06.pools.vodafone-ip.de. [5.147.49.29])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-a79bc7f1d79sm354825766b.100.2024.07.16.13.40.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jul 2024 13:40:55 -0700 (PDT)
From: Daniel Maslowski <cyrevolt@googlemail.com>
X-Google-Original-From: Daniel Maslowski <cyrevolt@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Daniel Maslowski <cyrevolt@gmail.com>
Subject: [PATCH v2] riscv/purgatory: align riscv_kernel_entry
Date: Tue, 16 Jul 2024 22:40:47 +0200
Message-ID: <20240716204047.7649-1-cyrevolt@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_134058_618125_0C359C67 
X-CRM114-Status: UNSURE (   8.89  )
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

When alignment handling is delegated to the kernel, everything must be
word-aligned in purgatory, since the trap handler is then set to the
kexec one. Without the alignment, hitting the exception would
ultimately crash. On other occasions, the kernel's handler would take
care of exceptions.
This has been tested on a JH7110 SoC with oreboot and its SBI delegating
unaligned access exceptions and the kernel configured to handle them.

Fixes: 736e30af583fb6e0e2b8211b894ff99dea0f1ee7
Signed-off-by: Daniel Maslowski <cyrevolt@gmail.com>
---
 arch/riscv/purgatory/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/purgatory/entry.S b/arch/riscv/purgatory/entry.S
index 5bcf3af903da..0e6ca6d5ae4b 100644
--- a/arch/riscv/purgatory/entry.S
+++ b/arch/riscv/purgatory/entry.S
@@ -7,6 +7,7 @@
  * Author: Li Zhengyu (lizhengyu3@huawei.com)
  *
  */
+#include <asm/asm.h>
 #include <linux/linkage.h>
 
 .text
@@ -34,6 +35,7 @@ SYM_CODE_END(purgatory_start)
 
 .data
 
+.align LGREG
 SYM_DATA(riscv_kernel_entry, .quad 0)
 
 .end
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
