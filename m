Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FD38606A32E
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2026 21:40:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=I5qRvVtQ;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dwrX051i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+KbKk8EEovRJZAz6oF1iICjcvQuW5Cytpfqor+IhDTg=; b=I5qRvVtQIeesJKc+2Tf+fwhg9d
	ZWYyOpKUO1KhICMPKYWq/c03FldDYR4XjEiVIqDVDTf5KWk81Acu1B9bFSkUtIPUvETQsjxUkxhgL
	vsj2X5oxucqNwpEbeZOuKzFRQTbpDKr6TTrXQY3tINtO5Dw6nXGRmOyugH1FNurNmhL80bf0+tgLL
	9M0YwJCYjmr8cFZfcNWxk1qrhvHxCtNzIUA2cLdswTn2yQEqjZTXdMbslkaTLyiuNm0FRT+D35Glm
	BzCnunFn2Q3VhbSAQMzUGK9GSJWhYC7SHitp60VCLYv7yBpvOwwCcYdtEXIQRTR/M41gnLJtH7zkh
	F+XNHP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuKY-0000000CchP-0nIQ;
	Fri, 30 Oct 2026 21:40:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMuKW-0000000Cch4-14l8
	for linux-riscv@lists.infradead.org;
	Fri, 30 Oct 2026 21:40:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9E139602CC;
	Fri, 30 Oct 2026 21:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AEBB1F000C1;
	Fri, 30 Oct 2026 21:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793396406;
	bh=NdQCtHgXHon/pkAvjlHuvOoNN5Yh+NVemupI+L597I4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=dwrX051ix7iadJ16BVoZCtQEJyj5FOkCQHRMcs+zpQO4EmgMu1mN7WVWQkIbatAId
	 YJoUwc1uIoU+1wBVYnIL74jmu8rDp0r1h62575E2Wi3pQaTx+Q3HEM3OqvhRfDqHYb
	 KDraTEqvvpNhjw7StqKfbpF7m4zTcCGYP9pfk9R3raa0sABh69tcX1WVpBrapnVU8e
	 x6VAyd31z29N6vIED0rJ1F8PiduPZCBPGk112M85+6md3Un5zwao60gdeHtOFv3vKf
	 U82R9VMHWC38dh+/Xd+2K/YCoBBUi5HuogGCTfkwbkyKGc7CXHN/JXt3rqaxZjpZAt
	 +s1FNhngcfyYA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4019E3800478;
	Fri, 30 Oct 2026 21:40:06 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH bpf v2] bpf: Fix jited line info off by the CFI preamble
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179339640506.1785640.8958890304775889953.git-patchwork-notify@kernel.org>
Date: Fri, 30 Oct 2026 21:40:05 +0000
References: <20261030-b4-arm64-bpf-linfo-cfi-v2-1-4eac83435d4b@linux.dev>
In-Reply-To: <20261030-b4-arm64-bpf-linfo-cfi-v2-1-4eac83435d4b@linux.dev>
To: Jose Fernandez (Anthropic) <jose.fernandez@linux.dev>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, jolsa@kernel.org, emil@etsalapatis.com,
 ihor.solodrai@linux.dev, iii@linux.ibm.com, hca@linux.ibm.com,
 gor@linux.ibm.com, agordeev@linux.ibm.com, borntraeger@linux.ibm.com,
 svens@linux.ibm.com, john.fastabend@gmail.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 peterz@infradead.org, puranjay@kernel.org, bjorn@kernel.org,
 mbland@motorola.com, will@kernel.org, samitolvanen@google.com,
 bpf@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 pulehui@huawei.com, sashiko-bot@kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello:

This patch was applied to bpf/bpf.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Fri, 30 Oct 2026 18:14:22 +0000 you wrote:
> With CONFIG_CFI=y, every jited line info entry after a function's
> first is cfi_get_offset() bytes too high on x86-64, riscv64 and arm64,
> so tools that use it show the wrong source line.
> 
> The JITs count the insn_to_jit_off[] offsets from the start of the
> image. Since the CFI commits below, prog->bpf_func starts
> cfi_get_offset() bytes into the image, and bpf_prog_fill_jited_linfo()
> adds the offsets to prog->bpf_func. s390 corrects its offsets before
> the call, the other three JITs do not.
> 
> [...]

Here is the summary with links:
  - [bpf,v2] bpf: Fix jited line info off by the CFI preamble
    https://git.kernel.org/bpf/bpf/c/3e4279dc5144

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
