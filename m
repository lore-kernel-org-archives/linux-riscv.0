Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07DFCA5FFC
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Oct 2026 17:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nSB7qWqrolvG234OrF+Xeysh5Vjl+YDAPpBDVX7afNQ=; b=CBG3cDpQc/cy91
	GXGCKXn2nGCD27f8Z8JIwA/vELIR/Yv7/4nSvgvnKwYmUWoipUiYu79nKPIaQOkL4EbhVYPReSx5T
	2ZHmSQ9wqXzH8R3oViLBxwEBpqXOxtafzHiPzTY/lhrENCbzt9DyoiPe5sO/+BxhA/tSrU8ZixTRT
	GrBI4oUNi53lWl7GEelLZU0J1IttvhEP5Izx70XQF5GwMvKLh9eCbm7FGuwi4tfYWXC9HtGr5vFf+
	eG/WYWrQ/8gVSgqU4mN6LQtG1izOt9DyyaAGkYB5xhKXw/0ozvXewumRYqGs2QooeF5rMjOptzZkJ
	0G1PFSkBgG3TEwgi5LVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8fi-00000001BtE-13co;
	Tue, 06 Oct 2026 17:09:46 +0000
Received: from out-199.mta1.migadu.com ([2001:41d0:203:375::c7] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE8fc-00000001Brk-1wmZ
	for linux-riscv@lists.infradead.org;
	Tue, 06 Oct 2026 17:09:42 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ip3lsF1/RW6hopKSPjIofrNyzgxwJm4Yts77+HupLAQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791306578; v=1; x=1791911378;
 b=WSwn+b/ve3DQFsJeY6fX95XEV2BPixpBsT0uwVCPwkfTkm2TBcZLyDrj4KjdGnxKCSuk2tR8
 B+W9kHY20jUF9+iTBffqpJpzbNTXVUag1vT/hY3lbPMbkHYk8DbRLqhJgV8R6UnezcQwXggAdo8
 1CuETHch+HUj4uJyj3WxlcXQ=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id ff89a30a3c80fbc7;
	Tue, 06 Oct 2026 17:09:38 +0000
X-Mizu-Trace-ID: ff89a30a3c80fbc7
X-Migadu-Flow: FLOW_OUT
Message-ID: <501b9da8-bc0c-4c02-866d-f50b20b60289@linux.dev>
Date: Tue, 6 Oct 2026 10:09:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: Use /tmp for temporary file
 in d_path
From: Ihor Solodrai <ihor.solodrai@linux.dev>
To: Pu Lehui <pulehui@huaweicloud.com>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, bpf@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>, Puranjay Mohan
 <puranjay@kernel.org>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Pu Lehui <pulehui@huawei.com>
References: <20260929083924.1851840-1-pulehui@huaweicloud.com>
 <20260929083924.1851840-4-pulehui@huaweicloud.com>
 <DLRXY2AQRPYP.1YQ75SL3XHQHN@gmail.com>
 <52daee54-9127-445c-b924-64623ca2e125@huaweicloud.com>
 <b5f31057-e2e3-4c73-8edb-c8e70960a319@linux.dev>
Content-Language: en-US
In-Reply-To: <b5f31057-e2e3-4c73-8edb-c8e70960a319@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_100941_224277_99F4A805 
X-CRM114-Status: GOOD (  10.31  )
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

On 10/5/26 3:54 PM, Ihor Solodrai wrote:
> On 9/29/26 11:24 PM, Pu Lehui wrote:
>>
>> On 2026/9/30 0:29, Alexei Starovoitov wrote:
>>> On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
>>>> The failure occurs because the rootfs created by libbpf/ci [0] does not
>>>> mount /dev/shm, causing temporary file creation under /dev/shm to fail.
>>>>
>>>> Let's switch to using /tmp instead to fix this issue.
>>>
>>> This will break BPF CI.
>>> The test was using /tmp up to v4 and was moved to /dev/shm in v5,
>>> since /tmp is on 9p in BPF CI and 9p doesn't support fallocate. See
>>> https://lore.kernel.org/all/20251206141210.3148-1-electronlsr@gmail.com/
>>> vmtest's init mounts tmpfs at /dev/shm, /run and /mnt, but not at /tmp.
>>> So fallocate() will return EOPNOTSUPP and d_path/check_mem_access
>>> will fail on x86, arm64 and s390.
>>>
>>> Mount tmpfs at /dev/shm in mkrootfs_tweak.sh like you did for /tmp in [1]
>>> and drop this patch.
>>>
>>> pw-bot: cr
>>
>> Hi Alexei and Ihor,
>>
>> I have been make a pr for mount tmpfs at /dev/shm, pls take a look.
>>
>> https://github.com/libbpf/ci/pull/239
> 
> 
> Merged, thanks.

Pu Lehui,

I just realized that this change may not be enough.

If you want to make sure the selftests will run properly in BPF CI,
please try the vmtest tool (a qemu wrapper):
https://github.com/danobi/vmtest

You should be able to run riscv64 in emulation through it.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
