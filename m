Return-Path: <SRS0=fQzb=IM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65CBFC433E0
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 10:14:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6DE164EB5
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Mar 2021 10:14:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6DE164EB5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zU8N41VWkxZeP4aB8135+QWeXSlZrRe+zz3ozhGP4vk=; b=SFVHal/z/scWq/
	GIuLcY1+wYN2dNzW52EhbEm/0NjtwvpNI6UXLmvzoQ8NiBOPE3jvPg1Ox9WoiV1uxMJTx86Zz/Mce
	pwhhs8j2JTG0hzB9v4J4gHhHKYEuFB9JGtdnFMq47g50T/IV0uFNrX/H92qb3CQ/23NSZeRvqcJqM
	RMazAyUB+/2s/R+Rd5W4u91MeosMEc0ZyIDDJw6waNcD1Hp2+420o0/Z7dPQUHRvjCo27Vb5cJR+1
	lnK6bQx5MDxDTZSxPj5RkPWDavtqYKC2sRI1PxrLlRVuuBiisEIrd36Iy6INkN1eJ2VhRfP60+GA1
	0A4HJ9sKJlqsXzQcEzrw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLNlQ-00E6xL-1U; Sun, 14 Mar 2021 10:14:25 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLNlK-00E6wp-W2
 for linux-riscv@lists.infradead.org; Sun, 14 Mar 2021 10:14:21 +0000
Received: by mail-il1-f199.google.com with SMTP id o7so21977165ilt.5
 for <linux-riscv@lists.infradead.org>; Sun, 14 Mar 2021 03:14:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=WafNR8e0K5yPQ32bCZ5pMiDA8TEADdUHeTC/5LuPOzg=;
 b=ok85madCUpQOcTUCusdo0SXvyg/RBXslm+mxpt1+fm2AJFC+MUgMZM8Y4xQi0aTSq5
 GTg2qdDofZx4B92M3Ol9EvSl4BoZq/N83x+lVuO86kqDgQV2AdoWHKimQc7IFUPhL2RM
 mW4GUNa1K69HlErmT6rpjvFRaNSrght24fsSRvPnQFqtBwVVsZjxfV7OXkT07w/V8KT3
 xY7LklL+4m3TJJvtY0rMxEJbQKbKbkk0/TKMzJZadd5UC746GSqLkurko4AG5cRIl7gO
 KMdyHwi2n8MMH4/4Nf7kbX8l/m5GW0wNq4/LXyxVkFiAUlmdoFZ8D+/L1mDCYCxJu5W6
 mDBA==
X-Gm-Message-State: AOAM53252q4Rp9qNC5vFM1uSJ5Y2pUIBkqfZ69injMeZNm5iYBnWQUyr
 81q7fQJwreW54nM6HBrxGHpeNJNCN7sAYBN8PmZkBgpE2yyO
X-Google-Smtp-Source: ABdhPJxVWhSpp8/s18ez/4uIHDbB0TIe2B/4JN0BufoW60aKG78vXVD76RCJ1PkIEMoRsY1KqByvMG9q/rYe4hmBqh29YIdFFyVY
MIME-Version: 1.0
X-Received: by 2002:a5d:9510:: with SMTP id d16mr4350495iom.81.1615716857325; 
 Sun, 14 Mar 2021 03:14:17 -0700 (PDT)
Date: Sun, 14 Mar 2021 03:14:17 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000056b18b05bd7c6511@google.com>
Subject: [syzbot] KASAN: slab-out-of-bounds Read in riscv_intc_irq
From: syzbot <syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, maz@kernel.org, palmer@dabbelt.com, 
 paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com, tglx@linutronix.de
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210314_101419_222267_25B204FF 
X-CRM114-Status: UNSURE (   4.02  )
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

HEAD commit:    0d7588ab riscv: process: Fix no prototype for arch_dup_tas..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=15a35756d00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=81c0b708b31626cc
dashboard link: https://syzkaller.appspot.com/bug?extid=005654dd9b8f26bd4c07
userspace arch: riscv64

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+005654dd9b8f26bd4c07@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-out-of-bounds in riscv_intc_irq+0x24/0xcc drivers/irqchip/irq-riscv-intc.c:24
Read of size 8 at addr ffffffe00c963bd0 by task kworker/1:1/4388

CPU: 1 PID: 4388 Comm: kworker/1:1 Not tainted 5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
Hardware name: riscv-virtio,qemu (DT)
Workqueue: events nsim_dev_trap_report_work
Call Trace:
[<ffffffe0000096c0>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201

Allocated by task 76347056:
(stack is not available)

Last potentially related work creation:


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
