Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 626F0C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 04:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GzdSA1tcxiHkkPTxtFUTylrmVOVGRqwLR1CZm+DWQZg=; b=lNAIhAl6lnxTQ7
	CJoFz4eZk7ahmfzLhahSw0xMivFZ+jqwkL8vNCyyqn61t17UwwmvHQX5H+l/FCPSeI7Z1OrSxm3Ix
	2TFQrO6VR5eXYvjiTEShpoIxOJ73sjyMZsY0eJICqoL4oFDZFagcW8LBv7v2zWt2ErCnjbYtqFw4D
	PzllI0MQycBnbCidXi8hEAdBVzjiR8/kpGDL/aItX2uSbrQxW6llzBBFmt/nzE8SqYOROW6iP081O
	Rj80nYLb04t4ctqxGJdFeKimRuyHvXxOfaSDTw4NYece/gKWzD0LIag2SWyfLfKEqfP+3I1ztCqjB
	8KwIrK6/7FNydvnhBtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMMIh-00F31i-Qi; Fri, 12 Aug 2022 04:29:35 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMMIf-00F2zy-J3
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 04:29:35 +0000
Received: by mail-pf1-x42d.google.com with SMTP id g12so18223282pfb.3
        for <linux-riscv@lists.infradead.org>; Thu, 11 Aug 2022 21:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=5HBsfNYG70WO6aS4eAqq5xbQe7SlN6A8IbvnyB4h63Q=;
        b=jcwCGPiE7nuQ0EQc1GecTk5pUMusPoqUYxF1IOtG7zJAPVgDoTVg5jy6o4/EbVm/Ri
         IQ9pLYS8oswd2k9+DYm2xMoThhheRdkmhEILRdT/f1SbCjVSRi+gSEr9i/3AzQlMi6nz
         9x+it+mHZMNQgXHaWaWOkzbfgN75mPJKWWruLYbWDY8G4OoRIIwLlErbW1C2NQGDkr7T
         l1M1IPJgaRGt42aGGPWeAPbSUePPy+klYgOVhxcLmegADLOydgB2vACxiufuTQLM8teZ
         8lnm8wldHKj4HiPVjVc9/gKN0MWc4KG3AtaKaW2o0MNYs+r5Z+RA2/x1C0O/P+xVNMaz
         mafg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=5HBsfNYG70WO6aS4eAqq5xbQe7SlN6A8IbvnyB4h63Q=;
        b=4TGBrKpC2fIu2Oy2jiMZTB3fLLO9IBR5xuIGAQYyPvrzoDXzYIhJTOS0aBxLmCEpjs
         vUvZBJuaOmwJV4cI1eJ8KSOV9H1e4j9z9m+jRKgKYdpALabTe5+da7u/1i0RLc8+aJMh
         v/IOlOTQ5ltaFMXlyo5gLKZTMO/3vzEgRXrlP3Z4da+atPhjfntSPlGBnYOR3D4Zpi/1
         OZ9YUVanAdzJBm00oMh1nFFhh0T0Tq0Nudd9nBEDH5q1c9D+JAn9oycvEkdFA4pvlvmL
         ir3L26p1eskAmN5ZRGdDG6iTWhQYbdJmbVw0dGYY3wHGxb10V8wnyB2wHO2ESZ80Ltb7
         Wn0A==
X-Gm-Message-State: ACgBeo2ydiaDgpPKTdd9Qa/ieT7rltyY9VAcsX4pA2+SKGHUooxdxRWO
	4ihnopHDLbDu+TuPNz+o5LXGsYB96Atb0Q==
X-Google-Smtp-Source: AA6agR6dRUh9+NrdiMgy/CoN7j7IYVk+Sv44l2jV2oPxzmlOCSZuI/SyF6+egFI8m6H2AKeFn/SiOw==
X-Received: by 2002:a05:6a00:10cf:b0:528:48c3:79e0 with SMTP id d15-20020a056a0010cf00b0052848c379e0mr2243332pfu.18.1660278571061;
        Thu, 11 Aug 2022 21:29:31 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id h29-20020aa79f5d000000b0052d981e7842sm524904pfr.208.2022.08.11.21.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 21:29:30 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH v3 0/2] Risc-V Svinval support
Date: Fri, 12 Aug 2022 09:59:19 +0530
Message-Id: <20220812042921.14508-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_212933_674536_540C462F 
X-CRM114-Status: UNSURE (   8.42  )
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

This patch adds support for the Svinval extension as defined in the
Risc V Privileged specification. This patchset depends on the following
series from Anup:

https://patchwork.kernel.org/project/linux-riscv/list/?series=661505

Changes in v3:
- Fix incorrect vma used for sinval instructions
- Use unified static key mechanism for svinval
- Rebased on torvalds/master

Changes in v2:
- Rebased on 5.18-rc3
- update riscv_fill_hwcap to probe Svinval extension

Mayuresh Chitale (2):
  riscv: enum for svinval extension
  riscv: mm: use svinval instructions instead of sfence.vma

 arch/riscv/include/asm/hwcap.h |   4 ++
 arch/riscv/kernel/cpu.c        |   1 +
 arch/riscv/kernel/cpufeature.c |   1 +
 arch/riscv/mm/tlbflush.c       | 108 +++++++++++++++++++++++++++++++--
 4 files changed, 108 insertions(+), 6 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
