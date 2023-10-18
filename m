Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3A2CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 19:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MydTUSv1jIq/VgIHygWyC7wyhGr93UsiG5rFtL8AEuI=; b=vNZPfYWFCMZFKz
	uUozHuRpSNaY6vOVYTrZR8cakfygZiuPR8i9bsy2B62M3bQN+IpYXpZ6J7LK9XFyY4SWJP1NV16Lz
	SW+CFhvzNdl2mAOfr+Q7Nf+M/kI6baLs2p1SjPMP/6NLTJbWcUt6yAAaV2RK01veYHGe3Nmq8hmDM
	qBNKVmP8ON+/sz/bNg/txyrDB78uf6dWfCX98Nz8DYiZMA+l/ZpqGxp1cLzq/588W4w6Cr2IeASUs
	B+JQMViQMHPWvx5G7vC9TtD7wKJjf2cGMwyBlgCZFWEmKRQkPck9f33dNdAfGXdbO3kooMz98q3bm
	5wIeRnGiBPKLeXfwJRqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBzy-00FWzI-0T;
	Wed, 18 Oct 2023 19:14:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtBzv-00FWyh-19
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 19:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 73E86B8246E;
	Wed, 18 Oct 2023 19:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC0A3C433C8;
	Wed, 18 Oct 2023 19:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697656465;
	bh=ey2GKZ006LXRzxCMSwHSeWZL7CH0Hr9cB5YCPXl3VXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=asOOEPbQwFYIC8jx1HRf2cqsEethzzyQPVKXN3W7Fs1T7zrtzy1vIBcpocGamRzu1
	 RxN0eDW9jda1UiLATlMLCcr21mbPKdF1IbzyrzG7/W1p7SjrZZe2LNXD7jvwqPjFHC
	 OosfIgm1ZV0aBKmPDVvpdfm8TzsNS9T2Bg4GOK+tf2m/dYPaHxCVtk4bqCfCHdtSIf
	 EWbk3Ks6kURi49aZdxMIcFfrIbhbYyMzvJr81bRj/lLHGaapcB9Wx9pjfv2GoTiRAQ
	 TviMjk2x/vT9SPsjwsIYog0TCkXYtTX4JU6Vwm4BfyZdWxoBI93tg07SW0OkIsYfy0
	 d48MNiT/i6/TQ==
Message-ID: <a802bb07-b7d3-4c8b-b0ff-77da021e63fa@kernel.org>
Date: Wed, 18 Oct 2023 13:14:08 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 0/2] add loongarch and riscv support for kprobe
 args test
Content-Language: en-US
To: Yu Liao <liaoyu15@huawei.com>, skhan@linuxfoundation.org
Cc: liwei391@huawei.com, rostedt@goodmis.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-riscv@lists.infradead.org, mhiramat@kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231018020858.1304218-1-liaoyu15@huawei.com>
From: Shuah <shuah@kernel.org>
In-Reply-To: <20231018020858.1304218-1-liaoyu15@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_121427_552918_4D03E9EB 
X-CRM114-Status: UNSURE (   6.96  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/17/23 20:08, Yu Liao wrote:
> Yu Liao (2):
>    selftests/ftrace: add loongarch support for kprobe args char tests
>    selftests/ftrace: Add riscv support for kprobe arg tests
> 
>   .../selftests/ftrace/test.d/kprobe/kprobe_args_char.tc      | 6 ++++++
>   .../selftests/ftrace/test.d/kprobe/kprobe_args_string.tc    | 3 +++
>   .../selftests/ftrace/test.d/kprobe/kprobe_args_syntax.tc    | 4 ++++
>   3 files changed, 13 insertions(+)
> 

Applied these two patches to linux-kselftest next for Linux 6.7-rc1.

thanks,
-- Shuah

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
