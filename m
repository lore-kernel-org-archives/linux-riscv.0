Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621DEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 27 May 2022 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:Date:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=q+4dLaqXZvQbbc3p3FS2hRG6HsfKjrJFqYZBBLRPCuQ=; b=IEm
	ehWDRGFTCLD/Ea9/81n7VNgFYZ3zmLv6IAMhI8EShHn7rJbdQXJQWSyHsUIda/SGCkaVAWsUyW68Q
	oW20c/b5WKQOoH2SyPy8NgGu4ez24HrzwCSmnMy0xF5736cH6H8BofCcXhmekOoFIbdkUkDsVZ9io
	ElzkL/2IrnNOG3GARoNpx4QMKNe/ZGhcoNTJpzvWMmyQFxKTeU2jDZ4Z6zT2kIiaMu46eVKwemcue
	y2UIKAlWyawTz2cCbJNJiMkwPvzONlxDvNp+Et4Z22+q1Db9FnOcSyscfI59O/94wI7H2ODzwqZlb
	LHYpKcrTEmIkQOXEu2slA2ajnmaQJQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuZV2-0004Nc-Ug; Fri, 27 May 2022 12:55:28 +0000
Received: from mail-il1-f199.google.com ([209.85.166.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuZUz-0004M5-I0
	for linux-riscv@lists.infradead.org; Fri, 27 May 2022 12:55:27 +0000
Received: by mail-il1-f199.google.com with SMTP id i18-20020a926d12000000b002d1b13b896cso3024985ilc.7
        for <linux-riscv@lists.infradead.org>; Fri, 27 May 2022 05:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
        bh=6gNl3p9uahmS055a4kfyqdXzcD6tJIVsFval/w5PoBI=;
        b=XwndqeFQu63ENMFDhLAq5pgCUyVCch9EFoLhyLDiSaX8YQjP7W64LbaxrjR3M+iCIz
         hvQhr1WU8OiWrHVCqsIHtwaNJNvdC6UKK/XQ79s8xcLs1ynkENjQ1zvPGyMiF5xE4XfL
         75gjbgKBPk2Oa5YeIUqI/yxvXKjbuDdh9ZQW+HxS0qy4HObDIZCmG2c9vDqWvqEWZjmE
         EcuV1LlTdnOTOvMMjx7n472A4WTvbv+aJ82+uOCASFrZbrztKkQLcQQJPEmWU+NSADJP
         I6zFrmPOjKAnGLHmU6VvSwfruewD6PlYX9crwW7290vprXRDAySVp8cYM6pf961hQIiV
         CCrg==
X-Gm-Message-State: AOAM531yS3xEum4vmS00Y1s2PFTmVihPWOCqn5TMoOmLZReuSiCwO32z
	UJsQ/7QLkiNY3vqUjeF9d+fzRnR/BAc3GFUKl0lJ4CfuDS11
X-Google-Smtp-Source: ABdhPJxliTNhv8WiuM2KaYg2PHDVya/vQrf3VxzhoP2Ci617HxFNl+mStzaGo8DQF5aImLIMlXfMxdNAi9J37/XUtwnuOO23w5Gp
MIME-Version: 1.0
X-Received: by 2002:a05:6638:24cf:b0:32e:d03e:3185 with SMTP id
 y15-20020a05663824cf00b0032ed03e3185mr12819991jat.99.1653656123358; Fri, 27
 May 2022 05:55:23 -0700 (PDT)
Date: Fri, 27 May 2022 05:55:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000d0437b05dffdd1de@google.com>
Subject: [syzbot] riscv/fixes test error: lost connection to test machine
From: syzbot <syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com>
To: aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_055525_640156_E2ACE32E 
X-CRM114-Status: UNSURE (   3.90  )
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

HEAD commit:    c932edeaf6d6 riscv: dts: microchip: fix gpio1 reg property..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
console output: https://syzkaller.appspot.com/x/log.txt?x=1418add5f00000
kernel config:  https://syzkaller.appspot.com/x/.config?x=aa6b5702bdf14a17
dashboard link: https://syzkaller.appspot.com/bug?extid=2c5da6a0a16a0c4f34aa
compiler:       riscv64-linux-gnu-gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: riscv64

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2c5da6a0a16a0c4f34aa@syzkaller.appspotmail.com



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
