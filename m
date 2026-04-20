Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57B21EA71BC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 04:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OP1Ys0ZSqrsUFnHXkVlT9kSto/i2q0SuFByUdoS0OBg=; b=Muq0Qqn9Tvpwxm
	QbntowoG1JVn4cHqCJ2oAQfvePOBfF9TNTk6rUjPa4732zuYArvZ6t3/PVKFXUJU0Co83fNbKvjOl
	0nFwkFpYGl0OVQpR5umpduiTfbxNRluaDXVAAzmcS5K6hQi0rps6m/0RddebclF+fWh+gtQW/Abn2
	Ku9+j1dLL9ofamwJDriX8WHByQXw/LW4ruu4vL+KCeZAkpcMZ1NZcSzTEvBhPkaGt9769zO3wfXcE
	AxQsB18TszY7rPDl5zhqbaUbBnJ6D28IsLVO12gHOxdArdlcC7js582KSBdg8tFFodxPSZ7ZBbiz9
	w7/vSKOeYeXQQuKLBXOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgjZ-00000006QLR-0Rj8;
	Mon, 20 Apr 2026 04:59:46 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEgjW-00000006QL5-0o2i
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 04:59:43 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so2514491a91.2
        for <linux-riscv@lists.infradead.org>; Sun, 19 Apr 2026 21:59:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776661181; x=1777265981; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jyZQrY+lfsRgljtAFkCrJnmLZI0e3pi10ZTaBJ1VhuQ=;
        b=DqrbTNn7G1sEcW4cUe/w+Jbcr6DqQiP2hxXG1nijxDTqrgHO/kNQRtr0WgJaTdQBiy
         UZvwPfuo2ohASh53DRFDpq9pD06qTbmHhIVcY2vsi1y9sxO9M8fmi3W3186jHpx6CDw9
         vpT0+hsIsPeI1oAXjLwWCR24GZdw20FZXnO6BNMGo+11LWaYGPqhvGDLixWkeS1GhKi4
         y00YLo2TP55dtIrkfNfOcWBBRnh7Ro6Ot+6E3zwGdhsM3grJpgf/XYY2IWkdUjYE4CX6
         4fzAte0SbtHtVeMBq+3oCED8/Vw0McX0yS1hVlnWQ+KHlD/dS1YiCL83mi+u2SeopjrJ
         jDxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776661181; x=1777265981;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jyZQrY+lfsRgljtAFkCrJnmLZI0e3pi10ZTaBJ1VhuQ=;
        b=ElHjJKaNCDO8kE3bf7o26vsK3bCOTtsbPGIeQOuaIQtxR0dA4Ae71QbRjLQnfs/nOp
         QgiXkncGJQhT4m9fqoPjQfAQPhNhGQZRgK8J7YoC6uKm81uGqZMbYNIJOSYNcNnd63lF
         YC37szI+k+2THNqqk1jNQER9XckATFjL5rwnzIkD3JE/moTD6PGHTbIS0WY6FaY+8m92
         RR4ZUTZtxcSKOL95xsfdcgUn0T/4gkhaA6nRNjxY8MAcH5Zo72DdfFGiBoX4ZfOw5yaS
         tGouyn/DB9B/QIst9UMJXPSrEKlsysT+Alj9OF82HDj4si2WbeKmtB4kxwiLKyEVbuNE
         HdrQ==
X-Gm-Message-State: AOJu0YzGUCi8OUinWko5j0J4Nx6hJ10NDcJJ+SYJizhiPhFsAbeAN0Um
	j1Bm3QSxKWGQ3RrF5+xW1FTZs5hlGOJK766lfQXM1yu1dtgxwWknGK+8TAsoWJFW
X-Gm-Gg: AeBDiet4I3odiYEQEavEY4yqjNyr+78LkyXuWblToGxl1E8vQ3N0rKC8l/piUZPHKl5
	nc70yeDOfb9r03lxA9gcPNS0fiYYGGgjZ+HKR87Y0XftCXfTgg9cwt1Ed9nN/77mZfxnoFohPzN
	I5an/jIVSUX9dI1/SApKsCBJ51HBKcWlwSqMKH17Abwwp8RznQARqlPaSb81n2WrdhcdONiZcqi
	un5yR054zVogeT+kbX2AoknFXBTtmwyjan6w+hmp+XVrX78g1rOBWJPh3mm1kLK7H8ZImaKctpu
	TWP8vfcp6WjsMQy0qGDWUHm2kHMUpL69v65ePPlFT3Z7mPOBCnoy4AOFctkFYnNvm30Ni96yN4g
	QgtTD5q7RFkPfg6bM6LQXiT6t9KJZwxvFvsUgxF1TbJysDFeS3o7RQLuqfaS4yREAexanTRBSgO
	+X/VM+2USYNy4t7GHejUW0KruN2Ln5U4xxLN6DyGk/H9SEKm7AWQ==
X-Received: by 2002:a17:90b:3c48:b0:35f:9ab2:a5c2 with SMTP id 98e67ed59e1d1-361403af9b9mr12611390a91.6.1776661180809;
        Sun, 19 Apr 2026 21:59:40 -0700 (PDT)
Received: from adminpc-PowerEdge-R7525 ([27.122.242.81])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141869e88sm8742825a91.1.2026.04.19.21.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 21:59:40 -0700 (PDT)
Date: Mon, 20 Apr 2026 13:59:36 +0900
From: Austin Kim <austindh.kim@gmail.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	austindh.kim@gmail.com
Subject: [PATCH] riscv: check leaf entry alignment in pageattr_pxd_entry()
Message-ID: <aeWyuC3nXrP9McNy@adminpc-PowerEdge-R7525>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_215942_377641_C43EF09E 
X-CRM114-Status: GOOD (  10.66  )
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

During page table walking, ensure the range being processed matches
the expected size of a leaf entry (P4D, PUD, or PMD). While pxd_addr_end() 
functions handle boundary checks, they do not inherently validate whether 
the entry is a leaf node of the expected size.

Add WARN_ON_ONCE() to detect misalignments or partial updates of huge 
pages. If a mismatch is detected, return -EINVAL to prevent potential
corruption of page table entries.

Signed-off-by: Austin Kim <austindh.kim@gmail.com>
---
 arch/riscv/mm/pageattr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 3f76db3d2..1461bf77f 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -32,6 +32,8 @@ static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
 	p4d_t val = p4dp_get(p4d);
 
 	if (p4d_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != P4D_SIZE))
+			return -EINVAL;
 		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
 		set_p4d(p4d, val);
 	}
@@ -45,6 +47,8 @@ static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
 	pud_t val = pudp_get(pud);
 
 	if (pud_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PUD_SIZE))
+			return -EINVAL;
 		val = __pud(set_pageattr_masks(pud_val(val), walk));
 		set_pud(pud, val);
 	}
@@ -58,6 +62,8 @@ static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
 	pmd_t val = pmdp_get(pmd);
 
 	if (pmd_leaf(val)) {
+		if (WARN_ON_ONCE((next - addr) != PMD_SIZE))
+			return -EINVAL;
 		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
 		set_pmd(pmd, val);
 	}
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
