Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAEFC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SLGgpueMlRZYZFsa3yVKCI6QUMcJbDd8MqhvPb76smQ=; b=47P7fZhW2FyqO8
	0jZiLFrwQb4DNDu6SrH7jw/dMiaewHQb/XhSxMUrp22ETJDNdiHRPm+ElKPHb43tPHO1kxVyRVRtq
	HOEcolUAyHKnK8EfODdngRKk8YTChLtPnAP2vn43Aj7Hi0ReTmrMHyNObV2RqO3WYgIdQxPr2xpkc
	ebSF9dHVBQ5BmrB2LAVzfk6kCf+kenxtxd+32lqqypwa8dzrPwGyIUiajxB8B5QuKwlqZh1nOEKBg
	X4dg0wUOgpsJxlUPeWapj0+bZRmpr1HFeW+TkfKrUgTm8yMfzpIBfvULNUmzs0Y4J37+kUUpPI3ZY
	vAu1FQoyqAyeAVYsLcXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryp2o-0000000CeY4-2yGk;
	Mon, 22 Apr 2024 08:28:58 +0000
Received: from zg8tmja2lje4os4yms4ymjma.icoremail.net ([206.189.21.223])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryp2l-0000000CeX3-1X1w;
	Mon, 22 Apr 2024 08:28:57 +0000
Received: from liangshenlin$eswincomputing.com ( [10.12.96.90] ) by
 ajax-webmail-app2 (Coremail) ; Mon, 22 Apr 2024 16:27:10 +0800 (GMT+08:00)
X-Originating-IP: [10.12.96.90]
Date: Mon, 22 Apr 2024 16:27:10 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Shenlin Liang" <liangshenlin@eswincomputing.com>
To: atishp@atishpatra.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, peterz@infradead.org, mingo@redhat.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, 
	irogers@google.com, adrian.hunter@intel.com, 
	linux-perf-users@vger.kernel.org, atishp@rivosinc.com
Subject: Re: [PATCH v2 0/2] perf kvm: Add kvm stat support on riscv
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT6.0.3 build 20220420(169d3f8c)
 Copyright (c) 2002-2024 www.mailtech.cn
 mispb-72143050-eaf5-4703-89e0-86624513b4ce-eswincomputing.com
In-Reply-To: <aceaaeba-61cb-44fa-8639-e30a86ef8cd8@rivosinc.com>
References: <20240415031131.23443-1-liangshenlin@eswincomputing.com>
 <aceaaeba-61cb-44fa-8639-e30a86ef8cd8@rivosinc.com>
MIME-Version: 1.0
Message-ID: <35896859.387e.18f04ea87b1.Coremail.liangshenlin@eswincomputing.com>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: TQJkCgAnOrxeHyZmbhAIAA--.5206W
X-CM-SenderInfo: xold0whvkh0z1lq6v25zlqu0xpsx3x1qjou0bp/1tbiAQEPDGYk3U
	gl0wACsg
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_012855_719957_54D5A19B 
X-CRM114-Status: GOOD (  15.71  )
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

Hi Atish,

I assume that you are cross building it on X86. You need to build a pkg-config-riscv64 first. Or get a deb file from [1] if you are buiding on Ubuntu.
Instead of cross building, it is recommended to build it natively.

BTW, please test with V3 which I sent today.

[1] https://answers.launchpad.net/~ci-train-ppa-service/+archive/ubuntu/3719-deletedppa/+build/16823862/+files/pkg-config-riscv64-linux-gnu_7.4.0-1ubuntu1.3_amd64.deb

Thanks.

Shenlin

> 
> On 4/14/24 20:11, Shenlin Liang wrote:
> > Changes from v1->v2:
> > - Rebased on Linux 6.9-rc3.
> > 
> > 'perf kvm stat report/record' generates a statistical analysis of KVM
> > events and can be used to analyze guest exit reasons. This patch tries
> > to add stat support on riscv.
> > 
> > Map the return value of trace_kvm_exit() to the specific cause of the
> > exception, and export it to userspace.
> > 
> > It records on two available KVM tracepoints for riscv: "kvm:kvm_entry"
> > and "kvm:kvm_exit", and reports statistical data which includes events
> > handles time, samples, and so on.
> > 
> > Simple tests go below:
> > 
> > # ./perf kvm record -e "kvm:kvm_entry" -e "kvm:kvm_exit"
> > Lowering default frequency rate from 4000 to 2500.
> > Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
> > [ perf record: Woken up 18 times to write data ]
> > [ perf record: Captured and wrote 5.433 MB perf.data.guest (62519 samples)
> > 
> 
> I want to test these patches but couldn't build a perf for RISC-V with 
> libtraceevent enabled. It fails with pkg-config dependencies when I 
> tried to build it (both via buildroot and directly from kernel source).
> 
> > # ./perf kvm report
> > 31K kvm:kvm_entry
> > 31K kvm:kvm_exit
> > 
> > # ./perf kvm stat record -a
> > [ perf record: Woken up 3 times to write data ]
> > [ perf record: Captured and wrote 8.502 MB perf.data.guest (99338 samples) ]
> > 
> > # ./perf kvm stat report --event=vmexit
> > Event name                Samples   Sample%    Time (ns)     Time%   Max Time (ns)   Min Time (ns)  Mean Time (ns)
> > STORE_GUEST_PAGE_FAULT     26968     54.00%    2003031800    40.00%     3361400         27600          74274
> > LOAD_GUEST_PAGE_FAULT      17645     35.00%    1153338100    23.00%     2513400         30800          65363
> > VIRTUAL_INST_FAULT         1247      2.00%     340820800     6.00%      1190800         43300          273312
> > INST_GUEST_PAGE_FAULT      1128      2.00%     340645800     6.00%      2123200         30200          301990
> > SUPERVISOR_SYSCALL         1019      2.00%     245989900     4.00%      1851500         29300          241403
> > LOAD_ACCESS                986       1.00%     671556200     13.00%     4180200         100700         681091
> > INST_ACCESS                655       1.00%     170054800     3.00%      1808300         54600          259625
> > HYPERVISOR_SYSCALL         21        0.00%     4276400       0.00%      716500          116000         203638
> > 
> > Shenlin Liang (2):
> >    RISCV: KVM: add tracepoints for entry and exit events
> >    perf kvm/riscv: Port perf kvm stat to RISC-V
> > 
> >   arch/riscv/kvm/trace.h                        | 67 ++++++++++++++++
> >   arch/riscv/kvm/vcpu.c                         |  7 ++
> >   tools/perf/arch/riscv/Makefile                |  1 +
> >   tools/perf/arch/riscv/util/Build              |  1 +
> >   tools/perf/arch/riscv/util/kvm-stat.c         | 78 +++++++++++++++++++
> >   .../arch/riscv/util/riscv_exception_types.h   | 41 ++++++++++
> >   6 files changed, 195 insertions(+)
> >   create mode 100644 arch/riscv/kvm/trace.h
> >   create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
> >   create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h
> > 
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
