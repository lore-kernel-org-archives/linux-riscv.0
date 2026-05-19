Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A26CD4F57
	for <linux-riscv@archiver.kernel.org>; Tue, 19 May 2026 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ya4bBfLhHS/XW57kKSkk44kIyskG2ECuS38a0t3ZhY8=; b=gF6q/FJJVEqy8u
	tDtzgp0gthHWuTJfSZGpLFS3MFAvqLQrhzCUYaONm/qxfhnVHva64ohPU4vsZ5k+/e4PWpUHnCdmT
	19N7y/n/WaR9gg3EIQb92M8KxTEu0nkAtw3DaAw7wtDbiB43vMgszX3MAsyEJ94dnXTf515dL9EV0
	4qJIDPbsniFlyHR/68dgQKr7Af61fYOtqoiPNEAoMW86AGccwUoEA3ZTo9GR0Fwvyy/CypKg1HzRi
	1eVbF29fJi/dmZijoYKHyBeFln71l1zYsiZXO4aJ7VVH8FWqAO7/AilbmFvoyNnQR3YgyqS3TxYiW
	oZmB9c+qpjIjhbDOC3gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGSH-00000000rXY-0qsx;
	Tue, 19 May 2026 09:09:37 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGSE-00000000rWV-1Iwv
	for linux-riscv@lists.infradead.org;
	Tue, 19 May 2026 09:09:36 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ba17c8cfacso31700465ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 19 May 2026 02:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779181773; x=1779786573; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0zz10nV84PwNP40SOJ1J8qP/A1B5s58lMhIi8+aPk9U=;
        b=QF4L+Vey2qU+jP3PPdy3hABh0uL2CYpHrCsWNL5LFlfa4wJsYj0NOTkK0Ej/WTLvSC
         V8lkc08oDB1X8vWAZYHskUC2c6CxTkIWLp1SC6sGMpM69AF0Cz54sRzPtfaStDoqMjdp
         0VAQWPKDEP5BhLuXE4NII3whVsJm5W0PiWHVUdmdnk+Sr1cPBoQHHroMewQ+H4i59V8v
         cfzrjQ5LojfK/QtewyeUMPyWstGMc2ed0yvK8d15jev8vF1LAifzLKjZfi9Uv+1X0dWq
         8GWC23rlMv6Z7CQDJmjBERtyqMhTB8IRC7NPtOWpEMXhFfw4x2IKtSG2yZlQkMOl3Aeg
         3Q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779181773; x=1779786573;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zz10nV84PwNP40SOJ1J8qP/A1B5s58lMhIi8+aPk9U=;
        b=ruHCrxJpKypYFeapSTC+M1kTsKtu72uDP7cnxFCd6W0C5JtzFwV2ydSPDBYtBmQImt
         /S8iyJN0zJKC55JC/+/rvekk3IiC9aMDOb5dv5wciqM79t328sIYj0Ca25/TuANmYtQr
         PfoRi5ORkVnmDhM12mU/w9aGpRMk+PUulzlbD90pLUIvrIK7t7Vg5Nlu9CO1k9PlQgVq
         FnLdVcRTjJ59qBHle58c9IC6A4TeIClDK2yTGu4oaXt4AFRZSXtdAyFWI8ohJGphtqHU
         Ofm+oPvEYLqpNMIsVemRSpY+ERBMb3ccf+417iM21clmStVb+j4OFmWF0uKwWu3DFUV5
         VHhQ==
X-Forwarded-Encrypted: i=1; AFNElJ8DGCIFiP7H0rQHim01EoCrMUXoEcTBC6QE3eUA/m8N4/1LNGqZlxi6ewvMFdZ3YipjZ99H4abtDS5PNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPevy2+7Hv9cmi5vX8REvzT1hAMtsRHSyq5tEjv6E92N4bzPuU
	+dlb5HAfV2K69TA4miIBOEwYWPNKlSB+cxYCkifawtGVhvxgepNp5kls
