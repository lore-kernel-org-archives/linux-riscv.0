Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08905C4451C
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jul 2026 19:07:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dCjRJhATea2h+EU743oAKxbYvVbJp2HfV2r22UUE/4s=; b=DSUOSLengj8yqK9Rv3k2YvOLgL
	6p4xMwPD/JnQJA+DyY38Y1laWlURz5ADZRjK0PdxQH/BvSLinJOWr6OGYn7ZOKBpyFjGxKGyIoDuA
	sVycgN8pCBx9Geul6DTZNh8UO/AZMjg4aOJwwZD+xBdfitgzqjHPiMzpAvv3x1tmGU4XCPamWnkn4
	QAAqxYdith/eT9bN0g2KE6lD0OCboQj5LhwiLsABTEudQjcuRUvUK3xtg+EoPoqICTo/JdDUBDkJv
	byA9l13WfrAX22x6x4WEBhSb8rEhDTesXGZZQZAfvrXEPe08PYwJo2RGY/pixI1BqExKbOA5m14/0
	BOc68knw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFoe-0000000AG0f-3hlF;
	Tue, 21 Jul 2026 19:07:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmFod-0000000AG0E-1Lrp
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jul 2026 19:07:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A36B7405FF;
	Tue, 21 Jul 2026 19:07:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1958D1F00A3A;
	Tue, 21 Jul 2026 19:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784660862;
	bh=BThJVpsPx9rlSedh6BZlmIHSLIxFXwN802rpP5uDBHM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=nquRc6IwDPapmyfojvVM8oavN1mOCCWnXXK2FeGAkqnRisiSH/0MoCU5FHc/pKJBa
	 zea26J59q0WCT6FJeJ4sTjIYUJXWjb5bExomJSgidAEsK5s8ERAVLJ9NVDDY5L8+UB
	 SfnWwwIedLpesDQMmELlZ1Z/b+qWOxoR+3jtmVco1BKcZKW3tT57nZ4yLvIgR9zOvn
	 lswcv2q6oIP5HDV491HuCFF1dh0z8sX2FwJy1XOiYrOU3XMhD1JkNsJOPnW+3UOzWm
	 KDFSC0MJPXvqV7EEEGRlKMkA7TL9pK6V1elC5KLYPEyDex77l2zhnFe2aFNChHY213
	 JTpAv0usZs9KQ==
Content-Type: multipart/mixed; boundary="===============8817995826463365865=="
MIME-Version: 1.0
Message-Id: <9ab9cca706e5ba59673b2d5c2e060ee88d90f403bea9873adfdb55664cb84deb@mail.kernel.org>
In-Reply-To: <20260715-riscv-bpf-timed-may-goto-v3-2-cf2a9c3d843f@kylinos.cn>
References: <20260715-riscv-bpf-timed-may-goto-v3-2-cf2a9c3d843f@kylinos.cn>
Subject: Re: [PATCH v3 2/2] selftests/bpf: enable timed may_goto tests for riscv64
From: bot+bpf-ci@kernel.org
To: jiangfeng@kylinos.cn,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,luke.r.nels@gmail.com,xi.wang@gmail.com,bjorn@kernel.org,pulehui@huawei.com,puranjay@kernel.org,pjw@kernel.org,palmer@dabbelt.com,aou@eecs.berkeley.edu,alex@ghiti.fr,shuah@kernel.org
Cc: bpf@vger.kernel.org,linux-riscv@lists.infradead.org,linux-kernel@vger.kernel.org,linux-kselftest@vger.kernel.org,jiangfeng@kylinos.cn,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 21 Jul 2026 19:07:42 +0000 (UTC)
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

--===============8817995826463365865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c b/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
> index fb4fa465d67c..c26727bef66f 100644
> --- a/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
> +++ b/tools/testing/selftests/bpf/progs/verifier_bpf_fastcall.c
> @@ -660,6 +660,7 @@ __naked void may_goto_interaction_x86_64(void)
>
>  SEC("raw_tp")
>  __arch_arm64
> +__arch_riscv64
>  __log_level(4) __msg("stack depth 24")
>  /* may_goto counter at -24 */
>  __xlated("0: *(u64 *)(r10 -24) =")

[ ... ]

>  __xlated("12: exit")
>  __success
>  __naked void may_goto_interaction_arm64(void)

Now that this test supports both arm64 and riscv64, should the function
name be changed to something more generic like may_goto_interaction()?
The arm64-specific name seems misleading when the test covers multiple
architectures.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29858413299
--===============8817995826463365865==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8817995826463365865==--

