Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1482C7EE2D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 05:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5kdiJq1056w7Z4FMVJV+9w5Plbhp6ZduH4q3c2c3opY=; b=SnbpYZvSVauUGW
	0kHkEy0afj/+qsaA7usUfCIBhhBDTQkYBNmYcKXeDtHFca4PSf0CPju3BB1mMQcEC/FyZOWClekrf
	jJD0NNHnToXt//njR6UYVyf55B6tfKdgiFe/KKl2mjhx36oqfStzSqZlcaPVoB93O3JqvBnzuKxMf
	V5IkcYEklUyfGJSynsKDSohLBfTDyrED+U3f0ue8fnJ1VoeHI5HyljA5TAEzOXSYdDGYxItIwDdkt
	uJRKMEw+zEub35VLlHPqZ1yO1yKE8XmRKToe3LjmtiYtc0qFgCqqGBiDyLGmQWzTOwc5vDEbD8ay7
	MVMOAdlxc3zjKvVt8cwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwc5O-0057D3-2N;
	Wed, 10 May 2023 05:09:58 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwc5L-0057Bf-2F
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 05:09:56 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-559f1819c5dso101998087b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 22:09:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1683695395; x=1686287395;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UmemeLuI+WpEQXgz9TQT0mwehV8FTU9BDTa5EhoH+Rw=;
        b=ceZayvLcQzK/jEmDGFktdiBeLmAfZAcJomtj6b8LZ7UVBhK1PGvRLGtv3raaIkoA69
         8du4wIfy3LTg4noNW6T56a8rTdYN7Kpn5/bm4yjB4emMMTggN1PcgpP7ET0zc6Ogox7V
         PacpXMb40YNuRMAqf3IboaGbQzDmk/4AhKXM1jLiRZe7o3tGAOJ6z3OSnXWDEM8MmOjy
         leDcr9V/CMd1mPfM2iHPwMwcuDGyHWo5yaj5bkj6ZD28Zg+yk0+3HzvQJBuo9qxnWea2
         qCcGWwBxF4a0/bB7X0FeLhxKH1U3vpEQVW9dVdnIidnAwcXxE3l++8L3bRK0NJ7IyPS8
         JZIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683695395; x=1686287395;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UmemeLuI+WpEQXgz9TQT0mwehV8FTU9BDTa5EhoH+Rw=;
        b=KTvNZayr6EQFtU1C71RXoqYFB7w6gWIRMTnoAXjgs+ZvXd6RJVOthrvfYDSgrO2gsj
         6BoYBZBDIiZ1hXsRogLHtkWOhrcsh31YhOU6rZKp/aJAjIS7EdLjqh2cnmo0kiUGG8kx
         VAoiRCBg09fYnlsaryT1cDCVqYjgN9Ovqt/6h3meYyjenfHB6HKazzJVTo6gMSnVQ2dl
         N3m2Zv4qgN4cEAo81aGEttBjPHG2EtZKnYzRo0vZquJSLg9Isa8YEcPdLcD4hBCnBzuB
         2cNO2kAv/j5fGHRz3MKCUm3A5KqpY/q5Qg9OTeatQEECvsJw9G5Y7DJi9JwcYqYjuRzp
         VYvQ==
X-Gm-Message-State: AC+VfDwoROS1afcB16lj/1YH7CT1L39Y9nATA80ikSIJXWeqcpn36J5a
	F7qzkeZkgI5B6KG2M9hvWayPNg==
X-Google-Smtp-Source: ACHHUZ6AHFxady081B2wan1G2AdvRI+je11F7XC2fK+PaWqaZjZVH5+mul53az7NeaRbK79eLrDOFQ==
X-Received: by 2002:a81:92d7:0:b0:55a:4828:182a with SMTP id j206-20020a8192d7000000b0055a4828182amr18309481ywg.36.1683695394676;
        Tue, 09 May 2023 22:09:54 -0700 (PDT)
Received: from ripple.attlocal.net (172-10-233-147.lightspeed.sntcca.sbcglobal.net. [172.10.233.147])
        by smtp.gmail.com with ESMTPSA id l64-20020a0dc943000000b0055aad7d3f34sm3766659ywd.142.2023.05.09.22.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 22:09:54 -0700 (PDT)
Date: Tue, 9 May 2023 22:09:50 -0700 (PDT)
From: Hugh Dickins <hughd@google.com>
X-X-Sender: hugh@ripple.attlocal.net
To: Andrew Morton <akpm@linux-foundation.org>
cc: Mike Kravetz <mike.kravetz@oracle.com>, Mike Rapoport <rppt@kernel.org>, 
    "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, 
    Matthew Wilcox <willy@infradead.org>, David Hildenbrand <david@redhat.com>, 
    Suren Baghdasaryan <surenb@google.com>, 
    Qi Zheng <zhengqi.arch@bytedance.com>, 
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
    John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
    "David S. Miller" <davem@davemloft.net>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org, 
    linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
    linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
    linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: [PATCH 22/23] x86: sme_populate_pgd() use pte_offset_kernel()
In-Reply-To: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
Message-ID: <6d75e7f-2266-1dda-8a70-c52c27f44da7@google.com>
References: <77a5d8c-406b-7068-4f17-23b7ac53bc83@google.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_220955_735458_1C2BC325 
X-CRM114-Status: GOOD (  14.18  )
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

sme_populate_pgd() is an __init function for sme_encrypt_kernel():
it should use pte_offset_kernel() instead of pte_offset_map(), to avoid
the question of whether a pte_unmap() will be needed to balance.

Signed-off-by: Hugh Dickins <hughd@google.com>
---
 arch/x86/mm/mem_encrypt_identity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/mem_encrypt_identity.c b/arch/x86/mm/mem_encrypt_identity.c
index c6efcf559d88..a1ab542bdfd6 100644
--- a/arch/x86/mm/mem_encrypt_identity.c
+++ b/arch/x86/mm/mem_encrypt_identity.c
@@ -188,7 +188,7 @@ static void __init sme_populate_pgd(struct sme_populate_pgd_data *ppd)
 	if (pmd_large(*pmd))
 		return;
 
-	pte = pte_offset_map(pmd, ppd->vaddr);
+	pte = pte_offset_kernel(pmd, ppd->vaddr);
 	if (pte_none(*pte))
 		set_pte(pte, __pte(ppd->paddr | ppd->pte_flags));
 }
-- 
2.35.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
