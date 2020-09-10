Return-Path: <SRS0=oUx1=CT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DB38C433E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 195A320731
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Sep 2020 08:13:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bE7FCYO4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="WHTQkR2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 195A320731
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=mrHboYnuvgBgL4DdtjlzikfGFr4DLMFiCxgF2hsBH4E=; b=bE7FCYO4Vt64MJb2Ga19tImc9
	2dibwB+mJVWixXU1Jhra9k1FPGlXKRKGGXxVRbfLx+hZphEsRMmoJvkULUX9ehJ4z3JmS3SNq9O6t
	FmlNGFdjEMZ+zrIFei6+AStvr2im4ShtjsZIxdaRe4DeZmwQnE8iYIon+FX17/rMJHxK2Kb+nnUbj
	w03tl0DxZg49yURKXgKo3xt4cVvVs56WuvESJkvtxSHvBzRrf88yqi5rHoGfruct3s8K4GPQxuJls
	Aqs6yUNAmgLxMNExp6CIqsZLAXHoKWZD425pezV5TqwPIsN7JpQH1fMGxknILDVdelfMyvxgoKYyS
	COB7vlXKw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGHhf-0008Se-91; Thu, 10 Sep 2020 08:13:11 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGHhU-0008KO-04
 for linux-riscv@lists.infradead.org; Thu, 10 Sep 2020 08:13:04 +0000
Received: by mail-pj1-x1041.google.com with SMTP id n3so961848pjq.1
 for <linux-riscv@lists.infradead.org>; Thu, 10 Sep 2020 01:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oN+QKPnmXHJNU9Rt/XFHKzinb9hEvSmeD5zS4UVNEOw=;
 b=WHTQkR2GbWTY7ezVaVw6Q4mO7yq0QVy5lXuFl7+hMYu6bAW3RxsilKg9MV5PRHpDh7
 UcULnH8uS7Hj9ffXe+b0eQmzmGwuf2IPSGsfFPbwe/KybR3hPJZWe1+mP9nKO9rcKje2
 Dq6y45cQsRbXhQ+3JTGxhiHgfumIfttIAkSnwEeuJUpHLXXZcOBFLMqrDQ5dS89m9uGG
 YxJVP3ro+9ShSfCufDMdWIs2v002E/nMPyFs6GWS6uZJlM7EiOGIkSBDG3SN11LrjxVV
 hDpSKi4qKVguaKRYQtzzmI92CwkfoOdVO+5KhqS+oL9QA+e0Op8An0lD4+iWa/1Yd5eS
 s1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oN+QKPnmXHJNU9Rt/XFHKzinb9hEvSmeD5zS4UVNEOw=;
 b=BQgZT2BfZRmrYSjzO7VzzW4EUQhFK6B/Jq4NvR5Q404vPwXIB497aQWFpDQqhzIul3
 JyDCc0Q+zjkck/dXH62XROpOe3P1kJ51KAW58pFoXHH1fvND8yPH/ZR7IDpRj8hexia5
 u6vR254wTiNpCbojZ0wRSMcWj5khRPuT0Gfl/+BrZta3eIIVC76Xv71LjpJg0QZzebRT
 prigQ1p8A8ICL6rS5Ou+rQ8BuPwCmlpColSj6V4LcwCEsO2dx/MyYetzZu1zgsi3mRaf
 ayI1O4kyWVC9nVHWIS+OaF0dZGea8+5DSCZE0Yb21GUFN4SqajvdjvBxod94+n4ngmAC
 wGkw==
X-Gm-Message-State: AOAM5304UIEYQOA6iSbZGz3zkShrVxkOJeNH/HZ3IQddykIQLH4oxruY
 OQ8JTGW0HSL3L5mUey+d4ICpcA==
X-Google-Smtp-Source: ABdhPJyILUD/Pd16VoEWMyh4tq4Ry3gJtYtjHqUZgAXE7gF0PXLHCvLqqu6UWWWIFZK8YkidXbA1eQ==
X-Received: by 2002:a17:90b:d86:: with SMTP id
 bg6mr4210178pjb.155.1599725577813; 
 Thu, 10 Sep 2020 01:12:57 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id e1sm2196056pfl.162.2020.09.10.01.12.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 01:12:57 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Subject: [RFC PATCH v7 10/21] riscv: Add task switch support for vector
Date: Thu, 10 Sep 2020 16:12:05 +0800
Message-Id: <6fa7260145ee24442a5ff2173c507d92e400fc58.1599719352.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1599719352.git.greentime.hu@sifive.com>
References: <cover.1599719352.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_041300_158193_F8AD6A9E 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Nick Knight <nick.knight@sifive.com>, Guo Ren <guoren@linux.alibaba.com>,
 Vincent Chen <vincent.chen@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch adds task switch support for vector. It supports partial lazy
save and restore mechanism. It also supports all lengths of vlen.

[guoren@linux.alibaba.com: First available porting to support vector
context switching]
[nick.knight@sifive.com: Rewrite vector.S to support dynamic vlen, xlen and
code refine]
[vincent.chen@sifive.co: Fix the might_sleep issue in vstate_save,
vstate_restore]
Signed-off-by: Nick Knight <nick.knight@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/include/asm/switch_to.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 2afd0124701a..d33a86a48f0d 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -87,6 +87,7 @@ static inline void vstate_save(struct task_struct *task,
 {
 	if ((regs->status & SR_VS) == SR_VS_DIRTY) {
 		struct __riscv_v_state *vstate = &(task->thread.vstate);
+
 		__vstate_save(vstate, vstate->datap);
 		__vstate_clean(regs);
 	}
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
