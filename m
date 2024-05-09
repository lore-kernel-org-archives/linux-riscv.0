Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299C7C25B79
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=eJOWdE2qQZYrJFHIju7LB62X2fUqe8zKHf2uaU/ZMWQ=; b=s9MdD4H6BLZ9cxOAIad0LqWoX3
	ETTtvTZH5UeRMK84Ugg3QKDGBEohiAAjRip0/vj5MMaASpZAeVwdzDMnaPCOQ7NIOkBzrbPkTwRc5
	ERPmLLCqd8beX8pJ2tIpYNuTUkSscULRwSeHBKs2n5nf5LkDEmyigLR3JfyeBKrxCcqj04hRMIGoI
	KSccaE7DqYQEv6PFx2B8n3gdokSDM0HcR5FmHOX44XtKzOpMODPdZwkkhaKrcQdofEEdI/9sqnoJD
	K6RV5B2mPzWqHQsoKmPL6Mqn/aDobBOhxJJdlrA9MXnoIiDW0s9YBlsHT3afazFoTup/tUyw01M9n
	T5gyvEIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIj-000000036Hd-155f;
	Thu, 09 May 2024 22:31:45 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59z5-00000002cTS-3OAx
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:26 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f446a1ec59so1126771b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284996; x=1715889796; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oiy7DTv1aGKmws/cPGkTZCbrHaB1ocI0/bjdksGN1y4=;
        b=YeeU6sDG82sH9wZIoC1uiodbcCamGsnQRCDOPa3ewRjj9oSFbHcuTcZgwk4wEYq7Cu
         VKt3JjPucs7wkSx5V8hsj0ebOJSkwji2hcyCsTOuvns7aARnLmHK3nRoc2a1M+sj95eZ
         6k93XKC4nkTB+Gjfb98C+AVYOBMtuigjCugnOcAkI9wDLlyafP5eXKlrCmXAphOEjucT
         aZsrebyqRMsCxhQrVKzcLz2VMGudZC7dxZkJAUme+glD3Cd2iBRyjDHjPu1mn4uL3w4A
         qRFVBK83W9+3e6wr6mYY7KOzfV5m38RmrAmL1+mP20CxfMe2pFgpWrvi43/2sVxt/swi
         Ttvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284996; x=1715889796;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiy7DTv1aGKmws/cPGkTZCbrHaB1ocI0/bjdksGN1y4=;
        b=N+LqBk5FW0vqJNq6KIHsw7V/ue6QDVBqS8ZywbUwH564PLshkp72dsDF9NC9vN7RW1
         laR//2MtMyzqI5U8dAcJ/DU18VWqdgxBhYlCqJcQiVjCN0LoeYwxIBSqrzTHKPUiELdM
         hust4abIppojjgXvuT2YyDRiaJ+CBPSoGXvqvr/oFkIgIQuMQwQQ3H6jeTojbGDzeN0I
         3SF3QbcE6BwUDQkpLDTnMjDmmFhtIwN9sNKjxkhkgthd+YwSYLinaExZNi+QrTHQytNU
         jUkCCicqhPeXVEjjDx3tkmFMga04x9k9tiQQCK5VGK5wua/OfWNE5iG1+tYALTrU4Gud
         MZQg==
X-Forwarded-Encrypted: i=1; AJvYcCXtdtqLjOBiaSHI6c/s7doj9VWhAr1uUMtCPkHO/tWIc4rXZDma3eeykS5wO2tkm/Ej0L2hLFJFmJ/RlHa1khKNXeyeozMb6fjKhCfNaVG1
X-Gm-Message-State: AOJu0YyGt/cSrrhilTN4ouDJgKCg7aBfDRbZq9muHel4ashChd516b62
	o7ZjUAMKZWnuT3afQLDdSuvV663rNvRhUFRPs3hpRuQYEAohED15oaTo7M0GNeuFbfe3XazfDVE
	2SQ==
X-Google-Smtp-Source: AGHT+IEJ/rJS6p21P2/qhLYsQGGVjwiajthmzURaTvAjOCnE9jf3eBCmxwF6D/Wet0iEWq9F++qDVmCDiHs=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3d54:b0:6ec:f406:ab4b with SMTP id
 d2e1a72fcca58-6f4e03a195cmr28293b3a.4.1715284996043; Thu, 09 May 2024
 13:03:16 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:42 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-51-edliaw@google.com>
Subject: [PATCH v3 50/68] selftests/resctrl: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Fenghua Yu <fenghua.yu@intel.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130320_020426_1252DADB 
X-CRM114-Status: UNSURE (   9.59  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/resctrl/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/resctrl/Makefile b/tools/testing/selftests/resctrl/Makefile
index 021863f86053..f408bd6bfc3d 100644
--- a/tools/testing/selftests/resctrl/Makefile
+++ b/tools/testing/selftests/resctrl/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2 -D_GNU_SOURCE
+CFLAGS = -g -Wall -O2 -D_FORTIFY_SOURCE=2
 CFLAGS += $(KHDR_INCLUDES)
 
 TEST_GEN_PROGS := resctrl_tests
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
