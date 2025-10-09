Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFCFCCD188
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 01:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bd2MKrQ42mK/Yx4n1w0yAXgrVPusSiy1wjYT/Br9dLw=; b=RGPN6fSjZGNSqj
	QPRn6BTpRxpIR8kumbE36psxrSYkzoDA4GNijUR1xlQEFgPjizcPcxmX8D62ivsCZsvO6N1V+PKuB
	Ig72BWuNREBsGCVw3JzuThIGgj/cZA3MDh5Rjkl+T4kcnHVHggFg8hTLCXU6KJkWJmxdAOh5i7Ozb
	NYD0IMtGZugjkN+mUbZl12N/33KnHLU8/sjJqKHAHhy8dOAaBpL72yfsbZ6EJnZtPurAaJgR4kuoy
	wFfxoMDU5jWkrncNVb6Od5JfiSoRNG7bakK/bqV4iUbCY+p/SRzwcrJetzM7EsISlEqBUHGbtDcSM
	6t05Bg4TJuaJJt1FcgLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7f-00000004uSO-0OrP;
	Thu, 09 Oct 2025 01:07:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6f7b-00000004uQx-2RDz
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 01:07:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 44E2C44BFD;
	Thu,  9 Oct 2025 01:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C192C4CEF5;
	Thu,  9 Oct 2025 01:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759972026;
	bh=Cu58U/6vwTP3AaZHhN1PkZiohTEnguFUy6GZ3S1rnzI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=B9qApm1x5XDZGOFdYS3j59zH6youFsA22ezfZq69+0s9BWrQc6xa6lytNspJ1UURj
	 s19bkbHos1e1Lkrjixk5yoEVTCm8z/Tr5hExsCqxpAPbGLQsJaCa+OJ6bCbYBVUi3V
	 z/+W6BCwbyAiSMIqrZGxrBbeBC+iqhovHvtL5Ka/RbXrgHMuPeEMA8YOh6XPYFDzX2
	 78pHRKfY0AGex7e28/L0RBvjgH/Psf+G0oLIvXy2hJmK7WUwQGibAUE86yOT5S3Yrd
	 Ul1Wgxyg8lvNW++hW+9fYBIfrxqFDMj3XP2kUuEwQggZN8P2Lva961Vz+U2fieUx9l
	 m8eBjsBk+rAgw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE0DD3A41017;
	Thu,  9 Oct 2025 01:06:55 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH v2 0/1] riscv: bpf: Fix uninitialized symbol 'retval_off'
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <175997201456.3661959.4723986638267153868.git-patchwork-notify@kernel.org>
Date: Thu, 09 Oct 2025 01:06:54 +0000
References: <20250922062244.822937-1-duanchenghao@kylinos.cn>
In-Reply-To: <20250922062244.822937-1-duanchenghao@kylinos.cn>
To: Chenghao Duan <duanchenghao@kylinos.cn>
Cc: linux-riscv@lists.infradead.org, ast@kernel.org, daniel@iogearbox.net,
 andrii@kernel.org, bjorn@kernel.org, pulehui@huawei.com, puranjay@kernel.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, alex@ghiti.fr,
 bpf@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_180707_641669_F970289F 
X-CRM114-Status: UNSURE (   7.69  )
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

This patch was applied to riscv/linux.git (for-next)
by Alexei Starovoitov <ast@kernel.org>:

On Mon, 22 Sep 2025 14:22:43 +0800 you wrote:
> v2:
> Adjust the commit log
> 
> URL for version v1:
> https://lore.kernel.org/all/20250820062520.846720-1-duanchenghao@kylinos.cn/
> 
> Chenghao Duan (1):
>   riscv: bpf: Fix uninitialized symbol 'retval_off'
> 
> [...]

Here is the summary with links:
  - [v2,1/1] riscv: bpf: Fix uninitialized symbol 'retval_off'
    https://git.kernel.org/riscv/c/d0bf7cd5df18

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
