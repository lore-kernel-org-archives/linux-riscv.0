Return-Path: <SRS0=roKM=7Z=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAA7C433DF
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2020 07:10:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE08520801
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2020 07:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qg21XEth";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="NR8c5r2k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE08520801
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sg9Lm/YutbN5f9zW+xwWCgs+u3zx03mdOZcDLL5rZHc=; b=qg21XEthFcn4udQ2VoPFosSPyn
	/R2fU4QKw/uHpj26eI1eh7pxz+/DyJNB89Ibfegt3Xy+0MkLw5DEBlBxJb5yxq4mK6QTi0RTXmGF8
	mj437qbm4lbUy5mXgVbhRTTfYQknNFWR1d5bLJ5hVlbWC7VA9at4GFHTaA+CqKjSnwHNugje56E+l
	w1BuFClenj7Nb7ZZv3/dlQmf/gjRArUC5eFUH0wovN8MUssZ/RcI0gQlvSqRevcoK2VWZ+axDaPmm
	elJbJ9KrE+p53ixePuCDbNdEh3zdc7OicES0Ub1naZuPjXY7j0ATBkvPJSdLTbkQmYGcuiDDgA1PK
	/YpsE6pw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jjdpR-00051g-21; Fri, 12 Jun 2020 07:10:17 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jjdpN-0004yx-Fv
 for linux-riscv@lists.infradead.org; Fri, 12 Jun 2020 07:10:14 +0000
Received: by mail-pg1-x541.google.com with SMTP id l63so1466510pge.12
 for <linux-riscv@lists.infradead.org>; Fri, 12 Jun 2020 00:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=sg9Lm/YutbN5f9zW+xwWCgs+u3zx03mdOZcDLL5rZHc=;
 b=NR8c5r2kPGt+D0zWH9UJWCDD2OEW7VmcBPlOHMIBQUrkGr2OhTIWw3v/sA0WFNp0l8
 oIiWwckAic2yAcXOdvffdq2BnAXDFzUrfjAyhGtO1RkrWvLtaUDvJGqmHnwK89xPw4BT
 R2hLzzQUUinFlUjDgqWv3xAcmzsKa2KRV4ijhNJspVA6jeqMLl4qRP4J6R84fvoO7Lz1
 SqynqQGZqLAn0ljjQ6Ep92AC/MEF0A/XtrgvXND0Hlf3h+MatmYKE5PFso3iSbtHKmaN
 /PqC7EDDJ1MCj0DI4vtRbnB9V7RvxNU43bhjmwj99gXsyea2BpM+xCVxZJkexlIhH9Xk
 dkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sg9Lm/YutbN5f9zW+xwWCgs+u3zx03mdOZcDLL5rZHc=;
 b=CS9TR6Ua1aSsaOCgNocm9USelTjL2vNYMMUP3lBYP3SWHQBv1PKsjnr+z5oZSoe5hz
 sh06lp+MmVurby9EaJs0ucYEffMp1cYOm2Ib4unHGsBPW1ZecJF+GaVpv3YgdQCLlHSZ
 4ILTUdNQfUMZ24AT5zDmm9snyrg98yFM+10DUBh2anNaQgIWARd7fjw7IvOXRgxIBFqq
 fHEGgD/hWlLUSP7v2uCbbJPoaw+UCkwfc53EaUSVR3LFdOQVRMauiCc3Sf+PuQzHAVfe
 1DAPLyZpw+5x6CeoXvlTAyHpTs4N2aj7eOsxoiQ+76J/vBVMTO7SMU/RVP8iFzKnWssu
 VUiQ==
X-Gm-Message-State: AOAM5303Nc6oVeZY2AWdJmwQoA8OvDlC68LU1Gkbn8OTncQED7N6/zw9
 Y4e4K8N70uzOAG0E1wsY5SOhF7eGAbTFrA==
X-Google-Smtp-Source: ABdhPJw5olV/JxsKv5JjihxwMCdrSsnylXvH/fyL7TAdlyOQFSWFNE+nFZeLa7jXucofV5WiDoQU9g==
X-Received: by 2002:aa7:85da:: with SMTP id z26mr10312343pfn.13.1591945812666; 
 Fri, 12 Jun 2020 00:10:12 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d2sm4336919pgp.56.2020.06.12.00.10.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Jun 2020 00:10:12 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, oleg@redhat.com, guoren@linux.alibaba.com,
 vincent.chen@sifive.com, paul.walmsley@sifive.com,
 palmerdabbelt@google.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] ptrace: Use regset_size() for dynamic regset
Date: Fri, 12 Jun 2020 15:09:50 +0800
Message-Id: <8dbfdc77d4fac81a113ae2572ff9d01d9f155bfb.1591344965.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1591344965.git.greentime.hu@sifive.com>
References: <cover.1591344965.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200612_001013_533861_1BDBBABC 
X-CRM114-Status: UNSURE (   8.77  )
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch uses regset_size() instead of using regset->n and regset->size
directly. In this case, it will call the get_size() ported by arch
dynamically to support dynamic regset size case.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Acked-by: Oleg Nesterov <oleg@redhat.com>
---
 kernel/ptrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/ptrace.c b/kernel/ptrace.c
index 43d6179508d6..946b2c4ec4fa 100644
--- a/kernel/ptrace.c
+++ b/kernel/ptrace.c
@@ -888,7 +888,7 @@ static int ptrace_regset(struct task_struct *task, int req, unsigned int type,
 
 	regset_no = regset - view->regsets;
 	kiov->iov_len = min(kiov->iov_len,
-			    (__kernel_size_t) (regset->n * regset->size));
+			    (__kernel_size_t) regset_size(task, regset));
 
 	if (req == PTRACE_GETREGSET)
 		return copy_regset_to_user(task, view, regset_no, 0,
-- 
2.27.0


