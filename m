Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BBEEC7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9W40tXwBb/IHTOhUfEvR1aMXU7QRaUyhQIV3Viue5JM=; b=FnrRQKsU/bWJ9r
	GbLzQidu/qbOtKBnMupfHpPwyJbbRIWHrcWJ9iZ9BKt3yymY34mhHhnpAG2X6ZzLDl7q5nsl4LAzX
	u+79ImwKCHUAzMrTPAQk+yslZy4NItXSCry781Wq90uLAk4VI/KqRT74T//72k2DiAdrneZKdxh+8
	ZxndyVJw8RgTs0C4EKU73tLptKi8jBtiVPaBA5njXCIUA8qj3t+dOaHib+3Dgm+GZIHIhv+iFoeCn
	BRKQuA1mhCDU9VNW+3PF097csXkfV8RLDWe38J+IZuFQvhvfOwAAhNl0lZObTZ8iIJdRSkpFNmST6
	34TGRvOsX7T6fh/iqltA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMCb-003FA6-0P;
	Tue, 09 May 2023 12:12:21 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwMCY-003F8n-1d
	for linux-riscv@bombadil.infradead.org;
	Tue, 09 May 2023 12:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
	:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=; b=g3KoptGDxH2EM0wh2dAGJipP7L
	FvlNJURmL9yD6lUBFk12STP5cr+t3T2rUwlP1vEDSRqnc8XVOqOG6N3yznjZRpzuHFRhXlBep2KpB
	mBkGYanqGqc1Xf/GrK/6hhYW0bpWCNm/VyrUWRQ9a9IlcRMZtHE02JXduppRIBunojc6qqJoy7qXg
	NpMQ1sMEHhIWf7f0BYz3pBn8L3+D784elI003N4OUsH3nOX+AHunz3TSeJ09cM9jYajECEMjluIlS
	zIuCRAOi2P/77xN4rh70kIPzB7QfYq45bFyjMh7Phxx5hms5RzSJRy8tFJXDsQEWAZ0WoUtmibftH
	Jk/YceuA==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwKeU-00668C-0c
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 10:33:04 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-5144a9c11c7so5344573a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 09 May 2023 03:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1683628379; x=1686220379;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=QkSGQgEeLO0u2CM+0ENpyxSPJrVs5RDZxlAodKF2CMos24WptSccSet4gExIwDxgKY
         J53EVXnz92lB7aO2d6gQHFtDbzXVUCM5MbFmhVWexLhy5xFqQhTKL1HCd6G6OrA62ayQ
         XSxva6pG1WoKVxi15tFy8H4EAjDnV+L4mxEjpCx43pdqaxP+/JYCPRb2nJmIzOHPJgf8
         vdo1u82T8B/b1ar1wFoUR43j0kvuKZHIslOperfivstB7OWv7yhuVMYdfXB/yHRo+GuN
         YBOa11pFpVlI7ZgSjhHcjzFku4nq6xcooejKrOPSRTmQgYpXps+BjhUzW5FOoCmDRwiV
         uTjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683628379; x=1686220379;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hWB54ZotS7Y2ZgKJV1SIpYTu+cs8XvC1qHz0MxJpXfU=;
        b=XW/6Hxawrlw60gB1ZcShCYCgTjS3mPE+F8W1DeKJMD81poO0z5vRQrwaa8CZ1FqwfQ
         yGEjRksRmra+ia2bJj94H6b92KoFHNeQuxsWyTUtCs/VZcqlNOHfLxxNj/GE9YodknBS
         AnBfvW9BlQQvTwLDIqcxH2x0Oqr99O+OC9pBc+7lSprDUISPsHmsmy/IeTG7l91JHT/n
         Ij9xGuqIRD7PF8oKtl82Iam6ALgGRBBWQO0SRhq9FVT/GqbqNcqnhuFlnbTRXnAV0sdg
         eZEzZnsbDEPrT848O6zJqEvXDLE3pHutfM+Ai7AkNUKSfcJG6IVHdi4X1cC0hJpU2n19
         0GPA==
X-Gm-Message-State: AC+VfDzkoVy1UJZ0E9+u0fDkwkFCJbvdXxQMOfSdtPLp9JC+RvKcd3nB
	gddF0gv3E93pqw1rTY3TPNzWO8n1UUGsF/pIVcT0l7IUGEILNgIxcYvzQGIyuPBizqly2dbI0Yg
	gaA11ayJ8vjNcnPAFjMK+wG7yVvzb+w8NKAiuNjgi+riy/1wHbAL+a7xqJCgI8PjmgQqK9NVo2h
	dV0g7DD968TbPv
X-Google-Smtp-Source: ACHHUZ4XvQ8y8AUL5cpt7HXQnZP9qpclGxYr2ttP7vra/2g+xq2YwP3+ZiHmOQjumisSjZU4HbyLNA==
X-Received: by 2002:a17:90a:e60e:b0:24e:1ca3:7279 with SMTP id j14-20020a17090ae60e00b0024e1ca37279mr13290490pjy.38.1683628378813;
        Tue, 09 May 2023 03:32:58 -0700 (PDT)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id o11-20020a170902d4cb00b001a076025715sm1195191plg.117.2023.05.09.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 May 2023 03:32:58 -0700 (PDT)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	ShihPo Hung <shihpo.hung@sifive.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH -next v19 17/24] riscv: prevent stack corruption by reserving task_pt_regs(p) early
Date: Tue,  9 May 2023 10:30:26 +0000
Message-Id: <20230509103033.11285-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230509103033.11285-1-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_113302_426694_94E7D7FC 
X-CRM114-Status: GOOD (  10.13  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Greentime Hu <greentime.hu@sifive.com>

Early function calls, such as setup_vm(), relocate_enable_mmu(),
soc_early_init() etc, are free to operate on stack. However,
PT_SIZE_ON_STACK bytes at the head of the kernel stack are purposedly
reserved for the placement of per-task register context pointed by
task_pt_regs(p). Those functions may corrupt task_pt_regs if we overlap
the $sp with it. In fact, we had accidentally corrupted sstatus.VS in some
tests, treating the kernel to save V context before V was actually
allocated, resulting in a kernel panic.

Thus, we should skip PT_SIZE_ON_STACK for $sp before making C function
calls from the top-level assembly.

Co-developed-by: ShihPo Hung <shihpo.hung@sifive.com>
Signed-off-by: ShihPo Hung <shihpo.hung@sifive.com>
Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
---
 arch/riscv/kernel/head.S | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index e16bb2185d55..11c3b94c4534 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -301,6 +301,7 @@ clear_bss_done:
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	XIP_FIXUP_OFFSET sp
+	addi sp, sp, -PT_SIZE_ON_STACK
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
 	XIP_FIXUP_OFFSET a0
@@ -318,6 +319,7 @@ clear_bss_done:
 	/* Restore C environment */
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
+	addi sp, sp, -PT_SIZE_ON_STACK
 
 #ifdef CONFIG_KASAN
 	call kasan_early_init
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
