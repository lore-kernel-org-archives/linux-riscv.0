Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C708BC61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 12:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=swW7HaiD/2P4zhqEaQqIJfOsuKdLHEXuOSXIzy2Ta18=; b=0XOKyGthBUylJ5
	7nzko7xK96dCuDAJq6HmiyrH3Ycamrz7gRRf1mgjxc62t35oHS3dXKa9Q4EPobCnMEaZ+ab6qjkWa
	uG27+/tmZHC89yLBnqt9biSHaum8QSAjcpQGVpGKg1foTcJtcixL94QRrfA17HZcF3zxiHWPBXTDe
	1Xw32CTzoZiN0VqBwzRAbQHAyaUzN5bRxgH6Ge/Q2kNNof4Y7PhXtu2aROSWwNYeoJhbLdWXkK4gM
	RcBP5ne84NRUnDj9RdwAbROYcFoEM0dQH80JnO65bdeQl0xPv3MKXtngkZCegryoulTlg/qVd3OCt
	rVu4a3A3rW51zaixBNNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqz-003PCJ-TZ; Mon, 30 Jan 2023 12:01:41 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMSqs-003P6N-Ck
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 12:01:36 +0000
Received: by mail-wr1-x42b.google.com with SMTP id bk16so10797890wrb.11
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 04:01:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yH/gO5N0kqjmbu62baGKBomi1dU4BWfAYFq9WfQBOEU=;
        b=iTdq8ML4SXPrfXDlz9xdd2c68gefk0eDPQDrT3OX+3/qsnZVYLLh6cZQGCLd2tlv4g
         udtg8vUram52st60PYfz0sC1dXzns/SbMsnBQSBrLTcpzzWrtS+GZ1iDyt58E5jcpguq
         MmoxgNZJ6r9HY7Z2cHx+9D9XftBsxRcEL0est2IwStmU/s+dLKcaxC8uA5wQ9rnNIJUS
         7Cd5vqMnMYCfjVNpMw4otYQqJIXfDUvTgqrdLjQwmFaLh+m2j+y0FykGjUsAq/bQF8GK
         zv1Y8kSwK8/x44rMS822Xhp8OqXhtf7uJlco9tsa2Pgwm5/AhPHJsboP+CilMlSWGCGv
         OhQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yH/gO5N0kqjmbu62baGKBomi1dU4BWfAYFq9WfQBOEU=;
        b=PWBw5FO+OTlCgYjYk2Oqrji0vL72Vehchb+2IcM6E6q9YK2hNfM3EukT57Bk7vcdCF
         DppCnZdz3rn+UPMTb4PDoOZZVhdg5w2g6u2O61l6arks9MWl6cOG8Ca5fdu54YgcEzGe
         8WSqWsuKE1izqZXthl2nCW8b4mth0fWvy4dnqSl7gg1FYIOap/PCTlXYNtnC5aEa7l6f
         Aky9r0gwe6JF+5xBFTR6fd4/FR25SZU50gtDMho98Sp/FRMqO1qaVRl6vo4WmDOHniWN
         i9o/1YVtk+2wl4G6Zo698oqNX1FTEstGvHZXiF2T+tx4MeaTYylSybEZhd+9eZH0h61C
         habg==
X-Gm-Message-State: AO0yUKXxVCS7TQp5V8aYgr262TP6vyyX35GCXlZfkx7WAUZgE24MtZah
	lXoF8zXyRXYRulXNqzIlToXLlrJwglIjNzon
X-Google-Smtp-Source: AK7set9Os2ZSAyRG6v1n+b4EAk74zWbDwYp3fTf3UnViCLkdJ6ADkPdhpGcbT2B3b4WytQ6oBEkHrA==
X-Received: by 2002:adf:c651:0:b0:2bf:ecee:acc5 with SMTP id u17-20020adfc651000000b002bfeceeacc5mr3408988wrg.5.1675080090126;
        Mon, 30 Jan 2023 04:01:30 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d452f000000b002be505ab59asm11644030wra.97.2023.01.30.04.01.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 04:01:29 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: 'Heiko Stuebner ' <heiko@sntech.de>,
	'Krzysztof Kozlowski ' <krzysztof.kozlowski+dt@linaro.org>,
	'Anup Patel ' <apatel@ventanamicro.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Atish Patra ' <atishp@rivosinc.com>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Rob Herring ' <robh@kernel.org>,
	'Jisheng Zhang ' <jszhang@kernel.org>
