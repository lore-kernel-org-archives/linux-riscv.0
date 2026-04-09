Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25A0E9DE78
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vlhj00h8YqFSvV8JnBzXCGD17KVCfwbTOkOdlW6gU2w=; b=p37WiugTGpbL+d
	BP/dVEaFIimPOld56u1Nk+igQYFpiWWdIqaSebKtbXZPWBJNHgVHXRt46+pvesFpLNQdo4BIRhR9w
	j9BK0iYDateqqpeLuJ0SC31JB8Tku5lII+cKRekD5oMamOxb+6z1hN12ZaMHa5iFKi9findaXwgiv
	uqSO+vAEMZTSvCfMA5ZWhevnoDXUUc/GhVSv7P4spnPM8fVD+upfkdgzbG2qunJNt9l0phNwqhT7m
	b7YG6psxvoQ4aefeOsfl3AlFqBCVz8eD6Tonhmpdky7d4p0x/i6X8lk+icbYEBNEJKBVxT3w6FCYM
	vJQuVen8sowvG/UcBYrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQo-0000000A10s-2K7U;
	Thu, 09 Apr 2026 09:12:10 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQm-0000000A0yv-1xJL
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:12:09 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7d7ebe11bffso648275a34.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725927; x=1776330727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WyxHgyHjCm/uTWwOl6rmyK8Qxl1Q6KEXWj/8SSG15mg=;
        b=MMY0Cy9atkOUg8xck/2+Vp173fslM9Dh/L1+vkHjQo5k3O9r+XvxUF6RHRxWzg1Ri6
         68vVmnhJrAV7YvE/7yEkuNkyCMRfLe2fxFuWwXpYHQg1jHV637t17wffotplVa/sJ+3N
         x1KazoydQ2Met5ImNan/4QaW+oNeiF3ALl/zBZ8+eHQFx4XTYbia1hsC8VZ67GD0R7bF
         AOu6RjiTKwQZovHr73MaRsLLf9sbqbzhS0sSMA6FX/3zqqmJkkqY9PmKlviL32C5azxB
         Lct1ndF6REueIr8D69OmvR+nOvz+XYwR1p0SPRyEdTXsjjY510hC/w4d4sviSKSsAgJx
         buHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725927; x=1776330727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WyxHgyHjCm/uTWwOl6rmyK8Qxl1Q6KEXWj/8SSG15mg=;
        b=JBiLy3llj5REx3hkgfBLAmxkOBbunpCeG4j1aiEegRYOuwXgkppddecYR+WgkEinsy
         TA/DlmppnV1wMgfgVeIEHRHPjzV3fokE0Biu2qKomT8FQ2ro1jvTPtS4y6+nYr4XtE4U
         IrNLfx6ml6AwEEdxyg04KLqVKfsuZm0a6VYT3cvdM2JD4YR6HsRab3pyrGT7C0LqI10N
         3EylCzrywAFNX0MYXaANGPVfIG1EgL36BBAwJy9+No3lcEptA7mSTcWJGumOliOEm4tJ
         5ylZags6dfEqLfOa4ixSf2TztsV0+SFepnn9owOHjArh5bsJ0iXPEVzIk7xOm5VOqW/f
         o6hg==
X-Forwarded-Encrypted: i=1; AJvYcCW9a2kLoBzahDOxa4U2qzK1OnPSiNeulSRrEfFBF6auK72iDMvb9nCn2MvD4OX606v2aW5QPPcWKge0iw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzRMPI/jsoQghidE+J4gY3n+75LOa/58V8tnFcS5SCa/5GmImWg
	2VQESlh8LIeEc0NTbwKXGffDhzj+E91sX5fD4W7kwc6b/x5qmbTbXbBv
X-Gm-Gg: AeBDies+CGyKWPW51/id9MchMhInxpIdu/QESU95dUTGiKWJqd1kvaMvP/P4+mZqxFW
	rNuPFWdAgHlc8sRFqArYFexK2klf6hpoWqEZ8dWq0QVi4nsXNU6LsIQur6xThci7Krn7gw84jeC
	O7AJIsp2nVsf9Ho7J35H+gjdpJvusVIli7RJ6JCZNM+h5l41IRag/D74Lo/xgpDHP2eIyGlUzlI
	xNQCTWxHqTacpLAwTQOc9JpWZxauu9VEEuN9SBJf4GEZ5fWL+Q5nWYz8XJja+aWS3LTXg9WJrZj
	LrDOKr2aV5hw/guCXtwortQtYYhoC5VKaUwx5FCUANxN4wyDT41RO0vDhjZmo0yTpPWqjimXyyC
	JySZEo2u3l55htyRcyJpfc8cVvqmI5+HFwghaOxOxaO9F1Wz1ayiZNwYfOp1aVnCFiJeF+jQeD8
	3iVRXKCOhLbIPHeWBiMzIvbFUEA2+f4Wsn996N3Umyo7a9
X-Received: by 2002:a05:6830:6f8f:b0:7dc:18e:b5b4 with SMTP id 46e09a7af769-7dc16e1f176mr1747445a34.10.1775725927295;
        Thu, 09 Apr 2026 02:12:07 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7184e14sm15585364a34.11.2026.04.09.02.12.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:06 -0700 (PDT)
From: Michael Neuling <mikey@neuling.org>
To: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Aleksa Paunovic <aleksa.paunovic@htecgroup.com>,
	Aleksandar Rikalo <arikalo@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Guo Ren <guoren@kernel.org>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Nam Cao <namcao@linutronix.de>,
	Oleg Nesterov <oleg@redhat.com>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Raj Vishwanathan4 <rvishwanathan@mips.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Michael Neuling <mikey@neuling.org>
Subject: [PATCH 2/5] riscv: ptrace: Fix register corruption in compat_riscv_gpr_set on error
Date: Thu,  9 Apr 2026 09:11:40 +0000
Message-ID: <20260409091143.1348853-3-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260409091143.1348853-1-mikey@neuling.org>
References: <20260409091143.1348853-1-mikey@neuling.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_021208_506928_0771B0AB 
X-CRM114-Status: GOOD (  11.28  )
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

compat_riscv_gpr_set() calls cregs_to_regs() unconditionally, even when
user_regset_copyin() fails. Since cregs is an uninitialized stack
variable, a copyin failure causes uninitialized stack data to be written
into the target task's pt_regs, corrupting its register state and
potentially leaking kernel stack contents.

Only call cregs_to_regs() when user_regset_copyin() succeeds.

Fixes: 4608c15959 ("riscv: compat: ptrace: Add compat_arch_ptrace implement")
Signed-off-by: Michael Neuling <mikey@neuling.org>
Assisted-by: Cursor:claude-4.6-opus-high-thinking
---
 arch/riscv/kernel/ptrace.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/ptrace.c b/arch/riscv/kernel/ptrace.c
index 93de2e7a30..793bcee461 100644
--- a/arch/riscv/kernel/ptrace.c
+++ b/arch/riscv/kernel/ptrace.c
@@ -577,8 +577,8 @@ static int compat_riscv_gpr_set(struct task_struct *target,
 	struct compat_user_regs_struct cregs;
 
 	ret = user_regset_copyin(&pos, &count, &kbuf, &ubuf, &cregs, 0, -1);
-
-	cregs_to_regs(&cregs, task_pt_regs(target));
+	if (!ret)
+		cregs_to_regs(&cregs, task_pt_regs(target));
 
 	return ret;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
