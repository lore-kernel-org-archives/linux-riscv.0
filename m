Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EFE0C433ED
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:15:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7BCA66112D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 06:15:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7BCA66112D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mpxy+21LWhczkEYKmuHEn3wbEXgAxAQpZmlEqNRXDDQ=; b=adDZY5Vgp06nTEUpxYBqvawYV
	SbAgfsWUbXGwhirSWT65hwXdo6VnZ5pqoS7fmZj3Kj4SKk0q+d16GjAHwNOw6xM/zQ5S6654WINA0
	EXfyeXhRE4Pe2ePGTh2l/kmOonL/0Ti4yK1P+vtZwaWmDiHzkN2SaGTT+uNXuV4SWiD1xyESGRJag
	bb9J+qsc3jAOfjuQTQ9kBgZhfXIvPrYAzrQRNOF4DKpyfnhCPu+cFnw6lBICL1v6/+GrxUr3XzX9H
	BPWiyLn2fIwpgtIAZPj5DaaVhT7R3k4yNBc78km6P84s3YqFkN0GzucrsKyNyakzLEOGRyriohICl
	d7Xqv0Y/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1leXHo-003KT2-RN; Thu, 06 May 2021 06:15:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXHj-003KSS-26
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 06:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=tegGDsKGROqCSGNnMzDwovPTaz9N3Na4SxAJGZRhcQY=; b=xU2uQLLw8L5R5IKKSRS73uLhRp
 8MQrIkAloBo0CfjVLZyBVBiJn6/lJsBDQeKhli9sZLV00U8AKD/gd6DxuN+JMUKMmtNOyiBdOGsY0
 cXQmtTvNohytGb4bjZo5egUAx5RFNuUIgyXHfnTJBRfg5mt5Mb5RDnnLk5pfMaDXMlrrOP04cOkfL
 8ZFbjA3SUJ6pwdIeGb7Rlgun5FFQKIfPRNfynWtI6kMbgVIKd6aVN/3plDZjUCfHQcOQpoZ/8Zmud
 /g13NdAZe7+dPU7HK4FPqjXBu7K3M7EFJzrGCB3Z3Pr3PTHlrHCWE/6jhc3xUfgYw+R3EG0OZDTBN
 hsLprmuw==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leXHg-005d2v-5Q
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 06:14:53 +0000
Received: by mail-pf1-x435.google.com with SMTP id 10so4491073pfl.1
 for <linux-riscv@lists.infradead.org>; Wed, 05 May 2021 23:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=tegGDsKGROqCSGNnMzDwovPTaz9N3Na4SxAJGZRhcQY=;
 b=GIiFaCVOQUZAp9ea5JKPsbM+35tPMMfVYmWUbAOFQZMzGu7KPUTBkEk21RPSxojFsF
 bcNBfooMapOoPWO2l+bXmfrlEJtdcz61rAz34GLd6bTIWYlC/ShZ6l1FUPx1nRsXwf1L
 RzzE5YyCsIljmpc0iZ79QInzYJp1WYnTw43SP29MzwVL1imqvHtWgviPxl2U97dj36LK
 /eahj+8JhDrduh5jlaizAzwDTvSFz0fu22KhTfCzCHG9e96Bus75mThymU+bpujMZtVH
 Pe7Dfr6OIUWgwQpwGVXErXyMhNMXdWG1CK4rcR1mqsWCmcZhYbZZPjYC6ND8K+xMt0SK
 F4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=tegGDsKGROqCSGNnMzDwovPTaz9N3Na4SxAJGZRhcQY=;
 b=P3uRfAqU2bZRSfhEwVvmZ+lwLHGJ+8CRqdJYYCrmo5CgTRT1ejf6VsoDar1YzMp5SK
 a6StD8xGGZCdzqmf56rHNg6Aj8vuc29vndw4qKlGBZ1cy2oDTFVHo8zvjlhTc6lJb3tb
 nuY+K1DaHL1UQZnPzl2to630a4AOgTE/nAh2cYeGEzuh7qI6VcAIUPNmpoogj70xu3ii
 P5ttodJNbHnC2C0I2hT8E0YMk0yt11Q9EQh1ipXBFPQGl1+6aLeoh0x7UED9RrVtXdB+
 eaqmaZk4W6RpVxiEldiggdWu6+zlk8CA/hmtT2W/+wpj/nkD4zLwfxAthEKvtQOaU1Ir
 d47Q==
X-Gm-Message-State: AOAM531tKq3mcBoBS0NpydPjdlqe4+Ad/hThGthnb1nBxnHJhNs1wm8A
 nMYgfd3s9nMTAkx0OzMExhjp6w==
X-Google-Smtp-Source: ABdhPJyJ8wGM/bYmMtnoEHiZyoDXFKQOafstFQv5SjArq4HE5HFrmcYYDho5KjQPPBzPk8mAv9lH5w==
X-Received: by 2002:a63:5757:: with SMTP id h23mr2634362pgm.279.1620281691590; 
 Wed, 05 May 2021 23:14:51 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id a18sm1024599pgg.51.2021.05.05.23.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 23:14:51 -0700 (PDT)
Date: Wed, 05 May 2021 23:14:51 -0700 (PDT)
X-Google-Original-Date: Wed, 05 May 2021 23:14:45 PDT (-0700)
Subject: Re: [syzbot] KASAN: use-after-free Read in get_wchan
In-Reply-To: <CACT4Y+YxAC3uV8UFKFn3mDiCGdo=z9xwSKS_SK+rRA+8=4RpuQ@mail.gmail.com>
CC: syzbot+0806291048161061627c@syzkaller.appspotmail.com, 0x7f454c46@gmail.com,
 akpm@linux-foundation.org, aou@eecs.berkeley.edu, chenhuang5@huawei.com,
 linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 syzkaller-bugs@googlegroups.com, wangkefeng.wang@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dvyukov@google.com
