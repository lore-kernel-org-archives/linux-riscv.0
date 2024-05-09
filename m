Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B9A5C25B77
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zXZK6dmdtXStx8AQL1rk8JXctA3heQw45U//UENtTqk=; b=iTYfqA0eigteZ9zvNa6jFAECZo
	qeaELyDIA3jFaMOUS/MrJQhhb8+jnUCLRD9IqHv0aYqIsBCITxiPKddWR8YiFKX1JPCgFYwtla09f
	YagWm6e0f7NiN6eQDlsnuL/hG11KppeWj8hNG846PYQE1srGEEGzivajQcNCTsjTdyYzpWBmlVosa
	yCnN9COSnMKAFNmUxuRDG7irhXqbbrwjNSIqisMHIASqnTYtl+a8oom5nc/d5udiLhxf5FZvSUv0B
	wZSL/pHrzemdAW54HyKWw6h7PA76LPBj7tupzfqvJbEaL//ROdvOPJ0F+gYuvfcVZ/13Mm8qsXtPI
	Ifev0cVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B89-00000002uB1-3UHk;
	Thu, 09 May 2024 21:16:45 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xn-00000002bU0-11jJ
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:05 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61bea0ca5e2so20560097b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284915; x=1715889715; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWPJomGop1o1vSO/WNR00I+KyAYhO7ZfPBKMyVYJ3k=;
        b=hTNyi3YboLisiKM5AnEA2fF7yBP3tQvJshSzZJOjy7JsWGfHPL7IeXeOpWinJhzkOj
         B0nLJ/NdDcQ7FuEucl1BkVcwMc7FR7a/UmqA9+4pM1Nm40keb3/FwXtJNaC3Us6+NR7L
         lb08oqrzRwapmqOlKjTSPQlZUBkkd5Xv0+ibyWiog3loCpXl0/C06BnFY/geqchIgtnA
         CZ5UFbI0/6kc1REV1FfZKArtGWrHjmMxQXhSeo6PwrprbyIigtR/uxZvcdHeCBisvNBB
         FKP47LdwXMCCm2Xb0ucc4J2a4g0eYedVrd26p1paZTATe3Lid1ETMRYgcTRfEOcgt6ao
         xlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284915; x=1715889715;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hWPJomGop1o1vSO/WNR00I+KyAYhO7ZfPBKMyVYJ3k=;
        b=D8v7m12qDzL9LxZOD56ERJiHM/fCSOea2QXkZcjFxJ+wKneZEVHUTLUP8D4xFwsEe+
         ezg92BgcH2oN1B/fkGwBLr3mh20whvE9HfzGPhmoTiDThc3a9Xu+1Yc9h8okFvgPoRyt
         i3A0vAu91Poel0TWWjLDDoyY1hO86eHGOiFnW6bs93QHgQ+Tuvt0kLTLj8gZJYZLwB7P
         71iAr+0ClCxpVdpcsOQax5bpxuj0u1Dni0uyVC+2kmGEJ+xipa3PUMJ56mfYgcBXvnoW
         iWQmO/EXf3RqOD3FrXX2Gsxbhyt/B2l0utEN8nkUmxqcVz7xznePQ9pIOA7fq3KwYWqq
         +Vig==
X-Forwarded-Encrypted: i=1; AJvYcCU1J96WxkaAkSMZ7KrJBkfhKbGNbgkgpCv1MqPJSdCQRniFokuM6CdSnsTzTLwiwPo7uA+0m4loP1WajVmJ7H6qWq3z/addZT218+qfyCuW
X-Gm-Message-State: AOJu0YwlpOiFnGgsB9gSrQlIwZMf9rcsQids2Dxq85v3+WSMmuGkAjSa
	Dqz5y+ERTmdiKL3b+STcmhomdbFJiREpdU2klCQOLQir7DMtapVxtO78vBpNG2Mc50zjNDZG/0G
	kVw==
X-Google-Smtp-Source: AGHT+IHpbKZq4QkjTflQ8ArARtMBvh0PZ9C9VKKW9QcnoVDxM8W2W8fLFQ/oTQAQRdxFasvDcO10UKeRsB8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:490d:b0:611:2c40:e8d0 with SMTP id
 00721157ae682-622affa3fadmr1378917b3.3.1715284914803; Thu, 09 May 2024
 13:01:54 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:16 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-25-edliaw@google.com>
Subject: [PATCH v3 24/68] selftests/iommu: Drop duplicate -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Jason Gunthorpe <jgg@ziepe.ca>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, iommu@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130159_498744_484BB707 
X-CRM114-Status: UNSURE (   7.90  )
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
 tools/testing/selftests/iommu/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/iommu/Makefile b/tools/testing/selftests/iommu/Makefile
index 32c5fdfd0eef..fd6477911f24 100644
--- a/tools/testing/selftests/iommu/Makefile
+++ b/tools/testing/selftests/iommu/Makefile
@@ -2,8 +2,6 @@
 CFLAGS += -Wall -O2 -Wno-unused-function
 CFLAGS += $(KHDR_INCLUDES)
 
-CFLAGS += -D_GNU_SOURCE
-
 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += iommufd
 TEST_GEN_PROGS += iommufd_fail_nth
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
