Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51CF7CD98CE
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Jun 2026 16:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=9M8ViS7/27oJuHOABvMzTS1jDNk9zj4bV0O/BOgDyGk=; b=Do7QApaE8+ylhL
	y0k6QWptB1XkAD3SbhSTVPTJMcmGs6iFlBQD/jNrXdE8867hlhvAYc/0vEkQUci/F9ilADafdjcZa
	xquApvkTF51XZhsMbnqCfpy0RlV7hn/Jf3asDe4JKFeW1Bpv5Y1MwNCWAy3RE2KaDCypuPjIHZW53
	XE4JBfIPhOPql+XaXslaqXezTx31WLE8by+rp3kO0PQk27BazIXUz/ZXOwiojQLnOxClwoD7Q8+8G
	qzgyXEh/flJn2u29wCesjVy7mcn1VlWzipXcGT6alKS0BIo+ceCqcfBc8HlsZd4KgTGtDWZmSmd4g
	mU14eQcqr6IwmMgAzn3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4h1-0000000BGxd-2GFs;
	Fri, 12 Jun 2026 16:25:15 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY4gy-0000000BGwQ-1tfX
	for linux-riscv@lists.infradead.org;
	Fri, 12 Jun 2026 16:25:13 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-7e8833c99fcso12640267b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 12 Jun 2026 09:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1781281511; x=1781886311; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zRa+eFmdh/5sce8LPeVABmcbTpIdXzK8hhJ5rYpTZ9I=;
        b=AiuA3GL+yiPN8t0xjYcTHh+NklKvr/b/7w2hKDPjOrb0sLehlik932nwVJ+4ct29VK
         QIEork7/tpx4/ASvzE4+OR2ZIJwWrpl++CfMr8PzxzjkYk5K1cdzlGnEHiJ4eWusq5n5
         WQDhFZ8RRcSEKsi9pvhLUPfZYydB8zSD9CbJ7NG9QP23AVUr9ZH6ggxBWZzaWf36qSzM
         8h+L68P/l4vxtiw9Ped57f4amojPBH6+FisCTtzn4NYCg1kGv3my7PhCkptnNBxa48ad
         kDNByaulqPMcEsiN620jT/+CUU4WE4ezYOwxXFWDLwKLs2WvZorYVi1QmQCe3nJLWqyy
         h7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781281511; x=1781886311;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zRa+eFmdh/5sce8LPeVABmcbTpIdXzK8hhJ5rYpTZ9I=;
        b=ae8GLzHvo5PCqS6KLLTBwa9QKC4bd+oeDh1gfHz/WKnoxG1/V1f7tGUO3uAD5FivEM
         PEl1WB2Muep5+ZVHI+ZF+A5YmC61RJ3Er44/73MAEOroxZ+9t8ecjsU9Ax7vNXrImyVM
         JQvI6j8KD3TLT9ix/vnsz6KA/EF4So40HFF3GqWBewofKO+oBYN/EhSWdqgnOvj8UCsz
         /rdRYoTprwSpCX6IUdQJCngYI2EQlob35o7AGkY+ocNXXPZrmXOH7yWcf57MLmYLU++v
         I0IXe+8R7Jw/Qx5qulSFa+kfCzYv18d3RaLdOgtEDyAxmP4VV+b246L0re9AwDz73owm
         ViLQ==
X-Gm-Message-State: AOJu0YzIeWiJxsMZhnw2u7RMCv42R0M57mTJQjSP4uTr4mbIp047Ozaw
	Ghezsn+Et61yvNxqXik9lSB0egQeH+jYdMioGgGXrcLFcudIhnhoaEbWoyoNR0t6RT2xdhkyibr
	RScjY
X-Gm-Gg: Acq92OF2VUQFKzLjEzt/qkdhnjIt1mpdUwWewqkcrr2d+Mr1iODlTcGVgVwXEP+XIDj
	dSngNWAYwVX5ndwZUVL+FvNuYi54pOpaJFCYQEH7KvSPtSk50GkRJBrVEZSUfZZg7v/yqq8EaVK
	ElFLwcu1jyc57SQ1qkDB87UVN4xLO5oD3h15ef2ZpNyRxsOlrJH4hlESoxGgXREob+YyAiX9qek
	h5IXbBuUo+34DZxQx0hK3YrSF8LNj9FGSk+33KTj7RM2DBS1/4Er03wUm/6XJfVzZEQ3n7aKaH9
	lFBXAhmGGcUEWj7dr0RDbd00W4fl2J3C1izHI2/vnbdzHq3nIXoHT2oVlXg0WOD/1y6oLRXrk/S
	Brn7BS0VZfdFZZlpd4otgXT69w9fR8vwmNLzbH3Hcklpd1SSaSB06eJqyqke/CRDq2ymPuk0hn4
	j4CjjjWMaq4jxvpjgrO/8KKMpbJ/Rys50bOWveZuWCC8uGXcbcOYp9B22y3YnILb6WxWJTgLxvu
	CQxWX4=
