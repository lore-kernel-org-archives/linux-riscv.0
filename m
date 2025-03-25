Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B84C36005
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IJOEmSZCYK4nLu1p93vvgMdMAJGG6e5FXFid1r2McLs=; b=ORNx0J/M11BYVx
	zH3FPQN2DCb1NAWAB/uqmkKmam42V9Y1GCL7JQ4/WeXBsaurw/HLfx+RE+JD6zTpAX1XHuu9E0Gw9
	rPEyWFOVX16E5A/Q6Bf2DIkUkxCwFjbaOqMzG1lLNjNI0le+qUpd26O1ZzcuIC/quJSLiDOgUtqjI
	HcpRXRNBpfj8Zngvh6pxFu+6jo0shkCEucBOiCko4LZgOlJ6GdDJwE0pU1tHvNchX++9yExJgIJ3J
	83W28a/rjXUMfVmIRpEfjMx/xWdYNWhhq9Xj6rT/CbuKPzFH/zvtbPno6jAa+cGAOWBGxspr7I/J2
	v76Zh3T1x6WUQf5x57iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3dP-00000005tjg-3qBJ;
	Tue, 25 Mar 2025 12:43:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx3Mv-00000005ooo-2T5C;
	Tue, 25 Mar 2025 12:26:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=aE07qw8p05gx4/fCiHPMGKqKe68aws1wlk+gibM6tmc=; b=GyTf87f2iMAv3cbqNQbNZoj4X4
	3ECSbOBKTbk42D/XUw6HFYgyzpi2H0XaF6DC0s0aIZZqXrnF9MC2TmEsxJIlvuWUq/eAZL1BrbfAF
	F3V2nACC78/k3KFzFJO/DfHHw1KmKSlIkJEyTxNEaI2LPi4Bd1fXq0IcOOxB9kYHOJskFMVxjpmJP
	dSl5PY+Wtr3orvfh7zP5W4wwNvXzhh3E7CJYNW5hTRReADEGCWY4ycf+mv14bIQDFivAV25NyMt9U
	fIkyfFHsj8Q1Y9Ep8d6aLCInRZobt44L7QM9RkwdX3VqHS12/d4Uvthrf9yRwSsjnTxCCu8e5KfX1
	3MipvKrA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tx3Mf-00000005Pla-0tQl;
	Tue, 25 Mar 2025 12:26:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id B98643004AF; Tue, 25 Mar 2025 13:26:40 +0100 (CET)
Date: Tue, 25 Mar 2025 13:26:40 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, gregkh@linuxfoundation.org,
	torvalds@linux-foundation.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
	oleg@redhat.com, kees@kernel.org, tglx@linutronix.de,
	will@kernel.org, mark.rutland@arm.com, brauner@kernel.org,
	akpm@linux-foundation.org, rostedt@goodmis.org, edumazet@google.com,
	unicorn_wang@outlook.com, inochiama@outlook.com, gaohan@iscas.ac.cn,
	shihua@iscas.ac.cn, jiawei@iscas.ac.cn, wuwei2016@iscas.ac.cn,
	drew@pdp7.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
	ctsai390@andestech.com, wefu@redhat.com, kuba@kernel.org,
	pabeni@redhat.com, josef@toxicpanda.com, dsterba@suse.com,
	mingo@redhat.com, boqun.feng@gmail.com, xiao.w.wang@intel.com,
	qingfang.deng@siflower.com.cn, leobras@redhat.com,
	jszhang@kernel.org, conor.dooley@microchip.com,
	samuel.holland@sifive.com, yongxuan.wang@sifive.com,
	luxu.kernel@bytedance.com, david@redhat.com, ruanjinjie@huawei.com,
	cuiyunhui@bytedance.com, wangkefeng.wang@huawei.com,
	qiaozhe@iscas.ac.cn, ardb@kernel.org, ast@kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org,
	linux-mm@kvack.org, linux-crypto@vger.kernel.org,
	bpf@vger.kernel.org, linux-input@vger.kernel.org,
	linux-perf-users@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org,
	maple-tree@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
	linux-btrfs@vger.kernel.org, netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org, linux-nfs@vger.kernel.org,
	linux-sctp@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [RFC PATCH V3 00/43] rv64ilp32_abi: Build CONFIG_64BIT
 kernel-self with ILP32 ABI
Message-ID: <20250325122640.GK36322@noisy.programming.kicks-ass.net>
References: <20250325121624.523258-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250325121624.523258-1-guoren@kernel.org>
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

On Tue, Mar 25, 2025 at 08:15:41AM -0400, guoren@kernel.org wrote:
> From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>
> 
> Since 2001, the CONFIG_64BIT kernel has been built with the LP64 ABI,
> but this patchset allows the CONFIG_64BIT kernel to use an ILP32 ABI

I'm thinking you're going to be finding a metric ton of assumptions
about 'unsigned long' being 64bit when 64BIT=y throughout the kernel.

I know of a couple of places where 64BIT will result in different math
such that a 32bit 'unsigned long' will trivially overflow.

Please, don't do this. This adds a significant maintenance burden on all
of us.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
