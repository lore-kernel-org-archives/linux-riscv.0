Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4459C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=V5VUVOENBUUAjUjHhIHvpK9tulC/QyRzhdyFNf2CQYw=; b=jy5ErjgheZvulxXH8K+hQ53h9L
	ClVeQmF/uPLnCuuopR2gjMr+3BRgMBJT1BrSv2pLC30oLbhm2vh8Z1nc3dd6wOsADQBDxPSXk4xzU
	6RoTNO1xXjGsJ2oCZBJ0Qc0YlUQjP/Q7BnKcjt3NDL9/rT8kxu+1/6cNEt6eFOcjKIqzFw/3KdQbc
	8oo4jJA5NUSsFtNOdmVa0xBi1NDNuCAGFWllKp8AfgiJ/nf/LYlZ8j9fFkzkJgWhe84vEbI5+uYd8
	8v1cmqxzzWH4zwDqaw3yotgywo7wfa+GNbT8aPzbKV0DgxyXcZ4R6+6XvU18wPr+VTidfmYGzJtrL
	ZS3RLOBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3T-00000003kql-28Ah;
	Fri, 10 May 2024 02:32:15 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drp-00000003ObW-0n36
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:15 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6ceade361so2991281276.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299921; x=1715904721; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dlrpveSTicTC1QjgYgHoRdW1gbJlSbbGgHtnkq6hedQ=;
        b=iGMxyJGMGoD79mxqTeiQR8kZ5nH+9ibIeFhR8dtCUKyEIP39MGjfS0jTiqh8hFHyf3
         ZwSIAHoe5dkeOe/ZWTOprgaKQWUlTsDyKdkYq3Kn1XcT1tJzyGfk8hnXzBPBUilggDqb
         tbWXUGtnwUlFNTMPxT/3YQR0ncCdQWMMvSilL4id7Wrs3f9fJYu7NRTPkRGU7pEWBt4e
         shn9sNExwbnGHwcSx2ksGROGyFi+iXyD0HXbsl5RJwfsk5m9W7Wu0SCLM6ds5vGbT28O
         mihGKJHonVg7Fd4Y5dLLJa/Aj3Dl965YwYs/7nSP05UEVOOTQuym+ShuZ/C2FPjRXVmV
         nO4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299921; x=1715904721;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dlrpveSTicTC1QjgYgHoRdW1gbJlSbbGgHtnkq6hedQ=;
        b=MrrGnFVDK7Sddg6lUg6oSBiwh6/kpx/HLpHI2A+F89j+96bygxVvXHVRPUfxmvLG1w
         qhcDqr/kfrCcKizmDjDaMoiGXATShysbXtR05XyylbJ7rhahshLBMRjNpdr0YKLbGL0G
         KmtaowI5q1i1vJbRog3w0+fq0l/cddxES5LV0vXtYZLlFoC7vPDAOPSFGK/szPtSJDyU
         LlTxIUG00Z5bSnOAgcmDYwO+EUtM4z1bRgSPcdqJwi5pQd7E3nlTU4cpsLckiH6Kxaqx
         9ZC4FoDrqRII0AMaNl2VjJf9+cl7ZfA91NcgB1WVeOPpwhCbRtD3ZPPr5AKcaCcC+Zog
         p6cQ==
X-Forwarded-Encrypted: i=1; AJvYcCUhrbOFJ0u10IBDA+9Xd81BrBOsj22gmBcGlR0+hYs9/a9p3hINkn9MwJpYKSetNKrpzt5OU4Yi2FL1hoTEbsUXT2OtYvZ222O/0S/nHqu8
X-Gm-Message-State: AOJu0YwwJQZt/N5ZHUrFsoXBiYui40uOHt2D4W7N+n0j2R+WtWT1EaR7
	r7yhIntwl3EeKVlPeDoFNRH2jPCTXwDaWVRjFfk6VQzKIMOaBDRymYHD5aY8cZy9VH2cdX2CNPS
	AXg==
X-Google-Smtp-Source: AGHT+IEljiny7OmbNGCw2EWYbsHOOVLKCcmnwEgJ62aNlyn1CZ9mTlCHDOKzsq6Mv/IMiisjYaWJaVEs9Uc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1004:b0:dc7:68b5:4f21 with SMTP id
 3f1490d57ef6-dee4f508f29mr292058276.9.1715299921234; Thu, 09 May 2024
 17:12:01 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:19 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-63-edliaw@google.com>
Subject: [PATCH v4 62/66] selftests/uevent: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171205_384772_598E3962 
X-CRM114-Status: UNSURE (   8.90  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/uevent/uevent_filtering.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/uevent/uevent_filtering.c b/tools/testing/selftests/uevent/uevent_filtering.c
index dbe55f3a66f4..e308eaf3fc37 100644
--- a/tools/testing/selftests/uevent/uevent_filtering.c
+++ b/tools/testing/selftests/uevent/uevent_filtering.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/netlink.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
