Return-Path: <SRS0=ZUll=KM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D5AC433ED
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 15:43:59 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5926B61057
	for <linux-riscv@archiver.kernel.org>; Mon, 17 May 2021 15:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5926B61057
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z3RiTzMrDF8MoliFpbNOEYjONoY+fkYpI/VHCrLB/CU=; b=Nt0kABSs86cqWJZiGTruWoZ8h
	s7ta4PDq1MXyGnBbUES8jZH++wRzF+7plhbI/sWk+PRqWAozB48RwRV1Pyd9/iPNj0Xr8uulAuVcZ
	pqJNpvVByc9TSqyp8iE/lb6lus3qt1erI0RPnRtmdww2PlI+RvOUnIT5FhJr/YPE5+N9sRSHxRLqI
	HiMZTtLryKYz5F++iA8W/CYvwUNQmG6JlW7E+wlNJrjV6bhYiH753DU9pU+vpMTXtEbJ5lluXoHNU
	lJnDR+TQGA+ntLd80Wq5forCZMwOK88jlY5U4N51ernlUfvdi7kTZ9BQYJBVIRSKv0yOXPyw05WiF
	KGZxhLM5w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lifPB-00FS33-BL; Mon, 17 May 2021 15:43:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lifP8-00FS21-84
 for linux-riscv@desiato.infradead.org; Mon, 17 May 2021 15:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=fpwxqREUy7ZeE/q9KBgH9prhaRfEbTg15gcbCdch4sk=; b=gSXsHNBKW6jSMysSNhiY2cpSzv
 7Gm0E8kRqR+Bo8YMRw8O0jntGflJQyAPMnnEIfiDhu8pkI8REdgwT8Bp+OtJYvdvZscqE9maKOTyd
 N81hazEZ1ZhncChGSCSHCBW1+rd73nQDxEOtx4gQ/oF7lcfRHHwjKipOsLRANalZZXPSPnwlgxBtw
 MKpWOlmfL3gsHiQfS/s8wkOR4j1Ht/ebuwLNnCUa7gr4RHYTeYBnFK0+BvxkJmzpDDvaukE5tZl8C
 CxDYu6X/MO2VYf6T6yfYJssWSh63bt2U15jamqPD41T36XiZ5Gh+Zk8tvYMUD9bth/xkVwVGnWUgO
 Rg6PRuxQ==;
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lifP5-00DwDw-4S
 for linux-riscv@lists.infradead.org; Mon, 17 May 2021 15:43:36 +0000
Received: by mail-qt1-x833.google.com with SMTP id k19so5161627qta.2
 for <linux-riscv@lists.infradead.org>; Mon, 17 May 2021 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fpwxqREUy7ZeE/q9KBgH9prhaRfEbTg15gcbCdch4sk=;
 b=wPcyIQdb6L6RNeArvXK/uwluH0pzcyAL8Aqij4tYmSicv0ugqA8kc0c1vkWlRSw9HD
 kQwp//GzznxbjURrATi75vC8qO9PjX6OCjthLjKsnydVNqxEqf3e+1cTKKHoRDGcGWPv
 fOzmIzfFrxp6gvyq0RAuobhupEv0R4/q6Oaai7QIFe4V1lcc1P/Q6pHE11LChac3HMdF
 yda4N2qFUv/CphPoic4G30/bY3uUYJzwAM6zmoCUj8syPdlpefxsFB/2Me74BEa9WIQO
 MMedIHxaxrpX6l076PK4OiNtA3hGmU1Cn6TXp2NRq6FY1wvU30gUANfMZjE8UKa2by1Z
 6m0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fpwxqREUy7ZeE/q9KBgH9prhaRfEbTg15gcbCdch4sk=;
 b=RUCuqbBxb/20e1MBf+DhAuY5dj1yM/J0wtS+JvL4YTPwMdN99+HzO/+eXBf5aOn/79
 cMUGuLVTiz+bB8WAydQAAKwXVEqkvJaiGnzanjPbyHlDRimk2QyyuAsbcYisbpQBo5+V
 M6qiGrCOcYe3QkPwpyay7MNvXwiktrlCcZQAMxRe83uWcr1xD+NcUOXlx49lKJZDlsut
 +GGaGH2ZB5FpruxGMSEa/vDhVcNYw6OrvV64t8uOCJy5Rx2JltB7Q7g3TV0zRdlGvaTb
 o19eQ4/Hu0bybE29xRAkDidwuY8GL++AgE8+mL50c8EpVxH3oAExBOjRImfYlzvvt3xN
 HPhw==