X-Received: by 2002:a05:690c:e3c3:b0:7d0:6155:480d with SMTP id 00721157ae682-7f7bac02d50mr33640807b3.5.1781281510966;
        Fri, 12 Jun 2026 09:25:10 -0700 (PDT)
Received: from [192.168.2.129] ([2600:1700:220:59e0:ca4b:99ba:db0b:3666])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7f76e2b5564sm12457887b3.6.2026.06.12.09.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 09:25:10 -0700 (PDT)
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 12 Jun 2026 11:24:43 -0500
Subject: [PATCH] riscv: drop __init from
 vec_check_unaligned_access_speed_all_cpus
MIME-Version: 1.0
Message-Id: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
X-B4-Tracking: v=1; b=H4sIAMoyLGoC/yXMQQqDMBBG4avIrBuIESP0KqWENPnVKWWURKUg3
 t20Lr/FeztlJEame7VTwsaZJymobxWF0csAxbGYjDZW29qoDcGt4j88CKKLaZodCy8qdL5vtfV
 N14JKPSf0/P2fH8/LeX29EZbfjo7jBCRCek17AAAA
X-Change-ID: 20260612-vec_unaligned_drop_init-c7af506a375e
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 andrew.jones@oss.qualcomm.com, ganboing@gmail.com, 
 Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_092512_603032_0CC211C2 
X-CRM114-Status: GOOD (  12.79  )
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

This function runs within a kthread and need not necessarily finish
before system finishes boot and free_initmem() unmaps the .init.text
section. This function makes calls to SBI for probing unaligned access
speed, and if this is slow for some reason (say some debug prints were
added to SBI), the kthread can still be running at this point and result
in an instruction page fault when trying to fetch from the freed region.

[   25.642087] Unable to handle kernel paging request at virtual address ffffffff80a04ef8
[   25.646694] Current vec_check_unali pgtable: 4K pagesize, 48-bit VAs, pgdp=0x00004000316e9000
[   25.653170] [ffffffff80a04ef8] pgd=000010004be7e401, p4d=000010004be7e401, pud=000010004be7e001, pmd=000010000c3000e3
[   25.661244] Oops [#1]
[   25.662997] Modules linked in:
[   25.665357] CPU: 3 UID: 0 PID: 42 Comm: vec_check_unali Not tainted 7.0.0-tt-blackhole-asrinivasan-00007-g30ff73f18211 #570 PREEMPTLAZY
[   25.674669] Hardware name: Tenstorrent Blackhole (DT)
[   25.678545] epc : vec_check_unaligned_access_speed_all_cpus+0x18/0x2c
[   25.683458]  ra : vec_check_unaligned_access_speed_all_cpus+0x18/0x2c
[   25.688372] epc : ffffffff80a04ef8 ra : ffffffff80a04ef8 sp : ffff8f8000203e20
[   25.693874]  gp : ffffffff814dc168 tp : ffffaf8001ad9900 t0 : 0000000000000000
[   25.699401]  t1 : fffffffffffffff0 t2 : ffffaf8001ad9a10 s0 : ffff8f8000203e30
[   25.704912]  s1 : ffffaf80018dc780 a0 : 0000000000000000 a1 : 0000000000000002
[   25.710407]  a2 : 00000000000001f0 a3 : 0000000000000018 a4 : 0000000000000000
[   25.715917]  a5 : 0000000000000000 a6 : ffffaf8001c03d98 a7 : ffffaf8001c03e30
[   25.721419]  s2 : ffff8f8000023c98 s3 : ffffaf8001aa1240 s4 : ffffffff80a04ee0
[   25.726937]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
[   25.732450]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[   25.737944]  s11: 0000000000000000 t3 : 0000000000000002 t4 : 0000000000000402
[   25.743481]  t5 : 0000000000000040 t6 : 0000000000000004 ssp : 0000000000000000
[   25.749024] status: 0000000200000120 badaddr: ffffffff80a04ef8 cause: 000000000000000c
[   25.755060] [<ffffffff80a04ef8>] vec_check_unaligned_access_speed_all_cpus+0x18/0x2c
[   25.760964] [<ffffffff80047a10>] kthread+0xd8/0xfc
[   25.764660] [<ffffffff80010c48>] ret_from_fork_kernel+0x18/0x1c4
[   25.769220] [<ffffffff80895fe6>] ret_from_fork_kernel_asm+0x16/0x18
[   25.774018] Code: cccc cccc cccc cccc cccc cccc cccc cccc cccc cccc (cccc) cccc

Drop __init from its signature so that this doesn't happen.

Fixes: a00e022be531 ("riscv: Annotate unaligned access init functions")
Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Assisted-by: Claude:claude-opus-4-6
---
 arch/riscv/kernel/unaligned_access_speed.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 485ab1d105d36..366baca73dc27 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -325,7 +325,7 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 }
 
 /* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
 	riscv_hwprobe_complete_async_probe();
@@ -333,7 +333,7 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+static int vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
 {
 	return 0;
 }

---
base-commit: 863f9b49d618e02e3ecadeb89ebd39064ba8c2fd
change-id: 20260612-vec_unaligned_drop_init-c7af506a375e

Best regards,
--  
Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
