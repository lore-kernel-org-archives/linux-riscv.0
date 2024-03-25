Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22142C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 11:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KpSxSvvafRwFnlJd1/YsjaJg93HoYyUN1Gxvt1du5vM=; b=E7HZk6335yVHZk
	Rs/MkPcYoxadDxE6/LVKlhJJC4lvR0PZ8r2BF8QH5UHaYdqqZXG/NpbZSe0QOc6R//lLM9TQMJTXa
	q17PfNqgObEf3SivnyGQ5WcDeovgXzzJ9JszSQOa8SWyg26v+zZfxPb9ETGBXfo2NH4S5CiKwd3eD
	VhWN0wkqsKSoEeHy8rCi1jmMjSrv9JtOy+UujrozLxHaQkpAaiItTDnEVgCWrfyfuDBqDWbUompcN
	r9EnFg9X5BTbPwkTvlqaQSThAUOF+T9TCKqRt2RYG7C0qBnvHp6H2bp5btQphyntkvv7dnPqAP+00
	DBk4fV+5Oaj0YMQuNsqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiBc-0000000GwcY-48v9;
	Mon, 25 Mar 2024 11:08:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roiBa-0000000GwbS-13iT
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 11:08:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 29530CE1303;
	Mon, 25 Mar 2024 11:08:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EE0C433F1;
	Mon, 25 Mar 2024 11:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711364891;
	bh=mK+a5fKSHAosIJ1vD42jVSju6aNIvU/ovsSMpFBzTcY=;
	h=From:To:Cc:Subject:Date:From;
	b=XTNU6iQCNHH0nf4EJwPkJQJ4Y7Q2vDWDhLL4ldDBVvtm7CAZBiEHtbrfLEdZTw386
	 zyDHEF8tzhEyizMK2ln7iZU/WOs3UxnTQ1X9DnCIU5uCtVt2LgFAysBHsTxpvLG8Y5
	 gZwi1hKkG4TYngUyw67VhKn5NA4kB/uC8/HGJG96dxHFKYoEhYdkTXNCdtldoEO+YF
	 0s0g5nCKiXvoUZXW/r+1hYRavWDKohfetk+wXYa4/FNmukCVygZYHvsn11XBBp7wQ/
	 rArulJehFnEQSPpcNIiXQVdjGkGfmhv3UluA3E3QpnndGANNxikA/BLpvuPsJHYeOU
	 sE161vCVQg7Sw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v2 RESEND] riscv: mm: implement pgprot_nx
Date: Mon, 25 Mar 2024 18:54:56 +0800
Message-ID: <20240325105456.1338-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_040814_512156_E2AB7698 
X-CRM114-Status: UNSURE (   7.78  )
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

commit cca98e9f8b5e ("mm: enforce that vmap can't map pages
executable") enforces the W^X protection by not allowing remapping
existing pages as executable. Add riscv bits so that riscv can benefit
the same protection.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Tested-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---

Hi Palmer,

This patch missed two merge window, I.E 6.8-rc1 and 6.9-rc1,
I'm not sure whether there's something to be done from my side.

Thanks in advance

since v1:
 - rebase on v6.8-rc1
 - collect Reviewed-by and Tested-by tag


 arch/riscv/include/asm/pgtable.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 97fcde30e247..9f8ea0e33eb1 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -593,6 +593,12 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
 	return ptep_test_and_clear_young(vma, address, ptep);
 }
 
+#define pgprot_nx pgprot_nx
+static inline pgprot_t pgprot_nx(pgprot_t _prot)
+{
+	return __pgprot(pgprot_val(_prot) & ~_PAGE_EXEC);
+}
+
 #define pgprot_noncached pgprot_noncached
 static inline pgprot_t pgprot_noncached(pgprot_t _prot)
 {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
