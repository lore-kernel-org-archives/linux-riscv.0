Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D43C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yDta1P6QMSkRab5hVhHKmqLARegRv8KgBCUqaD3MJtY=; b=G/HpvNtcR4NjAzP9rnahC0sCVM
	GoI3BOB+cmfVynrYCvxYsA9h4obIggWx9oyXYAAG1+jCVyaJhLzPN9AhVA9XfNgSPQz94usR5fWRC
	o9iaQYSAn8XfdXpPvLWdNgocd/09vafi4FcvpB1J9lvvRqhdsBvV7G9KJcz5fz3pOwIgpuG1oLOg+
	+W+SEKAux6jf/lJP3zF7nFtTzz3oDvSCaZQ6j6d7OmGyZezX7wfAPeTk/CH9lOeZuLjaJ/or0DgBz
	BmxVoNtnBibbHek/yVEWq7th/20B9DIZdw3H7O6+/ULSI7+QzCm+VCRyKNIBHOhoFlb0KZKiLjqOp
	9eKzL2PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DtL-00000003PmC-3wf6;
	Fri, 10 May 2024 00:13:39 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drm-00000003OZw-1F6f
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:13 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de6054876efso2682822276.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299919; x=1715904719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BYMEuhcBRYdrdeW7LE9Reeo43EZwSWrRoGWRRX0Ndg8=;
        b=jG3ST8WTvuCA5aGhdqVH0A0fpkd9OahzmjaQz2ngPipClDjNIIZvgIP9xy0yaceUmV
         9SUaZArEgxTMrAVeFHLF1B5nBofG7zhreqhBKzOekf+jnjE6i9v0SEH0PIaxfTj79P5M
         nS+tDuACYVmkgm5m5vCwTUAV1+fEyFYpVGCPnolhftPAyKpDBqCBaokZ8RBfGDbmgxrA
         0nUfdGuIPXEVDLP0qfLF7hUnrzA8/3xq/OJEHg+UZYtpY7VocqdTAOv8BfDIhoF/lvTZ
         u4zf8PaIqGpzubmtXX8AmU/rWI7ZDKh1SBRoIM0u2C104xn+N7ZxpC3kCCK9s9anQJf0
         POHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299919; x=1715904719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYMEuhcBRYdrdeW7LE9Reeo43EZwSWrRoGWRRX0Ndg8=;
        b=C8o7rRRDYjUQI6ahsI/tWfjxfbU7ykITp2x4Wm/aP2SQMwjHDXJwFHZykEwCVl4NDI
         +tbcYiH0Zr4ZJ54G7sp0qFygoYYeOwMOnP8F9KIycectoE7TkszPuDq4G2muyAFI5Wf/
         DmlPEfwZrrzYvVyntDdEY/d3OYQlmPfxxbL7fm+cEq21KSFYpCbqbAAbq1kB29TtvMVD
         dbusZN1XN0J5PC1kroCnCtxqDeU/6idjjMYawO06usYA9HZ6xdhhW7/qoOxWlVnzDTRP
         ukhDuGIfVhJ3vJET/cdqQTrq3GTdK6WodXv4ddGfeha5TnKTsQCACSUVEu/Sx5X9JpAl
         rPpA==
X-Forwarded-Encrypted: i=1; AJvYcCW2KnJvpve/Nz0wnppclLCHJExdHMPOx3qDXqNWs8ZUvE30veGRltwOs/zl5Be8X13BWFT+WVHq8AJfJPlr3rVctUXZxCXyzTO2eZ++nkbR
X-Gm-Message-State: AOJu0YzHiQh2fN66TluAxSsod3HFI1Tp6sOOFKINgH7/cONvWjJG4VK3
	NAxeBRkh4O7PZKYj3HSBtBkJOFDIN3eeI7ab7PWiJye0hPOFNhOxhlAs+hL7PuZ/9oP2R0YF1sa
	pww==
X-Google-Smtp-Source: AGHT+IGnRoeQBtuZxzcPWjwywyTHSBvqGTn57r+x1oMgzZldK2qRt0ARLK/sBbQJDZzDkd0rOgXURBYUR5w=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1502:b0:de5:3003:4b7d with SMTP id
 3f1490d57ef6-dee4f0e7b62mr294526276.0.1715299918958; Thu, 09 May 2024
 17:11:58 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:18 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-62-edliaw@google.com>
Subject: [PATCH v4 61/66] selftests/tmpfs: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_171202_524805_2B0AA1BB 
X-CRM114-Status: UNSURE (   8.29  )
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

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/tmpfs/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/tmpfs/Makefile b/tools/testing/selftests/tmpfs/Makefile
index aa11ccc92e5b..3be931e1193f 100644
--- a/tools/testing/selftests/tmpfs/Makefile
+++ b/tools/testing/selftests/tmpfs/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -Wall -O2
-CFLAGS += -D_GNU_SOURCE
 
 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += bug-link-o-tmpfile
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
