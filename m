Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AD2CCE7D12
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iyJlkTelDPD+YV+A81+fz7pbrqwwne8BUZ4iOYU+ZxE=; b=suWNFf8camLE2W
	1216dGxdOem2aM5yuZIkZGqw6oYuvlU6xWcDny8j0qwm1grKI7MksRd/2rkXFwQedfjKVz5CQyPM+
	TFqu1Ybfioq8qX5xB/tWkhrks7drk79pHbaSK75rsINhzAlSymn6w0aNSxQevZEYH6Zt6HoASq3A6
	2WURLS2jog84a+DY2YDAWYAajox9eVKwfbucVfY60mUcFYVDTrwxL+kaCVnaTV9yN06Qh8eZBBmrT
	BV5HM0A9vkYLdbK4NuidxMOOC2IX0a3bhaRoX6Jq/E01GSxgN83bUTRrVRnZ2tpEt9rD1K4oAgvg1
	+moOVUG88+b4y4CJpQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbOB-00000002aGy-40sS;
	Tue, 01 Oct 2024 11:49:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb9r-00000002XIS-1Cj8
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:35:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F19595C070E;
	Tue,  1 Oct 2024 11:35:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E68C4CEC6;
	Tue,  1 Oct 2024 11:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782508;
	bh=XxT0Z8197vW9jVomIdstuRLWTbHpgdbOLOEsa5U84oM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=LR/V0gw/zbvmAaVRZuRxfUpHHUsGUr0bu+zTMgtD7L8Aank1Gt/Lna1RCXfOiAQkG
	 HpL4+gE5SQ0adRsrGKgxNibxg0bvI0AcdSo3NLrFpr4QPs3jFPXsj2WRBZAw3HTMmj
	 feRNhvZJGIlTwpKSOP8GTcTdmno1zGHneWjytc07B57oEmt0rl5eQ7gkvPjzAVGUTN
	 J5FlVPRsu0WRp4Q7KUThYuiun2yUzhIr4LAQass894PcohgZYX4o/FFR950ooFL3JD
	 XhivSZXmpOgTzLGkdIV/z0HQfhcS8PyWQfvgdjhvzRaRe+RrD18ffI4YFoiSYbP76w
	 8PHjLAViF4/hA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EB024380DBF7;
	Tue,  1 Oct 2024 11:35:12 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next v3 0/4] Fix accessing first syscall argument on RV64
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <172778251175.314421.4543571856155168797.git-patchwork-notify@kernel.org>
Date: Tue, 01 Oct 2024 11:35:11 +0000
References: <20240831041934.1629216-1-pulehui@huaweicloud.com>
In-Reply-To: <20240831041934.1629216-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bpf@vger.kernel.org,
 netdev@vger.kernel.org, andrii@kernel.org, bjorn@kernel.org,
 iii@linux.ibm.com, ast@kernel.org, daniel@iogearbox.net,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@google.com, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 palmer@dabbelt.com, pulehui@huawei.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043511_424136_74AA375F 
X-CRM114-Status: UNSURE (   7.44  )
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

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrii Nakryiko <andrii@kernel.org>:

On Sat, 31 Aug 2024 04:19:30 +0000 you wrote:
> On RV64, as Ilya mentioned before [0], the first syscall parameter should be
> accessed through orig_a0 (see arch/riscv64/include/asm/syscall.h),
> otherwise it will cause selftests like bpf_syscall_macro, vmlinux,
> test_lsm, etc. to fail on RV64.
> 
> Link: https://lore.kernel.org/bpf/20220209021745.2215452-1-iii@linux.ibm.com [0]
> 
> [...]

Here is the summary with links:
  - [bpf-next,v3,1/4] libbpf: Access first syscall argument with CO-RE direct read on s390
    https://git.kernel.org/riscv/c/e4db2a821b6c
  - [bpf-next,v3,2/4] libbpf: Access first syscall argument with CO-RE direct read on arm64
    https://git.kernel.org/riscv/c/9ab94078e868
  - [bpf-next,v3,3/4] selftests/bpf: Enable test_bpf_syscall_macro:syscall_arg1 on s390 and arm64
    https://git.kernel.org/riscv/c/4a4c4c0d0a42
  - [bpf-next,v3,4/4] libbpf: Fix accessing first syscall argument on RV64
    https://git.kernel.org/riscv/c/99857422338b

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
