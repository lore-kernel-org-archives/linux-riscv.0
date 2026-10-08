Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08D17CA600B
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Oct 2026 07:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQQfiC2GgpG/MLbJkp86Arg+Pg/2sm6Di31NBOg5ekA=; b=wiyl11es6ngK6F
	LZyz/6DBIWp5zqh49c3dd09UoxgLnojlRfvl5hpdkQQ2ahM/ximFgETOC9YgG1Jv52dJku61+d4Hi
	CPSGk9p148BO26MF7vwrZo18n7neTd92j8DOE7Fr/1GcTOB8fMnB+JKiKiUJbFhfml64l2hVUcu0/
	7Vl3fMxhmspesV88I+BgUF03CyhFUZDhH/wlkso3ztPOOFXxGDuuO3wf1XS9EJfmyNkxd5J/nkZcF
	jY9urbE0+wmJ3zK/lgzp+cNL+VtDs/t3FS2ffEzz3m0arqeqD+qazGYz7WZAA8Mn4F8j0O1H6oVRK
	t3qv+VjDqNsX4IPkaRXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaY-00000003kcx-2S8S;
	Thu, 08 Oct 2026 07:30:50 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEiaW-00000003kaM-18hO
	for linux-riscv@lists.infradead.org;
	Thu, 08 Oct 2026 07:30:49 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-ccce967aa8dso2113748a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Oct 2026 00:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1791444647; x=1792049447; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=;
        b=BABKwXyqi8VMVWvSrxxrCTOzGbYXGyx04JDTZOoMm5jyY+WgviQc+U3Al3izW8lYIx
         u7abdrSxiwJk848SiNlNoyDrRj88yliado4cimebresp5jzmuXh9YVGlv11eNb/ST+Q1
         /sccXyXUfOU/dAN9IwfBVR24eIk4PziHVfBG2+sBzXxvmVNe/5M1aZdn6uYDKRYsI8lw
         XUwx8DoySUF5A1OAgXt+JsuwDw/yoUgB6I8dDZjZIdDCt493nc4GiJ4dfH9YAgv7sFR0
         +246exzALsV0eeI6dLWtKy4ig9WZ6K94Y9lwPFwt6t01xeTQEvL8435AQVYjvIhko0q8
         5N7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791444647; x=1792049447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7XwukL8/yd82nFdVG9qm4VBZNIyM/fBMMvZK+hA2jjo=;
        b=XvBuxKD4NjqhAtsr4fVCmUaLwxPMFby5Sc1qhOjB5zIOmp6uY9usHVbJqkmAvJchQh
         iVpFmGCpFE6yeIswVqFdPzpdG002hZnnyEAFfW1c4XXh9tY4ipR6/8A/s+P0JFlVY2HO
         qWG91oQMIr4TNXa97InAt/VpDM4nUzzN9iKqoTroflJSk+1KIgGVo91/fw2dX5BuANen
         G5hYyA1OOr1NrqsTJUeJZYAOYJo+acpb+K2znU+SHqGP5fvQGtLF9VQWX8h4QzPzBn5u
         4tgX1Fs4N5Q9OnEqnlLbcUoAK+Cvs6H2XnxTuhAkV1DlxlPrLBNoC+6qUGtwZK99w8qA
         9tpg==
X-Forwarded-Encrypted: i=1; AKwUvBzL+47++l6KR6K6KMT9FW7EU68P5rdwpXx3/cfdqwaxiUXBfl8UnRBdiLn0GRbNqS8Kwz+5/f0HWCtY9A==@lists.infradead.org
X-Gm-Message-State: AFq9FYINUYra4LoXavBWOO80a3WRR0hegT0ztyy7JPI4yOzbWo5Jq4IS
	GCrbFCW+osjRRAIyqaiywSgeNEAYMho3T6ymKi/GEHXxjH03LlzdyiosZGojDmOebSg=
X-Gm-Gg: AYBFou1kbyrEhC+ibQqBlN5kbewIQdy8MxxiLfe+hpTQ7jD3oRPVSpRdxDSKh/JU89n
	ewn9IsBulT9G5jIkVHPpdkEKLZ6sniIUA4kfAbIytyBMAWWeUyA2owGk8uFR2xpvWVx8gexq8Cl
	K4v2rUhsLGTC1Yfzy0QKwrc6knNbuoKtDcrWSE0rAwI6YlC4sqlQ2gzO5jj3MKZxXSmuXdQ+IU8
	sWIbZzUsQy3eWQeh2Z4FDPif6/VzJr+CeL4aAIOofKNjqxZn3noTkDhg4dOxgUXCCLG/J4d9fin
	3sEzHHourSdK2AiR5P0XR21yWLcPMS7v5JW76CCJ/xYYwCJ97qJZvf/uHjATgySQJfzhjHNqUf/
	FqsPAln3NHnwjVj0g6z1xGzq8NUOTYVZ/ArPrKpiNZvNy4uzpJ639lhpgR/6QXZbFAxoNmXr0gz
	M/T1D0ZwioaDhXSMamLoX9AU7sib0/cqVWFWyt3s7VKQ1wWgDv/DnKu1byeRxVuxIxQF98ESusn
	NUccqtDkhmxOF5fhBU=
