Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672EFFF885A
	for <linux-riscv@archiver.kernel.org>; Sun,  3 May 2026 04:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PnlWTT87dIT3DSHWkIW2sSpszUqdKKPiDiLQcH31EcI=; b=1wQixjENZQc1br
	vtK2E7k5pYULrOTzv/o4Y1D/687dnVBLAhXAi3smk7QAP69aqpLx8v0PThkrnJExLpFJFT/gHxeUr
	ic1L0AQOztBTFSLLzbxx2MrPzPT4Fz//7qXSXtMF7FzgeR5+mQ+BSV7xeGq7TaqBx+qtac14TpZNC
	FihmDC9oCixSXaB5AEEykCyWofeUJYxnfTkQ9eXw5RhfMgTM9pXj0xKL/sNxr+Yh6NASLvgSPRHO/
	Q+KVF2XEMqfgvfzG9dBjJtG4JviucBdBk1kYTVEIU5X06hUTNjUpROK09yPFusHlR2LbMyq+NL3Sc
	Rd1OYKVty136cxPjWhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJO3z-0000000AI3u-0MDB;
	Sun, 03 May 2026 04:04:15 +0000
Received: from mail-ua1-x929.google.com ([2607:f8b0:4864:20::929])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJO3v-0000000AI3N-4AcV
	for linux-riscv@lists.infradead.org;
	Sun, 03 May 2026 04:04:13 +0000
Received: by mail-ua1-x929.google.com with SMTP id a1e0cc1a2514c-95d01873f17so308996241.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 21:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777781050; x=1778385850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=nSJgikwQ3H2Rh1bs4ilssI0pfJk7LXiSb6hDVluZMx8=;
        b=GrGwJKObBioiZ3FitcsbQegcGKy2hy9V7ny14Hhvc0dbkHBRCJsg5p9SkdvwtYZszQ
         3v0ZFCos20WL/aZx6xJ2vSoK5PDHHxNatzO5HsmJONlCOaTCJTugLryfkmGFpVzQQLCh
         HnF3WBlg2isKg/0ZNTtW2eR10UaxQ/nMNBnD2x/bQRbB3xIIBstYzt7rwFpyGRqvF+rV
         21Jec4Xi7QaqUzlOgXaQP6ZkRTjyrI40jbwex740TglzV/pr8iChO5CnjrIi0DJFtxeX
         CtoUXa8AQsEDUiv5hTfuWOMPkdN9I/LLqygjMN7+Lf7LkgtHoln7BH+2UX4d/iTS0B/f
         ElXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777781050; x=1778385850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSJgikwQ3H2Rh1bs4ilssI0pfJk7LXiSb6hDVluZMx8=;
        b=gF3wYXgh+6W85THhL8Es1T10m63OQrgd9SeGyzuxnV5CXZpLrJ7qkfa7C6KqO+79uq
         IMPVnuupPyZU6F0rIYa6B9zegHtcQQ/wC8iLfH72h6T43BqwfuUyG7eQqj/bb9Vo22I7
         NZS3FnI25GKNuAJmmzBnaf6SHtyhkAI55eO0QSPLQbgt8vOCiUcmJutUifuoijCYC5CT
         XMp8Ku95xrbxFrIwPIZgr/wvMbCdz/zD6T1vy5tYBoAIQTfAZgomr2Qk+BnQCaOSXMdz
         HNHkRtget461ATg1KYRoGjrlmyt+OSumUFxqKdDYXUaYJ5aMa4cxX/t0oyjDTeSOOpyw
         FF7g==
X-Forwarded-Encrypted: i=1; AFNElJ+fM7GkUeTf2nUc3mksEdmBDwbB8vm1t13QWo58rg2zKlvj/E5LHlXuQbFKOTi0CFam7jA+wDZgl8KcMw==@lists.infradead.org
X-Gm-Message-State: AOJu0YweFsnv8KAAYK6oNaUL0wpJEBGm0BGHcMcvPj4fye8c1409y3o2
	keVUagoiGQxuUIO+JRMX6GdG6OWr+pt9pf89TNOjhURpOL5ErKIHc0/5
X-Gm-Gg: AeBDietD5D0rZe7I/hYIYQIMbQr+HyYQE7cbxFu+iXELQE+vxLiDxgZseG8Yz4MywCC
	jVf7O1zOO+haNAWRNDInVk0tCCcljdrQA9DOODx04OBljwI4E7XKlhSMV3OOLcWCz6flQz9NOO6
	MfjzvmRc13+mo5PgiD41Z4HEkRXYIUe7xb10x103ljZZPMbGz+x0IeSojFMqE23A87D3BbxKqx8
	gP7Twe/0cXbMcdG6aRMkMB2ElVXYrM7lRYtEpua1pzOBPCgtRn/ui8xqgvskSsg5SMy1RrjdncV
	hAuMhki9d2psfjb9MmHXPEqoirEEfQ/NffB9dm0grNwNfBb9qRM1Sbnzmxm/xAoIL03ZhltRYpH
	P0fpdmIhNrX30OJeUW8uUYTQzYwf0lYxHHqOuPXh/XVJoFYHNNrxdG9oFCaaJWmU9ZGomqiZlA0
	nIpHWJxBYxyWvaPnLnt5OcAL8RAz2gTGsSc963Eg==
X-Received: by 2002:a05:6102:c8e:b0:608:cdd9:2bcd with SMTP id ada2fe7eead31-62afef0f7e0mr5003920137.15.1777781050494;
        Sat, 02 May 2026 21:04:10 -0700 (PDT)
Received: from nixos-office ([129.222.53.215])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-62ece141251sm766638137.10.2026.05.02.21.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 21:04:09 -0700 (PDT)
From: Julian Braha <julianbraha@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Julian Braha <julianbraha@gmail.com>
Subject: [PATCH] riscv: replace select with dependency for visible RELOCATABLE
Date: Sun,  3 May 2026 05:03:31 +0100
Message-ID: <20260503040331.71875-1-julianbraha@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_210412_312378_BAE08CBD 
X-CRM114-Status: GOOD (  11.18  )
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

RANDOMIZE_BASE currently selects RELOCATABLE even though RELOCATABLE
is visible to users. Some other architectures, like x86, use 'depends on'
for RELOCATABLE in their definition of RANDOMIZE_BASE, so let's do the same
here.

This select-visible Kconfig misusage was detected by Kconfirm, a static
analysis tool for Kconfig.

Signed-off-by: Julian Braha <julianbraha@gmail.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index d32309846fa3..da26559a0893 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -1143,7 +1143,7 @@ config RELOCATABLE
 
 config RANDOMIZE_BASE
         bool "Randomize the address of the kernel image"
-        select RELOCATABLE
+        depends on RELOCATABLE
         depends on MMU && 64BIT
         help
           Randomizes the virtual address at which the kernel image is
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
