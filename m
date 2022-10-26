Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 461BFC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Oct 2022 12:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=bVmhasv6COCI/F+mn4dvfuZUpKiQAdJqhUWOU63FbMQ=; b=bRz
	e+mHbqEACJjxDrwPpJPO15qpPlYM83MxbSx8DQr9AkgUM0ec6mOM+FROVOEB2Nr8gh+REdPNa+GbF
	qFIjQNsqx6YdgRD0inqkS2NxEnjYBUo4P/u739IRC6F0w+lQliabCxLY+QzVp1QS07tD9nQrg4x7A
	2sHSW0Ft1Cxmq4k7/+bdC7P7RRR6MWbuuVXMKodc5reCuM4F6H1frVbm6i1vhlKnG19STpuEPuPSD
	tQbpmT77n8u3+7xRmKWpD2ygOM4SXgl5QlIKGS0nTg9HlJSlBlcG8eYxxrg8YWLl2puv2CxedteqV
	n7nmfYnkFRZEGRMY2AoMbph+5QY6Cdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onffG-009But-9V; Wed, 26 Oct 2022 12:37:46 +0000
Received: from mail-il1-f200.google.com ([209.85.166.200])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onffC-009Bss-JV
	for linux-riscv@lists.infradead.org; Wed, 26 Oct 2022 12:37:44 +0000
Received: by mail-il1-f200.google.com with SMTP id y13-20020a056e021bed00b002faba3c4afbso13283749ilv.13
        for <linux-riscv@lists.infradead.org>; Wed, 26 Oct 2022 05:37:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=giEKpFCOAGFhFBssx0rXv7faluMBkRAJIt7vP3gQfcg=;
        b=wEsB1itr+RLrVwiX+ii94vNFAcphO1jgZuqiNu14rYoH2t3K/GDQZAB3mkNHxPSsUO
         aK7DxGDnB/LkeTlYDvQeYz1T6iQdPUjpEhJtictToElj7B1cjmYtjT5yNlPcklY2Eq8d
         CqvzIXVSPJk4VFu8JDeM1q5cIQsw6KxPRZZAkeus9OINmCogpVqEI7AC3l1fV3NMoD6w
         5hvcLAVAbYbx0loVISKd8bk48wjuannOA90D1pprDLoHDUdUp8xRhten4UyfDI2wnES6
         rVMu9vvxBH5gyGqn0oFH3Makc0CHUtD9qnxNQOAND+ed7KDZKUu6wq5Rpwbp4HmWwRvz
         cCcg==
X-Gm-Message-State: ACrzQf2Y2VomL0JxIHTkUpmtDbQkYPBZomhYpmfM+5yiaLyR3cD/cLc/
	C3lsHUYB4PsT4P2SO8lQVYyHE3MxHMSfQf+zNUhrGUeh4KPz
X-Google-Smtp-Source: AMsMyM5r7dsZdVt160YC5BPbjclJeotonvfTb9M6Y/9MqlbnqBdLkqd+gbWuZkwuxllvLriR5DttATdFDSwT+4VCwqbBOV/tsBmF
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:170d:b0:2fc:3e76:b262 with SMTP id
 u13-20020a056e02170d00b002fc3e76b262mr26506480ill.152.1666787859573; Wed, 26
 Oct 2022 05:37:39 -0700 (PDT)
Date: Wed, 26 Oct 2022 05:37:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000049382505ebef4a0c@google.com>
Subject: [syzbot] riscv/fixes build error
From: syzbot <syzbot+9d8dc6c2d48bbc419bb4@syzkaller.appspotmail.com>
To: anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	palmer@dabbelt.com, paul.walmsley@sifive.com, syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_053742_657109_FEB6E169 
X-CRM114-Status: UNSURE (   4.18  )
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

HEAD commit:    9abf2313adc1 Linux 6.1-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=152b6b6a880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9631ed0b9757aaab
dashboard link: https://syzkaller.appspot.com/bug?extid=9d8dc6c2d48bbc419bb4
compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9d8dc6c2d48bbc419bb4@syzkaller.appspotmail.com

arch/riscv/kvm/vcpu.c:269: undefined reference to `riscv_cbom_block_size'
riscv64-linux-gnu-ld: arch/riscv/kvm/vcpu.c:269: undefined reference to `riscv_cbom_block_size'

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
