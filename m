Return-Path: <SRS0=5jhf=NU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 754ACC432BE
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Aug 2021 09:47:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD579601FF
	for <linux-riscv@archiver.kernel.org>; Sun, 29 Aug 2021 09:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD579601FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=mail.ru
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hn9KYKAp4e56rDnC7sBVb42lFfQt4BcbMOdAHor4kkY=; b=tESNhVJ1WCsNCg
	tNvRmnuEP7xBWzz9YzddzQAmxSsIAV0hqIk+A2dq+2BEMQFOghdwUcJ7Nq9VYUuOS3L2YTh5DTMwh
	QIgsvcW3ux1yhPzb19ZXU6s5l0ejAkUU/0AW2Fw0v5XhizcHy54kvHbXVdGRhhzNwuF0iWh931GXM
	Y8egtLYJBFdjMlTH1JPPC+kfGSEZvZL6PcAe6zuWkTcgY+5qKWt6yVO7a+/OCneC4EJqF7NyGkp8X
	3dFRzL1RfHlInYJtvuV2cbuupj+eqHXRsuz1ISbE08cvTiBYmn25BgF3GjKLXyxiKJFTDWgVA5348
	3OUShVGMIh2rSalrpzyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mKHPS-00FKn9-AH; Sun, 29 Aug 2021 09:47:26 +0000
Received: from smtp57.i.mail.ru ([217.69.128.37])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mKHPO-00FKmp-O8
 for linux-riscv@lists.infradead.org; Sun, 29 Aug 2021 09:47:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=jSgGiOdf+fnG8IZ3m5jqLrr3KZTuRUM5lJGg/Rg++RQ=; 
 t=1630230442;x=1630835842; 
 b=iT2GtPLpXFsOWWRy6WQX1C3S3Hn/YGwcaq/lCTH2vUv/hP+AsrNQXgyFueP2BpGsOjjMy71W6L5EMOD9+/5IR3ZIVHqPD7YWWAa12PqTnT28kG0T2eldHvCGViDRtEJ1DnKLlcPcIX3AEkXrtSKOiTt8o0fxQGOp9xsbGOKxT0Dqf3CQhVfebPEQJwHL0suCKSB+Q7XRHed6sU+ZdZXX8ugZvjAuMtVUHtWGXA+KFYwEwXv26GR2zy2PmTGcyORW/BrVYwNCuEzSggjx5rFsSqwr1I6qLRH73Ofu2RGCua9S6l2KdoXNIItyDuPX8WTdzTQK14NY7XGWBo0810SmSQ==;
Received: by smtp57.i.mail.ru with esmtpa (envelope-from
 <cerg2010cerg2010@mail.ru>)
 id 1mKHPI-0001kD-J4; Sun, 29 Aug 2021 12:47:16 +0300
From: Sergey Larin <cerg2010cerg2010@mail.ru>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Sergey Larin <cerg2010cerg2010@mail.ru>
Subject: [PATCH] riscv: vdso: map data page before vDSO code
Date: Sun, 29 Aug 2021 12:47:08 +0300
Message-Id: <20210829094708.169037-1-cerg2010cerg2010@mail.ru>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Authentication-Results: smtp57.i.mail.ru;
 auth=pass smtp.auth=cerg2010cerg2010@mail.ru
 smtp.mailfrom=cerg2010cerg2010@mail.ru
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD92087353F0EC44DD9C4DAED859F16A63896D62C811FDE4A33182A05F538085040BA0EA00125E37A9F22939653C806C5B719B558F2DB1739A4AB7BD9F243933750
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7EC0B1A4921CAE631EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F7900637DB576DCB83B448D28638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8BC0AF3B7D3C2D437E3302B007B5D63036F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE71AE4D56B06699BBC9FA2833FD35BB23D9E625A9149C048EE1E561CDFBCA1751F2CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BBCFBAF3982895081A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC8326B808735A8D2F3AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F79006376ED5CA34E944229DD81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F9D50A20087A7B80B57739F23D657EF2BB5C8C57E37DE458BEDA766A37F9254B7
X-B7AD71C0: AC4F5C86D027EB782CDD5689AFBDA7A213B5FB47DCBC3458834459D11680B505B2981A6A9F07E118CDAF1ADB0D17A639
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975C4DDEBE0CC47FE269807F7A0C0B8FB85F8FE9946D354282099C2B6934AE262D3EE7EAB7254005DCED5BFF4D08790331081E0A4E2319210D9B64D260DF9561598F01A9E91200F654B02DA3D96DA0CEF5C48E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3480A9008907CB2FD0E90D0910254786C3E511D8228D2518DBA7891C5E7787C3C2844E4327ED33DE8B1D7E09C32AA3244C5535EF45B5F83C6CA36844B32FD77B577101BF96129E40118D5DD81C2BAB7D1D
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojMpcxcuSaa4FNKZyEh75SfQ==
X-Mailru-Sender: B6CA852314BECD1116C83C047D515D65625762A6D6A766E94843780C180FFDFADC955A227012B7B651913ECE9F5D4CE557914126969F3D9578C09B768FF42B7F4F0A872F021F9059A8B6234B51EB8B42EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: Ok
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210829_024723_191247_B81198DB 
X-CRM114-Status: GOOD (  17.26  )
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

