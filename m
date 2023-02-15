Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C07D7C636D4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Feb 2023 14:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0H26Onlu/JfSzFEr1ZZ75Dpl6O2FanVPomosaWHI0iE=; b=EQ12xhV5iTNNnV
	05GDDzh1nwReSyYzrefhVNgkirjEQcLVfaAfAmH0mhR4cKouofK5MGXnFRYjlKKzvagoOhf/HZj0g
	52YKqxwLefR2jJ/PEmhq8Fl/rlDvO0glThPAX8j82PEW8bL7BN6coRoQ9d4bHulPWhndvjkCPOjKa
	XBBpPUwSO5J9jQ1mUpiHhP3W+s9lNpIasGS+uRzH101HMu/y/OOPOdFlY5o2j6XwsD2XQWT1L9y63
	w5Wev6HnThpW1Sltn4nBipSg97PhdqP14InbPmOdEiHwhXa71TCI3i/WB6zyCKk+nyNiPbUWSSqSP
	YdDalhEt9nyDVTsgpHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ65-006Gkw-2d; Wed, 15 Feb 2023 14:49:25 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSJ61-006Gk6-Bo
	for linux-riscv@lists.infradead.org; Wed, 15 Feb 2023 14:49:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id b22so7453277pgw.3
        for <linux-riscv@lists.infradead.org>; Wed, 15 Feb 2023 06:49:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpnqzDbzpwFZzmxwIgY9cm0ESK7hZqwfohZzSxiSOx4=;
        b=hyFdeoikXmbC8TDjJe0JWbfsVNWyEPQbPPxtPZatyRdeal/Qqn1wyjqgpKhvmIb4Yq
         X1hvZjIg6tVyb8tVT96hv4GhSPutWaFmqg9zwOeesJQW3M38QwsHswv2SHtCR8c78lOE
         5GK9duULWdRkrMo2JC8U6duygB9RFOhaUgHnsRi/0PK+ux83JdO+BIwvjc8JWyU9u9yp
         mV6p2y9h/Eh4fky2+N7mjh3FEEuIxt9pIWBXe2ChOs3eOv9sevXfNeBlBaKW4FhTLWXV
         eeVSvLbLQqKa2lUMC92E44hT86/M7UAtqx0YH1oUoMpWs7OLamagFUNK+nwKizWOYSAD
         Ojkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpnqzDbzpwFZzmxwIgY9cm0ESK7hZqwfohZzSxiSOx4=;
        b=czOLJC5bsS9Xkvvh4Y+C8VH18gCehO6pfgI3yYhxcyq8OxxzReU3eAtY31Y41ndqd+
         G12huWDUVELOvxGVl1AKvTV3LlknJKU74up5Q2NMMPwAvQtJLqHNkf5KIJH53GiGxiXo
         3Fmg9u8hc1Yf6W0BR8MF6sCXK5K/KtFihUpAlMok8RoGgA2A3sxuC0pnMSfMiYyIxFWv
         U3COIdeDiPXzuuVch+NyhHUVmgokDOsFzn0wBadBbsTM7wF95aqNAqFunFn9Nn7CcbIS
         2csdB9iuceifJ/OLSBvPvHBLl+6w4xzi+qc22QbMVzn+nTkdfQRR0FPP8c0QnmhBvHxu
         Rh9Q==
X-Gm-Message-State: AO0yUKX6MdtbTpK5YYF1rMdJrWIcnUqc1shUJUsfo1VUihae20IDHPmO
	5uaWqcjRKnsuK5hq6gWwsO5uEw==
X-Google-Smtp-Source: AK7set+XXo/cibAoiupiPHcxkcT+4+qQa2b5PxDeOIXhjc7yqmodMsNfqIIeM3nMc41TOvhgCKhlrA==
X-Received: by 2002:a62:7b11:0:b0:5a8:5fa4:8c6a with SMTP id w17-20020a627b11000000b005a85fa48c6amr1605669pfc.0.1676472557521;
        Wed, 15 Feb 2023 06:49:17 -0800 (PST)
Received: from mnissler.ba.rivosinc.com (mnissler.eu.rivosinc.com. [162.19.61.220])
        by smtp.gmail.com with ESMTPSA id 8-20020aa79108000000b005a84de20c24sm11688010pfh.209.2023.02.15.06.49.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Feb 2023 06:49:17 -0800 (PST)
From: Mattias Nissler <mnissler@rivosinc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Mattias Nissler <mnissler@rivosinc.com>
Subject: [PATCH] riscv: Avoid enabling interrupts in die()
Date: Wed, 15 Feb 2023 14:48:28 +0000
Message-Id: <20230215144828.3370316-1-mnissler@rivosinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_064921_422241_AA037078 
X-CRM114-Status: GOOD (  10.04  )
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

While working on something else, I noticed that the kernel would start
accepting interrupts again after crashing in an interrupt handler. Since
the kernel is already in inconsistent state, enabling interrupts is
dangerous and opens up risk of kernel state deteriorating further.
Interrupts do get enabled via what looks like an unintended side effect of
spin_unlock_irq, so switch to the more cautious
spin_lock_irqsave/spin_unlock_irqrestore instead.

Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
Signed-off-by: Mattias Nissler <mnissler@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 549bde5c970a..70c98ce23be2 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -34,10 +34,11 @@ void die(struct pt_regs *regs, const char *str)
 	static int die_counter;
 	int ret;
 	long cause;
+	unsigned long flags;
 
 	oops_enter();
 
-	spin_lock_irq(&die_lock);
+	spin_lock_irqsave(&die_lock, flags);
 	console_verbose();
 	bust_spinlocks(1);
 
@@ -54,7 +55,7 @@ void die(struct pt_regs *regs, const char *str)
 
 	bust_spinlocks(0);
 	add_taint(TAINT_DIE, LOCKDEP_NOW_UNRELIABLE);
-	spin_unlock_irq(&die_lock);
+	spin_unlock_irqrestore(&die_lock, flags);
 	oops_exit();
 
 	if (in_interrupt())
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
