Return-Path: <SRS0=9VPL=M2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA443C4338F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 08:32:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66B0960524
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Aug 2021 08:32:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66B0960524
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hVuWZvkIRXou/rcj1gDow6fPykirHD13ZUjGMzYqkWs=; b=kzIIQBSKGRhY6y
	GfEfwDV5dCEtTmqOPXTGsyx/JW1FeDdYdorRqDo2lCydqvxpKa4YolnT6Gj56WVhKmFT9W2rBo6Uq
	R+FGVXVZhagWQUBFe+cCbxJ9WVlSGD03FBRu0BUOW5/9twcFwsCnGMFBRRzNzqJsb6TJ6AUZFTxCU
	RW5ILakXp7OOlAxstFAdI3klBR8A5NeYjLF+UUmS14E1QnQNx3T33fN/aWiaZWshjJmaDC0p+Ehu8
	Oe0MHCsnPwiZ1RAITS2hF0KSFL/mhEHk0o64G+tiVrajsab0a6c6+6lURjdCqNI9IQcD8EgwWGYDN
	JoA+Bl+wDwcTQmLxTZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mApqj-001d43-6M; Tue, 03 Aug 2021 08:32:33 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mApqg-001d3j-OM
 for linux-riscv@lists.infradead.org; Tue, 03 Aug 2021 08:32:32 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 u13-20020a17090abb0db0290177e1d9b3f7so2849854pjr.1
 for <linux-riscv@lists.infradead.org>; Tue, 03 Aug 2021 01:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=HlahEQqlCqd48+w41ZILt7909Clntag/IxHU+MotvUM=;
 b=MahSJF/8i0SfqkM5CvrjSfMeZInG+Hz8YMuLRNwlhixbgdjGCmnVUam/J8x2uqvvYJ
 cXGXIb14xsOJk6AS1FazfFFYMuTaY61zdajbFG410aJj1bdUwXF3skl2YecKoU53i/01
 feBsTFN5g6w+oWi8g2u6w/3tWQ7yYgl6drBE9HbZ4reqKWP5vNPG0ZxSLlJFwsI0o0i/
 0VRXm91ZUrSZosCt7lY54FvEQSD+OAVLITwbGuVCzspag8RMDYzGygx8e1Ab6Y88aNtl
 KmcWb71HyLPzk9PoDwCK6wNWrgq8KZLqQB1rRIjflCCN8lAnuScC7xgKR8CUNmXHBTNC
 /+/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=HlahEQqlCqd48+w41ZILt7909Clntag/IxHU+MotvUM=;
 b=FcB5NYUN9hjt7qHyW2vrld2DXy7SfNfKOJDRz0clbzQxBq6PaULHtGC1K6qM87Klqs
 H0fzJsQHNu8qPLoNQhoMMEsYV5liXjyy2DZAqplVcD2tzBnDZEhWUrCp3H5HXIl1n98D
 rhjHJoIrC7Dvf4FA5XcraAGyTBVnWmTBUm+ULAMlMjyjInQUMn8B5nwwiRzBf8wrpRgN
 HR2e7veH+LAdgnnrTNI6pLlF2vFIPs0q9hSBjGPTqYCFaimYJvRyMcdoPj229xoWRRuT
 cYc6eUpN+rDWNT7IuQuRMh1oo6u0VHGseO8hweoVnnY1zh5wUOjxZhJrwXRKtd3Oo+B8
 ko1A==
X-Gm-Message-State: AOAM531lEBmRuUt1/nDy2OeQt90GXMDGgzZuW+JWXkOL4o6GCrVZJD0i
 4P1uwfIkDVWY1QRns6Exf/qHOxwaS8NtuA==
X-Google-Smtp-Source: ABdhPJz7nv9lYuZ5KkadLJAV5fab9VTBkJMiCo5gXK6zwoVXc6PN2iJGeFdHIzIkOxvi/UE+Rl1lmQ==
X-Received: by 2002:a17:903:4042:b029:12c:8a5c:3d4b with SMTP id
 n2-20020a1709034042b029012c8a5c3d4bmr28299pla.71.1627979549314; 
 Tue, 03 Aug 2021 01:32:29 -0700 (PDT)
Received: from localhost.localdomain (36-227-234-175.dynamic-ip.hinet.net.
 [36.227.234.175])
 by smtp.gmail.com with ESMTPSA id w134sm14671991pfd.124.2021.08.03.01.32.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 03 Aug 2021 01:32:29 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: oleg@redhat.com,
	palmer@dabbelt.com,
	linux-riscv@lists.infradead.org
Cc: vincent.chen@sifive.com
Subject: [PATCH] riscv: Ensure the value of FP registers in the core dump file
 is up to date
Date: Tue,  3 Aug 2021 16:32:24 +0800
Message-Id: <1627979544-20811-1-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_013230_884428_C7F40267 
X-CRM114-Status: GOOD (  13.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The value of FP registers in the core dump file comes from the
thread.fstate. However, kernel saves the FP registers to the thread.fstate
only before scheduling out the process. If no process switch happens
during the exception handling process, kernel will not have a chance to
save the latest value of FP registers to thread.fstate. It will cause the
value of FP registers in the core dump file may be incorrect. To solve this
problem, this patch force lets kernel save the FP register into the
thread.fstate if the target task_struct equals the current.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/ptrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index c54cafb569b2..1a0dffc61f9f 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -60,6 +60,9 @@ static int riscv_fpr_get(struct task_struct *target,
 {
 	struct __riscv_d_ext_state *fstate = &target->thread.fstate;
 
+	if (target == current)
+		fstate_save(current, task_pt_regs(current));
+
 	membuf_write(&to, fstate, offsetof(struct __riscv_d_ext_state, fcsr));
 	membuf_store(&to, fstate->fcsr);
 	return membuf_zero(&to, 4);	// explicitly pad
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
