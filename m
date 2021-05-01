Return-Path: <SRS0=1eEn=J4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F209BC433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 05:51:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4B1F6613F0
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 05:51:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4B1F6613F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LUDCryIQE3Z779KnvBr1Y9NoXb3CPlH/AfFfepDn5w4=; b=PzVf4IpySXdrwl
	L67NSBrK1BUkNshzzykpn3/inrZvCQsGPJM5CB7dXSICJlEXYLZZ3DKr8x2dmeLudas4UQdWHBSng
	rL7WESBoanXDCg6iAcLFnoEh5STrHEUXumtY/lR//lYUXmWWOLKOrkxMqlGAauvXlGP5SY+S1QkBy
	k/GMCBC6KsUHGTZRwT6RAWm4IX0nPwAjwfijWEsNrP6AUv8fi24rl//fz3aqMEAfQ06nJnXaPWx8p
	2Aeck/vnhU0noG5MMAaRMAzeajac1aVCUi5Epnt86GGToHg4xE/XT6Cka9Ek9WCeTmMYgB/3y+IXQ
	SwZ5YAGrvchYfDDzWt0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lciXE-009Xtn-Fy; Sat, 01 May 2021 05:51:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lciXB-009Xtb-46
 for linux-riscv@desiato.infradead.org; Sat, 01 May 2021 05:51:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:To:From:Subject:
 Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=diU0RNkAZollR/UrfKoeFvOTmJ41JtW3kpnG7nzIye4=; b=CFqL0+2eaU9Xa52tDznOb6oe1S
 D9ryNibV9W1a8DTYJ+cnB6CqiczBgafYh/AhkOObkksslCvpKzcElhU+1eFqFGlkCwmF4WvqgY4bn
 5DzrZ/A+S0QTQL5nnXLy2eQql27Ue+TvD9rKMou27l1zfadQb4pxd/ISPhCoGSQMfrV0d4UnMRiEW
 YqDT4BoZdShLxBfX/BURt4KD36iu4Vc07mV8WNctSYLpEjES+VeFHXtR5GMa9LAcLL+HWYZrrcptN
 Dxf+SLnSIqM2SxdU5xdQKcaUWLszoNQhDhywZW1TjhriI2jl0o6X3DVGzWLcCVfgpKSuzulQ3NYnk
 QdD9PLtw==;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lciX8-001rCI-5r
 for linux-riscv@lists.infradead.org; Sat, 01 May 2021 05:51:19 +0000
Received: by mail-io1-f72.google.com with SMTP id
 v25-20020a0566020159b02904017f565b33so75529iot.1
 for <linux-riscv@lists.infradead.org>; Fri, 30 Apr 2021 22:51:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=diU0RNkAZollR/UrfKoeFvOTmJ41JtW3kpnG7nzIye4=;
 b=FiizUtSQRpfy04p2G+owul/I326ZK+J4KKuJrypFRDYo6Bl74+Kk8Grxp7HgR3jgln
 Uvl7OAdmmtQadSGLdQ2cZd+m3QabGlTXcwt+59qnNBU48MUjuhYC4EULvMppgPXO9qoz
 fka10Pqe2tH2QPvev5N8tI5WiMxxae8OM9KudwmTQwMx9eXxdfdVpV1+h1ygke5BcOD7
 7M2KEc0gqWtOy3c0QkfsYPc0kynCU5RWSsNx25JYTjeJ6lCOQ3JtM5VdOpALSqR/fbv9
 r/XfKd7aBw0TpteyUnd9TF3LJyClJXxrZTIjF1MKFl5XRvQNyc63NENWLY3uzpDiaYcN
 4kCA==
X-Gm-Message-State: AOAM532ThC2IYtt9iZLug+7/4S3wiI09/EjUY7YVst1/9//Wxdk5WEoC
 do7wwupkGHxzl5r0D+LCUDRIDSFDzhFqNSPCYzjz57WrmY7o
