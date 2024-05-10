Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E6DC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=GCGGQ82rEhcXotvfYhHtbiIk6lS3cLocX9niTKixxfE=; b=s65d0dxw5B7zBoi6vIpis8MgKR
	dbmCYZfgafNjNUg27nty9JTsdzqviHx03cKw/V/7TrcjIJVTBzwbLSWLQDO+RgGnYu1nMzuOG8YqW
	iF2GPhwczIdeaPOU7UTeCgoJgIxK6IgFDNDCfoqumOG6bCw49wSEJSaLApI1afzrLRC+xlaeXrN6y
	09C7lvEneEhU60GbdOtsHP4tbUoIF/tC/FKw0l8Hb77N+7wfY1f9x9ouMXtEBJ4PvT8gY+6PagWNM
	e7O1wEIpXu8gFxNqBRTzsrMhD7DQIcXJDJ2wNA5PPWdgpIb7oaOlHQmGyM6LMh1HIEJKZglH8ikF5
	Sl6o/H7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dsp-00000003PIT-38nl;
	Fri, 10 May 2024 00:13:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dri-00000003OY2-2DQQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8aFdfEWt/7k/b5Ocj8/yszbVTyEkIpeJxepTUQyb5mg=; b=WPKh8M/dNA+UUwDGtGKN0Vjy4R
	gztFT0/hZrEQx9X2vCFt7FF+gh34KkBMag6/8CmJhopCM4vk36KOSZQpbVCTD42IRpU5Gui4r9HOb
	ujQT6AldMU+ooJquWJJkT5f8F9B2M+P3C5Ub5Uk17nvzBaUk1F7YssplobHNBe6Qx0MhCvXUtbGNt
	fY6xgy8T87suZWb7BOa8YCgjaoQS/NIgUxgGmBK6/37fVKBZbCSx/abRLKsy/7dfpS9E1k2CGWglr
	rR79YpT6MKOD+4BPvQt9gFGeKcecjzvzle853MQj/a6kJWhdA3Gk8YCo5fUWTfmgp7zN9H1OMx0Bb
	wsZoiE7Q==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrX-000000036NL-1KfJ
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:56 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f441afba80so1583174b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299903; x=1715904703; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8aFdfEWt/7k/b5Ocj8/yszbVTyEkIpeJxepTUQyb5mg=;
        b=XfoS1jBsPhDV5Z27ScRw+QW8YZuzKPYXFnWnuypy7kBhVAdIxCMvBGx76mMch3Kmcw
         6bBIZli185OxlrXeuPJhVh4Twdh61k1GKLpaFMvgyL/Qj8ZqTQBCHyHwaIdaFCy7im7M
         4XuCHPEkEoaRvGEYknjDKM05KgfDCV8eAGAddXi12ChmZx8jwUsGeAi6NqZ9r/jbdYGI
         qzt4+XXS2K1vD9pmyjh3bo1DQv1HMU3awzeXjrTZTkFXmmiE7YcIYucMloJLlWaHgsXw
         T2f2yb2DjofewIL5YyjmZG+2b78lFPVqo4C69oDgqjyq1wgMbYaKeP+X4yKX/0JWMOGf
         AgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299903; x=1715904703;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8aFdfEWt/7k/b5Ocj8/yszbVTyEkIpeJxepTUQyb5mg=;
        b=EjtQ6Jjenh4457W6XKuFDP1YkvTHAxgLHwdtLFw/b5I2Iu5F3Saz8kwJCkx0s1MIkc
         2tSHehYBUdBIoKegCsCeNKW1HgyRqWrzr2w2utcXeiodcRmLrk+EYKwpaOU4CuAkQWpv
         P6sQem7cMUXsLaibhJA6DMAzVkeYsJ6Or53dW9CcOxrExqRRVqd74MPm94gjHjKhiTuO
         qqMZjY0VFhabxYPRbAzeqAnGGU2MYkXEttJM1mAr0PYv60Yoqyyf6IGms7fk0PQCL17K
         RhwZ2G+fP9uCawPFngg9Nzumd2SbpXNqd9oURlaL4SwfIvTIjgt47C/bqrD0N5Ke2TLV
         3/2w==
X-Forwarded-Encrypted: i=1; AJvYcCW/Gyq5vGLQzfpJ/I1HMBUuGbD0xNMw2LTQIrLkJw7dX5gkc1bwg0+veghvvgET2l+6k+tOVfw1GfLimQUmKcpzv23v+IuvIfHdXTS8jiRu
X-Gm-Message-State: AOJu0Yw8jGndz2w3+lQdSpCOBv/xLEmuq8qyrUBfINjLQurD3HdKHlIf
	wQJBTy8+OIp+EMgo18w9NHYD1SQTkmcEXQ98zQG4gLMtaKPIkFm/lNrrYpKuZRrMwlkECsg33+z
	JUg==
X-Google-Smtp-Source: AGHT+IGbpUeforMn4xLMD5N1hyX2TrG0gSGZyFXuPe0hRHFj81tMrWmYRZqjYHTnolVlOz0QL5y0YD27qvs=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3a0f:b0:6ed:416d:f7e with SMTP id
 d2e1a72fcca58-6f4e037d8cfmr68300b3a.3.1715299903347; Thu, 09 May 2024
 17:11:43 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:12 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-56-edliaw@google.com>
Subject: [PATCH v4 55/66] selftests/seccomp: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011152_560883_5A4FD3F9 
X-CRM114-Status: GOOD (  10.37  )
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
 tools/testing/selftests/seccomp/seccomp_benchmark.c | 1 -
 tools/testing/selftests/seccomp/seccomp_bpf.c       | 2 --
 2 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_benchmark.c b/tools/testing/selftests/seccomp/seccomp_benchmark.c
index b83099160fbc..3632a4890da9 100644
--- a/tools/testing/selftests/seccomp/seccomp_benchmark.c
+++ b/tools/testing/selftests/seccomp/seccomp_benchmark.c
@@ -2,7 +2,6 @@
  * Strictly speaking, this is not a test. But it can report during test
  * runs so relative performace can be measured.
  */
-#define _GNU_SOURCE
 #include <assert.h>
 #include <err.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 783ebce8c4de..972ccc12553e 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -4,8 +4,6 @@
  *
  * Test code for seccomp bpf.
  */
-
-#define _GNU_SOURCE
 #include <sys/types.h>
 
 /*
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
