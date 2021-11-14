Return-Path: <SRS0=95+d=QB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42102C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Nov 2021 13:05:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DDA816112E
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Nov 2021 13:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DDA816112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6VQXvE4pgk4Xz/4Yjuc2NQyxVA0CT8nOvD9fO0CNEyM=; b=15mBGFQ3xODE7w
	tlnRGPW7jLiwm/nvmMIqnAsROSaXwuuRQkEpkFKXKD8XMRNvwbDdxeM/v97S6ZKAFOl2J9iv8Jy2b
	WV6EZUBkwAjYMzpc6wxgwnyuEY/G2iP2n+dMt1HizT7gLfyey2VEpXmgH04pKbYiGSOiMj97WVUbs
	PNigrWHjaCTPKlk0xoXL9Vj+/wmC9AomXkkpdJXnDSrj8aUH7odLtv/DJE8N4mepMJNJpnRJ1McO0
	GDDeU38CJgD9MtGO3yq4leXn23dvUco53IrWTYK6gRc3vDWXNqqJGdIK+e9bKL6v7405GT/Zsmr4M
	+br6N1MKyNsB7iegyGgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmFCa-00DgJl-9v; Sun, 14 Nov 2021 13:05:44 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmFCX-00DgJ7-0A
 for linux-riscv@lists.infradead.org; Sun, 14 Nov 2021 13:05:43 +0000
Received: by mail-qv1-xf33.google.com with SMTP id g1so7857654qvd.2
 for <linux-riscv@lists.infradead.org>; Sun, 14 Nov 2021 05:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JS+FiKSeT5f12gRyVzfSR3kPguW23wtXqyvRjIMFpqI=;
 b=Oflq1b4QfmP4yco6/I0/eR5FQ5o1N+XGPd52rf1iUWEAAHAWQQo+abwAkMyTJ3+lPV
 jpuBs0ng6D9Dh8xlaU2d9x/7U+e83pexQMtqlcfixYH2RQzl+Fs9Ezn1+YGYM8ccuSKt
 H5/gt5k9PRVvH6bXgoqfgxhuV4HPTlDvMbDk2A3trBKarZyvK4ELPQ8Qgk2a2HUpMoWP
 yXgP8jwwA/ChsXr2FkPYcqoCuj+EGdVT/fOjZQ4KCrO5VYVHm3ZQOWHS9wGqC+b6v4e5
 ZRRTQMFJGag3KBgDMZEDO3VIWxCnUFoYXuYc5mGbhfhnjcctC/Ys30IPx2sXtbqP5BMf
 kZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JS+FiKSeT5f12gRyVzfSR3kPguW23wtXqyvRjIMFpqI=;
 b=BY9SlEoyYXQsTpfAaonGK+7nSojXdXNCEJwqHmV8w0ZG0nmkNjVN+i55bazhjP5z2P
 Bu4qWix8XYJWm1+gTZMgsAua1qLTxdXrutGGPMZckyOWVRRZ/TV06UU0o1bkYwykSAfp
 U5n/ni4FgDdNkebI0oJmDmUZgOpyDFpCOrWfbHyVtWeRvQgjEgyAIhdDRhTxitF2UAa5
 v66j1Ycesk/ZvHxxMu494DBgCpdNNU0W7IhtEqm6KbYqRhez2nDjAjsR5DHVdF0YiIKx
 0gV8bAS6fdIRgT24y+H1co3jkestIlhY9DKk9/vyhCpQra9AYneQbVC9UC0xuIoZi8yV
 VPOA==
X-Gm-Message-State: AOAM531gdRGSqAYHbhR1XDB8G6F7gfKx/j+spxBvAOjRNHibAah/qSzv
 l0Lc1aILYQp044PunqmthLE3MWgKM3o11A==
X-Google-Smtp-Source: ABdhPJwM/qU0jM2z78GbeoxaMOY7JmYlp8HVDHaWPpKHagtwzduHAHn7iSiGOuJPwOff6KzXKKafsQ==
X-Received: by 2002:a05:6214:27ca:: with SMTP id
 ge10mr29022178qvb.46.1636895138929; 
 Sun, 14 Nov 2021 05:05:38 -0800 (PST)
Received: from dan-XPS-15-9570.lan
 (2603-6080-6a07-6dd1-7d72-c7d3-28b5-a45c.res6.spectrum.com.
 [2603:6080:6a07:6dd1:7d72:c7d3:28b5:a45c])
 by smtp.gmail.com with ESMTPSA id o190sm5251363qka.16.2021.11.14.05.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Nov 2021 05:05:38 -0800 (PST)
From: hasheddan <georgedanielmangum@gmail.com>
To: 
Cc: georgedanielmangum@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mark Rutland <mark.rutland@arm.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, Zihao Yu <yuzihao@ict.ac.cn>,
 Ard Biesheuvel <ardb@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Andreas Schwab <schwab@suse.de>, Atish Patra <atish.patra@wdc.com>,
 Damien Le Moal <damien.lemoal@wdc.com>,
 Tong Tiangen <tongtiangen@huawei.com>,
 Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv/entry: fix misspelling of instruction
Date: Sun, 14 Nov 2021 08:04:39 -0500
Message-Id: <20211114130440.1530498-1-georgedanielmangum@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211114_050541_078480_FC41C1E1 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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

Changes spelling from instruciton to instruction in comment in entry.S.

Signed-off-by: hasheddan <georgedanielmangum@gmail.com>
---
 arch/riscv/kernel/entry.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ed29e9c8f660..728c521dcc85 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -568,7 +568,7 @@ ENTRY(excp_vect_table)
 	RISCV_PTR do_trap_ecall_s
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_trap_ecall_m
-	/* instruciton page fault */
+	/* instruction page fault */
 	ALT_PAGE_FAULT(RISCV_PTR do_page_fault)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
