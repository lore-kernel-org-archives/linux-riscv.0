Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAD7C25B4E
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Jan 2023 19:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XiTDOHnSJhjeNmlgQF9MSAgbTBlAPtlPG7a5BRUM4V4=; b=gZ3PvvEZQ0/p2J
	9in1enxi1uFasRl6GsFSr6PiyUD0EPpo/HCjX5j1WYItghRDK1e+XvdA2PCbJ5lNRpVcOcxRG8Ynl
	0sFwwkX5F4fmogHJxLkMCWfEb+yOsoo1AxHGM6j0RLWE6WjuPQZmWFRCzCmRAPcrBa3le4wcQdSSL
	c15S7lV1I3UxEUTKphXQ1Nb1AvWQ8t1OUi9LxKxfaL7Kq0fLFS6hY6fK8F8P4P69/R7D45Z+0eCvH
	tR6WgOefum1RF8hgQw4bWMsWkwCmPR+TKGO0FTX0pzmFPDSmD/Q6DVzhyuEKEA7nQZjLa7AnsCGCo
	97qPpTdpJfWPLBuTDJrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfma-00FiCY-Li; Sun, 22 Jan 2023 19:13:36 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJfmX-00FiA0-5A
	for linux-riscv@lists.infradead.org; Sun, 22 Jan 2023 19:13:34 +0000
Received: by mail-ej1-x634.google.com with SMTP id v6so25605663ejg.6
        for <linux-riscv@lists.infradead.org>; Sun, 22 Jan 2023 11:13:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s5LMhS5BHNu6S5nvXtzMj/Xvjo/0UzvliCWHkjEhSu4=;
        b=n/YWlYsNjwTe2SCaK9Gp7dqWzIU9Y4oTFNRtec/sX8O+liRO05L1tYRY+wc11YKSb0
         Q1oQQ/5WK6wgdmLuhaYVf2J32gNPmBlRNedsoFqdteSzPwNPFDwKsCR/a8tB/ECap4WT
         Svl+h7XP5Zqfw/H8/HBzBJJtaHxdIA6iQuPwqBSzkjI5xnfnWP6IHTwouy4G7XG5/OW+
         MPdrHSUmvP4zEusp64Fqu05iVxn06H+pujZPdMcaC+FdGsjROhHbAI5i+h0WwKz35+Tz
         YZHL2qqr/hX14UT7+jNPtEDH1AnAnHQQ+9DWNn3vCZdkFyeuUixb3zKhQdUQF0Cike93
         ECcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s5LMhS5BHNu6S5nvXtzMj/Xvjo/0UzvliCWHkjEhSu4=;
        b=Xuk9ZDGHxPb2FFLNpKVUNsPNMSUO7sUM8Wu4+GIIERSva62XLptUOYxie/Yk0pn9wr
         I/VlCAIIkUzOUMykoYcQtWdivd/+SqmAGLgZdC3QRFje5wKU1yQopmmH0FUbBGojbNgx
         9DsH8SeWtJ+XQD1AOn53pOVZRMyxNzeDwkEOfX8dmpkvKNeRGeSgsIZsnvZ6tVqNU+3c
         qcP4FT7jKwsJhb6e83IhDhesj31Z9C+8aR4U0CKZjlr9BDTC8uWTpwx7/GQeVewiyqgg
         XjRG5FsKLw1uVwUvzLUU8KWJg6jjscN+EsIndw9X4EWxYG5Z1cIlF6//CAmZbrFroLC5
         LUOQ==
X-Gm-Message-State: AFqh2kq6vl19A1lCXOgtBJfIY7iFsfDwgb2bOZWJpxFgzmr2arxt8vXZ
	k7cWpc+GF0JL3a39f7vn4jNms99RlBD78Bky
X-Google-Smtp-Source: AMrXdXt+rMRKQmAG/Hgprnnt5SsUxqtVgdMqxUN43j0/8Yw+RCo8Q0rXb/EdpAaIKiuUryx7fQ5K4g==
X-Received: by 2002:a17:906:ccc3:b0:86d:6eaf:bf0 with SMTP id ot3-20020a170906ccc300b0086d6eaf0bf0mr22803767ejb.48.1674414809972;
        Sun, 22 Jan 2023 11:13:29 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id ky25-20020a170907779900b00877596d4eadsm7340829ejc.101.2023.01.22.11.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 11:13:29 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org
Cc: 'Atish Patra ' <atishp@rivosinc.com>,
	'Jisheng Zhang ' <jszhang@kernel.org>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Anup Patel ' <apatel@ventanamicro.com>
Subject: [PATCH v2 0/6] RISC-V: Apply Zicboz to clear_page
Date: Sun, 22 Jan 2023 20:13:22 +0100
Message-Id: <20230122191328.1193885-1-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230122_111333_223488_845B2D9A 
X-CRM114-Status: GOOD (  15.56  )
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
  - "[PATCH v4 00/13] riscv: improve boot time isa extensions handling"
    https://lore.kernel.org/all/20230115154953.831-1-jszhang@kernel.org/
    (Plus a fix for it, "riscv: module: Add ADD16 and SUB16 rela types",
     https://lore.kernel.org/all/20230120183418.ngdppppvwzysqtcr@orel/)
  - "[PATCH v1 0/3] Remove toolchain dependencies for Zicbom"
    https://lore.kernel.org/all/20230108163356.3063839-1-conor@kernel.org/
  - "[PATCH v2 0/3] Putting some basic order on isa extension lists"
    https://lore.kernel.org/all/20221205144525.2148448-1-conor.dooley@microchip.com/

The patches are also available here
https://github.com/jones-drew/linux/commits/riscv/zicboz-v2

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
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
