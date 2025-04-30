Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4743C369D9
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Apr 2025 03:56:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WfT3of8ExzBih0/cKaY2W5wYGxNuZFlDn+EsZWdewAU=; b=vCRMBNJ0pGKQJj
	EGnp9wSomK5jutj72E5RbwwZrFKSYzwYo3xbJfEfitpFSVZWAmRCZCPEzQDuOGDzGwcZG+2XYbMcZ
	QPEjTvrYJ6aa4ql73howxJ4kk56W3Jbt8ZCneccH2c/RiLA1GtfM13WY/Gfz9Y9cpnBE8rd2PpXbO
	Pz7WjLN2RyQNTKOu6BmIsYry9vxh3xyPi2hOfhqhBi9CDmE4MlW6igFbctznfdPTEsMWrcMc58brQ
	wDpN6uvNnQIH5BS5m2JFKHCW5fGMqCTGSGnHLK2bpMUgKAvYSppXst/PsSEJz0uVCJwi57J4jP0q6
	GV8fWSPNDG7blWsNZ29w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yYm-0000000Bd7X-3xJW;
	Wed, 30 Apr 2025 03:56:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9yYl-0000000Bd7P-0tBx
	for linux-riscv@bombadil.infradead.org;
	Wed, 30 Apr 2025 03:56:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=rSzgAUb0HxNCATzVVG7F4HU2D5P38D6IVmrCoIgykYQ=; b=BbPwcjLt923P/ppAdqevGKFD1t
	z1QTcyToPgtzd0FXbwGk8QMWaS0508wAFIBevmfixuvWyYaPgnAe+6G1HjTAZZpf6HOEgy1N0Eyu6
	okpRtHAtag8NZcdKYquytO/T5HTS+lJFMAmfhng5/KbIgCGnlDZJTHxO2a53KLv3WsCYYHYPr/zkz
	Wi73Iuu2oacaGKLgbwE6JEJm3dqaMvGCC7/uxkozKNgDK04JVhu3+8mMS05C+msmMLeJa8OvdxWad
	cvjUbE2smb2H46yCJQzMjNcHfvJGr183lkepCcftvmJNQttPHhAds9+J69F9BuKC+Hn3cH/9x+C+W
	5xq0a06A==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9yYX-0000000Dfe9-1M7U
	for linux-riscv@lists.infradead.org;
	Wed, 30 Apr 2025 03:56:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4ZnNYY6kJ7z2Cdgx;
	Wed, 30 Apr 2025 11:52:33 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 4EEDE1A0188;
	Wed, 30 Apr 2025 11:56:06 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 30 Apr 2025 11:56:04 +0800
Message-ID: <e6805e47-befa-427f-a73f-2dba92adf059@huawei.com>
Date: Wed, 30 Apr 2025 11:56:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 0/8] bpf, riscv64: Support load-acquire and
 store-release instructions
Content-Language: en-US
To: Peilin Ye <yepeilin@google.com>, <bpf@vger.kernel.org>
CC: <linux-riscv@lists.infradead.org>, Andrea Parri <parri.andrea@gmail.com>,
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Puranjay Mohan
	<puranjay@kernel.org>, Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
	<daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
	<martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>, "Paul E.
 McKenney" <paulmck@kernel.org>, Song Liu <song@kernel.org>, Yonghong Song
	<yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, KP
 Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo
	<haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, Luke Nelson
	<luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Mykola Lysenko
	<mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, Josh Don
	<joshdon@google.com>, Barret Rhoden <brho@google.com>, Neel Natu
	<neelnatu@google.com>, Benjamin Segall <bsegall@google.com>
References: <cover.1745970908.git.yepeilin@google.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <cover.1745970908.git.yepeilin@google.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_045631_769461_9D4CE9F3 
X-CRM114-Status: GOOD (  11.69  )
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


On 2025/4/30 8:48, Peilin Ye wrote:
> Hi all!
> 
> Patchset [1] introduced BPF load-acquire (BPF_LOAD_ACQ) and
> store-release (BPF_STORE_REL) instructions, and added x86-64 and arm64
> JIT compiler support.  As a follow-up, this patchset supports
> load-acquire and store-release instructions for the riscv64 JIT
> compiler, and introduces some related selftests/ changes.
> 
> Specifically:
> 
>   * PATCH 1 makes insn_def_regno() handle load-acquires properly for
>     bpf_jit_needs_zext() (true for riscv64) architectures
>   * PATCH 2, 3 from Andrea Parri add the actual support to the riscv64
>     JIT compiler
>   * PATCH 4 optimizes code emission by skipping redundant zext
>     instructions inserted by the verifier
>   * PATCH 5, 6 and 7 are minor selftest/ improvements
>   * PATCH 8 enables (non-arena) load-acquire/store-release selftests for
>     riscv64
> 
> Please refer to individual patches for details.  Thanks!
> 
> [1] https://lore.kernel.org/all/cover.1741049567.git.yepeilin@google.com/
> 
> Andrea Parri (2):
>    bpf, riscv64: Introduce emit_load_*() and emit_store_*()
>    bpf, riscv64: Support load-acquire and store-release instructions
> 
> Peilin Ye (6):
>    bpf/verifier: Handle BPF_LOAD_ACQ instructions in insn_def_regno()
>    bpf, riscv64: Skip redundant zext instruction after load-acquire
>    selftests/bpf: Use CAN_USE_LOAD_ACQ_STORE_REL when appropriate
>    selftests/bpf: Avoid passing out-of-range values to __retval()
>    selftests/bpf: Verify zero-extension behavior in load-acquire tests
>    selftests/bpf: Enable non-arena load-acquire/store-release selftests
>      for riscv64
> 
>   arch/riscv/net/bpf_jit.h                      |  15 +
>   arch/riscv/net/bpf_jit_comp64.c               | 334 ++++++++++++------
>   arch/riscv/net/bpf_jit_core.c                 |   3 +-
>   kernel/bpf/verifier.c                         |  11 +-
>   tools/testing/selftests/bpf/progs/bpf_misc.h  |   5 +-
>   .../bpf/progs/verifier_load_acquire.c         |  48 ++-
>   .../selftests/bpf/progs/verifier_precision.c  |   5 +-
>   .../bpf/progs/verifier_store_release.c        |  39 +-
>   8 files changed, 314 insertions(+), 146 deletions(-)
> 

Hi Peilin, good to see the implementation of load-acquire and 
store-release instructions on RV64! But I'm about to start my vacation, 
so I'll test it once I'm back.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
