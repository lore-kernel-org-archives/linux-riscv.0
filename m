Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE12C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Nov 2022 14:20:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p0kq+xdMK3ITjdJvqctGyYAfSYma1sR+v3xLr8pQEIQ=; b=vhm22nkPDJyd6o
	7Ef2LXHPWdA8h7N27ZjnTp8UPaslQTBV6ToJ3epBBVbC/Mub+/i0jsWCZxIqaje0FDILr4nWFvuq/
	1LE8tGWAqNErPo9Knbx8DZQaPVJR1A715vyPpl3v6eFft2yRbAKt8pMdBtiEdVAKYxl22PA+GPLf/
	YUsii3RZPypXGT0nX7xWnM6vqbpAVjNu9e2uLFR6eihkYjPEjgjeweyP/Qnsah356tjdxVq2goj5K
	tYKQnEypIHt6wJkywiYo8e0xUqqTp64hPwSNSyQPK/2Xvhr21oKCwjX5QXBOze+IVQuREBPzThyIM
	4KHBO+2nIHSWnzyH0Hwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqcE-00HZqk-UZ; Wed, 23 Nov 2022 14:20:42 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxqcB-00HZn7-DH
	for linux-riscv@lists.infradead.org; Wed, 23 Nov 2022 14:20:41 +0000
Received: by mail-pg1-x530.google.com with SMTP id b62so16922622pgc.0
        for <linux-riscv@lists.infradead.org>; Wed, 23 Nov 2022 06:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XZFGbUHuj0l3eTvqxn5eZPM/wQWRlW8EgGqFLB4IDbY=;
        b=UL7NA71lQETMtiGLB4b0vM0bIK56V9BIy15nU3u5/XO87jW95LGcNVZRn2UtQZSPSc
         ib4fv/ro/oGNdRLn3kROOEzKedIeVrJ4sGqAxbtte0g5oGuRMTQhCm+Y4+hsD2aj6xks
         sFacIImq75unL4GkwndLhKm9NL5akxb8zUaN6I3uzG5cs15I5ajNYz/dy/3EM/H8x471
         o0sHHUmnjy2wQM5//on9q7SoZTzB+kxQ4gJQFRrzGAgblMp65KmmYEc69lS6gW9U12lG
         YZsJckaaoZmVJt295ri6d6ODV4/X6jgu8PGhbLxZFHKhO+6J8sgD7klB1qqFZyO++fnu
         oPEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XZFGbUHuj0l3eTvqxn5eZPM/wQWRlW8EgGqFLB4IDbY=;
        b=FCFJWrE8/5A3To0ZbNVIDMQGpwaLSsqjAcOllejMlgPHSg4tOgKsSew4oJdSRg6wph
         sw3AX00KrM/Yps19cnRHslZA06ZkHCL58VoSQ8wovjMDh5AjNoI33rY3I5ZAqzgicDHh
         lC33CXkXgl16YMDvX0Wq2byerqqoVduO2fHLXYH3ASIUOK3+YQfR8K8SbbnPWcI8F0Zg
         1XbMSa3fl8dtEE2VW0tGBcRhdQkpXoTNRpumYBGWJ9LSNXi6gRRZMP+I32Oo3YACXHqk
         qic874dr87VeromkHqeP/I4WH69km2C54KQE2tfzZSOW4LuXs0mP7kbHBKYORV5/tTyE
         Xy0w==
X-Gm-Message-State: ANoB5pnyCgK4RpYlD+uS4Xk80GogPmGxz5Fqo6heZ7g+dSv0NnSyrQ/K
	4BJtMQiESKU3mjV0msEwsOg=
X-Google-Smtp-Source: AA0mqf4hksRNl+NtDdclonmxEt2Mu9yopFQcQjze1yeU9La5Gipr9oXvhlZA7HVc1KIQasBaNuiYtg==
X-Received: by 2002:a63:711e:0:b0:477:5654:c37e with SMTP id m30-20020a63711e000000b004775654c37emr16425758pgc.206.1669213234292;
        Wed, 23 Nov 2022 06:20:34 -0800 (PST)
Received: from localhost.localdomain ([221.226.144.218])
        by smtp.gmail.com with ESMTPSA id l12-20020a170903120c00b0016c5306917fsm14516732plh.53.2022.11.23.06.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:33 -0800 (PST)
From: Song Shuai <suagrfillet@gmail.com>
To: guoren@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mhiramat@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	jolsa@redhat.com,
	bp@suse.de,
	jpoimboe@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <suagrfillet@gmail.com>
Subject: [PATCH 0/2] riscv/ftrace: add WITH_DIRECT_CALLS support
Date: Wed, 23 Nov 2022 22:20:23 +0800
Message-Id: <20221123142025.1504030-1-suagrfillet@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_062039_469432_39D6890C 
X-CRM114-Status: GOOD (  15.17  )
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

This series adds DYNAMIC_FTRACE_WITH_DIRECT_CALLS support for RISC-V.
SAMPLE_FTRACE_DIRECT and SAMPLE_FTRACE_DIRECT_MULTI are also included
here as the samples for testing DIRECT_CALLS related interface.

