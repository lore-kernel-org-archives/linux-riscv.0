Return-Path: <SRS0=vikP=Z7=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC13C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:32:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A30F20836
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  9 Dec 2019 17:32:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bFyJrnza";
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uS7kguZb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A30F20836
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JJx1gb7dyIux/wvtlAjUM4Ul67VDqBxG4kjHz1T/apg=; b=bFyJrnzawGwPbW
	lmy8lSSk7lbtHtqidIqEeaqF3SVJsnqepZwYGsZj5GKp+m789hd/KC0W2lPcjpqrknpO7pi0DGRAE
	ZeeltCAvzdXKLbVC1OVo3gt/DB4EXO1OGYiL7YWf/Qc59W7GauVVmolrSfXvw76l1oKTV7kal+Lrd
	PWBPhOPlVXpCnGQlmxN+DOkghhFSp3y2i8Tra/RbVixfezpnz1nlRRsJwzdq8RqciT0WPNX2jxpgs
	43EkW9g7yYf12qLvoeqCmr4GY7SCwmFsAzHRrF3UZxPOCwOUu9mYGWdW4OVpaFaftliEjeaQXcFpk
	dNxbfjQA490LYNbFxUag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieMtN-0004ey-UD; Mon, 09 Dec 2019 17:32:17 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieMtG-0004WZ-PN
 for linux-riscv@lists.infradead.org; Mon, 09 Dec 2019 17:32:12 +0000
Received: by mail-pj1-x1043.google.com with SMTP id o11so6180344pjp.9
 for <linux-riscv@lists.infradead.org>; Mon, 09 Dec 2019 09:32:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JJx1gb7dyIux/wvtlAjUM4Ul67VDqBxG4kjHz1T/apg=;
 b=uS7kguZbewotiewe3eNEHiAYQ1NBG4BmutBfowVjnF3VSkL7gmTKFZI1qF19mjsr7U
 5Ymr+omBiK4cAUBfSnV7+LszdqA+5WKxmsJQPsh1nWll88ySD6QpGmUEVspEOECCoazn
 ksCs2t465xw2OIIjFykCvuSH2f/l6AHW15B/bMSIXzYmku7qq5PQJxVBwFHHqEEEIJf2
 lcBEpY62ERPEUolysJgD7ieIuyWWFH6st04PLD881a9iHhTgiq1ezMCQy+k7i9Kccdxs
 Xy0jnm0HdR+Ci0bYEumQQ43R2A8zgVWjnPvVyqCmlkjf9AE0SgiTdy2UDK2cx9hPyCgq
 qhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JJx1gb7dyIux/wvtlAjUM4Ul67VDqBxG4kjHz1T/apg=;
 b=kbdyHsDmYmETwSEO90/8xnGHkg1Kvz5enwJz+kq1tNblOhlparYqwE7w5TipWHEVcw
 ZoRLS2QIHyzoYMT9aAKKEJ4nxU05fheOqvQqPFWIZ2joh/nW5eSkpqHtcRshBvZg8izK
 iEu9vmvmsmLwW9ryfvyupjTkcbusgz4T0beyuLJGsm9lPFLev9R0vMZeXTrODG2e48Rc
 vNB76osD9teVSpxSB6tvV1st28/YRVT+pHP2sOqIhyQrGpkjpmE2oHoyTJm7X/zwW7cS
 36ImITyQBHi22uqAt7A5lgQo9DHBLDHu/O4MiKqSh7mjmb9DmlDwTuy/F986I9GuKXt+
 4PEA==
X-Gm-Message-State: APjAAAUjYHz/yoLDpma12QufMn27LPNr8z4JXZ0s3iLh7c75zs4OlDZM
 zjjQDnc1jp959sv8VQ0Y0QA=
X-Google-Smtp-Source: APXvYqy8i85CXpsfyv8dckCdsUg7eLteOhLSNdZVYk516MDZYXdwuPo9V61Bsf6Mk2ZN6V00qpmncQ==
X-Received: by 2002:a17:90a:ac0e:: with SMTP id
 o14mr156393pjq.11.1575912729718; 
 Mon, 09 Dec 2019 09:32:09 -0800 (PST)
Received: from btopel-mobl.ger.intel.com ([192.55.55.41])
 by smtp.gmail.com with ESMTPSA id d23sm54943pfo.176.2019.12.09.09.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Dec 2019 09:32:09 -0800 (PST)
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>
To: daniel@iogearbox.net,
	ast@kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH bpf-next 8/8] riscv,
 perf: add arch specific perf_arch_bpf_user_pt_regs
Date: Mon,  9 Dec 2019 18:31:36 +0100
Message-Id: <20191209173136.29615-9-bjorn.topel@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191209173136.29615-1-bjorn.topel@gmail.com>
References: <20191209173136.29615-1-bjorn.topel@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191209_093210_840139_AEF80920 
X-CRM114-Status: UNSURE (   6.87  )
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
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn.topel@gmail.com>,
 linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

RISC-V was missing a proper perf_arch_bpf_user_pt_regs macro for
CONFIG_PERF_EVENT builds.

Signed-off-by: Björn Töpel <bjorn.topel@gmail.com>
---
 arch/riscv/include/asm/perf_event.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index aefbfaa6a781..0234048b12bc 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -82,4 +82,8 @@ struct riscv_pmu {
 	int		irq;
 };
 
+#ifdef CONFIG_PERF_EVENTS
+#define perf_arch_bpf_user_pt_regs(regs) (struct user_regs_struct *)regs
+#endif
+
 #endif /* _ASM_RISCV_PERF_EVENT_H */
-- 
2.20.1