X-Received: by 2002:a17:90b:2652:b0:3a7:b260:9cc6 with SMTP id 98e67ed59e1d1-3a8a1b91be4mr3069089a91.42.1791444647313;
        Thu, 08 Oct 2026 00:30:47 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.99])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a8a438f25dsm3114715a91.2.2026.10.08.00.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 00:30:46 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org,
	stable@vger.kernel.org,
	david@kernel.org,
	osalvador@suse.de,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	x86@kernel.org,
	hpa@zytor.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	agordeev@linux.ibm.com,
	kevin.brodsky@arm.com,
	bjorn@rivosinc.com,
	apopple@nvidia.com,
	linux-kernel@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH 2/4] riscv/mm: fix hotplug page-table destructor handling
Date: Thu,  8 Oct 2026 15:30:19 +0800
Message-ID: <20261008073021.2512665-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261008073021.2512665-1-songmuchun@bytedance.com>
References: <20261008073021.2512665-1-songmuchun@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_003048_316199_60058C4D 
X-CRM114-Status: GOOD (  12.15  )
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

RISC-V uses the same memory-hotplug teardown code for the linear map and
vmemmap, although their page-table pages are not always allocated in the
same way. Late linear-map allocations run page-table constructors, while
vmemmap and early allocations may provide constructor-free pages.

The PTE path unconditionally runs the destructor, which is wrong for
constructor-free vmemmap tables. The PMD path avoids that problem by
using is_vmemmap as a proxy for constructor state, but that assumption
will no longer hold once runtime vmemmap allocations use the normal
pgalloc helpers.

Page-table constructors record their state in PG_table. Centralize
page-table freeing and use PageTable() to decide whether the destructor
is required. Keep reserved and constructor-free pages on their existing
freeing paths.

Fixes: c75a74f4ba19 ("riscv: mm: Add memory hotplugging support")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/riscv/mm/init.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 857f9a55039c..429a0b015ec1 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1486,10 +1486,19 @@ struct execmem_info __init *execmem_arch_setup(void)
 #endif /* CONFIG_EXECMEM */
 
 #ifdef CONFIG_MEMORY_HOTPLUG
+static void __meminit free_pagetable(struct page *page)
+{
+	if (PageReserved(page))
+		free_reserved_page(page);
+	else if (PageTable(page))
+		pagetable_dtor_free(page_ptdesc(page));
+	else
+		pagetable_free(page_ptdesc(page));
+}
+
 static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 {
 	struct page *page = pmd_page(*pmd);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pte_t *pte;
 	int i;
 
@@ -1499,18 +1508,13 @@ static void __meminit free_pte_table(pte_t *pte_start, pmd_t *pmd)
 			return;
 	}
 
-	pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pagetable(page);
 	pmd_clear(pmd);
 }
 
-static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemmap)
+static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud)
 {
 	struct page *page = pud_page(*pud);
-	struct ptdesc *ptdesc = page_ptdesc(page);
 	pmd_t *pmd;
 	int i;
 
@@ -1520,12 +1524,7 @@ static void __meminit free_pmd_table(pmd_t *pmd_start, pud_t *pud, bool is_vmemm
 			return;
 	}
 
-	if (!is_vmemmap)
-		pagetable_dtor(ptdesc);
-	if (PageReserved(page))
-		free_reserved_page(page);
-	else
-		pagetable_free(ptdesc);
+	free_pagetable(page);
 	pud_clear(pud);
 }
 
@@ -1645,7 +1644,7 @@ static void __meminit remove_pud_mapping(pud_t *pud_base, unsigned long addr, un
 		remove_pmd_mapping(pmd_base, addr, next, is_vmemmap, altmap);
 
 		if (pgtable_l4_enabled)
-			free_pmd_table(pmd_base, pudp, is_vmemmap);
+			free_pmd_table(pmd_base, pudp);
 	}
 }
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
