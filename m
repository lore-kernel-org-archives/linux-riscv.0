Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA81C7EE2E
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jun 2023 19:12:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BonDEGVBie1acRfhC0JQqZWcaanA+gkr9R8IsdnxZI8=; b=MGWSRJZmgPz/No
	2wt8A2BdxBB420n7d+EPrS9b4XfnP+/1Hls374d7lnlq6NcfMeX6DXG138oQdtUwl3L+iDpmzyg9Z
	pNIgG1/Y4TaeefXkRJVH+cjwGgel9uXMUFQmOB0ht/oUZAtzzvv+oBized1sX+QDekgzSHn1Hkqf2
	3FUFIX0aVU+T+TB4RpBNTte7LBAmVw/dR5xikxPgitbzQL2lmbw/WdU8y2KXCYUXwDj/64iYnOU6z
	2BbLbmpCoSCCU6RSgtvRtBcAYhOdTayDBy44KhVSfQBHUxAYkvG6Zh8w9A5iCIunc/LH2jKX9zjf5
	BHPFr3oWUMKNspmav5EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L3M-00AHGi-07;
	Thu, 08 Jun 2023 19:12:12 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7L3H-00AHBP-0m
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jun 2023 19:12:08 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-565de553de1so14703687b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jun 2023 12:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1686251524; x=1688843524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zVLRceEeXaiGvlgxdYbIgAo+AcDyW1dS+jDGBb+h1UA=;
        b=1l3g323zHExDgYGww0zFXmVgic3jDwyc0JAOaU14MB4NUoruSezWtFEVocvA8VR+wP
         D+bOPBhVpeN5TR7Q94HiD/7UXFwgvkn75HwqVtdM3hi/WhalPJUwiHRXSp3bpeKIuRdm
         orIqBvL0rae06pUEOxuRX8a0MpgqpKjI5TTzLJ98WQmBBEIDz4RhToD7qotfuISdygmL
         gKqyyQ61v8JQcZhpfriPzCyTWiXBbfQnLuFCKxtspZkjhV60I7fgSoyr0iHs2+KGMqLW
         csaRWwWg7YMEgY5GV8POPk7y+6y3olAQXOM6liWFfJYYRJ0sFo+4jM2u98tnCjYnFP0Y
         93kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686251524; x=1688843524;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zVLRceEeXaiGvlgxdYbIgAo+AcDyW1dS+jDGBb+h1UA=;
        b=GOEg/cNX08a47nVKFkvrqZhseqfaEl+01jzjeEH+oCNhEZW3K1ffTCTw/zHN29Gagy
         8CZUzQSkTj39dcoyM3Lt7KCOO543T4sAhAK21IRE/eDDqmzF1DycmGuJNH9hRDCmpny5
         8eEBv6QjR/1j3QR9N/iPvZqL1ODj+cQ5dJoxsRGRqI/bKebm/v3RRuy7aFQc9FjZbp1t
         Hl0HgJjUKex1/Ry3qaoxwO/5YO7Ja02QWqrK7sgZm62VxIeppO1YuW7Ts9YkG2vQn8y5
         DPx78xMtFc3HqIGOA4be2vM8DGMOYgQ9zMtTBIA5QugInlzAh2aGzrK5lBEV5yL+DMLB
         oD/A==
X-Gm-Message-State: AC+VfDxqQS3srQ/MDHe/JH5rlh2sjYXuaeZ5PVtEOxbJ+86IvFuBblIK
	rY4vrPpsxeP3MJS3dsk3FwwnhA==
X-Google-Smtp-Source: ACHHUZ6kOJKeygbedx9f6pcNR03LNZvYC4ZecjCRxiqOz1IuKMf5mVIHIRdEhOcWlcOzm+o3M8bu5Q==
X-Received: by 2002:a0d:ead2:0:b0:569:ec03:14eb with SMTP id t201-20020a0dead2000000b00569ec0314ebmr668029ywe.23.1686251523870;
        Thu, 08 Jun 2023 12:12:03 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id d144-20020a814f96000000b00559f1cb8444sm106718ywb.70.2023.06.08.12.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 12:12:03 -0700 (PDT)
Date: Thu, 8 Jun 2023 12:11:59 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Russell King <linux@armlinux.org.uk>, 
    Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
    Geert Uytterhoeven <geert@linux-m68k.org>, 
    Greg Ungerer <gerg@linux-m68k.org>, Michal Simek <monstr@monstr.eu>, 
    Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Helge Deller <deller@gmx.de>, John David Anglin <dave.anglin@bell.net>, 
    "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
    Michael Ellerman <mpe@ellerman.id.au>, 
    Alexandre Ghiti <alexghiti@rivosinc.com>, 
    Palmer Dabbelt <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>, 
    Christian Borntraeger <borntraeger@linux.ibm.com>, 
    Claudio Imbrenda <imbrenda@linux.ibm.com>, 
    Alexander Gordeev <agordeev@linux.ibm.com>, 
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH v2 02/23] arm64: allow pte_offset_map() to fail
In-Reply-To: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
Message-ID: <35e46485-8499-4337-c51f-b8fa495a1a93@google.com>
References: <a4963be9-7aa6-350-66d0-2ba843e1af44@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_121207_279811_8AA23DB4 
X-CRM114-Status: GOOD (  11.53  )
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

In rare transient cases, not yet made possible, pte_offset_map() and
pte_offset_map_lock() may not find a page table: handle appropriately.

Signed-off-by: Hugh Dickins <hughd@google.com>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
---
 arch/arm64/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index cb21ccd7940d..f3aaba853547 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -177,6 +177,9 @@ static void show_pte(unsigned long addr)
 			break;
 
 		ptep = pte_offset_map(pmdp, addr);
+		if (!ptep)
+			break;
+
 		pte = READ_ONCE(*ptep);
 		pr_cont(", pte=%016llx", pte_val(pte));
 		pte_unmap(ptep);
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
