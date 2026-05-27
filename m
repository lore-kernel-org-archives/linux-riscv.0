Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC666CD5BD1
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5tBBEp3AnFolZK9WjKF47OLb6CLb2hk9zWb2vkwcuI=; b=yQcKsSkexBOqF3
	wDVaaheppj0ijIhLDcMJFECgF6NLVGF30J+PSkfVVP7sslE3SUxNbn1x8Iu9z+xufLy9Nl21qBFDG
	gMWxwpLwL+BJvDsEB84fXPBulmOiK2EmM7yiK0pUYnmK3CdVKjdH1ZLiLmQmxO3VD9sP5figD4io7
	bWGU3aJgdgMUKF17qMiWrs57FcRULUQ9j+eUhX09EEjh2hWmiaK5Es3kGluZae4j3uvcnJh7DchFL
	/oxOnPWRL0ygA0rr5ZsIZvCjTET43R6DNkzTbElZCghuuxdH3RkilxQfhgKjgmP1ZVG55ybYtMwwE
	bApV52Qj2lH9P7wHPTrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yk-00000003FOU-24et;
	Wed, 27 May 2026 03:30:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4yi-00000003FMT-3CPk
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 May 2026 03:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=; b=e8WMyB57tzuMNIlfFYcWfGijWG
	mAFBmrpnHGKzYjB/kIVSgk2xZs9dIroLVPJKC11F9TrEd+EQdS+XGR7Y+mJH5/fqSruTvUM2bRs+1
	/j/9P5wUEJEik9rQqWzh09efQe2fEj+rEkGzc8Ib+tOJ25SPw680tdhakwRHssHhQ8ROUt8CiJLUP
	B0xrnglukPGVcVoP7EYbuSj7WP0uOIMc0kjDNnCOrF3WQgV5/Fi+GDetPB2reKCt6H1OV1F0NKFRI
	Ukf71jFXgG+EaXMjDHoy3auNp9RBSZHWATn9UisCxqZLXt81Q74KQvza943g1aGlicA2rJXCMvUhY
	tnb6kVGQ==;
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4ye-0000000CqkY-2jAZ
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:30:43 +0000
Received: by mail-pg1-x541.google.com with SMTP id 41be03b00d2f7-c855599a77aso27119a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:30:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852638; x=1780457438; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=pozrrvGzOPZuO3lWdsinLPtBiAXzRM2WRhuj98N3QKlDsiW6A34NrE0js5hSAzckm7
         YilZnzzrOuZarkjBK7Xm6BFw7AshHtd2HUKSeIUrnNj/y3TTToUOiG8GQ3tROxthUTSM
         StpGZgL7GMKfixaROwc0TyW3ZSqpVjOK5EhohgLFTJkRL9U0s3reQRxTr0Re6Hpj6UtB
         w8J+gYaNxunVFFX43J8BUSsptlSTsoDVb/iTnUmLd/KXPppeaUJx06FHWf1+eqJRsMrT
         8YMdUd3m6ci5HcycF9aZe5xkJCe/YI6hifPibp8Ir9U4EFMdflch8j/fO3a1hFypzjDB
         YV1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852638; x=1780457438;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hKDMR5TAGwiz4Z0dhIjLc6hZgq3gL98geqqMieh10P4=;
        b=XkKguI0EuulltE31vTKiS4EmD+r4nJwxicHSBOlc87P9dtRBICNPa5vEL07lEEhFmy
         RjBx1oNyfHYGgcQ5r7E8ATb6HQOGFnPu8Uwbn7ktwUlZd7R8wpSFGb35i70sDOf6M2EH
         OtXYfbXL7wwAybILso1TGIhuvetzhOO5IZoWO6ZBWO947sCKWqM/varlnmWRtI/UBZfW
         MmQj8lMGe59KPNGXOiCDPNWk+HT4wPNzrBW7SP3yGPUwx3WYGsvkAqTp0/i3LB+KbhgD
         G+ydphVHXJarAKDtUvWfSPSvqNMn9awx9X9XlctnR2fJUOKr/PhGyw/G05zkyfaEDBez
         Zoyw==
