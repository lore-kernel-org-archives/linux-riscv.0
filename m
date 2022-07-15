Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F02ADC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jul 2022 17:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pyNnWWzNwa4IIIcEymjSUkz0fEq5R1m9gbszB/loOCw=; b=WzT9A31b9/CD3c
	91UrlXW9HoE6mvZJE77NAMG1Dlb99DXJykS0GT0hP826v78wl1CIAzaANk1yxyogRCjARlAdjbEdZ
	gubrm8p1fHVaygoBGDW4vauIH+6PkVIWbP8KWy1P0ASRsptoxWK+cvn6lIHtzDfau1Pe5ycI/rLKz
	Y/IWmfm+cMkmjUdqgXm/3JkGdFwHuC0EedA6dfupHXVAFuFYVtvLTnNnuHpvFzFn4Kp98anCNCp6e
	zL9GU9kUa0qz/WUOCrVxkKjusyAfoSuHco1cs9jDMA53SKJGjhyAWTP3LCLU449xFB3to4mauGATG
	Fm407TxPiA552Xe9Vy5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPVY-009Hxn-LD; Fri, 15 Jul 2022 17:53:44 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCPVV-009Hw2-ES
	for linux-riscv@lists.infradead.org; Fri, 15 Jul 2022 17:53:43 +0000
Received: by mail-wr1-x42e.google.com with SMTP id h17so7787151wrx.0
        for <linux-riscv@lists.infradead.org>; Fri, 15 Jul 2022 10:53:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H7FdqtQskr0feGEMESNye0rnehyoWZm9I2IR2qQbWhw=;
        b=JXY9tG2WRrIfIGRKFohwcnYsUQVcSdNBZ0QIGMlDIRqOWRYIzyrwhMfXSxiZolGhlz
         UWrxE1UeKpDBH5S9j/w3Oe0wOc0gaEMnZoj8v6PyId4PI0r0rxgKn5Tztce2L/BFxYIl
         MBrrLnvciZ/KnPWkPpgpubUUVfrvJA2VXNl1ur33S/pN3jhfrvHYwkLphcBcOzXm5UOB
         kbQeKNF63/K44eKvMFOwEhd1+uvrrkhzcGjfSf8Gk2QY7QPBm+WPHbyAAfSCMS+eCOiW
         swSCRO0Fu0G0IgVCoEP3escuvfEGpga6GeL3RBEFg1OGRftF39s4qfhdXMgBJ3AAxocU
         dLrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=H7FdqtQskr0feGEMESNye0rnehyoWZm9I2IR2qQbWhw=;
        b=v7nKq+MuQE2ISnwl/V1P/sSU3vIlCyaZgJ+0nu04B6OcmeDr9fBpnzcnTTO1vv40/0
         K99NQCEJ8/ixHLmg94JRdU/5rCw/mC+q1pim836Jf5GzoroWXAJwq2g2NqaSfVAR11tK
         q8CFIx5DhnoqI/SRi5dK3NbfmELJDardgyno+j2vG/KfdZisShuV8xseegaqGhkkHmVf
         cLjl+ve+9XNA9AeG5+ut5O7s94aZ12ywBkwNla89MX45+qy1RKxc04mE/ZC0FEAVxt/u
         d21J2m4UNelpwn7jmO0F2ub1MDtf1cTVj1KrHlzoaYq0MjZ0z/lPE+4QVbxiQW3KzYBL
         /Txw==
X-Gm-Message-State: AJIora//KbzvQ8xjNMghiLiD9/rGO6BjLSobo4xLowZFK1YYnNUdvOa7
	ibPWTGW7qzkP5YNAybpxrr2soA==
X-Google-Smtp-Source: AGRyM1vAaj7pVFqqnelORFYKWYhdT3B3rL63PBVd14yEq7ucjnt/2MVUoT9Qyfj1fcyeS3ao5/kSog==
X-Received: by 2002:a5d:6c63:0:b0:21d:bf45:f90f with SMTP id r3-20020a5d6c63000000b0021dbf45f90fmr11182223wrz.715.1657907618412;
        Fri, 15 Jul 2022 10:53:38 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id n9-20020a5d4c49000000b002167efdd549sm4364131wrt.38.2022.07.15.10.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 10:53:37 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Zong Li <zong.li@sifive.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jonas Hahnfeld <hahnjo@hahnjo.de>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH v4 0/2] Fix RISC-V's arch-topology reporting
Date: Fri, 15 Jul 2022 18:51:54 +0100
Message-Id: <20220715175155.3567243-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_105341_524275_D924DBD4 
X-CRM114-Status: GOOD (  17.68  )
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
It's my first time messing around with arch/ code at all, let alone
more than one arch, so forgive me if I have screwed up how to do a
migration like this.

The goal here is the fix the incorrectly reported arch topology on
RISC-V which seems to have been broken since it was added.
cpu, package and thread IDs are all currently reported as -1, so tools
like lstopo think systems have multiple threads on the same core when
this is not true:
https://github.com/open-mpi/hwloc/issues/536

arm64's topology code basically applies to RISC-V too, so it has been
made generic along with the removal of MPIDR related code, which
appears to be redudant code since '3102bc0e6ac7 ("arm64: topology: Stop
using MPIDR for topology information")' replaced the code that actually
interacted with MPIDR with default values.

I only built tested for arm{,64} , so hopefully it is not broken when
used. Testing on both arm64 & !SMP RISC-V would really be appreciated!

For V2, I dropped the idea of doing a RISC-V specific implementation
followed by a move to the generic code & just went for the more straight
forward method of moving to the shared version first. I also dropped the
RFC.

V3 moves store_cpu_topology()'s definition down inside the arch check
alongside the init function so that boot on 32bit arm is not broken.

V4 has moved the RISC-V boot hart's call to store_cpu_topology() later
into the boot process it is now right before SMP is brought up (or not
in the case of !SMP). This prevents calling detect_cache_attributes()
while we cannot allocate memory.

V4 is also rebased on next-20220715 to get Sudeep's most recent
arch_topology patchset.

Thanks,
Conor

Conor Dooley (2):
  arm64: topology: move store_cpu_topology() to shared code
  riscv: topology: fix default topology reporting

 arch/arm64/kernel/topology.c | 40 ------------------------------------
 arch/riscv/Kconfig           |  2 +-
 arch/riscv/kernel/smpboot.c  |  3 ++-
 drivers/base/arch_topology.c | 19 +++++++++++++++++
 4 files changed, 22 insertions(+), 42 deletions(-)


base-commit: 6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
