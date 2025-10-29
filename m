Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCCDCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 11:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b10gVchMREAMNtWqn732J090zOPz9cX+hM0kOIDgqFk=; b=RJMdc4CX8PBcUd
	Mig2pFek0pckNPuAYtW7JO4QGoXtw2EfJ4jfIJwdDCcQyAumGfxId7TZBHhIPkXUGMWcaU1M9Q5xp
	TkltdFm+3N05ti9oOHVWiE14vrxkoNnDq735AHaMN5rRgbZINNBusrnPNQZHnMgDZOl6tJl96Stvy
	rd0CwPda3iyxfAceuQ6TDkmXGGdFTUPJoW1b3QNJqhczldZovyCNUzRQ3MNY5DYb8ubp0zQIeGMKD
	4lFbCf4TfsWy9O1yW5XV/8n+TMBouMKGB9X8NWdBopZH7fSohbS3sqoLGEinW2ODN3XK1SsqKHue+
	S2FhBOphWSpjZoPLmp1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Ky-00000000y5d-1Y6m;
	Wed, 29 Oct 2025 11:27:32 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE4Kw-00000000y3i-11FD
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 11:27:31 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-7a2852819a8so5081121b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 04:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1761737249; x=1762342049; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hiwSqBhR1Qws96GQdbU4nAKreYqDyRXg+IAoSlhXoM=;
        b=CLizORSGT08ngTt+YzyVxvdO0CovPTPxXIcbdkbEfXzU/uvv2v+RcKtm0S8QcrS43L
         umuwU28sHIu87Tl+1XN8AOy+R3WkKrQEAIglesofJF/naxIwCwv3kPSeJZedSrGLlGwn
         cnD4K+9CwC7flmdx+SwQj/eq2vltOLNh7ujeeBnPeZLFgWY39k675huJ9dCIRDgAu/vt
         1YkQMXZ4Puxt1R8jAIxv3ynxd7OB6qyCrAjU7UCsxpDv/vL35qS+zldjpGxg+2M6xsYA
         ddOCw7sEBPoMg4BfPYpN8qT/aG8glE5aw9HKiaslVMBX3dtgxwb/QyndyY8R6he/NdZy
         3q2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761737249; x=1762342049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/hiwSqBhR1Qws96GQdbU4nAKreYqDyRXg+IAoSlhXoM=;
        b=JrJxHc+yF+vG8uwvxhB0ieo6zC2WiR8kfjR81zkdiKad4NZfgKUOedgnFgQFFPSrCy
         KVZam3NnKj4ht1R2MQWXA8Ie8WwuwPAWomfS3Wpc5VnWPw8aRnOlT3i3PqzYLlfIsK4s
         98nGoZHOfiKYoQEzn45fs1ykFA1fwtXiNL2UwmaTEDGNy3yCaJFBCKqa13bosALCztis
         ov6EX+8EEO7ZAuuWfTrD8U0HhKLFoO2dgMW1keFnBjjXsPzmdom5aHQcpdg0PBPC0L/2
         MdHbIw0w+gBX0cqtXilpIv7urvkL0iOIEB9+grlYbbCCrXGus56fJ4m7bheBqUYxE7Eh
         1+kw==
X-Gm-Message-State: AOJu0YzD0URQBjtmYURcM1IkWc3ahPIk3Lm8eyghuGKvWJP9r5h9sVx1
	qYC+8HXvZokHHSNy9vub6Cp9HY2gHU4fQbYp0Sh55SLvfa9dY+9y/moCCCRNA8XIaDMGd1q+0QQ
	qzSmwIsVLcA==
X-Gm-Gg: ASbGncsXv0lbpDN41+E+/s+aIV7h/mXZwmwmNN4Dbv1+9XYjRIKUA+bhGjunkOyyu/8
	KEol7aH0pJ0GuM4VU2XPQCtRqJSkTzpNsS4bqZ30fK/aO4+Twx38gveI5syRK3X/qScRs52m3FQ
	4PezgotzCGRioEhY93pkDvM0kfORvKL12n3pCB7lxErxnTgrsOVEk7Cuf87etbvhIzDAF5YocrE
	CyOIl9e+7arFPEzZW4yDSCTIL2X/QGstV891bToWLzlkupQjEVNb2UIm0+IuGpu3lz2xPgViFCQ
	AmzHisWDjDVW1UXdvMX/cjikTGtKoY2hD0dvQ5Nt8/fh+YTJ1kayWAoTHhReSqtOfiZzqBiPbZ7
	vnJEaU0bygs/7Qz04HTW/yk9Dci1tqe0BPOMMP6wjCBsBswH0EVe371bU3DhDbPqGyN61Dz1bC1
	b2JHESXaU8kBK0s01PeeL8e0Df4C5b
X-Google-Smtp-Source: AGHT+IHs9/yah7+LL8dEcqJhQQLW+XK5ngSWHXrirtA5CcwyDvBqFPLqGRdj2uDT9wLcliFabWN9TQ==
X-Received: by 2002:a05:6a20:4328:b0:341:ea4:b977 with SMTP id adf61e73a8af0-3465381d8f4mr2997177637.44.1761737249215;
        Wed, 29 Oct 2025 04:27:29 -0700 (PDT)
Received: from ventana-desktop.localhost ([2405:201:d019:c0ce:f7f5:7789:48e5:c03f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7f6040sm15316918a91.16.2025.10.29.04.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:27:28 -0700 (PDT)
From: Himanshu Chauhan <hchauhan@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-efi@vger.kernel.org,
	acpica-devel@lists.linux.dev
Subject: [RFC PATCH v2 05/10] riscv: conditionally compile GHES NMI spool function
Date: Wed, 29 Oct 2025 16:56:43 +0530
Message-ID: <20251029112649.3811657-6-hchauhan@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
References: <20251029112649.3811657-1-hchauhan@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_042730_287842_8796511D 
X-CRM114-Status: UNSURE (   8.18  )
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
Cc: apatel@ventanamicro.com, cleger@rivosinc.com, tony.luck@intel.com, Himanshu Chauhan <hchauhan@ventanamicro.com>, robert.moore@intel.com, conor@kernel.org, james.morse@arm.com, paul.walmsley@sifive.com, palmer@dabbelt.com, ardb@kernel.org, lenb@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Compile ghes_in_nmi_spool_from_list only when NMI and SEA
is enabled. Otherwise compilation fails with "defined but
not used" error.

Signed-off-by: Himanshu Chauhan <hchauhan@ventanamicro.com>
---
 drivers/acpi/apei/ghes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index 97ee19f2cae0..f2cbd7414faf 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -1356,6 +1356,7 @@ static int ghes_in_nmi_queue_one_entry(struct ghes *ghes,
 	return rc;
 }
 
+#if defined(CONFIG_HAVE_ACPI_APEI_NMI) || defined(CONFIG_ACPI_APEI_SEA)
 static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 				       enum fixed_addresses fixmap_idx)
 {
@@ -1374,6 +1375,7 @@ static int ghes_in_nmi_spool_from_list(struct list_head *rcu_list,
 
 	return ret;
 }
+#endif
 
 #ifdef CONFIG_ACPI_APEI_SEA
 static LIST_HEAD(ghes_sea);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
