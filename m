Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AD9C98318
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Sep 2026 21:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tnk6SPKy8a2Pjy86BXsss568oKI4rPgnRd5VS9SZoDE=; b=HkkfGB+mCfaPY+
	S3x0epgErmKxzGqfFw+LIuqYIyvqPQuTp1nUM5GQVQ/rH1R1yIN/Gfy9gWJYyKnYY8DN3SM44g0bT
	pOvMWN5ZggDW06FmP6H29NqEXCc2rh6UWiD5Ed8czS6JRGRfy2V3b/xDhJ79QxMQLQC17gj5Wf548
	TioXc+yjL0rERIItLEQC5Zb0PwdePw1+gn/1Jia1vkzUkNEq8zDfN2WJD38lr/q7UaUIqDKvdFPLz
	64whUl2goMzTJUyBCFTQGY2OMIv6RIAoIOY25dL+fkcQyw/rjLjX9aZj+qortc/O6bTIRfwePeIk+
	ooH1tE3fSVFCVtk4eAcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rLb-0000000CFSv-3oLU;
	Thu, 24 Sep 2026 21:51:19 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9rLa-0000000CFSl-35g8
	for linux-riscv@lists.infradead.org;
	Thu, 24 Sep 2026 21:51:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE418601DE;
	Thu, 24 Sep 2026 21:51:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD0D1F000FF;
	Thu, 24 Sep 2026 21:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790286676;
	bh=+cPtGNovbKnNVgecFKbOU1WPKhVL+fqBGP0y91NqE1Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cLiY0kyUzsMXjMnvdYs050Yjw0BHqio6IaJqFp4miGQYhwQMRLBWfodpiyvhO1yjD
	 OVFGEDO+Np6fRgHghRy5fy+cUb7WzJRNnrKPkPG553ThzyhFu5gdsKwU/wzhomItcY
	 SzXip3fCdR4z8n9EDzhmrmE83mwkjzNCBZcxPQitlM9w0Dayz6++f5/oHLb5NplNVj
	 7L1IxzgPyBy/EipL1naLyYyirLdvc0jikpkqxr2I/x2Fn8FUTmJaYbkPP4C7ukRpdB
	 LdR56MxB4dyMukPVvxDczxcV5Sj9M4bqJqwvtGmdUpTtta6AO798tbOGQbMR+FEE5L
	 I2HmBawWc1W2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 56AD03A566EC;
	Thu, 24 Sep 2026 21:50:06 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH bpf-next] riscv,
 bpf: Adjust bpf_func to account for CFI offset in bpf_jit_free
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <179028660516.2215629.2749041219653206416.git-patchwork-notify@kernel.org>
Date: Thu, 24 Sep 2026 21:50:05 +0000
References: <20260923144216.934701-1-pulehui@huaweicloud.com>
In-Reply-To: <20260923144216.934701-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, bjorn@kernel.org, ast@kernel.org,
 daniel@iogearbox.net, andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com,
 martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
 jolsa@kernel.org, emil@etsalapatis.com, ihor.solodrai@linux.dev,
 puranjay@kernel.org, pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr,
 pulehui@huawei.com
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

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 23 Sep 2026 14:42:16 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> When CFI is enabled, the actual BPF program entry point is shifted
> forward by a CFI preamble. During bpf_jit_free(), this shifted pointer
> causes the wrong ro_header to be fetched, leading to a potential invalid
> memory free.
> 
> [...]

Here is the summary with links:
  - [bpf-next] riscv, bpf: Adjust bpf_func to account for CFI offset in bpf_jit_free
    https://git.kernel.org/bpf/bpf-next/c/93df8ae3267f

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
