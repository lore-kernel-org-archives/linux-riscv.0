Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1226FCD11DD
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 18:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bjnu80nEbcCIlVjF/siM1yhVkc71ffDTj/qWbL2TuWk=; b=pLDwzpaesxMviR
	lcydp0rKHUPUzM/3x4/IbfsGD6PfBhirNt/SJyRhnKVsm33WJxPe43EekMJKLdwoq8EwPpb1XK1KF
	qevRGu5RyEb3NDdShjFC6OSAMxFACaKp+6MtBbmqFizaP3S735QrURi2KFmfB4MDD5fazLVm5el2+
	3fm+H8E4wi74akQpmaszZbsGwQ5TZLdqPuosCXpUSl++vTMiQQrgku+Y5pi6/aNOeAw/0u3NItBP9
	omDruLuQjWmD88qYuuhGIFZU40uCBIIxts8egzckSfLUdDH1KoMYHyZ2UznuelkHzb7Qywh8q+SHl
	ShE3YnnHCB8c66Ss11Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpufw-0000000FDUj-1iHL;
	Thu, 28 Mar 2024 18:40:32 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpuft-0000000FDTh-1C0f
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 18:40:30 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4148c5de23fso9095605e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 11:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651226; x=1712256026; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s7vStwaJc8Jp1+8eAznQWoP1efcCvQ1C+LTuBFpDSFw=;
        b=Ag/kEHIGp6P2vBSKWY79TBwdOpIsarY2bVpyqkbvPqWSKPWOulPeM2FIKDqBdocZb8
         mx+VSw5Mr1llcnqfNu9nE2WH2Iw/XcMv8gpyPl3Gc6yJ+XfUHBdBJKEA8fSLrNtVaVtR
         dUthuYedacnIvx670g8kwSyEIJyu1W4nifU3AZ6VIpxnq5JPLNhYmDq3kzO40+KHJz51
         We/rmMeko2gzR1M+4os9Xll6fN1oa18sHRRLvQli4VzwbAUp7/b1VA/4JyyNMnblFDk8
         tdDYH3qFRMZ7105GbMf+IBpwi7AUZzOfQpfuNQ+ZJyOKhyexiaepbuO/ei1NaJb3eMhK
         ipOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651226; x=1712256026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s7vStwaJc8Jp1+8eAznQWoP1efcCvQ1C+LTuBFpDSFw=;
        b=ujLCh+FnVD+Al7oBZFcfo+/UZib0/2uCzoZjZr93V2NUjSDe+gH1L+m+zYlSW9d8lm
         UU31qS3Zpo9MofcnPo0n3eKSAKm5xMk6bI9VPzXiAz+yEmcBHijbQahS95dNFY0V/5u1
         X5ZTE2yAPhM4x/cDu6mFquMxwgXnlEQ5jZIkqjfuxN7gb8FBX2dAyRzHbJCN+AoG7IKK
         Yg665busybBiHeBAkZgZpistYoCstkpk9xSuwbdUmIDP/xkiCAVt5qx9rQLQt0YRP/Kh
         iP51qRpiN9ecoV7O3dOS+nlUPmYGODmoJGDWcQH0iW5FPZJ0tsUe6wVoUjVtLBl8JkNU
         RPdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc6bUWGtKeeJF5kHlli2K1rtQCqBClkVHFbHsKExvsIJAtku+TIQ0PBIu5vOQMZydXnW8QUzu113ngTgc0vhi6ygieE7v8VKaiBWMwMZKt
X-Gm-Message-State: AOJu0YxCISvozI0Euz48rukacXCFmSPZVSOhFQq/UM0iPlBGvT7rEjq5
	DphILTxrJwOwpDNcNDqSd4Uf2OlVcPoxlNVxHyW3xs6DIOfIxoVG
X-Google-Smtp-Source: AGHT+IH6hW+LdUDn61VIrLAIWqaZ4cJxyHJNY508rFj+R7RuB9lz0ukDrD1/hb7htO6wz+0Mk+GVww==
X-Received: by 2002:a05:600c:3c98:b0:414:6bda:4735 with SMTP id bg24-20020a05600c3c9800b004146bda4735mr135792wmb.3.1711651225829;
        Thu, 28 Mar 2024 11:40:25 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id fa5-20020a05600c518500b0041495df2268sm5168203wmb.2.2024.03.28.11.40.25
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2024 11:40:25 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: puranjay12@gmail.com
Subject: [PATCH 0/2] riscv: ftrace: make stack walk more robust.
Date: Thu, 28 Mar 2024 18:40:18 +0000
Message-Id: <20240328184020.34278-1-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_114029_346892_5AFA106B 
X-CRM114-Status: GOOD (  10.67  )
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

The current stack walker in riscv implemented in walk_stackframe() provides
the PC to a callback function when it unwinds the stacks. This doesn't
allow implementing stack walkers that need access to more information like
the frame pointer, etc.

This series makes walk_stackframe() provide a unwinde_state structure to
callback functions. This structure has all the information that
walk_stackframe() can provide.

Currently, there are four users of walk_stackframe(): return_address(),
perf_callchain_kernel(), dump_backtrace(), and __get_wchan(). All of these
have been converted to use arch_stack_walk() rather than calling
walk_stackframe() directly.

We need this to implement arch_bpf_stack_walk() that provides a callback
that needs the FP, SP, and PC. This will be needed for implementing BFP
exceptions for RISCV.

There are no functional changes in this series.

I have tested this by crashing the kernel and looking at the stack trace
with and without CONFIG_FRAME_POINTER

Puranjay Mohan (2):
  riscv: stacktrace: use arch_stack_walk() in place of walk_stackframe
  riscv: stacktrace: make walk_stackframe() more robust

 arch/riscv/include/asm/stacktrace.h |  2 -
 arch/riscv/kernel/perf_callchain.c  |  2 +-
 arch/riscv/kernel/stacktrace.c      | 75 +++++++++++++++++++++++------
 3 files changed, 61 insertions(+), 18 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
