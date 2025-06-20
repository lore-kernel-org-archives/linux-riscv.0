Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 541FBC7115D
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jun 2025 10:22:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zKXllNS2E/aIiRv7lA9IH87DFaOi6bZMlQ1iWSQwDBc=; b=HsCBPOnaYsFqg5
	XVo3kafjan0Z61FlgWdC80sT2BFccGWcNoYtOzXrPe9tvGhHWAwFyemMWgW34ekFS3+TWFqsLE959
	/hOSyBO47pP0Neyblb7QKC/guTnNCqpcIHX5JuwYpXkh8avy5lFzKXZxcAxQ5adNVdlWs0MsCVLrQ
	nYHIqJVmr3KjvRq/LcZrZZujbyfp5CGbu9vDNLME0sgMVzxaeZ0RNt05SimzXIIplbFtGwR/mGs2j
	98oM5Rk9a7OekZ07CplxqQrH9iCE/StmKWFh7tuMYoVUAXnpa0KOUDUzoTWNMy8bq82iXbQ0C9pog
	cgsA1jwpnL8+EQ3bP5vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSYtI-0000000FK4h-2TqF;
	Fri, 20 Jun 2025 10:22:36 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSXsM-0000000FAWh-1VFj
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jun 2025 09:17:35 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-747e41d5469so1585298b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jun 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750411049; x=1751015849; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLJBKjnEtfhUDU8FDwmcm2NO13Gl9xrFkTR60m39TU=;
        b=Ve3aO1oW0WWHLcj1cWbPc9KY48EKpgq7G298mexjgZ8QiN9cD/DpHqYUJm3n6Bp7NE
         9WynzfmB1D1C+hWvUMbJenzDtF6tBLrrUrb7fKk9i2XlN0w7+UW0QuYhGO+zXcSDwBIe
         LnG7yKQMvrtDqocGpSG95mBnHu0WGLiPu8vSmf2KXtERU1FMBgx4R2zvN910R/jMOd6c
         /4KKSzmZWdIg9ASN7Q+Kn8Y1Ob6HEDK2fVAU2vY4VnzAWpFyPjREqKCClGTr6Om6qauk
         4dtfeJgI1ZCMpaepPq0/QBwN2oTCrsy/bAAvSU5pvEMn47LDZJo0E7nmY5CI+6Xg/duu
         8xFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411049; x=1751015849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNLJBKjnEtfhUDU8FDwmcm2NO13Gl9xrFkTR60m39TU=;
        b=lVxntJ2f38Mm+B+8W+bH7N+IqJdTac+lJnFX666/nLPCbA4ZreQA7gFJSxyCBpZWZD
         PrFMIHvWTmGkrVEJdFHHyDEhtrhasmEAZMWgn7TeFYMP9iQTLAXQkHX3zPx4axnOhWRp
         RnCsye3cdyhSo8Q5b4noozERtd6BGsJMkzJ3lIVlPkQAP2Wh1tmWlZ5WAZxmUY2vdn0k
         D74izTrkLeeBsF36c2Ac7ypQCRKdDX7q13xpq2/PcgixW/q28LBjiepCpHSLdQU5tAF8
         bcHBtrSpC5Nd+0ua9s3KhrbHH9nvsHrel4KeTSWSfZjWHvni8qLKaNhfc2T2YXDhVDFG
         eXKA==
X-Forwarded-Encrypted: i=1; AJvYcCVxbtGbUvKpzX5OY0f2oTumwccCNgaRA2WQADACH50gLbxWNcTj6olbsn53ZD6eNj6hMPARM3I5vDzNiQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxge6BEwBNcw47hgXVriXH4nuBIUHqybCANPBS3WQeBrG5wIEKa
	arqJ7g85FmzSrWtL4jjx+gfxkhKT6EcJ+EauZZntzA4oGeoyYvZyHPf0OV0YG5xnlgk=
X-Gm-Gg: ASbGncsAdlL/kDCCwUVxQrFUEED4J57GPLsk/qJ78R2EkcJu35FKuzj5sLyWyLAaLNh
	3koUpIsNtJxxKSCeyZxySXwpxmiplJXq49H4aF/aS/edSANnvY/tsn2aOq8qBWWsR4GwvsfaELn
	e3+Wj7jolFfF/gzHyztWoakof3Nl08D5SOygjpdhJxYL17AvzxisIBIUVEDGb2YS8mRj5kcU2k2
	J1O8nCcuACkU/3MRhJs9ggs9OTllVsnYALExOEiXzIb10FYpwbYeqLHYHs1vEdFpr2oHkaDDBUk
	NuB7OzzBz6gZiPB+hM4LEisnepuR6LJW62xl8HImC/LkXWtacChiUN9bBJt/QO6m7B3letRQgTJ
	u9tX31v3uQrYlyr6KFxI7JxbMzgNTddr+tP5qswZCx2f40XVLb70+1ns=
X-Google-Smtp-Source: AGHT+IFl+mvsVS8E+myUXJyeRA0NPyQGQ4vLveBBEzuD3+Qemhmjod5mWIqNQeJQuwr4ZVik1pW6cw==
X-Received: by 2002:a05:6a00:2789:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-7490d4f533amr4072727b3a.3.1750411049294;
        Fri, 20 Jun 2025 02:17:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a4a488esm1643231b3a.63.2025.06.20.02.17.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 02:17:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Date: Fri, 20 Jun 2025 17:17:20 +0800
Message-Id: <20250620091720.85633-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_021734_768482_6351D7AB 
X-CRM114-Status: UNSURE (   6.29  )
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

Delegate illegal instruction fault to VS mode in default to avoid such
exceptions being trapped to HS and redirected back to VS.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..97cc2c0dba73a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -48,6 +48,7 @@
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
 					 BIT(EXC_LOAD_PAGE_FAULT) | \
+					 BIT(EXC_INST_ILLEGAL)    | \
 					 BIT(EXC_STORE_PAGE_FAULT))
 
 #define KVM_HIDELEG_DEFAULT		(BIT(IRQ_VS_SOFT)  | \
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
