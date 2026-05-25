Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEDCCD5BBF
	for <linux-riscv@archiver.kernel.org>; Mon, 25 May 2026 07:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=csWtJ4cQSxJIR1DNR950mRH+iZZnyFmZhGzWI3yC/K4=; b=e6L1MxDyEzMxvX
	3Rv9KmZBwjBXYBdYhmfrwir/b/BrNtBWa2VBkd//Q2aAwhZLZWrIGzow+atphLHGazvhp0kFltsIS
	emUnaWJogkdIEU20Pmn6r+NgKFknMHsQ0jp3pQPQUyJ0iDFT67HpuUp1RJhjdG8tUDsj5FadFKIfV
	xbiXGPwpIqIc1beyVyuA8IjUPMpW3WHrk3oD5K7MPLJAoBeGdXiQLa4uhUhsrX3ZTQsi+jK7kZo4q
	hEAYi2PNYUKnQx+jBWMAVhh6HliJfVkQDVec6lrNLUAgMgaaIN+3w1RiMg9VM4n8La/kwgpek50IV
	TZIxBuR2RhWsKFr4yIgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPz7-0000000GYUY-2oG8;
	Mon, 25 May 2026 07:44:25 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRPz4-0000000GYTt-3aDZ
	for linux-riscv@lists.infradead.org;
	Mon, 25 May 2026 07:44:24 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2baef9f5ecdso76736645ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 25 May 2026 00:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779695061; x=1780299861; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Lg9TspPoq01uolM1ptMRklLuTF5lwXaabRXnRf1AltY=;
        b=FfNZV9dHPWliaTfeshzsYTBz+4MV2FmJ/S/5hO41l/EucSVHYjO3dHG9sPJq1jMNbX
         fuQ3ge9uVfyP9LoWrZ1aFcK7BJmgWSaFlRc71ZZdBT58iHepVOZLOH+MN6oQ/FlqwbBg
         KGzmVWSd0rb9eD6OIyFTRLoqavSvIK2OKEB7dboRwMmzS5PQbF2Jv8y314qJz6CUTZaM
         Qs7vgotKKMRLRAOSdvjZFwz+VcTNJ0VgaZPx9l/2pfqFNlg4wsOy6ePS2yaYM6io9pQQ
         nOoQcAybvFXJg8dgKMBgkOO67VE7Pq4QzuYH8tO+NQP0qPmzJKmzxXyhaDA6dvyg97Ec
         B2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779695061; x=1780299861;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lg9TspPoq01uolM1ptMRklLuTF5lwXaabRXnRf1AltY=;
        b=PYu2Q47PnqRUkp2DRD4bSX2mG1+M+PR7n+ZhBMYmR415VwTLqJMGjB7K4lGgoH3uZo
         eRZXUVXMgpZGAn8wb+x3CvlcdiuHlDJ3UkQ+OGZDDbBoPAr+BHnR2oFrEw2qM6LxUqCd
         1Mymzy1p5vNtaWlOcgFjIB1pKcaJu91zS9BYSYpq3uy6Vyu9NYc8LawtyJtjf56NsLZy
         Jo/04Jo3djuNcmsW9XLEPqvt+nFUWBd6vaScHCqn7NhrjdViA08rr8DyVAAHNZObdFvM
         jHyUUqnNPegD9fc2fgQUIj5RhAT5K3FBJR3IwDXIGr7ZgQOBHIIOmQ1DwAI2OsS1f1Qf
         YHUQ==
X-Forwarded-Encrypted: i=1; AFNElJ/TuTiwtfjvMJ4c7fg9ss96ZD6OKNL4fWcJzCST2ZREtiIZdrx9UAUx0ReeQ7oS+GuX4IjD90WMZK+6Hg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBnOYl3o43O8QELXoQjVNGiimZy62UyO2QUeOvannAxJgo+Q6u
	7yJPvrhwgmS/G15ijjUnA5Owur6QXryp0+CxVJwmY/yXEhwQKibT4x7V
