Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A69BC32772
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Aug 2022 14:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7AZyrRYLcBQ583pmnLutPiVJDJtABk9Cqbi9nFk7AOA=; b=SKaLV1J94WUfnY
	eRTvkX3FUU8CrLkTEUSRTMKO/cR1HKiIYeyF6Z8UJkjqJyTwsWWPXWKhwFhnK2jhAymkKrP7Hw/9f
	wczBuiP2UPuJI7S/J7b0bcdN1cLrJ/SUKkoSiIt8szwYiExWTK/CZfUt7ex5tVG5W3OSHhwOPqu+r
	ucn99RtHBgRJvacIIPEfWyrwoIEDBW8Z2jynexplk8q3l2XDce5ienSgxfOlhMUcyBd1UC58fOvQ1
	mK9q6Kq0tbaYeEv1NR3HOrkEVfePOqjlOw8vCzEFvTKS1X7kT1Ce6yoGmw5AHnxlFbxl0rDqJpNIY
	wYxytwJeFshtjJSWkcSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aT-009Kcb-JG; Fri, 19 Aug 2022 14:03:01 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP2aP-009KWc-NQ
	for linux-riscv@lists.infradead.org; Fri, 19 Aug 2022 14:02:59 +0000
Received: by mail-ed1-x52a.google.com with SMTP id z2so5800014edc.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 Aug 2022 07:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=ioRh9mRUb9BV3NN71JPPL0cy/65mLsur08UYOwEqqrU=;
        b=GZVjM0oT/jbRvlebZxN7MGMydyf11mil4YudVibKpm9RHu0qvusJx5AujpF2+GpHzy
         684FerrGI7EWa5eZmKfoiVJhZFCn09+ql//Qx7quIJmmF2fbzdv5tryVPnhO9LWI/H7U
         XOcEYnm0cajmwWKbwPfY9ELGQrEiXmHMbzK6dYmFim8L4cxOc5AyxxbYtDfwEjULQp98
         7Pn+76HSUVCJ2vFBKh9iY1msgUbQCf/CkyER2JocpK+HFyFMpMlW5v17aUQ7eWedMMrT
         PMZ46YEDDZazB+3fuWIjKufU0+HwILs2zo29o+jawzitCeEpmHdYTAjdFXh+XARmEcjs
         yH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=ioRh9mRUb9BV3NN71JPPL0cy/65mLsur08UYOwEqqrU=;
        b=5Jga8WljhbGrHeTGDunP6gcFRExaJqBMx0tHxnpO06MP6hTAyucdotvlXWzvNf3wHa
         PprWipZKrpUKePrOXY1b51R8Swnc+HJXvuxJIyvHcKITVd0R0m4Yx382fHsHOhOVrBfr
         5XQgFUAQDqV84R8GAtky1x2ehIVXi3GImQRik6x/phAEa6+aIPfMONQ+8ir3s1xStrq7
         UE9EZE4M4Co+RB6HGsjxJoUZnRreAJqvm7eXM1vU9C0vMIb4HAVdt5f/eRL1Kd++8Sso
         SVxoNDCoOYtg6SvMRvUCK8hjIyLzYqGzQBt7l9LaMwHEYMFsTCZDygXNrLNImP02/t+q
         zdYA==
X-Gm-Message-State: ACgBeo3PZVBwfOgybLJHQZA+3UcTnZvcRq9w7whBulcXBzID3sdWTNDi
	gPVt/XHijWk+Ib8RFm9uF84nfgnT+Wegtg==
X-Google-Smtp-Source: AA6agR7kfJlxF66pPKRv3SHolinYo6IHh4QECg6tWyE9EbC+k2VEVxhZYNRzPX5CfjVarStKjh10Ng==
X-Received: by 2002:a05:6402:4441:b0:43d:5bcf:afa0 with SMTP id o1-20020a056402444100b0043d5bcfafa0mr6211701edb.91.1660917771989;
        Fri, 19 Aug 2022 07:02:51 -0700 (PDT)
Received: from localhost (cst2-173-67.cust.vodafone.cz. [31.30.173.67])
        by smtp.gmail.com with ESMTPSA id o16-20020a1709061b1000b00734b2169222sm2363778ejg.186.2022.08.19.07.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Aug 2022 07:02:51 -0700 (PDT)
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
Subject: [PATCH 0/4] riscv: Introduce support for defining instructions
Date: Fri, 19 Aug 2022 16:02:46 +0200
Message-Id: <20220819140250.3892995-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_070257_828959_C5F54857 
X-CRM114-Status: GOOD (  11.69  )
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

Andrew Jones (4):
  riscv: Add X register names to gpr-nums
  riscv: Introduce support for defining instructions
  riscv: KVM: Apply insn-def to hfence encodings
  riscv: KVM: Apply insn-def to hlv encodings

 arch/riscv/Kconfig                |   3 +
 arch/riscv/include/asm/gpr-num.h  |   8 ++
 arch/riscv/include/asm/insn-def.h | 104 ++++++++++++++++++++++++++
 arch/riscv/kvm/tlb.c              | 117 ++++--------------------------
 arch/riscv/kvm/vcpu_exit.c        |  29 ++------
 5 files changed, 133 insertions(+), 128 deletions(-)
 create mode 100644 arch/riscv/include/asm/insn-def.h

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
