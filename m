Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7970CC43334
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Jul 2022 22:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=masomF9tsJVwpjRlNrVSrgE+9ma715n/AAejSMPXVyM=; b=go9lvR6XwExjYy
	1YopOT3QppxgVB4GkF7yBMOvCrjOQkAysasKIeoRtX2bZC5MY0pjGpe2IpJH1g3orTctxWeomAyWF
	Bdssawe9y5tpNsvqFXHT/Sfl5AxZAbZKp3SVgPHpVJERx7zocWjbsOrCD4u5d88PyUgORaXaU8wx1
	zvwbdeRmpk7C5ndnmD0cf/GpKQFpt9dpnC0m+mmfqG3eB9ixud/eJD+DLtutM690+i6QoloUT48i3
	FDL+512fUyDUP9+7otcyAp8ijHxYZ4FHeNJbJox6CrYYs3xyj3qkdE/UToTkOd9ydd1vx4sn6xIti
	uNNBAIbcBhaAAqn+4zUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZcZ-000Rrf-4S; Thu, 07 Jul 2022 22:05:15 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ZcK-000RgW-EB
	for linux-riscv@lists.infradead.org; Thu, 07 Jul 2022 22:05:02 +0000
Received: by mail-wm1-x32b.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso144728wms.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Jul 2022 15:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wEvKldrbzSpzvzf7cF/tBIG4OcicbyZqv1HMnAM6uU=;
        b=I1/2ncRqvqMJy+BGVzbQhxi6htaIzb4VhybmgmPLzthBnhtOWa1dhgLto1BEsgTICP
         AhL5XT89aMYm1DAtXKmKWwE9NBPz1eY4PLcSWiH2q0mJJAmuFjZlwEEz9Y43xPBsUINp
         sR7ZWsa5kDlUPQNe4RjdPPWrjh/FqAF0bf0ektOZ3IjdibERqs9szNiKFFiqJ3qUHKuO
         9YOIl2Rih4qq0W54K/de/mjzekiUFVRWxhN7ISo2MUFJ3Dq9O3BVE9S7FZogDMX/4iUB
         SnhQaaxBQuBfbaRfIgreoD3oo3bWKSwL0QYZC+iRtn9RlCZni3w7odpZ4TwEHyEKzB17
         7mjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7wEvKldrbzSpzvzf7cF/tBIG4OcicbyZqv1HMnAM6uU=;
        b=fqZFAnVROxAPNi8sMGxdVeqKMxhRR9J8H9Ge9agTX0u2Wf08RNMgAnkL9OL49ue8bE
         z3kRn4MzrY1yuChxAfEGAb3CNQCVyubfl9GiGMsFHmH/YjAY/xvnGBSBOLt/AlJZS7Rl
         LB6/5KJZa2xcv9rN5msLcGGvo1mAmxeYLV9R0Gj7g60CYZnSW65HWJu33es6XHRwp1SB
         gqqgbMsU958R1Wdu5EhnLioNPkaBATWDE9ii/puA4258TEOo3vs8oSRPGjo8pcDE+oaP
         BL+nF+odUv+U10iwwLeWzy5/eedtuLdRiPFKMLqfL+vlgDUZ6CD+UR8d4mW0sc/dSkaY
         6yjw==
X-Gm-Message-State: AJIora/lZOZqsr0xQglBoTdVF36xAnKv+ccNXC6JDuZvZJzUjPc7YNU6
	lSjH2V9o/3eN4SKEfwEtkHXU3Q==
X-Google-Smtp-Source: AGRyM1stTlaaZ8PDLMgVyLk3b3v8YtrUwDb/ZvBcVWXgdsJfv7RfAopcWzGfUfqfzcky8NyVUR+nfA==
X-Received: by 2002:a05:600c:1d03:b0:3a1:7ab1:8dc6 with SMTP id l3-20020a05600c1d0300b003a17ab18dc6mr6641236wms.103.1657231496073;
        Thu, 07 Jul 2022 15:04:56 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id bn24-20020a056000061800b0020fe35aec4bsm38625743wrb.70.2022.07.07.15.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 15:04:55 -0700 (PDT)
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
	Changbin Du <changbin.du@intel.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Rob Herring <robh@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Brice Goglin <Brice.Goglin@inria.fr>
Subject: [PATCH/RFC 0/4] Fix RISC-V's arch-topology reporting
Date: Thu,  7 Jul 2022 23:04:33 +0100
Message-Id: <20220707220436.4105443-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_150500_585504_0A7FE21F 
X-CRM114-Status: GOOD (  15.57  )
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

Because I want to backport that fix, I implemented store_cpu_topology
for RISC-V before migrating to the generic version which seems to have
just complicated things, but was Sudeep's preferred way of doing it.

Palmer, I have not marked the first patch as RFC because I would like
it to be taken as a fix for 5.19-rc(late) independently of the rest if
possible.

The rest of the series is RFC b/c I don't know what I am doing ;)

I only built tested for arm64, so hopefully it is not broken when used.

Thanks,
Conor.

Conor Dooley (4):
  riscv: arch-topology: fix default topology reporting
  arch-topology: add a default implementation of store_cpu_topology()
  riscv: arch-topology: move riscv to the generic store_cpu_topology()
  arm64: arch-topology move arm64 to the generic store_cpu_topology()

 arch/arm64/kernel/smp.c       | 16 ++++++++++++--
 arch/arm64/kernel/topology.c  | 40 -----------------------------------
 arch/riscv/Kconfig            |  2 +-
 arch/riscv/kernel/smpboot.c   |  4 +++-
 drivers/base/arch_topology.c  | 19 +++++++++++++++++
 include/linux/arch_topology.h |  1 +
 6 files changed, 38 insertions(+), 44 deletions(-)


base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