X-Gm-Message-State: AOAM531kyGvG9EWCWZHLj7PImA3rk9OL+i0BGsn5S8b4jjjyqPwM8Db5
 MSoe0WZFkc1+/uoio0u8TevtRAZe8oBK014ICJVKNg==
X-Google-Smtp-Source: ABdhPJz4M51L12IN2jSsEKmY7vORLRZl8ZEZji/O7ODhRvj5zpW2uVnQHLDOpExGgw04gxs51m8VSuLlvKUEDrdbq4A=
X-Received: by 2002:ac8:518a:: with SMTP id c10mr162925qtn.66.1621266213535;
 Mon, 17 May 2021 08:43:33 -0700 (PDT)
MIME-Version: 1.0
References: <000000000000b3d89a05c284718f@google.com>
 <YKJTNcpqVN6gNIHV@hirez.programming.kicks-ass.net>
 <CACT4Y+bucS5_6=rcEEpe+t8p_m3PQVzU5U+u+++ZSVG8E9zzmg@mail.gmail.com>
In-Reply-To: <CACT4Y+bucS5_6=rcEEpe+t8p_m3PQVzU5U+u+++ZSVG8E9zzmg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Mon, 17 May 2021 17:43:22 +0200
Message-ID: <CACT4Y+Z8VjfOU=eR-ijhkXJJuZLM4NC+ui5ce0R=OH6WVWwB1w@mail.gmail.com>
Subject: Re: [syzbot] WARNING in __perf_install_in_context
To: Peter Zijlstra <peterz@infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-riscv <linux-riscv@lists.infradead.org>
Cc: syzbot <syzbot+0fb24f56fa707081e4f2@syzkaller.appspotmail.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Andrii Nakryiko <andrii@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
 bpf <bpf@vger.kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>, 
 Jiri Olsa <jolsa@redhat.com>, Martin KaFai Lau <kafai@fb.com>,
 KP Singh <kpsingh@kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 netdev <netdev@vger.kernel.org>, Song Liu <songliubraving@fb.com>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>, 
 Yonghong Song <yhs@fb.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_084335_193318_A7D5D48E 
X-CRM114-Status: GOOD (  15.07  )
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

On Mon, May 17, 2021 at 2:46 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Mon, May 17, 2021 at 1:28 PM Peter Zijlstra <peterz@infradead.org> wrote:
> >
> > On Mon, May 17, 2021 at 03:56:22AM -0700, syzbot wrote:
> > > Hello,
> > >
> > > syzbot found the following issue on:
> > >
> > > HEAD commit:    18a3c5f7 Merge tag 'for_linus' of git://git.kernel.org/pub..
> > > git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git fixes
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=1662c153d00000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=b8ac1fe5995f69d7
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=0fb24f56fa707081e4f2
> > > userspace arch: riscv64
> > >
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > >
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+0fb24f56fa707081e4f2@syzkaller.appspotmail.com
> > >
> > > ------------[ cut here ]------------
> > > WARNING: CPU: 1 PID: 8643 at kernel/events/core.c:2781 __perf_install_in_context+0x1c0/0x47c kernel/events/core.c:2781
> > > Modules linked in:
> > > CPU: 1 PID: 8643 Comm: syz-executor.0 Not tainted 5.12.0-rc8-syzkaller-00011-g18a3c5f7abfd #0
> > > Hardware name: riscv-virtio,qemu (DT)
> >
> > How serious should I take this thing? ARM64 and x86_64 don't show these
> > errors.
>
> +riscv mainters for this question
> Is perf on riscv considered stable?

Another perf/riscv64 warning just come in:
https://syzkaller.appspot.com/bug?extid=30189c98403be62bc05a

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
