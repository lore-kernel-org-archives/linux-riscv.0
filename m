Return-Path: <SRS0=b3sz=MI=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDEEC43382
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:34:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6BC1C2083A
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Sep 2018 08:34:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="itU7Gcr9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eKADOI2i"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6BC1C2083A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=dCkvo1aOs71J4KjzTQWXVGuyU0bCT63SpoE/vZtPe8U=; b=itU7Gcr919dyJxgP1sz1ube/Tz
	+O6PJJVpTvg3NJWV9B8m5BSnYcxsPitMpwSMtlwImoAhqjT1ohb9TG0KCDtcf8wWHQNThVw6xp37u
	fI6J+QrsJ/ITdnlv1cCaVvehBYzVcwUXvn4Rd9bAZdQYmKRruiJuTdZtlGJy9XDYo2CQ4O+j2EpuJ
	3m13+zxk776ivay7TQ/KKwvto4HPZ6WdSLkSWkBEhaV8rBMLWu8dNxNj5Ad8tgKTqCM1StsJ5dH9n
	4rCwH826IV1S15HIUySDzubGvJ1v6gAXXXWMhdTwvbTCNyfJXuPdPqnhkKJQN3qkyMSZbuPSGdEvO
	6Kw4Moxg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g55GZ-0004RD-EX; Wed, 26 Sep 2018 08:33:51 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g55GC-0004Ob-5G
 for linux-riscv@lists.infradead.org; Wed, 26 Sep 2018 08:33:29 +0000
Received: by mail-pl1-x641.google.com with SMTP id s17-v6so9584027plp.7
 for <linux-riscv@lists.infradead.org>; Wed, 26 Sep 2018 01:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=xILCKLGDFjBBorarrUyjhtvIupooeyobvhfedOgKiyw=;
 b=eKADOI2i6nQICaHFJh3wmyCW+X+ZHYMLQaRN3PDajAUf6fPpb0Mtm2d1gWZx19RkoJ
 DsXhnuLL7njhs9H2WZbPtggcWsDcTHKoh+T53trD+5yozNttKdhwxRcI16VlRz7cstzw
 iIfmtT2DGc7uIT07IGvmfePn1ntx8sy7DmlRG6EPRjKPz0Yk1A5cfUYrOFvHoUhTk5S7
 0IC3lHPQxjP29QZocR95TNOhxwOt/4ZAB3uC6B6S8+NnYlMq4Bn5MEfvi8K2C7QbbeCM
 kiMSHZVRZAyS22nkzM8WyxEPhTw27NOvDYt1fhrxGzRdxPDMoubhcZmL7wwqp3QJYAqP
 d2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=xILCKLGDFjBBorarrUyjhtvIupooeyobvhfedOgKiyw=;
 b=h5UB7M65Gqqz11Cm706bexvfqpMVJtPoy3OSfFsjoWhTx8MAb9iotfpaUg+QrPywgj
 UaXLucSadE03WmVbJCi0w5aPv1cH/29SukXDa+fcUflKzo5UNIdqcvn1+A00o0N7UJZa
 uTOHjkqHKSVzuOz2HMkIbD03av+noA42uIkaNmzGAhxqg13YOwDKv/oP8LEBKVmkDOuJ
 o0JIR5rsFOolzBLmAgSEsBIbZRi2t6Z10p98E0NrG85moRxS9wveybm5NEjKB0Egajoe
 LXpFXU586EmBxbWd/hLiCA0h31Uz7xHtrss4F9Lsci3qKvV2fd7x2blAAJd5FfC+p8bu
 0k3g==
X-Gm-Message-State: ABuFfojFU4PJ7HJzs9APbjDIxlMFamacVXPvcdfxaOpnMWhZqNhfuzeo
 0NRvbPrkKePnCVjq3MKpvzs=
X-Google-Smtp-Source: ACcGV63mbL34umtDMJrqtvm67IJYgUXLwpTOdCowKFQDok+Q5wZK66EtkFlM+v0JYkbXA6yBHBpGjA==
X-Received: by 2002:a17:902:5e3:: with SMTP id
 f90-v6mr5088400plf.286.1537950781300; 
 Wed, 26 Sep 2018 01:33:01 -0700 (PDT)
Received: from app09.andestech.com ([118.163.51.199])
 by smtp.gmail.com with ESMTPSA id f15-v6sm5530764pgv.66.2018.09.26.01.32.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 26 Sep 2018 01:33:00 -0700 (PDT)
From: Zong Li <zongbox@gmail.com>
To: palmer@sifive.com,
	aou@eecs.berkeley.edu
Subject: [PATCH v2 2/5] RISC-V: Use swiotlb on RV64 only
Date: Wed, 26 Sep 2018 16:31:11 +0800
Message-Id:
 <b9b943c21725db9822a787a1e985010012fc33b2.1537949825.git.zongbox@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1537949825.git.zongbox@gmail.com>
References: <cover.1537949825.git.zongbox@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180926_013328_270283_68633EB5 
X-CRM114-Status: UNSURE (   8.05  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: zong@andestech.com, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, hch@infradead.org, vincentc@andestech.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180926083111.CuK60RMDfmny2LIlIvUeLT2F9vEK2YVlQQonJQLSeT4@z>

Only RV64 supports swiotlb.

Signed-off-by: Zong Li <zong@andestech.com>
---
 arch/riscv/kernel/setup.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index aee6031..872a280 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -227,7 +227,10 @@ void __init setup_arch(char **cmdline_p)
 	setup_bootmem();
 	paging_init();
 	unflatten_device_tree();
+
+#ifdef CONFIG_64bit
 	swiotlb_init(1);
+#endif
 
 #ifdef CONFIG_SMP
 	setup_smp();
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
