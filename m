Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CF8CD5BDE
	for <linux-riscv@archiver.kernel.org>; Wed, 27 May 2026 03:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsaLNpIwImFHigR19f1jrJ4AAGClXpjWJG06dXHI0eY=; b=HN1PXcMywJDQEX
	MYRUpuGwP54l/kXqhNglC4ocTGTbeddE4oOx98Q51pI6o46XTezBcFOQVbXjI8Slkcj69L7MDFtyk
	rQdBRugsovyy+RIz3mYHJm8YiH76jNK2GTN2GeKbDIN/BH/H/1vsp/TIFaHAo3f+4Oph62DkDudE6
	XidDAxCFXq73pDaJmgwgUkNlBxRcQj3aFBYG0oK0+YR29JhXABLggl4o/wDn+W+pvkscJB/4ormC6
	36tyz/ks3+jqtBJEuJ+MaSQ4SOZAtBxLGdW8ZRMvvZjulo1ZWNUGFj1inVue+Jk+exxCD17j6HATX
	40Kl458Z3Ke534WzoOFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xk-00000003ERQ-3rZe;
	Wed, 27 May 2026 03:29:44 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wS4xh-00000003EPL-3b8a
	for linux-riscv@lists.infradead.org;
	Wed, 27 May 2026 03:29:43 +0000
Received: by mail-pf1-x443.google.com with SMTP id d2e1a72fcca58-83f674f978fso4362013b3a.3
        for <linux-riscv@lists.infradead.org>; Tue, 26 May 2026 20:29:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779852581; x=1780457381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=UBVZHyiR9v8k3KOo6WtdJqSHeUOW8/lw7rLcCabFnjp5O18AfEuwHm9iQUC2uFm6lV
         v2rpWFF4kDjsPzSQXQH+1wasZVQSSAUjOtIgJJX52/ANGN6NHGGdTU9fu3wfI+hJtKM4
         W+KVfC+bUX6wuAiuJIY7iow+FN0yWAK1UegFeKbx2BgYSQbW+rDtFKK18InUF+QsA/T1
         KAOa4B6lmIUOlwNir336VfmK7KY/fb8GaJnPI6l0rvY6o7gldgjQfE20YZsV9d5ghrml
         5AynPYDf/JdaI7FF4B0JY5P7iJMDdClMFE91aP+lEHYb1DCZ9ObDfa5HysbdjpKMS9VA
         fnpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779852581; x=1780457381;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=osub7jqB1KkbojdE6IP/r6iEAlyJyU/eaCe2RQB9Q9c=;
        b=ohKprP12NS4kfa4XLS2FpJNrrsjRWa+K22FCyQgmsfaDHdsWxWnKkbjcgK3U7BGOVi
         h9nLZImI8gPKYs1pKjuXZPBeJtZqbFduOy5jh01ZHNJcng9AcimjW9Ij7iasB+JsdyIE
         6bm/kBwtP0s0fyShqh2klVeau3D13jfryP3rXTfcnstM15HfF0R0fO1S/31jVLh6V2SH
         cCjus8ZpzEwPlJyLgmk8tJMjMNacpY48px7RRnuyOXxouOnOx2PrIUlg8uVIPjyOKO/v
         WxG3KHNPMtGPbz2XyJ2L6XE3US2t9FAIOGP2upsp4Ja/kbmEWYVQN3FtUxvLZQdZXzit
         4huw==
X-Forwarded-Encrypted: i=1; AFNElJ8hKZ7OuqBZBfVEoqf3+OjGQ07bZRwROlpUCApmbD4DO5NGCCzHn39hT43RF9oacxH5jJYV1nRBvVgYfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGOaAGAUEG288rsC2uCNEvQ63Il6VQ5WYPBMISNbOEdt+gt5dK
	eUIrhVvT3rB36o4Wr9SryWPnrL8gxQJ1kUQfOzT18qvcM0G12JXMsk8B
X-Gm-Gg: Acq92OHO//ds5VSuchfHX0NmWI7/bbsZeRnuJi7Sl5S59oJ5vJn/iR5oas0dFJhs3sV
	PFwRxBZi5b0el4lcCL+ms2bwlb1kKQ3P4FrwUNqNGVLW7VmxizPqDpqX+29Lf+k0PLy9CzTdLzB
	R3KrJ75BYpgvS/uHkT7m2SKilNXNDScnUwOlw9SJvQ4eJLNrpFtKL4Ep5R/wH7DsyD7XzyjFmkE
	apCOYtSMaUA+1WDmp7Zn+pio1SWTczphN30RR5yjsoG+0GZ3uKoWmNMZUUwvIUFFEKSYO7wuztI
	P5OWxx95pJaRuqDQhZUwOWVS6E/KPraPf2uj+ZDBTebf5OPxKu94hTFdYxRDsnnnCjL2s8nIGSK
	z0L0lEw0Q0RKCKR5AjtoDS7aVZVJ4pqYruBemtmeeGBI4IE3YvCKQyYEVH6iBC4jDQYM2SqwQuk
	5N3Z4W0zpIgnTJ2id0V9dY7lVK1Hf6atSPGyBb
X-Received: by 2002:a05:6a00:7702:b0:841:dc7d:306a with SMTP id d2e1a72fcca58-841dc7d511cmr264256b3a.25.1779852581229;
        Tue, 26 May 2026 20:29:41 -0700 (PDT)
Received: from intel.company.local ([210.184.73.204])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-841d7307596sm749688b3a.59.2026.05.26.20.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 20:29:40 -0700 (PDT)
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
Subject: [PATCH v3 01/11] of: reserved_mem: handle NULL name in of_reserved_mem_lookup()
Date: Wed, 27 May 2026 11:29:07 +0800
Message-ID: <20260527032917.3385849-2-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260527032917.3385849-1-chenwandun1@gmail.com>
References: <20260527032917.3385849-1-chenwandun1@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_202941_906632_EB52B2BF 
X-CRM114-Status: GOOD (  10.44  )
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

Prepare for an upcoming change that appends /memreserve/ entries to
reserved_mem[]; such entries have no name.

No functional change.

Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
---
 drivers/of/of_reserved_mem.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 8d5777cb5d1b..313cbc57aa45 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -788,7 +788,8 @@ struct reserved_mem *of_reserved_mem_lookup(struct device_node *np)
 
 	name = kbasename(np->full_name);
 	for (i = 0; i < reserved_mem_count; i++)
-		if (!strcmp(reserved_mem[i].name, name))
+		if (reserved_mem[i].name &&
+		    !strcmp(reserved_mem[i].name, name))
 			return &reserved_mem[i];
 
 	return NULL;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
