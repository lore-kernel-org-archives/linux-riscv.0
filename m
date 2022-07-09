Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A52C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Jul 2022 15:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ovv5SiCwNVnBYTIRv9fe+fmECI9ncH+IvBSP89IqjcY=; b=u50ijzwCWrKnyv
	Kpk0RY5Ut8fkYxtzlJU8c3ezRYvBxUz8h91LsWqjbSMc+VQXPKp9SXDiCrR/9Tt/J9egAmQF6vvxB
	fO/1CwvirBojGM1utbcZA4gsqORVCDV+bx/x/NhhQnLvehVDrqFJdA12DLBIFQzWLnwAVh5wj9BU7
	lb8QTqrOv7eQOW3iKNKU9WSbgJWJx12WTqlqtgYjyY465UdMxLLtfmVYdBWso9FwsBdL2H0Qaloav
	8GfpDpu6xNyQEO7Q2VEPC+8hnCp1qpRJg6tG4m+Et8f9JbBYikuSFCQrldzbtIFDAhYzQ2ATRgbjP
	89/Ty7XK8tczZyDJ4P7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oACKI-008RoW-EV; Sat, 09 Jul 2022 15:24:58 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oACK4-008RiB-K0
	for linux-riscv@lists.infradead.org; Sat, 09 Jul 2022 15:24:46 +0000
Received: by mail-wr1-x42b.google.com with SMTP id q9so1840346wrd.8
        for <linux-riscv@lists.infradead.org>; Sat, 09 Jul 2022 08:24:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlYEDG/Aq6CKRcdir+VJjOvlvPk+ZQG3YqkRE4NjZeM=;
        b=NyOtj2BiWZbts+G7i2cImegn1yuZO+butLRR01SJffpGEu4A3kPGjnnim7079L1lZ7
         9MmCXtqJAN2zbiRsdivXlvRtJHn3HfLKix6IskPoSYjcrFMgfN8/oXjSugzoDfkje4QK
         YuQernyWi8KynWB0PCNdbfda7w1b0j/SQywtrv7gyL1DBzCSbOdptzQxxn38XrsikdBF
         qZbS1HpxuVea9GxpcMAZZW7WQadg3drzAN0V1CMiCBmzbAXcuN7Bxm2uIQtryEaYe1Av
         F2GDuXBE5ZIQqBZDQarTaPHaP5U9n7KjDL/HlOjgICzq5kOjj7eBX0gAxNbW7TmKas4X
         2maQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RlYEDG/Aq6CKRcdir+VJjOvlvPk+ZQG3YqkRE4NjZeM=;
        b=xdHbK4OmYaDobXaoac5Tx7M+VUNo4OHGF9GGf7ir6xV6y0uReKXHIxVfMnigdo2MM1
         Ml4+hKXtFQMvMJI0sgy3KtVIfLgPz5+MAWmPn0Q+TRoplNRSxODBkWm6g4nn3pPGlZDk
         8qmEgPmGPNKglGpLfbP9Ss+gtXD1towQRp5CoKjbLDxUKnv2+OPDAEHjNfTFstJk4tAG
         zgfMKGcwlaKEcenH3LMk21voYazhbQTJbH3r0UnQKoGnFPfxhy2y9lCnRaAzNAGuzbAt
         9xB7BY7UCkxj07EW49HM7BP+BIyHSpxhB9LJz9NX7MyxdRzjn4+6C892dF49CvPu88va
         ZDug==
X-Gm-Message-State: AJIora/MhExb64vlkQDypiM4KvrB/SrAtapXE1pAqmhHhJ8kZbCaY937
	zqmbIytpCO27mUkZFXoRNfpeaA==
X-Google-Smtp-Source: AGRyM1tieCoHD9A7Yw7K0uvcAi59jSz2pwdtWc11EeCwXaSND7420PDrYPfA1NC3F8HHXEgUzVMP3w==
X-Received: by 2002:a05:6000:154c:b0:21c:65c8:2ef with SMTP id 12-20020a056000154c00b0021c65c802efmr8531726wry.473.1657380279147;
        Sat, 09 Jul 2022 08:24:39 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id y12-20020a5d620c000000b0021d63fe0f03sm1626730wru.12.2022.07.09.08.24.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Jul 2022 08:24:38 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Fix RISC-V's arch-topology reporting
Date: Sat,  9 Jul 2022 16:23:53 +0100
Message-Id: <20220709152354.2856586-1-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220709_082444_663328_C7597077 
X-CRM114-Status: GOOD (  16.26  )
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

V3 moves store_cpu_topology() down inside the arch check alongside the
init function so that boot on 32bit arm is not broken.

Thanks,
Conor

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
