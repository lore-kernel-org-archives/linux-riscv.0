Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A95CC25B7B
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=2iLNl4CPzOoGw3E1g2xfBbhEBNb0id7KxhGiK5GuSy8=; b=Tcm3EnntxFHnqdDoO71/WMSK4C
	nSCY5cyZ5TD262zEnlF6+D8asPREDDiqUeZPaXj/LuET/X/JvbmdjZYsB0N1QJt+rKOakSXSEFVmD
	81rY7vuK4nMIO8fNSG0OT6J78GlzjdweL9UvJYiGNQdOipB0iTRXt2oA54SN6708TDnrF/6Khs586
	sQOEF7t0Dlv195r9gw6dSVffF0trrOQexP9DcJCCqexCy92wleVLnN45qYyNwKTVOk9q3Sh+6UV28
	A8pZk01n4wqkF/l8kjHZyDpzI46bCSxtuPQMBgi6o4zxACxIk/R8v856UKOB8Qzc98B5FJbqM8UqS
	+AsngEkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ess-00000003amq-0SPH;
	Fri, 10 May 2024 01:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqH-00000003NLV-1FDx
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=gdE+UHGZ+SYdvl2kt1cRiCVPiIb/90RAcCx31Rbgw4E=; b=Iqno/tIpBQFAh+kKxnptD0nCgS
	gRaAK3LwjwJv5Dri0EHRtXyxViTBePPx1TMU4634vcVUeiluVJ5zDYh/FICH+8ET5DJFl3HmlmaAX
	ZOgtrbo1S3Sr6o43DKTdTldN1Zs4E8YID20vbmS8z/J5iQayjGhqM/bf/F/ojYRxk6WAo/2n+YL2V
	sjEKSI+ZABf8DXz2wJLzTbnJHcVU0ki2k0y70oreBykPUkcV2wT3egMeON4LrIwEkmIgKHzWhZfFZ
	QskGhTE5CQVmP8R6g0m8vngh238JPk9exmxZkqDJPS90FuGTN/eu0SjeJl7mft+MFG2wQzk6ymOar
	+gAN7vrw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq5-00000003629-29mL
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:27 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6ee089eedb7so1505056b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299808; x=1715904608; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=gdE+UHGZ+SYdvl2kt1cRiCVPiIb/90RAcCx31Rbgw4E=;
        b=KvS/VST70i6tpehy+j16o6aKBbtQG/A5LHmFsE0FBzABI0YqvePQjyz6ZCutjpJKGw
         4YNs/Mv3/qhqffuXtZE5ltmUyIIVlNzSlMQRLau6hsZ5NHp4V5MAMphxeP+UUaHOSgeJ
         eEdrTrlT9HHPoGVY2yLRnD8dR9Pm4HeyYUgdvnNZLaHk4nfV5xvVOSvdduK2oTcPg2Xa
         eGeS1xTGnvuntyGXCawn2MmqWx/3WGyOynJVo8rVfc/+iXPF5rASdDhgbjbsuqiU3FSu
         0CZ3IgqTdNHFMmZ3oIRaY+WOxo0xkaNYgauiaiiMTVUH/i68S8vgazMeQO0zX0ofuB66
         rIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299808; x=1715904608;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gdE+UHGZ+SYdvl2kt1cRiCVPiIb/90RAcCx31Rbgw4E=;
        b=n4i5/l11D5eBEBLzyJXbiwK96XgCD5gZ5BDe8XuGFqkfAK2wjKHuAnyGoLHp7x988p
         Q/QM3Qcjr6jYtAURItVxZLf5lxSBN15fsTE4mzdoY9dlBcAL6VZQf1M3TJdCMF2R8fff
         Ku8cAOfEvey0mz/HRXhQfv+nixBJv4i8tsdZC7GEjtyuLhTUKDvUd+heVT3iraEaI2/B
         zULkImM5FqMy5ZTxpZRSUkXxrq2MP22cvvQEYwCRfZlOM2pPOnXidU4u0zbbjyV8t9xQ
         AGQ6aUD7NT+noxIE1wdRQ3DR8VLsaO+hgXGJoYqIjI0lZt7jSw9lyA2RT3dKilxXmHOQ
         txUw==
X-Forwarded-Encrypted: i=1; AJvYcCVLodiLXNYLoj8YtGA0i4E+mQfvK2Yr+6J+Pii7p2NovtRNFwkELcFQh8kQ2f+hMERGDSw6nfhqXjIlhcL2DBcuxl/GFs0AhmaXqvYSDRNd
X-Gm-Message-State: AOJu0YyuyKFj2yGp/lFHNejINJLHd2q4z6JqAf/69KGijGkfIMU8aXXT
	64elbpXVrAR0cvetDDplYVeuOmGgvDoW9Mu9KCIbxoTYF6PhrOJ49yv2yYAKsa0+9Xu1TOYgmWT
	SAQ==
X-Google-Smtp-Source: AGHT+IEfJXtiyieqL6lLKw5PMbyK05+5j/j0TJ21PWb0NkhFN18JJcDrrkKCOPfn5mFZZTU5hg5qrhmQ0UI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3ccd:b0:6f3:c10a:7be8 with SMTP id
 d2e1a72fcca58-6f4e0145c08mr76656b3a.0.1715299808177; Thu, 09 May 2024
 17:10:08 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:40 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-24-edliaw@google.com>
Subject: [PATCH v4 23/66] selftests/ipc: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011022_556737_655B10C2 
X-CRM114-Status: UNSURE (   9.40  )
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ipc/msgque.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/ipc/msgque.c b/tools/testing/selftests/ipc/msgque.c
index c75ea4094870..45aba6aa8e1d 100644
--- a/tools/testing/selftests/ipc/msgque.c
+++ b/tools/testing/selftests/ipc/msgque.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdlib.h>
 #include <stdio.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
