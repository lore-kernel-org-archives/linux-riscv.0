Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 533D1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 18:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GW96CPND3IDXIlCjq1GQtuFX2I0NC7pyVKjt8cUvO/g=; b=d70Nvoz9GJGB4q
	Cei6z04XiBsyoSstCafbQT3l7R6Ouwsh1LS5g3D0a1EmqEO2fpq5q4A5c0XRX9nPFI9FEG7f8HoT1
	jjoOaDATDHrpcZdlMTGzMPpFcIpKqglySffZRoKK0JxU6Po7Odckx6GJFlcCPGKFLbWHgvfs1nPiF
	mA46T6R6kr9c57wciuFRg7EtxDEt7Co7jTl4+h1B7bUo2BsCf2MMwWzJ+Tgs5jI+WFT+5AkIglJLe
	5LHNiRfFK0cjNLfRrKAGNPS4HsUtGZOe7SUzQB+VWB5/6uMmXWgHNpUt63a5x5Y2H9dJJAKzyjW0A
	pSQ7T6HrjzTShe724kyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEbK5-00AJQe-3g; Mon, 31 Jan 2022 18:22:41 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEbK1-00AJNd-JF
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 18:22:38 +0000
Received: by mail-oi1-x22d.google.com with SMTP id x193so28446104oix.0
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 10:22:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U2McVQuv53c33dZYwtuytrfr7zhfRHKf5OwpDdiji0Q=;
 b=GrPuCF7g8wuXvMFUhWNN1mhzoghD0PNgEzngwf2WvawQ8neFtZyyWFFWbrsLyvbhN0
 1YLTZW9YmEf5d2WlRFTUJdnmChTV/PIDJd5JRx0YEC94UMjmjp0/5nD+7vFXklO6KAco
 tziDslat9YPXq77Ksu5JtauYUyr8ws1HKtftRCGmK2u+eUDCVSuPG81jrbVMgGBA5Xcj
 +cyDSjShDdJ2Mq7rljU0CX8f1UDknrJW/a7DqHadutRbyD+8xDe/3tCcKAy4a1V51tqq
 sGB/9BvZ8JZagsG2pE2fPv00MPEWXjT48ZAbEPc8Owmp35/GlcEaBsLshIZ7l/bJIj0s
 wOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U2McVQuv53c33dZYwtuytrfr7zhfRHKf5OwpDdiji0Q=;
 b=RsUYCa/KqeOnP4Oevtu5xFTwv7I2RioMZonrXxgVgyi8didmNZmOjrcikC0x2f6Av6
 F+dGFpZ/0hVkQz6YDopUp2fjlC1pphDGfgl7z7F8SR5N8MwxpB6OdLROdQNaM4DllWrX
 eYykqi2tQpCEMsbrm6C3m6rPq64SJ6a4CNZWssXNrJpbyUnVf8nLCDWy/vdtq7lgm0Ks
 SJgsiQyasaV55YWwgmuUb5cCKtqXH3VvRc9YTKUjvyuQ6rylKpveWXG1JopdXZPYBhdC
 UQOO6fpaYsg+9qmHl75u9/pP2x1+vIl2tpwtRN2Xqu36b/yciDGmoDwyh0ISB878aXTG
 b+Cg==
X-Gm-Message-State: AOAM5327dTsbG5GdBF+wAWqePdmHCuOWClXIsJm3cggsAUpC+i0UnijL
 h+jaBH3F6I0CwG4ssNbOgNbHpGwZpvw=
X-Google-Smtp-Source: ABdhPJyXQjVGntX1OX0ZlbDOasHZ7YutyxmQFYeM96PygHpy3m+Tr5xZApjL6EcLrg2VuspYptU/SA==
X-Received: by 2002:a05:6808:1644:: with SMTP id
 az4mr13575526oib.214.1643653357036; 
 Mon, 31 Jan 2022 10:22:37 -0800 (PST)
Received: from stitch.. (80.71.140.73.ipv4.parknet.dk. [80.71.140.73])
 by smtp.gmail.com with ESMTPSA id t4sm12986340oie.14.2022.01.31.10.22.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 10:22:36 -0800 (PST)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org
Cc: Emil Renner Berthing <kernel@esmil.dk>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Zijlstra <peterz@infradead.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>, Jason Baron <jbaron@akamai.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ard Biesheuvel <ardb@kernel.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Jisheng Zhang <jszhang@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 6/7] riscv: Use asm/insn.h for jump labels
Date: Mon, 31 Jan 2022 19:21:44 +0100
Message-Id: <20220131182145.236005-7-kernel@esmil.dk>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220131182145.236005-1-kernel@esmil.dk>
References: <20220131182145.236005-1-kernel@esmil.dk>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_102237_675553_4DDEBBB2 
X-CRM114-Status: GOOD (  10.60  )
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

This converts kernel/jump_label.c to use asm/insn.h to generate the
jump/nop instructions.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 arch/riscv/kernel/jump_label.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 20e09056d141..b5b4892c3e9e 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -9,11 +9,9 @@
 #include <linux/memory.h>
 #include <linux/mutex.h>
 #include <asm/bug.h>
+#include <asm/insn.h>
 #include <asm/patch.h>
 
-#define RISCV_INSN_NOP 0x00000013U
-#define RISCV_INSN_JAL 0x0000006fU
-
 void arch_jump_label_transform(struct jump_entry *entry,
 			       enum jump_label_type type)
 {
@@ -23,14 +21,10 @@ void arch_jump_label_transform(struct jump_entry *entry,
 	if (type == JUMP_LABEL_JMP) {
 		long offset = jump_entry_target(entry) - jump_entry_code(entry);
 
-		if (WARN_ON(offset & 1 || offset < -524288 || offset >= 524288))
+		if (WARN_ON(!riscv_insn_valid_20bit_offset(offset)))
 			return;
 
-		insn = RISCV_INSN_JAL |
-			(((u32)offset & GENMASK(19, 12)) << (12 - 12)) |
-			(((u32)offset & GENMASK(11, 11)) << (20 - 11)) |
-			(((u32)offset & GENMASK(10,  1)) << (21 -  1)) |
-			(((u32)offset & GENMASK(20, 20)) << (31 - 20));
+		insn = RISCV_INSN_JAL | riscv_insn_j_imm(offset);
 	} else {
 		insn = RISCV_INSN_NOP;
 	}
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
