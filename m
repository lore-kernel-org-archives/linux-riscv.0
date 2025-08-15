Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2961CA0EE4
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 20:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G4jOCJvZCCSfTgAxuJ5rhmGDEdU898cM/klYL5572og=; b=j2QR33C3BkBtI8
	BFOYGoZV3SU5n4/xddxDWU14FgYO0H+LcfebP79xqeDAzZIybpRItmLYKfEIbevoOREjgd1bLNPjF
	B3Sa+zK8TFDI5UNXip2BUMbMDeTYuyl7F3dTvzSnMAcF6IXwSlWDQrA68wkhhVGfH1S3RoOZLNASG
	gUvuvYe+Hh6UgxMabDwFQVT+aSJ0aLn0qQyudB2PNz6707QaEPaR5R/4rD7e5eY4toJ1LP5ARxuYA
	JkryJux7sYs06UR9UW7GIDEDMhHN3cARF27OtwY9AYPqvQbCCjW54peiqdzkYs6FCrXuQMnG6WrFJ
	75gSbKU9gwqmTm35G9jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1un0t9-00000003Q65-3F9V;
	Fri, 15 Aug 2025 20:18:59 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umyq2-00000003Csk-1QE2
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 18:07:39 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-244581d87bdso14516555ad.2
        for <linux-riscv@lists.infradead.org>; Fri, 15 Aug 2025 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755281256; x=1755886056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Txv0eigY94VABCpNSrT19lsKnOf+NvBhMBzz1EifcA4=;
        b=KXgEYH4lOgVfz00/DC/oQwd6FtXnF/2WX51MivfkkEDXrY5fwgHLMCSQULdZBkBnmd
         5wRKXqZIP1iDpbyedit0QF9tB1RKduTsNZmt80bfXYEwb1cHFPEeHjKlR3RfFC8h0uLv
         x2m6igVp6fEyD/qW3opfkgTAeXC0k9zmR8VMlK373PZ2YGgZEhNI+oZfPXZ8UftJBghr
         VIP9xAqalJwNlvJo3/YxQ39i3JvxGc00ojZzb2RWLP9xnojLFzeghAnlUNA1AvKV5Bga
         tgnRUlorheATv+h/kZ94iDUEOk+o3n0fyaGvqWrRxxbZtEIqtyrIEoiybDloUuV2Z5ua
         Wo5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755281256; x=1755886056;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Txv0eigY94VABCpNSrT19lsKnOf+NvBhMBzz1EifcA4=;
        b=k2LVH5OiL+9OVXGLc1aMyhpAtI0bLMsVJrX42TJkKtwksFJpF8cSQHC+U0/niTqQL9
         BoAHsFCqCtAD8FxpFMeurkIwf6iNqfYDXYcHPhzf8VWLH3PFZ7QKXA+7Yc6T8F7dSGBF
         w6Bg48cRMBJgvwGX+ljEEm3bTmDmiI28hM5L//buhrmr3pANblPaqI07pQ9LngR4MqRr
         JzB0HRmoIxzs45rvYxt1HmN6TXyfSs9O/LJKW2H4PmFKjWZ4vOTWNWa+0zTzaPGrU/at
         zdejf+exViC3qx+ECGbT8bPd2R4HPewYDl2NKDnR1utyjC3gl+vHLXhSOZh/3+iqBgAm
         /XPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJ8X1NPHDTZ0zbQYbO1EabWf4nTvLFb8RpInH0JwPelDEg7YBLkKHzhbZOT4FWVVDbiF570/qbyAK5/g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6cZI/rMWPWFC/n7/0G/b82RsANr4OHu04Uf5GnfcK3W0Eru/R
	LNYmQ7dXngb3J3VM0XB8h2Avb73dyq+P+ap+rwAYaFmUWUFF9BGX5evF
X-Gm-Gg: ASbGncu1ziXrAOXSfLRV70K1ooIpTfU9atEw2Kjr5s+ABlvYcQm5PCMAALfkE1PqE8Z
	ODDnsJqxaYDFqfQk0qtI2HugzLucwl4zK/EPjUDxe1yQlKdwEHdE2YbGqp1WvX5reSwKy+3GiXZ
	nZr6q3QO3wVQ9uYI3N5eB7j6cZ6yrGZG4a/RP6KcMXJqzKWf8is7j3NyZtGyglKluIerKsM1NlL
	qLkHpCzANplZYppu9wg1HLAtRBeLqPy4qIpz/I1W/TIJWDjhmSwykEp0dNUpnzBWHlU7axVf6/o
	koKQfrZAjrxfnf6xrWHbQMegwnZYNcv54a5IURMNShJLSUGToPCX3bbPVsh60mXYg+pHR0q2Agx
	IYAKeOCYMCsPTTlM6ysWByZe9Pk38j5HQ
X-Google-Smtp-Source: AGHT+IHZQFs59X0pM7cQtgM5LxBWUBMt1KUqzQhiajgIm0frQf8o8tCXB8aEphaQJZsF5rVclsZJRw==
X-Received: by 2002:a17:902:da82:b0:242:e0f1:f4bf with SMTP id d9443c01a7336-24478f5143bmr940865ad.18.1755281256546;
        Fri, 15 Aug 2025 11:07:36 -0700 (PDT)
Received: from server.. ([103.251.57.144])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446cb0d717sm18921065ad.67.2025.08.15.11.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 11:07:35 -0700 (PDT)
From: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
To: shuah@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Subject: [PATCH] selftests: riscv: Add README for RISC-V KSelfTest
Date: Fri, 15 Aug 2025 23:37:24 +0530
Message-ID: <20250815180724.14459-1-reddybalavignesh9979@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250815_110738_375524_5D25034D 
X-CRM114-Status: GOOD (  11.23  )
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

Add a README file for RISC-V specific kernel selftests under
tools/testing/selftests/riscv/. This mirrors the existing README
for arm64, providing clear guidance on how the tests are architecture
specific and skipped on non-riscv systems. It also includes
standard make commands for building, running and installing the
tests, along with a reference to general kselftest documentation.

Signed-off-by: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
---
 tools/testing/selftests/riscv/README | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 tools/testing/selftests/riscv/README

diff --git a/tools/testing/selftests/riscv/README b/tools/testing/selftests/riscv/README
new file mode 100644
index 000000000000..443da395da68
--- /dev/null
+++ b/tools/testing/selftests/riscv/README
@@ -0,0 +1,24 @@
+KSelfTest RISC-V
+================
+
+- These tests are riscv specific and so not built or run but just skipped
+  completely when env-variable ARCH is found to be different than 'riscv'.
+
+- Holding true the above, RISC-V KSFT tests can be run within the
+  KSelfTest framework using standard Linux top-level-makefile targets:
+
+      $ make TARGETS=riscv kselftest-clean
+      $ make TARGETS=riscv kselftest
+
+      or
+
+      $ make -C tools/testing/selftests TARGETS=riscv \
+		INSTALL_PATH=<your-installation-path> install
+
+      or, alternatively, only specific riscv/ subtargets can be picked:
+
+      $ make -C tools/testing/selftests TARGETS=riscv RISCV_SUBTARGETS="mm vector" \
+		INSTALL_PATH=<your-installation-path> install
+
+   Further details on building and running KSFT can be found in:
+     Documentation/dev-tools/kselftest.rst
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
