Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E69C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 12:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LaD2q9lBC7Ruhp30W/FnwxUJnVFEuqhyYnWC5YRxuVI=; b=xtF4N9V5rTOSoj
	Sg9O85cf/ibesApI0e2Dl6Lg4TKKhHof8I5weHVAawvq7w5GiOVcaFfKEmms6iS/qgiq+78RT45cO
	tLbvW/XDQTyAjjyZrVfevqyuvXkA9e7uTzJd18N3CerEFQn+kESqkv9xstHQy7rDkfxI9saXUyZsx
	2+BcvC0aAOuZXZSyXmx+on5m6TjD6jIntv5fwe0pNl+U6f17Nrfe5gpLChSPeZx0GVjxyl+NqPgi+
	6a34oS1yJd1sdd+HNsMrmWxQkAujr+RxJxxYvUtCwPwVY1C5O5teBIwv1BMBqkl/ksoN50649dbLi
	RxCHMK9pO5nukWBvotSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPkKb-00AJRI-35; Sun, 21 Aug 2022 12:45:33 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPjFc-009meV-9v
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 11:36:22 +0000
Received: by mail-wr1-x430.google.com with SMTP id h24so10055687wrb.8
        for <linux-riscv@lists.infradead.org>; Sun, 21 Aug 2022 04:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=tBERBJeFmsU2gk0DqsvVk7OhaA+vX7d504uAWoZh04w=;
        b=IunUk0SKEn1nH9A85B2rFGOdzLzvhKfM0gFlEIcPkoAPXo4AzUcYqEXCcOxLXWrj1z
         AbEUWDg+04+jy3Fu0QvCXD1xFMIRaMvfxUVnKnfrfmoXEdYXprWWC/XNOT0FPBo1vL6D
         k/3vEXLEjiDdQGt2zOykFohvkYMDkXZWpHoMkByk2xiRiRzlTuyOA4g+ASE0gOQttgih
         o1Sl/4dF/zhAUA2z1C2A8eUPNoNGVU/0tLRmMgf56tCheoPeqQpcK3dL+sDn3uY5JQx3
         hmmiLwc2CcOeVdFoM49uCkFVV7nbhStM9cZTEJKNIzPUk1T632l/nVD040fstWJ8inVu
         e1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=tBERBJeFmsU2gk0DqsvVk7OhaA+vX7d504uAWoZh04w=;
        b=DbDVwbhA1sVqux0wvrR+mousPkCfOclMC1nLQ98xKTxvhZepd2y0XQeaNnydkF14AV
         d5SLcneDO2g2Ll4HSR20v1JRP+CFpXbvTR7EL/T56/p2zkeeDXVXSdu5ADsxDICiXsKa
         MPAGfBGiE8Ex/EBXupxpfFtPwacAADEjVzdlHORuojbcw/rXPpMMcAzDi4HznGzlx39o
         9vGEg12LtJgJeLVwI/PZnozvQa04uCasg69dHqhWitH5jLW11OwJRiyPsBka4ieDN60V
         qIuguUMoTTfFd9skBCcnVxalY1c9NBnKkoR06KKzQD/Z4j4wxS0zp9YxcycWtiFwmSrO
         KqYA==
X-Gm-Message-State: ACgBeo176EyiFMHGXoaTIfROtZZq/v8yN+I+RgNpXFT2nN3ypilX/D+o
	5qRRFGOF5Ygz/U1CPZVPZmiRVA==
X-Google-Smtp-Source: AA6agR5cyZy9CZWot4+CBW4LaR0SdclbcYK3AcOGPU3Q+v5vUQoWQM9YfCtFYFfA5X3trYU8FH6ocQ==
X-Received: by 2002:a5d:4882:0:b0:225:3148:9f85 with SMTP id g2-20020a5d4882000000b0022531489f85mr7667679wrq.224.1661081777100;
        Sun, 21 Aug 2022 04:36:17 -0700 (PDT)
Received: from henark71.. ([51.37.149.245])
        by smtp.gmail.com with ESMTPSA id m9-20020a7bce09000000b003a3442f1229sm14071361wmc.29.2022.08.21.04.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Aug 2022 04:36:16 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Michal Simek <monstr@monstr.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Arnd Bergmann <arnd@arndb.de>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Kees Cook <keescook@chromium.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH 0/6] Add an asm-generic cpuinfo_op declaration
Date: Sun, 21 Aug 2022 12:35:07 +0100
Message-Id: <20220821113512.2056409-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220821_043620_415688_CD5297F7 
X-CRM114-Status: GOOD (  16.36  )
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

RISC-V is missing a prototype for cpuinfo_op. Rather than adding yet
another `extern const struct seq_operations cpuinfo_op;` to an arch
specific header file, create an asm-generic variant and migrate the
existing arch variants there too. Obv. there are other archs that use
cpuinfo_op but don't declare it and surely also have the same warning?
I went for the minimum change here, but would be perfectly happy to
extend the change to all archs if this change is worthwhile. Or just
make a header in arch/riscv, any of the three work for me!

If this isn't the approach I should've gone for, any direction would
be great :) I tried pushing this last weekend to get LKP to test it but
I got neither a build success nor a build failure email from it, so
I figured I may as well just send the patches..

I wasn't too sure if this could be a single patch, so I split it out
into a patch fixing the issue on RISC-V & copy-paste patches for each
arch that I moved.

Thanks,
Conor.

Conor Dooley (6):
  asm-generic: add a cpuinfo_ops definition in shared code
  microblaze: use the asm-generic version of cpuinfo_op
  s390: use the asm-generic version of cpuinfo_op
  sh: use the asm-generic version of cpuinfo_op
  sparc: use the asm-generic version of cpuinfo_op
  x86: use the asm-generic version of cpuinfo_op

 arch/microblaze/include/asm/processor.h | 2 +-
 arch/riscv/include/asm/processor.h      | 1 +
 arch/s390/include/asm/processor.h       | 2 +-
 arch/sh/include/asm/processor.h         | 2 +-
 arch/sparc/include/asm/cpudata.h        | 3 +--
 arch/x86/include/asm/processor.h        | 2 +-
 include/asm-generic/processor.h         | 7 +++++++
 7 files changed, 13 insertions(+), 6 deletions(-)
 create mode 100644 include/asm-generic/processor.h

-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
