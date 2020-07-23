Return-Path: <SRS0=QO1u=BC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31EDC433E5
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 16:37:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF94120714
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Jul 2020 16:37:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="szgR/k6e";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cTICzKj0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF94120714
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=esmil.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Tcgk+uvcSStrONgF/qvSOt72WeuPvFIbCfgBzbm10wA=; b=szgR/k6epfXBAGS198xSqQMiP6
	xGPEE7J6/XJHio9A0H4EARVTVWyhDLxfKwkV7Ez+Qr18Z4H3/Le704zBMm04T0+HIdNWS1mE8mPFp
	DBy3unyuTpeVqmsPLMfzE/z3VKF+dbaHNkZGjAtRI92uihw5mQVv8kz0XCX9ZR6d8UANPHv2wzErG
	k/xOOrKEtTsE78SwOfQMKB+YkKkrnbdUjL31BALBieQMl1O+xOMRfs8HSUIrKQ+8ivE8goLeg5HDq
	fMXRe3qyj4bb7wzMbzF+NGef8x+Qoq9UAFOXhAKHIrwwxp69yg8i7GGlCRllaJEvt1uNLyRGmGj2e
	M1LWaawg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyeDQ-0006bE-9m; Thu, 23 Jul 2020 16:37:04 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyeDK-0006a2-15
 for linux-riscv@lists.infradead.org; Thu, 23 Jul 2020 16:37:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id c80so5555535wme.0
 for <linux-riscv@lists.infradead.org>; Thu, 23 Jul 2020 09:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+bQZoXIFqfGEwjMaiaB7VWns9AxgAgz8MsvENSHF3qY=;
 b=cTICzKj0aMs/8vGqHK/g2hIbInMQECfRZuUvt4UmcNWYRqk4xjATkzw4Md7VTesbK9
 0kXACOaYojQvUMt8hJJT+8DqTHfA17ryD0glQDk8JH2nVSP0Q4uBUYu/BAlzRAHmYA8o
 y0kYtGciTUeol5L1fqlgNU5tvMXEEVhxrZ8JxZwzJ/f3M2PfP0/hJYt23ZKfrBJ0Cy3g
 sf+5xxkkh9aFDlpfsJCo9y7d7Rci8zdg8zDIDIEXRlzdECbjUvgZWo5brVCHoGxKlSkt
 ATq44f9IehaGrRpVQdy6xcH9zPONKCfD5Jiro1QmN0+EwIVSmPKq9p/ixYDoRczjnuBV
 o65Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=+bQZoXIFqfGEwjMaiaB7VWns9AxgAgz8MsvENSHF3qY=;
 b=asZeR0e7CKjwsj88T2N7epgW19zrE7UjtcB/WzFyeBZOarpdOlFXaufkXxYEq3pFgv
 B3TLj5i+udqb2YB8Nxdb1hjWaVsyOg9HaSUUV91OTwJJo63WKXVrBJr/eNLgkxaziS5j
 DGwL67DQ+Vo+LVxgkHXAOBg25v+ANfBdF1+dWfvo0194lzZLB+5yraEjhdt3xhIjUNed
 mlOXYSxLF0M60C8im7fm1+xuYz6bcnJGTyj5QA7jz46EkUDHu7tNiazZck/JX3gs7sQA
 mj7mFwVpGN5+1R7T7/q/ipxJEGZWtSjRPyv5eaQqVZzT7bvuj1lMSgld38ZIcBo1rTRS
 TN1A==
X-Gm-Message-State: AOAM530AlBXInPdHBHmvAGIn1L4XScrd8W4JbMhorO/91PfBsYSpUMNw
 ZoqkFmBT1ybl51azxC/eNgZss7ZcJxznAg==
X-Google-Smtp-Source: ABdhPJxO2ZsaLoOuyAebtlU69uOv3Tan2WxXsMV5Hevfj+jGM2uqH8o0ZrvtBxYO0qK/WRelOHHOvQ==
X-Received: by 2002:a7b:c08b:: with SMTP id r11mr4810194wmh.130.1595522215302; 
 Thu, 23 Jul 2020 09:36:55 -0700 (PDT)
Received: from localhost.localdomain ([80.71.140.73])
 by smtp.gmail.com with ESMTPSA id f9sm4274342wru.47.2020.07.23.09.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 09:36:54 -0700 (PDT)
From: Emil Renner Berthing <kernel@esmil.dk>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: Grab text_mutex before patching jump-labels
Date: Thu, 23 Jul 2020 18:36:28 +0200
Message-Id: <20200723163628.82794-1-kernel@esmil.dk>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_123658_176007_EDE249E0 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Like other arch's we use patch_text_nosync or equivalent
to patch the jump-labels, but also like other arch's we
need to hold the text_mutex before calling that.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---

Fixes: b6e0878a4ec8 ("riscv: Add jump-label implementation")
..that is already in riscv/for-next.

Palmer: Sorry, I didn't notice this before. Feel free to
squash this into the commit above if you like.
---
 arch/riscv/kernel/jump_label.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/jump_label.c b/arch/riscv/kernel/jump_label.c
index 1bab1abc1aa5..20e09056d141 100644
--- a/arch/riscv/kernel/jump_label.c
+++ b/arch/riscv/kernel/jump_label.c
@@ -4,8 +4,10 @@
  *
  * Based on arch/arm64/kernel/jump_label.c
  */
-#include <linux/kernel.h>
 #include <linux/jump_label.h>
+#include <linux/kernel.h>
+#include <linux/memory.h>
+#include <linux/mutex.h>
 #include <asm/bug.h>
 #include <asm/patch.h>
 
@@ -33,7 +35,9 @@ void arch_jump_label_transform(struct jump_entry *entry,
 		insn = RISCV_INSN_NOP;
 	}
 
+	mutex_lock(&text_mutex);
 	patch_text_nosync(addr, &insn, sizeof(insn));
+	mutex_unlock(&text_mutex);
 }
 
 void arch_jump_label_transform_static(struct jump_entry *entry,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