First, select the DYNAMIC_FTRACE_WITH_DIRECT_CALLS to provide 
register_ftrace_direct[_multi] interfaces allowing user to register 
the customed trampoline (direct_caller) as the mcount for one or 
more target functions. And modify_ftrace_direct[_multi] are also 
provided for modify direct_caller.

At the same time, the samples in ./samples/ftrace/ can be built
as kerenl module for testing these interfaces with SAMPLE_FTRACE_DIRECT
and SAMPLE_FTRACE_DIRECT_MULTI selected.

Second, to make the direct_caller and the other ftrace hooks
(eg. function/fgraph tracer, k[ret]probes) co-exist, a temporary register
are nominated to store the address of direct_caller in ftrace_regs_caller.
After the setting of the address direct_caller by direct_ops->func and
the RESTORE_REGS in ftrace_regs_caller, direct_caller will be jumped to
by the `jr` inst.

The following tests have been passed in my local qemu-riscv64 virt machine. 

1. tests with CONFIG_FTRACE_STARTUP_TEST
2. tests of samples/ftrace/ftrace*.ko
3. manual tests with any combination of the following hooks
  - function/function_graph tracer 
  - ftrace*.ko
  - kprobe/kretprobe

For your reference, here is the log when function tracer, kretprobe and 
ftrace-direct-too.ko co-hooks the handle_mm_fault function.

```
[root@stage4 tracing]# echo handle_mm_fault > set_ftrace_filter
[root@stage4 tracing]# echo 'r:myr handle_mm_fault' > kprobe_events
[root@stage4 tracing]# echo function > current_tracer 
[root@stage4 tracing]# echo 1 > events/kprobes/myr/enable 
[root@stage4 tracing]# insmod /root/ftrace-direct-too.ko 
[root@stage4 tracing]# 
[root@stage4 tracing]# cat trace | tail
             cat-388     [000] ...1.   583.051438: myr: (do_page_fault+0x16c/0x5f2 <- handle_mm_fault)
             cat-388     [000] ...2.   583.057930: handle_mm_fault <-do_page_fault
             cat-388     [000] .....   583.057990: my_direct_func: handle mm fault vma=000000002d9fe19c address=ffffffae9b7000 flags=215
             cat-388     [000] ...1.   583.058284: myr: (do_page_fault+0x16c/0x5f2 <- handle_mm_fault)
            tail-389     [001] ...2.   583.059062: handle_mm_fault <-do_page_fault
            tail-389     [001] .....   583.059104: my_direct_func: handle mm fault vma=0000000017f3c48e address=aaaaaabebf3000 flags=215
            tail-389     [001] ...1.   583.059325: myr: (do_page_fault+0x16c/0x5f2 <- handle_mm_fault)
            tail-389     [001] ...2.   583.060371: handle_mm_fault <-do_page_fault
            tail-389     [001] .....   583.060410: my_direct_func: handle mm fault vma=0000000017f3c48e address=aaaaaabebf1000 flags=255
            tail-389     [001] ...1.   583.060996: myr: (do_page_fault+0x16c/0x5f2 <- handle_mm_fault)
```

Note1: 

This series is based on (riscv/ftrace: make ftrace_caller call ftrace_graph_func)
in this repo -> https://github.com/guoren83/linux/commits/ftrace_fixup_v3 .

Note2:

The checkpatch.pl will output some warnings on this series, like this

```
WARNING: Prefer using '"%s...", __func__' to using 'my_direct_func2', this function's name, in a string
111: FILE: samples/ftrace/ftrace-direct-multi-modify.c:48:
+"       call my_direct_func2\n"
```

The reason is that checkpatch depends on patch context providing the
function name. In the above warning, my_direct_func2 has some codeline
distance with the changed trunk, so its declaration doesn't come into
the patch, and then the warning jumps out.

You may notice the location of `my_ip` variable changes in the 2nd patch.
I did that for reducing the warnings to some extent. But killing all the 
warnings will makes the patch less readable, so I stopped here.

--
Song

Song Shuai (2):
  riscv/ftrace: add DYNAMIC_FTRACE_WITH_DIRECT_CALLS support
  samples/ftrace: add riscv support for SAMPLE_FTRACE_DIRECT[_MULTI]

 arch/riscv/Kconfig                          |  3 ++
 arch/riscv/include/asm/ftrace.h             |  6 ++++
 arch/riscv/kernel/mcount-dyn.S              |  4 +++
 samples/ftrace/ftrace-direct-modify.c       | 35 ++++++++++++++++++-
 samples/ftrace/ftrace-direct-multi-modify.c | 37 +++++++++++++++++++++
 samples/ftrace/ftrace-direct-multi.c        | 22 ++++++++++++
 samples/ftrace/ftrace-direct-too.c          | 26 +++++++++++++++
 samples/ftrace/ftrace-direct.c              | 22 ++++++++++++
 8 files changed, 154 insertions(+), 1 deletion(-)

-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
