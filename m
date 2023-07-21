Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5DECEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 05:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QfQHMQDLvr3sXKapu8OCBYn8jBeJaR7uT8E0xXzauA4=; b=dxdE+hUowd7dgu
	QZaVfdgOnI0ws/P0rFYVQoeR+CiOvoGcsg2A7SBu8PNG+AixFCk07mwGb1y7OUlldFAO8gXG8puQx
	b0g2syuh43kfM6FCHfK1Z9VCVs1TcKV2NmbgqDj+unq/BZSYUjHUAbutFh1yQNkdsIbIhmkksEXUd
	GMrZdm5ADdp7ZHbkolUW66PKCOBtMCrrfLUL8fSx7uhNTX8etBo4WtDztfgAIwhUElJnJbUrzpErr
	sgeLYohqXss1hVaXPLn+dqRP5pcdA5rLCxA2yI/UZ8Os+uTFFz2yll/yJntQ7vG8ZyXMN54vqz4Ez
	o80F39kJAV61h74VfsGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMiYX-00CuRP-0U;
	Fri, 21 Jul 2023 05:19:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMiYU-00CuQI-04
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 05:19:55 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7366D610AA;
	Fri, 21 Jul 2023 05:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38013C433C7;
	Fri, 21 Jul 2023 05:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689916792;
	bh=/flRm74tN40I6k/E/mNHoRtd+eU+riBhWwIrjv26ryc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=HWGIWEL0slk21EA/zGK1q57hzbNVpjt8O814A7WNu11flK/BQV8Erks9IIJV/GeyU
	 yjPu43T8pEoewRJoA+2wTWEB36LHFJL4dA4AKddiuTNxDWjdGkogOwuJN0sHXHynwr
	 NeNLhS/pi56QrXQqv2V3qKTRSTtsLD48zFdYHR5fgd6c7L7HCCL7zNIK97totMI3je
	 c8zdYqhV4WrVuQQ3ciBspEvFfSbNyOZFJflyy9o/ACaBYv1BXQDQYQ6cgsLXKi5gX8
	 /bF9TsLDF2pNVb5bzcKwrxxnAdjtftFwCGNIKTbeSwyy/7QbWO5E67l5rJy9uJS0OY
	 IN6ff2Mm3NeTA==
Date: Fri, 21 Jul 2023 06:19:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
CC: linux-riscv@lists.infradead.org, kernel@esmil.dk
Subject: Re: Jh7110 DTS Patches
User-Agent: K-9 Mail for Android
In-Reply-To: <757fa8f2-4bab-07b3-13fd-aa983907bd77@starfivetech.com>
References: <20230720-product-cheese-9f0fe22cc485@spud> <757fa8f2-4bab-07b3-13fd-aa983907bd77@starfivetech.com>
Message-ID: <834C3974-9217-45B3-8761-9F050193B073@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_221954_113290_A159DF58 
X-CRM114-Status: GOOD (  10.49  )
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



On 21 July 2023 03:00:28 IST, Walker Chen <walker.chen@starfivetech.com> wrote:
>
>On 2023/7/21 1:51, Conor Dooley wrote:
>> Hey Walker,
>> 
>> I have picked up the patches that I can from the mailing list & they
>> should appear in tomorrow's iteration of linux-next. Could you get your
>> co-workers to resend whatever patches that depended on the syscons, PLLs
>> or STG etc clocks?
>> 
>> Some were still on patchwork, eg the TDM audio, that I could not apply &
>> will need to be rebased. In particular, it'd be nice to get the eMMC
>> patches resent, as what I could find on patchwork was quite old.
>> 
>> You can see what I have applied here:
>> https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-dt-for-next
>> 
>> Thanks,
>> Conor.
>
>Hi Conor,
>
>I have notified my co-workers that are responsible for these modules to resend dts patch ASAP.
>These patches are submitted together, there may be conflicts.

Conflicts shouldn't be a problem. Thanks.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
