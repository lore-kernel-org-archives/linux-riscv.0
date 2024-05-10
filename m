Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC5D6C25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/Mndl+WwjKui+oqn+uF0lB6SptksgxneandZll/cdjA=; b=MJeaQIfH0ohgF6d301i9h0tuIu
	lu/E/RLAZHmAGfyWeQFc2lnZG+vYnlXec+Sd51rAEtlLb0XQ3/pAivB3AImOr8PtDsGhOyv/vY1Hm
	+VeiBEi7YAyK6EJkNu45j8cVNmlnNWRgLPtyVrMPpI2NLjHTfnbuRJW47IV2FhpFbRt0yU7a7nqmt
	8bh3jZczi9dLx/pJ2uf3c6Ztfg6T6SmgIMB81m22LMTIVmtTw6arMgb2Io1aZHynMr3YvXPsf1JwG
	U+8X2tZ4ypF0LZkjV6hD41PZ0i2oay4QKs5zm1unfzrllJg0jriIXiCLEo9hH/O9XSHcX2J4Oj7hQ
	QLOyG75A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Et2-00000003atQ-1KLY;
	Fri, 10 May 2024 01:17:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqp-00000003Noe-3ilk
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kMcDSSxWXBrY3fYB5DMyoDoFJQzub0IzoWq/+JBZ+ak=; b=eE3F7PsXAudvWope6CeRu+1rB1
	a4W+4MnD2xU7KQ2wcLX6nXMyRfaOaGqxMD9pWun9C1KCdmUe+gHuIZGvsbM3KQPg3JsrtcH+MsYzL
	w8Ae0CecqRFiJhORaXgzIoLScVO48GSA54EPkRTngua33Li79k9r6Wgm+iuZDfkodoq2wRyfib4pB
	IdV8u/6044cKgQ/Zy9xI6n/zJII4cmmVk92IM/eEJdmvsTUE6iD9oFae33q6WOZ0e3+Vv1kxgtqCy
	9xs6t4PeO9ZZUPk9SIK8ptWIn9FzT7PyF6ob32CaA5KF2M1dtuUNnVQrvNhzNO4Rcb7RusrnE8UgP
	VwF5zP5g==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dql-000000036Dt-3YaH
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:01 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-61c943c18a8so1381591a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299858; x=1715904658; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kMcDSSxWXBrY3fYB5DMyoDoFJQzub0IzoWq/+JBZ+ak=;
        b=ZO9KEn/Js8TPk9ZCA+Pvo0pMPuRLK1flLjwNrDnrz39oMA8G0af1DE0N7/AvjpQDpd
         OUa3v96uwr9m0gu6PUQOAeCMbkVZrZb0sf4NgtoxTQpHjuYGi7eY3mrL+llvh02O5ivY
         AAQPHULUidsWM3n+znstIVr0C27KW5ANoUkwQFxDVbqM9gQja0BHDXbi6rnJIvR1HKYO
         OwYoyRoCrseI2AjbnId4r6W4x8+nyFmJouIegoCfNjWqOUHHPq6g7zhzql9cPfTYHzy8
         jJgLtMI8EENO2mQEuCdh5oqmvFNI9G4PJVDCPATQWJjRVL1paLpnRko5AqpL77PdSV5T
         tSyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299858; x=1715904658;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kMcDSSxWXBrY3fYB5DMyoDoFJQzub0IzoWq/+JBZ+ak=;
        b=mabaw1u7opRAybqHPh08gwcVOctu5t0lNsrMR9jpa1NvRzrN7iFp1+v/Bf5F8P1n49
         7E7zm1l1ELJDWZpPzTsC6JsZNrkCeY4LbWZzb4JUZvXuB31lx3ClY4kPi1jbn4gU2D9z
         xdfyacNtBcHbaOevD/9lws7MEC8wcNBdbUxComR80E5o33ZPhNn1pLpBgSmQAfXwOBDS
         ZqPkvcm6xYhLLmq+k7R93Z5b3BAd6MjRfA61py0im7rgNf0IX/Y6NVVFeZdSdtcsVp/A
         4B+u7VSyTSIlf/oNZ1UX4YUJISZkPC3ZfYR+JBIzO2v5U+xWH0nSD79N+gff9q2DVAnX
         W5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVILmf2M8KTzOV/OKjGkAW1h9mlnxt/EunNdpUVcoxBQIzHpVzfMXx/lb5YjSOiBad6ETLBxG9ZgEJCnxsMKxoUC+nnCuddc/0w5qUsWF22
X-Gm-Message-State: AOJu0Yx+eFUX3WFVB0YJIHdlLKwvQOnqoLgRNjRYG62KTfMigLVesVcy
	JWSea425lmZ3pwFebVTZLUpUJKqr/WQVhj8kGoEkJr8HdQFdIN9SoZaYH1DW9vp8A0yUiNbta+M
	i5Q==
X-Google-Smtp-Source: AGHT+IFTfIR9ZNxLhki0C2wWWB4797X2daDkkkc7DqzRvRAIH+7XYQIOmm1yx/VgJ+AcV1OpnXiFGoc/jNE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:5185:0:b0:5dc:877c:cef6 with SMTP id
 41be03b00d2f7-6373c976894mr2360a12.2.1715299857838; Thu, 09 May 2024 17:10:57
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:56 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-40-edliaw@google.com>
Subject: [PATCH v4 39/66] selftests/openat2: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011100_111828_67C69AF8 
X-CRM114-Status: UNSURE (   9.00  )
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
 tools/testing/selftests/openat2/helpers.c            | 2 --
 tools/testing/selftests/openat2/helpers.h            | 1 -
 tools/testing/selftests/openat2/openat2_test.c       | 2 --
 tools/testing/selftests/openat2/rename_attack_test.c | 2 --
 tools/testing/selftests/openat2/resolve_test.c       | 2 --
 5 files changed, 9 deletions(-)

diff --git a/tools/testing/selftests/openat2/helpers.c b/tools/testing/selftests/openat2/helpers.c
index 5074681ffdc9..3658722c889c 100644
--- a/tools/testing/selftests/openat2/helpers.c
+++ b/tools/testing/selftests/openat2/helpers.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/openat2/helpers.h b/tools/testing/selftests/openat2/helpers.h
index 7056340b9339..ecd20a3d47ee 100644
--- a/tools/testing/selftests/openat2/helpers.h
+++ b/tools/testing/selftests/openat2/helpers.h
@@ -7,7 +7,6 @@
 #ifndef __RESOLVEAT_H__
 #define __RESOLVEAT_H__
 
-#define _GNU_SOURCE
 #include <stdint.h>
 #include <stdbool.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index 9024754530b2..51f1a7d16cc9 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sched.h>
 #include <sys/stat.h>
diff --git a/tools/testing/selftests/openat2/rename_attack_test.c b/tools/testing/selftests/openat2/rename_attack_test.c
index 0a770728b436..477125eb64e2 100644
--- a/tools/testing/selftests/openat2/rename_attack_test.c
+++ b/tools/testing/selftests/openat2/rename_attack_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
index bbafad440893..48fa772de13e 100644
--- a/tools/testing/selftests/openat2/resolve_test.c
+++ b/tools/testing/selftests/openat2/resolve_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sched.h>
 #include <sys/stat.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
