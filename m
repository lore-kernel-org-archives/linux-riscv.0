Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F3AC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 29 May 2022 14:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qWAaV4mJNF14lwiUchVwkWTvOWHhzlBo0pK3QmLt4BM=; b=rOWbYf20eE/UiF
	sLQoAOnCQKHa6CgCqVsDGZDqT0phyVF6S7zsbofu+n2cVZWrssrtFS9efNLsBgdNtsdjeEf0nYD/e
	Y3mz6oKsxIjvgblslS3D2xuOGg8o11dnyJzTGHb7WgFBRkFV1T5sGt2YviJKxavbSTgIWZ8UBHW5K
	KacGN5AQcWS7FhShT/sdn2KmiBjRHjxVjTssvXMEEoRKN8YP7jGSHm+pWvJazDIjzqp08VI+FnsX0
	8ESoQ5hqY2iFoLTJhFKG565ZlKCE5hEzRvZNDYYFLu6JZIzh4Ygub0+uIMOTP+JReTZfXt6WldMxg
	gHwoPico2DO72sy7rSSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1x-0043wC-E6; Sun, 29 May 2022 14:36:33 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nvK1u-0043ui-7l
	for linux-riscv@lists.infradead.org; Sun, 29 May 2022 14:36:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id cx11so297288pjb.1
        for <linux-riscv@lists.infradead.org>; Sun, 29 May 2022 07:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ikslbsjjq2ux7Nk7Hm04X49P8YREor5oxwT+WQRuJlA=;
        b=aJO16Q/4s5uMH/N6u7ppFRc3VDO+PyYVrXAhgPBr1KDCPFpwPrsOD62+f0EEXu/lvc
         L0t4rf0TqNOpvKrAROrw/Bcjw3gfFVYuzB5y85TA81uPooilNsfhgC2J+FowacJLMaSt
         Go+LV1r24Yn2St6VEoC3rLwPUTDoahRX8eOTa/fCgSI6Nxy8IF1E1NDVTtzF3idSI1dz
         UFLjqnrhQ8TOLuiWNnYRCpQYSOWORrkMzyre8PwScxcAssuF6QfT+qJfmoYaDNVPwGBd
         4Dhiw7JgKVDgWLhvfnD5h2InuAC+mpStSW6AN7kc/bs6ztXbLlaCFTeWfos64rqkpjEt
         R9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ikslbsjjq2ux7Nk7Hm04X49P8YREor5oxwT+WQRuJlA=;
        b=h00GMbVqLzKTTOLIoMRGUo8NExpvY+aATZm9tDbkjv6mkHZn5atEKTZSAqVJRs+r9e
         LghAkPpc9ikKAGZ4dbacdOPEOnBLTOj8qZB6H3sanRRdKf8IxbUYebgilGGKDZbqM4nx
         /cA9K+/HpTb6dFtfHLPBckJcZ14w3dGQGtcD3dH5iCHN84/zyRtduZE/cE/qNAR9zMrj
         ZZ7dk4azam1RG9WuJobweReN2EW/fCMbplHZEqgY/BPGOEH3HKL9fKdtqOMbYlvL/5Qn
         6B6QcZEsMOmtP/BOTw9JGPFWYotgxe7+WbDUMRK88REFpv2XFc89/UBnMcynXVvhi9y4
         +iMQ==
X-Gm-Message-State: AOAM5319LBxsZn0havSm3h1RExIWSdTegrDpJIXpc85YoNgziGTZ+nha
	nPI1eQzAiyHEtijGSHTvLlidlnJA59oQDfgx
X-Google-Smtp-Source: ABdhPJwBSWnSi8/dt8RmpSxuLC/hRr7OeO/ewTs934ac4QAwdGcl+0M71amyjy/N4IUptC5XDQ9kHg==
X-Received: by 2002:a17:90a:fd87:b0:1e2:cdfc:cbd3 with SMTP id cx7-20020a17090afd8700b001e2cdfccbd3mr4892512pjb.28.1653834989040;
        Sun, 29 May 2022 07:36:29 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id h18-20020a056a00231200b005104c6d7941sm7066827pfh.31.2022.05.29.07.36.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 May 2022 07:36:28 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	mingo@redhat.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org
Cc: guoren@linux.alibaba.com,
	Andy Chiu <andy.chiu@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Zong Li <zong.li@sifive.com>
Subject: [RFC PATCH riscv/for-next 4/4] riscv: ftrace: do not use stop_machine to update code
Date: Sun, 29 May 2022 22:33:15 +0800
Message-Id: <20220529143315.3678563-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220529143315.3678563-1-andy.chiu@sifive.com>
References: <20220529143315.3678563-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220529_073630_311569_248B4326 
X-CRM114-Status: UNSURE (   7.84  )
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

Now it is safe to remove dependency from stop_machine() to patch code in
ftrace.

Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
---
 arch/riscv/kernel/ftrace.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index d4bf0e5255f6..e7b8bf0a699b 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -12,6 +12,11 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+void arch_ftrace_update_code(int command)
+{
+	ftrace_modify_all_code(command);
+}
+
 int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
