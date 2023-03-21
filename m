Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1F3C7618D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=glth5ZQfJ92Ew+QvAS3yUfoAwq09QN7myoevLwZsoOM=; b=H+Ca16w+0lN5Wc
	kuQOo9cbZmsY308aXP//b/0irNNq8WEEGZc73MuaccdMTU5XXX2BQiG7dfXI+EAE5X+/JAVSMt7bY
	JW1uQ6rgxMg9HGXp3wccHqvTMdjq1/J2RG3OEAjScWvz9wSESV49mYKSxPK7ZZ82DYR7AOmKeDrRq
	KJdkzpDIZ0vXbXWGLpA2eEZQR6O7OkgQS/u/4Ou7+n/oKz8RxaIogavLuoc8TRKDxEYkcROI1Yx3W
	Ss6f0Z7CyNPKqiswxb7M9Y7y3uBfxEgOCQpp+w7W7E04VVw6sybwPMPvCn08FFEH05cK+6XcH5Avt
	Y0RM3lrPZEYwoeL4eK7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeH-00BZHX-0m;
	Tue, 21 Mar 2023 07:43:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peWeE-00BZFg-1s
	for linux-riscv@lists.infradead.org;
	Tue, 21 Mar 2023 07:43:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679384586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ESJ/1knv++fPH2odQdRy7nTNYhZrFIAGHXT1ZfrTzlo=;
	b=S5oH/XkU1cSHZp3xwfDmM0yS1KB0kfqReKxRlQb9/xEFqJo9RfCWkk9j989I5/0C3T+Dhk
	DAdbJYb9fRBVgeMm+UfChe/nCIKJMhVC51wHiGpJXHAce+clbKteocJDHZW09WZvdPrRgR
	YU3DiUMws1CX7WLY1+3qsoiFaLiHwB4=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-1t9qRHRVPOiL70s3Jqpjiw-1; Tue, 21 Mar 2023 03:43:05 -0400
X-MC-Unique: 1t9qRHRVPOiL70s3Jqpjiw-1
Received: by mail-oo1-f72.google.com with SMTP id m9-20020a4ac689000000b005255baa8dfbso4344933ooq.23
        for <linux-riscv@lists.infradead.org>; Tue, 21 Mar 2023 00:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679384584;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ESJ/1knv++fPH2odQdRy7nTNYhZrFIAGHXT1ZfrTzlo=;
        b=F6Ec+g2QdbA+lnk7BXcBfX8BkEZYoP8WsSJLUF7PwwW6p13QuxY6HLLzmyMmWaVVLQ
         B2JpJjHIR7/A+eXTdYNsSxP2aC4ijr8UzP3rX9Keaopz29rf+PvaQvjqhAxTi+xPGhoK
         206Fo/jMKEgwjA25RGi4qjYTCAnrMSsDAuVw4LH0HI34LqVx0IolE7GFEZkhhyoqmZ/o
         pB3PK0N7UxQIRGWmbm7mLgfekZwrrGXWnLKaI/CKB7nUnL/5EvypGoAZU8vAMfyRBjWa
         hrLrAMNOzcmwlUOLYBgCdc0MkIPBaiG6U9XPwgiuNkr30Fio1qByYiUGbRf0A+VDbyKP
         Eppw==
X-Gm-Message-State: AO0yUKWzG3DSgdd3G8daZRvM+U3+MphCTw3Ln/t/DaUikualFLmASN4Y
	W5mQtDRmfAENvIwnn5SiVC4I83GjEUx1YGwvinBdua4Sg0d0Z0FTbqOZdZza1Cg5ACH448dWmKL
	RFVi/idji3wzGrs/7oKQYS2H/5/fq
X-Received: by 2002:a05:6870:4248:b0:17a:a3f9:9f5d with SMTP id v8-20020a056870424800b0017aa3f99f5dmr604193oac.29.1679384582157;
        Tue, 21 Mar 2023 00:43:02 -0700 (PDT)
X-Google-Smtp-Source: AK7set/A9uIR5EF4MO4MSwN8Ag5xIfJZhmykE+JqvDnTRRi0U8aZM3QFYPvL2/kXOaiQrFkYTcNKOQ==
X-Received: by 2002:a05:6870:4248:b0:17a:a3f9:9f5d with SMTP id v8-20020a056870424800b0017aa3f99f5dmr604184oac.29.1679384581888;
        Tue, 21 Mar 2023 00:43:01 -0700 (PDT)
Received: from localhost.localdomain ([179.111.176.145])
        by smtp.gmail.com with ESMTPSA id az15-20020a05687c230f00b0016a37572d17sm4047729oac.2.2023.03.21.00.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 00:43:01 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND RFC PATCH v2 0/6] Deduplicating RISCV cmpxchg.h macros
Date: Tue, 21 Mar 2023 04:42:43 -0300
Message-Id: <20230321074249.2221674-1-leobras@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_004310_692927_E01270ED 
X-CRM114-Status: UNSURE (   8.34  )
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

Re-sending, since previous send did not work on patchwork.

While studying riscv's cmpxchg.h file, I got really interested in 
understanding how RISCV asm implemented the different versions of 
{cmp,}xchg.

When I understood the pattern, it made sense for me to remove the 
duplications and create macros to make it easier to understand what exactly 
changes between the versions: Instruction sufixes & barriers.

I split those changes in 3 levels for each cmpxchg and xchg, resulting a 
total of 6 patches. I did this so it becomes easier to review and remove 
the last levels if desired, but I have no issue squashing them if it's 
better.

Please provide comments.

Thanks!
Leo

Changes since v1:
- Fixed patch 4/6 suffix from 'w.aqrl' to '.w.aqrl', to avoid build error

Leonardo Bras (6):
  riscv/cmpxchg: Deduplicate cmpxchg() asm functions
  riscv/cmpxchg: Deduplicate cmpxchg() macros
  riscv/cmpxchg: Deduplicate arch_cmpxchg() macros
  riscv/cmpxchg: Deduplicate xchg() asm functions
  riscv/cmpxchg: Deduplicate xchg() macros
  riscv/cmpxchg: Deduplicate arch_xchg() macros

 arch/riscv/include/asm/cmpxchg.h | 316 +++++++------------------------
 1 file changed, 64 insertions(+), 252 deletions(-)

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
