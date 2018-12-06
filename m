Return-Path: <SRS0=vQx5=OP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F69BC64EB1
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:27:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F087420868
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  6 Dec 2018 15:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="i5iIzj7P";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hVg1RZDu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F087420868
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sXfAztwrQ+hcEhRciM8To3Q8uj0kYOrh1tVkn4cWuTw=; b=i5iIzj7PLutlpv
	UIqTQ9i/zKaZ2OXVR/4yzd13bzVQAkuzQuZknS0uLvCz7xQxhhj7l2xmM0IALAbTeQ6geGazchNZq
	vlMnoLYJ88UpLe0C3b/7pTyqjM/P+YxvHrSTkeBe2Upg5r0G+dH1BdzdN5f6U1KJyqdYTBnyspZ4L
	XwMcJe9A360b8lIcPhtiAgdeDn35DCrh817Ixz5Igmrfs0nRZD/k1rPojOsksuUJn+UBuHDObaTD5
	hmbjK8Gdp04VNMnd9+yxm2coMue8W+q5YwqDyYf4lLgdCXrJW7g9EJifmAVmCQct5U7LgzvMu5lOZ
	9Pfxm7dU43Rk+Yv4l+8A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gUvYg-00047d-Ov; Thu, 06 Dec 2018 15:27:22 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gUvYI-0003Mk-48
 for linux-riscv@lists.infradead.org; Thu, 06 Dec 2018 15:27:06 +0000
Received: by mail-wm1-x342.google.com with SMTP id m22so1478107wml.3
 for <linux-riscv@lists.infradead.org>; Thu, 06 Dec 2018 07:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UMyQ0l8+47IG6BmvT/+HBiVzvTDCovW0W1P3gCfHncc=;
 b=hVg1RZDurGz7XeOvzS137o1lccXwXH7Q8+VSheaXlUkJT1DFHTAq9KOI+HM5yZ5V21
 EJfX0EN3j7Hf+Q7vOBbOmBZCWd9/oL4jl5tGPbuymSFUK2OTchG0umHOC8/jPgXzk0t6
 BmP5RQiIfFf8qxxr8hJmE/x3KfWnEw4m9f7CPb40UTeFRzGsjLQK5DEw+uMnla1P5jut
 5SGXqVIEl9JajuNKqoIkdB9K7kF1GPIgokIrrDbkcFkB2AZ92COLNAgFr9JyDuJtu7Zy
 IALaiQKedPwuG89HuJUn5zULHxn3vlFW4nfZrxaNi+fyp+at7P1S3BSM7TRvretBsEFW
 bDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UMyQ0l8+47IG6BmvT/+HBiVzvTDCovW0W1P3gCfHncc=;
 b=R3anIZPhjFDFqCigDtHvIWp7Ynt0GHtMLqmURQ1UTnfCP1B98sfTFb/p0u5JomW2kD
 PDYTk43ZEy5eZtgiKT/gsxu416HYUqxkoNMKVk5iRDTiTqzXnhyNnMMbRK88hyP4yg+3
 0ZX54wAu4wz6l+/sCk6MIX8Sw66BJ0i9tcmAV41jIoKUh1clV10ugwwW1SOAIRDgQb2M
 c+gab0C5ezerLkQiWS43SzqTNETMkYHhcbHKjXBSLzkacay6Iq7vMFwMCvn+Xiyf0a6x
 5o2fgrtqoa+aMwTXxVPbcHhkJejkzSEy8egpjkyfOubb8dayizb3ZjBzjuMUWdzH86P+
 t6EQ==
X-Gm-Message-State: AA+aEWaark44iJQobTwe/FDdltSwf7glLIVPwpqRUV+kJo0fDonFmf9a
 pl0tzTii2GPtaTAeYm7r4bDv9MPWdXI=
X-Google-Smtp-Source: AFSGD/W9W6wYjJuqQqRRih6JBEIdEae18Xjv/h0/qgKCz1CNQwzm2KLnHJYOhjElTRzGJFQTEtp0IA==
X-Received: by 2002:a1c:3a8d:: with SMTP id
 h135-v6mr19942350wma.92.1544110006437; 
 Thu, 06 Dec 2018 07:26:46 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id w6sm529728wme.46.2018.12.06.07.26.45
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 06 Dec 2018 07:26:45 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] riscv: fix trace_sys_exit hook
Date: Thu,  6 Dec 2018 16:26:34 +0100
Message-Id: <20181206152635.1869-2-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.2
In-Reply-To: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
References: <20181206152635.1869-1-david.abdurachmanov@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181206_072659_516115_6A434F61 
X-CRM114-Status: GOOD (  10.57  )
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

Fix compilation error.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
---
 arch/riscv/kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index c1b51539c3e2..2fd9ec48106b 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -177,6 +177,6 @@ void do_syscall_trace_exit(struct pt_regs *regs)
 
 #ifdef CONFIG_HAVE_SYSCALL_TRACEPOINTS
 	if (test_thread_flag(TIF_SYSCALL_TRACEPOINT))
-		trace_sys_exit(regs, regs->regs[0]);
+		trace_sys_exit(regs, regs_return_value(regs));
 #endif
 }
-- 
2.19.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
