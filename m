Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7829BE9DE76
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Apr 2026 09:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c/esfnkl1qILlZ6hCcL/SflexBTX5MHfa4ltrYFcQfc=; b=eFeOA78pbytB0t
	w6yh9cCobp3sn4E1JA1MbTUy05yZjPGb/6aHbZzLMB1ub8wGEeAfY8xyEBo12UZUlBWbytUg0aNlB
	OcNlFpK7wGb9Nn873fWxG3MWCZaGd5DEp3yHyvXHjGYaR3swrU7AlHVTskS/nBghEB8HThtkjp25U
	CJshtwgct9JIcD9HyNa4Q4seKJc4mqhcIaW/VdCpTIbvzrvOtv/hfRhZ6BfwCFW6fXQW4GpPWXZmW
	bJB0HQtsUk34nUQdCO2frwRHPe4CQSS1BDUiqKmclK4FT0x4k+ZIYihz2WmmkXbkPnKmrGR3vq9ZV
	RxYEKUTdHO4Nt4rDZCNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQl-0000000A0yw-3XU2;
	Thu, 09 Apr 2026 09:12:07 +0000
Received: from mail-ot1-x333.google.com ([2607:f8b0:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAlQj-0000000A0xI-1If5
	for linux-riscv@lists.infradead.org;
	Thu, 09 Apr 2026 09:12:06 +0000
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-7dbb89ab229so606982a34.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 Apr 2026 02:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775725924; x=1776330724; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=7KlUobdR5RZOrzreh9hgDytSFrMeubOUolfR+KrW3m8=;
        b=gp8SXsfoKXy/cmHJoYTO4/DgL6he6UICu5kyv2sUKcgG2qj0JFxbemS1eSDHbNDaqZ
         +Ip1cx2PUkOjkX4GUsdYuzKBcbAIYYi3uO+/S9wGo6X+fqz/ei5YT2gOO6JIXAoX10Sn
         5MFcU06Sh2HydWx9bkMDx9nBANEL8EoLKHiJIC9IR0nKJbXLupeDVw26g7nFj3PCD4CP
         ODIVtgGsvYA949NR/5VnXguUe5Seou8T+KxfInFRJZeRFHTfz/MDeRzL1gv5DSaGev3c
         c1b9nWAgVFsF/bdiwDalEjrNGJMeNUcrCEKGii2VDXTO6ImFvBvdF5eNjZxAMzFVQIg2
         kuhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775725924; x=1776330724;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7KlUobdR5RZOrzreh9hgDytSFrMeubOUolfR+KrW3m8=;
        b=hKzpCBqYtNEjafJ4MvUNn259E2bFKmhuBHMopTTc2YEYV+J+X4K/VtFX4ELhOfRRQm
         Z+trkof0Sk9yh+HXDINkSpgBXyRyGAbdUBuK/DghoiFqSUKUh+9effGt5UHdOQX4Ybzi
         AV0126ni3r1Mpoh/SB2j7DEEAVkvSbRvGVizSW3MYxSQ65gUyo9Lq3PIV/9iIdINQCu2
         2rGeC5bLg4X3YTcPym5HqZXr4tTtJ7OzxVqkXXfqI8vcDb2iXgHYFmHONPLstV7kRh/W
         tkTQvQu7BcweLBWEG2DX8Y/8eE1HITyi2aoPE18+kGpefk3gYV+SVk/VJIgKMy8WXSyJ
         bj6w==
X-Forwarded-Encrypted: i=1; AJvYcCWjn7AHZMsyejNtIv11S5V28tTZjIjT7HzIK5thXxj9+GJGEP+2imC0Njb91vCdX1vgaP6IoV8Aen8q+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyZOnNnP2MaRUwAM3LIa+nR9RXcRChJEt+9BFOzaetCB0ZJDRMa
	PKHlf6wKObPoT3kFGufiIOe8/2dCSzH1Ow3FbFTyuzQvCRTAF6dSbQ5c
X-Gm-Gg: AeBDietI4nMUfOEtsfDC5rRBvff8F5jKOi0SQibOZ5yDqz+j1M7viJSO4V94SFstIyL
	lUa2fJANZKQzAWHo5OEyrE70LbaJepmtmo77ku8dr0kP6tzJ8zk+6hgYXTGsSN4hjHOail1lpU1
	Wt0KBq2rHoMDhkxeToX+Rm5YMBSIA7z1U88AsoEdfqu4Eq5AT+/dRel0s6Ie2dqJQzxxoD/2s79
	0/agfYtViyROPdxtglSs9UqLgR0lykNDsO7tzflM1zXg5fRmKkiyK92T07nzrRgZmZHNwMncUcS
	bDZ/Simub3zZFRTlLFMdrVSUNubd9LdEeSFjG+bBHIJkRy+dmp4UOev8rRpH3l0zoIILLgcb8qQ
	m5i54FG408Nge8LaK8WsahYmfB6g/RtTA73uIRXCbXNpcSOsWSj4OnDVChpEVHa5dcPRrQ0wh/2
	imYdB7oy0UmndSg+k6TIyw2Q57PYCDMez48g==
X-Received: by 2002:a05:6830:6af8:b0:7d7:eaa0:5e3f with SMTP id 46e09a7af769-7dbb7576b60mr14410246a34.24.1775725923715;
        Thu, 09 Apr 2026 02:12:03 -0700 (PDT)
Received: from ird-aus2.tenstorrent.com ([38.104.49.66])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dba7184e14sm15585364a34.11.2026.04.09.02.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 02:12:03 -0700 (PDT)
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
Subject: [PATCH 0/5] riscv: Assorted bug fixes
Date: Thu,  9 Apr 2026 09:11:38 +0000
Message-ID: <20260409091143.1348853-1-mikey@neuling.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_021205_351480_35E57F89 
X-CRM114-Status: GOOD (  11.54  )
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

This series contains five independent bug fixes across the RISC-V
architecture code, found with the help of Claude AI (claude-4.6-opus):

  1. riscv: errata: Fix bitwise vs logical AND in MIPS errata patching
     - Logical AND (&&) was used instead of bitwise AND (&) when checking
       errata flags, causing all errata patches to be applied when any
       single one was detected.

  2. riscv: ptrace: Fix register corruption in compat_riscv_gpr_set on error
     - On copyin failure, uninitialized stack data was written into the
       target task's pt_regs, corrupting registers and potentially
       leaking kernel stack contents.

  3. riscv: mm: Fix NULL pointer dereference in __set_memory
     - find_vm_area() can return NULL but was dereferenced without a check.

  4. riscv: mm: Fix NULL dereferences in napot hugetlb functions
     - huge_pte_offset() can return NULL in the napot path but was used
       without NULL checks in huge_ptep_set_access_flags() and
       huge_ptep_set_wrprotect().

  5. riscv: mm: Fix TOCTOU race in remove_pte_mapping
     - The PTE was read twice (once via ptep_get, once via *ptep),
       creating a race window where another CPU could modify the PTE
       between reads.

All patches are small and self-contained. These bugs were identified
through AI-assisted code review using Claude, which also assisted in
writing the fixes. Each patch has been manually reviewed for correctness.

Michael Neuling (5):
  riscv: errata: Fix bitwise vs logical AND in MIPS errata patching
  riscv: ptrace: Fix register corruption in compat_riscv_gpr_set on
    error
  riscv: mm: Fix NULL pointer dereference in __set_memory
  riscv: mm: Fix NULL dereferences in napot hugetlb functions
  riscv: mm: Fix TOCTOU race in remove_pte_mapping

 arch/riscv/errata/mips/errata.c | 2 +-
 arch/riscv/kernel/ptrace.c      | 4 ++--
 arch/riscv/mm/hugetlbpage.c     | 4 ++++
 arch/riscv/mm/init.c            | 2 +-
 arch/riscv/mm/pageattr.c        | 4 ++++
 5 files changed, 12 insertions(+), 4 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
