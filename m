Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42EABCCD195
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Oct 2025 16:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6pJgAtyIn/D6OVJ9g4ns1rVdjfuAzep67raNAgM4oVQ=; b=JjuPBLWRBiMAnd
	9M0CwteE+ZIoy/QdEPwxKc+jhl7lz+1uXN4i1qfEgmy2wjOwEZCrSsLAMhNW0n7t0CJixMpJW0xvL
	ZDZnpw7jgLd/osZVh5YcrKLN4i36TH+vXD17NPDBHHhTawPsfvQQC/W4Qana6PfzPZCF8CvGkw0XB
	dqD6rVqofD0MqT6cYpLB54l4aFMdar+Plh+F5AcvAKiY5i5cZN6vBM06on3i0groga1AKWsfdFBJV
	y3T9r0+kW+haREfV8NYbkrzBTmMkEWOr9TksGpBGmN4c6Mpnxu+jg8dK/gJTUcWRk1iKbp7AVQEE0
	+WnCjsrqYTaw2RjFYcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NN-0000000A75N-3pY8;
	Sat, 18 Oct 2025 16:01:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vA9NK-0000000A74e-34cO
	for linux-riscv@lists.infradead.org;
	Sat, 18 Oct 2025 16:01:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 801E445AE5;
	Sat, 18 Oct 2025 16:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55B83C4CEF8;
	Sat, 18 Oct 2025 16:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760803305;
	bh=14MmDG9UhGu/qABnEIMl0mpUbYr7HbIkZDefzRziZBI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=bX+SerO+NfFijq7MNVOtPcAS9jsbQpe1GSMkow8wKPqFRZpfmofX+UiOd9v5R74lV
	 un6tQMSOLaWlE1SB35VpBD6AQXN2mQiRhXHKsPyuIJyY1IIN3O9Uzany18bO53l6WO
	 7WZf0deXTTZTAK1h+gGf3roxEDTv3Qn8C0s6cHRQY3dgH+kUTerWj7oSELXYwcgFJN
	 2T7zfbyR0ev8iLWDT6JOQT03ncWTSWFwwlgqmGPn589VJnKOW2YUSeC1Kqlj7WsD6a
	 qCt8PxVPp0gGRLulCkn6dlGLIRN//tBrR0KME6n1ses3xpW4B0/8lxe5DVQGHTmVQd
	 gpXXw39ZKvp/g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id AE24439EFBB7;
	Sat, 18 Oct 2025 16:01:29 +0000 (UTC)
MIME-Version: 1.0
Subject: Re: [PATCH] riscv: Register IPI IRQs with unique names
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: <176080328851.3028979.9102914786827075477.git-patchwork-notify@kernel.org>
Date: Sat, 18 Oct 2025 16:01:28 +0000
References: <20251016003244.3910332-1-samuel.holland@sifive.com>
In-Reply-To: <20251016003244.3910332-1-samuel.holland@sifive.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com, pjw@kernel.org,
 aou@eecs.berkeley.edu, alex@ghiti.fr, conor.dooley@microchip.com,
 jassisinghbrar@gmail.com, valentina.fernandezalanis@microchip.com,
 cuiyunhui@bytedance.com, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_090146_793292_6E32C3FF 
X-CRM114-Status: UNSURE (   8.00  )
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

This patch was applied to riscv/linux.git (fixes)
by Paul Walmsley <pjw@kernel.org>:

On Wed, 15 Oct 2025 17:32:05 -0700 you wrote:
> This allows different IPIs to be distinguished in tracing output.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/kernel/smp.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)

Here is the summary with links:
  - riscv: Register IPI IRQs with unique names
    https://git.kernel.org/riscv/c/223bfc4d403c

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
