Return-Path: <SRS0=/uwW=7K=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F2CC433E2
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 May 2020 06:41:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DEA15208E4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 28 May 2020 06:41:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RJyQgJSB";
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="nSGbYcCu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DEA15208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyymQUzxXUDUGDiP40j+IBmm1X5EOZ7V5M3pcfRs+Ww=; b=RJyQgJSBl5K6O+xas0bf+8TOrJ
	p5oP6LM+WQcDPQ3skzP2K9H5GIwy1FchJyooSCQ0i4FPk6vcR8sPes8botHftBzKp4BKLanwIxukq
	2Z9Bwg1fC5UWcjiaEAgQ9pTm/i8VHX5L6/15vZeje20AcWDOmiCPmq6Ph8Z4A5ZH634AEaVOP6KmM
	kaiHpExAVebyh99+ll9aG6itIxzAa7+5WDXyd2RDebT5VXDuighj5p5/FhdnwQOKI1D8KrSKxjYMt
	EiDQJMW3dQEFAMF689eBk8o4Q1umHng/0NQlynLvh1Xwtr0TlKK3aR5TIr23lex+96e/U0obmjMXO
	E3ejVkXA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeCE4-0002tp-4e; Thu, 28 May 2020 06:41:12 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeCE1-0002sJ-Ms
 for linux-riscv@lists.infradead.org; Thu, 28 May 2020 06:41:10 +0000
Received: by mail-pj1-x1043.google.com with SMTP id fs4so2621181pjb.5
 for <linux-riscv@lists.infradead.org>; Wed, 27 May 2020 23:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=JyymQUzxXUDUGDiP40j+IBmm1X5EOZ7V5M3pcfRs+Ww=;
 b=nSGbYcCuCPGVWjqWOVHQqHC7PCTc5ij0fPoq6BySG33lzDVIrRf1JPtcQIa/ivVNc9
 LNp4JStadItLWo3DkG7jtSC8S4UfDUs7Z3/FcsGVWV6j8G1HzAqO/e8E3luqMzTTBlqF
 xBwpRvvb+ZhCShoKJSNdQ06b+DZ2dTa2xGwpsrE9qGZkW1Dpa3XXHGFKnlocpHRhQB3d
 H+7baFMj3qh3tysiWMmi0SEYWLjDjy0C2hNDiC5EEwJ1DZrdS0o+0FU2eb3nVTsbjD88
 j3KIPwQtNZWYO2prsVyg73MITSout1wEnd2r6jdyIOMS6FL1QEdKlp3LmdPegSnl2tNg
 /fuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JyymQUzxXUDUGDiP40j+IBmm1X5EOZ7V5M3pcfRs+Ww=;
 b=eWmqGgybt9W+6SiAtiYMaBIhrvw8jOnpq6jESuQvmC1lmLKxauto1cVIrR88S5o2b4
 /loWE2KLpw4rDDqheK4hLAHEwmEiImlGKDk3p1SfbiHeSpaOVNkWv4YWnrjrR/ArC6py
 nZkaxS+29giblkJ45/DrOH8TJcKcjcO1LET/B4YL+NCajIL6XwsC97AdnkuonLwaE0Kc
 muBEqrXqRX1ITdFzeqjD+BKVeGaXrdhRtMaj9OEREQuacgs3EzCAZRs1mm3VpEp9OmAE
 atN46p6nHBgm0fE4EotxFn7QM5i+rjGmnoGReMI9/w17wWnby1zM7bZRkHfcar661G3G
 7Rhg==
X-Gm-Message-State: AOAM530EAXtW63vHXcOgqM/09ARyl54JkBOvmHx+bpbNJmvnup3qxKI6
 idZwMxROhKAuTOrql+t93ybieg==
X-Google-Smtp-Source: ABdhPJyEpNcQ/jhi+ZpBBDbNNGSgjR2nPmE8d9un/VQNilVdrTBX0PbZyELaHSNRxRHNtd7DAiBUrA==
X-Received: by 2002:a17:90a:ac0a:: with SMTP id
 o10mr2080869pjq.79.1590648068965; 
 Wed, 27 May 2020 23:41:08 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id q29sm3773366pfg.79.2020.05.27.23.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 23:41:08 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, guoren@linux.alibaba.com, vincent.chen@sifive.com,
 paul.walmsley@sifive.com, palmerdabbelt@google.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 oleg@redhat.com
Subject: [RFC PATCH v5 01/13] ptrace: Use regset_size() for dynamic regset
Date: Thu, 28 May 2020 14:40:49 +0800
Message-Id: <e490cf0a1b57b7cb34a5ea1252e7a71109d6ffee.1590646208.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1590646208.git.greentime.hu@sifive.com>
References: <cover.1590646208.git.greentime.hu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200527_234109_749712_6E1D80A4 
X-CRM114-Status: UNSURE (   9.20  )
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
2.26.2


