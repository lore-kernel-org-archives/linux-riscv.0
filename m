Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBDBBC2D0A7
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 519C320872
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q74ziNDJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SWh+7q5a"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 519C320872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SGdlzecLc7Rdz/RZQzh3pSk7+5xXMDUBAGAdCHCFeN8=; b=Q74ziNDJjU/gZf7X8em2KkYy1
	EKZEVCyGnw8otPdwDShwXkiDrrCjXGxWRGHyV41BRNRU7FEXq6r1i2arCE5KPBQvq6cCq7ooRd8o4
	YH3nRhQg3T1Ro8oSNWRbuSJh21eQu+CMYqBRfTy+npFO1fl+uGurvgSD29Kj0VeH7guxcb4iEtt+F
	S7q1NGs3QtWUXd8VggPrVDG5BjT9XESK4M7VTYU7cEgIS1pOgojHNnsOZ9gM6cEWLZRF1nPJ78pI9
	XCLgh6H7kz8nwTlhE1UlpUy6/3ewnIuDEC04HaENtCQCV+HShWBCmr3thNeG2ZiHScY67y1LIokXw
	5R1J2yyeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHi0-0000I3-K5; Thu, 10 Sep 2020 08:13:32 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHho-00007L-Kj
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:22 +0000
Received: by mail-pg1-x544.google.com with SMTP id 5so3839903pgl.4
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:13:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UAb0icg43EEa3jdEmSsHOW+v+kMmzAcNslMsiamSuwU=;
 b=SWh+7q5aZXA0UA+wMOe0IWNOyXf9cW6ZIzJhmPlpZt/8LYchDMHJ4E55UeeWCPQeRE
 pcZF/LWx+YGCqdj+7EI0Ka6+O1d/uB/jFtq1kUPtL92l+R8h3TlQSU9Ltmp+rlWZrwHB
 zheA09+GSA0EHOcOuraz6sHIHvL5nVlfLXw419ukf+ldTgzoa99s5rtc//A1W+IV9xkI
 uqizFwfAjpbkuVgENv4UOIF/nf6YHq1rR/a269ZQ9SeN+dpW35gl+ul9CjXv9MWkcqLu
 K58Pxa/rYaEYqonO/QPemK7twHr4d+sfX9T2JZ7PyzZxWkFNvUCmXBzhrmxLYuX3TMTB
 hGKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UAb0icg43EEa3jdEmSsHOW+v+kMmzAcNslMsiamSuwU=;
 b=Kjj+DQHzeJAjA0w2kYTueSDUWi7yxY9Fyuo58i3Xh7mNTu77y07f0gbLsikBJhkJPy
 ecCK5cYn//SfDNfNZR7CzBJbmjrwLr3vacTMOauVDBs4W8wWYXrK+je3ZMlW6UXQep2K
 ccK3FEI9ld6fRB1qx/SLABqUfYgiiEDl4mlg7hxnlWDfCFMkwxD8cTaw74nUBgS6RweE
 vK+63o23cBfNQeY9cPvHAyol2yyb8nJESqREVJuhd8i7GZ0HP0h04lQqT0HWZmRThcd4
 p5zepm94Bxl3oB14NlZobJjwcB7Mztaa60jGZe3o67lcHtOPi2iUHhDc5BPRUrjbnWiH
 HLLQ==
X-Gm-Message-State: AOAM532ktIPEQHU/1hxq3guuiscQQ2Nj17RIRyu4Q10eO/Rl9SuDOjA/
 Vx/+OnV2ssPlgRK++VJld03Uqg==
X-Google-Smtp-Source: ABdhPJwrj9Nc4rf0Ljpa5qH1u74Pr3vrzXhhTgEsS/NeaIisyiAEHis0bWt55UfGjrgVmtqXKOLyUg==
X-Received: by 2002:a62:8806:0:b029:13c:d37c:5e47 with SMTP id
 l6-20020a6288060000b029013cd37c5e47mr4423007pfd.13.1599725598631; 
 Thu, 10 Sep 2020 01:13:18 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:13:18 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 20/21] riscv: Allocate space for vector registers in
 start_thread()
Date: Thu, 10 Sep 2020 16:12:15 +0800
Message-Id: <1b09427788749bf7b5e35c771657661bd7165348.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041320_795600_AE162827 
X-CRM114-Status: GOOD (  14.35  )
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
Cc: Vincent Chen <vincent.chen@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

It allocates memory space for vector registers in start_thread() instead of
allocating in vstate_restore() in this patch. We can allocate memory here
so that it will be more readable.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 7 +------
 arch/riscv/kernel/process.c        | 8 ++++++++
 2 files changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index d33a86a48f0d..58898d33bf28 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -98,12 +98,6 @@ static inline void vstate_restore(struct task_struct *task,
 {
 	if ((regs->status & SR_VS) != SR_VS_OFF) {
 		struct __riscv_v_state *vstate = &(task->thread.vstate);
-
-		/* Allocate space for vector registers. */
-		if (!vstate->datap) {
-			vstate->datap = kzalloc(riscv_vsize, GFP_ATOMIC);
-			vstate->size = riscv_vsize;
-		}
 		__vstate_restore(vstate, vstate->datap);
 		__vstate_clean(regs);
 	}
@@ -122,6 +116,7 @@ static inline void __switch_to_vector(struct task_struct *prev,
 
 #else
 #define has_vector false
+#define riscv_vsize (0)
 #define vstate_save(task, regs) do { } while (0)
 #define vstate_restore(task, regs) do { } while (0)
 #define __switch_to_vector(__prev, __next) do { } while (0)
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index fb485c9bceee..009ab4849fce 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -84,7 +84,15 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 	}
 
 	if (has_vector) {
+		struct __riscv_v_state *vstate = &(current->thread.vstate);
+
+		/* Enable vector and allocate memory for vector registers. */
+		vstate->datap = kzalloc(riscv_vsize, GFP_KERNEL);
+		if (WARN_ON(!vstate->datap))
+			return;
+		vstate->size = riscv_vsize;
 		regs->status |= SR_VS_INITIAL;
+
 		/*
 		 * Restore the initial value to the vector register
 		 * before starting the user program.
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
