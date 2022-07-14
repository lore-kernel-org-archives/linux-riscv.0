Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2D8C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 07:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CC++M2u7uMAJrRJMOnYxqczFQ6u7EMISNqhV+y6JoO8=; b=aZ9kjcvQ0pR+GJ
	KxCqssD0NzkuV/wnAz0LrZ423uP4zL67Y2lyzZRzDZtJx14OlorGD9WxFwu3469tpfXHna/qI8136
	dp17eBEfcbOAMFQr7TQpcQDILbclhVWm4E8Xv3DzKPLPMaNk/7CtmD0PS8rJc/WI2eLl/384KxC3O
	sRpaPK47TjDl4UQpcjSg7U7fx2zB5LNhIgjGwkV53QxIMrIQ9cJcz0fuXPnloPs+dT9thHl960okv
	9K8JHiLe4yK8zz/n9ioDMklytKwjhVwE1cxxHPQLFH1bPN8Th48SON7V3DJOuaoXGFtCtcI2OEu70
	ODDyYbNOpA65XFTEE91g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBt75-00BlF4-9o; Thu, 14 Jul 2022 07:18:19 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBt73-00BlDP-97
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 07:18:18 +0000
Received: by mail-wr1-x42b.google.com with SMTP id v16so1287621wrd.13
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 00:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyZ5uWf+d5ConK8+B4WUpL957Rqjwx0DMI5X0G9r1AU=;
        b=jtk1sZiVtXFJiZt0MmoPibI+vfGFDRC5SMSG2sVAkNWrvL8VcVOsCPUIMOR8sATBBe
         iHXkIPV2lfkiuSt0yGViUR+ALf0FKI2K2X/cbs2pC/C39WA1EM/SW8fKYfEqACROHrTv
         3KQ96FhoRPiaHf5RPkv+qzTg7VwHnfnf0EUdzaS4/yD4l4s1vgjkZEXibIie1rfKUyQD
         AvNqTDUAHW97ZOVUrhJMAcvmuNQxooUOu3hduSQBBmFYjnUq//uFMmgT6e75NuagGdI+
         6J7QcVmoq/wdouaNt/vxZDJC0/nTn3z3zdGZF7yQCsd31thWIF0Toa7N1t88fSWssbGx
         KgXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hyZ5uWf+d5ConK8+B4WUpL957Rqjwx0DMI5X0G9r1AU=;
        b=P6z+ED16VuK0IeCVQeEtdkovKuELmrTfMdXBs1vApR49j33u6xE9zn+MyV3O2sJIcE
         y7Xfs0+TL+J7QqhQImv2ZHo9cBxhlbXvwRQB9UFpLknv5LM//MJAJSsWGKO4CqycDJyz
         GYc5PQ+WaL2rd2DAvcoQ4uQzMj4ET4DFQS3Esm76xEg/OCg8XtVdicYoYA4KExWu3z2V
         y+rrpTx27h8GS0jMc/8Ux0x6UQXXTHjMBbFwxTf3ZQfCnmpT0Dwxs98SOvC0BGb5Oq/y
         SETZsEdIqpPtbTtRZOwRENKvwF/q/dL8xjuDdrEyw4FuRlt3XVzOAnkjaDFVwXeEVuOm
         cKSw==
X-Gm-Message-State: AJIora+vjxKzTVbS1TCjCairONrqSLkWXY6fecI+q/5NU4T9fY+c7V3p
	YpeowEdcaeU5BgVDkmYF1cel8uEVpJIpaFOp
X-Google-Smtp-Source: AGRyM1vukzbS1Xxbl44PJGItJ4lb6GNHq1NxstesRKcCk4g27w/YvkWBBQ5nlTAhJQd9ZRh8cT0LnQ==
X-Received: by 2002:a05:6000:1541:b0:21d:b298:96be with SMTP id 1-20020a056000154100b0021db29896bemr6876731wry.206.1657783093663;
        Thu, 14 Jul 2022 00:18:13 -0700 (PDT)
Received: from rainbowdash.office.codethink.co.uk ([167.98.27.226])
        by smtp.gmail.com with ESMTPSA id o4-20020adfcf04000000b0021d7fa77710sm672028wrj.92.2022.07.14.00.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 00:18:13 -0700 (PDT)
From: Ben Dooks <ben.dooks@sifive.com>
To: linux-riscv@lists.infradead.org
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudip Mukherjee <sudip.mukherjee@sifive.com>,
	Jude Onyenegecha <jude.onyenegecha@sifive.com>,
	Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH] RISC-V: Declare cpu_ops_spinwait in <asm/cpu_ops.h>
Date: Thu, 14 Jul 2022 08:18:11 +0100
Message-Id: <20220714071811.187491-1-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_001817_394968_C9115A15 
X-CRM114-Status: UNSURE (   8.99  )
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

The cpu_ops_spinwait is used in a couple of places in arch/riscv
and is causing a sparse warning due to no declaration. Add this
to <asm/cpu_ops.h> with the others to fix the following:

arch/riscv/kernel/cpu_ops_spinwait.c:16:29: warning: symbol 'cpu_ops_spinwait' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 arch/riscv/include/asm/cpu_ops.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/cpu_ops.h b/arch/riscv/include/asm/cpu_ops.h
index 134590f1b843..aa128466c4d4 100644
--- a/arch/riscv/include/asm/cpu_ops.h
+++ b/arch/riscv/include/asm/cpu_ops.h
@@ -38,6 +38,7 @@ struct cpu_operations {
 #endif
 };
 
+extern const struct cpu_operations cpu_ops_spinwait;
 extern const struct cpu_operations *cpu_ops[NR_CPUS];
 void __init cpu_set_ops(int cpu);
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
