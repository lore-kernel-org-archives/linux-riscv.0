Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F81C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Oct 2022 04:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceRzWJhELlMrKbY5Ez0rvXRL7eWo6j9tg2R59p3VK2U=; b=09tSOTTmhfEM/x
	kbqR+lJMaDdAUS4vaNuMb+9JmsY57agNM3/H93bl8hNirLvc81yIbp9cTIAGvWdZTo3Ydg2IGdHgp
	IbFx+jXvzy0pAgt8OjJf/6ULHUG1JV4w6ie1+Lw1+idYz3sAmc3bBkx9jBfQ3ChvDPHuRIYeoxryK
	YpKOz3IMdKyEo/REhz8sSWUUSF1LLI9WVrtG1oWP7o/AmaTTZ5/bh9H4P7F6zpKjBBwr/Z2JGwRYm
	ZB1HVtXzUgJgTFFvYHRLAvXYdXrJaWJh3KMKPpk9HALqsUNPNCED2i0Fo3wfbzr1/FEkPrzjbCXA7
	gvIt6nkJCa+HePEwj8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGp-00AdC8-FR; Thu, 13 Oct 2022 04:56:35 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiqGe-00Ad6M-Qw
	for linux-riscv@lists.infradead.org; Thu, 13 Oct 2022 04:56:26 +0000
Received: by mail-pl1-x629.google.com with SMTP id c24so799278pls.9
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 21:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28zn6cgsHU6YtpOZu1YU2asuZjVGXsycTYTjxJ6pRUA=;
        b=O9XnoY1yPcJ8rbfuH000Q/NubRyjXPpGjHuUIzAcrc8zp4D2KRmC3Nu1hzSAtq3CeI
         ZyJ4LGZfAAVpvplG9HJ1twTStgWTomI7FGgrCkrPhjmcebLJST1t2hlaiHc/GWiEUkAw
         Ai+m5mIl0mWJ2EtkP3PRaUICKIAxUcpzfH6LGT+X0VIUocgbxq68qp3ykYt9NsnLB9x0
         56zVgFqh5p1hKK6CIaJJaatil2A3o2l6RIDcHrn2FQ+tk7LhUn4LRkwUqAN5dm39F4Wg
         F5Xi4+lVzqePnpDkvCuDTR8xNwymr93dXZtOfW4Q/YLKphDHtJSeDdWnecG6kqzXgdtY
         62ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28zn6cgsHU6YtpOZu1YU2asuZjVGXsycTYTjxJ6pRUA=;
        b=nHUE53tfwDJCFlXvUv0nmiZWqTl0zq/JvEThzQpOCZcxtjF4E7nsAdR0+7elL4Gt2+
         VTfaGmSosnlXKRwEBVzHiLukhHBCYm2BZU9Avb/3RqpcBjkJb/lwADEIQCq1ryb5bf1Y
         mijXrTrdGq9KI3JuKWDWUu8F010om6D2wNse84EWCjrS2lrGltt5tOVLy6auEtFexa3D
         KhYL1R38VSJ7FOrRqDU9pqVi1JCig3tpd5tel26llnnTPLKcmBlmoBTInvrpbQt4TiLJ
         99E3gmn44hJsRMxK8u8Cg2EJY+6qhsYjru0MpHZKUnH6a2H5UD8yxMBtIBDCi9/RvtJT
         n8Vw==
X-Gm-Message-State: ACrzQf2BrkR+UlUosMm61MBnya0yOcrpMC2I9eIFO/6zox/8/xplQtgf
	RNZowYZWNm1BXEz+xncXaXWO3w==
X-Google-Smtp-Source: AMsMyM4ugjiBwSXQxda1eNvwHmBz2fBmeCwoTH5OfbxNJoRGhqGRqBSY9uGTlgP9MR/U/J7DH821hA==
X-Received: by 2002:a17:90a:5ac2:b0:205:de77:72be with SMTP id n60-20020a17090a5ac200b00205de7772bemr9337413pji.24.1665636983966;
        Wed, 12 Oct 2022 21:56:23 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id b17-20020a170902d41100b0017bb38e4591sm11385104ple.41.2022.10.12.21.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 21:56:23 -0700 (PDT)
Subject: [PATCH 3/4] Documentation: RISC-V: Mention the UEFI Standards
Date: Wed, 12 Oct 2022 21:56:18 -0700
Message-Id: <20221013045619.18906-4-palmer@rivosinc.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221013045619.18906-1-palmer@rivosinc.com>
References: <20221013045619.18906-1-palmer@rivosinc.com>
MIME-Version: 1.0
Cc: corbet@lwn.net, Paul Walmsley <paul.walmsley@sifive.com>,
  Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu, conor.dooley@microchip.com,
  Atish Patra <atishp@rivosinc.com>, linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org, linux@rivosinc.com, Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Atish Patra <atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_215624_893495_B7F0E2EB 
X-CRM114-Status: GOOD (  10.60  )
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

The current patch acceptance policy requires that specifications are
approved by the RISC-V foundation, but we rely on external
specifications as well.  This explicitly calls out the UEFI
specifications that we're starting to depend on.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/riscv/patch-acceptance.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/riscv/patch-acceptance.rst b/Documentation/riscv/patch-acceptance.rst
index 0a6199233ede..9fed6b318b49 100644
--- a/Documentation/riscv/patch-acceptance.rst
+++ b/Documentation/riscv/patch-acceptance.rst
@@ -20,9 +20,11 @@ Submit Checklist Addendum
 -------------------------
 We'll only accept patches for new modules or extensions if the
 specifications for those modules or extensions are listed as being
-"Frozen" or "Ratified" by the RISC-V Foundation.  (Developers may, of
-course, maintain their own Linux kernel trees that contain code for
-any draft extensions that they wish.)
+unlikely to be incompatibly changed in the future.  For
+specifications from the RISC-V foundation this means "Frozen" or
+"Ratified", for the UEFI forum specifications this means a published
+ECR.  (Developers may, of course, maintain their own Linux kernel trees
+that contain code for any draft extensions that they wish.)
 
 Additionally, the RISC-V specification allows implementors to create
 their own custom extensions.  These custom extensions aren't required
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
