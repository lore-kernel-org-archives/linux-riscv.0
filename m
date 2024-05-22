Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D0E1C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=aSYPODUilzrovPha8R2JlYOA4bJjtFHKewajixyQ++M=; b=xDuoEZuzkywCRncMIFAA7UYxSB
	NMlrT3gPhsH1LvxTnqe7C5T5/yHDmwrRUmHCoXUrAlsw8DeS4bNVgVV4wuza5xRTfEzTnXoklLDGY
	mtPmabGdijkYglyzfA5io8SAyc4Skj7oOznUnX59STvCL6tPPVJUd/UMCPPYp3xWDF42LH3XHx4Sb
	UUAO+yFHvXsGuo/JBhYl/TOG4n1Y0ordh21M1BV8Zy1S1gJ78rf7Sa5aA45ELhm8FSsYjguB8MBr3
	5m+HJ33j9koCsUGfH9KzeZN2twpLuNOaYHoG5mtP9Re1MARFHwsZEi9g3KuXelKTsFASpk8VUA/Fx
	UAFXL3Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWZ-00000001jQc-3NSM;
	Wed, 22 May 2024 02:16:16 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLW-00000001Tik-3iT1
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=rW5R596XV/BhyRO+Ck1A05EK/itIG2yrmFZ6NrHh18s=; b=RqOrGxid92ZZwCUh4Y2OBkIxzk
	O1XKpwngjrvn1i6i84hI+Am6PHrEgbLBm79myihPW7gPNEEcuAbt/EKLj8uBr6w4W7Ih20KFUj+VO
	y43KYZuJbZFqIt0HkvrAGnvJoK2KeXzKr91XjZbT23Qovohiuw20EOuqwLr5PfYCpLqA1/XrD8Bt0
	gwIi7qn6a4r+KECcZxd6JC5xSnQzJzl4xRGDjr6vsl/jvbxnWrHqL5ht+Il3BUUFFotJM47sDZ54A
	Ls4COjWSWNPRczQmMlDVzkrWSBwzGgKRR5Izfi3F/s4/FsEJXnI1Liv8JsFGjz+PrmtlrSdXI47l0
	MY3ObGJg==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLS-00000000Alm-2dNI
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:45 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61beaa137acso225143577b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339635; x=1716944435; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=rW5R596XV/BhyRO+Ck1A05EK/itIG2yrmFZ6NrHh18s=;
        b=YqkGKRJipfNdDwOwo+qgOPga7ccXh5C/FuAK6AarqXUByW8kBrXfvVGURyliNPBSEU
         oBYGFAutS6Z5VZIm8rJLlQe4N4SJXlmy3Zx4FMQ33HTfZ9j9YAgo4zkAhAZJ0+2QjuUS
         7NUrvqdFNnClyudJyCSSSmB0A/eclCR+zKssCGxICKi6/zfRFOnwzEJfDoKZ6wsLVVEV
         qPwl6xlOe8zdy78vrEe5MubAxhEMGVKB0IoDUz4rsnki5OeEc74d3JYHOy+2n6vQuuLi
         /gENWXz27Ny4wjaAVJq2CbXHCk2SpQyr1MBvvT7m2g1WBA1BxVfDw31uSBk0jG61pVAz
         sTpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339635; x=1716944435;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rW5R596XV/BhyRO+Ck1A05EK/itIG2yrmFZ6NrHh18s=;
        b=ov2jgsAtH0AhUwUrav3rUKAuBkpv/o9G3GYx8ODSRdiN6lAx1qcIWs7Hr5lwv4idU8
         jektKVe2qndrfnbAmBDAUcc8k6YRbYryxXFi5HyxaX7sUJL9aUYB3wpBgnjGSSPKnVcg
         Mr1wQVBghlMPLAGL+RjblFqo8c2rO1RarOLMtSc0mylE9WauaDrylO1gfXUJYEKJ0hAi
         x6pi/okAVh74TBc2r1IoGn4hACSoOraryff6OXo6mzL7DZrbvfZ9PJP7nvmtCvFbSzEe
         dBEZ/Y9cgvq500vv+igQ4RrXbIKKyRUZnn6qOBFhh/Rui9fpGnEBAz7zIyTMBsHxIHQP
         WaOw==
X-Forwarded-Encrypted: i=1; AJvYcCVVohaBPenie55e6p9wWOeTlAijcdIhfnrwTNvbNKICZNWm9zLXM6gVHFmNPPbFESJHxTjqFBVMYsAyDN9zPg7ZlG/OBWfOrh0ehvlC8fH9
X-Gm-Message-State: AOJu0Yyf3X/uiw3mMFHbhbdeafGlNpW/IMVPXhEIGitTN5gj5WZNGi+U
	ERoRDdW4Q9XFxTvXdq9+E2t/L6QRd2ouuyrEf74vk/abkC7IusbmstMfpwGo9Q3z6PFhb2ZOqz0
	o3Q==
X-Google-Smtp-Source: AGHT+IGfBUkXH3c2aGY6dfFSwVcPLg4SGb/q7ma1iwiCk9LmStygJFAZaLHBuK+Wl9geeHgSjlAVdx8zQ2g=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:e20c:0:b0:622:c8eb:6ffd with SMTP id
 00721157ae682-627e457c42bmr1733007b3.0.1716339635044; Tue, 21 May 2024
 18:00:35 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:09 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-24-edliaw@google.com>
Subject: [PATCH v5 23/68] selftests/iommu: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020042_945149_51649634 
X-CRM114-Status: UNSURE (   6.42  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
