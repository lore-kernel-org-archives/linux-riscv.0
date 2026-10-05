Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C43CA5FFC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Oct 2026 17:00:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IeF/bJoysBAfPPlKo5WyK5aqsleS/ivgayDMQkKOHsg=; b=WDKcg9DL3Vva34
	wN3tm4bPGyZgP4N1gI6iThrNJkgunkD8yeq90jeNsqjFzdkab55E791BF+mHNTrRFHgDJV1DPszEK
	0CPlgV/XFBgfVuiLSUs0INHgPDDisz76sS6z0cynsp/pBRJSdCivd0BvH0nShl2iRyH5yaLnOIDm2
	f32On5v0TNsqUhDwuukeyK6OGIxc7ZNmbRSlLl51ziqNtDv8Dj/Y2xj1fU3fdBP5Vbf20CjiCdytu
	ZH3WVvs4P6M6FXhmIiY/zRGf/x46Ob529rkvIBsmL/a1afzpKXXOqL2062UBwBSC/U/PZT42QlLf6
	iNTarhBLbtoxcnvMNf3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDm31-0000000Gse5-3OLG;
	Mon, 05 Oct 2026 17:00:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDm2x-0000000Gsdg-48Ou
	for linux-riscv@lists.infradead.org;
	Mon, 05 Oct 2026 17:00:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DE761436FD;
	Mon,  5 Oct 2026 17:00:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF96A1F000FF;
	Mon,  5 Oct 2026 17:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791219614;
	bh=oL863QUbr2KktNxa4NPcahhyRHUXYgpw83Q5ivTFq2o=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=ld8axjVZXiUSSE4/o9p/XlQcYQL+VbWMJYUTt6NjSI1Smh2KDFfVxuCQzUubGVUgp
	 XSRKDFcrEg8eySCKyoSMeJRq1kSE4BAEabbujrqli3Latd6ZyauM9hFu/C9dIIFVW2
	 ttJcrRhijJaL5PQp2lL8RHSnUUcyopV/KeSeGopIMsg/FnEWzYXDo2RS5+g1o6sdKE
	 5Tx181pfwLUX3Vczcc4vuiw8jnOA1YNA18ZllGxYXxCsFDhC6NJL2P8hyVwl8pIQnS
	 0PP4qEhbVzZWVmLEJBsZtcNNq+p4yXtkq96QEGdFwjs9by1TiLPahxMTfZ6R2wmWQq
	 lyS15sevi9GhQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B43CC39263B5;
	Mon,  5 Oct 2026 17:00:14 +0000 (UTC)
MIME-Version: 1.0
Subject: Re:
 =?utf-8?q?=5BPATCH_v4=5D_riscv=3A_lib=3A_Fix_ZBB_strnlen_wrap-aroun?=
	=?utf-8?q?d_regression_on=C2=A0huge_counts?=
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <179121961336.1813719.13062784666984813861.git-patchwork-notify@kernel.org>
Date: Mon, 05 Oct 2026 17:00:13 +0000
References: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
In-Reply-To: <20260915152656708z04s4oSYY2BGj34F36RZa@zte.com.cn>
To: <shao.mingyin@zte.com.cn>
Cc: linux-riscv@lists.infradead.org, pjw@kernel.org, mikey@neuling.org,
 jiangfeng@kylinos.cn, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr, linux-kernel@vger.kernel.org, zhang.yue5@zte.com.cn,
 david.laight.linux@gmail.com, qingfang.deng@linux.dev
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

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Tue, 15 Sep 2026 15:26:56 +0800 (CST) you wrote:
> From: Shao Mingyin <shao.mingyin@zte.com.cn>
> 
> The aligned scan boundary is derived from the last valid byte,
> (s + count - 1).  When count is huge (e.g. SIZE_MAX, which FORTIFY
> strcat/strlcat pass when the destination size is not known at compile
> time), s + count wraps around and the boundary lands before s, so the
> ZBB path returns a bogus length.  The original implementation
> (5ba15d419fab) had the same wrap-around in its (s + count) & ~7
> boundary computation; after 5d588c684833 the wrapped boundary is caught
> by the pre-loop guard "bgeu t0, t4, 2f", which then always exits for
> aligned strings of 8 or more characters and strnlen() returns 8
> instead of the real length.
> 
> [...]

Here is the summary with links:
  - [v4] riscv: lib: Fix ZBB strnlen wrap-around regression on huge counts
    https://git.kernel.org/riscv/c/d3b055d5d168

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