Message-ID: <mhng-1cd72d89-99ad-41bc-b7a9-6f347badd856@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210505_231452_229548_5606110F 
X-CRM114-Status: GOOD (  21.26  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 13 Apr 2021 22:56:13 PDT (-0700), dvyukov@google.com wrote:
> On Wed, Apr 14, 2021 at 7:52 AM syzbot
> <syzbot+0806291048161061627c@syzkaller.appspotmail.com> wrote:
>>
>> Hello,
>>
>> syzbot found the following issue on:
>>
>> HEAD commit:    b2b3d18f riscv: Make NUMA depend on MMU
>> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
>> console output: https://syzkaller.appspot.com/x/log.txt?x=12b59d16d00000
>> kernel config:  https://syzkaller.appspot.com/x/.config?x=81b3e7c68dad6e
>> dashboard link: https://syzkaller.appspot.com/bug?extid=0806291048161061627c
>> userspace arch: riscv64
>>
>> Unfortunately, I don't have any reproducer for this issue yet.
>>
>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>> Reported-by: syzbot+0806291048161061627c@syzkaller.appspotmail.com
>>
>> ==================================================================
>> BUG: KASAN: use-after-free in walk_stackframe arch/riscv/kernel/stacktrace.c:60 [inline]
>> BUG: KASAN: use-after-free in get_wchan+0x156/0x196 arch/riscv/kernel/stacktrace.c:136
>> Read of size 8 at addr ffffffe0058e3d90 by task syz-executor.0/4667
>>
>> CPU: 1 PID: 4667 Comm: syz-executor.0 Not tainted 5.12.0-rc5-syzkaller-00721-gb2b3d18fc20e #0
>> Hardware name: riscv-virtio,qemu (DT)
>> Call Trace:
>> [<ffffffe000009706>] walk_stackframe+0x0/0x23c arch/riscv/kernel/traps.c:201
>> [<ffffffe002a5f182>] dump_backtrace+0x40/0x4e arch/riscv/kernel/stacktrace.c:113
>> [<ffffffe002a5f1b2>] show_stack+0x22/0x2e arch/riscv/kernel/stacktrace.c:118
>> [<ffffffe002a68a3e>] __dump_stack lib/dump_stack.c:79 [inline]
>> [<ffffffe002a68a3e>] dump_stack+0x148/0x1d8 lib/dump_stack.c:120
>> [<ffffffe0003bc802>] print_address_description.constprop.0+0x52/0x31e mm/kasan/report.c:232
>> [<ffffffe0003bcd24>] __kasan_report mm/kasan/report.c:399 [inline]
>> [<ffffffe0003bcd24>] kasan_report+0x16e/0x18c mm/kasan/report.c:416
>> [<ffffffe0003bd588>] check_region_inline mm/kasan/generic.c:180 [inline]
>> [<ffffffe0003bd588>] __asan_load8+0x6e/0x80 mm/kasan/generic.c:253
>> [<ffffffe000009a98>] walk_stackframe arch/riscv/kernel/stacktrace.c:60 [inline]
>
> If it's walking the stack of another task, then it needs to use
> READ_ONCE_NOCHECK. See x86/arm64/s390 for examples:
> https://elixir.bootlin.com/linux/v5.12-rc7/A/ident/READ_ONCE_NOCHECK

Thanks, I just sent out a fix -- or at least hopefully one, I haven't 
actually tested it yet.

>
>> [<ffffffe000009a98>] get_wchan+0x156/0x196 arch/riscv/kernel/stacktrace.c:136
>> [<ffffffe000553364>] proc_pid_wchan+0x48/0xa4 fs/proc/base.c:390
>> [<ffffffe000554458>] proc_single_show+0x9c/0x13c fs/proc/base.c:774
>> [<ffffffe00045000c>] seq_read_iter+0x2e0/0x8f2 fs/seq_file.c:227
>> [<ffffffe00045081e>] seq_read+0x200/0x298 fs/seq_file.c:159
>> [<ffffffe0003f9210>] vfs_read+0x108/0x2ac fs/read_write.c:494
>> [<ffffffe0003f9724>] ksys_read+0xb4/0x1b8 fs/read_write.c:634
>> [<ffffffe0003f9850>] __do_sys_read fs/read_write.c:644 [inline]
>> [<ffffffe0003f9850>] sys_read+0x28/0x36 fs/read_write.c:642
>> [<ffffffe000005572>] ret_from_syscall+0x0/0x2
>>
>> The buggy address belongs to the page:
>> page:ffffffcf0216b8c0 refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x85ae3
>> flags: 0xffe000000000000()
>> raw: 0ffe000000000000 ffffffcf0216b8c8 ffffffcf0216b8c8 0000000000000000
>> raw: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000000
>> page dumped because: kasan: bad access detected
>>
>> Memory state around the buggy address:
>>  ffffffe0058e3c80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>  ffffffe0058e3d00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> >ffffffe0058e3d80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>                          ^
>>  ffffffe0058e3e00: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>>  ffffffe0058e3e80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
>> ==================================================================
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
>> --
>> You received this message because you are subscribed to the Google Groups "syzkaller-bugs" group.
>> To unsubscribe from this group and stop receiving emails from it, send an email to syzkaller-bugs+unsubscribe@googlegroups.com.
>> To view this discussion on the web visit https://groups.google.com/d/msgid/syzkaller-bugs/0000000000009862e005bfe859c8%40google.com.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
