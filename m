Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C689AC25B0F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 14:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8bYWLXgynqPaarVOC24vBzJmPtvRYEINulRd2NSuXF0=; b=aO7wam0ELjlGlW
	NcSiB+s9OK3C6+yE31Kqkqt+vAy9KUKQbZ5ysm3cKTqAn7AYiTowizKYZkJF4+t9MEaJPrek8DeqJ
	X57spanbj9kmLE8LtJor2+DOUfUrTQHJrmmLkqVbixZm880nEttV9tWMtVf6iz3lRviXFOf55eAVZ
	KS8i+8+HeR2Osw94vCdQmkVZbHMFcX2CIW9WoL66Lw6AoK7CCTNYHGItEXDviYuMlN07bme5E/ZPg
	xwwjnKie4/fj44Ukp2wzRoWk/Qq6xUwTSdkz9JZVc8bYxjOD0scBCpIricapKmZsFzLBDLVEaPgHX
	hw4wiFOlF93mOM/2U5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEML-0070VC-0U; Sun, 14 Aug 2022 14:12:57 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNEMH-0070Rj-Bt
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 14:12:55 +0000
Received: by mail-wr1-x42a.google.com with SMTP id p10so6348547wru.8
        for <linux-riscv@lists.infradead.org>; Sun, 14 Aug 2022 07:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=K+4ztMrZDye6S2odnUAg2YD+Sis7k4asg4StIp4L2N8=;
        b=DfdO3yRHemNBlA7Z4K40epXT6a5mzLgotaT+wjrQ0CCVq94MwNT7SVXLAtyZUDygnw
         2lQfcVKnpICBUjlEpWDOPzfaZFnEqrkxVNsNybuTrzGd3fjZDmCT+ReRqE+Auj4sGY8K
         uRcRa9FbjDb05ahlJI00s/Hk3/l5lZaGjPgWTME/bO5b750e+9+lPtrOES7c0i8tIc8C
         8hdkA+jZ3XgV6n68tO+rItWKC9tkWGCXtj9yeDj/SfbPE7NEb7jemnuz+/jhcmNW7ShI
         3RdqO1rZca3tYU2ZJk3Fivp43ZyuSk4V+oEveW5vwEiKUcew/VQlHqnG/kHLjQlvWFvt
         70Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=K+4ztMrZDye6S2odnUAg2YD+Sis7k4asg4StIp4L2N8=;
        b=L+kH5gaN+629j7XoHTHeH8xjAxoYD7CGNyLtlT4QcjQvYRGmiYpkX+K6A2nhfOf7nt
         ByeFN/BlcptkhvPVrRAg0U0+cfibKJXaUHkI5rm5WW7afwxlLLjDJcB1ZFGVXHEE01cV
         oYJFD4yh86lgBl83dWsnWl8XFxvU5iNF/K0N8ZaQJ4xNbDJVIwEMm0LepduHlhd0P+/M
         jxymxSYd8q5makp9pHjh2uS6o3UZqe8LBUPzHsPTyTZHGzstO7Uf35ZPYDJRtPa3Oi3/
         KEPMDoSmB8KYVm+pxlVWwVXBEdDg4X/W5pDAU30BDDENeCuubkEEJzeqb2lyVqgmaCgz
         olUw==
X-Gm-Message-State: ACgBeo0fpOwceXPc6dU1oK/AI4BwcPxki2Lg2jJfbbLR0IqYKvjD2pam
	8eQm5OBbAlds0or9Zu5KXqQ7/Q==
X-Google-Smtp-Source: AA6agR5PV8qeRAKHvRTEReWxvq3UtoJToFqH0Q4Bl/uP3TlBuYJBu4g3GQwfQjHfdPU5zsQhWphrPw==
X-Received: by 2002:adf:fc88:0:b0:220:61dc:d297 with SMTP id g8-20020adffc88000000b0022061dcd297mr6138300wrr.660.1660486370580;
        Sun, 14 Aug 2022 07:12:50 -0700 (PDT)
Received: from henark71.. ([109.76.58.63])
        by smtp.gmail.com with ESMTPSA id b8-20020adfde08000000b0021db7b0162esm4625419wrm.105.2022.08.14.07.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Aug 2022 07:12:50 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Vincent Chen <vincent.chen@sifive.com>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Tong Tiangen <tongtiangen@huawei.com>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/4] misc warning cleanup in arch/risc-v
Date: Sun, 14 Aug 2022 15:12:34 +0100
Message-Id: <20220814141237.493457-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_071253_582307_8199C4AF 
X-CRM114-Status: GOOD (  11.66  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,
Couple fixes here for most of what's left of the {sparse,} warnings in
arch/riscv that are still in need of patches. Ben has sent patches
for the VDSO issue already (although they seem to need rework).

VDSO aside, With this patchset applied, we are left with:
- cpuinfo_ops missing prototype: this likely needs to go into an
  asm-generic header & I'll send a separate patch for that.
- Complaints about an error in mm/init.c:
  "error inarch/riscv/mm/init.c:819:2: error: "setup_vm() is <trunc>
  I think this can be ignored.
- 600+ -Woverride-init warnings for syscall table setup where
  overriding seems to be the whole point of the macro.
- Warnings about imported kvm core code.
- Flexible array member warnings that look like common KVM code
  patterns
- An unexpected unlock in kvm_riscv_check_vcpu_requests that was added
  intentionally:
  https://lore.kernel.org/all/20220710151105.687193-1-apatel@ventanamicro.com/
  Is it worth looking into whether that's a false positive or not?

Thanks,
Conor.

Conor Dooley (4):
  riscv: kvm: vcpu_timer: fix unused variable warnings
  riscv: kvm: move extern sbi_ext declarations to a header
  riscv: signal: fix missing prototype warning
  riscv: traps: add missing prototype

 arch/riscv/include/asm/kvm_vcpu_sbi.h | 12 ++++++++++++
 arch/riscv/include/asm/signal.h       | 12 ++++++++++++
 arch/riscv/include/asm/thread_info.h  |  2 ++
 arch/riscv/kernel/signal.c            |  1 +
 arch/riscv/kernel/traps.c             |  3 ++-
 arch/riscv/kvm/vcpu_sbi.c             | 12 +-----------
 arch/riscv/kvm/vcpu_timer.c           |  4 ----
 7 files changed, 30 insertions(+), 16 deletions(-)
 create mode 100644 arch/riscv/include/asm/signal.h

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
