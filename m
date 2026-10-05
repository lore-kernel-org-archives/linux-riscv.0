Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A72D3CA5FF0
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 22:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0zk9bdHlTVvRrpty5ReC4iAfxFrbL0TtKidtgM0DP3M=; b=WBP+eOfWhERpQo
	DBsXoxKK3V+8YE0i9vfRfZB0bwRCUwzUMGRh1YX1KJjwA1qWIw8nhV08lTbHIT79d0PVOFyyAitX/
	97PE3p43GQV8AOOyIYBbrpE2Br2pO4wv/gs7Nl4uOiPlAK54XxBVnKBtbzYNcwey8U0Fcg5Ck+/Zw
	XxfRLwOu4tpRkwxvOihgteiKpohi6hzYS1lGioowMKdQItGx/pGuEFwDyyCO7v5zONqmkav6kf15k
	NbOLh+OyS7nhUt3JgXhHOsd2Fhlue2l0rdZ7tOTlSkugubW5E0BkAu4aBSz+n+qpJsCgHPhsTt0+S
	LLKySUwrbs6UJ/DmeOPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDraS-0000000HIqc-38fG;
	Mon, 05 Oct 2026 22:55:12 +0000
Received: from out-29.mta0.migadu.com ([2001:41d0:1004:224b::1d] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDraO-0000000HIp9-2T8W
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 22:55:10 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=x9dt0iOgJmfi9EX56kvB4OY6WAH94SdeT+VfzXw7UFQ=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1791240895; v=1; x=1791845695;
 b=sL5GOqr6E5IjFDxrMuQG9eO/+UJy1z5N80cEc4fSJ9CLk4/TiWb/z2db3v1PWczJ8BQhIWvJ
 bLc+sjOww/hwj3jiZFZiQAZzJtB9DUiKsY6GrOR+fLcYz1Nzm712baSNeMMxXk0rMhezch3x6sv
 VKM9mG0zCwpao5qFMTiBBiEg=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 88bd8c56e4024cfc;
	Mon, 05 Oct 2026 22:54:45 +0000
X-Mizu-Trace-ID: 88bd8c56e4024cfc
X-Migadu-Flow: FLOW_OUT
Message-ID: <b5f31057-e2e3-4c73-8edb-c8e70960a319@linux.dev>
Date: Mon, 5 Oct 2026 15:54:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next 3/5] selftests/bpf: Use /tmp for temporary file
 in d_path
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
Content-Language: en-US
From: Ihor Solodrai <ihor.solodrai@linux.dev>
In-Reply-To: <52daee54-9127-445c-b924-64623ca2e125@huaweicloud.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_155509_012952_DBC43EFA 
X-CRM114-Status: GOOD (  11.04  )
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

On 9/29/26 11:24 PM, Pu Lehui wrote:
> 
> On 2026/9/30 0:29, Alexei Starovoitov wrote:
>> On Tue, Sep 29, 2026 at 08:39 AM Pu Lehui <pulehui@huaweicloud.com> wrote:
>>> The failure occurs because the rootfs created by libbpf/ci [0] does not
>>> mount /dev/shm, causing temporary file creation under /dev/shm to fail.
>>>
>>> Let's switch to using /tmp instead to fix this issue.
>>
>> This will break BPF CI.
>> The test was using /tmp up to v4 and was moved to /dev/shm in v5,
>> since /tmp is on 9p in BPF CI and 9p doesn't support fallocate. See
>> https://lore.kernel.org/all/20251206141210.3148-1-electronlsr@gmail.com/
>> vmtest's init mounts tmpfs at /dev/shm, /run and /mnt, but not at /tmp.
>> So fallocate() will return EOPNOTSUPP and d_path/check_mem_access
>> will fail on x86, arm64 and s390.
>>
>> Mount tmpfs at /dev/shm in mkrootfs_tweak.sh like you did for /tmp in [1]
>> and drop this patch.
>>
>> pw-bot: cr
> 
> Hi Alexei and Ihor,
> 
> I have been make a pr for mount tmpfs at /dev/shm, pls take a look.
> 
> https://github.com/libbpf/ci/pull/239


Merged, thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
