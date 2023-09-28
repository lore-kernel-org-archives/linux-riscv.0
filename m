Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B33DE743CD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 23:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pklifZmYOF14HT9XEhhsspuXaMuFXOSC/DR3JomrRMo=; b=ctjf6JPHQ518QA
	MQphI0qPHvQQCD18pwYGoyxcWzSoj6Ms6YgSt+74dnZ9r2GlZEiJ4pzcPgfieT7EZVkG1XdQPwkZP
	X/dEzjHeZnQDIflzrXXG6riCXqk9coUGHPdh3tYL6nd8h+MC7G9uhBH1AataxYPqtyPwvdV7B52EG
	J8KJbL2UkXMjmLAshVCT8QPvsyr16Bhl6JsZBEzJlrcLhfUStTmODcTKlLUSujJGw3cu9jbBAUVOG
	up0K28wmBVGiwiWjXZoxtHmq65SDlE078kBQ23rQfyDKcbqjWSt6mX2s77iZ5HYhwR8CiQh9WNHyk
	RCmCN4vyFbYZkHGO1gmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qm0Bm-006qpk-3C;
	Thu, 28 Sep 2023 23:12:59 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qm0Bk-006qpP-0A
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 23:12:57 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-5859b2eaa55so254009a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 16:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695942772; x=1696547572; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abvznY10/Fe6b09wbHg5BDrZRwmwtAQnZLYNnlZNZAM=;
        b=adtuXmEUKamNSNaP/YS3JUYbreAMZ5M+c2ItdlLQdpLUyPcS82OWwkAaY3c8Ty3tLq
         PzARuwX/JZimJXKZFf+xgPZOUndHnY+5QzwumBqib2FD87U6siuMS9zOnbCO4c3JAc54
         Rlk/xjbY/yuz9jhWSzXiUgMtPjZ84FEPYiZgh9YaX9eyJUJAa3xrCB+QfxVm6hzIQa8H
         Ok7Jeo93JzxvR4tBYz2lYZrP+CHiwVFW16KO5MTnPNdjLAMxeflgLWPZcJlugUf3UdUv
         Tlf3Ooc+z+b2oMskxAT+TnaKTr425xE5zNM5ud323e5pRd3dU40KzxlmnRNglrgvBsfM
         03ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695942772; x=1696547572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=abvznY10/Fe6b09wbHg5BDrZRwmwtAQnZLYNnlZNZAM=;
        b=e5kr13W7bkRewx3COcXzjluVSqZcP4zNF6xtNzOzM/GApzusnLOM5JDo7qWPAWhcmQ
         QWhOcOoNiSLaPaT40F5ZfICGXRwxCGjuVYe/6pDQGMs/XGkw7re4mSmesenntzd/bYLM
         6STgRXnin3Tru+ckiFNfTSxajJoLv/CVrkLTMqJZrH8RTHo3gklBlo8ngki0JRKHDXtc
         tIZF49AjSZUNwZV4cMaSORqbJY7UfuJ0GGqO1la0zxCYhttv7QKAj4wO8ZeNJfYcE3kS
         otRpIq+lea/Hycq+e7RrTTs232ACflGyPwYn5LzKHC7pZnGuldQt3q6z55d2wbWo3VjN
         Rmnw==
X-Gm-Message-State: AOJu0Yz59DY8V1VmgtQjLCSool/NeYKJCYyO2BSCk6vx7BQHEy+UiqZL
	7ovCV8e1Xbo8FGltetiZgG0=
X-Google-Smtp-Source: AGHT+IFO5cRPZ8csZWghvSTk6pM7bsKvFnuuxXZVJkz4vWw+8JhNSdOtsLsuaND0x6X21eFtrGTaGg==
X-Received: by 2002:a05:6a21:1f1c:b0:14c:ca25:3b53 with SMTP id ry28-20020a056a211f1c00b0014cca253b53mr2198937pzb.27.1695942772515;
        Thu, 28 Sep 2023 16:12:52 -0700 (PDT)
Received: from pek-lxu-l1.wrs.com ([111.198.228.56])
        by smtp.gmail.com with ESMTPSA id cp14-20020a17090afb8e00b0026f39c90111sm83811pjb.20.2023.09.28.16.12.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:12:52 -0700 (PDT)
From: Edward AD <twuufnxlz@gmail.com>
To: alex@ghiti.fr
Cc: alexghiti@rivosinc.com,
	aou@eecs.berkeley.edu,
	conor@kernel.org,
	gregkh@linuxfoundation.org,
	guoren@kernel.org,
	jirislaby@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org,
	liushixin2@huawei.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com,
	twuufnxlz@gmail.com
Subject: [PATCH] riscv: fix out of bounds in walk_stackframe
Date: Fri, 29 Sep 2023 07:12:40 +0800
Message-ID: <20230928231239.2144579-2-twuufnxlz@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <f74665d1-4d28-01a2-5694-b06fde202d39@ghiti.fr>
References: <f74665d1-4d28-01a2-5694-b06fde202d39@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_161256_092702_28910753 
X-CRM114-Status: UNSURE (   8.94  )
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

Add vmalloc and kernel addresses check to prevent invalid access.

Closes: https://lore.kernel.org/all/20230926105949.1025995-2-twuufnxlz@gmail.com/
Fixes: 5d8544e2d007 ("RISC-V: Generic library routines and assembly")
Reported-and-test-by: syzbot+8d2757d62d403b2d9275@syzkaller.appspotmail.com
Link: https://lore.kernel.org/all/0000000000000170df0605ccf91a@google.com/T/
Signed-off-by: Edward AD <twuufnxlz@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef9..031a4a35c1d0 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -54,6 +54,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			break;
 		/* Unwind stack frame */
 		frame = (struct stackframe *)fp - 1;
+		if ((is_vmalloc_addr(frame) && !pfn_valid(page_to_pfn(vmalloc_to_page(frame)))) || 
+		     !virt_addr_valid(frame))
+			break;
 		sp = fp;
 		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
 			fp = frame->ra;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
