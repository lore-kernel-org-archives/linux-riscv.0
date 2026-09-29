Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB648C9832A
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 06:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c0WiWfTyLENR3CmOQ/LcD+IbLRDamcCj11SssWnPro0=; b=u0cSM4Q7c7iorK
	Rd75ovFac8k6KWeG7tTkjqUSvdEitn66z/4/+NrFb8wFMwrfdxqhQrIguqpu/8jyR+dFkaMaDZof2
	JcT/aLiQ5Jy278q1GsFLZ03XmQCcanOuxCc0CZtgByq/4LpxqpP3NVJSU/GLF3S5jcqwTkOlpVJ2q
	Xoe5wu2bt74O07oc42TVcwjUoSw2Q9Q4pW+PZTl5EonumB8vpIbBn3XYsAaR6b5VLkn0MIe4xBaje
	NFgHm8Pfg0CinIZWNkgsVdC7I7NKHHJb36bQW2MkGBUFwEa6plPy0S4Xzfwngrg134YfGXSpxcGR1
	uOZCgC5CxI3Z3PH6NLLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRCa-00000002RFL-0tuD;
	Tue, 29 Sep 2026 06:20:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBRCY-00000002REz-1RmZ;
	Tue, 29 Sep 2026 06:20:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 97594602CA;
	Tue, 29 Sep 2026 06:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DE9C1F00893;
	Tue, 29 Sep 2026 06:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790662829;
	bh=lTp0iuvGgJlzLvCthN8H5DikguIjM02dg6D/PwjsUlQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=FEu8IKuJTM9UMyqWZRahuIUiQ6ZhkU4IDa2UZdQ+AHlfxY177GM88K5j47ZpxQMhi
	 9FiOENuKjoLTRooDK6SGMn2gMDlmCoehRnP5Cw/6TyFOVTgHclMnxY1UKAjDkiTEI6
	 K/Sd5XrAq9hpy03DSh95TZmK/hIC7jyt/XZ/GJsm1/KicRH8pbBdQeoXB2Cik/5FrY
	 LhMT7P074WF9asToy5KM2I1lRfV//rJ6lF3tB8DG7vCsCS3rFqo0lGgSOlqUmWzNHX
	 s6HPW0a40ZjDMKNQPLiD/ZEq0vCO79vhQpa0nH73XgM4QaTO4I76tb4UQji83RPvZR
	 pHebvU6K9zPcg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3A59239253E9;
	Tue, 29 Sep 2026 06:20:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf v5 0/3] bpf: Fix use-after-free of progs detached from
 busy trampolines
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179066282803.293113.8557815551946775052.git-patchwork-notify@kernel.org>
Date: Tue, 29 Sep 2026 06:20:28 +0000
References: <20260926135605.1217928-1-florent.revest@linux.dev>
In-Reply-To: <20260926135605.1217928-1-florent.revest@linux.dev>
To: Florent Revest <florent.revest@linux.dev>
Cc: bpf@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, martin.lau@linux.dev, eddyz87@gmail.com, memxor@gmail.com,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 kpsingh@kernel.org, john.fastabend@gmail.com, leon.hwang@linux.dev,
 zirajs7@gmail.com, rhkrqnwk98@gmail.com, puranjay@kernel.org,
 xukuohai@huaweicloud.com, iii@linux.ibm.com, hbathini@linux.ibm.com,
 chleroy@kernel.org, naveen@kernel.org, bjorn@kernel.org, pulehui@huawei.com,
 yangtiezhu@loongson.cn, hengqi.chen@gmail.com, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu, agordeev@linux.ibm.com, alex@ghiti.fr, bp@alien8.de,
 catalin.marinas@arm.com, borntraeger@linux.ibm.com,
 dave.hansen@linux.intel.com, emil@etsalapatis.com, hca@linux.ibm.com,
 hpa@zytor.com, chenhuacai@kernel.org, ihor.solodrai@linux.dev,
 mingo@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 loongarch@lists.linux.dev, maddy@linux.ibm.com, mark.rutland@arm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, palmer@dabbelt.com,
 paulmck@kernel.org, pjw@kernel.org, ritesh.list@gmail.com,
 sshegde@linux.ibm.com, shuah@kernel.org, svens@linux.ibm.com,
 tglx@kernel.org, gor@linux.ibm.com, kernel@xen0n.name, will@kernel.org,
 x86@kernel.org
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

This series was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Sat, 26 Sep 2026 13:55:57 +0000 you wrote:
> A task running in a trampoline image can call a prog that was detached
> and freed in the meantime, when it slept in a sleepable prog before
> reaching the detached one or was preempted right before calling it.
> Patch 1 handles the preempted case with an RCU tasks grace period,
> patch 2 handles the sleeping case by patching detached progs out of the
> images that still call them and patch 3 adds a selftest for the sleeping
> case.
> 
> [...]

Here is the summary with links:
  - [bpf,v5,1/3] bpf: Wait for an RCU tasks grace period before freeing trampoline progs
    https://git.kernel.org/bpf/bpf/c/0fb5751a6e41
  - [bpf,v5,2/3] bpf: Skip detached progs in trampoline images that are still in use
    https://git.kernel.org/bpf/bpf/c/17637e1a581a
  - [bpf,v5,3/3] selftests/bpf: Detach a trampoline prog while a task sleeps before it
    https://git.kernel.org/bpf/bpf/c/d5288c519bbd

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