Current vDSO implementation assumes that the code size always fits in
single page, and the data page follows it:

	PROVIDE(_vdso_data = . + PAGE_SIZE);

However, this was not the case with my kernel build - the
shared object had the size of 4800 bytes. This, obviously, is more than
4096 and requires second page for the rest of the data.

CLOCK_REALTIME_COARSE clock became broken. It was always returning 0
because vDSO code was reading the second code page, not the
data page. Glibc uses this clock for the time() function.

So instead of computing the offset for the data page (it is necessary to
do in runtime - you can't know the size of the binary while you're
building it) simply move it behind the code like the ARM does:

	PROVIDE(_vdso_data = . - PAGE_SIZE);

This commit also fixes arch_vma_name for the data page - it was
reporting the same '[vdso]' name for it in my case.

Since I don't have the real hardware, the change was debugged with KGDB
in RVVM and also verified in QEMU.

Signed-off-by: Sergey Larin <cerg2010cerg2010@mail.ru>
---
 arch/riscv/kernel/vdso.c          | 22 +++++++++++-----------
 arch/riscv/kernel/vdso/vdso.lds.S |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 25a3b8849599..0c49390e9be3 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -44,13 +44,13 @@ static int __init vdso_init(void)
 		return -ENOMEM;
 	}
 
+	vdso_pagelist[0] = virt_to_page(vdso_data);
 	for (i = 0; i < vdso_pages; i++) {
 		struct page *pg;
 
 		pg = virt_to_page(vdso_start + (i << PAGE_SHIFT));
-		vdso_pagelist[i] = pg;
+		vdso_pagelist[i + 1] = pg;
 	}
-	vdso_pagelist[i] = virt_to_page(vdso_data);
 
 	return 0;
 }
@@ -77,21 +77,21 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	 * install_special_mapping or the perf counter mmap tracking code
 	 * will fail to recognise it as a vDSO (since arch_vma_name fails).
 	 */
-	mm->context.vdso = (void *)vdso_base;
+	mm->context.vdso = (void *)vdso_base + PAGE_SIZE;
 
-	ret =
-	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
-		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
-		vdso_pagelist);
+	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
+		(VM_READ | VM_MAYREAD), &vdso_pagelist[0]);
 
 	if (unlikely(ret)) {
 		mm->context.vdso = NULL;
 		goto end;
 	}
 
-	vdso_base += (vdso_pages << PAGE_SHIFT);
-	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
-		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
+	vdso_base += PAGE_SIZE;
+	ret =
+	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
+		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
+		&vdso_pagelist[1]);
 
 	if (unlikely(ret))
 		mm->context.vdso = NULL;
@@ -105,7 +105,7 @@ const char *arch_vma_name(struct vm_area_struct *vma)
 	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
 		return "[vdso]";
 	if (vma->vm_mm && (vma->vm_start ==
-			   (long)vma->vm_mm->context.vdso + PAGE_SIZE))
+			   (long)vma->vm_mm->context.vdso - PAGE_SIZE))
 		return "[vdso_data]";
 	return NULL;
 }
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index e6f558bca71b..fd8a31075256 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -8,7 +8,7 @@ OUTPUT_ARCH(riscv)
 
 SECTIONS
 {
-	PROVIDE(_vdso_data = . + PAGE_SIZE);
+	PROVIDE(_vdso_data = . - PAGE_SIZE);
 	. = SIZEOF_HEADERS;
 
 	.hash		: { *(.hash) }			:text
-- 
2.33.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
