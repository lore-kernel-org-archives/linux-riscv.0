Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44D7FC352A1
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 21:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zSV5bqr7LCP/6/nhv+T1EF/uXhnjZhl3TrfX+h57Bq8=; b=Z3s37ADz4zRA8V
	zMufFXaivq2/iluf5zm45TTueqXAzfCA+hutOFfJLoasZe7hVkWWaNy/6MhqdOKbRi5fofu9IbkCZ
	e0alfsV9oo7T4lgVej0PyU/dE9ivqUTE0xRSbjpt/HrntRdwL+Smeu0K+/vaoOBtLT9/DH3y6QmF6
	WuolaCeUBw2yVHiefMmFTKfJl6Fc6GYngBufDmnffeKyO2H8kTnB7VGBm3mpGNouJHz2f+uXyyEup
	SaS1/FRuZg8mKNutIvrIF1r1YWAI0Y6dwqo2BzlDJC+zYxKaFlt5QzD7GeykF2dnbeCX0ZR0L9Asj
	lcD34yRV1ZlZP6sE+Lhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU4-005UTk-QO; Sat, 03 Dec 2022 21:55:44 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1aU1-005USW-Gk
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 21:55:43 +0000
Received: by mail-lf1-x134.google.com with SMTP id f13so12751802lfa.6
        for <linux-riscv@lists.infradead.org>; Sat, 03 Dec 2022 13:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBzpomWVWALPSSYS1RI2q0Xof2MmYb8r6/1awBZblis=;
        b=KwKvGAk0wRHzL5h7bNhfgxUQzqsGEcKquPPWmoqmlJweWxb0A5RV/WR8qW7TSW5p3p
         43WLq5/gJgcXfjzyuAU/WaeFM0jWpxnf8gnzBJSqC8QdGMh4Xx7rHq0T2OAaI634esOA
         OshKkliXcvgUeHD8C+DVrAhOXVj8bvetOlSRJQaWbqlAm72HYsDXts/YBrD8BEYUfZmX
         UpL6iYExLkdmpto5M0nbODUBm3midZuqKa1Bg6pn97Y+lQzHVQyY3BcQtYPT4kDQOPys
         VY4sFHRNDr1JXSx5eF7THOJhHD85gIfAUn/NMqcU0otVxeVb1XfsuGG9x5zrVKa6U64n
         0blg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jBzpomWVWALPSSYS1RI2q0Xof2MmYb8r6/1awBZblis=;
        b=DvF1MN/J+1Ah4wD7rGYEUUSRg8yuDA866PjQ26r9l/Kujr73Xoevj8klgwCxuC6BWI
         Eu0Xm92gG1+l6+KXo5SGNv0cTeHB1N1vzp/8tLCe+etSMLUDvB3xFTWyBLwk6vkVD0hi
         jrRunP469X10IxEcmJ4J6PbXxnxAyrJ7meg1NAtpu225AimFIkhhClc2VY2zKMbz6/WD
         l01HH8/yTMdqZ5zOdUM2PbmBlAGC5qFV1TgOoAUVM929qy6YXLgQD5Wz9AhXl8GrFemC
         pdBzE8vbCCiCui1DOfMfpjS/PGMKKzcyA/T4EUdLkksD7r5+F3c4HR3n9cjBZAHT0YTn
         jI5g==
X-Gm-Message-State: ANoB5pkDfYpuj5mvnT7gi4wnaoJBNDbp0mcOOXG2Q+sPfG0GnB8UeoOF
	Vijn27mWHwwzTll0NgUEL6/MLuiDhst1pw==
X-Google-Smtp-Source: AA0mqf7h7Z7If5YkOiTtcojtYDphsgE3DB/LCi60IoM3HSxp9T/aHMi1P5dlOGLb9IAC9rIaMb7Umg==
X-Received: by 2002:a05:6512:2212:b0:4b5:acf:8789 with SMTP id h18-20020a056512221200b004b50acf8789mr11483823lfu.549.1670104538313;
        Sat, 03 Dec 2022 13:55:38 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id j2-20020a056512344200b004b4f2a30e6csm1537002lfr.0.2022.12.03.13.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Dec 2022 13:55:37 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	linux-arch@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Bresticker <abrestic@rivosinc.com>,
	Sergey Matyukevich <geomatsi@gmail.com>
Subject: [PATCH RFC v2 0/3] riscv: support for hardware breakpoints/watchpoints
Date: Sun,  4 Dec 2022 00:55:32 +0300
Message-Id: <20221203215535.208948-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221203_135541_621875_6E270DDC 
X-CRM114-Status: GOOD (  20.31  )
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

