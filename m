Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5135C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CnsTzfyuMy0ZrtOZ2qgVJon5190AmrCJx0M3biRJsgE=; b=0pVtZGaudr9wrDqBga0+MH5I9/
	evzUPCPik97LZrQ8RjSf4JNQauf8lOl4F+qGZ50vxWuSvxaQ2q9Kq73KdSUOV1WtZw3NC0E+WhBOK
	2x9sSG3Uo5kGsNybF0qmyz8yHg7ZqxPezx5mn0t0maPGUuwHcCr8jyZKEhFkCOxrYNQoekHORfEAz
	9B/Y7enZg8rV+ij8wC+8UlclomG4J/hANyRr1GooOqEhApB4LX8zTquasZqE7egCTvKhALwO4e0Nd
	XWhEOGCH5PTpB11GUnc+LZ85/0xK4+ZNZt7Ct0WKutgr7ckYwRRcUWf+VI/dBL5UeK/ZKAYlwbpP2
	muFIQxTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMK-00000001UJA-1ASb;
	Wed, 22 May 2024 01:01:36 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLZ-00000001TkO-2h5m
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:00:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JxajjTXnYYVOFD9uBYzEDwXtIEu/3Rsj0ndr4XzJYGw=; b=XdGv/gtoOUpBF5se0rDkYsqrFk
	ZG+L+ffEUYLWum5P8vm0wtr2l6rYYyKKIk2p3/h1/otRz6l2Y9S4zsKozognBx+VTRHHfqM+rOQw3
	U0+nGl30MshBH4srDgDNFVeNawQolOZRAZ5294Vl2qerSux+v/nOjieFDH1nr8RplRZD8mZQlt9e7
	jjc+fx29/qF4Zu9Aj9nnt5MfVMrhmh8oIF2t2xLsKSSoKWXCawGdSjZ2JL/oFLGoY/sWjthV9Afkv
	s02tY1txEq7VcIFVGDhMtEaOzl45a+V0vVzIeRQq/mnIJZ24UsB786LlbiMRLRP75j8mU2C/fgwZq
	PlUQh0mA==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLT-00000000Alq-03nx
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:48 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-62a379a7c80so229318a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339637; x=1716944437; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=JxajjTXnYYVOFD9uBYzEDwXtIEu/3Rsj0ndr4XzJYGw=;
        b=Mu/JNB5tj7a1yaCibLscCI3G6MV//L4CYdlwQNwzwfmHAkkoW/TnsMSKB9ZXKiWKQ6
         UvUxOyEr7C95HPftHn2xqPF7KnRlqyjd+9UAikI1dIHw3N0e/FwX/8mjijrmDeol9RmB
         FDBoxP1y6nyDdxYelouvL+OlSBRsq3A692zSn+ePp5+d7mclqk4jzT+Z/3WtMuDEJhSm
         yqQPa6WEGBOgaLXbnSLfgovn3A/KtvJIZ2TeiSoHce7B72OfYem7Ds9jPlg3PU0DqbeL
         5fMfrgE5wXOq3LoLdpKDYL3PWplqH8UVYOEy5a4IlZjTV7vpKGZ7SdjgffRqjsC81m0v
         NKoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339637; x=1716944437;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JxajjTXnYYVOFD9uBYzEDwXtIEu/3Rsj0ndr4XzJYGw=;
        b=Jyeo3rvbCe+WMEy0OM35X2gB7d9OQQ9n17gHiz1HNT8bcRjrNmqqQdkujn3kNX0ZzE
         8lguxuXTrvD/GCEAH16s5nMsUph5QkZvx5A99lX4qIS0WfL1tgSRYEnQLppVLKl1JkME
         QOG12ydMRFqtiQLA0GqSGS0gXTQ/MWp8aicK+UZvZMLwxvCaJBwe65uAa/FrZiJsW38r
         2nrexwUR/FiTdXO5U/z4u4AfeVUGkww+RqkmtYYSgDlNqilKIu0MAg95WScNyneXTFLq
         yxq2bR8cS9GjzRvLHUTJCDTop3kcM/pwYCawP2ZM4eAR2jwV9osUiYhRltqwD+IFiX9u
         dfLA==
X-Forwarded-Encrypted: i=1; AJvYcCVfN/V9nQUw3YpLbl3JA9Hoix4NH4Uf0Xh1hZHhUXrhXoqKX7GRH7wEPwPWkcWZ6fjGH4uRoslrHVmW2euuqVYSBBvBuFGElQYzGu6acxLM
X-Gm-Message-State: AOJu0YxdK5L9x8n/yayZDv2oG1EXnmCt8YDfHi3YHErM/DI6ySc12nk2
	JilSxZqz9Pj1KL5CSpn++lPSNjKKupMmZCOsVaGXlYCXiFEt9RUcxmAhmRJxxmzHMH4m8BU9i4f
	wdw==
X-Google-Smtp-Source: AGHT+IEnjqQT67JKIH5im85s2TXusw89Zmodc/cXnUeHwbA1PsuQIpfWppspP0Q6xlgu0hmLR6KjvP2VuXY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:59f:b0:658:7c4c:25b with SMTP id
 41be03b00d2f7-67601b5a4c7mr2750a12.4.1716339637230; Tue, 21 May 2024 18:00:37
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:10 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-25-edliaw@google.com>
Subject: [PATCH v5 24/68] selftests/ipc: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020043_124456_DDC91184 
X-CRM114-Status: UNSURE (   7.70  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
