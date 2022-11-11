Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48E67C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 20:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CovT4RHnKc+xWYlHa2IYvoRBBswx3mssiKEluXPIvfc=; b=dhfcMaAtWaTEkN
	cn+2yq14M2zSQfRGGfWSeC7XrLo8DsV288PlmeNz4b3q2v9+50UFtcy+vkxwVOJZxYv8ZoZ7fbuf2
	M/8TRaQfO8g/Fq08/jqLeRNPuWFUyoXTlu7rAU/jEMyeuSk3dyenei3F7D4FM1yD+CMgqe59PF/SV
	FlatSzgpl27DbxWJ77GiajVSNFUiVlIDcLGkc+CvVded5P86J3zdtHoPoLT0G0Nj+ZsnfOfmo8c9Q
	VPhFUWuAeXKMPLrc5z/IHMUQauX9J72dB+hFZbAsqhI6PGlVmuDw9R0BBet9DlZQZIA3DA3qSvEgi
	c7/Eqx3zW4YTTxZ4jsyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaBy-000m54-F6; Fri, 11 Nov 2022 19:59:58 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otaBv-000m25-8f
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 19:59:56 +0000
Received: by mail-pj1-x1031.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so8627297pjc.3
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 11:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tiOSDnaJDiv/bd6hfVEdnOGaLX+kZWWhVL356AX2InA=;
        b=TkeO75onMN37rOHMxLyT5F2rMv2tOdJlZrq3BTAW7LyaUwnWA7XsEFvkuNxYWoquke
         7mkmYRz9zYKcuWbugrrJlnm7+iVDndnFJOOYHKLgvbRQKN5L+CViGDPlO2sucitqGLkU
         bNa2JUyPusiCwvZFd3vnQkniW0amRhAJIYJ3uOq1i7WBIIvmiqrGIWo0BDFxRInY6luB
         nU+jCGLaxXQTkuDtVxIWHUOc1rbJtyfWeHsHJFAnFA2bJvf1tBeBuLWZoiinbqYqKCCS
         nWRE+3+Byu2p5BZSp1y0IaGkU6Tg3FLIIzPrkMG5Zt/yNBDKwQxD5NN608POeObXdxFq
         tF0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tiOSDnaJDiv/bd6hfVEdnOGaLX+kZWWhVL356AX2InA=;
        b=ORIY+5f1yXGhCW+7/OqNe8tyab5+MW4Ak6gcF4xbHlk2uN7RTBcBSMXff8v7StTpYu
         X1nEwR9HPhUWZFPQTNFJozktW62gIwfZ8i2lf70CG/grZ+iU+70PUbetVeCFN/6zlG7G
         wOqvNmOrs81R0VsgfdQ0PeYNGWA1AT6VdbJKdIZAQtZcaTl84PKlt6RFl/mXPMxdbnkK
         nKCjOiY7CzjqFyWlQqNvJZLOR9sn0lZjZ4/d1XjnBbBN2pavIQZeDmhfFUZ8gCYTUhe5
         OpB3IbUQ8f4KzR5I5cM0IgCCr+XwbSXhtUh4LIg8aFWiJdL6ar9v10+WoQ6IsHAbqwee
         t2tQ==
X-Gm-Message-State: ANoB5pn6pqgw3VJ5SAQDw7wLO104AX1irWW5KJd/Fz9jswEyrujhrkLg
	LMwDNnESWXiAkR7P8v4rkhWJFw==
X-Google-Smtp-Source: AA0mqf6IZD60dm560FlolQXnq3OiNX/QLV4eHW8vxPqbGrcg1WXWRuX6WQ9ZzcGmcAwH+ANespCXCw==
X-Received: by 2002:a17:90a:5294:b0:20a:7c09:7993 with SMTP id w20-20020a17090a529400b0020a7c097993mr3635460pjh.149.1668196792427;
        Fri, 11 Nov 2022 11:59:52 -0800 (PST)
Received: from debug.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id z1-20020aa79901000000b005360da6b26bsm1954866pff.159.2022.11.11.11.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 11:59:51 -0800 (PST)
From: debug@rivosinc.com
To: palmer@dabbelt.com
Cc: jan.kiszka@siemens.com,
	kbingham@kernel.org,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	debug@rivosinc.com,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rivosinc.com
Subject: [PATCH] gdb-script: updated lx_current for riscv
Date: Fri, 11 Nov 2022 11:59:38 -0800
Message-Id: <20221111195938.1499148-2-debug@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221111195938.1499148-1-debug@rivosinc.com>
References: <20221111195938.1499148-1-debug@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_115955_331185_B238898E 
X-CRM114-Status: UNSURE (   8.16  )
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

From: Deepak Gupta <debug@rivosinc.com>

lx_current python gdb command defined in scripts/gdb/cpus.py updated
to support riscv architecture.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 scripts/gdb/linux/cpus.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 15fc4626d236..ce6703f1e35a 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -173,6 +173,14 @@ def get_current_task(cpu):
          else:
              raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
                                 "while running in userspace(EL0)")
+    elif utils.is_target_arch("riscv"):
+         current_task_addr = gdb.parse_and_eval("$tp")
+         if((current_task_addr.cast(utils.get_long_type()) >> 63) != 0):
+             current_task = current_task_addr.cast(task_ptr_type)
+             return current_task.dereference()
+         else:
+             raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
+                                "while running in userspace")
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
