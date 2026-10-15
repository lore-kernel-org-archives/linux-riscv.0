Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F148CC6B30
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 02:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uN5e7O7H0bN5Z41IcanbD+4Q7UO1hERZt5C0bfXZc+g=; b=N7UpqYHylDh9LJDjsEAhRElvK/
	JpASvjZnM1b0zQuRTYjQgoN08lOKsVY/TIQMWTHnbt6K4P0qpXsxc6VqWmCtD9Arx5L7kX1ZLXsUP
	uDjX/MSjxn/Vo2F5PqpyyFxQeFCVCNlKs9I4xT+Px/P3F4l0hOy35GM1QeF1dQr48/fe/hc0FidII
	jYMgxiv9Nl6RUJE8sv4f8ecKsJGUyIUc9BwD55xph5XTEjN8RVDWzrVutRTx2Ucehap8jg5vVVcOW
	1xkpfPoDA5H9DvyZdyxKnksqIp3FPzPoBTjZimlqdtIwLNyX3laHNVICnZ7Ht64OgVIjgn4NPdRQf
	8r5EHkGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBgQ-0000000GhoW-2fNY;
	Thu, 15 Oct 2026 02:59:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHBgO-0000000Gho0-3HqX
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 02:59:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D98816020C;
	Thu, 15 Oct 2026 02:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A38BF1F000C5;
	Thu, 15 Oct 2026 02:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792033143;
	bh=gfDjOBLmxrlrBy8q3VjBAy3QGHQDlpDU+Qz9C9H7BZI=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=CS3EaB/tIK1WQyuloanL69f8rx3TfAB+dijR+TAdHTMGW6GYcQMQWfvBqM2+pOR9t
	 OQClVC/NMH9TdUncLsifO8KJT+bdNWCrjWPVTOhXBRlvzF6BrGMRiZ9RL50V1Z0mb+
	 Rpv+FlzkshFfKdX0ZkLkEP6Eok8Um+axZENoVC9dXl+ZGrDJgAPlMi0nuo+6N30cHW
	 T2SK3VUBTShncU6DyaaEYAdWh7SiPPoSO1ZQyYChTTyLlx6+ZDy1DagGeHqOjjEaxN
	 szTZA42C5OZ6R5D00Tg8wPbY3AKkURFNOknlWjhwhS7hm/XV6cMZM1siPfjy+VMx0N
	 NwvCNx6cGCPTg==
Content-Type: multipart/mixed; boundary="===============8938492152272236540=="
MIME-Version: 1.0
Message-Id: <721cefcbf3b4af0f1201432225ebcf6fe25a35948a581b9da360a43b6a102810@mail.kernel.org>
In-Reply-To: <20261015021238.5657-4-cp0613@linux.alibaba.com>
References: <20261015021238.5657-4-cp0613@linux.alibaba.com>
Subject: Re: [PATCH bpf-next 3/3] selftests/bpf: Add a runtime test for private stack and stack arguments
From: bot+bpf-ci@kernel.org
To: cp0613@linux.alibaba.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,memxor@gmail.com,bjorn@kernel.org,puranjay@kernel.org
Cc: eddyz87@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,pulehui@huawei.com,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,luke.r.nels@gmail.com,xi.wang@gmail.com,shuah@kernel.org,rgbi3307@gmail.com,guoren@kernel.org,bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Thu, 15 Oct 2026 02:59:00 +0000 (UTC)
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
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8938492152272236540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> selftests/bpf: Add a runtime test for private stack and stack arguments

TL;DR: Test issue only: the new private stack selftest calls test__skip()
without printing a reason, so a SKIP doesn't show why. The review says this
may be acceptable, since other tests do the same.

> diff --git a/tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c b/tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
> new file mode 100644
> index 000000000000..3af24ca8009f
> --- /dev/null
> +++ b/tools/testing/selftests/bpf/prog_tests/private_stack_runtime.c
> @@ -0,0 +1,83 @@

[ ... ]

> +	if (!skel->rodata->has_stack_args) {
> +		test__skip();
> +		goto out;
> +	}

A subsystem pattern flags this as potentially concerning: a selftest that
skips without printing a reason.  Both skip paths call test__skip() bare,
this one when the compiler lacks __BPF_FEATURE_STACK_ARGUMENT
(has_stack_args is false), and the other in the non-riscv64 branch:

    #else
        test__skip();
    #endif

Without a message, the test shows up as SKIP with no hint whether clang
needs to be upgraded or the test is only built for riscv64.  Would a
printf() before test__skip(), like the "%s:SKIP: ..." message that
test_loader's run_subtest() prints, make the cause visible?

This may be acceptable as is: test_progs does report the test as SKIP, and
prog_tests/stack_arg.c and prog_tests/struct_ops_private_stack.c also call
test__skip() without a message.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/38671177164
--===============8938492152272236540==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8938492152272236540==--