X-Forwarded-Encrypted: i=1; AFNElJ+dgLPvKwPIWusrPiobJ7y30hPkIvpuezpqggvfPAHeLESJawzhqcQV2aNEwf0CxxoKWw9vw7kmUGJKXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YypWGDX5hbZirsVHhiHKXXB2pTA4nJBI6S+i5s3iSzZ7BawbwHf
	A16tgUtj+R6OzuQoQzLoePpbrvP+O0YvVRrb982FWU6nVkvmYBEtnEsN
X-Gm-Gg: Acq92OF/GUftJ2c2EV2OdDXY3HP6uQLzvHpvhHQvtYlx7Ax/5mN95V6ZO1u9Af8WKPQ
	L4DxcuGAhFRRoI6oMo+D1gWxlejOmgE5hcmdpH1B2qCQIRq9q8D6seE9EFNuxPVwPo39kdcjwKU
	ae/iy5v2WLp6iAG7J4iIsg+/hP/+n81vw90ErrZlAzLGfYMn7zyYHZWbmEELViDLGLAKO349BYf
	bob5Jnfv1Mx10FI6XzVI9YI05pf/nK53VjENLCwe4xZ0MB+Gu3S+bPNQUbHvWD5KUV8m+stCSQM
	nGOIG08OU4cGE92gSbdkMPQicOaebXM9v9Uph+ogfNhtNqsA8ygbvr846JHR1dsAG0t+M0/6e51
	EubFYfnA9ivJagE725aBkeu61LOgkr2c7PQbyMH6HxiRFVFIiHe1Esnzzl3XnOqrOFABzKuAxvx
	r4tBhVLdOorUGJH6KHK3XuMbjhwCNazZGlVjoB
X-Received: by 2002:a05:6a00:1d9e:b0:835:38db:82f6 with SMTP id d2e1a72fcca58-8415f69ea9cmr20057592b3a.36.1779852638276;
        Tue, 26 May 2026 20:30:38 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:30:37 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	iommu@lists.linux.dev,
	zhaomeijing@lixiang.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	bhe@redhat.com,
	rppt@kernel.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	m.szyprowski@samsung.com,
	robin.murphy@arm.com,
	quic_obabatun@quicinc.com
Subject: [PATCH v3 06/11] of: reserved_mem: add dumpable flag to opt-in vmcore
Date: Wed, 27 May 2026 11:29:12 +0800
Message-ID: <20260527032917.3385849-7-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_043041_322852_7B22F5CC 
X-CRM114-Status: GOOD (  12.59  )
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

From: Wandun Chen <chenwandun@lixiang.com>

Add a 'dumpable' flag to struct reserved_mem so the kernel can decide
whether a reserved area should be included in the kdump vmcore. Most
reserved regions are owned by devices and do not contain data useful
for kernel crash analysis, so excluding them by default is the right
behaviour.

Reusable CMA regions are different: pages in a CMA region are handed
back to the buddy allocator and may contain key data for crash
analysis, so set dumpable to true in rmem_cma_setup().

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Link: https://lore.kernel.org/all/20260506144542.GA2072596-robh@kernel.org/
---
 include/linux/of_reserved_mem.h | 1 +
 kernel/dma/contiguous.c         | 1 +
 2 files changed, 2 insertions(+)

diff --git a/include/linux/of_reserved_mem.h b/include/linux/of_reserved_mem.h
index e8b20b29fa68..55a67cee41ea 100644
--- a/include/linux/of_reserved_mem.h
+++ b/include/linux/of_reserved_mem.h
@@ -15,6 +15,7 @@ struct reserved_mem {
 	phys_addr_t			base;
 	phys_addr_t			size;
 	void				*priv;
+	bool				dumpable;
 };
 
 struct reserved_mem_ops {
diff --git a/kernel/dma/contiguous.c b/kernel/dma/contiguous.c
index 03f52bd17120..eddec89eb414 100644
--- a/kernel/dma/contiguous.c
+++ b/kernel/dma/contiguous.c
@@ -579,6 +579,7 @@ static int __init rmem_cma_setup(unsigned long node, struct reserved_mem *rmem)
 		dma_contiguous_default_area = cma;
 
 	rmem->priv = cma;
+	rmem->dumpable = true;
 
 	pr_info("Reserved memory: created CMA memory pool at %pa, size %ld MiB\n",
 		&rmem->base, (unsigned long)rmem->size / SZ_1M);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
