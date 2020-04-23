Return-Path: <SRS0=uwsC=6H=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB26FC55191
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2020 08:05:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E75121582
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 23 Apr 2020 08:05:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tLwjHHdN";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="FMgw01UQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E75121582
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:MIME-Version:
	Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yqMRQQUo06Gp5wykVDSHjsRLbCKiSR/iLbln0mYeCi8=; b=tLwjHHdNJ8j6AP
	2WAu75ATD3OeK9d+w9XmZoDTfjjxjXgNTre87thxJVMBpWXO8+jm+mkw6j1n9Au/V8bZ7+Gd+YjtB
	+1Hb81ryygNKJgyPgmFXB0WMstUvY36g8WQPiwmP4yxtKJ8VRLSGiGIDgkHQOyIKy881hOTKH1uui
	8+jnp7qSdK1rQxtk6RUfYpgAKNEnbxhbfi8pvFsPzs2gF3d5HYS0KgkMQp7iSBqP1czEhPhsFfpLR
	kMeOqCCrM08HIsvsivg8MNbR6xU9UWvchXEr2AKahBQP+Ln58GyJitEZR3oO11WGFRLc3G8R3nDPY
	rcYZ8aT05nA0o5tZEVfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jRWrT-0002kL-9c; Thu, 23 Apr 2020 08:05:31 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jRWrO-0002gD-Pi
 for linux-riscv@lists.infradead.org; Thu, 23 Apr 2020 08:05:28 +0000
Received: by mail-pl1-x644.google.com with SMTP id f8so2063990plt.2
 for <linux-riscv@lists.infradead.org>; Thu, 23 Apr 2020 01:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=yqMRQQUo06Gp5wykVDSHjsRLbCKiSR/iLbln0mYeCi8=;
 b=FMgw01UQvx5nZfp5nrtWYCVbxz8si/VGSY5ZeEve0EMjjjAU3y1rDWMtH8+FilGDdJ
 Ut9rEladvsj00j7u8JEIU/whdwCgk7kkMS7tNzekWW2FbICLT4Eh2F7wUvoWWuB3odBK
 FxLr3EIfp/7rU7gHLF/h3yOUQ4x24kKlwkitiNvmJ9J6pmuQFTrj1WeYjmarYlxgvGdK
 SZ2tuXxm67AzQy3L9EkzbokqJsQOX2X70AJmSTEPCNQ0sVNQ+o5MfD7csgQIr+q5Rf8q
 qowxZ/uiQuUY1n28PC0FsqOtkmpRGbHadvXQCGU08xoCC7ODh4sfGrYZKfwg1TZpWlrL
 U+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=yqMRQQUo06Gp5wykVDSHjsRLbCKiSR/iLbln0mYeCi8=;
 b=fSqSYZKOcfNhhZhEk/wXpnCNf3RrmPf30bwFk2TbvhIPr0FNycsU3l1sTE8z4crTw+
 1LudQEB8xwUFciM8+Dgy5KG2ePAR1s3ZxqynQVL08rCUpt8ucs6XtiP+tdYZlMGXG6eq
 65CPEsJXc9stC+WFn5IyLcK8lGC/WqWibLpQiXVxURACP6Kw6EIatcbPWRlNHKUUqT+b
 7RGKEFOiCvJZtSttdhJKFxZuTJL82aZAIxs6cVdsWtZXM7P1y70JS69lmSKtSMvb/fre
 PNkrPytmJtWHC5qQdg8fVBOuuH1924e/XHMsuRgYJ15GkIGil9BVNfeavuNpBb6YTT+n
 3WaA==
X-Gm-Message-State: AGi0PuY8CEaGQcRvTDdLH0QvZgSyMjPL1b8GG8b/3bj+Y6U0iIo+lDy5
 dhcA4eLpbEiXSseUswrGTuQgOg==
X-Google-Smtp-Source: APiQypK8R/CsL/9Q5fezObatvImNiS/2ZoFZfs/5GXYTgnD0oBnyW+BZRE70X8bBiwytk09fuzyMoA==
X-Received: by 2002:a17:90a:25cb:: with SMTP id
 k69mr2970238pje.93.1587629126131; 
 Thu, 23 Apr 2020 01:05:26 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b29sm1820779pfp.68.2020.04.23.01.05.24
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 23 Apr 2020 01:05:25 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com
Subject: [PATCH v3 2/2] riscv: set the permission of vdso_data to read-only
Date: Thu, 23 Apr 2020 16:05:04 +0800
Message-Id: <1587629104-12119-3-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1587629104-12119-1-git-send-email-vincent.chen@sifive.com>
References: <1587629104-12119-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200423_010526_917029_7E2B32B4 
X-CRM114-Status: GOOD (  10.93  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Vincent Chen <vincent.chen@sifive.com>, linux-riscv@lists.infradead.org
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The original vdso_data page is empty, so the permission of the vdso_data
page can be the same with the vdso text page. After introducing the vDSO
common flow, the vdso_data is not empty and the permission should be
changed to read-only.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
---
 arch/riscv/kernel/vdso.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/vdso.c b/arch/riscv/kernel/vdso.c
index 70b6461a6387..94450332aa4f 100644
--- a/arch/riscv/kernel/vdso.c
+++ b/arch/riscv/kernel/vdso.c
@@ -79,13 +79,22 @@ int arch_setup_additional_pages(struct linux_binprm *bprm,
 	 */
 	mm->context.vdso = (void *)vdso_base;
 
-	ret = install_special_mapping(mm, vdso_base, vdso_len,
+	ret =
+	   install_special_mapping(mm, vdso_base, vdso_pages << PAGE_SHIFT,
 		(VM_READ | VM_EXEC | VM_MAYREAD | VM_MAYWRITE | VM_MAYEXEC),
 		vdso_pagelist);
 
-	if (unlikely(ret))
+	if (unlikely(ret)) {
 		mm->context.vdso = NULL;
+		goto end;
+	}
 
+	vdso_base += (vdso_pages << PAGE_SHIFT);
+	ret = install_special_mapping(mm, vdso_base, PAGE_SIZE,
+		(VM_READ | VM_MAYREAD), &vdso_pagelist[vdso_pages]);
+
+	if (unlikely(ret))
+		mm->context.vdso = NULL;
 end:
 	up_write(&mm->mmap_sem);
 	return ret;
@@ -95,5 +104,8 @@ const char *arch_vma_name(struct vm_area_struct *vma)
 {
 	if (vma->vm_mm && (vma->vm_start == (long)vma->vm_mm->context.vdso))
 		return "[vdso]";
+	if (vma->vm_mm && (vma->vm_start ==
+			   (long)vma->vm_mm->context.vdso + PAGE_SIZE))
+		return "[vdso_data]";
 	return NULL;
 }
-- 
2.7.4


