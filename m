Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1015DC54E64
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 13:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	In-Reply-To:Date:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	References:List-Owner; bh=OUw/yycj6i9YSp7FL1tkeWndfVqawMctFAbd37qdGfM=; b=xgH
	cvqEwHmFsnZ595adQQOEnJ7x1OGLSuO0yEEFT5F+SOlF40/Vc2VeVRhySBS1Tt6t2EIXBkT5CX2gR
	wRHDIYOVcsoO+tE2C7jMc2eEvlBogAicts6a9NDn32LTZcmoX9ghidi8a3L7xq1v7ojFiWpcHs4iP
	jeqxmJUyiNavCDAGCkM7FQjZzNslCdA70uC1j+p/hhK3ISd4Pqi8/IlASl5fgf+KZhomCPpgdJGmZ
	l3Uh2OVXeWcF4rCIQ1RpdLrTG4HfJShSHTsGDUIZ9/H2cj1NL3GkrsuLPnQOGafyLhDBWMuw6SofS
	4M1+EJVdJQyIsfHmJFLGX9zkd0NaZnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppUm-0000000E3BP-1Os9;
	Thu, 28 Mar 2024 13:08:40 +0000
Received: from mail-io1-f71.google.com ([209.85.166.71])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rppUj-0000000E37r-0vdf
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 13:08:39 +0000
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-7d096c4d663so2030439f.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 06:08:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711631313; x=1712236113;
        h=cc:to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=phTm8D9QxIqku3+dzOk7mAuzWATH8ccFfySGlvdYVpw=;
        b=BClWA7Hzd3nRg7JBrOUXJQdQPHZNlc92tTo2YffrUU/TMivZ5uTUkMZhGfaN2TUsik
         ZR4z8koeEqghEJtUT7Rlf6nYczG9X3OlWhdmf+M6vaZVkriueCOLCbSi31zpj+xFAvoL
         Xewx4TrRsi/qe4v4lDxgYDigATPAXOd1q/tDdsC+GZ8V2K3JujNhFsEM7ZShFPMYxa+U
         02Rrt/q6pcrr8+w2V3SidpajtBfbNbBSbnH1o4AvhIKIhY2SOHKPWmmEVwGUc53hPt1v
         Kye9lsqpxN6q99B5n5WV8VZ7519bnXcYnVgvLA/M35yAB5Su3gQoX44D4bKcDsRZQq89
         j07Q==
X-Forwarded-Encrypted: i=1; AJvYcCVfDycy+JDjE6cj/n8tfwsMrTNcN+4JRGeS0TM44UWJ6ajcFcrhwStRLbDlY9gwZAaYUipfrJgLirjjsl6VG8xJdZ9qVqaHqPwBQtjXKdV0
X-Gm-Message-State: AOJu0YwqWSvQVWI3v5lVDgVOFBiQn4J9YWzOkVi/4TJmZe+CBtar9fWO
	C+ZwYIpuKk0Zwk04PVNzwzgOZhCS+jYV6RYVBgUiROYfiyhFj3yrLhfVzSvfRm3vpZldVXvy3KC
	G8rCbPYdYMjTvEy5YzbvzLSBU5GVVjMA3tNArYx6rbnMKYE+ZLnYME/4=
X-Google-Smtp-Source: AGHT+IHVstareIQr2iQt8P9A37R24y5Hcmor2dMv1fVqXV3He2chAs+ykyZXD9HnfYyfbzs67ps9/XJ4T8VQ1Cu/MRR2oRPtrbdB
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3413:b0:7cc:7112:ea9c with SMTP id
 n19-20020a056602341300b007cc7112ea9cmr54675ioz.2.1711631313702; Thu, 28 Mar
 2024 06:08:33 -0700 (PDT)
Date: Thu, 28 Mar 2024 06:08:33 -0700
In-Reply-To: <271f4b9c-f879-4933-b1e9-1e7481a809eb@ghiti.fr>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000070a2660614b83885@google.com>
Subject: Re: [syzbot] riscv/fixes boot error: can't ssh into the instance (3)
From: syzbot <syzbot+620209d95a0e9fde702f@syzkaller.appspotmail.com>
To: alex@ghiti.fr
Cc: alex@ghiti.fr, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	syzkaller-bugs@googlegroups.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_060837_303707_8FDAAB63 
X-CRM114-Status: GOOD (  11.77  )
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

> On 28/03/2024 09:27, syzbot wrote:
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    653650c468be riscv: Mark __se_sys_* functions __used
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>> console output: https://syzkaller.appspot.com/x/log.txt?x=1110f1e6180000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=88360569be845301
>> dashboard link: https://syzkaller.appspot.com/bug?extid=620209d95a0e9fde702f
>> compiler:       riscv64-linux-gnu-gcc (Debian 12.2.0-13) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
>> userspace arch: riscv64
>>
>> Downloadable assets:
>> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/a741b348759c/non_bootable_disk-653650c4.raw.xz
>> vmlinux: https://storage.googleapis.com/syzbot-assets/2701bf6276c4/vmlinux-653650c4.xz
>> kernel image: https://storage.googleapis.com/syzbot-assets/aed54fe6b3d5/Image-653650c4.xz
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+620209d95a0e9fde702f@syzkaller.appspotmail.com
>>
>>
>>
>> ---
>> This report is generated by a bot. It may contain errors.
>> See https://goo.gl/tpsmEJ for more information about syzbot.
>> syzbot engineers can be reached at syzkaller@googlegroups.com.
>>
>> syzbot will keep track of this issue. See:
>> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>>
>> If the report is already addressed, let syzbot know by replying with:
>> #syz fix: exact-commit-title
>>
>> If you want to overwrite report's subsystems, reply with:
>> #syz set subsystems: new-subsystem
>> (See the list of subsystem names on the web dashboard)
>>
>> If the report is a duplicate of another one, reply with:
>> #syz dup: exact-subject-of-another-report
>>
>> If you want to undo deduplication, reply with:
>> #syz undup
>>
>> _______________________________________________
>> linux-riscv mailing list
>> linux-riscv@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/linux-riscv	
>
>
> So this is fixed by 
> https://lore.kernel.org/all/20240326063036.6242-1-osalvador@suse.de/
>
> Here are the relevant syzbot tags (hopefully I get them right):
>
> #syz dup: [syzbot] [mm?] upstream boot error: WARNING: refcount bug in 
> __reset_page_owner
>
> #syz fix: mm,page_owner: Fix refcount imbalance
>
> Thanks,
>
> Alex
>

Command #1:
can't find the dup bug


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
