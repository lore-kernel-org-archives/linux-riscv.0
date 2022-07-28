Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 294DAC04A68
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Jul 2022 21:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H/f8KI27wxVHXWWAENfTvKt1f8etc9doH/EIdyAKEyE=; b=v6tRvVQkNgRwYX
	XSusMz2jOf2vxj8z5Shre4EFT3ePms6AnvD67ivl4BlaUIjW4/GLnG8cAsdQL8k9FRrCXAdQBKqll
	XZGvA4lb5u25smUeR3anxcuv5QZCTssU8g8xEvy33V4ernufLOPOv0Mnnw8i+k2XpDzN4hiV6wbEf
	AuJu5eT93KvGYJk6QLUhAUO86pZ0Sg2aANP3LKduCyL6tnWALvlYIA2Rn9Fn4+gWHKFja6BLTJ44x
	fLd2gBq7VTZUuRyJB05OQnBL73uTyMj3d7Vqnr7Vtg2iKgO2xKcKhh5XaO+Dtk8h+oi0y1tnl12qH
	4V6IGykYTKpcwLU+whMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHAjR-00EaVI-FZ; Thu, 28 Jul 2022 21:07:45 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHAjO-00EaUJ-Ra
	for linux-riscv@lists.infradead.org; Thu, 28 Jul 2022 21:07:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id 17so3005211pfy.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Jul 2022 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc;
        bh=20zO2FT2JEdVmGgde/EIUF8PTTirUHSwEDYNPZ44Pgg=;
        b=p5F2+1uekipyQTSPfAX9HTNnh+s8rs4JzMcbfmP2rciMhLOLs/BJ1lT1wlNCW75IaJ
         TeGKO8/VEM62witITuWamrO7mM80bTZFgorffYUiNIT63txY3XDLKmKOGb4ODk8UxcIB
         SAoyzVUd3k8qRJNDBkq+fqiZkEtHAYtOyeRY0uGQAQZLyiu1nv4K1m89/k9M2o/jo2xQ
         UZcoLSRsTl082ii08jfcUVbn8LlcgSLA12uEkLPClKzvZP9R+grPWetSS3FndjOUut3s
         Cbz+RZAsKPZJuTL2dB1V3AOsaKBUOyVqUSlcJXeYHikSzjXltwt9b9gwoiczKJ/zjfwC
         RkzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc;
        bh=20zO2FT2JEdVmGgde/EIUF8PTTirUHSwEDYNPZ44Pgg=;
        b=Jk/ecka/UouXCJjFJIBxYV6Duqurq5w/5QbJjriBJ1r/DkpLmsVaL3FzCyRdzaQfIT
         XSIQUUhRO8ZCNinN++TjwpoXCKw56xPdiXHYKUnKbXyRsWEbCtS6wTW4aBVYzooRdPlX
         PYNOgX8afIA8ddiie+mhSi6BEKJRLIqRC58GpB3CinK8V2gmS7fhhQmpXlAR8BbZsGej
         vEtlXRJBMOJaoOBVJX6LXzjqeac2HPjOEPrGZY06TQdXQD58LSDurrNgrmQ2ajHV5ziu
         LgsU7tGEcyme+XLNoIdPpxoCvAg8EN1GZ46oQ5Z1IDtDq9qd2fNW9WhAYziTtNd9jUH2
         WorQ==
X-Gm-Message-State: AJIora+DGSn9rrKay2tPNQVfTN3aRf9iAjR7H2GtPbZ/3dZS4ILWWRTI
	5ws3ZwN0GNLzHwj3+4efDK9E6sGK0mjubw==
X-Google-Smtp-Source: AGRyM1v2M7Q1YpIsy9H18azfAtgYtbvNwBK7Xc1E6c9U2gGjQ5VCipBScMYENZ2vwWNXuW8n8/ceiA==
X-Received: by 2002:a65:5a05:0:b0:41a:ea25:a631 with SMTP id y5-20020a655a05000000b0041aea25a631mr495385pgs.46.1659042460013;
        Thu, 28 Jul 2022 14:07:40 -0700 (PDT)
Received: from localhost ([50.221.140.186])
        by smtp.gmail.com with ESMTPSA id n3-20020a1709026a8300b0016b81679c31sm1704066plk.213.2022.07.28.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:07:38 -0700 (PDT)
Subject: [PATCH] doc: RISC-V: Document that misaligned accesses are supported
Date: Thu, 28 Jul 2022 14:07:15 -0700
Message-Id: <20220728210715.17214-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, bagasdotme@gmail.com, linux-doc@vger.kernel.org,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux@rivosinc.com,
  Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: corbet@lwn.net
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_140743_152530_26C38801 
X-CRM114-Status: GOOD (  13.86  )
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

From: Palmer Dabbelt <palmer@rivosinc.com>

The RISC-V ISA manual used to mandate that misaligned accesses were
supported in user mode, but that requirement was removed in 2018 via
riscv-isa-manual commit 61cadb9 ("Provide new description of misaligned
load/store behavior compatible with privileged architecture.").  Since
the Linux uABI was already frozen at that point it's just been demoted
to part of the uABI, but that was never written down.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

We currently rely on either hardware or M-mode to support misaligned
accesses.  It's probably worth supporting the PR_SET_UNALIGN so
userspace can opt out of the emulation routines, but we can't break the
uABI so we're stuck with defaulting to them on for now.  Doing so would
also require some way of informing M-mode that unsupported accesses
shouldn't be emulated.
---
 Documentation/riscv/index.rst | 1 +
 Documentation/riscv/uabi.rst  | 6 ++++++
 2 files changed, 7 insertions(+)
 create mode 100644 Documentation/riscv/uabi.rst

diff --git a/Documentation/riscv/index.rst b/Documentation/riscv/index.rst
index e23b876ad6eb..2e5b18fbb145 100644
--- a/Documentation/riscv/index.rst
+++ b/Documentation/riscv/index.rst
@@ -8,6 +8,7 @@ RISC-V architecture
     boot-image-header
     vm-layout
     patch-acceptance
+    uabi
 
     features
 
diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
new file mode 100644
index 000000000000..21a82cfb6c4d
--- /dev/null
+++ b/Documentation/riscv/uabi.rst
@@ -0,0 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+RISC-V Linux User ABI
+=====================
+
+Misaligned accesses are supported in userspace, but they may perform poorly.
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
