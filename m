Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388FCC25B7C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=czSVzr0dYGT0JSRe2j+ousIJdL5Uzu9n+ltUzOwV1Vg=; b=TXZeOmPeEEfiOmvMZkvsuInNYJ
	yMoTfINQ3LXCyUEJHzuRemU3OIS67NSmLHzY746GbVI741FbdfMtDpmhrP1Vx0QSyq5KE5us6SR3T
	Zfr0wsC3koUw6SBuvDm4uZZHbZeT/EE0hUwq8QpVSWC55Y0i6fCsRPeK9/ZsgVQRsdA8BAJaT2leE
	OivQ1VlHd8cB29ldhMiaIt0xkSU5voPDRbo+JohlqKBW0poVCf+kn+1kpVZvlMNNZ/5ZLOOCljcVH
	/59tzXZWRma1w+uk0yk7hhiZXG01EIBDibQG+/EcbdUdi2rxvvR0Ax2yAhP99f+fPz2DdqLPJYZnw
	G2LsLgAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLt-00000001Txu-2OH5;
	Wed, 22 May 2024 01:01:09 +0000
Received: from mail-pl1-f201.google.com ([209.85.214.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKz-00000001TJQ-2FpD
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:29 +0000
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-1f314d14930so7536175ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339610; x=1716944410; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=k0SrfosPfaORMORiDV3L6HqdThQeC5VRMNDfvSuUG8c=;
        b=MH7002z+uc/opCwT04JOD0i9MtGGgVrbhsaoUnfrYZY3HzAdcCy4sTDP0vlSTK08NI
         gj/5MzRhXAxmuhdYDjVVXJ3FqZ7aUbEWuhFKZuWheKvHzezlsPtHJwbInNuIOHYZJmpV
         6o4nUNZXIg87DAfoJkmvMaOgbQcyur+WRF1F6G687dL6ZfZh8z0ps4h/D/YnyOPZzVDE
         c8Un1Mo9wF8VokUumaLAq7JPizAb9GIeY1Wy6gJbYHWeowa3UYu3iyM+7McVVedOUOyw
         x00snJ/NQmdbG7rZfl9USqcr75KMIO9H3GcSyPSygpmnomZ0qpowqUDNBHKe7NB0lvaX
         XRwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339610; x=1716944410;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k0SrfosPfaORMORiDV3L6HqdThQeC5VRMNDfvSuUG8c=;
        b=SHFH/7zcdcyxPwUezGKdFQFtOZ8c3y5qkaxwbIF9uYyBDq9XVt+eNvIn/lpOWTbIeE
         hRHEaOfhQRIRdhTsdW9PpZ2Gowm4cigvm3dIFCRYQ0daM9HsbethjdN5VcSEKb2uAygz
         XOcjaXgVUuMteqN15ywDv7JQmmrkTze9bPBg2dJr8BnnqVQoM7HAcB9TbDKu9hGY9cjy
         q2Tx2sCT98ImdtIwG1AlzETfNbjgWZ+llDqWZDlAxvAxZKOpZEkg832AghQOKdZoSlXQ
         wdzvQTrIT/cfYMkQ807U9TGtgHZ2CMHg4J/jGwL6GfyLgEyZg++dhqnn0JERDqHRVOg6
         CvZw==
X-Forwarded-Encrypted: i=1; AJvYcCUyN8zwxurFTMZ5jiqhRtiHz5zAxkkJ4dqVqflCf1khzEhKHi0n/i2/uOtnOeQ72vJroW9dWeOD+kzU4aUheMjVHGUDRvl+EBJN6SjbTDGi
X-Gm-Message-State: AOJu0YxH9uYmuEPs7lBEx3tAVuW8T0W9d30G+DKLFfNVenBD9Ee1t93O
	r2b5+Pf2NgMayetMlhJNr8IcYwzq7/u0i+/jexlffqPyz88s/yVZEIW4sfkHOcLT7/doGJl4ubM
	Ung==
X-Google-Smtp-Source: AGHT+IGUpVwRCqPawwzanMXPOZwgNaMDkfSqd1hp2W1p1CdLiIMpUGI6bBPVJi6DEWQCXHcXLDTPCIyai9A=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f688:b0:1f3:7ba:db47 with SMTP id
 d9443c01a7336-1f31c7f28aemr145555ad.0.1716339610323; Tue, 21 May 2024
 18:00:10 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:59 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-14-edliaw@google.com>
Subject: [PATCH v5 13/68] selftests/drivers: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180014_128578_D99CFA76 
X-CRM114-Status: UNSURE (   9.15  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
