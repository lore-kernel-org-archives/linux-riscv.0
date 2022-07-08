Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1F02C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 20:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fBjy6mP1o+zxCbjR700gwRYKRI4gS3Zygw2wttSMBc8=; b=yZI444UNln8UXT
	wSRjnSPIsNcZ8yky8Y6Qpr+NlcGrYcUZKFOQ1qF5IIt6PvCCf+JoUvrBDK6Y52V22aYAck72eIQO+
	4UEyqZIf+7NWQzPqJwTL2O4Vwt4E4EBqhlBft5NVBcbyjSjFNWGe/HvQ/qxQKQHcTUoEpRRqAo7OP
	Xt/3ueSkUPqhtjw83y18tQreHvv1sT2oKCX1jeCGsDVZmvuPlzqqPiwvxQJFNojatrVS2R3bYVIDt
	MAazPR6gFw8iVZEVv66iQlJMN7tdO3vW1G2BzquvdzntNdjg9UryLfRKYnk+5DqaphngcDEADwcdc
	0F/MhjZjvooEDWUY9i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ufl-005otY-SO; Fri, 08 Jul 2022 20:33:57 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ufj-005orU-5c
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 20:33:56 +0000
Received: by mail-wr1-x42d.google.com with SMTP id d16so25637047wrv.10
        for <linux-riscv@lists.infradead.org>; Fri, 08 Jul 2022 13:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J7aE5Nbw36y+7KVb892AE4NEYNWfAfYQAkoZmLt8mFw=;
        b=fZBU276Fcxl+YM1cb4rfqdQjDpEA4t7V5dMpP1OBWWH58JiTETtYGW+BhpcP+fWWYp
         3l4Lw5RVRfJBZH+chhoxp0I0PDaILDdV7RCk9g4G4L6/FvxKEeAtAxhWM+qTj3pg/kbm
         WPLGyPfzRX7XZhFQKaIknluxpK6Bou54UXV4kno0mEQeAMQ9FHVBVPvV0P8Y2IOSqDIz
         jXEVgxbx0b2RdkhXNTVpD6oNq2gFLcF/noA9KWAMMaDq8KM708Jgoi5JZ4hmAFdCus/Q
         K9EsM+fW4IqQCnZg4modEg5IplVjH/lxaI9H2MG1vpSVVSpeGR/fapKz0HfvACLYcCgX
         08VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=J7aE5Nbw36y+7KVb892AE4NEYNWfAfYQAkoZmLt8mFw=;
        b=Q/+O8lhleahqnw2pxjSlcLG0bZ52oPKtTn4Nsa5SQWAI8plp7oQjjcXhVO4HAWaBKU
         CWP2Be/l7KsfvYO0AwyTbQ1PUenpXg+se5EoaMdA0zzBSBuz2c0AhwQygO8pphYSBp4T
         HuPYU/ibJ30uobsEQs42xHICNZpJLCQ13LTeY+45GYuEiQkGYeX/52X3NwdEKrnivzMI
         huLQcu031mhthetkTM091VXLvnipausnh8bWF15fsYiyF8FnX6yb0fZrwCO+klBR5MOg
         WG/9I8YPcDmCjp+W9/j+bKZinSslei12yrSaUYB5PylsBr7ERmoqALKHMZX+D8iqtccS
         /aLw==
X-Gm-Message-State: AJIora88GEmnwYP3CC5AIXE+fwL5jcrLCJqpZ0aAfV7FZwCoDcIw9Yk/
	RmpIAoVz3heDeNAZDpVxoqhjiA==
X-Google-Smtp-Source: AGRyM1vvjnkjIO4BJ/3OsUkxWtTWWxiuZDyW8gz8dsIe0ki9rXSxWqa7cMdlqhcr6EBYykIN6uzOxg==
X-Received: by 2002:adf:f1d1:0:b0:21d:7f88:d638 with SMTP id z17-20020adff1d1000000b0021d7f88d638mr5126429wro.586.1657312433655;
        Fri, 08 Jul 2022 13:33:53 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id a3-20020a1cf003000000b0039c8a22554bsm3165034wmb.27.2022.07.08.13.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 13:33:52 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Fix RISC-V's arch-topology reporting
Date: Fri,  8 Jul 2022 21:33:41 +0100
Message-Id: <20220708203342.256459-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_133355_252230_4925BEA0 
X-CRM114-Status: GOOD (  16.20  )
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

I only built tested for arm64, so hopefully it is not broken when used.
Testing on both arm64 & !SMP RISC-V would really be appreciated!

For V2, I dropped the idea of doing a RISC-V specific implementation
followed by a move to the generic code & just went for the more straight
forward method of moving to the shared version first. I also dropped the
RFC :)

Thanks,
Conor.

Conor Dooley (2):
  arm64: topology: move store_cpu_topology() to shared code
  riscv: topology: fix default topology reporting

 arch/arm64/kernel/topology.c | 40 ------------------------------------
 arch/riscv/Kconfig           |  2 +-
 arch/riscv/kernel/smpboot.c  |  4 +++-
 drivers/base/arch_topology.c | 19 +++++++++++++++++
 4 files changed, 23 insertions(+), 42 deletions(-)


base-commit: b6f1f2fa2bddd69ff46a190b8120bd440fd50563
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
