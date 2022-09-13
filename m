Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF4BC6FA8A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Sep 2022 09:44:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HI9gbGe1WzYkUpS8EyvnMU0Tub27f8qyJXPGgWQZs+w=; b=iMYFMy4+oscJ+y
	7sroJIHsfqCinW0S1BPsyR94t++Bs7Co0j2uc7eXjvFd9D3z9Xe46l4Va3SoDI80/+e9OxAdY6L+j
	lK7emhQme2lfAwGLQ4A8s7sl1ARO8FTzqLhNDW1BiTp3Ypp2uLJgEcvwIR8JWlgU2DYbmlvAwUETT
	wvgdQTtg6ul7YdG25FIvxQq6M9Jw7raFeT+4hLBieXhL+fWnLfAxr3+41JDcTsxF3qwPzrrY4ASlk
	djW9JJBvptQbL33FIZoSHgCK496Y2SUajn4ljpaYVjTVOfSzx4zUXW0xBGRutHSVEtnHq5FaxDR1D
	AnIDl8Fq7u2kRBWJgm7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2T3-005QHt-JR; Tue, 13 Sep 2022 09:44:33 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY2Sm-005Pys-Dj
	for linux-riscv@lists.infradead.org; Tue, 13 Sep 2022 09:44:19 +0000
Received: by mail-pj1-x102c.google.com with SMTP id x1-20020a17090ab00100b001fda21bbc90so15031596pjq.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Sep 2022 02:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=3nASk1J1NyYqRV14q+NFxvXiUb838dF8aP0GL4X6FI4=;
        b=GRTvsVufJiOH+GhJSRyatlDoPJX+ZdywSz+BCdn9LA2k0zXjlwqNU64opXsDi+o8s3
         dhYwmbvL9iabD280MsEQQ44MVwzcUPkA89KHG++2P1z8OYm0l/D+SkM8hnbgxwQe3MoN
         EyMEfgekvshjp/Nlr8M3qim4KCgO9bI8/E8IbUKudeeyz7eeVHQDNZdckBfTm9VC/mxL
         O/lO/OaaRG7jIdpJT6RQBqjOFcyS8Cq29/Wa7NKFpKuqKSl24bDc+isscAf+Q5Wu6fwe
         cmCL8bcgS7P6oAwGGDbkv2SGUBTuGe/lpo2WZEZr9OjaKYKaMGl2w1BPPG/aEdAno7ak
         Wh+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=3nASk1J1NyYqRV14q+NFxvXiUb838dF8aP0GL4X6FI4=;
        b=6kRMxWt48XudyQa6uwHnmVHuoM1GGjjm9EZUrfF0LSVG/JZfTEjWDyMQnuSyt+McqK
         ENl2/hbWPdgugUQPFhxNk95FX/bKrcVyXG3hlhT2t2t9u+4EI8nxGsgjJ21Ds0sjg7NL
         GK0Hj8BOYfpmOaXwQ0OMj9/67mRtj/2c+iCDIgWxEroo7ZbbM/akc1N5PRJJM2OalUlk
         +CSF57VNNDn78m7006Ko0NhCLxtHd9pA3VyuI/o1O5VUCQ/ASER36umiOSnygxiCL4QY
         3RM+CmdNkGmYdsvNeUn2isgr06IWB7eWtSZSJHnoKM7hcZiyV+Lt221OBZB7sLGtn92X
         nqQg==
X-Gm-Message-State: ACgBeo1Bp0F+69xTlNtsrPV4R2e0gP/pK8ojFkWhtI3VAxcwz5Z6PZLt
	r501r5qcBETgNXPTNpeocjVUfA==
X-Google-Smtp-Source: AA6agR4oTSF2TSxXH60kpM7WS/cQY3USEha3MLRQV8+xuOUyE83krQpiv9zOl2M1/2densNaPCbN9Q==
X-Received: by 2002:a17:90b:224e:b0:1f4:ebed:16f6 with SMTP id hk14-20020a17090b224e00b001f4ebed16f6mr3013494pjb.17.1663062253533;
        Tue, 13 Sep 2022 02:44:13 -0700 (PDT)
Received: from archlinux.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79e1c000000b00543236e83e6sm4904428pfq.22.2022.09.13.02.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 02:44:13 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	peterz@infradead.org,
	jpoimboe@kernel.org,
	jbaron@akamai.com,
	ardb@kernel.org
Cc: greentime.hu@sifive.com,
	zong.li@sifive.com,
	andy.chiu@sifive.com,
	guoren@kernel.org,
	kernel@esmil.dk,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC v2 riscv/for-next 4/5] riscv: ftrace: do not use stop_machine to update code
Date: Tue, 13 Sep 2022 17:42:51 +0800
Message-Id: <20220913094252.3555240-5-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220913094252.3555240-1-andy.chiu@sifive.com>
References: <20220913094252.3555240-1-andy.chiu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_024416_928841_0815FDF8 
X-CRM114-Status: UNSURE (   7.77  )
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
Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 arch/riscv/kernel/ftrace.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 84b9e280dd1f..53db2ff83751 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -12,6 +12,12 @@
 #include <asm/patch.h>
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+
+void arch_ftrace_update_code(int command)
+{
+	ftrace_modify_all_code(command);
+}
+
 void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
 {
 	mutex_lock(&text_mutex);
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