X-Gm-Gg: Acq92OFzdOaSYDUUsKlzqebg3eOYibJvRiXlfmwdNKaLwvFtImEDzCZi+CUVQAJ/tBK
	TEI9Uf4o1hYervbv3coHi2BhDNE2RQuY9UDHGCrxA5NkJiHUumhqG7ZZRvnc0ecALDslBwzNlj0
	clBlEZvCoYDoZ18sDXod+Bkp+poRmMYXCKYT0S/vljX1JuFgDxTGcl3L0JD9QFuoGd1czc6hwaf
	zJY3PYkjUKkOlY1zFhXTbcIFYrRSisM0/FDfS5gDoGN80ywZVvqf+ihufmzHuW/XcVo1ua9frnE
	OQwYD0Q3nfwglYSEZrYz71BD6IwZb3aSNd8xkMdtLqo9G0APFt+guhfn7p8bfRQJZv1SHLa1Iw5
	jNbMtQetScv8lBNsp1Chpshx5Ib0UysNCQu810uehSi3+d0R9D1TQ8+bo9f34B8t/j5wkizQfIi
	KeClsw9fak7fp5LAEkp7F6x5wfGhucaX+GLCN4Pt+XnQDcYtrp
X-Received: by 2002:a17:903:234e:b0:2b4:5931:bc4c with SMTP id d9443c01a7336-2beb069806dmr133606145ad.15.1779695061379;
        Mon, 25 May 2026 00:44:21 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58dde5fsm88734325ad.70.2026.05.25.00.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 00:44:20 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] acpi/riscv: use a dedicated insertion point in riscv_acpi_register_ext_intc()
Date: Mon, 25 May 2026 15:44:15 +0800
Message-Id: <20260525074415.1533884-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_004422_893976_87BF941D 
X-CRM114-Status: GOOD (  16.79  )
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

riscv_acpi_register_ext_intc() inserts into ext_intc_list, which
is sorted with the largest gsi_base first. It walks the list
until it finds the first entry with a smaller gsi_base, then
inserts the new entry before that entry. After the loop it also
caps the predecessor's nr_irqs if that predecessor was registered
as PENDING.

The current code uses the loop cursor for both jobs:

    list_for_each_entry(node, &ext_intc_list, list) {
            if (node->gsi_base < ext_intc_element->gsi_base)
                    break;
    }

    prev = list_prev_entry(node, list);
    if (!list_entry_is_head(prev, &ext_intc_list, list)) {
            ...
    }

    list_add_tail(&ext_intc_element->list, &node->list);

If the loop falls through (no entry has a smaller gsi_base),
node ends up past the end of the list. `&node->list` resolves
to `&ext_intc_list` via container_of() offset cancellation. So
list_prev_entry() lands on the last real entry, and
list_add_tail() inserts at the tail. The code works today.

It is fragile though. Any future change that reads another field
of node will hit memory before the ext_intc_list global.

Track the insertion point with a dedicated list_head pointer.
Initialise pos to `&ext_intc_list`. Set it to `&node->list` on
early break. Use pos->prev for the PENDING adjustment, and pos
for list_add_tail(). The cursor is no longer touched after the
loop. Behaviour is unchanged.

Same shape as the Koschel cleanups from 2022 (e.g. 99d8ae4ec8a
tracing, 2966a9918df clockevents, dc1acd5c946 dlm).

Signed-off-by: Maoyi Xie <maoyixie.tju@gmail.com>
---
 drivers/acpi/riscv/irq.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 9b88d0993e88..49582cf4f4e2 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -134,7 +134,8 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
+	struct riscv_ext_intc_list *ext_intc_element, *node;
+	struct list_head *pos = &ext_intc_list;
 
 	ext_intc_element = kzalloc_obj(*ext_intc_element);
 	if (!ext_intc_element)
@@ -153,18 +154,22 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
 	list_for_each_entry(node, &ext_intc_list, list) {
-		if (node->gsi_base < ext_intc_element->gsi_base)
+		if (node->gsi_base < ext_intc_element->gsi_base) {
+			pos = &node->list;
 			break;
+		}
 	}
 
 	/* Adjust the previous node's GSI range if that has pending registration */
-	prev = list_prev_entry(node, list);
-	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
+	if (pos->prev != &ext_intc_list) {
+		struct riscv_ext_intc_list *prev =
+			list_entry(pos->prev, struct riscv_ext_intc_list, list);
+
 		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
 			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
 	}
 
-	list_add_tail(&ext_intc_element->list, &node->list);
+	list_add_tail(&ext_intc_element->list, pos);
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