Subject: [PATCH v3 0/6] RISC-V: Apply Zicboz to clear_page
Date: Mon, 30 Jan 2023 13:01:22 +0100
Message-Id: <20230130120128.1349464-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_040134_441742_81355407 
X-CRM114-Status: GOOD (  16.32  )
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

When the Zicboz extension is available we can more rapidly zero naturally
aligned Zicboz block sized chunks of memory. As pages are always page
aligned and are larger than any Zicboz block size will be, then
clear_page() appears to be a good candidate for the extension. While cycle
count and energy consumption should also be considered, we can be pretty
certain that implementing clear_page() with the Zicboz extension is a win
by comparing the new dynamic instruction count with its current count[1].
Doing so we see that the new count is just over a quarter of the old count
(see patch4's commit message for more details).

For those of you who reviewed v1[2], you may be looking for the memset()
patches. As pointed out in v1, and a couple follow-up emails, it's not
clear that patching memset() is a win yet. When I get a chance to test
on real hardware with a comprehensive benchmark collection then I can
post the memset() patches separately (assuming the benchmarks show it's
worthwhile).

Dependencies:
  - "[PATCH v5 00/13] riscv: improve boot time isa extensions handling"
    https://lore.kernel.org/all/20230128172856.3814-1-jszhang@kernel.org/
  - "[PATCH v1 0/3] Remove toolchain dependencies for Zicbom"
    https://lore.kernel.org/all/20230108163356.3063839-1-conor@kernel.org/

The patches are also available here
https://github.com/jones-drew/linux/commits/riscv/zicboz-v3

To test over QEMU this branch may be used to enable Zicboz
https://gitlab.com/jones-drew/qemu/-/commits/riscv/zicboz

To test running a KVM guest with Zicboz this kvmtool branch may be used
https://github.com/jones-drew/kvmtool/commits/riscv/zicboz

Thanks,
drew

[1] I ported the functions under test to userspace and linked them with
    a test program. Then, I ran them under gdb with a script[3] which
    counted instructions by single stepping.
[2] https://lore.kernel.org/all/20221027130247.31634-1-ajones@ventanamicro.com/
[3] https://gist.github.com/jones-drew/487791c956ceca8c18adc2847eec9c60

v3:
  - CC'ed DT list
  - Improved commit message of DT bindings patch to point out relationship
    with cbom-block-size
  - Picked up an a-b from Conor

v2:
  - s/blksz/block_size/, improved commit message for "RISC-V: Add Zicboz
    detection and block size parsing", isa ext sorting [Conor]
  - Added dt binding patch [Heiko]
  - Picked up r-b's from Conor, Heiko, and Anup
  - Moved config symbol and CBO_zero() introduction to "RISC-V: Use Zicboz
    in clear_page when available" and improved its commit message and
    implementation (unrolled four times) [drew]
  - Dropped memset() patches [drew]
  - Rebased on ae4d39f75308 ("Merge patch "RISC-V: fix incorrect type of
    ARCH_CANAAN_K210_DTB_SOURCE"") plus the dependencies

Andrew Jones (6):
  RISC-V: Factor out body of riscv_init_cbom_blocksize loop
  dt-bindings: riscv: Document cboz-block-size
  RISC-V: Add Zicboz detection and block size parsing
  RISC-V: Use Zicboz in clear_page when available
  RISC-V: KVM: Provide UAPI for Zicboz block size
  RISC-V: KVM: Expose Zicboz to the guest

 .../devicetree/bindings/riscv/cpus.yaml       |  5 ++
 arch/riscv/Kconfig                            | 13 ++++
 arch/riscv/include/asm/cacheflush.h           |  3 +-
 arch/riscv/include/asm/hwcap.h                |  1 +
 arch/riscv/include/asm/insn-def.h             |  4 ++
 arch/riscv/include/asm/page.h                 |  6 +-
 arch/riscv/include/uapi/asm/kvm.h             |  2 +
 arch/riscv/kernel/cpu.c                       |  1 +
 arch/riscv/kernel/cpufeature.c                | 10 +++
 arch/riscv/kernel/setup.c                     |  2 +-
 arch/riscv/kvm/vcpu.c                         | 11 ++++
 arch/riscv/lib/Makefile                       |  1 +
 arch/riscv/lib/clear_page.S                   | 36 +++++++++++
 arch/riscv/mm/cacheflush.c                    | 64 +++++++++++--------
 14 files changed, 130 insertions(+), 29 deletions(-)
 create mode 100644 arch/riscv/lib/clear_page.S

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
