Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88A7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Apr 2022 20:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cIbi7W0rpSicxk6Nt2MTjuel5BzHab7QwYsykLs0+1A=; b=bwxIJGZtcpEZnZ
	6WsvkfHXwDNSEgVXRLft81VopQCaE4BLTFwLKk2pHJhwkhz21CMvllfOTmHOFvStpchLAZjvxdzBD
	vWJDzgeXkY0NVleOitWdCgDgCxOTvQyNm5I9spV97hlGiV7UWnzHw7Qz6jOebCBGcvXoJDWyyjkS3
	vgMPGN1BJlDHFh/cJFXocNRktFebIzkloU5ad99STk4OmqV3AamT1aQ4Gmgbcbbose4/1UFsCR24i
	nA2DozYiQ6pUSs13GYiWEkCdrlsENGQ8x7MhcMMMGhx3fKlP7OkaJmz1zpivNHYS4ix6KaR0GEoyu
	DGjXRvsbjZvfXZMcHBow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nguHx-0065qZ-C3; Tue, 19 Apr 2022 20:17:29 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nguHt-0065nN-IW
 for linux-riscv@lists.infradead.org; Tue, 19 Apr 2022 20:17:27 +0000
Received: by mail-pf1-x42f.google.com with SMTP id z16so9422573pfh.3
 for <linux-riscv@lists.infradead.org>; Tue, 19 Apr 2022 13:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=njBQHRt2JNELpmysy2Ho9Dr1cUDqEsm6PMq8c5+PjEU=;
 b=MDbXI5kWR2BDcqIfRaKmzVcQ5N5PNVSbwrb9I6aeAV6SspjEAEbqSRRAy6JK4bvEDv
 ygi3Zld5WhIBRpY/+GGzDJTxUNHvzc0OMQ71XmQQtjDXJYIDsqL9yPCkHANDoIMivXPa
 DSVQ5WGTSxzyoT3HX2EMFdw9q87xTi/TCJUk6EpXgX+KWRWBr34WTXWmwL9AtuspLX5C
 XefYbEP4mPGAlyxp7DaZQWhnU6MCt7JgpmxQrBxwkp2iBq1PAuMCDga0CXe5jVtXWVEO
 IIzN+p7j50ZMWAVXVKmhGrmXOBnKHEPzc7OPwwNttVWcRIpRYgPpn1qNsxMkL+YDz8Un
 tQnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=njBQHRt2JNELpmysy2Ho9Dr1cUDqEsm6PMq8c5+PjEU=;
 b=EiloI219/Ed7iEdC2sO5h9Ej8ENijvOYlXKsjydpKoVAr0xS5RqAFQBgLmPz1klhvm
 IyVSBeCT6F+fbSp5WCEaZmvIDRZhg2qo/6n2DhmUhKW3Ff4/aOO9+bNeTajTawr1Hb7M
 7Xd21o/SI22xhEBC2PC9dvne4kyJj8ez/N2B5MYL/bVANldOxwULaK1DRNI09JgNkQeV
 oLwnJCbGE3YAxVQNX+6e9XGvO1tw0bbtzVK1XNXWCMj9Ivvl115lQ/qh428Juawuw4O0
 OPpqxa4f71ZXqjAJC1Erq8IfcLrVB3K8I+5CywB6ejYLmqZzOl3VXcRIxW8Frk69LLcu
 fnbw==
X-Gm-Message-State: AOAM532A8P5onrTxRWiS7M3pdgLQHIWmHmKNODHMrDm95aeymVsdMdZ6
 ReXZThQAwJAbUYCJpcQlmj547g==
X-Google-Smtp-Source: ABdhPJwc1cDd46DD18k94nqv3B1MaYAJuzolHAyuzWppQKf5G9zabmUr9J9UF4SppMe0nIj783Ymfw==
X-Received: by 2002:a05:6a00:4211:b0:506:5061:3e38 with SMTP id
 cd17-20020a056a00421100b0050650613e38mr19354994pfb.74.1650399443400; 
 Tue, 19 Apr 2022 13:17:23 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 204-20020a6302d5000000b00385f29b02b2sm17176543pgc.50.2022.04.19.13.17.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 13:17:23 -0700 (PDT)
Subject: [PATCH v1] RISC-V: Add braces around an empty if statement bodies
Date: Tue, 19 Apr 2022 12:48:46 -0700
Message-Id: <20220419194846.18318-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 aou@eecs.berkeley.edu, alexandre.ghiti@canonical.com, jszhang@kernel.org,
 wangkefeng.wang@huawei.com, 
 mick@ics.forth.gr, vitaly.wool@konsulko.com, rppt@kernel.org,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>,
 kernel test robot <lkp@intel.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: panqinglin2020@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_131725_844599_C9BA6667 
X-CRM114-Status: GOOD (  13.98  )
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

This triggers -Wempty-body, which will cause the next statement (eventually
create_pmd_mapping) to be dropped.  Both of these were introduced by the same
commit.  This is safe for the reporting config (which is 32-bit), but IIUC
could result in breakages for 64-bit configs without 4/5 level paging like the
XIP configs.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: 677b9eb8810e ("riscv: mm: Prepare pt_ops helper functions for sv57")
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
Might be better to define these to functions that are empty, but that's
slightly different than just fixing the commit/warning in question.
---
 arch/riscv/mm/init.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9535bea8688c..637916857c4d 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -798,13 +798,15 @@ static void __init create_fdt_early_page_table(pgd_t *pgdir, uintptr_t dtb_pa)
 			   PGDIR_SIZE,
 			   IS_ENABLED(CONFIG_64BIT) ? PAGE_TABLE : PAGE_KERNEL);
 
-	if (pgtable_l5_enabled)
+	if (pgtable_l5_enabled) {
 		create_p4d_mapping(early_dtb_p4d, DTB_EARLY_BASE_VA,
 				   (uintptr_t)early_dtb_pud, P4D_SIZE, PAGE_TABLE);
+	}
 
-	if (pgtable_l4_enabled)
+	if (pgtable_l4_enabled) {
 		create_pud_mapping(early_dtb_pud, DTB_EARLY_BASE_VA,
 				   (uintptr_t)early_dtb_pmd, PUD_SIZE, PAGE_TABLE);
+	}
 
 	if (IS_ENABLED(CONFIG_64BIT)) {
 		create_pmd_mapping(early_dtb_pmd, DTB_EARLY_BASE_VA,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
