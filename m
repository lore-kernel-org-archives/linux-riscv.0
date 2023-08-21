Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6CB9EE49A6
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Aug 2023 14:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KWV9s9n/oqFs55CdNev8GSEEFvU8nyYiHKUCjxdvnRg=; b=SQuN9HiW6/ZvS3
	GI15QQYcOZUlR1jJDMp70FNuxja+/f2ntHiAeoGftsb5vubsiwMUeqLqvtI1VlZK+ri3mmXo+C7yC
	ObalolH7bL8UVii5ecMjxwffB2Vfj7FlaEC76iOn9Mo0bUvdamypM3XIpTBFQvJq01cTLFoCrD3LX
	87/M4Nghk7ykv2eqqYU2gvF8JAR1tmxLcCEwdIjVXE5osFXl0b8qFJhSONPdu7guzYU1yTi+WJhvi
	doO1ZI34BwtKmv3jqJm0U0seF6iYRQYWJLHqeKNbrjUpXE3PGdHBFqB+oisVdVExex0gh5Hf+VEHg
	ZPy/YYVa5Icck+VSKaJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6AB-00EDPo-2k;
	Mon, 21 Aug 2023 14:45:51 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qY6A9-00EDNk-0U
	for linux-riscv@lists.infradead.org;
	Mon, 21 Aug 2023 14:45:50 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-99d937b83efso441542066b.3
        for <linux-riscv@lists.infradead.org>; Mon, 21 Aug 2023 07:45:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692629143; x=1693233943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y0VxwGQ+xc22tBdE5JYBo+p1/T9lFHQp+2kQSzguWu0=;
        b=UoxFtxNjlxRrthJpynO9UmxugiBztedDVT6dChbXc1SQ81cvm1ax6fCvLAifht4oSE
         kdFKmXMP1ZuViqrS4n/Rd21PAD+L4SAOv3HVEJr/RjxGQSAPorbsY2juzf/E1H9bix6N
         NXJSM4s4vhnAVa/QaJC5W3um3c2d0ny1IbsW3OU/yGjjgo/t8gjRuHgtTtFfSpIAgOa/
         vmyIlfd1wuAqMK1p3S4tHMFb+2w2Ad0EuJY1dkcnZxNeb55CdVx2OeA8cY7xJYlEWcaw
         u8gmXVrDHNn220PALKRMna1g/ZzWZ7hO57EUd+EcfuQ9Ceu6b3JLlszE+qdbpTAhcGnV
         WgNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692629143; x=1693233943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y0VxwGQ+xc22tBdE5JYBo+p1/T9lFHQp+2kQSzguWu0=;
        b=H7qFv64WhSMIaJlhBIuB+azA7xPjk6L01zPQFxK3JsF44RtE/Qid3181D/19A8ZsgE
         yOKEVyS+C7N6FGdu2pPBC9h947vZW6knhk77wSkFpBeCs1tlBLPa0I8TZtU7xxHTVZFN
         njZHiHIJqnhUaGQv408k6Hakxz9oZPjjEYpFjcfi1awUxdaoSQxTKXPuq5dX9dzodKg9
         9OYufX0ml13bQ9BnpaW8Upk3A1Xqk7aIsFCH05neD5Vv/RK0oM+Llkt9Zy6l/QCDlwE2
         jWWSG4lcRCl9DXPwHx37Qv16e4x7gc8TVgybvu5w0PSlZXqH4hEUgCLDReq6H14imtNf
         mKFQ==
X-Gm-Message-State: AOJu0YzXCaA8Z7JoqkwLqQ4HFM2JULGD27mNyM4Di0qv/K7RZ204GTi1
	GR+Fz5NeM+bSOS/iCE8nou0Kxsa+YsQ=
X-Google-Smtp-Source: AGHT+IFH+Lipc3kHML632ozBnOob4H4RKIHgpELzZ/2n+k/9NDvTOXI6GrNMK/qPKXtU8oj+yb6vvQ==
X-Received: by 2002:a17:906:105d:b0:993:e9b8:90f4 with SMTP id j29-20020a170906105d00b00993e9b890f4mr5302704ejj.8.1692629143232;
        Mon, 21 Aug 2023 07:45:43 -0700 (PDT)
Received: from nam-dell (wlan-246006.nbw.tue.nl. [131.155.246.6])
        by smtp.gmail.com with ESMTPSA id dv11-20020a170906b80b00b00997d7aa59fasm6720356ejb.14.2023.08.21.07.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 07:45:42 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcaov@gmail.com>
Subject: [PATCH] riscv: put interrupt entries into .irqentry.text
Date: Mon, 21 Aug 2023 16:45:17 +0200
Message-Id: <20230821144516.20487-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230821_074549_192715_4A2E9EC5 
X-CRM114-Status: UNSURE (   8.51  )
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

The interrupt entries are expected to be in the .irqentry.text section.
For example, for kprobes to work properly, exception code cannot be
probed; this is ensured by blacklisting addresses in the .irqentry.text
section.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 arch/riscv/kernel/entry.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 143a2bb3e697..d7dd9030df3f 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -14,6 +14,8 @@
 #include <asm/asm-offsets.h>
 #include <asm/errata_list.h>
 
+	.section .irqentry.text, "ax"
+
 SYM_CODE_START(handle_exception)
 	/*
 	 * If coming from userspace, preserve the user thread pointer and load
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
