Return-Path: <SRS0=LTnX=FA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DE8EC63777
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 20:32:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F55C2068D
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2020 20:32:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UOPagg2T";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lg2Tu8GJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F55C2068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=veVMaNGpR2g++DQzo6cuUhlP8jIyjH/6q2pVag02qfU=; b=UOPagg2TBmpLOQ3lYvHBxoFhLa
	iR7XmwzdIoRpoZAwQac+R1ZzPMGvHt7YfJfA+Y6s7iH+V5qbk0wCzUm81XavGFFy7erHZfv8vhprl
	bs1jUWFPys8cpRqRmIPJ32ZH00bE29MwbWurKAAqipU4blwT+SL5BuO3EsCiYGY963zBjhTNlrZhH
	ACjiod/xqNpx+OOsp/638hRgs0Aw4oZpUjSGSuBf5aJB5T6nLdWyyBmbk09vaVYG7Ka4FpNpz4FTc
	cnSsSB6n8bQSZin1qfm+YHhwEdPAHxXbuQDxyyd7uvgE8p3GmMcseD0GsVqJoqPFVQ+cD0yuvU9jm
	hXF35cWw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiNvs-00077q-NG; Thu, 26 Nov 2020 20:32:00 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiNvp-00075b-Jc
 for linux-riscv@lists.infradead.org; Thu, 26 Nov 2020 20:31:59 +0000
Received: by mail-pl1-x644.google.com with SMTP id f5so1615199plj.13
 for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2020 12:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/eokhUWLs3awUsq8/DIajlQq0Nygugv/5T44l5bD6E=;
 b=Lg2Tu8GJ3meuOU8gfk8rBR9CopPekhYg/J1mg6QOGZSj15nM5IgePvT20nhNrZoCeH
 mFIzQVD9pA9B9E3jOC2clIkLP5PuLn8/AtgNhVX6KizlAp1ts90F5YLLTYqX8cAlNvDc
 d0RJwiqnaCbfBlJUshNCMmRQMtzI9EJP+on/Y8j4ZmkZLD5i9QxmysyhVPoxJI5/VgQI
 sEbjlBrKr5Vpfqk/cBqh3lTs9lmT/ddrc1mvZC01w6zlCgog5jbfpJ41dGnF/jZl46UY
 zWArxFgeGgl87o6jnT4417EPmNbKbeedj2zlUbhTd4czo+qqhoUlWLjmuclxk5sxH/+m
 GUoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=i/eokhUWLs3awUsq8/DIajlQq0Nygugv/5T44l5bD6E=;
 b=L8Ark9FfpsY9WqlaT2C58nIzlN4et8CPG8uW3drAi8CtNefRBh57HgQg5bzumiIG1g
 +ltJlBjW1p4pDaVXdDd/uU97ll0p2MM0I7QSoxvvsIrBPGifR0nSL/ltUwuOnbL9DuZY
 IM2/EghKCXxb5cQq2Re3bKdopD9RMeq6ihjh9xUxhC+tqty5ovA6Q5iBENz4Vg1Swb+S
 Vq3CjZ02LKg2i+bmoF48PjP34hAZefIJx1juG38dr5z1ykjMa08JZAeg9xPfbxdj0DHM
 q1aBlo4JANfceBf0tnB4FPac3cxE4aYTgQclJX6DgGcD94NC2og4qCgSsUFkfwfR3v2V
 QL+g==
X-Gm-Message-State: AOAM532dsRn2k1H7UoxNXlOv5hH7+7oYgFUfG6RetvDDrD24ywuVWF9I
 BN+//mZ2r2wOaSKqjckw3sE=
X-Google-Smtp-Source: ABdhPJzdoljAWiYukUNBvvm3ndCm9I8BZj0uo/4ry5O9XqQNfLP6q3N5vkrKC1SWVmo2JEcjSKm1QQ==
X-Received: by 2002:a17:902:26f:b029:d9:f9dc:e2db with SMTP id
 102-20020a170902026fb02900d9f9dce2dbmr4020198plc.65.1606422714036; 
 Thu, 26 Nov 2020 12:31:54 -0800 (PST)
Received: from pop-os.teksavvy.com ([69.172.164.4])
 by smtp.gmail.com with ESMTPSA id d3sm7793828pji.26.2020.11.26.12.31.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 12:31:53 -0800 (PST)
From: Aaron Oman <aaron.oman@gmail.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Replaces spaces with tabs
Date: Thu, 26 Nov 2020 12:31:08 -0800
Message-Id: <20201126203108.2114879-1-aaron.oman@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_153157_748846_009EE41B 
X-CRM114-Status: UNSURE (   9.81  )
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
Cc: Aaron Oman <aaron.oman@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Fixes these checkpatch.pl errors:

ERROR: code indent should use tabs where possible
+                        regs->a0 = regs->orig_a0;$

WARNING: please, no spaces at the start of a line
+                        regs->a0 = regs->orig_a0;$

ERROR: code indent should use tabs where possible
+                        regs->a0 = regs->orig_a0;$

WARNING: please, no spaces at the start of a line
+                        regs->a0 = regs->orig_a0;$

ERROR: code indent should use tabs where possible
+                        regs->a0 = regs->orig_a0;$

WARNING: please, no spaces at the start of a line
+                        regs->a0 = regs->orig_a0;$

total: 3 errors, 3 warnings, 320 lines checked

Signed-off-by: Aaron Oman <aaron.oman@gmail.com>
---
 arch/riscv/kernel/signal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index e996e08f1061..175861ec2671 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -252,7 +252,7 @@ static void handle_signal(struct ksignal *ksig, struct pt_regs *regs)
 			}
 			fallthrough;
 		case -ERESTARTNOINTR:
-                        regs->a0 = regs->orig_a0;
+			regs->a0 = regs->orig_a0;
 			regs->epc -= 0x4;
 			break;
 		}
@@ -284,11 +284,11 @@ static void do_signal(struct pt_regs *regs)
 		case -ERESTARTNOHAND:
 		case -ERESTARTSYS:
 		case -ERESTARTNOINTR:
-                        regs->a0 = regs->orig_a0;
+			regs->a0 = regs->orig_a0;
 			regs->epc -= 0x4;
 			break;
 		case -ERESTART_RESTARTBLOCK:
-                        regs->a0 = regs->orig_a0;
+			regs->a0 = regs->orig_a0;
 			regs->a7 = __NR_restart_syscall;
 			regs->epc -= 0x4;
 			break;
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
