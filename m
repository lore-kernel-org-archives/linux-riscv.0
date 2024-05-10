Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631C4C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=8hMRH7oApXm3OA9JIjnfiYUAxkYm/FFx+9mua4X/wag=; b=45hAyj/S0ZNE/Al2+c+ox2hyvL
	FWANYCCqe0phPQ7Qz8hJeqT/dfJJnB7BVL3OplLNmCCVzRjVeSKgBppgD39/TI9SRPyqoxz6jMvHk
	HqmtH37St7p9KTpdR9SNNIubQGgvJgce1edvj1awT05HwO3jTtAcYNmYt4anBX3Nz9k/eV/6yCunm
	Y/ZvssJdpC+xRDo9Fi/CuOgzGy8/1Xu6APcaxmHBkYbyCYvz7KT43cp4SKvw3zdG/DTnll53NAd29
	waCyigfMCv/0gPktWlmELLAsrHfWTwy8gB0dv4kDOWqrMIXuAmSl6UPwfeS+lwD/F4ZVAm1MLXKha
	XSlUKpPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dq1-00000003N90-1orb;
	Fri, 10 May 2024 00:10:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpo-00000003Mza-2cZE
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Foaoxt2LsqEx0FNpmHVxEqBBgl44UXJZw/CQ++lOnVY=; b=cNDLUjaAmTsg77v2xiBcfIJ8Rv
	smn7uzZTxxqvoAOHUR/ahtu4vEsUncmgVmI2S8ZQfLPh6n21F107qJRBlvghi+IaeA2PG8k4YJ7jV
	BpJJ0/xv8YN4Zv0H1dSb/OIJ55yv8Dzr6mam02oBQss7HETsQVELhLnLI2P9Et2+ikfkDif8Tw/N+
	VzliqRs/0ORZM1Db2iIoFDLnE0cXUHXnOoIgdB/TcRWqzvqO7NIaOHNMqXMpcMgyHwr744FgWhsCm
	FgMZ0MY3/22rFmq629XQ9OVE1dTl/sSm+dVRoAf6ffN1gEI6MijKVY9xE6L/GmCcPaR1zs9hb4oZ6
	Ph8jsf9g==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpb-000000035wJ-0N3f
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:57 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-61c6560f50bso1310223a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299781; x=1715904581; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Foaoxt2LsqEx0FNpmHVxEqBBgl44UXJZw/CQ++lOnVY=;
        b=EvBmGOtffvCUyT2ah/RX1L9rUAQIkA8t58dcANJ5UypWHCkPJxlVm0Veug6DPiHMY7
         s/EMiEuPdCunM/kkzX9X6A3+XeZ6kH7QsN07MLpxwrQUdKCuIvthRnWauUusy7b5E6uU
         bVZj4iqhU6UqWDWSHTKISY3lbRxojrFvfl6L00FzvZsRtKpQOANrh3t0X+HllUzKa07s
         l+0DBnKfncfmDP1P4YmCyBvHYC4y9LAe6ERy1HWxlgJrisS5f/oDtByXAu7qh1rsaeYH
         PCilQLfLVXlcGZfN2pFz10+NbsGA73m+cYIxWELkay9J2ixjSE8tm0F8noq+nxirsNNB
         VOrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299781; x=1715904581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Foaoxt2LsqEx0FNpmHVxEqBBgl44UXJZw/CQ++lOnVY=;
        b=cCLP/fzCyvMKVWQ5q0/AZC3STe/RGi7vtVhVwKExJ7rONcQH9/EoVsSy1ZY8/2jUXv
         VxG4v2kciruvbg2ZP9hIinVaeGLQqViwugvcLLuZ/JmDBTkTrmc/Ib8JKqclYuNU4Gbj
         ZnGZBlGWDi/vP6nsA/nCMgHCWDAHuC+fzEzDRbZvZQWdJCmm0n5JWl7HsYu42ryBUknz
         o9EO5dyt5u4Lvv5rZtHp8nZYhGY2qxGv5Vx8hPjiFqlozYP8y0xUdhr+8OlnhCL14Ev7
         DczefkdUdzDZnE63BGdVRUTHKlVniRojSX+Jl7IF6KZG9T8GVCwHYZA5nLswYPc9eMPN
         GmEg==
X-Forwarded-Encrypted: i=1; AJvYcCV1+0ppeu0yUe5GJ4XsMWtZsMKC1iqKZE5Ca5r2sbi00XqR/l+HCEg/+g2sSorpQjKTJj99mzCMC+P8WhCQL1Dv5sVS2xd+3IUCbY/X4mvP
X-Gm-Message-State: AOJu0YyDFzUTniVFBVXeJF3A1adfglc2mnoHDpUAt9mRpuoLKnO01yvL
	FGya2DVk3rodMwcspYS+9yZR2cnMNAcVlsU2NBurAm6bSCOio6CCbGTPLyeAjqbV4+LLlH6RkRY
	Y2Q==
X-Google-Smtp-Source: AGHT+IEm5G/jrY5wOaZzHkYpeq55oHRTRUR88LGhzE/OHI6ZzZVTBGHmSZq33Ya+XerVfw7CYTWDOUxIsn0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:f87:b0:61a:12df:f5af with SMTP id
 41be03b00d2f7-637422d6fafmr2041a12.7.1715299780987; Thu, 09 May 2024 17:09:40
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:29 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-13-edliaw@google.com>
Subject: [PATCH v4 12/66] selftests/drivers: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_010952_337577_2792F93E 
X-CRM114-Status: UNSURE (   9.19  )
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
 tools/testing/selftests/drivers/dma-buf/udmabuf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/drivers/dma-buf/udmabuf.c b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
index c812080e304e..7c8dbab8ac44 100644
--- a/tools/testing/selftests/drivers/dma-buf/udmabuf.c
+++ b/tools/testing/selftests/drivers/dma-buf/udmabuf.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <stdio.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
