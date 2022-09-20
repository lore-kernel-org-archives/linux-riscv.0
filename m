Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74B4FC6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 20:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zOo/UbYmSngAFIgba9gx9FkPR9iitSrGAhiO6GW65H0=; b=Kq+3Jp95QwKOwE
	2V6udDlh/FX6F2Go6jTYuVUhL42GKbe1qKUJreUt6HmK2kgiPECAyyio473WCaVDNhAsTwK5V3VKF
	Gb+Cg+BtLLXNLxZaP1Gx/ISVJdROgp4J/hTO+0KHFnzXJ5uz4OplC033BetH0HwM584EYFQoxu6+b
	IDdEeMtl+oCTXfmCchzRpUhXwVbiYka8OxrMAw3arUFktMwyxMrUc/2ypB824j6xeL8FFi2wrkAYw
	o5jhdD+CJyWcajR+IQ5Jt5kp0CEFtNhXYEC3NoE/kQjyETd8zvLZgjB0tRHnMvArKycNYBgZg8Jti
	N7FQd8R6SaRmS5JpPglA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oajVY-006BJ7-ED; Tue, 20 Sep 2022 20:06:16 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oajVV-006BHU-OZ
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 20:06:15 +0000
Received: by mail-pl1-x62b.google.com with SMTP id iw17so3552623plb.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Sep 2022 13:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date;
        bh=a0u1RkGkXEJ7b+a+7Cjla/gKJa3zrHUt+cUx/R7q3L4=;
        b=VoqxGoi3u0ylwrnNO74oTq7qBAOYkSkP66B5V2eDJp/U0GxtmvKwGvfuPka5Zrc9+5
         fPTdCxA9w61olUeeXEhXCxN+62FIjbDX5C6bz+pRYgVDPdXuVQ8zW7gAu40Z/NwWMqgp
         S5D0Tv/AeanPVGPAuiiiqRTzYBuS6ojTb1SQn7HuUXyBGuDNGQ08SPpwGTkV8CMfsgjz
         V8kgL+L0nx+u0zbPg+wY0vV45JMq9xqapP1Yk/sDTbqoydP+k4cnGXDIEKTM2rVYfs7o
         9jT/QAgxhegkMU78STJN6+XiT1CDJaU6ZRpwC7u1siBRSEXz38NB8QonhCjw/yCSvabq
         Li7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date;
        bh=a0u1RkGkXEJ7b+a+7Cjla/gKJa3zrHUt+cUx/R7q3L4=;
        b=68sps03U8m+cd5csjmkyRYPHxV2T4Jn/ecy6yO5HUCdGG3K+/Bu7yrJO2CfvVOovqW
         TEITOermWCF5Z8j+bWPoYbu9qt7RJn9zgvRGCEdGAW/w6jNrTPWxr1OyxuFqDbjqNujk
         uwkFKFHDOGFLiT7HZ9GrGeTp1L0zTgT+oPyHMWZEIwpNMXC19vYN8aKgwj5cINVD+6OA
         Ek5nlFpsI0ug0jvX3S10OKV3Jc2HBFFGW+ixl98yuhRu2XWGcH0qGgwJWqB8vZtqdI8B
         qfyFvHQOq2coHyags2Z10Un1UVwf8wOqy3lNm4VKI+TvmBTifyGRfbVT+hJ4btuu0aFY
         rVIQ==
X-Gm-Message-State: ACrzQf19vqfaHVjn5a13BY7gamLPbqrO3mFBnoscZJfp/6lTBRZ6YQQJ
	Tpao2UOq3Sct4Qn49MWKVPNY1A==
X-Google-Smtp-Source: AMsMyM59FYn7tLU7vNTosMKRAVV7JN9jKaRpu6W55RYQhaa/A2zSz9QJp9PUJu5DduaoHYi7CDdnkg==
X-Received: by 2002:a17:90b:224a:b0:203:d20:b92b with SMTP id hk10-20020a17090b224a00b002030d20b92bmr5503257pjb.17.1663704372168;
        Tue, 20 Sep 2022 13:06:12 -0700 (PDT)
Received: from localhost (p57a238e9.dip0.t-ipconnect.de. [87.162.56.233])
        by smtp.gmail.com with ESMTPSA id m17-20020a62a211000000b0053bf1f90188sm291010pff.176.2022.09.20.13.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Sep 2022 13:06:10 -0700 (PDT)
Subject: [PATCH] RISC-V: Avoid dereferening NULL regs in die()
Date: Tue, 20 Sep 2022 13:00:37 -0700
Message-Id: <20220920200037.6727-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>, kernel test robot <lkp@intel.com>,
  Dan Carpenter <dan.carpenter@oracle.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_130614_065212_8DC74AAD 
X-CRM114-Status: GOOD (  11.57  )
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

I don't think we can actually die() without a regs pointer, but the
compiler was warning about a NULL check after a dereference.  It seems
prudent to just avoid the possibly-NULL dereference, given that when
die()ing the system is already toast so who knows how we got there.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/traps.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 635e6ec26938..f3e96d60a2ff 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -33,6 +33,7 @@ void die(struct pt_regs *regs, const char *str)
 {
 	static int die_counter;
 	int ret;
+	long cause;
 
 	oops_enter();
 
@@ -42,11 +43,13 @@ void die(struct pt_regs *regs, const char *str)
 
 	pr_emerg("%s [#%d]\n", str, ++die_counter);
 	print_modules();
-	show_regs(regs);
+	if (regs)
+		show_regs(regs);
 
-	ret = notify_die(DIE_OOPS, str, regs, 0, regs->cause, SIGSEGV);
+	cause = regs ? regs->cause : -1;
+	ret = notify_die(DIE_OOPS, str, regs, 0, cause, SIGSEGV);
 
-	if (regs && kexec_should_crash(current))
+	if (kexec_should_crash(current))
 		crash_kexec(regs);
 
 	bust_spinlocks(0);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