RISC-V Debug specification includes Sdtrig ISA extension. This extension
describes Trigger Module. Triggers can cause a breakpoint exception,
entry into Debug Mode, or a trace action without having to execute a
special instruction. For native debugging triggers can be used to
implement hardware breakpoints and watchpoints.

Software support for triggers consists of the following
major components:
 - U-mode: gdb support for hw breakpoints/watchpoints
 - S-mode: hardware breakpoints framework in Linux kernel
 - M-mode: SBI firmware code to handle triggers

SBI Debug Trigger extension proposal has been posted by Anup Patel
to lists.riscv.org tech-debug mailing list, see:
https://lists.riscv.org/g/tech-debug/topic/92375492

This patch provides initial Linux support for RISC-V hardware breakpoints
and watchpoints based on the proposed SBI Debug Trigger extension. The
accompanying OpenSBI and GDB changes has also been posted for review:

- https://patchwork.ozlabs.org/project/opensbi/patch/20221203213929.206429-3-geomatsi@gmail.com/
- https://patchwork.sourceware.org/project/gdb/patch/20221130182605.1905317-1-yuly.tarasov@syntacore.com/

Current revision has the following limitations:
- two trigger types are supported: mcontrol, mcontrol6
- no support for chained triggers
- no support for virtualization
- only build test for RV32

The functionality has been tested on QEMU together with the mentioned
opensbi and gdb patches, including both target gdb and remote debug
using gdbserver. Hardware breakpoints work just fine on upstream QEMU.
However this is not the case for watchpoints since there is no way to
figure out which watchpoint triggered. IIUC there are two possible
options for doing this: using 'hit' bit in tdata1 or reading faulting
virtual address from STVAL. QEMU implements neither of them. Current
implementation opts for STVAL. The following experimental QEMU patch
is required to make hw-watchpoints work:

: diff --git a/target/riscv/cpu_helper.c b/target/riscv/cpu_helper.c
: index 278d163803..8858be7411 100644
: --- a/target/riscv/cpu_helper.c
: +++ b/target/riscv/cpu_helper.c
: @@ -1639,6 +1639,10 @@ void riscv_cpu_do_interrupt(CPUState *cs)
:          case RISCV_EXCP_VIRT_INSTRUCTION_FAULT:
:              tval = env->bins;
:              break;
: +        case RISCV_EXCP_BREAKPOINT:
: +            tval = env->badaddr;
: +            env->badaddr = 0x0;
: +            break;
:          default:
:              break;
:          }
: diff --git a/target/riscv/debug.c b/target/riscv/debug.c
: index 26ea764407..b4d1d566ab 100644
: --- a/target/riscv/debug.c
: +++ b/target/riscv/debug.c
: @@ -560,6 +560,7 @@ void riscv_cpu_debug_excp_handler(CPUState *cs)
:
:      if (cs->watchpoint_hit) {
:          if (cs->watchpoint_hit->flags & BP_CPU) {
: +            env->badaddr = cs->watchpoint_hit->hitaddr;
:              cs->watchpoint_hit = NULL;
:              do_trigger_action(env, DBG_ACTION_BP);


Changes v1 -> v2:
- switched to per-cpu buffers to exchange data with SBI firmware
- added support for type 2 (mcounter) triggers
- added ptrace interface to expose hw-breakpoints to debuggers


Sergey Matyukevich (3):
  riscv: add support for hardware breakpoints/watchpoints
  riscv: ptrace: expose hardware breakpoints to debuggers
  riscv: hw-breakpoints: add more trigger controls

 arch/riscv/Kconfig                     |   2 +
 arch/riscv/include/asm/hw_breakpoint.h | 172 ++++++++
 arch/riscv/include/asm/kdebug.h        |   3 +-
 arch/riscv/include/asm/processor.h     |   5 +
 arch/riscv/include/asm/sbi.h           |  24 ++
 arch/riscv/include/uapi/asm/ptrace.h   |   9 +
 arch/riscv/kernel/Makefile             |   1 +
 arch/riscv/kernel/hw_breakpoint.c      | 540 +++++++++++++++++++++++++
 arch/riscv/kernel/process.c            |   3 +
 arch/riscv/kernel/ptrace.c             | 188 +++++++++
 arch/riscv/kernel/traps.c              |   5 +
 11 files changed, 951 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/hw_breakpoint.h
 create mode 100644 arch/riscv/kernel/hw_breakpoint.c

-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
