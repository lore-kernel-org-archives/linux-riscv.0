Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7762ECAAD1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Aug 2022 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xN6zfMUaZFXz8C8XI8woWwPLbS+VPsuPgWsGFX9nne8=; b=2I7PpiM9yjPvDm
	cE42l7WiyVmv0mtaygfuThXz1stKk5Tx3N8ouNdFcX7NfBXhRltnWyzbU/ilNJ473FN5thbkpeK+r
	zCvy+t6otw4z5AiLmzrNoSj+LWgb+HUIOBBustljUbRLIyLuIFURScqhHsHDMJdiYL5e1lpUIQoTF
	AXVUiCBD2pgNUZ0SnPCpDc06OfrD1nnhyJoW6sdJFt966sOR7i75eapOoUzl9UX+w3w57StlTUwrB
	YR2n0iZF8cBsIwiXAAzsNal8GNvLi1L/rUp6Ghsmrp4jV1VnQ2Z3gZxjDiKmAqrCrxyEsCLHpYxus
	t0QNeVxbp6o5zw9quW1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSf-007OjK-DQ; Wed, 31 Aug 2022 17:25:09 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTRSc-007OhB-EI
	for linux-riscv@lists.infradead.org; Wed, 31 Aug 2022 17:25:07 +0000
Received: by mail-wm1-x336.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso3450341wmr.3
        for <linux-riscv@lists.infradead.org>; Wed, 31 Aug 2022 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=lCJ0X4MxUytr04uLAZfmQJHTkCXKEdN4OMX7NFuLbu4=;
        b=Q3S1nbqunZ84BvgZwdQEX9PqqmrAQNvv4jEpzOY6BxlVLuE1IoEXXKjtROg5F47oGL
         Qmgb6STeBCzOkRHYA4Ne5LCR3shk0edN6ixDwGEOmpVeXYkQhvljK6DgLIDriZudG/l4
         R9kRylrw4IRf/Ik/VfxbiZA7Vy6m9O2+VhVX84kEIIicDRd+XVGOY1skq4e9sJgwxeE1
         qVa5vU7B03fD0XKY5xDRIbfjgSA4ghgQfLYadm9VzUvb01KPQA0/WWKsFPyCYIfs7y8t
         t1ZrwnVoScEV5jD9tVG+ndJ/vE1kWpH5HtV+yjsHgiQyd2lQ2hKESKqN4qEb5xIPtW0n
         qC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=lCJ0X4MxUytr04uLAZfmQJHTkCXKEdN4OMX7NFuLbu4=;
        b=o4iS98o2xeMjTtKmSqi+4PxFu33qq9Bi/rgxKETJ6NRmNGjaTRQ+yq00Mmxq/JyEQb
         ZMC+FeFE6QhzPUS1oBCnbjbYNr9sbzf6MfsaBDVAMmvBtObpwmHdIyg7VJvnil/zAPzM
         l+AD6Gf7bX/tpaVqj1mPwNU2Ieo1rgpyVVCAnQumRXRN2glfmQnucVWRtg4rcuPqhAy+
         QbgNzYYhdEpSTset4qeFXP+Rxj7FeR8UpoAlsB2dIeVxhw2fi8JeouzBXOQxFFRgC+ZC
         rnAEK6cuupey1LPIrlLMcVLijheKkdOmRrLu8ZRCuT/35CEUnJMpuGpbRK7sgQF9fgiP
         AWxQ==
X-Gm-Message-State: ACgBeo0p+WO7rsVYRich2ey7kBgE48H3kwAGqJpBLGFXYh53FytvknmW
	98zqnx0MPJeU3/sDa4j/wHsEDlKAQJT6aQ==
X-Google-Smtp-Source: AA6agR7AG0MhMcCgUXxNj/1M4XOFv1/Vik4cv/p81wTY7rbGynK6w5HUZOKiGVN2hPE63IiOUAeS0g==
X-Received: by 2002:a7b:ce09:0:b0:3a6:6561:d9d5 with SMTP id m9-20020a7bce09000000b003a66561d9d5mr2664876wmc.62.1661966702341;
        Wed, 31 Aug 2022 10:25:02 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id da12-20020a056000408c00b0021ee65426a2sm13746758wrb.65.2022.08.31.10.25.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Aug 2022 10:25:01 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	anup@brainfault.org,
	mchitale@ventanamicro.com,
	heiko@sntech.de
Subject: [PATCH v2 0/4] riscv: Introduce support for defining instructions
Date: Wed, 31 Aug 2022 19:24:56 +0200
Message-Id: <20220831172500.752195-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_102506_505132_EBC42185 
X-CRM114-Status: GOOD (  12.45  )
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

When compiling with toolchains that haven't yet been taught about
new instructions we need to encode them ourselves. This series
creates a new file where support for instruction definitions can
evolve. For starters the file is initiated with a macro for R-type
encodings. The series then applies the R-type encoding macro to all
instances of hard coded instruction definitions in KVM.

Not only should using instruction encoding macros improve readability
and maintainability of code, but we should also gain potential for
more optimized code after compilation as the compiler will have control
over the input and output registers used, which may provide more
opportunities for inlining.

I grepped for other places we may want to use these macros and the
only place I found was ALT_CMO_OP(), but I didn't dare touch it :-)
I do suggest we apply this to the Svinal support [1] as we won't
want to frustrate the compiler's inlining efforts with hard coded
register selection.

[1] https://lore.kernel.org/linux-riscv/20220812042921.14508-1-mchitale@ventanamicro.com/

v2:
 - Cleaned up some whitespace issues pointed out by Anup, myself
   and checkpatch and dropped some {}
 - Pushed the quoting of register tokens into the macros
 - Picked up Anup's r-b's

Andrew Jones (4):
  riscv: Add X register names to gpr-nums
  riscv: Introduce support for defining instructions
  riscv: KVM: Apply insn-def to hfence encodings
  riscv: KVM: Apply insn-def to hlv encodings

 arch/riscv/Kconfig                |   3 +
 arch/riscv/include/asm/gpr-num.h  |   8 ++
 arch/riscv/include/asm/insn-def.h | 113 ++++++++++++++++++++++++++
 arch/riscv/kvm/tlb.c              | 129 ++++--------------------------
 arch/riscv/kvm/vcpu_exit.c        |  29 ++-----
 5 files changed, 146 insertions(+), 136 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn-def.h

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