X-Google-Smtp-Source: ABdhPJwtMxjHUuqXVYXVlLQ77T5B4K3t2pi07rUtT0Z+ek7e9SxkH3ZKKqcRXNa5CTthibApvwZDyxYs5Jzsx5dy9bMcuvi71Otn
MIME-Version: 1.0
X-Received: by 2002:a92:c26a:: with SMTP id h10mr7042919ild.294.1619848275818; 
 Fri, 30 Apr 2021 22:51:15 -0700 (PDT)
Date: Fri, 30 Apr 2021 22:51:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000011fd4305c13e51c7@google.com>
Subject: [syzbot] KASAN: user-memory-access Read in do_syscall_trace_enter
From: syzbot <syzbot+e00eb4c4f40728f9bcde@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, keescook@chromium.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, luto@amacapital.net, oleg@redhat.com, 
 palmer@dabbelt.com, paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com, 
 wad@chromium.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_225118_243832_30960AC6 
X-CRM114-Status: UNSURE (   5.14  )
X-CRM114-Notice: Please train this message.
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

Hello,

syzbot found the following issue on:

HEAD commit:    18a3c5f7 Merge tag 'for_linus' of git://git.kernel.org/pub..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=14fa7ca5d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=105967f18e189a79
dashboard link: https://syzkaller.appspot.com/bug?extid=e00eb4c4f40728f9bcde
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e00eb4c4f40728f9bcde@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: user-memory-access in test_bit include/asm-generic/bitops/non-atomic.h:106 [inline]
BUG: KASAN: user-memory-access in cpumask_test_cpu include/linux/cpumask.h:373 [inline]
BUG: KASAN: user-memory-access in trace_sys_enter include/trace/events/syscalls.h:18 [inline]
BUG: KASAN: user-memory-access in do_syscall_trace_enter+0x24c/0x5ae arch/riscv/kernel/ptrace.c:255
Read of size 8 at addr 000000000118e9ae by task syz-executor.1/3237

CPU: 1 PID: 3237 Comm: syz-executor.1 Not tainted 5.12.0-rc8-syzkaller-00194-g18a3c5f7abfd #0
Hardware name: riscv-virtio,qemu (DT)
Call Trace:
[<ffffffe000009708>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:202
[<ffffffe002a631dc>] dump_backtrace+0x40/0x4e arch/riscv/kernel/stacktrace.c:113
[<ffffffe002a6320c>] show_stack+0x22/0x2e arch/riscv/kernel/stacktrace.c:118
[<ffffffe002a6ca98>] __dump_stack lib/dump_stack.c:79 [inline]
[<ffffffe002a6ca98>] dump_stack+0x148/0x1d8 lib/dump_stack.c:120
[<ffffffe0003bd560>] __kasan_report mm/kasan/report.c:403 [inline]
[<ffffffe0003bd560>] kasan_report+0x146/0x18c mm/kasan/report.c:416
[<ffffffe0003bddc8>] check_region_inline mm/kasan/generic.c:174 [inline]
[<ffffffe0003bddc8>] __asan_load8+0x4a/0x80 mm/kasan/generic.c:253
[<ffffffe000006fe8>] test_bit include/asm-generic/bitops/non-atomic.h:106 [inline]
[<ffffffe000006fe8>] cpumask_test_cpu include/linux/cpumask.h:373 [inline]
[<ffffffe000006fe8>] trace_sys_enter include/trace/events/syscalls.h:18 [inline]
[<ffffffe000006fe8>] do_syscall_trace_enter+0x24c/0x5ae arch/riscv/kernel/ptrace.c:255
[<ffffffe000005664>] handle_syscall_trace_enter+0x6/0x1e
==================================================================
Kernel panic - not syncing: panic_on_warn set ...
SMP: stopping secondary CPUs
Rebooting in 86400 seconds..


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
