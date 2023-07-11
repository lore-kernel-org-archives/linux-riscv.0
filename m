Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEE97C001B0
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jul 2023 10:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jBzMDpcsM26jFnrtOgO+fgutDxzBqyfcsD5jMWx59gc=; b=dRQHf+an9XMRD7
	YeGo37j/Gb28H/73iHllA3s5LpIJCGY/EsYRJKJg4C06eSaCeZDsQD3qEudZdXxwHCkCKGUjZSwFo
	oJ720BPbQv9DMmyZjSKj3JswRPkmkOPdiX5vrALCEYLMwdsZwfa3UCEBv87HXnxMRpu+iNYbPIX+n
	9rpjb/eDx8B6ee8w0SXhpFUTS93sTX8k/Mn454/u7PRNO51XZwCzlmpoiUHFvB7IMJxYYGBLJkKZX
	Me2V3zTrNmvwVh8T00OaeQa9MIM56n+y1mYZBPsJGHlW7V42itriSgrGpx9Wi01HAqeN03kkxhTf5
	FHGyIMoOxWOXXsQ5O1Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJAyZ-00EgVT-1o;
	Tue, 11 Jul 2023 10:52:11 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJAyX-00EgUT-1B
	for linux-riscv@lists.infradead.org;
	Tue, 11 Jul 2023 10:52:10 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-34574eb05f4so21105635ab.0
        for <linux-riscv@lists.infradead.org>; Tue, 11 Jul 2023 03:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689072727; x=1691664727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2lUqyNFR/3dbpsLATQPRyo4SUfiIO9bHmuUGRrxMZ08=;
        b=lAtnbdoFrngPAW5pUeXeJEeAvltQ++NgRMGvvUHaIp+rkJH2muolPGXKrMLNjH3cWf
         tDfDjf4rpr6uJUZd8QRB1Q1jMTFsQ26a9ehpmiXESXGgKl96LdereHIl1nIcHIg2PzuL
         jrG4ihC/baeZoNyCpS+aVcMxFSAuY1fKCKi5XGx6ZxjHl4djODDc7hmvytVLyz9MN9An
         Aeo90RvRF/IUdnQSNuVmlKyqjdIR3a3EZtS+AZPy+Cg0ajBbIMvN8Sv/4btQ4fqwNfmM
         4pncVSlwd74vz3B7B9E1tgK6D1D41ifUSnQYV9LmKyWJeg5iFIBpIdG+oUVFIXLtwdvl
         txng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689072727; x=1691664727;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2lUqyNFR/3dbpsLATQPRyo4SUfiIO9bHmuUGRrxMZ08=;
        b=YXOARf4oE/t+MgXYJ2mB75HwqakOZbhtv9OM62PcmBEnAig0NvVeohMjxccpIOfRNF
         AfcXV7lMnYDKrYKXZg/za52Jf1G09A/NuK90F3EWwxweonSyZFFvDNNZRIGpK3tKbfha
         jKE4hCjWNAjX08TKZo4FILMf+6YzQl5klxEnsTo5vYGRhH9nKmHC7TDxlfOnPfnPPA5o
         4lYwGxMCigYUWf60QHpjueWlZbHCmJ4FzA4Im0bAaSGu86SM6GOHs0l8Dz13Z/bxGT/w
         7Yv4XZJhG/k5OPg1X2433aRQPc6uQg1qWxxXprjCXqvjhgx57J3R0tJRs1AL9jkRS8YF
         9y2A==
X-Gm-Message-State: ABy/qLam9SI+MBNiNbdXhWS4JATX0ANWZKrJdUDedKCsbCDWr3EfOjh/
	hKrSxHmOR6WV5wyxXMS27sU=
X-Google-Smtp-Source: APBJJlHnWcPq3rZ0s3CNgbTFqH3PLXbC9OQqyCNcDrjgDVv+oE384KHWjDyRjzBdB7UYG8wxUwVlyw==
X-Received: by 2002:a92:c987:0:b0:346:6afb:c9f5 with SMTP id y7-20020a92c987000000b003466afbc9f5mr3093263iln.1.1689072727475;
        Tue, 11 Jul 2023 03:52:07 -0700 (PDT)
Received: from localhost.localdomain ([58.240.82.166])
        by smtp.gmail.com with ESMTPSA id z12-20020aa785cc000000b0064cca73d911sm1422601pfn.103.2023.07.11.03.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 03:52:07 -0700 (PDT)
From: Song Shuai <suagrfillet@gmail.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	bjorn@rivosinc.com,
	suagrfillet@gmail.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: correct pt_level name via pgtable_l5/4_enabled
Date: Tue, 11 Jul 2023 18:52:02 +0800
Message-Id: <20230711105202.842408-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_035209_410726_A581B888 
X-CRM114-Status: UNSURE (   9.59  )
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

The pt_level uses CONFIG_PGTABLE_LEVELS to display page table names.
But if downgrading page mode from kernel cmdline in 64BIT, it will
give a wrong name.

Like, using no4lvl for sv39, ptdump named the 1G-mapping as "PUD"
that should be "PGD":

0xffffffd840000000-0xffffffd900000000    0x00000000c0000000         3G PUD     D A G . . W R V

So select "P4D/PUD" or "PGD" via pgtable_l5/4_enabled to correct it.

Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
Signed-off-by: Song Shuai <suagrfillet@gmail.com>
---
 arch/riscv/mm/ptdump.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/mm/ptdump.c b/arch/riscv/mm/ptdump.c
index 20a9f991a6d7..cfdd327981ee 100644
--- a/arch/riscv/mm/ptdump.c
+++ b/arch/riscv/mm/ptdump.c
@@ -384,6 +384,11 @@ static int __init ptdump_init(void)
 
 	kernel_ptd_info.base_addr = KERN_VIRT_START;
 
+#ifdef CONFIG_64BIT
+	pg_level[1].name = pgtable_l5_enabled ? "P4D" : "PGD";
+	pg_level[2].name = pgtable_l4_enabled ? "PUD" : "PGD";
+#endif
+
 	for (i = 0; i < ARRAY_SIZE(pg_level); i++)
 		for (j = 0; j < ARRAY_SIZE(pte_bits); j++)
 			pg_level[i].mask |= pte_bits[j].mask;
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