X-Gm-Gg: Acq92OGeqE+s3xO6hp/kCjaf73bp2I5IDsOcH4FGctf6+utq/EvxZbkXI/ioL6OC74k
	walf7vVECPWnUqBXIZxlHV9DCCFw2Cyy14LcBjlb5UCkIIH0Y8qoT8c7qCxUWfAj8fh1o5ABkFu
	jjWejjea/Es+S0Lj3vn8sUhNxVPY5mhzN3UiAUkW6OXSV+Yfmr8gaFDE/rOeYHMLHycJQBI56V1
	CTd4rdsvJj9klRKM1ENR2lImPNBgffAVRG9JAK2qS1kM5Tx40D7bsfimxR/7Il0feyxnsV2a0zW
	leQiuQ1dsXS3QuD8yRO39Eus5huEpa/mPpin5A2F8t7TXeU4Hi6G9u0zscl907dD7EmXG34uFrS
	4XakdgqjY3/s/7U84XQl066nEeoyx1avlw5d/BzsuLmrsQbj9q6dENrykIKOnQrqh8Qgj8l8q8s
	1ULL+R/NnpveYLnbXNDja/2UbOEFJR5swjK1FYId4CbAf3Ixgv
X-Received: by 2002:a17:902:f547:b0:2ba:3e2f:6883 with SMTP id d9443c01a7336-2bd7e8f9108mr187154835ad.19.1779181773151;
        Tue, 19 May 2026 02:09:33 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5bd5f2e7sm172753185ad.5.2026.05.19.02.09.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 02:09:32 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: acpi/riscv: iterator after loop end in riscv_acpi_register_ext_intc?
Date: Tue, 19 May 2026 17:09:28 +0800
Message-Id: <20260519090928.1952787-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020934_352197_497A8BFB 
X-CRM114-Status: GOOD (  14.57  )
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

Hi all,

While reading drivers/acpi/riscv/irq.c I noticed something
that looks like a past the end iterator pattern, used in two
places in the same function. I would appreciate it if you
could take a look and let me know whether this is a real
issue, and whether it is worth fixing.

The site is riscv_acpi_register_ext_intc() (linux-7.1-rc1,
around line 155):

    list_for_each_entry(node, &ext_intc_list, list) {
            if (node->gsi_base < ext_intc_element->gsi_base)
                    break;
    }

    /* Adjust the previous node's GSI range if that has
       pending registration */
    prev = list_prev_entry(node, list);
    if (!list_entry_is_head(prev, &ext_intc_list, list)) {
            if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
                    prev->nr_irqs = ext_intc_element->gsi_base
                                    - prev->gsi_base;
    }

    list_add_tail(&ext_intc_element->list, &node->list);

When the loop walks all entries without break (no entry has
gsi_base smaller than the new one), node is past the end.
The function then uses node in two ways:

  1. list_prev_entry(node, list) relies on &node->list
     aliasing &ext_intc_list (the head) via container_of
     offset cancellation, so the result becomes the last
     real entry of the list (head->prev). The PENDING flag
     adjustment then runs on that last entry.

  2. list_add_tail(..., &node->list) relies on the same
     alias so the insert lands at the list tail.

Both behaviours are intended (sorted insertion plus a
fall-through path that still wants the last entry's PENDING
flag adjusted), but both dereferences of the past the end
node are undefined per C11.

Jakob Koschel cleaned up many such sites in 2022, for example
commits 99d8ae4ec8a (tracing: Remove usage of list iterator
variable after the loop), 2966a9918df (clockevents: Use
dedicated list iterator variable) and dc1acd5c946 (dlm:
replace usage of found with dedicated list iterator
variable). This site was not covered.

A candidate fix would track an explicit insertion target
(struct list_head *pos = &ext_intc_list) which is overwritten
to &node->list only when the loop breaks early. The PENDING
flag adjustment then reads pos->prev directly: if pos->prev
is &ext_intc_list (empty list, or break on the first entry),
the adjustment is skipped; otherwise pos->prev points to the
real entry that becomes the predecessor in list order. In the
fall-through path pos stays at the list head, and head->prev
is the last real entry, so that branch keeps adjusting the
last entry as before. Observable behaviour is unchanged.

If this is intentional or already known, please disregard.
Otherwise, I am happy to send a [PATCH] or to leave the fix
to you. Thank you for your time, and sorry for the noise if
this is not actually worth fixing or has already been spotted.

Thanks,
Maoyi Xie
https://maoyixie.com/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
