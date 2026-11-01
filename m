Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6160A3816
	for <linux-riscv@archiver.kernel.org>; Sun,  1 Nov 2026 22:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=T/OpWmIS;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ge8BG+tp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PWONFnK7+tkdAMbdwVTnfdu18NsUXJX6jorcj2Wcorw=; b=T/OpWmISPIakncdKSYvNiqH2LZ
	Ku/t1B7iI/7uBY5H/QPjPpuiyFPob1ekf3tARkCS7Kyqga//KODRPZKaYJJlv1yb5DhiBPJHwF2og
	/ReEz3ZrENoQI6HAGCpqswktXjUJRwXx3hBCLj3Pqk4JSC1vv7nTXXQVv9cwqFxJoTaJcMhcY2Sbf
	MpgRq/VMLVUcfvn/pY+8SSlDjq+vpi/5xFgTTm5USVmwTqtgq2laGBBWe6xJnp9GKjyXIhUUZN0Wi
	stPUxijt0sfnnt5nTrxAw6KXLyMUSiTNe+Ms6DKt2OlDYsIx3ojds1Y8X53BlrKjipLzkDfL9MPgt
	tAxmURrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqy-0000000F0uT-3rzm;
	Sun, 01 Nov 2026 22:16:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNdqh-0000000F067-0xgG
	for linux-riscv@lists.infradead.org;
	Sun, 01 Nov 2026 22:16:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED3AF4404B;
	Sun,  1 Nov 2026 22:16:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C55C31F00919;
	Sun,  1 Nov 2026 22:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571382;
	bh=nBsBcIeqHzTwHRwp6mbkSbzQ3uarBYC6aAPPLwIw/OY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ge8BG+tpekAEo+TZQBgfvGTUGoOFRmuU0sqtbDWsBG1E1UTg6b6J4VfGfd1nqF6Z3
	 dxC7UhyiuirH66kwoe6ZI2qNpzGHPuX1TBFNPb8GqXg1qOAm0/ttZHT9HosQHtZslN
	 woMOtTaVXoa+A7tit4xlZnferQ0ALwKyjKubejIZumpnFlfQ57e5/xfu57Txo3PjF1
	 xErzRFsTYOfQQ6ie+PDBvSFDcBMJBHtcGvirHE49cePICxmiiKRheaTMIGUH9csnus
	 ZfNKmVre6h+JiizjeTSaE/VZJvWIINzapMcyCqc/+GWYS8ZWV2ONnMz3chGRKabrrj
	 6oAV13ouliW4g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA3C938003B8;
	Sun,  1 Nov 2026 22:16:22 +0000 (UTC)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: Re: [RESEND PATCH bpf-next 0/2] riscv,
 bpf: Support indirect calls to bpf subprogs (callx)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179357138129.2624073.3730426403768307422.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:16:21 +0000
References: <20260930064928.1909085-1-pulehui@huaweicloud.com>
In-Reply-To: <20260930064928.1909085-1-pulehui@huaweicloud.com>
To: Pu Lehui <pulehui@huaweicloud.com>
Cc: linux-riscv@lists.infradead.org, bjorn@kernel.org, bpf@vger.kernel.org,
 linux-kernel@vger.kernel.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, eddyz87@gmail.com, memxor@gmail.com, martin.lau@linux.dev,
 song@kernel.org, yonghong.song@linux.dev, jolsa@kernel.org,
 emil@etsalapatis.com, ihor.solodrai@linux.dev, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, alex@ghiti.fr, pulehui@huawei.com
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

This series was applied to riscv/linux.git (fixes)
by Alexei Starovoitov <ast@kernel.org>:

On Wed, 30 Sep 2026 06:49:26 +0000 you wrote:
> From: Pu Lehui <pulehui@huawei.com>
> 
> This series implements support for indirect calls to bpf subprogs on
> riscv64 and enables the corresponding selftests.
> 
> Meanwhile, this series also resolves the test_verifier failures
> previously captured by riscv-bpf-daily due to missing callx support [0].
> 
> [...]

Here is the summary with links:
  - [RESEND,bpf-next,1/2] riscv, bpf: Support indirect calls to bpf subprogs (callx)
    https://git.kernel.org/riscv/c/1cec0b70fdc6
  - [RESEND,bpf-next,2/2] selftests/bpf: Enable callx related testcases for RV64
    https://git.kernel.org/riscv/c/530dfafc6107

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
